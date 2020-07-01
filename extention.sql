

CREATE EXTENSION plpython3u;
CREATE EXTENSION address_standardizer;


CREATE OR REPLACE FUNCTION geocode_search(address TEXT)
    RETURNS JSONB
AS $$
    import json
    import requests
    url = "https://nominatim.openstreetmap.org/search"
    params = {
        "q": address,
        "format": "json",
        "addressdetails": 1
    }
    resp = requests.get(url, params=params)
    if 200 != resp.status_code or 0 == len(resp.json()):
        return '{}'
    return json.dumps(resp.json()[0])
$$ LANGUAGE plpython3u;


CREATE OR REPLACE FUNCTION geocode_reverse(longitude DOUBLE PRECISION, latitude DOUBLE PRECISION)
    RETURNS JSONB
AS $$
    import json
    import requests
    url = "https://nominatim.openstreetmap.org/reverse"
    params = {
        "lon": longitude,
        "lat": latitude,
        "format": "json",
        "addressdetails": 1
    }
    resp = requests.get(url, params=params)
    return resp.text
$$ LANGUAGE plpython3u;
