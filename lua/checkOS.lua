    if vim.fn.has("win32") == 1 then
        vim.g.vimOS = "windows"
    elseif vim.fn.has("unix") == 1 then
        vim.g.vimOS = "unix"
    else
        vim.g.vimOS = "other"
    end
    print("Estás en " .. vim.g.vimOS)

