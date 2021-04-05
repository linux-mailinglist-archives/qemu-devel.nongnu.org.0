Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38209354339
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 17:14:39 +0200 (CEST)
Received: from localhost ([::1]:57992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTQw2-0004s6-81
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 11:14:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1lTQHm-0001c6-AE
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:33:02 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1lTQHQ-0001qr-N0
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:32:57 -0400
Received: by mail-wr1-x429.google.com with SMTP id x16so11078748wrn.4
 for <qemu-devel@nongnu.org>; Mon, 05 Apr 2021 07:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d/CiqD1jKFEEZvgY8njcTGUel/aa04reDhz3I6YJxos=;
 b=mRUfwWytSNw4LIrLbTivilJQxwVt6Kdsff71C2K3caUhoB6DzQhNNkK6JD8yBoLH7q
 dHSKrpuwAFQP0uGjsUKKho4SiUC6avgBq3sYV+Jz5/WglVKfwNfCR2fvHfDTdNXRXTHp
 InDUJyBUZ1KfrtQ+NU9evuxlAo9vTkhQ8t2m5W/rmFrBGiXEtLZnPmDPvCRc9DnhUAhy
 hf+n2cxQao0wQE2TOqJqtE7NWdGwtVW9rT3b3OUf9tW1e7hu/oI3/NaJKgvH4S+E5f3N
 NYDMKpQMBdwRQZmk7lNNAwABX164Okx8OTQCTc2qbricTP9KARchA5aJIG65yX2LLljH
 ssuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d/CiqD1jKFEEZvgY8njcTGUel/aa04reDhz3I6YJxos=;
 b=LPcExZeSleztuoqE6pdtiI/kUgBwXIMmNIr67Fo0UXgGunsim2JJMR39yC58XCVKgY
 K7c/6d1sGV3RetSwham33hzIiiIXqdzTvEP7behki7tcVM9/0lS0dX3Nea7CvLUFaA49
 uVgZ2k3+bSVX2sSPRI3cpGyZzxnaDaTxVIko9Thg1aEe7maR2817R/wYOn3wAFrouACg
 dwLHb/muw5238pXzxRLx3gdEsWCTyXjEbCZOVKeBLnaUM3DDn9aka1BFPqufu15ubEhv
 vM2CONoY391utcIvaRI7nV2SRXv2xuogfmUkg0yrcwC01Re1WhG446Y+HXl+aMbF4ARq
 THVQ==
X-Gm-Message-State: AOAM530omQ2zPIurCXmg5SwuX/7uEUblk1rwLk7ieTww4itedN1x1qP6
 9W9zYAhttJXDxWjkVIB5MnnBNScfWsG0mw==
X-Google-Smtp-Source: ABdhPJzX5m7yWTlqKJTgAjo5zwueLdHolpcWLTkQEQPSFNnkxhpZq/kphn+5ohbCHeRUiQJQI+MytA==
X-Received: by 2002:a5d:6c6f:: with SMTP id r15mr29860682wrz.77.1617633158360; 
 Mon, 05 Apr 2021 07:32:38 -0700 (PDT)
Received: from cmiranda-laptop.localdomain (bl15-158-218.dsl.telepac.pt.
 [188.80.158.218])
 by smtp.gmail.com with ESMTPSA id k3sm8231552wrc.67.2021.04.05.07.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 07:32:37 -0700 (PDT)
From: cupertinomiranda@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH 27/27] arcv3: Add support for ARCv3
Date: Mon,  5 Apr 2021 15:31:38 +0100
Message-Id: <20210405143138.17016-28-cupertinomiranda@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210405143138.17016-1-cupertinomiranda@gmail.com>
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=cupertinomiranda@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cupertino Miranda <cmiranda@synopsys.com>

---
 configure                                 | 2 ++
 default-configs/devices/arcv3-softmmu.mak | 7 +++++++
 default-configs/targets/arcv3-softmmu.mak | 3 +++
 include/disas/dis-asm.h                   | 2 ++
 include/elf.h                             | 1 +
 meson.build                               | 3 ++-
 6 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 default-configs/devices/arcv3-softmmu.mak
 create mode 100644 default-configs/targets/arcv3-softmmu.mak

