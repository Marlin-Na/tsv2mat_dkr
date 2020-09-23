
function tsv2mat(fname, outfile)
   % X = load_struct(fname)
   X=load_tsv(fname);
   save(outfile, 'X')
   disp(X)
end

