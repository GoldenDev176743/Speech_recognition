function [ output_args ] = allfile( input_args )

listing=dir(path);
files={};
for i=1:length(listing)
 f=listing(i);
  if ~strcmp(f.name,'.') && ~strcmp(f.name,'..')
     if f.isdir
       files=[files;allfile(fullfile(path,f.name))];
     else
       files=[files;fullfile(path,f.name)];
     end
  end
end

end

