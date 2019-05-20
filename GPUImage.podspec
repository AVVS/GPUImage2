Pod::Spec.new do |s|
  s.name     = 'GPUImage'
  s.version  = '2.0.0'
  s.license  = 'BSD'
  s.summary  = 'An open source iOS framework for GPU-based image and video processing.'
  s.homepage = 'https://github.com/BradLarson/GPUImage2'
  s.author   = { 'Brad Larson' => 'contact@sunsetlakesoftware.com' }
  s.source   = { :git => 'https://github.com/BradLarson/GPUImage2.git', :tag => "#{s.version}" }

  s.source_files = 'framework/Source/**/*.{h,swift}'
  s.resources = 'framework/Resources/*.png'
  s.requires_arc = true
  s.xcconfig = { 'CLANG_MODULES_AUTOLINK' => 'YES' }

  spec.subspec 'iOS' do |mobile|
    mobile.ios.deployment_target = '5.0'
    mobile.ios.exclude_files     = 'framework/Source/Mac',
                                   'framework/Source/Linux'
    mobile.ios.frameworks        = ['OpenGLES', 'CoreMedia', 'QuartzCore', 'AVFoundation']

    mobile.tvos.deployment_target = '10.0'
    mobile.tvos.exclude_files     = 'framework/Source/Mac',
                                    'framework/Source/Linux'
    mobile.tvos.frameworks        = ['OpenGLES', 'CoreMedia', 'QuartzCore', 'AVFoundation']

    mobile.compiler_flags = '-DGLES'
  end

  spec.subspec 'Mac' do |mac|
    mac.osx.deployment_target = '10.6'
    mac.osx.exclude_files = 'framework/Source/iOS',
                            'framework/Source/Linux',
                            'framework/Source/GPUImageFilterPipeline.*',
                            'framework/Source/GPUImageMovieComposition.*',
                            'framework/Source/GPUImageVideoCamera.*',
                            'framework/Source/GPUImageStillCamera.*',
                            'framework/Source/GPUImageUIElement.*'
    mac.osx.xcconfig = { 'GCC_WARN_ABOUT_RETURN_TYPE' => 'YES' }
  end
end
