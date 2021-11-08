Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A96449960
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 17:20:05 +0100 (CET)
Received: from localhost ([::1]:47640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk7NM-0003ja-6g
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 11:20:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mk7LH-0001Te-FW
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 11:17:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mk7LA-0000mx-6p
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 11:17:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636388266;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=f5ukpUfvSlPmPrZsBG1k7wuX6CY/TkRDOXPTKfgeodw=;
 b=TONfni2bF1hvth3Oeo6ptE4e/Q2SFpXYpOiK7fHDLTy8ByfP5q/+TKqNB2TEKXV+tXUIwC
 GmVlxqpvTnMmMw66HoZUfTLxbmWYDqRL3Npluw9fvomMyOLdQ2Z/hzce/FLekpF3VMfc4N
 8tar5zMFJs9b1SnzDZiKPAugd/kb9O8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-jrrYJNWKOa2P3qP-Jyp3QQ-1; Mon, 08 Nov 2021 11:17:43 -0500
X-MC-Unique: jrrYJNWKOa2P3qP-Jyp3QQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 l6-20020a05600c4f0600b0033321934a39so60279wmq.9
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 08:17:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SKVJgAxH4RQUDdrDYGUAqi4lbT7WttMNMJEJpYxN0UQ=;
 b=Tieq9b+I8DVrXP5RKyKyLX7BBQBalei0aPTYIv8QMZ+7T3Q5uF3dEDYIY5XXdEgG7d
 eE0UD3loaYm1gyPunT/E2NKU3vT1MSH0oG08vDwb9MCzF+Ef1eymNeLopCaFOoQTkV1S
 K3GrXelq8xUWLiBh74iWhELhsU3nY5ac8I7RAoiMQr/VoWu4VHUNoyEGBvBoPF9LR5Q3
 hIFwO9V4WtLVrfzrJNiPHlWtBIQAIYNFktsi95huGnWfxARVTpGtUBNkRBcweFNEQ0Vo
 D4hXZacJIa8fsMSy+xE3gpKjlPuS8JYE1F6mK/IHPXCQSxOkBfT318A2f5k0gvFY+E63
 Pekg==
X-Gm-Message-State: AOAM531NjdGeB2NQnCul+t+GGLVHFdbm/9ZW1p9Dk6HEFirYQTjWmZQt
 ekUDdFE+OLUmiY2xabH2N4qq5+VYiKqj2PHJJ1aX3Ww5kK1+QGydM50MwsAH+FxcLkxJ7aqd2CH
 /8k+VMf6ejF2LMLSnJAXyexf3aS4K1neriO09gLwLoiaXtU9NDx95ro481hPzCBF6
X-Received: by 2002:a1c:4d15:: with SMTP id o21mr34950783wmh.171.1636388262366; 
 Mon, 08 Nov 2021 08:17:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdO5x+tAafXvZwTlWUp4tUmYLiHW0YEa1IUUjP0ekniWMW7RcgNlep1HehDepxTqABtEu9zg==
X-Received: by 2002:a1c:4d15:: with SMTP id o21mr34950740wmh.171.1636388262007; 
 Mon, 08 Nov 2021 08:17:42 -0800 (PST)
Received: from x1w.. (46.red-193-152-127.dynamicip.rima-tde.net.
 [193.152.127.46])
 by smtp.gmail.com with ESMTPSA id z6sm20415181wmp.1.2021.11.08.08.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 08:17:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/9] Integration testing patches for 2021-11-08
Date: Mon,  8 Nov 2021 17:17:30 +0100
Message-Id: <20211108161739.1371503-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 260f9210d2ce892c5e162a45b0e5ec0036bedc79=
:=0D
=0D
  Merge remote-tracking branch 'remotes/marcandre.lureau/tags/sphinx-pull-r=
equest' into staging (2021-11-08 14:56:10 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/philmd/qemu.git tags/avocado-20211108=0D
=0D
for you to fetch changes up to b94d00898a9ee708b4d4b79432c2272905a56b06:=0D
=0D
  tests/avocado: Remove p7zip binary availability check (2021-11-08 17:00:2=
2 +0100)=0D
=0D
----------------------------------------------------------------=0D
Integration testing patches=0D
=0D
- Rename tests/acceptance/ -> tests/avocado/=0D
- Rename avocado_qemu.Test -> avocado_qemu.QemuSystemTest=0D
- Introduce QemuUserTest class=0D
- Add the first linux-user test, covering the bFLT loader=0D
=0D
----------------------------------------------------------------=0D
=0D
Philippe Mathieu-Daud=C3=A9 (7):=0D
  tests/avocado: Extract QemuBaseTest from Test=0D
  tests/avocado: Make pick_default_qemu_bin() more generic=0D
  tests/avocado: Introduce QemuUserTest base class=0D
  tests/avocado: Share useful helpers from virtiofs_submounts test=0D
  tests/avocado: Add bFLT loader linux-user test=0D
  tests/avocado: Rename avocado_qemu.Test -> QemuSystemTest=0D
  tests/avocado: Remove p7zip binary availability check=0D
