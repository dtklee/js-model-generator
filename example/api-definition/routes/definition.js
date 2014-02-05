var def = {
	"contact": {
		"name": "contact",
		"fields": [{
			"name": "firstName",
			"domain": "DO_TEXTE_50",
			"isCompulsory": true,
			"label": "firstName"
		}, {
			"name": "lastName",
			"domain": "DO_TEXTE_50",
			"isCompulsory": true,
			"label": "lastName"
		}, {
			"name": "dateOfBirth",
			"domain": "DO_DATE",
			"isCompulsory": false,
			"label": "dateOfBirth"
		}, {
			"name": "age",
			"domain": "DO_NUMBER",
			"isCompulsory": false,
			"label": "firstName"
		}]
	}

};
// Return json describing the definition.
exports.index = function(req, res){
  res.json(def);
};

exports.get = function(req, res){
	var name = req.query;//.get;
	console.log(name);
	if(def[name] !== undefined){
		res.json(def[name]);
	}else {
		res.send(404);
	}
};

