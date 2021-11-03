Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A0D444A1C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 22:16:54 +0100 (CET)
Received: from localhost ([::1]:38672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miNcq-0000Wc-O5
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 17:16:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1miNaa-0007BQ-RI
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 17:14:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1miNaX-0005gm-JZ
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 17:14:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635974068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sypTH/q3+9Sj28HG6C7L1YzN4Gyw80kyIaopKB96lrg=;
 b=RRwoOhjiixymMwAxZcMz9W4AXjADROZsGpK3Cmz5rNSaukrMUmCNKd9fvSgk4r/kn9r9kR
 tcmZOmBZ1KsPunDMCVilliRrJ0rsE+w7Gpq4YsypRMH3Exh6KwiL+M2UKdxc+dJL/4s2a4
 +mZAbmzBg3n5VozBiSaSXzwfrUE2Yfg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-OIcRGI_wMsqloCtSwDRbpw-1; Wed, 03 Nov 2021 17:14:25 -0400
X-MC-Unique: OIcRGI_wMsqloCtSwDRbpw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11CA587D541;
 Wed,  3 Nov 2021 21:14:24 +0000 (UTC)
Received: from wrampazz.redhat.com (unknown [10.22.18.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 020285D9DE;
 Wed,  3 Nov 2021 21:14:05 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] tests/acceptance: rename tests acceptance to tests avocado
Date: Wed,  3 Nov 2021 18:14:03 -0300
Message-Id: <20211103211404.79953-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=willianr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=willianr@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the discussion about renaming the `tests/acceptance` [1], the=0D
conclusion was that the folders inside `tests` are related to the=0D
framework running the tests and not directly related to the type of=0D
the tests.=0D
=0D
This changes the folder to `tests/avocado` and adjusts the MAKEFILE, the=0D
CI related files and the documentation.=0D
=0D
[1] https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg06553.html=0D
=0D
GitLab pipeline with new naming: https://gitlab.com/willianrampazzo/qemu/-/=
pipelines/401431592=0D
Signed-off-by: Willian Rampazzo <willianr@redhat.com>=0D
=0D
Willian Rampazzo (1):=0D
  tests/acceptance: rename tests acceptance to tests avocado=0D
=0D
 .gitlab-ci.d/buildtest-template.yml           |  2 +-=0D
 .gitlab-ci.d/buildtest.yml                    | 56 +++++++++----------=0D
 MAINTAINERS                                   | 52 ++++++++---------=0D
 configure                                     |  2 +-=0D
 docs/devel/build-system.rst                   |  2 +-=0D
 docs/devel/ci-definitions.rst.inc             |  2 +-=0D
 docs/devel/testing.rst                        | 49 ++++++++--------=0D
 docs/system/arm/orangepi.rst                  |  8 +--=0D
 python/qemu/machine/README.rst                |  2 +-=0D
 python/qemu/qmp/README.rst                    |  2 +-=0D
 python/qemu/utils/README.rst                  |  2 +-=0D
 tests/Makefile.include                        | 14 ++---=0D
 tests/acceptance/README.rst                   | 10 ----=0D
 tests/avocado/README.rst                      | 10 ++++=0D
 .../avocado_qemu/__init__.py                  |  2 +-=0D
 tests/{acceptance =3D> avocado}/boot_linux.py   |  0=0D
 .../boot_linux_console.py                     |  0=0D
 tests/{acceptance =3D> avocado}/boot_xen.py     |  0=0D
 tests/{acceptance =3D> avocado}/cpu_queries.py  |  0=0D
 .../empty_cpu_model.py                        |  0=0D
 tests/{acceptance =3D> avocado}/hotplug_cpu.py  |  0=0D
 tests/{acceptance =3D> avocado}/info_usernet.py |  0=0D
 tests/{acceptance =3D> avocado}/intel_iommu.py  |  0=0D
 tests/{acceptance =3D> avocado}/linux_initrd.py |  2 +-=0D
 .../linux_ssh_mips_malta.py                   |  0=0D
 .../machine_arm_canona1100.py                 |  0=0D
 .../machine_arm_integratorcp.py               |  0=0D
 .../machine_arm_n8x0.py                       |  0=0D
 tests/{acceptance =3D> avocado}/machine_avr6.py |  2 +-=0D
 .../machine_m68k_nextcube.py                  |  0=0D
 .../machine_microblaze.py                     |  0=0D
 .../machine_mips_fuloong2e.py                 |  0=0D
 .../machine_mips_loongson3v.py                |  0=0D
 .../machine_mips_malta.py                     |  0=0D
 .../machine_rx_gdbsim.py                      |  0=0D
 .../machine_s390_ccw_virtio.py                |  0=0D
 .../machine_sparc64_sun4u.py                  |  0=0D
 .../machine_sparc_leon3.py                    |  0=0D
 tests/{acceptance =3D> avocado}/migration.py    |  0=0D
 tests/{acceptance =3D> avocado}/multiprocess.py |  0=0D
 .../pc_cpu_hotplug_props.py                   |  0=0D
 tests/{acceptance =3D> avocado}/ppc_405.py      |  0=0D
 tests/{acceptance =3D> avocado}/ppc_bamboo.py   |  0=0D
 .../{acceptance =3D> avocado}/ppc_mpc8544ds.py  |  0=0D
 tests/{acceptance =3D> avocado}/ppc_prep_40p.py | 12 ++--=0D
 tests/{acceptance =3D> avocado}/ppc_pseries.py  |  0=0D
 .../ppc_virtex_ml507.py                       |  0=0D
 .../{acceptance =3D> avocado}/replay_kernel.py  |  0=0D
 tests/{acceptance =3D> avocado}/replay_linux.py |  0=0D
 .../reverse_debugging.py                      |  0=0D
 tests/{acceptance =3D> avocado}/smmu.py         |  0=0D
 tests/{acceptance =3D> avocado}/tcg_plugins.py  |  0=0D
 .../tesseract_utils.py                        |  0=0D
 tests/{acceptance =3D> avocado}/version.py      |  0=0D
 tests/{acceptance =3D> avocado}/virtio-gpu.py   |  0=0D
 .../virtio_check_params.py                    |  0=0D
 .../{acceptance =3D> avocado}/virtio_version.py |  0=0D
 .../virtiofs_submounts.py                     |  0=0D
 .../virtiofs_submounts.py.data/cleanup.sh     |  0=0D
 .../guest-cleanup.sh                          |  0=0D
 .../virtiofs_submounts.py.data/guest.sh       |  0=0D
 .../virtiofs_submounts.py.data/host.sh        |  0=0D
 tests/{acceptance =3D> avocado}/vnc.py          |  0=0D
 .../x86_cpu_model_versions.py                 |  0=0D
 64 files changed, 113 insertions(+), 118 deletions(-)=0D
 delete mode 100644 tests/acceptance/README.rst=0D
 create mode 100644 tests/avocado/README.rst=0D
 rename tests/{acceptance =3D> avocado}/avocado_qemu/__init__.py (99%)=0D
 rename tests/{acceptance =3D> avocado}/boot_linux.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/boot_linux_console.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/boot_xen.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/cpu_queries.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/empty_cpu_model.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/hotplug_cpu.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/info_usernet.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/intel_iommu.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/linux_initrd.py (99%)=0D
 rename tests/{acceptance =3D> avocado}/linux_ssh_mips_malta.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/machine_arm_canona1100.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/machine_arm_integratorcp.py (100%)=
=0D
 rename tests/{acceptance =3D> avocado}/machine_arm_n8x0.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/machine_avr6.py (98%)=0D
 rename tests/{acceptance =3D> avocado}/machine_m68k_nextcube.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/machine_microblaze.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/machine_mips_fuloong2e.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/machine_mips_loongson3v.py (100%)=
=0D
 rename tests/{acceptance =3D> avocado}/machine_mips_malta.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/machine_rx_gdbsim.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/machine_s390_ccw_virtio.py (100%)=
=0D
 rename tests/{acceptance =3D> avocado}/machine_sparc64_sun4u.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/machine_sparc_leon3.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/migration.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/multiprocess.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/pc_cpu_hotplug_props.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/ppc_405.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/ppc_bamboo.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/ppc_mpc8544ds.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/ppc_prep_40p.py (92%)=0D
 rename tests/{acceptance =3D> avocado}/ppc_pseries.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/ppc_virtex_ml507.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/replay_kernel.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/replay_linux.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/reverse_debugging.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/smmu.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/tcg_plugins.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/tesseract_utils.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/version.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/virtio-gpu.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/virtio_check_params.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/virtio_version.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/virtiofs_submounts.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/virtiofs_submounts.py.data/cleanup.=
sh (100%)=0D
 rename tests/{acceptance =3D> avocado}/virtiofs_submounts.py.data/guest-cl=
eanup.sh (100%)=0D
 rename tests/{acceptance =3D> avocado}/virtiofs_submounts.py.data/guest.sh=
 (100%)=0D
 rename tests/{acceptance =3D> avocado}/virtiofs_submounts.py.data/host.sh =
(100%)=0D
 rename tests/{acceptance =3D> avocado}/vnc.py (100%)=0D
 rename tests/{acceptance =3D> avocado}/x86_cpu_model_versions.py (100%)=0D
=0D
--=20=0D
2.33.1=0D
=0D


