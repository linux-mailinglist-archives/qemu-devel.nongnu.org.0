Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D08751DAD3
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 16:41:11 +0200 (CEST)
Received: from localhost ([::1]:54968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmz8n-0003ax-MG
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 10:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmz5l-000175-KR
 for qemu-devel@nongnu.org; Fri, 06 May 2022 10:38:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmz5j-0005YH-MW
 for qemu-devel@nongnu.org; Fri, 06 May 2022 10:38:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651847878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TOHY8PuQOKvxDQ5x+N0oooXRStI/fkoOqf+HHCYaR/Y=;
 b=CkuRR48V8VijgYh0ciZpM7lgv1gHLjedeHcn7p1V3dP0ImuqB9iubY+W5dqsrOO5N2zUoB
 Vs2+qY7Qk3ObUAjGNttmGAf1DBi6w+vY/PAazH36DiNn9W4H7Ei4wpbvkXrIW2sJO6AWBM
 rgcmG4gcPt5kjyVWO7yammjyZZbgAJM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-nKQByjmlPK-b_fw_-6PD2A-1; Fri, 06 May 2022 10:37:54 -0400
X-MC-Unique: nKQByjmlPK-b_fw_-6PD2A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2514811E76;
 Fri,  6 May 2022 14:37:53 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7A772166B2D;
 Fri,  6 May 2022 14:37:52 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 0/9] Misc patches
Date: Fri,  6 May 2022 16:37:41 +0200
Message-Id: <20220506143750.559526-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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

 Hi Richard!

The following changes since commit 1fba9dc71a170b3a05b9d3272dd8ecfe7f26e215:

  Merge tag 'pull-request-2022-05-04' of https://gitlab.com/thuth/qemu into staging (2022-05-04 08:07:02 -0700)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2022-05-06

for you to fetch changes up to 0660402182ef9158e32420206f107a6798582141:

  Warn user if the vga flag is passed but no vga device is created (2022-05-06 13:09:55 +0200)

----------------------------------------------------------------
* Remove redundant/obsolete x86 and arm disassemblers (Capstone is better)
* Limit some Xen-related code to builds where Xen is really available
* Remove hxtool-conv.pl
* Update MinGW and OpenBSD to a more recent version in the CI
* Warn user if the -vga flag is passed but no vga device is created

----------------------------------------------------------------
Brad Smith (1):
      tests/vm: update openbsd to release 7.1

Gautam Agrawal (1):
      Warn user if the vga flag is passed but no vga device is created

Thomas Huth (4):
      disas: Remove old libopcode arm disassembler
      disas: Remove old libopcode i386 disassembler
      softmmu/vl: Fence 'xenfb' if Xen support is not compiled in
      qemu-options: Limit the -xen options to x86 and arm

Yonggang Luo (3):
      doc: remove hxtool-conv.pl
      cirrus/win32: upgrade mingw base packages
      gitlab-ci: Upgrade mingw base package.

 include/disas/dis-asm.h   |    2 -
 include/sysemu/sysemu.h   |    1 +
 disas.c                   |    3 -
 disas/arm.c               | 4012 ---------------------------
 disas/i386.c              | 6771 ---------------------------------------------
 hw/hppa/machine.c         |    1 +
 hw/isa/isa-bus.c          |    1 +
 hw/mips/fuloong2e.c       |    1 +
 hw/pci/pci.c              |    1 +
 hw/ppc/spapr.c            |    1 +
 hw/sparc/sun4m.c          |    2 +
 hw/sparc64/sun4u.c        |    1 +
 hw/xenpv/xen_machine_pv.c |    1 +
 softmmu/globals.c         |    1 +
 softmmu/vl.c              |    8 +
 target/arm/cpu.c          |    8 -
 target/i386/cpu.c         |    1 -
 .cirrus.yml               |    2 +-
 .gitlab-ci.d/windows.yml  |    2 +-
 MAINTAINERS               |    4 -
 disas/meson.build         |    2 -
 qemu-options.hx           |    7 +-
 scripts/hxtool-conv.pl    |  137 -
 tests/vm/openbsd          |    4 +-
 24 files changed, 27 insertions(+), 10947 deletions(-)
 delete mode 100644 disas/arm.c
 delete mode 100644 disas/i386.c
 delete mode 100755 scripts/hxtool-conv.pl


