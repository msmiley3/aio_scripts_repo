-- name = "Country"
-- description = "Search country by code or name"
-- type = "search"
-- version = "1.0"
-- author = "Evgeny Zobnin (zobnin@gmail.com)"

--- Original code: https://dev.fandom.com/wiki/Global_Lua_Modules/Country

local url = require("url")

function on_search(str)
    if str == nil then return end

    if str:len() == 2 then
        result = getCountryData(str, "name")
    else
        result = getCountryCode(str, true)
    end

    if result ~= nil then
        search:show_buttons{ result }
    end
end

function on_click()
    system:open_browser("https://google.com/search?q="..url.quote(result))
end

function getCountryData(code, info)
	if info and code then
		-- if the code doesn't exist try looking for a country name
		if not countryData[code] then
			code = getCountryCode(code)
		end
		return (countryData[code] or {})[info]
	end
end

function getCountryCode(name, bCloseMatch)
	name = name:lower()

	for sCode, sData in pairs(countryData) do
		if sData.name:lower() == name or bCloseMatch and sData.name:match(name) then
			return sCode:lower()
		end
	end
end

countryData = {
  ad = {
    ["alpha-2"] = "AD",
    ["alpha-3"] = "AND",
    ["country-code"] = "020",
    ["iso_3166-2"] = "ISO 3166-2:AD",
    name = "Andorra",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Southern Europe",
    ["sub-region-code"] = "039"
  },
  ae = {
    ["alpha-2"] = "AE",
    ["alpha-3"] = "ARE",
    ["country-code"] = "784",
    ["iso_3166-2"] = "ISO 3166-2:AE",
    name = "United Arab Emirates",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Western Asia",
    ["sub-region-code"] = "145"
  },
  af = {
    ["alpha-2"] = "AF",
    ["alpha-3"] = "AFG",
    ["country-code"] = "004",
    ["iso_3166-2"] = "ISO 3166-2:AF",
    name = "Afghanistan",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Southern Asia",
    ["sub-region-code"] = "034"
  },
  ag = {
    ["alpha-2"] = "AG",
    ["alpha-3"] = "ATG",
    ["country-code"] = "028",
    ["iso_3166-2"] = "ISO 3166-2:AG",
    name = "Antigua and Barbuda",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Caribbean",
    ["sub-region-code"] = "029"
  },
  ai = {
    ["alpha-2"] = "AI",
    ["alpha-3"] = "AIA",
    ["country-code"] = "660",
    ["iso_3166-2"] = "ISO 3166-2:AI",
    name = "Anguilla",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Caribbean",
    ["sub-region-code"] = "029"
  },
  al = {
    ["alpha-2"] = "AL",
    ["alpha-3"] = "ALB",
    ["country-code"] = "008",
    ["iso_3166-2"] = "ISO 3166-2:AL",
    name = "Albania",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Southern Europe",
    ["sub-region-code"] = "039"
  },
  am = {
    ["alpha-2"] = "AM",
    ["alpha-3"] = "ARM",
    ["country-code"] = "051",
    ["iso_3166-2"] = "ISO 3166-2:AM",
    name = "Armenia",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Western Asia",
    ["sub-region-code"] = "145"
  },
  ao = {
    ["alpha-2"] = "AO",
    ["alpha-3"] = "AGO",
    ["country-code"] = "024",
    ["iso_3166-2"] = "ISO 3166-2:AO",
    name = "Angola",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Middle Africa",
    ["sub-region-code"] = "017"
  },
  aq = {
    ["alpha-2"] = "AQ",
    ["alpha-3"] = "ATA",
    ["country-code"] = "010",
    ["iso_3166-2"] = "ISO 3166-2:AQ",
    name = "Antarctica"
  },
  ar = {
    ["alpha-2"] = "AR",
    ["alpha-3"] = "ARG",
    ["country-code"] = "032",
    ["iso_3166-2"] = "ISO 3166-2:AR",
    name = "Argentina",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "South America",
    ["sub-region-code"] = "005"
  },
  as = {
    ["alpha-2"] = "AS",
    ["alpha-3"] = "ASM",
    ["country-code"] = "016",
    ["iso_3166-2"] = "ISO 3166-2:AS",
    name = "American Samoa",
    region = "Oceania",
    ["region-code"] = "009",
    ["sub-region"] = "Polynesia",
    ["sub-region-code"] = "061"
  },
  at = {
    ["alpha-2"] = "AT",
    ["alpha-3"] = "AUT",
    ["country-code"] = "040",
    ["iso_3166-2"] = "ISO 3166-2:AT",
    name = "Austria",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Western Europe",
    ["sub-region-code"] = "155"
  },
  au = {
    ["alpha-2"] = "AU",
    ["alpha-3"] = "AUS",
    ["country-code"] = "036",
    ["iso_3166-2"] = "ISO 3166-2:AU",
    name = "Australia",
    region = "Oceania",
    ["region-code"] = "009",
    ["sub-region"] = "Australia and New Zealand",
    ["sub-region-code"] = "053"
  },
  aw = {
    ["alpha-2"] = "AW",
    ["alpha-3"] = "ABW",
    ["country-code"] = "533",
    ["iso_3166-2"] = "ISO 3166-2:AW",
    name = "Aruba",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Caribbean",
    ["sub-region-code"] = "029"
  },
  ax = {
    ["alpha-2"] = "AX",
    ["alpha-3"] = "ALA",
    ["country-code"] = "248",
    ["iso_3166-2"] = "ISO 3166-2:AX",
    name = "Åland Islands",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Northern Europe",
    ["sub-region-code"] = "154"
  },
  az = {
    ["alpha-2"] = "AZ",
    ["alpha-3"] = "AZE",
    ["country-code"] = "031",
    ["iso_3166-2"] = "ISO 3166-2:AZ",
    name = "Azerbaijan",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Western Asia",
    ["sub-region-code"] = "145"
  },
  ba = {
    ["alpha-2"] = "BA",
    ["alpha-3"] = "BIH",
    ["country-code"] = "070",
    ["iso_3166-2"] = "ISO 3166-2:BA",
    name = "Bosnia and Herzegovina",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Southern Europe",
    ["sub-region-code"] = "039"
  },
  bb = {
    ["alpha-2"] = "BB",
    ["alpha-3"] = "BRB",
    ["country-code"] = "052",
    ["iso_3166-2"] = "ISO 3166-2:BB",
    name = "Barbados",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Caribbean",
    ["sub-region-code"] = "029"
  },
  bd = {
    ["alpha-2"] = "BD",
    ["alpha-3"] = "BGD",
    ["country-code"] = "050",
    ["iso_3166-2"] = "ISO 3166-2:BD",
    name = "Bangladesh",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Southern Asia",
    ["sub-region-code"] = "034"
  },
  be = {
    ["alpha-2"] = "BE",
    ["alpha-3"] = "BEL",
    ["country-code"] = "056",
    ["iso_3166-2"] = "ISO 3166-2:BE",
    name = "Belgium",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Western Europe",
    ["sub-region-code"] = "155"
  },
  bf = {
    ["alpha-2"] = "BF",
    ["alpha-3"] = "BFA",
    ["country-code"] = "854",
    ["iso_3166-2"] = "ISO 3166-2:BF",
    name = "Burkina Faso",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Western Africa",
    ["sub-region-code"] = "011"
  },
  bg = {
    ["alpha-2"] = "BG",
    ["alpha-3"] = "BGR",
    ["country-code"] = "100",
    ["iso_3166-2"] = "ISO 3166-2:BG",
    name = "Bulgaria",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Eastern Europe",
    ["sub-region-code"] = "151"
  },
  bh = {
    ["alpha-2"] = "BH",
    ["alpha-3"] = "BHR",
    ["country-code"] = "048",
    ["iso_3166-2"] = "ISO 3166-2:BH",
    name = "Bahrain",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Western Asia",
    ["sub-region-code"] = "145"
  },
  bi = {
    ["alpha-2"] = "BI",
    ["alpha-3"] = "BDI",
    ["country-code"] = "108",
    ["iso_3166-2"] = "ISO 3166-2:BI",
    name = "Burundi",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Eastern Africa",
    ["sub-region-code"] = "014"
  },
  bj = {
    ["alpha-2"] = "BJ",
    ["alpha-3"] = "BEN",
    ["country-code"] = "204",
    ["iso_3166-2"] = "ISO 3166-2:BJ",
    name = "Benin",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Western Africa",
    ["sub-region-code"] = "011"
  },
  bl = {
    ["alpha-2"] = "BL",
    ["alpha-3"] = "BLM",
    ["country-code"] = "652",
    ["iso_3166-2"] = "ISO 3166-2:BL",
    name = "Saint Barthélemy",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Caribbean",
    ["sub-region-code"] = "029"
  },
  bm = {
    ["alpha-2"] = "BM",
    ["alpha-3"] = "BMU",
    ["country-code"] = "060",
    ["iso_3166-2"] = "ISO 3166-2:BM",
    name = "Bermuda",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Northern America",
    ["sub-region-code"] = "021"
  },
  bn = {
    ["alpha-2"] = "BN",
    ["alpha-3"] = "BRN",
    ["country-code"] = "096",
    ["iso_3166-2"] = "ISO 3166-2:BN",
    name = "Brunei Darussalam",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "South-Eastern Asia",
    ["sub-region-code"] = "035"
  },
  bo = {
    ["alpha-2"] = "BO",
    ["alpha-3"] = "BOL",
    ["country-code"] = "068",
    ["iso_3166-2"] = "ISO 3166-2:BO",
    name = "Bolivia (Plurinational State of)",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "South America",
    ["sub-region-code"] = "005"
  },
  bq = {
    ["alpha-2"] = "BQ",
    ["alpha-3"] = "BES",
    ["country-code"] = "535",
    ["iso_3166-2"] = "ISO 3166-2:BQ",
    name = "Bonaire, Sint Eustatius and Saba",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Caribbean",
    ["sub-region-code"] = "029"
  },
  br = {
    ["alpha-2"] = "BR",
    ["alpha-3"] = "BRA",
    ["country-code"] = "076",
    ["iso_3166-2"] = "ISO 3166-2:BR",
    name = "Brazil",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "South America",
    ["sub-region-code"] = "005"
  },
  bs = {
    ["alpha-2"] = "BS",
    ["alpha-3"] = "BHS",
    ["country-code"] = "044",
    ["iso_3166-2"] = "ISO 3166-2:BS",
    name = "Bahamas",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Caribbean",
    ["sub-region-code"] = "029"
  },
  bt = {
    ["alpha-2"] = "BT",
    ["alpha-3"] = "BTN",
    ["country-code"] = "064",
    ["iso_3166-2"] = "ISO 3166-2:BT",
    name = "Bhutan",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Southern Asia",
    ["sub-region-code"] = "034"
  },
  bv = {
    ["alpha-2"] = "BV",
    ["alpha-3"] = "BVT",
    ["country-code"] = "074",
    ["iso_3166-2"] = "ISO 3166-2:BV",
    name = "Bouvet Island"
  },
  bw = {
    ["alpha-2"] = "BW",
    ["alpha-3"] = "BWA",
    ["country-code"] = "072",
    ["iso_3166-2"] = "ISO 3166-2:BW",
    name = "Botswana",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Southern Africa",
    ["sub-region-code"] = "018"
  },
  by = {
    ["alpha-2"] = "BY",
    ["alpha-3"] = "BLR",
    ["country-code"] = "112",
    ["iso_3166-2"] = "ISO 3166-2:BY",
    name = "Belarus",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Eastern Europe",
    ["sub-region-code"] = "151"
  },
  bz = {
    ["alpha-2"] = "BZ",
    ["alpha-3"] = "BLZ",
    ["country-code"] = "084",
    ["iso_3166-2"] = "ISO 3166-2:BZ",
    name = "Belize",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Central America",
    ["sub-region-code"] = "013"
  },
  ca = {
    ["alpha-2"] = "CA",
    ["alpha-3"] = "CAN",
    ["country-code"] = "124",
    ["iso_3166-2"] = "ISO 3166-2:CA",
    name = "Canada",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Northern America",
    ["sub-region-code"] = "021"
  },
  cc = {
    ["alpha-2"] = "CC",
    ["alpha-3"] = "CCK",
    ["country-code"] = "166",
    ["iso_3166-2"] = "ISO 3166-2:CC",
    name = "Cocos (Keeling) Islands"
  },
  cd = {
    ["alpha-2"] = "CD",
    ["alpha-3"] = "COD",
    ["country-code"] = "180",
    ["iso_3166-2"] = "ISO 3166-2:CD",
    name = "Congo (Democratic Republic of the)",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Middle Africa",
    ["sub-region-code"] = "017"
  },
  cf = {
    ["alpha-2"] = "CF",
    ["alpha-3"] = "CAF",
    ["country-code"] = "140",
    ["iso_3166-2"] = "ISO 3166-2:CF",
    name = "Central African Republic",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Middle Africa",
    ["sub-region-code"] = "017"
  },
  cg = {
    ["alpha-2"] = "CG",
    ["alpha-3"] = "COG",
    ["country-code"] = "178",
    ["iso_3166-2"] = "ISO 3166-2:CG",
    name = "Congo",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Middle Africa",
    ["sub-region-code"] = "017"
  },
  ch = {
    ["alpha-2"] = "CH",
    ["alpha-3"] = "CHE",
    ["country-code"] = "756",
    ["iso_3166-2"] = "ISO 3166-2:CH",
    name = "Switzerland",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Western Europe",
    ["sub-region-code"] = "155"
  },
  ci = {
    ["alpha-2"] = "CI",
    ["alpha-3"] = "CIV",
    ["country-code"] = "384",
    ["iso_3166-2"] = "ISO 3166-2:CI",
    name = "Côte d'Ivoire",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Western Africa",
    ["sub-region-code"] = "011"
  },
  ck = {
    ["alpha-2"] = "CK",
    ["alpha-3"] = "COK",
    ["country-code"] = "184",
    ["iso_3166-2"] = "ISO 3166-2:CK",
    name = "Cook Islands",
    region = "Oceania",
    ["region-code"] = "009",
    ["sub-region"] = "Polynesia",
    ["sub-region-code"] = "061"
  },
  cl = {
    ["alpha-2"] = "CL",
    ["alpha-3"] = "CHL",
    ["country-code"] = "152",
    ["iso_3166-2"] = "ISO 3166-2:CL",
    name = "Chile",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "South America",
    ["sub-region-code"] = "005"
  },
  cm = {
    ["alpha-2"] = "CM",
    ["alpha-3"] = "CMR",
    ["country-code"] = "120",
    ["iso_3166-2"] = "ISO 3166-2:CM",
    name = "Cameroon",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Middle Africa",
    ["sub-region-code"] = "017"
  },
  cn = {
    ["alpha-2"] = "CN",
    ["alpha-3"] = "CHN",
    ["country-code"] = "156",
    ["iso_3166-2"] = "ISO 3166-2:CN",
    name = "China",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Eastern Asia",
    ["sub-region-code"] = "030"
  },
  co = {
    ["alpha-2"] = "CO",
    ["alpha-3"] = "COL",
    ["country-code"] = "170",
    ["iso_3166-2"] = "ISO 3166-2:CO",
    name = "Colombia",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "South America",
    ["sub-region-code"] = "005"
  },
  cr = {
    ["alpha-2"] = "CR",
    ["alpha-3"] = "CRI",
    ["country-code"] = "188",
    ["iso_3166-2"] = "ISO 3166-2:CR",
    name = "Costa Rica",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Central America",
    ["sub-region-code"] = "013"
  },
  cu = {
    ["alpha-2"] = "CU",
    ["alpha-3"] = "CUB",
    ["country-code"] = "192",
    ["iso_3166-2"] = "ISO 3166-2:CU",
    name = "Cuba",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Caribbean",
    ["sub-region-code"] = "029"
  },
  cv = {
    ["alpha-2"] = "CV",
    ["alpha-3"] = "CPV",
    ["country-code"] = "132",
    ["iso_3166-2"] = "ISO 3166-2:CV",
    name = "Cabo Verde",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Western Africa",
    ["sub-region-code"] = "011"
  },
  cw = {
    ["alpha-2"] = "CW",
    ["alpha-3"] = "CUW",
    ["country-code"] = "531",
    ["iso_3166-2"] = "ISO 3166-2:CW",
    name = "Curaçao",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Caribbean",
    ["sub-region-code"] = "029"
  },
  cx = {
    ["alpha-2"] = "CX",
    ["alpha-3"] = "CXR",
    ["country-code"] = "162",
    ["iso_3166-2"] = "ISO 3166-2:CX",
    name = "Christmas Island"
  },
  cy = {
    ["alpha-2"] = "CY",
    ["alpha-3"] = "CYP",
    ["country-code"] = "196",
    ["iso_3166-2"] = "ISO 3166-2:CY",
    name = "Cyprus",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Western Asia",
    ["sub-region-code"] = "145"
  },
  cz = {
    ["alpha-2"] = "CZ",
    ["alpha-3"] = "CZE",
    ["country-code"] = "203",
    ["iso_3166-2"] = "ISO 3166-2:CZ",
    name = "Czech Republic",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Eastern Europe",
    ["sub-region-code"] = "151"
  },
  de = {
    ["alpha-2"] = "DE",
    ["alpha-3"] = "DEU",
    ["country-code"] = "276",
    ["iso_3166-2"] = "ISO 3166-2:DE",
    name = "Germany",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Western Europe",
    ["sub-region-code"] = "155"
  },
  dj = {
    ["alpha-2"] = "DJ",
    ["alpha-3"] = "DJI",
    ["country-code"] = "262",
    ["iso_3166-2"] = "ISO 3166-2:DJ",
    name = "Djibouti",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Eastern Africa",
    ["sub-region-code"] = "014"
  },
  dk = {
    ["alpha-2"] = "DK",
    ["alpha-3"] = "DNK",
    ["country-code"] = "208",
    ["iso_3166-2"] = "ISO 3166-2:DK",
    name = "Denmark",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Northern Europe",
    ["sub-region-code"] = "154"
  },
  dm = {
    ["alpha-2"] = "DM",
    ["alpha-3"] = "DMA",
    ["country-code"] = "212",
    ["iso_3166-2"] = "ISO 3166-2:DM",
    name = "Dominica",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Caribbean",
    ["sub-region-code"] = "029"
  },
  ["do"] = {
    ["alpha-2"] = "DO",
    ["alpha-3"] = "DOM",
    ["country-code"] = "214",
    ["iso_3166-2"] = "ISO 3166-2:DO",
    name = "Dominican Republic",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Caribbean",
    ["sub-region-code"] = "029"
  },
  dz = {
    ["alpha-2"] = "DZ",
    ["alpha-3"] = "DZA",
    ["country-code"] = "012",
    ["iso_3166-2"] = "ISO 3166-2:DZ",
    name = "Algeria",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Northern Africa",
    ["sub-region-code"] = "015"
  },
  ec = {
    ["alpha-2"] = "EC",
    ["alpha-3"] = "ECU",
    ["country-code"] = "218",
    ["iso_3166-2"] = "ISO 3166-2:EC",
    name = "Ecuador",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "South America",
    ["sub-region-code"] = "005"
  },
  ee = {
    ["alpha-2"] = "EE",
    ["alpha-3"] = "EST",
    ["country-code"] = "233",
    ["iso_3166-2"] = "ISO 3166-2:EE",
    name = "Estonia",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Northern Europe",
    ["sub-region-code"] = "154"
  },
  eg = {
    ["alpha-2"] = "EG",
    ["alpha-3"] = "EGY",
    ["country-code"] = "818",
    ["iso_3166-2"] = "ISO 3166-2:EG",
    name = "Egypt",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Northern Africa",
    ["sub-region-code"] = "015"
  },
  eh = {
    ["alpha-2"] = "EH",
    ["alpha-3"] = "ESH",
    ["country-code"] = "732",
    ["iso_3166-2"] = "ISO 3166-2:EH",
    name = "Western Sahara",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Northern Africa",
    ["sub-region-code"] = "015"
  },
  er = {
    ["alpha-2"] = "ER",
    ["alpha-3"] = "ERI",
    ["country-code"] = "232",
    ["iso_3166-2"] = "ISO 3166-2:ER",
    name = "Eritrea",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Eastern Africa",
    ["sub-region-code"] = "014"
  },
  es = {
    ["alpha-2"] = "ES",
    ["alpha-3"] = "ESP",
    ["country-code"] = "724",
    ["iso_3166-2"] = "ISO 3166-2:ES",
    name = "Spain",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Southern Europe",
    ["sub-region-code"] = "039"
  },
  et = {
    ["alpha-2"] = "ET",
    ["alpha-3"] = "ETH",
    ["country-code"] = "231",
    ["iso_3166-2"] = "ISO 3166-2:ET",
    name = "Ethiopia",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Eastern Africa",
    ["sub-region-code"] = "014"
  },
  fi = {
    ["alpha-2"] = "FI",
    ["alpha-3"] = "FIN",
    ["country-code"] = "246",
    ["iso_3166-2"] = "ISO 3166-2:FI",
    name = "Finland",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Northern Europe",
    ["sub-region-code"] = "154"
  },
  fj = {
    ["alpha-2"] = "FJ",
    ["alpha-3"] = "FJI",
    ["country-code"] = "242",
    ["iso_3166-2"] = "ISO 3166-2:FJ",
    name = "Fiji",
    region = "Oceania",
    ["region-code"] = "009",
    ["sub-region"] = "Melanesia",
    ["sub-region-code"] = "054"
  },
  fk = {
    ["alpha-2"] = "FK",
    ["alpha-3"] = "FLK",
    ["country-code"] = "238",
    ["iso_3166-2"] = "ISO 3166-2:FK",
    name = "Falkland Islands (Malvinas)",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "South America",
    ["sub-region-code"] = "005"
  },
  fm = {
    ["alpha-2"] = "FM",
    ["alpha-3"] = "FSM",
    ["country-code"] = "583",
    ["iso_3166-2"] = "ISO 3166-2:FM",
    name = "Micronesia (Federated States of)",
    region = "Oceania",
    ["region-code"] = "009",
    ["sub-region"] = "Micronesia",
    ["sub-region-code"] = "057"
  },
  fo = {
    ["alpha-2"] = "FO",
    ["alpha-3"] = "FRO",
    ["country-code"] = "234",
    ["iso_3166-2"] = "ISO 3166-2:FO",
    name = "Faroe Islands",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Northern Europe",
    ["sub-region-code"] = "154"
  },
  fr = {
    ["alpha-2"] = "FR",
    ["alpha-3"] = "FRA",
    ["country-code"] = "250",
    ["iso_3166-2"] = "ISO 3166-2:FR",
    name = "France",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Western Europe",
    ["sub-region-code"] = "155"
  },
  ga = {
    ["alpha-2"] = "GA",
    ["alpha-3"] = "GAB",
    ["country-code"] = "266",
    ["iso_3166-2"] = "ISO 3166-2:GA",
    name = "Gabon",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Middle Africa",
    ["sub-region-code"] = "017"
  },
  gb = {
    ["alpha-2"] = "GB",
    ["alpha-3"] = "GBR",
    ["country-code"] = "826",
    ["iso_3166-2"] = "ISO 3166-2:GB",
    name = "United Kingdom of Great Britain and Northern Ireland",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Northern Europe",
    ["sub-region-code"] = "154"
  },
  gd = {
    ["alpha-2"] = "GD",
    ["alpha-3"] = "GRD",
    ["country-code"] = "308",
    ["iso_3166-2"] = "ISO 3166-2:GD",
    name = "Grenada",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Caribbean",
    ["sub-region-code"] = "029"
  },
  ge = {
    ["alpha-2"] = "GE",
    ["alpha-3"] = "GEO",
    ["country-code"] = "268",
    ["iso_3166-2"] = "ISO 3166-2:GE",
    name = "Georgia",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Western Asia",
    ["sub-region-code"] = "145"
  },
  gf = {
    ["alpha-2"] = "GF",
    ["alpha-3"] = "GUF",
    ["country-code"] = "254",
    ["iso_3166-2"] = "ISO 3166-2:GF",
    name = "French Guiana",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "South America",
    ["sub-region-code"] = "005"
  },
  gg = {
    ["alpha-2"] = "GG",
    ["alpha-3"] = "GGY",
    ["country-code"] = "831",
    ["iso_3166-2"] = "ISO 3166-2:GG",
    name = "Guernsey",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Northern Europe",
    ["sub-region-code"] = "154"
  },
  gh = {
    ["alpha-2"] = "GH",
    ["alpha-3"] = "GHA",
    ["country-code"] = "288",
    ["iso_3166-2"] = "ISO 3166-2:GH",
    name = "Ghana",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Western Africa",
    ["sub-region-code"] = "011"
  },
  gi = {
    ["alpha-2"] = "GI",
    ["alpha-3"] = "GIB",
    ["country-code"] = "292",
    ["iso_3166-2"] = "ISO 3166-2:GI",
    name = "Gibraltar",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Southern Europe",
    ["sub-region-code"] = "039"
  },
  gl = {
    ["alpha-2"] = "GL",
    ["alpha-3"] = "GRL",
    ["country-code"] = "304",
    ["iso_3166-2"] = "ISO 3166-2:GL",
    name = "Greenland",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Northern America",
    ["sub-region-code"] = "021"
  },
  gm = {
    ["alpha-2"] = "GM",
    ["alpha-3"] = "GMB",
    ["country-code"] = "270",
    ["iso_3166-2"] = "ISO 3166-2:GM",
    name = "Gambia",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Western Africa",
    ["sub-region-code"] = "011"
  },
  gn = {
    ["alpha-2"] = "GN",
    ["alpha-3"] = "GIN",
    ["country-code"] = "324",
    ["iso_3166-2"] = "ISO 3166-2:GN",
    name = "Guinea",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Western Africa",
    ["sub-region-code"] = "011"
  },
  gp = {
    ["alpha-2"] = "GP",
    ["alpha-3"] = "GLP",
    ["country-code"] = "312",
    ["iso_3166-2"] = "ISO 3166-2:GP",
    name = "Guadeloupe",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Caribbean",
    ["sub-region-code"] = "029"
  },
  gq = {
    ["alpha-2"] = "GQ",
    ["alpha-3"] = "GNQ",
    ["country-code"] = "226",
    ["iso_3166-2"] = "ISO 3166-2:GQ",
    name = "Equatorial Guinea",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Middle Africa",
    ["sub-region-code"] = "017"
  },
  gr = {
    ["alpha-2"] = "GR",
    ["alpha-3"] = "GRC",
    ["country-code"] = "300",
    ["iso_3166-2"] = "ISO 3166-2:GR",
    name = "Greece",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Southern Europe",
    ["sub-region-code"] = "039"
  },
  gs = {
    ["alpha-2"] = "GS",
    ["alpha-3"] = "SGS",
    ["country-code"] = "239",
    ["iso_3166-2"] = "ISO 3166-2:GS",
    name = "South Georgia and the South Sandwich Islands"
  },
  gt = {
    ["alpha-2"] = "GT",
    ["alpha-3"] = "GTM",
    ["country-code"] = "320",
    ["iso_3166-2"] = "ISO 3166-2:GT",
    name = "Guatemala",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Central America",
    ["sub-region-code"] = "013"
  },
  gu = {
    ["alpha-2"] = "GU",
    ["alpha-3"] = "GUM",
    ["country-code"] = "316",
    ["iso_3166-2"] = "ISO 3166-2:GU",
    name = "Guam",
    region = "Oceania",
    ["region-code"] = "009",
    ["sub-region"] = "Micronesia",
    ["sub-region-code"] = "057"
  },
  gw = {
    ["alpha-2"] = "GW",
    ["alpha-3"] = "GNB",
    ["country-code"] = "624",
    ["iso_3166-2"] = "ISO 3166-2:GW",
    name = "Guinea-Bissau",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Western Africa",
    ["sub-region-code"] = "011"
  },
  gy = {
    ["alpha-2"] = "GY",
    ["alpha-3"] = "GUY",
    ["country-code"] = "328",
    ["iso_3166-2"] = "ISO 3166-2:GY",
    name = "Guyana",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "South America",
    ["sub-region-code"] = "005"
  },
  hk = {
    ["alpha-2"] = "HK",
    ["alpha-3"] = "HKG",
    ["country-code"] = "344",
    ["iso_3166-2"] = "ISO 3166-2:HK",
    name = "Hong Kong",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Eastern Asia",
    ["sub-region-code"] = "030"
  },
  hm = {
    ["alpha-2"] = "HM",
    ["alpha-3"] = "HMD",
    ["country-code"] = "334",
    ["iso_3166-2"] = "ISO 3166-2:HM",
    name = "Heard Island and McDonald Islands"
  },
  hn = {
    ["alpha-2"] = "HN",
    ["alpha-3"] = "HND",
    ["country-code"] = "340",
    ["iso_3166-2"] = "ISO 3166-2:HN",
    name = "Honduras",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Central America",
    ["sub-region-code"] = "013"
  },
  hr = {
    ["alpha-2"] = "HR",
    ["alpha-3"] = "HRV",
    ["country-code"] = "191",
    ["iso_3166-2"] = "ISO 3166-2:HR",
    name = "Croatia",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Southern Europe",
    ["sub-region-code"] = "039"
  },
  ht = {
    ["alpha-2"] = "HT",
    ["alpha-3"] = "HTI",
    ["country-code"] = "332",
    ["iso_3166-2"] = "ISO 3166-2:HT",
    name = "Haiti",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Caribbean",
    ["sub-region-code"] = "029"
  },
  hu = {
    ["alpha-2"] = "HU",
    ["alpha-3"] = "HUN",
    ["country-code"] = "348",
    ["iso_3166-2"] = "ISO 3166-2:HU",
    name = "Hungary",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Eastern Europe",
    ["sub-region-code"] = "151"
  },
  id = {
    ["alpha-2"] = "ID",
    ["alpha-3"] = "IDN",
    ["country-code"] = "360",
    ["iso_3166-2"] = "ISO 3166-2:ID",
    name = "Indonesia",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "South-Eastern Asia",
    ["sub-region-code"] = "035"
  },
  ie = {
    ["alpha-2"] = "IE",
    ["alpha-3"] = "IRL",
    ["country-code"] = "372",
    ["iso_3166-2"] = "ISO 3166-2:IE",
    name = "Ireland",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Northern Europe",
    ["sub-region-code"] = "154"
  },
  il = {
    ["alpha-2"] = "IL",
    ["alpha-3"] = "ISR",
    ["country-code"] = "376",
    ["iso_3166-2"] = "ISO 3166-2:IL",
    name = "Israel",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Western Asia",
    ["sub-region-code"] = "145"
  },
  im = {
    ["alpha-2"] = "IM",
    ["alpha-3"] = "IMN",
    ["country-code"] = "833",
    ["iso_3166-2"] = "ISO 3166-2:IM",
    name = "Isle of Man",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Northern Europe",
    ["sub-region-code"] = "154"
  },
  ["in"] = {
    ["alpha-2"] = "IN",
    ["alpha-3"] = "IND",
    ["country-code"] = "356",
    ["iso_3166-2"] = "ISO 3166-2:IN",
    name = "India",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Southern Asia",
    ["sub-region-code"] = "034"
  },
  io = {
    ["alpha-2"] = "IO",
    ["alpha-3"] = "IOT",
    ["country-code"] = "086",
    ["iso_3166-2"] = "ISO 3166-2:IO",
    name = "British Indian Ocean Territory"
  },
  iq = {
    ["alpha-2"] = "IQ",
    ["alpha-3"] = "IRQ",
    ["country-code"] = "368",
    ["iso_3166-2"] = "ISO 3166-2:IQ",
    name = "Iraq",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Western Asia",
    ["sub-region-code"] = "145"
  },
  ir = {
    ["alpha-2"] = "IR",
    ["alpha-3"] = "IRN",
    ["country-code"] = "364",
    ["iso_3166-2"] = "ISO 3166-2:IR",
    name = "Iran (Islamic Republic of)",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Southern Asia",
    ["sub-region-code"] = "034"
  },
  is = {
    ["alpha-2"] = "IS",
    ["alpha-3"] = "ISL",
    ["country-code"] = "352",
    ["iso_3166-2"] = "ISO 3166-2:IS",
    name = "Iceland",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Northern Europe",
    ["sub-region-code"] = "154"
  },
  it = {
    ["alpha-2"] = "IT",
    ["alpha-3"] = "ITA",
    ["country-code"] = "380",
    ["iso_3166-2"] = "ISO 3166-2:IT",
    name = "Italy",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Southern Europe",
    ["sub-region-code"] = "039"
  },
  je = {
    ["alpha-2"] = "JE",
    ["alpha-3"] = "JEY",
    ["country-code"] = "832",
    ["iso_3166-2"] = "ISO 3166-2:JE",
    name = "Jersey",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Northern Europe",
    ["sub-region-code"] = "154"
  },
  jm = {
    ["alpha-2"] = "JM",
    ["alpha-3"] = "JAM",
    ["country-code"] = "388",
    ["iso_3166-2"] = "ISO 3166-2:JM",
    name = "Jamaica",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Caribbean",
    ["sub-region-code"] = "029"
  },
  jo = {
    ["alpha-2"] = "JO",
    ["alpha-3"] = "JOR",
    ["country-code"] = "400",
    ["iso_3166-2"] = "ISO 3166-2:JO",
    name = "Jordan",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Western Asia",
    ["sub-region-code"] = "145"
  },
  jp = {
    ["alpha-2"] = "JP",
    ["alpha-3"] = "JPN",
    ["country-code"] = "392",
    ["iso_3166-2"] = "ISO 3166-2:JP",
    name = "Japan",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Eastern Asia",
    ["sub-region-code"] = "030"
  },
  ke = {
    ["alpha-2"] = "KE",
    ["alpha-3"] = "KEN",
    ["country-code"] = "404",
    ["iso_3166-2"] = "ISO 3166-2:KE",
    name = "Kenya",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Eastern Africa",
    ["sub-region-code"] = "014"
  },
  kg = {
    ["alpha-2"] = "KG",
    ["alpha-3"] = "KGZ",
    ["country-code"] = "417",
    ["iso_3166-2"] = "ISO 3166-2:KG",
    name = "Kyrgyzstan",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Central Asia",
    ["sub-region-code"] = "143"
  },
  kh = {
    ["alpha-2"] = "KH",
    ["alpha-3"] = "KHM",
    ["country-code"] = "116",
    ["iso_3166-2"] = "ISO 3166-2:KH",
    name = "Cambodia",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "South-Eastern Asia",
    ["sub-region-code"] = "035"
  },
  ki = {
    ["alpha-2"] = "KI",
    ["alpha-3"] = "KIR",
    ["country-code"] = "296",
    ["iso_3166-2"] = "ISO 3166-2:KI",
    name = "Kiribati",
    region = "Oceania",
    ["region-code"] = "009",
    ["sub-region"] = "Micronesia",
    ["sub-region-code"] = "057"
  },
  km = {
    ["alpha-2"] = "KM",
    ["alpha-3"] = "COM",
    ["country-code"] = "174",
    ["iso_3166-2"] = "ISO 3166-2:KM",
    name = "Comoros",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Eastern Africa",
    ["sub-region-code"] = "014"
  },
  kn = {
    ["alpha-2"] = "KN",
    ["alpha-3"] = "KNA",
    ["country-code"] = "659",
    ["iso_3166-2"] = "ISO 3166-2:KN",
    name = "Saint Kitts and Nevis",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Caribbean",
    ["sub-region-code"] = "029"
  },
  kp = {
    ["alpha-2"] = "KP",
    ["alpha-3"] = "PRK",
    ["country-code"] = "408",
    ["iso_3166-2"] = "ISO 3166-2:KP",
    name = "Korea (Democratic People's Republic of)",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Eastern Asia",
    ["sub-region-code"] = "030"
  },
  kr = {
    ["alpha-2"] = "KR",
    ["alpha-3"] = "KOR",
    ["country-code"] = "410",
    ["iso_3166-2"] = "ISO 3166-2:KR",
    name = "Korea (Republic of)",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Eastern Asia",
    ["sub-region-code"] = "030"
  },
  kw = {
    ["alpha-2"] = "KW",
    ["alpha-3"] = "KWT",
    ["country-code"] = "414",
    ["iso_3166-2"] = "ISO 3166-2:KW",
    name = "Kuwait",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Western Asia",
    ["sub-region-code"] = "145"
  },
  ky = {
    ["alpha-2"] = "KY",
    ["alpha-3"] = "CYM",
    ["country-code"] = "136",
    ["iso_3166-2"] = "ISO 3166-2:KY",
    name = "Cayman Islands",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Caribbean",
    ["sub-region-code"] = "029"
  },
  kz = {
    ["alpha-2"] = "KZ",
    ["alpha-3"] = "KAZ",
    ["country-code"] = "398",
    ["iso_3166-2"] = "ISO 3166-2:KZ",
    name = "Kazakhstan",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Central Asia",
    ["sub-region-code"] = "143"
  },
  la = {
    ["alpha-2"] = "LA",
    ["alpha-3"] = "LAO",
    ["country-code"] = "418",
    ["iso_3166-2"] = "ISO 3166-2:LA",
    name = "Lao People's Democratic Republic",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "South-Eastern Asia",
    ["sub-region-code"] = "035"
  },
  lb = {
    ["alpha-2"] = "LB",
    ["alpha-3"] = "LBN",
    ["country-code"] = "422",
    ["iso_3166-2"] = "ISO 3166-2:LB",
    name = "Lebanon",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Western Asia",
    ["sub-region-code"] = "145"
  },
  lc = {
    ["alpha-2"] = "LC",
    ["alpha-3"] = "LCA",
    ["country-code"] = "662",
    ["iso_3166-2"] = "ISO 3166-2:LC",
    name = "Saint Lucia",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Caribbean",
    ["sub-region-code"] = "029"
  },
  li = {
    ["alpha-2"] = "LI",
    ["alpha-3"] = "LIE",
    ["country-code"] = "438",
    ["iso_3166-2"] = "ISO 3166-2:LI",
    name = "Liechtenstein",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Western Europe",
    ["sub-region-code"] = "155"
  },
  lk = {
    ["alpha-2"] = "LK",
    ["alpha-3"] = "LKA",
    ["country-code"] = "144",
    ["iso_3166-2"] = "ISO 3166-2:LK",
    name = "Sri Lanka",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Southern Asia",
    ["sub-region-code"] = "034"
  },
  lr = {
    ["alpha-2"] = "LR",
    ["alpha-3"] = "LBR",
    ["country-code"] = "430",
    ["iso_3166-2"] = "ISO 3166-2:LR",
    name = "Liberia",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Western Africa",
    ["sub-region-code"] = "011"
  },
  ls = {
    ["alpha-2"] = "LS",
    ["alpha-3"] = "LSO",
    ["country-code"] = "426",
    ["iso_3166-2"] = "ISO 3166-2:LS",
    name = "Lesotho",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Southern Africa",
    ["sub-region-code"] = "018"
  },
  lt = {
    ["alpha-2"] = "LT",
    ["alpha-3"] = "LTU",
    ["country-code"] = "440",
    ["iso_3166-2"] = "ISO 3166-2:LT",
    name = "Lithuania",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Northern Europe",
    ["sub-region-code"] = "154"
  },
  lu = {
    ["alpha-2"] = "LU",
    ["alpha-3"] = "LUX",
    ["country-code"] = "442",
    ["iso_3166-2"] = "ISO 3166-2:LU",
    name = "Luxembourg",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Western Europe",
    ["sub-region-code"] = "155"
  },
  lv = {
    ["alpha-2"] = "LV",
    ["alpha-3"] = "LVA",
    ["country-code"] = "428",
    ["iso_3166-2"] = "ISO 3166-2:LV",
    name = "Latvia",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Northern Europe",
    ["sub-region-code"] = "154"
  },
  ly = {
    ["alpha-2"] = "LY",
    ["alpha-3"] = "LBY",
    ["country-code"] = "434",
    ["iso_3166-2"] = "ISO 3166-2:LY",
    name = "Libya",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Northern Africa",
    ["sub-region-code"] = "015"
  },
  ma = {
    ["alpha-2"] = "MA",
    ["alpha-3"] = "MAR",
    ["country-code"] = "504",
    ["iso_3166-2"] = "ISO 3166-2:MA",
    name = "Morocco",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Northern Africa",
    ["sub-region-code"] = "015"
  },
  mc = {
    ["alpha-2"] = "MC",
    ["alpha-3"] = "MCO",
    ["country-code"] = "492",
    ["iso_3166-2"] = "ISO 3166-2:MC",
    name = "Monaco",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Western Europe",
    ["sub-region-code"] = "155"
  },
  md = {
    ["alpha-2"] = "MD",
    ["alpha-3"] = "MDA",
    ["country-code"] = "498",
    ["iso_3166-2"] = "ISO 3166-2:MD",
    name = "Moldova (Republic of)",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Eastern Europe",
    ["sub-region-code"] = "151"
  },
  me = {
    ["alpha-2"] = "ME",
    ["alpha-3"] = "MNE",
    ["country-code"] = "499",
    ["iso_3166-2"] = "ISO 3166-2:ME",
    name = "Montenegro",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Southern Europe",
    ["sub-region-code"] = "039"
  },
  mf = {
    ["alpha-2"] = "MF",
    ["alpha-3"] = "MAF",
    ["country-code"] = "663",
    ["iso_3166-2"] = "ISO 3166-2:MF",
    name = "Saint Martin (French part)",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Caribbean",
    ["sub-region-code"] = "029"
  },
  mg = {
    ["alpha-2"] = "MG",
    ["alpha-3"] = "MDG",
    ["country-code"] = "450",
    ["iso_3166-2"] = "ISO 3166-2:MG",
    name = "Madagascar",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Eastern Africa",
    ["sub-region-code"] = "014"
  },
  mh = {
    ["alpha-2"] = "MH",
    ["alpha-3"] = "MHL",
    ["country-code"] = "584",
    ["iso_3166-2"] = "ISO 3166-2:MH",
    name = "Marshall Islands",
    region = "Oceania",
    ["region-code"] = "009",
    ["sub-region"] = "Micronesia",
    ["sub-region-code"] = "057"
  },
  mk = {
    ["alpha-2"] = "MK",
    ["alpha-3"] = "MKD",
    ["country-code"] = "807",
    ["iso_3166-2"] = "ISO 3166-2:MK",
    name = "Macedonia (the former Yugoslav Republic of)",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Southern Europe",
    ["sub-region-code"] = "039"
  },
  ml = {
    ["alpha-2"] = "ML",
    ["alpha-3"] = "MLI",
    ["country-code"] = "466",
    ["iso_3166-2"] = "ISO 3166-2:ML",
    name = "Mali",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Western Africa",
    ["sub-region-code"] = "011"
  },
  mm = {
    ["alpha-2"] = "MM",
    ["alpha-3"] = "MMR",
    ["country-code"] = "104",
    ["iso_3166-2"] = "ISO 3166-2:MM",
    name = "Myanmar",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "South-Eastern Asia",
    ["sub-region-code"] = "035"
  },
  mn = {
    ["alpha-2"] = "MN",
    ["alpha-3"] = "MNG",
    ["country-code"] = "496",
    ["iso_3166-2"] = "ISO 3166-2:MN",
    name = "Mongolia",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Eastern Asia",
    ["sub-region-code"] = "030"
  },
  mo = {
    ["alpha-2"] = "MO",
    ["alpha-3"] = "MAC",
    ["country-code"] = "446",
    ["iso_3166-2"] = "ISO 3166-2:MO",
    name = "Macao",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Eastern Asia",
    ["sub-region-code"] = "030"
  },
  mp = {
    ["alpha-2"] = "MP",
    ["alpha-3"] = "MNP",
    ["country-code"] = "580",
    ["iso_3166-2"] = "ISO 3166-2:MP",
    name = "Northern Mariana Islands",
    region = "Oceania",
    ["region-code"] = "009",
    ["sub-region"] = "Micronesia",
    ["sub-region-code"] = "057"
  },
  mq = {
    ["alpha-2"] = "MQ",
    ["alpha-3"] = "MTQ",
    ["country-code"] = "474",
    ["iso_3166-2"] = "ISO 3166-2:MQ",
    name = "Martinique",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Caribbean",
    ["sub-region-code"] = "029"
  },
  mr = {
    ["alpha-2"] = "MR",
    ["alpha-3"] = "MRT",
    ["country-code"] = "478",
    ["iso_3166-2"] = "ISO 3166-2:MR",
    name = "Mauritania",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Western Africa",
    ["sub-region-code"] = "011"
  },
  ms = {
    ["alpha-2"] = "MS",
    ["alpha-3"] = "MSR",
    ["country-code"] = "500",
    ["iso_3166-2"] = "ISO 3166-2:MS",
    name = "Montserrat",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Caribbean",
    ["sub-region-code"] = "029"
  },
  mt = {
    ["alpha-2"] = "MT",
    ["alpha-3"] = "MLT",
    ["country-code"] = "470",
    ["iso_3166-2"] = "ISO 3166-2:MT",
    name = "Malta",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Southern Europe",
    ["sub-region-code"] = "039"
  },
  mu = {
    ["alpha-2"] = "MU",
    ["alpha-3"] = "MUS",
    ["country-code"] = "480",
    ["iso_3166-2"] = "ISO 3166-2:MU",
    name = "Mauritius",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Eastern Africa",
    ["sub-region-code"] = "014"
  },
  mv = {
    ["alpha-2"] = "MV",
    ["alpha-3"] = "MDV",
    ["country-code"] = "462",
    ["iso_3166-2"] = "ISO 3166-2:MV",
    name = "Maldives",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Southern Asia",
    ["sub-region-code"] = "034"
  },
  mw = {
    ["alpha-2"] = "MW",
    ["alpha-3"] = "MWI",
    ["country-code"] = "454",
    ["iso_3166-2"] = "ISO 3166-2:MW",
    name = "Malawi",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Eastern Africa",
    ["sub-region-code"] = "014"
  },
  mx = {
    ["alpha-2"] = "MX",
    ["alpha-3"] = "MEX",
    ["country-code"] = "484",
    ["iso_3166-2"] = "ISO 3166-2:MX",
    name = "Mexico",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Central America",
    ["sub-region-code"] = "013"
  },
  my = {
    ["alpha-2"] = "MY",
    ["alpha-3"] = "MYS",
    ["country-code"] = "458",
    ["iso_3166-2"] = "ISO 3166-2:MY",
    name = "Malaysia",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "South-Eastern Asia",
    ["sub-region-code"] = "035"
  },
  mz = {
    ["alpha-2"] = "MZ",
    ["alpha-3"] = "MOZ",
    ["country-code"] = "508",
    ["iso_3166-2"] = "ISO 3166-2:MZ",
    name = "Mozambique",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Eastern Africa",
    ["sub-region-code"] = "014"
  },
  na = {
    ["alpha-2"] = "NA",
    ["alpha-3"] = "NAM",
    ["country-code"] = "516",
    ["iso_3166-2"] = "ISO 3166-2:NA",
    name = "Namibia",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Southern Africa",
    ["sub-region-code"] = "018"
  },
  nc = {
    ["alpha-2"] = "NC",
    ["alpha-3"] = "NCL",
    ["country-code"] = "540",
    ["iso_3166-2"] = "ISO 3166-2:NC",
    name = "New Caledonia",
    region = "Oceania",
    ["region-code"] = "009",
    ["sub-region"] = "Melanesia",
    ["sub-region-code"] = "054"
  },
  ne = {
    ["alpha-2"] = "NE",
    ["alpha-3"] = "NER",
    ["country-code"] = "562",
    ["iso_3166-2"] = "ISO 3166-2:NE",
    name = "Niger",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Western Africa",
    ["sub-region-code"] = "011"
  },
  nf = {
    ["alpha-2"] = "NF",
    ["alpha-3"] = "NFK",
    ["country-code"] = "574",
    ["iso_3166-2"] = "ISO 3166-2:NF",
    name = "Norfolk Island",
    region = "Oceania",
    ["region-code"] = "009",
    ["sub-region"] = "Australia and New Zealand",
    ["sub-region-code"] = "053"
  },
  ng = {
    ["alpha-2"] = "NG",
    ["alpha-3"] = "NGA",
    ["country-code"] = "566",
    ["iso_3166-2"] = "ISO 3166-2:NG",
    name = "Nigeria",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Western Africa",
    ["sub-region-code"] = "011"
  },
  ni = {
    ["alpha-2"] = "NI",
    ["alpha-3"] = "NIC",
    ["country-code"] = "558",
    ["iso_3166-2"] = "ISO 3166-2:NI",
    name = "Nicaragua",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Central America",
    ["sub-region-code"] = "013"
  },
  nl = {
    ["alpha-2"] = "NL",
    ["alpha-3"] = "NLD",
    ["country-code"] = "528",
    ["iso_3166-2"] = "ISO 3166-2:NL",
    name = "Netherlands",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Western Europe",
    ["sub-region-code"] = "155"
  },
  no = {
    ["alpha-2"] = "NO",
    ["alpha-3"] = "NOR",
    ["country-code"] = "578",
    ["iso_3166-2"] = "ISO 3166-2:NO",
    name = "Norway",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Northern Europe",
    ["sub-region-code"] = "154"
  },
  np = {
    ["alpha-2"] = "NP",
    ["alpha-3"] = "NPL",
    ["country-code"] = "524",
    ["iso_3166-2"] = "ISO 3166-2:NP",
    name = "Nepal",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Southern Asia",
    ["sub-region-code"] = "034"
  },
  nr = {
    ["alpha-2"] = "NR",
    ["alpha-3"] = "NRU",
    ["country-code"] = "520",
    ["iso_3166-2"] = "ISO 3166-2:NR",
    name = "Nauru",
    region = "Oceania",
    ["region-code"] = "009",
    ["sub-region"] = "Micronesia",
    ["sub-region-code"] = "057"
  },
  nu = {
    ["alpha-2"] = "NU",
    ["alpha-3"] = "NIU",
    ["country-code"] = "570",
    ["iso_3166-2"] = "ISO 3166-2:NU",
    name = "Niue",
    region = "Oceania",
    ["region-code"] = "009",
    ["sub-region"] = "Polynesia",
    ["sub-region-code"] = "061"
  },
  nz = {
    ["alpha-2"] = "NZ",
    ["alpha-3"] = "NZL",
    ["country-code"] = "554",
    ["iso_3166-2"] = "ISO 3166-2:NZ",
    name = "New Zealand",
    region = "Oceania",
    ["region-code"] = "009",
    ["sub-region"] = "Australia and New Zealand",
    ["sub-region-code"] = "053"
  },
  om = {
    ["alpha-2"] = "OM",
    ["alpha-3"] = "OMN",
    ["country-code"] = "512",
    ["iso_3166-2"] = "ISO 3166-2:OM",
    name = "Oman",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Western Asia",
    ["sub-region-code"] = "145"
  },
  pa = {
    ["alpha-2"] = "PA",
    ["alpha-3"] = "PAN",
    ["country-code"] = "591",
    ["iso_3166-2"] = "ISO 3166-2:PA",
    name = "Panama",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Central America",
    ["sub-region-code"] = "013"
  },
  pe = {
    ["alpha-2"] = "PE",
    ["alpha-3"] = "PER",
    ["country-code"] = "604",
    ["iso_3166-2"] = "ISO 3166-2:PE",
    name = "Peru",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "South America",
    ["sub-region-code"] = "005"
  },
  pf = {
    ["alpha-2"] = "PF",
    ["alpha-3"] = "PYF",
    ["country-code"] = "258",
    ["iso_3166-2"] = "ISO 3166-2:PF",
    name = "French Polynesia",
    region = "Oceania",
    ["region-code"] = "009",
    ["sub-region"] = "Polynesia",
    ["sub-region-code"] = "061"
  },
  pg = {
    ["alpha-2"] = "PG",
    ["alpha-3"] = "PNG",
    ["country-code"] = "598",
    ["iso_3166-2"] = "ISO 3166-2:PG",
    name = "Papua New Guinea",
    region = "Oceania",
    ["region-code"] = "009",
    ["sub-region"] = "Melanesia",
    ["sub-region-code"] = "054"
  },
  ph = {
    ["alpha-2"] = "PH",
    ["alpha-3"] = "PHL",
    ["country-code"] = "608",
    ["iso_3166-2"] = "ISO 3166-2:PH",
    name = "Philippines",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "South-Eastern Asia",
    ["sub-region-code"] = "035"
  },
  pk = {
    ["alpha-2"] = "PK",
    ["alpha-3"] = "PAK",
    ["country-code"] = "586",
    ["iso_3166-2"] = "ISO 3166-2:PK",
    name = "Pakistan",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Southern Asia",
    ["sub-region-code"] = "034"
  },
  pl = {
    ["alpha-2"] = "PL",
    ["alpha-3"] = "POL",
    ["country-code"] = "616",
    ["iso_3166-2"] = "ISO 3166-2:PL",
    name = "Poland",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Eastern Europe",
    ["sub-region-code"] = "151"
  },
  pm = {
    ["alpha-2"] = "PM",
    ["alpha-3"] = "SPM",
    ["country-code"] = "666",
    ["iso_3166-2"] = "ISO 3166-2:PM",
    name = "Saint Pierre and Miquelon",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Northern America",
    ["sub-region-code"] = "021"
  },
  pn = {
    ["alpha-2"] = "PN",
    ["alpha-3"] = "PCN",
    ["country-code"] = "612",
    ["iso_3166-2"] = "ISO 3166-2:PN",
    name = "Pitcairn",
    region = "Oceania",
    ["region-code"] = "009",
    ["sub-region"] = "Polynesia",
    ["sub-region-code"] = "061"
  },
  pr = {
    ["alpha-2"] = "PR",
    ["alpha-3"] = "PRI",
    ["country-code"] = "630",
    ["iso_3166-2"] = "ISO 3166-2:PR",
    name = "Puerto Rico",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Caribbean",
    ["sub-region-code"] = "029"
  },
  ps = {
    ["alpha-2"] = "PS",
    ["alpha-3"] = "PSE",
    ["country-code"] = "275",
    ["iso_3166-2"] = "ISO 3166-2:PS",
    name = "Palestine, State of",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Western Asia",
    ["sub-region-code"] = "145"
  },
  pt = {
    ["alpha-2"] = "PT",
    ["alpha-3"] = "PRT",
    ["country-code"] = "620",
    ["iso_3166-2"] = "ISO 3166-2:PT",
    name = "Portugal",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Southern Europe",
    ["sub-region-code"] = "039"
  },
  pw = {
    ["alpha-2"] = "PW",
    ["alpha-3"] = "PLW",
    ["country-code"] = "585",
    ["iso_3166-2"] = "ISO 3166-2:PW",
    name = "Palau",
    region = "Oceania",
    ["region-code"] = "009",
    ["sub-region"] = "Micronesia",
    ["sub-region-code"] = "057"
  },
  py = {
    ["alpha-2"] = "PY",
    ["alpha-3"] = "PRY",
    ["country-code"] = "600",
    ["iso_3166-2"] = "ISO 3166-2:PY",
    name = "Paraguay",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "South America",
    ["sub-region-code"] = "005"
  },
  qa = {
    ["alpha-2"] = "QA",
    ["alpha-3"] = "QAT",
    ["country-code"] = "634",
    ["iso_3166-2"] = "ISO 3166-2:QA",
    name = "Qatar",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Western Asia",
    ["sub-region-code"] = "145"
  },
  re = {
    ["alpha-2"] = "RE",
    ["alpha-3"] = "REU",
    ["country-code"] = "638",
    ["iso_3166-2"] = "ISO 3166-2:RE",
    name = "Réunion",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Eastern Africa",
    ["sub-region-code"] = "014"
  },
  ro = {
    ["alpha-2"] = "RO",
    ["alpha-3"] = "ROU",
    ["country-code"] = "642",
    ["iso_3166-2"] = "ISO 3166-2:RO",
    name = "Romania",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Eastern Europe",
    ["sub-region-code"] = "151"
  },
  rs = {
    ["alpha-2"] = "RS",
    ["alpha-3"] = "SRB",
    ["country-code"] = "688",
    ["iso_3166-2"] = "ISO 3166-2:RS",
    name = "Serbia",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Southern Europe",
    ["sub-region-code"] = "039"
  },
  ru = {
    ["alpha-2"] = "RU",
    ["alpha-3"] = "RUS",
    ["country-code"] = "643",
    ["iso_3166-2"] = "ISO 3166-2:RU",
    name = "Russian Federation",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Eastern Europe",
    ["sub-region-code"] = "151"
  },
  rw = {
    ["alpha-2"] = "RW",
    ["alpha-3"] = "RWA",
    ["country-code"] = "646",
    ["iso_3166-2"] = "ISO 3166-2:RW",
    name = "Rwanda",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Eastern Africa",
    ["sub-region-code"] = "014"
  },
  sa = {
    ["alpha-2"] = "SA",
    ["alpha-3"] = "SAU",
    ["country-code"] = "682",
    ["iso_3166-2"] = "ISO 3166-2:SA",
    name = "Saudi Arabia",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Western Asia",
    ["sub-region-code"] = "145"
  },
  sb = {
    ["alpha-2"] = "SB",
    ["alpha-3"] = "SLB",
    ["country-code"] = "090",
    ["iso_3166-2"] = "ISO 3166-2:SB",
    name = "Solomon Islands",
    region = "Oceania",
    ["region-code"] = "009",
    ["sub-region"] = "Melanesia",
    ["sub-region-code"] = "054"
  },
  sc = {
    ["alpha-2"] = "SC",
    ["alpha-3"] = "SYC",
    ["country-code"] = "690",
    ["iso_3166-2"] = "ISO 3166-2:SC",
    name = "Seychelles",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Eastern Africa",
    ["sub-region-code"] = "014"
  },
  sd = {
    ["alpha-2"] = "SD",
    ["alpha-3"] = "SDN",
    ["country-code"] = "729",
    ["iso_3166-2"] = "ISO 3166-2:SD",
    name = "Sudan",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Northern Africa",
    ["sub-region-code"] = "015"
  },
  se = {
    ["alpha-2"] = "SE",
    ["alpha-3"] = "SWE",
    ["country-code"] = "752",
    ["iso_3166-2"] = "ISO 3166-2:SE",
    name = "Sweden",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Northern Europe",
    ["sub-region-code"] = "154"
  },
  sg = {
    ["alpha-2"] = "SG",
    ["alpha-3"] = "SGP",
    ["country-code"] = "702",
    ["iso_3166-2"] = "ISO 3166-2:SG",
    name = "Singapore",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "South-Eastern Asia",
    ["sub-region-code"] = "035"
  },
  sh = {
    ["alpha-2"] = "SH",
    ["alpha-3"] = "SHN",
    ["country-code"] = "654",
    ["iso_3166-2"] = "ISO 3166-2:SH",
    name = "Saint Helena, Ascension and Tristan da Cunha",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Western Africa",
    ["sub-region-code"] = "011"
  },
  si = {
    ["alpha-2"] = "SI",
    ["alpha-3"] = "SVN",
    ["country-code"] = "705",
    ["iso_3166-2"] = "ISO 3166-2:SI",
    name = "Slovenia",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Southern Europe",
    ["sub-region-code"] = "039"
  },
  sj = {
    ["alpha-2"] = "SJ",
    ["alpha-3"] = "SJM",
    ["country-code"] = "744",
    ["iso_3166-2"] = "ISO 3166-2:SJ",
    name = "Svalbard and Jan Mayen",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Northern Europe",
    ["sub-region-code"] = "154"
  },
  sk = {
    ["alpha-2"] = "SK",
    ["alpha-3"] = "SVK",
    ["country-code"] = "703",
    ["iso_3166-2"] = "ISO 3166-2:SK",
    name = "Slovakia",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Eastern Europe",
    ["sub-region-code"] = "151"
  },
  sl = {
    ["alpha-2"] = "SL",
    ["alpha-3"] = "SLE",
    ["country-code"] = "694",
    ["iso_3166-2"] = "ISO 3166-2:SL",
    name = "Sierra Leone",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Western Africa",
    ["sub-region-code"] = "011"
  },
  sm = {
    ["alpha-2"] = "SM",
    ["alpha-3"] = "SMR",
    ["country-code"] = "674",
    ["iso_3166-2"] = "ISO 3166-2:SM",
    name = "San Marino",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Southern Europe",
    ["sub-region-code"] = "039"
  },
  sn = {
    ["alpha-2"] = "SN",
    ["alpha-3"] = "SEN",
    ["country-code"] = "686",
    ["iso_3166-2"] = "ISO 3166-2:SN",
    name = "Senegal",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Western Africa",
    ["sub-region-code"] = "011"
  },
  so = {
    ["alpha-2"] = "SO",
    ["alpha-3"] = "SOM",
    ["country-code"] = "706",
    ["iso_3166-2"] = "ISO 3166-2:SO",
    name = "Somalia",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Eastern Africa",
    ["sub-region-code"] = "014"
  },
  sr = {
    ["alpha-2"] = "SR",
    ["alpha-3"] = "SUR",
    ["country-code"] = "740",
    ["iso_3166-2"] = "ISO 3166-2:SR",
    name = "Suriname",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "South America",
    ["sub-region-code"] = "005"
  },
  ss = {
    ["alpha-2"] = "SS",
    ["alpha-3"] = "SSD",
    ["country-code"] = "728",
    ["iso_3166-2"] = "ISO 3166-2:SS",
    name = "South Sudan",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Eastern Africa",
    ["sub-region-code"] = "014"
  },
  st = {
    ["alpha-2"] = "ST",
    ["alpha-3"] = "STP",
    ["country-code"] = "678",
    ["iso_3166-2"] = "ISO 3166-2:ST",
    name = "Sao Tome and Principe",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Middle Africa",
    ["sub-region-code"] = "017"
  },
  sv = {
    ["alpha-2"] = "SV",
    ["alpha-3"] = "SLV",
    ["country-code"] = "222",
    ["iso_3166-2"] = "ISO 3166-2:SV",
    name = "El Salvador",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Central America",
    ["sub-region-code"] = "013"
  },
  sx = {
    ["alpha-2"] = "SX",
    ["alpha-3"] = "SXM",
    ["country-code"] = "534",
    ["iso_3166-2"] = "ISO 3166-2:SX",
    name = "Sint Maarten (Dutch part)",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Caribbean",
    ["sub-region-code"] = "029"
  },
  sy = {
    ["alpha-2"] = "SY",
    ["alpha-3"] = "SYR",
    ["country-code"] = "760",
    ["iso_3166-2"] = "ISO 3166-2:SY",
    name = "Syrian Arab Republic",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Western Asia",
    ["sub-region-code"] = "145"
  },
  sz = {
    ["alpha-2"] = "SZ",
    ["alpha-3"] = "SWZ",
    ["country-code"] = "748",
    ["iso_3166-2"] = "ISO 3166-2:SZ",
    name = "Swaziland",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Southern Africa",
    ["sub-region-code"] = "018"
  },
  tc = {
    ["alpha-2"] = "TC",
    ["alpha-3"] = "TCA",
    ["country-code"] = "796",
    ["iso_3166-2"] = "ISO 3166-2:TC",
    name = "Turks and Caicos Islands",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Caribbean",
    ["sub-region-code"] = "029"
  },
  td = {
    ["alpha-2"] = "TD",
    ["alpha-3"] = "TCD",
    ["country-code"] = "148",
    ["iso_3166-2"] = "ISO 3166-2:TD",
    name = "Chad",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Middle Africa",
    ["sub-region-code"] = "017"
  },
  tf = {
    ["alpha-2"] = "TF",
    ["alpha-3"] = "ATF",
    ["country-code"] = "260",
    ["iso_3166-2"] = "ISO 3166-2:TF",
    name = "French Southern Territories"
  },
  tg = {
    ["alpha-2"] = "TG",
    ["alpha-3"] = "TGO",
    ["country-code"] = "768",
    ["iso_3166-2"] = "ISO 3166-2:TG",
    name = "Togo",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Western Africa",
    ["sub-region-code"] = "011"
  },
  th = {
    ["alpha-2"] = "TH",
    ["alpha-3"] = "THA",
    ["country-code"] = "764",
    ["iso_3166-2"] = "ISO 3166-2:TH",
    name = "Thailand",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "South-Eastern Asia",
    ["sub-region-code"] = "035"
  },
  tj = {
    ["alpha-2"] = "TJ",
    ["alpha-3"] = "TJK",
    ["country-code"] = "762",
    ["iso_3166-2"] = "ISO 3166-2:TJ",
    name = "Tajikistan",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Central Asia",
    ["sub-region-code"] = "143"
  },
  tk = {
    ["alpha-2"] = "TK",
    ["alpha-3"] = "TKL",
    ["country-code"] = "772",
    ["iso_3166-2"] = "ISO 3166-2:TK",
    name = "Tokelau",
    region = "Oceania",
    ["region-code"] = "009",
    ["sub-region"] = "Polynesia",
    ["sub-region-code"] = "061"
  },
  tl = {
    ["alpha-2"] = "TL",
    ["alpha-3"] = "TLS",
    ["country-code"] = "626",
    ["iso_3166-2"] = "ISO 3166-2:TL",
    name = "Timor-Leste",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "South-Eastern Asia",
    ["sub-region-code"] = "035"
  },
  tm = {
    ["alpha-2"] = "TM",
    ["alpha-3"] = "TKM",
    ["country-code"] = "795",
    ["iso_3166-2"] = "ISO 3166-2:TM",
    name = "Turkmenistan",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Central Asia",
    ["sub-region-code"] = "143"
  },
  tn = {
    ["alpha-2"] = "TN",
    ["alpha-3"] = "TUN",
    ["country-code"] = "788",
    ["iso_3166-2"] = "ISO 3166-2:TN",
    name = "Tunisia",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Northern Africa",
    ["sub-region-code"] = "015"
  },
  to = {
    ["alpha-2"] = "TO",
    ["alpha-3"] = "TON",
    ["country-code"] = "776",
    ["iso_3166-2"] = "ISO 3166-2:TO",
    name = "Tonga",
    region = "Oceania",
    ["region-code"] = "009",
    ["sub-region"] = "Polynesia",
    ["sub-region-code"] = "061"
  },
  tr = {
    ["alpha-2"] = "TR",
    ["alpha-3"] = "TUR",
    ["country-code"] = "792",
    ["iso_3166-2"] = "ISO 3166-2:TR",
    name = "Turkey",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Western Asia",
    ["sub-region-code"] = "145"
  },
  tt = {
    ["alpha-2"] = "TT",
    ["alpha-3"] = "TTO",
    ["country-code"] = "780",
    ["iso_3166-2"] = "ISO 3166-2:TT",
    name = "Trinidad and Tobago",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Caribbean",
    ["sub-region-code"] = "029"
  },
  tv = {
    ["alpha-2"] = "TV",
    ["alpha-3"] = "TUV",
    ["country-code"] = "798",
    ["iso_3166-2"] = "ISO 3166-2:TV",
    name = "Tuvalu",
    region = "Oceania",
    ["region-code"] = "009",
    ["sub-region"] = "Polynesia",
    ["sub-region-code"] = "061"
  },
  tw = {
    ["alpha-2"] = "TW",
    ["alpha-3"] = "TWN",
    ["country-code"] = "158",
    ["iso_3166-2"] = "ISO 3166-2:TW",
    name = "Taiwan, Province of China",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Eastern Asia",
    ["sub-region-code"] = "030"
  },
  tz = {
    ["alpha-2"] = "TZ",
    ["alpha-3"] = "TZA",
    ["country-code"] = "834",
    ["iso_3166-2"] = "ISO 3166-2:TZ",
    name = "Tanzania, United Republic of",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Eastern Africa",
    ["sub-region-code"] = "014"
  },
  ua = {
    ["alpha-2"] = "UA",
    ["alpha-3"] = "UKR",
    ["country-code"] = "804",
    ["iso_3166-2"] = "ISO 3166-2:UA",
    name = "Ukraine",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Eastern Europe",
    ["sub-region-code"] = "151"
  },
  ug = {
    ["alpha-2"] = "UG",
    ["alpha-3"] = "UGA",
    ["country-code"] = "800",
    ["iso_3166-2"] = "ISO 3166-2:UG",
    name = "Uganda",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Eastern Africa",
    ["sub-region-code"] = "014"
  },
  um = {
    ["alpha-2"] = "UM",
    ["alpha-3"] = "UMI",
    ["country-code"] = "581",
    ["iso_3166-2"] = "ISO 3166-2:UM",
    name = "United States Minor Outlying Islands"
  },
  us = {
    ["alpha-2"] = "US",
    ["alpha-3"] = "USA",
    ["country-code"] = "840",
    ["iso_3166-2"] = "ISO 3166-2:US",
    name = "United States of America",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Northern America",
    ["sub-region-code"] = "021"
  },
  uy = {
    ["alpha-2"] = "UY",
    ["alpha-3"] = "URY",
    ["country-code"] = "858",
    ["iso_3166-2"] = "ISO 3166-2:UY",
    name = "Uruguay",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "South America",
    ["sub-region-code"] = "005"
  },
  uz = {
    ["alpha-2"] = "UZ",
    ["alpha-3"] = "UZB",
    ["country-code"] = "860",
    ["iso_3166-2"] = "ISO 3166-2:UZ",
    name = "Uzbekistan",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Central Asia",
    ["sub-region-code"] = "143"
  },
  va = {
    ["alpha-2"] = "VA",
    ["alpha-3"] = "VAT",
    ["country-code"] = "336",
    ["iso_3166-2"] = "ISO 3166-2:VA",
    name = "Holy See",
    region = "Europe",
    ["region-code"] = "150",
    ["sub-region"] = "Southern Europe",
    ["sub-region-code"] = "039"
  },
  vc = {
    ["alpha-2"] = "VC",
    ["alpha-3"] = "VCT",
    ["country-code"] = "670",
    ["iso_3166-2"] = "ISO 3166-2:VC",
    name = "Saint Vincent and the Grenadines",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Caribbean",
    ["sub-region-code"] = "029"
  },
  ve = {
    ["alpha-2"] = "VE",
    ["alpha-3"] = "VEN",
    ["country-code"] = "862",
    ["iso_3166-2"] = "ISO 3166-2:VE",
    name = "Venezuela (Bolivarian Republic of)",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "South America",
    ["sub-region-code"] = "005"
  },
  vg = {
    ["alpha-2"] = "VG",
    ["alpha-3"] = "VGB",
    ["country-code"] = "092",
    ["iso_3166-2"] = "ISO 3166-2:VG",
    name = "Virgin Islands (British)",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Caribbean",
    ["sub-region-code"] = "029"
  },
  vi = {
    ["alpha-2"] = "VI",
    ["alpha-3"] = "VIR",
    ["country-code"] = "850",
    ["iso_3166-2"] = "ISO 3166-2:VI",
    name = "Virgin Islands (U.S.)",
    region = "Americas",
    ["region-code"] = "019",
    ["sub-region"] = "Caribbean",
    ["sub-region-code"] = "029"
  },
  vn = {
    ["alpha-2"] = "VN",
    ["alpha-3"] = "VNM",
    ["country-code"] = "704",
    ["iso_3166-2"] = "ISO 3166-2:VN",
    name = "Viet Nam",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "South-Eastern Asia",
    ["sub-region-code"] = "035"
  },
  vu = {
    ["alpha-2"] = "VU",
    ["alpha-3"] = "VUT",
    ["country-code"] = "548",
    ["iso_3166-2"] = "ISO 3166-2:VU",
    name = "Vanuatu",
    region = "Oceania",
    ["region-code"] = "009",
    ["sub-region"] = "Melanesia",
    ["sub-region-code"] = "054"
  },
  wf = {
    ["alpha-2"] = "WF",
    ["alpha-3"] = "WLF",
    ["country-code"] = "876",
    ["iso_3166-2"] = "ISO 3166-2:WF",
    name = "Wallis and Futuna",
    region = "Oceania",
    ["region-code"] = "009",
    ["sub-region"] = "Polynesia",
    ["sub-region-code"] = "061"
  },
  ws = {
    ["alpha-2"] = "WS",
    ["alpha-3"] = "WSM",
    ["country-code"] = "882",
    ["iso_3166-2"] = "ISO 3166-2:WS",
    name = "Samoa",
    region = "Oceania",
    ["region-code"] = "009",
    ["sub-region"] = "Polynesia",
    ["sub-region-code"] = "061"
  },
  ye = {
    ["alpha-2"] = "YE",
    ["alpha-3"] = "YEM",
    ["country-code"] = "887",
    ["iso_3166-2"] = "ISO 3166-2:YE",
    name = "Yemen",
    region = "Asia",
    ["region-code"] = "142",
    ["sub-region"] = "Western Asia",
    ["sub-region-code"] = "145"
  },
  yt = {
    ["alpha-2"] = "YT",
    ["alpha-3"] = "MYT",
    ["country-code"] = "175",
    ["iso_3166-2"] = "ISO 3166-2:YT",
    name = "Mayotte",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Eastern Africa",
    ["sub-region-code"] = "014"
  },
  za = {
    ["alpha-2"] = "ZA",
    ["alpha-3"] = "ZAF",
    ["country-code"] = "710",
    ["iso_3166-2"] = "ISO 3166-2:ZA",
    name = "South Africa",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Southern Africa",
    ["sub-region-code"] = "018"
  },
  zm = {
    ["alpha-2"] = "ZM",
    ["alpha-3"] = "ZMB",
    ["country-code"] = "894",
    ["iso_3166-2"] = "ISO 3166-2:ZM",
    name = "Zambia",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Eastern Africa",
    ["sub-region-code"] = "014"
  },
  zw = {
    ["alpha-2"] = "ZW",
    ["alpha-3"] = "ZWE",
    ["country-code"] = "716",
    ["iso_3166-2"] = "ISO 3166-2:ZW",
    name = "Zimbabwe",
    region = "Africa",
    ["region-code"] = "002",
    ["sub-region"] = "Eastern Africa",
    ["sub-region-code"] = "014"
  }
}

