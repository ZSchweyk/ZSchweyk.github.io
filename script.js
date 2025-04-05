document.addEventListener('DOMContentLoaded', () => {
    const navLinks = document.querySelectorAll('.nav-link');
    const mainContent = document.getElementById('main-content');
    var data_pages = []

    navLinks.forEach(link => {
        link.addEventListener('click', (e) => {
            e.preventDefault();
            const page = link.getAttribute('data-page');
            data_pages.push(page);
            loadPage(page);
            setActiveLink(link);
        });
    });

    mainContent.addEventListener('click', (e) => {
        // add for loop here so I don't need to add a class and data-page that are the same for "projects" for example
        

        if (e.target.matches('.conference-sand-table')) {
            e.preventDefault();
            loadPage('projects/conference-sand-table');
        } else if (e.target.matches('.pde-seminar-link')) {
            e.preventDefault();
            loadPage('talks/pde-seminar');
        } else if (e.target.matches('.ml-seminar-link')) {
            e.preventDefault();
            loadPage('talks/ml-seminar');
        } else if (e.target.matches(".projects")) {
            e.preventDefault();
            loadPage('projects');
        }
    });

    function loadPage(page) {
        mainContent.classList.remove('fade-in');
        setTimeout(() => {
            fetch(`${page}.html`)
                .then(response => response.text())
                .then(data => {
                    mainContent.innerHTML = data;
                    setTimeout(() => {
                        mainContent.classList.add('fade-in');
                        window.scrollTo(0, 0);
                    }, 40);
                })
                .catch(error => {
                    console.log('Error loading page:', error);
                });
        }, 200);
    }

    function setActiveLink(link) {
        navLinks.forEach(navLink => {
            navLink.classList.remove('active');
        });
        link.classList.add('active');
    }

    loadPage('bio');
    setActiveLink(document.querySelector('.nav-link[data-page="bio"]'));
});