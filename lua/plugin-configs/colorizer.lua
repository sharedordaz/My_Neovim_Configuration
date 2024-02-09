
--[[	RGB      = true;         -- #RGB hex codes
	RRGGBB   = true;         -- #RRGGBB hex codes
	names    = false;         -- "Name" codes like Blue
	RRGGBBAA = false;        -- #RRGGBBAA hex codes
	rgb_fn   = false;        -- CSS rgb() and rgba() functions
	hsl_fn   = false;        -- CSS hsl() and hsla() functions
	css      = false;        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
	css_fn   = false;        -- Enable all CSS *functions*: rgb_fn, hsl_fn
	-- Available modes: foreground, background
	mode     = 'foreground'; -- Set the display mode.--]]


local css = {
        '*';
        '!vim';
         css = {   names = true;
                mode = 'background';};
    }

local vim = {
    'vim';
    'lua';
    {   names = true;
        mode = 'foreground'}
}


local general_config = {
    mode = 'background';
    names = false;
    RRGGBBAA = true;
    RGB = true;
    RRGGBB = true;
    vim;
}

return {
    css = css,
    general_config = general_config,
    vim = vim,
}



