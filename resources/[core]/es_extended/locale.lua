Locales = {}

function Translate(str, ...) -- Translate string
	if not str then
        print(("[^1ERREUR^7] La ressource ^5%s^7 n'a pas spécifié de paramètre pour la fonction Traduire ou la valeur est nil !"):format(GetInvokingResource() or GetCurrentResourceName()))
        return 'Le paramètre de fonction de traduction donné est nil !'
	end 
	if Locales[Config.Locale] then
		if Locales[Config.Locale][str] then
            -- print(('[^2INFO^7] La ressource ^5%s^7 utilise la locale ^5%s^7'):format(GetInvokingResource() or GetCurrentResourceName(), Config.Locale))
			return string.format(Locales[Config.Locale][str], ...)
		elseif Config.Locale ~= 'en' and Locales['en'] and Locales['en'][str] then
            -- print(("[^3ATTENTION^7] La ressource ^5%s^7 utilise la locale ^5%s^7, mais la traduction pour ^5%s^7 n'existe pas !"):format(GetInvokingResource() or GetCurrentResourceName(), Config.Locale, str))
			return string.format(Locales['en'][str], ...)
		else
            -- print(("[^3ATTENTION^7] La ressource ^5%s^7 utilise la locale ^5%s^7, mais la traduction pour ^5%s^7 n'existe pas !"):format(GetInvokingResource() or GetCurrentResourceName(), Config.Locale, str))
			return 'Translation [' .. Config.Locale .. '][' .. str .. '] does not exist'
		end
	elseif Config.Locale ~= 'en' and Locales['en'] and Locales['en'][str] then
        -- print(("[^3ATTENTION^7] La ressource ^5%s^7 utilise la locale ^5%s^7, mais la traduction pour ^5%s^7 n'existe pas !"):format(GetInvokingResource() or GetCurrentResourceName(), Config.Locale, str))
		return string.format(Locales['en'][str], ...)
	else
        -- print(("[^3ATTENTION^7] La ressource ^5%s^7 utilise la locale ^5%s^7, mais la locale ^5%s^7 n'existe pas !"):format(GetInvokingResource() or GetCurrentResourceName(), Config.Locale))
		return 'Locale [' .. Config.Locale .. '] does not exist'
	end
end


function TranslateCap(str, ...) -- Translate string first char uppercase
	return _(str, ...):gsub("^%l", string.upper)
end

_ = Translate
_U = TranslateCap
