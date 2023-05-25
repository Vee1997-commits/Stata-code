*************************************Porridge

//MARKET_SCAN PROJECT
clear all

import spss "C:\Users\vochieng\OneDrive - Dalberg Global Development Advisors\Dalberg\Projects\QC\2023\CISL\Data cleaning - Stata\Data\MARKET SCAN FIELD-Brand_rpt1.sav"

// Split A1a vars
drop A1a_1- A1a_9
split A1a, p("")

// Create a vector to store the variable names and destring
global destring_vars ""
foreach var of varlist A1a* {
    if "`var'" != "A1a" {
        destring `var', replace
        global destring_vars "$destring_vars `var'"
    }
}


// order variables after parent variable A1a
foreach var of varlist A1a* {
    if "`var'" != "A1a" {
		order `var', before(A1a)
	}
}
	
* Apply A1a value labels
label define A1a_label 1 "Carton"	2 "Tin"	3 "Paper"	4 "Plastic"	5 "Polythene bag"	6 "Gunny sack (gunia)"	7 "Glass"	8 "Foil"	9 "Tetra-pack"
foreach varname in $destring_vars {
  label values `varname' A1a_label
}

* add variable labels
foreach varname of local destring_vars {
	if "`var'" == "A1a" {
  label variable `varname' "A1a. Type of package"
	}
}

**********************************************************************************************************************
// Split A1c vars
drop A1c_1- A1c_21
split A1c, p("")

// Create a vector to store the variable names and destring
global destring_vars ""
foreach var of varlist A1c* {
    if "`var'" != "A1c" {
        destring `var', replace
        global destring_vars "$destring_vars `var'"
    }
}

// order variables after parent variable A1a
foreach var of varlist A1c* {
    if "`var'" != "A1c" {
		order `var', before(A1c)
	}
}

* Apply A1c value labels
label define A1c_label 1 "less than 50g"	2 "90g"	3 "100g"	4 "120g"	5 "125g"	6 "200g"	7 "250g"	8 "300g"	9 "350g"	10 "400g"	11 "450g"	12 "500g"	13 "600g"	14 "800g"	15 "900g"	16 "1000g/1kg"	17 "1500g/1.5kg"	18 "2000g/2kg"	19 "5000g/5kg"	20 "10000g/10kg"	21 "More than 10kg"
foreach varname in $destring_vars {
  label values `varname' A1c_label
}

* add variable labels
foreach varname of local destring_vars {
  label values `varname' "A1c. size of package"
}

drop KEY SET_OF_Brand_rpt1 flour_index brand_index1 A1a A1c
gen KEY = substr(PARENT_KEY, 1, length(PARENT_KEY)-7)

keep if A1_select2 == "1"

//renaming all variables

foreach var of varlist _all {
	if "`var'" ! = "KEY" {
		local var_name = "`var'_1"
		ren `var' `var_name'		
	}
}

duplicates drop KEY, force
save "C:\Users\vochieng\OneDrive - Dalberg Global Development Advisors\Dalberg\Projects\QC\2023\CISL\Data cleaning - Stata\Stata Data\Porridge",replace


********************************************************************************************************************** White wheat flour

//MARKET_SCAN PROJECT
clear all

import spss "C:\Users\vochieng\OneDrive - Dalberg Global Development Advisors\Dalberg\Projects\QC\2023\CISL\Data cleaning - Stata\Data\MARKET SCAN FIELD-Brand_rpt1.sav"

// Split A1a vars
drop A1a_1- A1a_9
split A1a, p("")

// Create a vector to store the variable names and destring
global destring_vars ""
foreach var of varlist A1a* {
    if "`var'" != "A1a" {
        destring `var', replace
        global destring_vars "$destring_vars `var'"
    }
}


// order variables after parent variable A1a
foreach var of varlist A1a* {
    if "`var'" != "A1a" {
		order `var', before(A1a)
	}
}
	
* Apply A1a value labels
label define A1a_label 1 "Carton"	2 "Tin"	3 "Paper"	4 "Plastic"	5 "Polythene bag"	6 "Gunny sack (gunia)"	7 "Glass"	8 "Foil"	9 "Tetra-pack"
foreach varname in $destring_vars {
  label values `varname' A1a_label
}

* add variable labels
foreach varname of local destring_vars {
  label values `varname' "A1a. Type of package"
}


//renaming variables

foreach var of varlist A1a* {
    if "`var'" != "A1a" { 
		local var_name = "`var'_2"
		ren `var' `var_name'
	}
}

**********************************************************************************************************************
// Split A1c vars
drop A1c_1- A1c_21
split A1c, p("")

// Create a vector to store the variable names and destring
global destring_vars ""
foreach var of varlist A1c* {
    if "`var'" != "A1c" {
        destring `var', replace
        global destring_vars "$destring_vars `var'"
    }
}

// order variables after parent variable A1a
foreach var of varlist A1c* {
    if "`var'" != "A1c" {
		order `var', before(A1c)
	}
}

* Apply A1c value labels
label define A1c_label 1 "less than 50g"	2 "90g"	3 "100g"	4 "120g"	5 "125g"	6 "200g"	7 "250g"	8 "300g"	9 "350g"	10 "400g"	11 "450g"	12 "500g"	13 "600g"	14 "800g"	15 "900g"	16 "1000g/1kg"	17 "1500g/1.5kg"	18 "2000g/2kg"	19 "5000g/5kg"	20 "10000g/10kg"	21 "More than 10kg"
foreach varname in $destring_vars {
  label values `varname' A1c_label
}

* add variable labels
foreach varname of local destring_vars {
  label values `varname' "A1c. size of package"
}


drop KEY SET_OF_Brand_rpt1 flour_index brand_index1 A1a A1c
gen KEY = substr(PARENT_KEY, 1, length(PARENT_KEY)-7)

keep if A1_select2 == "2"
duplicates drop KEY, force

//renaming all variables
foreach var of varlist _all {
	if "`var'" ! = "KEY" {
		local var_name = "`var'_2"
		ren `var' `var_name'		
	}
}

merge m:1 KEY using "C:\Users\vochieng\OneDrive - Dalberg Global Development Advisors\Dalberg\Projects\QC\2023\CISL\Data cleaning - Stata\Stata Data\Porridge"
drop _merge


duplicates drop KEY, force
save "C:\Users\vochieng\OneDrive - Dalberg Global Development Advisors\Dalberg\Projects\QC\2023\CISL\Data cleaning - Stata\Stata Data\White Wheat flour",replace


********************************************************************************************************************** Brown wheat flour
//MARKET_SCAN PROJECT
clear all

import spss "C:\Users\vochieng\OneDrive - Dalberg Global Development Advisors\Dalberg\Projects\QC\2023\CISL\Data cleaning - Stata\Data\MARKET SCAN FIELD-Brand_rpt1.sav"

// Split A1a vars
drop A1a_1- A1a_9
split A1a, p("")

// Create a vector to store the variable names and destring
global destring_vars ""
foreach var of varlist A1a* {
    if "`var'" != "A1a" {
        destring `var', replace
        global destring_vars "$destring_vars `var'"
    }
}


// order variables after parent variable A1a
foreach var of varlist A1a* {
    if "`var'" != "A1a" {
		order `var', before(A1a)
	}
}
	
* Apply A1a value labels
label define A1a_label 1 "Carton"	2 "Tin"	3 "Paper"	4 "Plastic"	5 "Polythene bag"	6 "Gunny sack (gunia)"	7 "Glass"	8 "Foil"	9 "Tetra-pack"
foreach varname in $destring_vars {
  label values `varname' A1a_label
}

* add variable labels
foreach varname of local destring_vars {
  label values `varname' "A1a. Type of package"
}

**********************************************************************************************************************
// Split A1c vars
drop A1c_1- A1c_21
split A1c, p("")

// Create a vector to store the variable names and destring
global destring_vars ""
foreach var of varlist A1c* {
    if "`var'" != "A1c" {
        destring `var', replace
        global destring_vars "$destring_vars `var'"
    }
}

// order variables after parent variable A1a
foreach var of varlist A1c* {
    if "`var'" != "A1c" {
		order `var', before(A1c)
	}
}

* Apply A1c value labels
label define A1c_label 1 "less than 50g"	2 "90g"	3 "100g"	4 "120g"	5 "125g"	6 "200g"	7 "250g"	8 "300g"	9 "350g"	10 "400g"	11 "450g"	12 "500g"	13 "600g"	14 "800g"	15 "900g"	16 "1000g/1kg"	17 "1500g/1.5kg"	18 "2000g/2kg"	19 "5000g/5kg"	20 "10000g/10kg"	21 "More than 10kg"
foreach varname in $destring_vars {
  label values `varname' A1c_label
}

* add variable labels
foreach varname of local destring_vars {
  label values `varname' "A1c. size of package"
}


drop KEY SET_OF_Brand_rpt1 flour_index brand_index1 A1a A1c
gen KEY = substr(PARENT_KEY, 1, length(PARENT_KEY)-7)

keep if A1_select2 == "3"
duplicates drop KEY, force

//renaming all variables
foreach var of varlist _all {
	if "`var'" ! = "KEY" {
		local var_name = "`var'_3"
		ren `var' `var_name'		
	}
}


merge m:1 KEY using "C:\Users\vochieng\OneDrive - Dalberg Global Development Advisors\Dalberg\Projects\QC\2023\CISL\Data cleaning - Stata\Stata Data\White Wheat flour"
drop _merge

duplicates drop KEY, force
save "C:\Users\vochieng\OneDrive - Dalberg Global Development Advisors\Dalberg\Projects\QC\2023\CISL\Data cleaning - Stata\Stata Data\Brown Wheat flour",replace

********************************************************************************************************************** Wholemeal wheat flour
//MARKET_SCAN PROJECT
clear all

import spss "C:\Users\vochieng\OneDrive - Dalberg Global Development Advisors\Dalberg\Projects\QC\2023\CISL\Data cleaning - Stata\Data\MARKET SCAN FIELD-Brand_rpt1.sav"

// Split A1a vars
drop A1a_1- A1a_9
split A1a, p("")

// Create a vector to store the variable names and destring
global destring_vars ""
foreach var of varlist A1a* {
    if "`var'" != "A1a" {
        destring `var', replace
        global destring_vars "$destring_vars `var'"
    }
}


// order variables after parent variable A1a
foreach var of varlist A1a* {
    if "`var'" != "A1a" {
		order `var', before(A1a)
	}
}
	
* Apply A1a value labels
label define A1a_label 1 "Carton"	2 "Tin"	3 "Paper"	4 "Plastic"	5 "Polythene bag"	6 "Gunny sack (gunia)"	7 "Glass"	8 "Foil"	9 "Tetra-pack"
foreach varname in $destring_vars {
  label values `varname' A1a_label
}

* add variable labels
foreach varname of local destring_vars {
  label values `varname' "A1a. Type of package"
}

*******************************************************************************************************
// Split A1c vars
drop A1c_1- A1c_21
split A1c, p("")

// Create a vector to store the variable names and destring
global destring_vars ""
foreach var of varlist A1c* {
    if "`var'" != "A1c" {
        destring `var', replace
        global destring_vars "$destring_vars `var'"
    }
}

// order variables after parent variable A1a
foreach var of varlist A1c* {
    if "`var'" != "A1c" {
		order `var', before(A1c)
	}
}

* Apply A1c value labels
label define A1c_label 1 "less than 50g"	2 "90g"	3 "100g"	4 "120g"	5 "125g"	6 "200g"	7 "250g"	8 "300g"	9 "350g"	10 "400g"	11 "450g"	12 "500g"	13 "600g"	14 "800g"	15 "900g"	16 "1000g/1kg"	17 "1500g/1.5kg"	18 "2000g/2kg"	19 "5000g/5kg"	20 "10000g/10kg"	21 "More than 10kg"
foreach varname in $destring_vars {
  label values `varname' A1c_label
}

* add variable labels
foreach varname of local destring_vars {
  label values `varname' "A1c. size of package"
}


drop KEY SET_OF_Brand_rpt1 flour_index brand_index1 A1a A1c
gen KEY = substr(PARENT_KEY, 1, length(PARENT_KEY)-7)

keep if A1_select2 == "4"
duplicates drop KEY, force

//renaming all variables
foreach var of varlist _all {
	if "`var'" ! = "KEY" {
		local var_name = "`var'_4"
		ren `var' `var_name'		
	}
}


merge m:1 KEY using "C:\Users\vochieng\OneDrive - Dalberg Global Development Advisors\Dalberg\Projects\QC\2023\CISL\Data cleaning - Stata\Stata Data\Brown Wheat flour"
drop _merge

duplicates drop KEY, force
save "C:\Users\vochieng\OneDrive - Dalberg Global Development Advisors\Dalberg\Projects\QC\2023\CISL\Data cleaning - Stata\Stata Data\Wholemeal Wheat flour",replace

***********************************************************************************************************************************************Maize flour
//MARKET_SCAN PROJECT
clear all

import spss "C:\Users\vochieng\OneDrive - Dalberg Global Development Advisors\Dalberg\Projects\QC\2023\CISL\Data cleaning - Stata\Data\MARKET SCAN FIELD-Brand_rpt1.sav"

// Split A1a vars
drop A1a_1- A1a_9
split A1a, p("")

// Create a vector to store the variable names and destring
global destring_vars ""
foreach var of varlist A1a* {
    if "`var'" != "A1a" {
        destring `var', replace
        global destring_vars "$destring_vars `var'"
    }
}


// order variables after parent variable A1a
foreach var of varlist A1a* {
    if "`var'" != "A1a" {
		order `var', before(A1a)
	}
}
	
* Apply A1a value labels
label define A1a_label 1 "Carton"	2 "Tin"	3 "Paper"	4 "Plastic"	5 "Polythene bag"	6 "Gunny sack (gunia)"	7 "Glass"	8 "Foil"	9 "Tetra-pack"
foreach varname in $destring_vars {
  label values `varname' A1a_label
}

* add variable labels
foreach varname of local destring_vars {
  label values `varname' "A1a. Type of package"
}

*******************************************************************************************************
// Split A1c vars
drop A1c_1- A1c_21
split A1c, p("")

// Create a vector to store the variable names and destring
global destring_vars ""
foreach var of varlist A1c* {
    if "`var'" != "A1c" {
        destring `var', replace
        global destring_vars "$destring_vars `var'"
    }
}

// order variables after parent variable A1a
foreach var of varlist A1c* {
    if "`var'" != "A1c" {
		order `var', before(A1c)
	}
}

* Apply A1c value labels
label define A1c_label 1 "less than 50g"	2 "90g"	3 "100g"	4 "120g"	5 "125g"	6 "200g"	7 "250g"	8 "300g"	9 "350g"	10 "400g"	11 "450g"	12 "500g"	13 "600g"	14 "800g"	15 "900g"	16 "1000g/1kg"	17 "1500g/1.5kg"	18 "2000g/2kg"	19 "5000g/5kg"	20 "10000g/10kg"	21 "More than 10kg"
foreach varname in $destring_vars {
  label values `varname' A1c_label
}

* add variable labels
foreach varname of local destring_vars {
  label values `varname' "A1c. size of package"
}


drop KEY SET_OF_Brand_rpt1 flour_index brand_index1 A1a A1c
gen KEY = substr(PARENT_KEY, 1, length(PARENT_KEY)-7)

keep if A1_select2 == "5"
duplicates drop KEY, force

//renaming all variables
foreach var of varlist _all {
	if "`var'" ! = "KEY" {
		local var_name = "`var'_5"
		ren `var' `var_name'		
	}
}


merge m:1 KEY using "C:\Users\vochieng\OneDrive - Dalberg Global Development Advisors\Dalberg\Projects\QC\2023\CISL\Data cleaning - Stata\Stata Data\Wholemeal Wheat flour"
drop _merge

duplicates drop KEY, force
save "C:\Users\vochieng\OneDrive - Dalberg Global Development Advisors\Dalberg\Projects\QC\2023\CISL\Data cleaning - Stata\Stata Data\Maize flour",replace

*************************************************************************************************************************************************Soya Flour
//MARKET_SCAN PROJECT
clear all

import spss "C:\Users\vochieng\OneDrive - Dalberg Global Development Advisors\Dalberg\Projects\QC\2023\CISL\Data cleaning - Stata\Data\MARKET SCAN FIELD-Brand_rpt1.sav"

// Split A1a vars
drop A1a_1- A1a_9
split A1a, p("")

// Create a vector to store the variable names and destring
global destring_vars ""
foreach var of varlist A1a* {
    if "`var'" != "A1a" {
        destring `var', replace
        global destring_vars "$destring_vars `var'"
    }
}


// order variables after parent variable A1a
foreach var of varlist A1a* {
    if "`var'" != "A1a" {
		order `var', before(A1a)
	}
}
	
* Apply A1a value labels
label define A1a_label 1 "Carton"	2 "Tin"	3 "Paper"	4 "Plastic"	5 "Polythene bag"	6 "Gunny sack (gunia)"	7 "Glass"	8 "Foil"	9 "Tetra-pack"
foreach varname in $destring_vars {
  label values `varname' A1a_label
}

* add variable labels
foreach varname of local destring_vars {
  label values `varname' "A1a. Type of package"
}

*******************************************************************************************************
// Split A1c vars
drop A1c_1- A1c_21
split A1c, p("")

// Create a vector to store the variable names and destring
global destring_vars ""
foreach var of varlist A1c* {
    if "`var'" != "A1c" {
        destring `var', replace
        global destring_vars "$destring_vars `var'"
    }
}

// order variables after parent variable A1a
foreach var of varlist A1c* {
    if "`var'" != "A1c" {
		order `var', before(A1c)
	}
}

* Apply A1c value labels
label define A1c_label 1 "less than 50g"	2 "90g"	3 "100g"	4 "120g"	5 "125g"	6 "200g"	7 "250g"	8 "300g"	9 "350g"	10 "400g"	11 "450g"	12 "500g"	13 "600g"	14 "800g"	15 "900g"	16 "1000g/1kg"	17 "1500g/1.5kg"	18 "2000g/2kg"	19 "5000g/5kg"	20 "10000g/10kg"	21 "More than 10kg"
foreach varname in $destring_vars {
  label values `varname' A1c_label
}

* add variable labels
foreach varname of local destring_vars {
  label values `varname' "A1c. size of package"
}


drop KEY SET_OF_Brand_rpt1 flour_index brand_index1 A1a A1c
gen KEY = substr(PARENT_KEY, 1, length(PARENT_KEY)-7)

keep if A1_select2 == "6"
duplicates drop KEY, force

//renaming all variables
foreach var of varlist _all {
	if "`var'" ! = "KEY" {
		local var_name = "`var'_6"
		ren `var' `var_name'		
	}
}


merge m:1 KEY using "C:\Users\vochieng\OneDrive - Dalberg Global Development Advisors\Dalberg\Projects\QC\2023\CISL\Data cleaning - Stata\Stata Data\Maize flour"
drop _merge

duplicates drop KEY, force
save "C:\Users\vochieng\OneDrive - Dalberg Global Development Advisors\Dalberg\Projects\QC\2023\CISL\Data cleaning - Stata\Stata Data\Soya Flour",replace

***********************************************************************************************************************************************Millet Flour
//MARKET_SCAN PROJECT
clear all

import spss "C:\Users\vochieng\OneDrive - Dalberg Global Development Advisors\Dalberg\Projects\QC\2023\CISL\Data cleaning - Stata\Data\MARKET SCAN FIELD-Brand_rpt1.sav"

// Split A1a vars
drop A1a_1- A1a_9
split A1a, p("")

// Create a vector to store the variable names and destring
global destring_vars ""
foreach var of varlist A1a* {
    if "`var'" != "A1a" {
        destring `var', replace
        global destring_vars "$destring_vars `var'"
    }
}


// order variables after parent variable A1a
foreach var of varlist A1a* {
    if "`var'" != "A1a" {
		order `var', before(A1a)
	}
}
	
* Apply A1a value labels
label define A1a_label 1 "Carton"	2 "Tin"	3 "Paper"	4 "Plastic"	5 "Polythene bag"	6 "Gunny sack (gunia)"	7 "Glass"	8 "Foil"	9 "Tetra-pack"
foreach varname in $destring_vars {
  label values `varname' A1a_label
}

* add variable labels
foreach varname of local destring_vars {
  label values `varname' "A1a. Type of package"
}

*******************************************************************************************************
// Split A1c vars
drop A1c_1- A1c_21
split A1c, p("")

// Create a vector to store the variable names and destring
global destring_vars ""
foreach var of varlist A1c* {
    if "`var'" != "A1c" {
        destring `var', replace
        global destring_vars "$destring_vars `var'"
    }
}

// order variables after parent variable A1a
foreach var of varlist A1c* {
    if "`var'" != "A1c" {
		order `var', before(A1c)
	}
}

* Apply A1c value labels
label define A1c_label 1 "less than 50g"	2 "90g"	3 "100g"	4 "120g"	5 "125g"	6 "200g"	7 "250g"	8 "300g"	9 "350g"	10 "400g"	11 "450g"	12 "500g"	13 "600g"	14 "800g"	15 "900g"	16 "1000g/1kg"	17 "1500g/1.5kg"	18 "2000g/2kg"	19 "5000g/5kg"	20 "10000g/10kg"	21 "More than 10kg"
foreach varname in $destring_vars {
  label values `varname' A1c_label
}

* add variable labels
foreach varname of local destring_vars {
  label values `varname' "A1c. size of package"
}


drop KEY SET_OF_Brand_rpt1 flour_index brand_index1 A1a A1c
gen KEY = substr(PARENT_KEY, 1, length(PARENT_KEY)-7)

keep if A1_select2 == "7"
duplicates drop KEY, force

//renaming all variables
foreach var of varlist _all {
	if "`var'" ! = "KEY" {
		local var_name = "`var'_7"
		ren `var' `var_name'		
	}
}


merge m:1 KEY using "C:\Users\vochieng\OneDrive - Dalberg Global Development Advisors\Dalberg\Projects\QC\2023\CISL\Data cleaning - Stata\Stata Data\Soya Flour"
drop _merge

duplicates drop KEY, force
save "C:\Users\vochieng\OneDrive - Dalberg Global Development Advisors\Dalberg\Projects\QC\2023\CISL\Data cleaning - Stata\Stata Data\Millet Flour",replace

***********************************************************************************************************************************************Sorghum Flour
clear all

import spss "C:\Users\vochieng\OneDrive - Dalberg Global Development Advisors\Dalberg\Projects\QC\2023\CISL\Data cleaning - Stata\Data\MARKET SCAN FIELD-Brand_rpt1.sav"

// Split A1a vars
drop A1a_1- A1a_9
split A1a, p("")

// Create a vector to store the variable names and destring
global destring_vars ""
foreach var of varlist A1a* {
    if "`var'" != "A1a" {
        destring `var', replace
        global destring_vars "$destring_vars `var'"
    }
}


// order variables after parent variable A1a
foreach var of varlist A1a* {
    if "`var'" != "A1a" {
		order `var', before(A1a)
	}
}
	
* Apply A1a value labels
label define A1a_label 1 "Carton"	2 "Tin"	3 "Paper"	4 "Plastic"	5 "Polythene bag"	6 "Gunny sack (gunia)"	7 "Glass"	8 "Foil"	9 "Tetra-pack"
foreach varname in $destring_vars {
  label values `varname' A1a_label
}

* add variable labels
foreach varname of local destring_vars {
  label values `varname' "A1a. Type of package"
}

*******************************************************************************************************
// Split A1c vars
drop A1c_1- A1c_21
split A1c, p("")

// Create a vector to store the variable names and destring
global destring_vars ""
foreach var of varlist A1c* {
    if "`var'" != "A1c" {
        destring `var', replace
        global destring_vars "$destring_vars `var'"
    }
}

// order variables after parent variable A1a
foreach var of varlist A1c* {
    if "`var'" != "A1c" {
		order `var', before(A1c)
	}
}

* Apply A1c value labels
label define A1c_label 1 "less than 50g"	2 "90g"	3 "100g"	4 "120g"	5 "125g"	6 "200g"	7 "250g"	8 "300g"	9 "350g"	10 "400g"	11 "450g"	12 "500g"	13 "600g"	14 "800g"	15 "900g"	16 "1000g/1kg"	17 "1500g/1.5kg"	18 "2000g/2kg"	19 "5000g/5kg"	20 "10000g/10kg"	21 "More than 10kg"
foreach varname in $destring_vars {
  label values `varname' A1c_label
}

* add variable labels
foreach varname of local destring_vars {
  label values `varname' "A1c. size of package"
}


drop KEY SET_OF_Brand_rpt1 flour_index brand_index1 A1a A1c
gen KEY = substr(PARENT_KEY, 1, length(PARENT_KEY)-7)

keep if A1_select2 == "8"
duplicates drop KEY, force

//renaming all variables
foreach var of varlist _all {
	if "`var'" ! = "KEY" {
		local var_name = "`var'_8"
		ren `var' `var_name'		
	}
}


merge m:1 KEY using "C:\Users\vochieng\OneDrive - Dalberg Global Development Advisors\Dalberg\Projects\QC\2023\CISL\Data cleaning - Stata\Stata Data\Millet Flour"
drop _merge

duplicates drop KEY, force
save "C:\Users\vochieng\OneDrive - Dalberg Global Development Advisors\Dalberg\Projects\QC\2023\CISL\Data cleaning - Stata\Stata Data\Sorghum Flour",replace

*********************************************************************************************************************************************Chapati Flour
clear all

import spss "C:\Users\vochieng\OneDrive - Dalberg Global Development Advisors\Dalberg\Projects\QC\2023\CISL\Data cleaning - Stata\Data\MARKET SCAN FIELD-Brand_rpt1.sav"

// Split A1a vars
drop A1a_1- A1a_9
split A1a, p("")

// Create a vector to store the variable names and destring
global destring_vars ""
foreach var of varlist A1a* {
    if "`var'" != "A1a" {
        destring `var', replace
        global destring_vars "$destring_vars `var'"
    }
}


// order variables after parent variable A1a
foreach var of varlist A1a* {
    if "`var'" != "A1a" {
		order `var', before(A1a)
	}
}
	
* Apply A1a value labels
label define A1a_label 1 "Carton"	2 "Tin"	3 "Paper"	4 "Plastic"	5 "Polythene bag"	6 "Gunny sack (gunia)"	7 "Glass"	8 "Foil"	9 "Tetra-pack"
foreach varname in $destring_vars {
  label values `varname' A1a_label
}

* add variable labels
foreach varname of local destring_vars {
  label values `varname' "A1a. Type of package"
}

*******************************************************************************************************
// Split A1c vars
drop A1c_1- A1c_21
split A1c, p("")

// Create a vector to store the variable names and destring
global destring_vars ""
foreach var of varlist A1c* {
    if "`var'" != "A1c" {
        destring `var', replace
        global destring_vars "$destring_vars `var'"
    }
}

// order variables after parent variable A1a
foreach var of varlist A1c* {
    if "`var'" != "A1c" {
		order `var', before(A1c)
	}
}

* Apply A1c value labels
label define A1c_label 1 "less than 50g"	2 "90g"	3 "100g"	4 "120g"	5 "125g"	6 "200g"	7 "250g"	8 "300g"	9 "350g"	10 "400g"	11 "450g"	12 "500g"	13 "600g"	14 "800g"	15 "900g"	16 "1000g/1kg"	17 "1500g/1.5kg"	18 "2000g/2kg"	19 "5000g/5kg"	20 "10000g/10kg"	21 "More than 10kg"
foreach varname in $destring_vars {
  label values `varname' A1c_label
}

* add variable labels
foreach varname of local destring_vars {
  label values `varname' "A1c. size of package"
}


drop KEY SET_OF_Brand_rpt1 flour_index brand_index1 A1a A1c
gen KEY = substr(PARENT_KEY, 1, length(PARENT_KEY)-7)

keep if A1_select2 == "9"
duplicates drop KEY, force

//renaming all variables
foreach var of varlist _all {
	if "`var'" ! = "KEY" {
		local var_name = "`var'_9"
		ren `var' `var_name'		
	}
}


merge m:1 KEY using "C:\Users\vochieng\OneDrive - Dalberg Global Development Advisors\Dalberg\Projects\QC\2023\CISL\Data cleaning - Stata\Stata Data\Sorghum Flour"
drop _merge

duplicates drop KEY, force
save "C:\Users\vochieng\OneDrive - Dalberg Global Development Advisors\Dalberg\Projects\QC\2023\CISL\Data cleaning - Stata\Stata Data\Chapati Flour",replace

*********************************************************************************************************************************************Mandazi Flour
clear all

import spss "C:\Users\vochieng\OneDrive - Dalberg Global Development Advisors\Dalberg\Projects\QC\2023\CISL\Data cleaning - Stata\Data\MARKET SCAN FIELD-Brand_rpt1.sav"

// Split A1a vars
drop A1a_1- A1a_9
split A1a, p("")

// Create a vector to store the variable names and destring
global destring_vars ""
foreach var of varlist A1a* {
    if "`var'" != "A1a" {
        destring `var', replace
        global destring_vars "$destring_vars `var'"
    }
}


// order variables after parent variable A1a
foreach var of varlist A1a* {
    if "`var'" != "A1a" {
		order `var', before(A1a)
	}
}
	
* Apply A1a value labels
label define A1a_label 1 "Carton"	2 "Tin"	3 "Paper"	4 "Plastic"	5 "Polythene bag"	6 "Gunny sack (gunia)"	7 "Glass"	8 "Foil"	9 "Tetra-pack"
foreach varname in $destring_vars {
  label values `varname' A1a_label
}

* add variable labels
foreach varname of local destring_vars {
  label values `varname' "A1a. Type of package"
}

*******************************************************************************************************
// Split A1c vars
drop A1c_1- A1c_21
split A1c, p("")

// Create a vector to store the variable names and destring
global destring_vars ""
foreach var of varlist A1c* {
    if "`var'" != "A1c" {
        destring `var', replace
        global destring_vars "$destring_vars `var'"
    }
}

// order variables after parent variable A1a
foreach var of varlist A1c* {
    if "`var'" != "A1c" {
		order `var', before(A1c)
	}
}

* Apply A1c value labels
label define A1c_label 1 "less than 50g"	2 "90g"	3 "100g"	4 "120g"	5 "125g"	6 "200g"	7 "250g"	8 "300g"	9 "350g"	10 "400g"	11 "450g"	12 "500g"	13 "600g"	14 "800g"	15 "900g"	16 "1000g/1kg"	17 "1500g/1.5kg"	18 "2000g/2kg"	19 "5000g/5kg"	20 "10000g/10kg"	21 "More than 10kg"
foreach varname in $destring_vars {
  label values `varname' A1c_label
}

* add variable labels
foreach varname of local destring_vars {
  label values `varname' "A1c. size of package"
}


drop KEY SET_OF_Brand_rpt1 flour_index brand_index1 A1a A1c
gen KEY = substr(PARENT_KEY, 1, length(PARENT_KEY)-7)

keep if A1_select2 == "10"
duplicates drop KEY, force

//renaming all variables
foreach var of varlist _all {
	if "`var'" ! = "KEY" {
		local var_name = "`var'_10"
		ren `var' `var_name'		
	}
}


merge m:1 KEY using "C:\Users\vochieng\OneDrive - Dalberg Global Development Advisors\Dalberg\Projects\QC\2023\CISL\Data cleaning - Stata\Stata Data\Chapati Flour"
drop _merge

duplicates drop KEY, force
save "C:\Users\vochieng\OneDrive - Dalberg Global Development Advisors\Dalberg\Projects\QC\2023\CISL\Data cleaning - Stata\Stata Data\Mandazi Flour",replace

******************************************************************************************************************************************************
// order variables after parent variable A1a
foreach var of varlist _all {
    if "`var'" != "KEY" {
		order KEY Brand_name_flour_1 A1a1_1 - A1e_image_1 Brand_name_flour_2 A1a1_2 - A1e_image_2 Brand_name_flour_3 A1a1_3 - A1e_image_3 Brand_name_flour_4 A1a1_4 - A1e_image_4 Brand_name_flour_5 A1a1_5 - A1e_image_5 Brand_name_flour_6 A1a1_6 - A1e_image_6 Brand_name_flour_7 A1a1_7 - A1e_image_7 Brand_name_flour_8 A1a1_8 - A1e_image_8 Brand_name_flour_9 A1a1_9 - A1e_image_9 Brand_name_flour_10 A1a1_10 - A1e_image_10
	}
}

merge m:1 KEY using "C:\Users\vochieng\OneDrive - Dalberg Global Development Advisors\Dalberg\Projects\QC\2023\CISL\Data cleaning - Stata\Stata Data\Mandazi Flour"
drop _merge

save "C:\Users\vochieng\OneDrive - Dalberg Global Development Advisors\Dalberg\Projects\QC\2023\CISL\Data cleaning - Stata\Stata Data\All_A1",replace
