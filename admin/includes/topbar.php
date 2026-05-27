<div class="admin-topbar">

    <div class="topbar-account">

        <div class="topbar-account-icon">
            <i class="bi bi-person"></i>
        </div>

        <div class="topbar-account-name">
            Halo, <?= htmlspecialchars($_SESSION['nama'] ?? 'Administrator'); ?>
        </div>

        <div class="topbar-account-menu">

            <button type="button" class="topbar-account-btn" onclick="toggleAccountDropdown(event)">
                <i class="bi bi-chevron-down"></i>
            </button>

            <div class="topbar-account-dropdown" id="topbarAccountDropdown">

                <div class="account-dropdown-profile">

                    <div class="account-dropdown-avatar">
                        <i class="bi bi-person"></i>
                    </div>

                    <div>
                        <strong>
                            <?= htmlspecialchars($_SESSION['nama'] ?? 'Administrator'); ?>
                        </strong>

                        <small>
                            <?= htmlspecialchars($_SESSION['username'] ?? 'admin'); ?>
                        </small>
                    </div>

                </div>

                <div class="account-dropdown-line"></div>

                <a href="/admin/logout.php">
                    <i class="bi bi-arrow-repeat"></i>
                    Ganti Akun
                </a>

                <a href="/admin/logout.php">
                    <i class="bi bi-box-arrow-right"></i>
                    Logout
                </a>

            </div>

        </div>

    </div>

</div>