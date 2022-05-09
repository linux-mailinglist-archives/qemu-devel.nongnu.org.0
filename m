Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA2651F556
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 09:35:57 +0200 (CEST)
Received: from localhost ([::1]:57372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnxvv-0001Jd-F8
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 03:35:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nnxq2-0007eQ-NP
 for qemu-devel@nongnu.org; Mon, 09 May 2022 03:29:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nnxpz-0000Iq-Qr
 for qemu-devel@nongnu.org; Mon, 09 May 2022 03:29:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652081386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=efLQ7cQ/Y66r2fF1y5Frgu7HZ8e0PcmfvKf7augQhag=;
 b=Iftkj17GDEPku6+cHZQ9XSom7kHfJ8O5qc7xNO7EgUJL9N2A/n4m8eFaaqJR5xVlDGm8HZ
 RSYejqjoFlFvzi5stqznn8JS/jZbCskBJxaoVdHDm6qInueoZhaZeN3SMPlwXGahj5qwXW
 3zVrfckq3mLklAeTlCvMk8ONvbN1fIk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370-CG0_sAS3PGO6bjKEFCK70w-1; Mon, 09 May 2022 03:29:42 -0400
X-MC-Unique: CG0_sAS3PGO6bjKEFCK70w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 89840101AA42;
 Mon,  9 May 2022 07:29:42 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C3E9C9E6C;
 Mon,  9 May 2022 07:29:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL v2 00/11] Misc patches
Date: Mon,  9 May 2022 09:29:30 +0200
Message-Id: <20220509072933.48586-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 554623226f800acf48a2ed568900c1c968ec9a8b:

  Merge tag 'qemu-sparc-20220508' of https://github.com/mcayland/qemu into staging (2022-05-08 17:03:26 -0500)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2022-05-09

for you to fetch changes up to ddc5a6cc70398ed7ec76220d59c123d8cb14b0ad:

  docs/devel/writing-monitor-commands: Replace obsolete STEXI/ETEXI tags (2022-05-09 08:21:14 +0200)

----------------------------------------------------------------
* Remove redundant/obsolete x86, arm and ppc disassemblers (Capstone is better)
* Limit some Xen-related code to builds where Xen is really available
* Remove hxtool-conv.pl and remove STEXI/ETEXI references from the docs
* Update MinGW and OpenBSD to a more recent version in the CI
* Warn user if the -vga flag is passed but no vga device is created

----------------------------------------------------------------

v2:
 - Fixed the -vga warning patch to not warn in case of "-device"
 - Added the ppc disassembler patch
 - Added the STEXI/ETEXI doc patch

Brad Smith (1):
      tests/vm: update openbsd to release 7.1

Gautam Agrawal (1):
      Warn user if the vga flag is passed but no vga device is created

Thomas Huth (6):
      disas: Remove old libopcode arm disassembler
      disas: Remove old libopcode i386 disassembler
      disas: Remove old libopcode ppc disassembler
      softmmu/vl: Fence 'xenfb' if Xen support is not compiled in
      qemu-options: Limit the -xen options to x86 and arm
      docs/devel/writing-monitor-commands: Replace obsolete STEXI/ETEXI tags

Yonggang Luo (3):
      doc: remove hxtool-conv.pl
      cirrus/win32: upgrade mingw base packages
      gitlab-ci: Upgrade mingw base package.

 docs/devel/writing-monitor-commands.rst |   11 +-
 include/disas/dis-asm.h                 |    3 -
 include/sysemu/sysemu.h                 |    1 +
 disas.c                                 |    5 -
 disas/arm.c                             | 4012 ------------------
 disas/i386.c                            | 6771 -------------------------------
 disas/ppc.c                             | 5435 -------------------------
 hw/hppa/machine.c                       |    1 +
 hw/isa/isa-bus.c                        |    1 +
 hw/mips/fuloong2e.c                     |    1 +
 hw/pci/pci.c                            |    1 +
 hw/ppc/spapr.c                          |    1 +
 hw/sparc/sun4m.c                        |    2 +
 hw/sparc64/sun4u.c                      |    1 +
 hw/xenpv/xen_machine_pv.c               |    1 +
 softmmu/globals.c                       |    1 +
 softmmu/vl.c                            |    9 +
 target/arm/cpu.c                        |    8 -
 target/i386/cpu.c                       |    1 -
 target/ppc/cpu_init.c                   |    2 -
 .cirrus.yml                             |    2 +-
 .gitlab-ci.d/windows.yml                |    2 +-
 MAINTAINERS                             |    6 -
 disas/meson.build                       |    3 -
 qemu-options.hx                         |    7 +-
 scripts/hxtool-conv.pl                  |  137 -
 tests/vm/openbsd                        |    4 +-
 27 files changed, 32 insertions(+), 16397 deletions(-)
 delete mode 100644 disas/arm.c
 delete mode 100644 disas/i386.c
 delete mode 100644 disas/ppc.c
 delete mode 100755 scripts/hxtool-conv.pl


