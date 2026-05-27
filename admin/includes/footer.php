</div>

<script>
function toggleAccountDropdown(event) {
    event.stopPropagation();

    const menu = document.getElementById('topbarAccountDropdown');

    if (menu) {
        menu.classList.toggle('show');
    }
}

document.addEventListener('click', function(event) {
    const accountMenu = document.querySelector('.topbar-account-menu');
    const dropdown = document.getElementById('topbarAccountDropdown');

    if (accountMenu && dropdown && !accountMenu.contains(event.target)) {
        dropdown.classList.remove('show');
    }
});
</script>

</body>
</html>