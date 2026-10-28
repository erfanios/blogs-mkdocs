document.addEventListener('keydown', function(e) {
    // Reagiert auf Cmd+F (Mac) oder Ctrl+F (Windows/Linux)
    if ((e.metaKey || e.ctrlKey) && e.key.toLowerCase() === 'f') {
        e.preventDefault();
        
        const searchModalElement = document.getElementById('mkdocs_search_modal');
        if (searchModalElement) {
            // Modal per Bootstrap API öffnen
            const modal = window.bootstrap.Modal.getOrCreateInstance(searchModalElement);
            modal.show();
        }
    }
});

// Sobald das Modal fertig eingeblendet ist, den Fokus direkt ins Suchfeld setzen
document.addEventListener('DOMContentLoaded', function() {
    const searchModalElement = document.getElementById('mkdocs_search_modal');
    if (searchModalElement) {
        searchModalElement.addEventListener('shown.bs.modal', function () {
            const searchInput = document.getElementById('mkdocs-search-query');
            if (searchInput) {
                searchInput.focus();
                searchInput.select();
            }
        });
    }
});