diff --git a/configure b/configure
index 80d993fac7..cec3199434 100755
--- a/configure
+++ b/configure
@@ -682,6 +682,8 @@ elif check_define __aarch64__ ; then
   cpu="aarch64"
 elif check_define __arc__ ; then
   cpu="arc"
+elif check_define __arc64__ ; then
+  cpu="arc64"
 else
   cpu=$(uname -m)
 fi
diff --git a/default-configs/devices/arcv3-softmmu.mak b/default-configs/devices/arcv3-softmmu.mak
new file mode 100644
index 0000000000..0ce4176b2d
--- /dev/null
+++ b/default-configs/devices/arcv3-softmmu.mak
@@ -0,0 +1,7 @@
+# Default configuration for arc-softmmu
+
+CONFIG_SEMIHOSTING=n
+
+# Boards:
+#
+CONFIG_ARC_VIRT=y
diff --git a/default-configs/targets/arcv3-softmmu.mak b/default-configs/targets/arcv3-softmmu.mak
new file mode 100644
index 0000000000..af39b7c34d
--- /dev/null
+++ b/default-configs/targets/arcv3-softmmu.mak
@@ -0,0 +1,3 @@
+TARGET_ARCH=arcv3
+TARGET_BASE_ARCH=arc
+TARGET_XML_FILES= gdb-xml/arc-core-v3.xml gdb-xml/arc64-aux-minimal.xml gdb-xml/arc64-aux-other.xml
diff --git a/include/disas/dis-asm.h b/include/disas/dis-asm.h
index 8a0aa19bc2..15ec34c185 100644
--- a/include/disas/dis-asm.h
+++ b/include/disas/dis-asm.h
@@ -214,6 +214,8 @@ enum bfd_architecture
 #define bfd_mach_arc_arcv2     5
 #define bfd_mach_arc_arcv2em   6
 #define bfd_mach_arc_arcv2hs   7
+#define bfd_mach_arcv3_64      0x10
+#define bfd_mach_arcv3_32      0x20
   bfd_arch_m32r,       /* Mitsubishi M32R/D */
 #define bfd_mach_m32r          0  /* backwards compatibility */
   bfd_arch_mn10200,    /* Matsushita MN10200 */
diff --git a/include/elf.h b/include/elf.h
index 8c7c4ab8a9..14643f4c17 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -210,6 +210,7 @@ typedef struct mips_elf_abiflags_v0 {
 
 #define EM_ARC_COMPACT  93  /* Synopsys ARCompact */
 #define EM_ARC_COMPACT2 195 /* Synopsys ARCompact V2 */
+#define EM_ARC_COMPACT3_64 253 /* Synopsys ARCompact V3 ARC64 */
 
 #define EM_MOXIE           223     /* Moxie processor family */
 #define EM_MOXIE_OLD       0xFEED
diff --git a/meson.build b/meson.build
index a25425022e..5290ad9939 100644
--- a/meson.build
+++ b/meson.build
@@ -57,7 +57,7 @@ python = import('python').find_installation()
 
 supported_oses = ['windows', 'freebsd', 'netbsd', 'openbsd', 'darwin', 'sunos', 'linux']
 supported_cpus = ['ppc', 'ppc64', 's390x', 'sparc64', 'riscv32', 'riscv64', 'x86', 'x86_64',
-  'arc', 'arm', 'aarch64', 'mips', 'mips64', 'sparc', 'sparc64']
+  'arc', 'arc64', 'arm', 'aarch64', 'mips', 'mips64', 'sparc', 'sparc64']
 
 cpu = host_machine.cpu_family()
 targetos = host_machine.system()
@@ -1191,6 +1191,7 @@ config_target_mak = {}
 disassemblers = {
   'alpha' : ['CONFIG_ALPHA_DIS'],
   'arc' : ['CONFIG_ARC_DIS'],
+  'arc64' : ['CONFIG_ARC_DIS'],
   'arm' : ['CONFIG_ARM_DIS'],
   'avr' : ['CONFIG_AVR_DIS'],
   'cris' : ['CONFIG_CRIS_DIS'],
-- 
2.20.1


