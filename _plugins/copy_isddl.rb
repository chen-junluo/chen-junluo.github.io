# Jekyll plugin to copy ISDDL static files after build
Jekyll::Hooks.register :site, :post_write do |site|
  isddl_source = File.join(site.source, 'isddl', 'out')
  isddl_dest = File.join(site.dest, 'isddl')

  if Dir.exist?(isddl_source)
    # Remove existing isddl directory in _site if it exists
    FileUtils.rm_rf(isddl_dest) if Dir.exist?(isddl_dest)

    # Copy isddl/out to _site/isddl
    FileUtils.cp_r(isddl_source, isddl_dest)

    puts "✓ Copied ISDDL to _site/isddl/"
  else
    puts "⚠ ISDDL source directory not found at #{isddl_source}"
  end
end