=0D
Willian Rampazzo (2):=0D
  tests/acceptance: introduce new check-avocado target=0D
  tests/acceptance: rename tests acceptance to tests avocado=0D
=0D
 docs/devel/build-system.rst                   |   2 +-=0D
 docs/devel/ci-definitions.rst.inc             |   2 +-=0D
 docs/devel/testing.rst                        |  57 +++---=0D
 docs/system/arm/orangepi.rst                  |   8 +-=0D
 python/qemu/machine/README.rst                |   2 +-=0D
 python/qemu/qmp/README.rst                    |   2 +-=0D
 python/qemu/utils/README.rst                  |   2 +-=0D
 tests/acceptance/README.rst                   |  10 --=0D
 tests/avocado/README.rst                      |  10 ++=0D
 configure                                     |   2 +-=0D
 .gitlab-ci.d/buildtest-template.yml           |   2 +-=0D
 .gitlab-ci.d/buildtest.yml                    |  56 +++---=0D
 MAINTAINERS                                   |  52 +++---=0D
 tests/Makefile.include                        |  21 ++-=0D
 .../avocado_qemu/__init__.py                  | 163 +++++++++++++-----=0D
 tests/{acceptance =3D> avocado}/boot_linux.py   |   0=0D
 .../boot_linux_console.py                     |  11 +-=0D
 tests/{acceptance =3D> avocado}/boot_xen.py     |   0=0D
 tests/{acceptance =3D> avocado}/cpu_queries.py  |   4 +-=0D
 .../empty_cpu_model.py                        |   4 +-=0D
 tests/{acceptance =3D> avocado}/hotplug_cpu.py  |   0=0D
 tests/{acceptance =3D> avocado}/info_usernet.py |   4 +-=0D
 tests/{acceptance =3D> avocado}/intel_iommu.py  |   0=0D
 tests/{acceptance =3D> avocado}/linux_initrd.py |   6 +-=0D
 .../linux_ssh_mips_malta.py                   |   5 +-=0D
 tests/avocado/load_bflt.py                    |  54 ++++++=0D
 .../machine_arm_canona1100.py                 |   4 +-=0D
 .../machine_arm_integratorcp.py               |   4 +-=0D
 .../machine_arm_n8x0.py                       |   4 +-=0D
 tests/{acceptance =3D> avocado}/machine_avr6.py |   6 +-=0D
 .../machine_m68k_nextcube.py                  |   4 +-=0D
 .../machine_microblaze.py                     |   4 +-=0D
 .../machine_mips_fuloong2e.py                 |   4 +-=0D
 .../machine_mips_loongson3v.py                |   4 +-=0D
 .../machine_mips_malta.py                     |   4 +-=0D
 .../machine_rx_gdbsim.py                      |   4 +-=0D
 .../machine_s390_ccw_virtio.py                |   4 +-=0D
 .../machine_sparc64_sun4u.py                  |   0=0D
 .../machine_sparc_leon3.py                    |   4 +-=0D
 tests/{acceptance =3D> avocado}/migration.py    |   4 +-=0D
 tests/{acceptance =3D> avocado}/multiprocess.py |   4 +-=0D
 .../pc_cpu_hotplug_props.py                   |   4 +-=0D
 tests/{acceptance =3D> avocado}/ppc_405.py      |   4 +-=0D
 tests/{acceptance =3D> avocado}/ppc_bamboo.py   |   4 +-=0D
 .../{acceptance =3D> avocado}/ppc_mpc8544ds.py  |   4 +-=0D
 tests/{acceptance =3D> avocado}/ppc_prep_40p.py |   4 +-=0D
 tests/{acceptance =3D> avocado}/ppc_pseries.py  |   4 +-=0D
 .../ppc_virtex_ml507.py                       |   4 +-=0D
 .../{acceptance =3D> avocado}/replay_kernel.py  |   0=0D
 tests/{acceptance =3D> avocado}/replay_linux.py |   0=0D
 .../reverse_debugging.py                      |   0=0D
 tests/{acceptance =3D> avocado}/smmu.py         |   0=0D
 tests/{acceptance =3D> avocado}/tcg_plugins.py  |   0=0D
 .../tesseract_utils.py                        |   0=0D
 tests/{acceptance =3D> avocado}/version.py      |   4 +-=0D
 tests/{acceptance =3D> avocado}/virtio-gpu.py   |   4 +-=0D
 .../virtio_check_params.py                    |   4 +-=0D
 .../{acceptance =3D> avocado}/virtio_version.py |   4 +-=0D
 .../virtiofs_submounts.py                     |  59 +------=0D
 .../virtiofs_submounts.py.data/cleanup.sh     |   0=0D
 .../guest-cleanup.sh                          |   0=0D
 .../virtiofs_submounts.py.data/guest.sh       |   0=0D
 .../virtiofs_submounts.py.data/host.sh        |   0=0D
 tests/{acceptance =3D> avocado}/vnc.py          |   4 +-=0D
 .../x86_cpu_model_versions.py                 |   4 +-=0D
 65 files changed, 364 insertions(+), 284 deletions(-)=0D
 delete mode 100644 tests/acceptance/README.rst=0D
 create mode 100644 tests/avocado/README.rst=0D
 rename tests/{acceptance =3D> avocado}/avocado_qemu/__init__.py (87%)=0D
 rename tests/{acceptance =3D> avocado}/boot_linux.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/boot_linux_console.py (99%)=0D
 rename tests/{acceptance =3D> avocado}/boot_xen.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/cpu_queries.py (91%)=0D
 rename tests/{acceptance =3D> avocado}/empty_cpu_model.py (88%)=0D
 rename tests/{acceptance =3D> avocado}/hotplug_cpu.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/info_usernet.py (92%)=0D
 rename tests/{acceptance =3D> avocado}/intel_iommu.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/linux_initrd.py (96%)=0D
 rename tests/{acceptance =3D> avocado}/linux_ssh_mips_malta.py (98%)=0D
 create mode 100644 tests/avocado/load_bflt.py=0D
 rename tests/{acceptance =3D> avocado}/machine_arm_canona1100.py (93%)=0D
 rename tests/{acceptance =3D> avocado}/machine_arm_integratorcp.py (97%)=
