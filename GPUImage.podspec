Pod::Spec.new do |s|
  s.name     = 'GPUImage'
  s.version  = '2.0.1'
  s.license  = 'BSD'
  s.summary  = 'An open source iOS framework for GPU-based image and video processing.'
  s.homepage = 'https://github.com/BradLarson/GPUImage2'
  s.author   = { 'Brad Larson' => 'contact@sunsetlakesoftware.com' }
  s.source   = { :git => 'https://github.com/BradLarson/GPUImage2.git', :tag => "#{s.version}" }

  s.subspec 'iOS' do |mobile|
    mobile.source_files = 'framework/Source/**/*.{h,swift}'
    mobile.resources = 'framework/Resources/*.png'
    mobile.requires_arc = true
    mobile.xcconfig = { 'CLANG_MODULES_AUTOLINK' => 'YES' }

    mobile.ios.deployment_target = '5.0'
    mobile.ios.exclude_files     = 'framework/Source/Mac',
                                   'framework/Source/Linux',
                                   'framework/Operations/Shaders/ConvertedShaders_GL.swift'
    mobile.ios.frameworks        = ['OpenGLES', 'CoreMedia', 'QuartzCore', 'AVFoundation']

    mobile.tvos.deployment_target = '10.0'
    mobile.tvos.exclude_files     = 'framework/Source/Mac',
                                    'framework/Source/Linux',
                                    'framework/Operations/Shaders/ConvertedShaders_GL.swift'

    mobile.tvos.frameworks        = ['OpenGLES', 'CoreMedia', 'QuartzCore', 'AVFoundation']

    mobile.xcconfig = { 'CLANG_MODULES_AUTOLINK' => 'YES', 'OTHER_SWIFT_FLAGS' => "-DGLES"}
  end

  s.subspec 'Mac' do |mac|
    mac.source_files = 'framework/Source/**/*.{swift}'
    mac.resources = 'framework/Resources/*.png'
    mac.requires_arc = true
    mac.xcconfig = { 'CLANG_MODULES_AUTOLINK' => 'YES' }

    mac.osx.deployment_target = '10.6'
    mac.osx.exclude_files = 'framework/Source/iOS',
                            'framework/Source/Linux',
                            'framework/Source/GPUImageFilterPipeline.*',
                            'framework/Source/GPUImageMovieComposition.*',
                            'framework/Source/GPUImageVideoCamera.*',
                            'framework/Source/GPUImageStillCamera.*',
                            'framework/Source/GPUImageUIElement.*',
                            'framework/Operations/Shaders/ConvertedShaders_GLES.swift'

    mac.osx.xcconfig = { 'GCC_WARN_ABOUT_RETURN_TYPE' => 'YES' }
  end
end
