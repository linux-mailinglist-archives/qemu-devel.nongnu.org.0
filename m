Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C05756AC100
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 14:31:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZAvN-0002K2-Li; Mon, 06 Mar 2023 08:30:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZAup-0002D4-Ab
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:30:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZAuk-0007Qd-Nl
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:30:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678109406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YD/2xAVdvNh3GDjefnOF1kDE08ljDBS1wY6GgQ0LnrI=;
 b=c7KPeh4T/uWztt9TyIsIfU55efrPtYyYOR21n6pM2bwB8HHVKeO6brp0GQRe892utyzghL
 ZtTnUMCRKF5XKgKoaWBvsXB/HU8DL34uDu04niTCh0sfNlXEIHbA0uV4+n1aQrttjE0dh7
 bz910hopO400VMA/IWaPGjQrTm/cfxw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-182-pn2Kb7ubO9Krucc3SDQaJQ-1; Mon, 06 Mar 2023 08:30:04 -0500
X-MC-Unique: pn2Kb7ubO9Krucc3SDQaJQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C0C438149A3;
 Mon,  6 Mar 2023 13:30:04 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9191240C10FA;
 Mon,  6 Mar 2023 13:30:03 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/16] Final tests,
 s390x and misc updates before the soft freeze
Date: Mon,  6 Mar 2023 14:29:46 +0100
Message-Id: <20230306133002.418421-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

 Hi Peter!

The following changes since commit 2946e1af2704bf6584f57d4e3aec49d1d5f3ecc0:

  configure: Disable thread-safety warnings on macOS (2023-03-04 14:03:46 +0000)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2023-03-06

for you to fetch changes up to cb161e95334dd9ba6835dbe8a8a60a2a87ddfe7e:

  pc-bios/s390-ccw: Update s390-ccw.img with the list-directed IPL fix (2023-03-06 12:05:10 +0100)

----------------------------------------------------------------
* Refine the distro support policy
* Deprecate 32-bit x86 and arm hosts for system emulation
* Check bison version to be >= 3.0
* Compile vnc test only if vnc is really enabled
* Check some configs in docs/config/ via the readconfig-test
* s390x: Add support for list-directed IPL from ECKD DASD

----------------------------------------------------------------
Jared Rossi (1):
      pc-bios: Add support for List-Directed IPL from ECKD DASD

Juan Quintela (1):
      test: Check vnc enable before compiling vnc test

Matheus Tavares Bernardino (1):
      Hexagon (meson.build): define min bison version

Thomas Huth (13):
      docs/about/build-platforms: Refine the distro support policy
      include/hw/i386: Clean up includes in x86.h
      docs/about/deprecated: Deprecate 32-bit x86 hosts for system emulation
      gitlab-ci.d/crossbuilds: Drop the i386 system emulation job
      docs/about/deprecated: Deprecate 32-bit arm hosts for system emulation
      gitlab-ci.d/crossbuilds: Drop the 32-bit arm system emulation jobs
      tests/qtest/readconfig: Rework test_object_rng_resp into a generic function
      tests/qtest/readconfig: Test docs/config/ich9-ehci-uhci.cfg
      docs/config: Set the "kvm" accelerator via "[accel]" section
      tests/qtest/readconfig-test: Allow testing for arbitrary memory sizes
      tests/qtest: Move mkimg() and have_qemu_img() from libqos to libqtest
      tests/qtest/readconfig: Test docs/config/q35-emulated.cfg
      pc-bios/s390-ccw: Update s390-ccw.img with the list-directed IPL fix

 docs/about/build-platforms.rst       |   3 +-
 docs/about/deprecated.rst            |  20 ++++
 docs/config/mach-virt-graphical.cfg  |   4 +-
 docs/config/mach-virt-serial.cfg     |   4 +-
 docs/config/q35-emulated.cfg         |   2 +
 docs/config/q35-virtio-graphical.cfg |   2 +
 docs/config/q35-virtio-serial.cfg    |   2 +
 configure                            |   1 +
 include/hw/i386/x86.h                |   2 -
 pc-bios/s390-ccw/bootmap.h           |  30 +++++-
 tests/qtest/libqos/libqos.h          |   2 -
 tests/qtest/libqtest.h               |  21 +++++
 pc-bios/s390-ccw/bootmap.c           | 157 ++++++++++++++++++++++++-------
 tests/qtest/libqos/libqos.c          |  49 +---------
 tests/qtest/libqtest.c               |  52 +++++++++++
 tests/qtest/readconfig-test.c        | 175 ++++++++++++++++++++++++++++++++---
 .gitlab-ci.d/crossbuilds.yml         |  24 -----
 pc-bios/s390-ccw.img                 | Bin 42608 -> 42608 bytes
 target/hexagon/meson.build           |   2 +-
 tests/qtest/meson.build              |  10 +-
 20 files changed, 428 insertions(+), 134 deletions(-)


