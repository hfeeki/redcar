After do
  # Truncate the test file
  File.open(File.expand_path("../../fixtures/test.java", __FILE__), "w")

  #recreate the classpath file
  File.open(File.expand_path("../../fixtures/.redcar/classpath.groovy", __FILE__), "w") do |f|
    f.puts <<-CONFIG
    def redcar_config = new File(getClass().protectionDomain.codeSource.location.path).parentFile
    def project       = redcar_config.parentFile
    def classpath     = []

    //installed libraries
    def lib = new File(project.path + File.separator + "lib")
    lib.list().each {name -> classpath << lib.path+File.separator+name}

    //compiled classes
    def target_classes = new File(
    	project.path + File.separator +
    	"target"     + File.separator +
    	"classes"
    )
    classpath << target_classes.path

    return classpath.toArray()
    CONFIG
  end
end
