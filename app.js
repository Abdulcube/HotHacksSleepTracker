function addEntry() {
	const container = document.getElementById('journal-container');
	const temp = document.getElementsByTagName('template')[0];
	const clone = temp.content.cloneNode(true);
	container.prepend(clone);
}

function saveEntry() {
	alert('Save successful!');
}

function deleteEntry() {
	alert('You successfully deleted an entry');
}
