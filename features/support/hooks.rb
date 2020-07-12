# # Método Before para startar a home do website

Before do
    @page = lambda do |klass|
      klass.new
    end   
end

Before do |scenario|
    @page.call(Home).load
end



# Método After ou hooks geral para tirar screenshot personalizado com nome do cenário se passou ou falhou e adicionar ao relatório
# e direcionar se o teste falhou ou não

After do |scenario|
    scenario_name = scenario.name.gsub(/\s+/,'_').tr('/', '_')
    if scenario.failed?
        tirar_foto(scenario_name.downcase!, 'falhou')
    else 
        tirar_foto(scenario_name.downcase!, 'passou')
    end
end

# Método para gerar relatório mais personalizado com a gem Report Builder
at_exit do
    time = Time.now
    ReportBuilder.configure do |config|
    config.json_path = 'reports/report.json'
    config.report_path = 'reports/cucumber_web_report'
    config.color = 'blue'
    config.report_types = [:html]
    config.report_tabs = %w[Overview Features Scenarios Errors]
    config.report_title = 'Report Builder web automation test results'
    config.compress_images = false
    config.additional_info = { 'Project name' => 'Desafio Bionexo', 'Browser' => ENV["BROWSER"], 'Ambiente' => ENV["AMBIENTE"] , 'Report generated' => time }
    end
    ReportBuilder.build_report
end






