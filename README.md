

sudo aptitude install postgresql-plpython3-12




SELECT geocode_search('West 4th Alley #03, Eugene OR');
SELECT geocode_reverse(-123.1140612, 44.0549018);


SELECT num, street, city, zip, zipplus FROM parse_address('959 W 4th Alley #3, Eugene Or 97402');