=0D
 rename tests/{acceptance =3D> avocado}/machine_arm_n8x0.py (95%)=0D
 rename tests/{acceptance =3D> avocado}/machine_avr6.py (94%)=0D
 rename tests/{acceptance =3D> avocado}/machine_m68k_nextcube.py (97%)=0D
 rename tests/{acceptance =3D> avocado}/machine_microblaze.py (94%)=0D
 rename tests/{acceptance =3D> avocado}/machine_mips_fuloong2e.py (95%)=0D
 rename tests/{acceptance =3D> avocado}/machine_mips_loongson3v.py (94%)=0D
 rename tests/{acceptance =3D> avocado}/machine_mips_malta.py (98%)=0D
 rename tests/{acceptance =3D> avocado}/machine_rx_gdbsim.py (97%)=0D
 rename tests/{acceptance =3D> avocado}/machine_s390_ccw_virtio.py (99%)=0D
 rename tests/{acceptance =3D> avocado}/machine_sparc64_sun4u.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/machine_sparc_leon3.py (94%)=0D
 rename tests/{acceptance =3D> avocado}/migration.py (97%)=0D
 rename tests/{acceptance =3D> avocado}/multiprocess.py (98%)=0D
 rename tests/{acceptance =3D> avocado}/pc_cpu_hotplug_props.py (93%)=0D
 rename tests/{acceptance =3D> avocado}/ppc_405.py (94%)=0D
 rename tests/{acceptance =3D> avocado}/ppc_bamboo.py (95%)=0D
 rename tests/{acceptance =3D> avocado}/ppc_mpc8544ds.py (93%)=0D
 rename tests/{acceptance =3D> avocado}/ppc_prep_40p.py (97%)=0D
 rename tests/{acceptance =3D> avocado}/ppc_pseries.py (94%)=0D
 rename tests/{acceptance =3D> avocado}/ppc_virtex_ml507.py (93%)=0D
 rename tests/{acceptance =3D> avocado}/replay_kernel.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/replay_linux.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/reverse_debugging.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/smmu.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/tcg_plugins.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/tesseract_utils.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/version.py (88%)=0D
 rename tests/{acceptance =3D> avocado}/virtio-gpu.py (98%)=0D
 rename tests/{acceptance =3D> avocado}/virtio_check_params.py (98%)=0D
 rename tests/{acceptance =3D> avocado}/virtio_version.py (98%)=0D
 rename tests/{acceptance =3D> avocado}/virtiofs_submounts.py (82%)=0D
 rename tests/{acceptance =3D> avocado}/virtiofs_submounts.py.data/cleanup.=
sh (100%)=0D
 rename tests/{acceptance =3D> avocado}/virtiofs_submounts.py.data/guest-cl=
eanup.sh (100%)=0D
 rename tests/{acceptance =3D> avocado}/virtiofs_submounts.py.data/guest.sh=
 (100%)=0D
 rename tests/{acceptance =3D> avocado}/virtiofs_submounts.py.data/host.sh =
(100%)=0D
 rename tests/{acceptance =3D> avocado}/vnc.py (96%)=0D
 rename tests/{acceptance =3D> avocado}/x86_cpu_model_versions.py (99%)=0D
=0D
--=20=0D
2.31.1=0D
=0D


