Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DC72F162B
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 14:49:54 +0100 (CET)
Received: from localhost ([::1]:33802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyxZx-0007bV-K4
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 08:49:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kyxU5-0002ew-Mo
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 08:43:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kyxU3-00081g-HF
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 08:43:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610372622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yNfX0DQVcD2xAQGjIQme04nBrOnA1htzif0tOWWYsqE=;
 b=ixqY0WcvAFNo9lKpvFQhKhgIz8ePB9dzcCHuR9CdDfv9D8NFsj2VCzOdUP6M+ObeYfLrGN
 aHwgCgoPWuNXvD77CqugGd9dAB0Uh7UNuT5FYvs8lHEsh2xsTBU4YWCRuOzzkPXiFa+ncA
 SA4Dkklky+cagxXfMXrViS//gor+QWU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-UFuUM2MUN32Kjx6L802tKg-1; Mon, 11 Jan 2021 08:43:39 -0500
X-MC-Unique: UFuUM2MUN32Kjx6L802tKg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D60AB19251A4;
 Mon, 11 Jan 2021 13:43:37 +0000 (UTC)
Received: from thuth.com (ovpn-112-147.ams2.redhat.com [10.36.112.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 416D817C5F;
 Mon, 11 Jan 2021 13:43:36 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/15] Testing, CI and bsd-user patches
Date: Mon, 11 Jan 2021 14:43:13 +0100
Message-Id: <20210111134328.157775-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Warner Losh <imp@freebsd.org>,
 Qiuhao Li <Qiuhao.Li@outlook.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi,

the following changes since commit 7b09f127738ae3d0e71716cea086fc8f847a5686:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210108' into staging (2021-01-08 15:37:04 +0000)

are available in the Git repository at:

  https://gitlab.com/huth/qemu.git tags/pull-request-2021-01-11

for you to fetch changes up to 2ee8a60bc51af853b2adfb581bf106b0db109dd9:

  fuzz: map all BARs and enable PCI devices (2021-01-11 11:38:15 +0100)

----------------------------------------------------------------
* Fuzzer improvements
* Add OpenSUSE leap to the gitlab-CI
* Some fixes to get our CI "green" again
* Some initial patches to update bsd-user
----------------------------------------------------------------

Alexander Bulekov (1):
      fuzz: map all BARs and enable PCI devices

Cho, Yu-Chen via (1):
      gitlab-ci.yml: Add openSUSE Leap 15.2 for gitlab CI/CD

Gan Qixin (1):
      qtest/libqtest: fix heap-buffer-overflow in qtest_cb_for_every_machine()

Philippe Mathieu-Daudé (1):
      util/oslib-win32: Fix _aligned_malloc() arguments order

Qiuhao Li (7):
      fuzz: accelerate non-crash detection
      fuzz: double the IOs to remove for every loop
      fuzz: split write operand using binary approach
      fuzz: remove IO commands iteratively
      fuzz: set bits in operand of write/out to zero
      fuzz: add minimization options
      fuzz: heuristic split write based on past IOs

Stacey Son (1):
      bsd-user: move strace OS/arch dependent code to host/arch dirs

Thomas Huth (1):
      tests/acceptance: Fix race conditions in s390x tests & skip fedora on gitlab-CI

Warner Losh (2):
      bsd-user: regenerate FreeBSD's system call numbers
      bsd-user: Update strace.list for FreeBSD's latest syscalls

 .gitlab-ci.d/containers.yml                   |   5 +
 .gitlab-ci.yml                                |  31 ++
 bsd-user/arm/target_arch_sysarch.h            |  78 +++
 bsd-user/arm/target_syscall.h                 |  36 ++
 bsd-user/freebsd/os-strace.h                  |  29 ++
 bsd-user/freebsd/strace.list                  |  65 ++-
 bsd-user/freebsd/syscall_nr.h                 | 695 ++++++++++++++------------
 bsd-user/i386/target_arch_sysarch.h           |  77 +++
 bsd-user/i386/target_syscall.h                |  19 +
 bsd-user/mips/target_arch_sysarch.h           |  69 +++
 bsd-user/mips/target_syscall.h                |  52 ++
 bsd-user/mips64/target_arch_sysarch.h         |  69 +++
 bsd-user/mips64/target_syscall.h              |  53 ++
 bsd-user/netbsd/os-strace.h                   |   1 +
 bsd-user/openbsd/os-strace.h                  |   1 +
 bsd-user/sparc/target_arch_sysarch.h          |  52 ++
 bsd-user/sparc/target_syscall.h               |  24 +-
 bsd-user/sparc64/target_arch_sysarch.h        |  52 ++
 bsd-user/sparc64/target_syscall.h             |  24 +-
 bsd-user/strace.c                             |  11 +
 bsd-user/x86_64/target_arch_sysarch.h         |  76 +++
 bsd-user/x86_64/target_syscall.h              |  21 +-
 meson.build                                   |   1 +
 scripts/oss-fuzz/minimize_qtest_trace.py      | 260 ++++++++--
 tests/acceptance/machine_s390_ccw_virtio.py   |  14 +-
 tests/docker/dockerfiles/opensuse-leap.docker |  55 ++
 tests/qtest/fuzz/generic_fuzz.c               |  24 +
 tests/qtest/libqtest.c                        |   2 +-
 util/oslib-win32.c                            |   2 +-
 29 files changed, 1521 insertions(+), 377 deletions(-)
 create mode 100644 bsd-user/arm/target_arch_sysarch.h
 create mode 100644 bsd-user/arm/target_syscall.h
 create mode 100644 bsd-user/freebsd/os-strace.h
 create mode 100644 bsd-user/i386/target_arch_sysarch.h
 create mode 100644 bsd-user/mips/target_arch_sysarch.h
 create mode 100644 bsd-user/mips/target_syscall.h
 create mode 100644 bsd-user/mips64/target_arch_sysarch.h
 create mode 100644 bsd-user/mips64/target_syscall.h
 create mode 100644 bsd-user/netbsd/os-strace.h
 create mode 100644 bsd-user/openbsd/os-strace.h
 create mode 100644 bsd-user/sparc/target_arch_sysarch.h
 create mode 100644 bsd-user/sparc64/target_arch_sysarch.h
 create mode 100644 bsd-user/x86_64/target_arch_sysarch.h
 create mode 100644 tests/docker/dockerfiles/opensuse-leap.docker


