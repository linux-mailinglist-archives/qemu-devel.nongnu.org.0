Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BAD38B7E4
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 21:56:18 +0200 (CEST)
Received: from localhost ([::1]:54520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljomH-0000c8-0P
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 15:56:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1ljojt-0006ge-9e
 for qemu-devel@nongnu.org; Thu, 20 May 2021 15:53:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1ljojj-0001lL-TI
 for qemu-devel@nongnu.org; Thu, 20 May 2021 15:53:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621540418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hsXdu6a0CKxnojfoZgwlJU9LIBqqP75G/U6o2y2NmyE=;
 b=Pc0iw7LRDgpdsaJLCiA51oRHjQPnvCQoKjNLuTIEajpLfbgaP+cUrm7NqHrMnrwPmPcTMB
 T+xhPxD3+6DzkZy6ZHFCwrQCzBFWxCxDRUiNnLG8jkILlTZfOnWTxMyY9r5uaT6xtNVnl2
 bvtU4v5GQAevP5FOwZSAzCttDxa7WCo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-fu9K8OoANte9oC5uOt_-wg-1; Thu, 20 May 2021 15:53:34 -0400
X-MC-Unique: fu9K8OoANte9oC5uOt_-wg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E1C81005D50;
 Thu, 20 May 2021 19:53:33 +0000 (UTC)
Received: from wrampazz.redhat.com (ovpn-113-104.rdu2.redhat.com
 [10.10.113.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 54FB45D74B;
 Thu, 20 May 2021 19:53:24 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC 0/1] acceptance tests: rename acceptance to system
Date: Thu, 20 May 2021 16:53:21 -0300
Message-Id: <20210520195322.205691-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=willianr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=willianr@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CI pipeline: https://gitlab.com/willianrampazzo/qemu/-/pipelines/306850452=
=0D
=0D
Conceptually speaking, acceptance tests "are a series of specific tests=0D
conducted by the customer in an attempt to uncover product errors before=0D
accepting the software from the developer. Conducted by the end-user rather=
=0D
than software engineers, acceptance testing can range from an informal=0D
=E2=80=9Ctest drive=E2=80=9D to a planned and systematically executed serie=
s of scripted=0D
tests" [1]. Every time Pressman refers to the term "acceptance testing," he=
=0D
also refers to user's agreement in the final state of an implemented featur=
e.=0D
Today, QEMU is not implementing user acceptance tests as described by Press=
man.=0D
=0D
There are other three possible terms we could use to describe what is curre=
ntly=0D
QEMU "acceptance" tests:=0D
=0D
  1 - Integration tests:=0D
      - "Integration testing is a systematic technique for constructing the=
=0D
         software architecture while at the same time conducting tests to=
=0D
         uncover errors associated with interfacing. The objective is to ta=
ke=0D
         unit-tested components and build a program structure that has been=
=0D
         dictated by design." [2]=0D
      * Note: Sommerville does not have a clear definition of integration=
=0D
        testing. He refers to incremental integration of components inside=
=0D
        the system testing (see [3]).=0D
=0D
  2 - Validation tests:=0D
      - "Validation testing begins at the culmination of integration testin=
g,=0D
         when individual components have been exercised, the software is=0D
         completely assembled as a package, and interfacing errors have bee=
n=0D
         uncovered and corrected. At the validation or system level, the=0D
         distinction between different software categories disappears. Test=
ing=0D
         focuses on user-visible actions and user-recognizable output from =
the=0D
         system." [4]=0D
      - "where you expect the system to perform correctly using a set of te=
st=0D
         cases that reflect the system=E2=80=99s expected use." [5]=0D
      * Note: the definition of "validation testing" from Sommerville refle=
cts=0D
        the same definition found around the Internet, as one of the proces=
ses=0D
        inside the "Verification & Validation (V&V)." In this concept,=0D
        validation testing is a high-level definition that covers unit test=
ing,=0D
        functional testing, integration testing, system testing, and accept=
ance=0D
        testing.=0D
=0D
  3 - System tests:=0D
      - "verifies that all elements mesh properly and that overall system=
=0D
         function and performance is achieved." [6]=0D
      - "involves integrating components to create a version of the system =
and=0D
         then testing the integrated system. System testing checks that=0D
         components are compatible, interact correctly, and transfer the ri=
ght=0D
         data at the right time across their interfaces." [7]=0D
=0D
The tests implemented inside the QEMU "acceptance" directory depend on the=
=0D
software completely assembled and, sometimes, on other elements, like opera=
ting=0D
system images. In this case, the proposal here is to rename the current=0D
"acceptance" directory to "system."=0D
=0D
[1] Pressman, Roger S. & Maxim, Bruce R. (2020). Software Engineering, A=0D
    Practitioner=E2=80=99s Approach. p. 430.=0D
[2] Pressman, Roger S. & Maxim, Bruce R. (2020). Software Engineering, A=0D
    Practitioner=E2=80=99s Approach. Software Engineering, p. 398.=0D
[3] Sommerville, Ian (2016). Software Engineering. p. 240-242.=0D
[4] Pressman, Roger S. & Maxim, Bruce R. (2020). Software Engineering, A=0D
    Practitioner=E2=80=99s Approach. Software Engineering, p. 407.=0D
[5] Sommerville, Ian (2016). Software Engineering. p. 227.=0D
[6] Pressman, Roger S. & Maxim, Bruce R. (2020). Software Engineering, A=0D
    Practitioner=E2=80=99s Approach. Software Engineering, p. 377.=0D
[7] Sommerville, Ian (2016). Software Engineering. p. 240.=0D
=0D
Signed-off-by: Willian Rampazzo <willianr@redhat.com>=0D
=0D
Willian Rampazzo (1):=0D
  acceptance tests: rename acceptance to system=0D
=0D
 .gitlab-ci.yml                                | 58 +++++++++----------=0D
 MAINTAINERS                                   | 40 ++++++-------=0D
 configure                                     |  2 +-=0D
 docs/devel/build-system.rst                   |  2 +-=0D
 docs/devel/testing.rst                        | 23 ++++----=0D
 docs/system/arm/orangepi.rst                  |  8 +--=0D
 tests/Makefile.include                        | 14 ++---=0D
 tests/acceptance/README.rst                   | 10 ----=0D
 tests/system/README.rst                       | 10 ++++=0D
 .../avocado_qemu/__init__.py                  |  2 +-=0D
 tests/{acceptance =3D> system}/boot_linux.py    |  0=0D
 .../boot_linux_console.py                     |  0=0D
 tests/{acceptance =3D> system}/boot_xen.py      |  0=0D
 tests/{acceptance =3D> system}/cpu_queries.py   |  0=0D
 .../{acceptance =3D> system}/empty_cpu_model.py |  0=0D
 tests/{acceptance =3D> system}/linux_initrd.py  |  2 +-=0D
 .../linux_ssh_mips_malta.py                   |  0=0D
 .../machine_arm_canona1100.py                 |  0=0D
 .../machine_arm_integratorcp.py               |  0=0D
 .../machine_arm_n8x0.py                       |  0=0D
 tests/{acceptance =3D> system}/machine_avr6.py  |  2 +-=0D
 .../machine_m68k_nextcube.py                  |  0=0D
 .../machine_microblaze.py                     |  0=0D
 .../machine_mips_loongson3v.py                |  0=0D
 .../machine_mips_malta.py                     |  0=0D
 tests/{acceptance =3D> system}/machine_ppc.py   |  0=0D
 .../machine_rx_gdbsim.py                      |  0=0D
 .../machine_s390_ccw_virtio.py                |  0=0D
 .../machine_sparc64_sun4u.py                  |  0=0D
 .../machine_sparc_leon3.py                    |  0=0D
 tests/{acceptance =3D> system}/migration.py     |  0=0D
 tests/{acceptance =3D> system}/multiprocess.py  |  0=0D
 .../pc_cpu_hotplug_props.py                   |  0=0D
 tests/{acceptance =3D> system}/ppc_prep_40p.py  |  0=0D
 tests/{acceptance =3D> system}/replay_kernel.py |  0=0D
 .../reverse_debugging.py                      |  0=0D
 tests/{acceptance =3D> system}/tcg_plugins.py   |  0=0D
 .../{acceptance =3D> system}/tesseract_utils.py |  0=0D
 tests/{acceptance =3D> system}/version.py       |  0=0D
 tests/{acceptance =3D> system}/virtio-gpu.py    |  0=0D
 .../virtio_check_params.py                    |  0=0D
 .../{acceptance =3D> system}/virtio_version.py  |  0=0D
 .../virtiofs_submounts.py                     |  0=0D
 .../virtiofs_submounts.py.data/cleanup.sh     |  0=0D
 .../guest-cleanup.sh                          |  0=0D
 .../virtiofs_submounts.py.data/guest.sh       |  0=0D
 .../virtiofs_submounts.py.data/host.sh        |  0=0D
 tests/{acceptance =3D> system}/vnc.py           |  0=0D
 .../x86_cpu_model_versions.py                 |  0=0D
 49 files changed, 86 insertions(+), 87 deletions(-)=0D
 delete mode 100644 tests/acceptance/README.rst=0D
 create mode 100644 tests/system/README.rst=0D
 rename tests/{acceptance =3D> system}/avocado_qemu/__init__.py (99%)=0D
 rename tests/{acceptance =3D> system}/boot_linux.py (100%)=0D
 rename tests/{acceptance =3D> system}/boot_linux_console.py (100%)=0D
 rename tests/{acceptance =3D> system}/boot_xen.py (100%)=0D
 rename tests/{acceptance =3D> system}/cpu_queries.py (100%)=0D
 rename tests/{acceptance =3D> system}/empty_cpu_model.py (100%)=0D
 rename tests/{acceptance =3D> system}/linux_initrd.py (99%)=0D
 rename tests/{acceptance =3D> system}/linux_ssh_mips_malta.py (100%)=0D
 rename tests/{acceptance =3D> system}/machine_arm_canona1100.py (100%)=0D
 rename tests/{acceptance =3D> system}/machine_arm_integratorcp.py (100%)=
=0D
 rename tests/{acceptance =3D> system}/machine_arm_n8x0.py (100%)=0D
 rename tests/{acceptance =3D> system}/machine_avr6.py (98%)=0D
 rename tests/{acceptance =3D> system}/machine_m68k_nextcube.py (100%)=0D
 rename tests/{acceptance =3D> system}/machine_microblaze.py (100%)=0D
 rename tests/{acceptance =3D> system}/machine_mips_loongson3v.py (100%)=0D
 rename tests/{acceptance =3D> system}/machine_mips_malta.py (100%)=0D
 rename tests/{acceptance =3D> system}/machine_ppc.py (100%)=0D
 rename tests/{acceptance =3D> system}/machine_rx_gdbsim.py (100%)=0D
 rename tests/{acceptance =3D> system}/machine_s390_ccw_virtio.py (100%)=0D
 rename tests/{acceptance =3D> system}/machine_sparc64_sun4u.py (100%)=0D
 rename tests/{acceptance =3D> system}/machine_sparc_leon3.py (100%)=0D
 rename tests/{acceptance =3D> system}/migration.py (100%)=0D
 rename tests/{acceptance =3D> system}/multiprocess.py (100%)=0D
 rename tests/{acceptance =3D> system}/pc_cpu_hotplug_props.py (100%)=0D
 rename tests/{acceptance =3D> system}/ppc_prep_40p.py (100%)=0D
 rename tests/{acceptance =3D> system}/replay_kernel.py (100%)=0D
 rename tests/{acceptance =3D> system}/reverse_debugging.py (100%)=0D
 rename tests/{acceptance =3D> system}/tcg_plugins.py (100%)=0D
 rename tests/{acceptance =3D> system}/tesseract_utils.py (100%)=0D
 rename tests/{acceptance =3D> system}/version.py (100%)=0D
 rename tests/{acceptance =3D> system}/virtio-gpu.py (100%)=0D
 rename tests/{acceptance =3D> system}/virtio_check_params.py (100%)=0D
 rename tests/{acceptance =3D> system}/virtio_version.py (100%)=0D
 rename tests/{acceptance =3D> system}/virtiofs_submounts.py (100%)=0D
 rename tests/{acceptance =3D> system}/virtiofs_submounts.py.data/cleanup.s=
h (100%)=0D
 rename tests/{acceptance =3D> system}/virtiofs_submounts.py.data/guest-cle=
anup.sh (100%)=0D
 rename tests/{acceptance =3D> system}/virtiofs_submounts.py.data/guest.sh =
(100%)=0D
 rename tests/{acceptance =3D> system}/virtiofs_submounts.py.data/host.sh (=
100%)=0D
 rename tests/{acceptance =3D> system}/vnc.py (100%)=0D
 rename tests/{acceptance =3D> system}/x86_cpu_model_versions.py (100%)=0D
=0D
--=20=0D
2.31.1=0D
=0D


