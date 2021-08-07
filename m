Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6C83E3728
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 23:44:35 +0200 (CEST)
Received: from localhost ([::1]:37526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCU7O-0000vW-E5
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 17:44:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU5t-0006LF-Et
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:01 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:35603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU5r-0004kO-GO
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:01 -0400
Received: by mail-io1-xd2d.google.com with SMTP id s184so20001911ios.2
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 14:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BZr8mJ1mJ66M5MXwN6/HePswNTldWfKVbwj4u/xapbY=;
 b=rB/UeJT5/eO3l18ZhVaHV8ZEhSsfEcqor5wDkMH9YzJt3uBEJff5928CuGdPR0xSO0
 KYVuXAlK4z8rCHi9904rkr8/XRbeo4SwLOowtY27l/XEXYMbrMujjc3OL8qj84kZf9jL
 ZmzBWeihGoIqrOI6Ies1jMnbm1HDEm/cBsYwzkPMAuMpJSY9rcnAl53qbIfSepWjZmhL
 ZZFGrmoy/SecngwoPuTYufo5FZ9p+0PHfno6Z7lwoVz1o4hAgm+58VpqZojmDJxao/Qd
 P9WbSVH3/7nYTAPAJD0hWu+IOHSBO/fdUzcSJVkjtO6ddvc6XcSBPQFARDqXLG5iJwhd
 0Xjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BZr8mJ1mJ66M5MXwN6/HePswNTldWfKVbwj4u/xapbY=;
 b=gyO2bxvD8jSwXt5C/qpA0JEg8UrPueHya40zFKCaR1LUn51whaUtDfsKZnTxU33Eve
 OCYinGmuO6roQCWPhpT/rgCM8T9zIEhfLtNeuKERdPKzgssstu8qjVtUYQq6yd/2OU/j
 Wi7m2QpGEyahwZijBqDlUpXKTcfG7o1oDK+OxVGlH/KIqDDzoEb498LDC3J+ox2DvF4p
 cMEBzmuaZLcrZKbzcXoUgL+0hdUPWTDZht4xgBj2wgOHOD21SY3ejutJHISqNi72XUXd
 vEGNcrphRIg0BAosjdB/KEuFYw/mEM2trP2xYW1L+Ei6jHmrUJ0sZuInoKrjCbbVry/C
 8miQ==
X-Gm-Message-State: AOAM533npAxpURciFEE5kZhMRXdue9lZ/bSOUiGT9ZWB+3aZkFl21G5x
 eaEBoG5i9bM3L7M0IGNHpRIPC5J7kqcgjmpx
X-Google-Smtp-Source: ABdhPJy7WRHLHzrg2s8kzCbc7n4vWbMj+D5lyevZyHok8jHGy3+FPu8C3px1f6F2lAwopnjg0Mit3w==
X-Received: by 2002:a92:2e12:: with SMTP id v18mr69568ile.100.1628372578235;
 Sat, 07 Aug 2021 14:42:58 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm8062827ios.36.2021.08.07.14.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:42:57 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 07/49] bsd-user: style nits: apply qemu style to these
 files
Date: Sat,  7 Aug 2021 15:42:00 -0600
Message-Id: <20210807214242.82385-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807214242.82385-1-imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix style wrt {} placement, spaces around () and line lengths.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/i386/target_arch_elf.h   | 27 ++++++++++++++++-----------
 bsd-user/x86_64/target_arch_elf.h | 11 +++++++----
 2 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/bsd-user/i386/target_arch_elf.h b/bsd-user/i386/target_arch_elf.h
index 20ef0ccbdb..f322fc174b 100644
--- a/bsd-user/i386/target_arch_elf.h
+++ b/bsd-user/i386/target_arch_elf.h
@@ -25,10 +25,12 @@ static const char *get_elf_platform(void)
 {
     static char elf_platform[] = "i386";
     int family = object_property_get_int(OBJECT(thread_cpu), "family", NULL);
-    if (family > 6)
+    if (family > 6) {
         family = 6;
-    if (family >= 3)
+    }
+    if (family >= 3) {
         elf_platform[1] = '0' + family;
+    }
     return elf_platform;
 }
 
@@ -46,7 +48,7 @@ static uint32_t get_elf_hwcap(void)
 /*
  * This is used to ensure we don't load something for the wrong architecture.
  */
-#define elf_check_arch(x) ( ((x) == EM_386) || ((x) == EM_486) )
+#define elf_check_arch(x) (((x) == EM_386) || ((x) == EM_486))
 
 /*
  * These are used to set parameters in the core dumps.
@@ -55,18 +57,21 @@ static uint32_t get_elf_hwcap(void)
 #define ELF_DATA        ELFDATA2LSB
 #define ELF_ARCH        EM_386
 
-static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
+static inline void init_thread(struct target_pt_regs *regs,
+                               struct image_info *infop)
 {
     regs->esp = infop->start_stack;
     regs->eip = infop->entry;
 
-    /* SVR4/i386 ABI (pages 3-31, 3-32) says that when the program
-       starts %edx contains a pointer to a function which might be
-       registered using `atexit'.  This provides a mean for the
-       dynamic linker to call DT_FINI functions for shared libraries
-       that have been loaded before the code runs.
-
-       A value of 0 tells we have no such handler.  */
+    /*
+     * SVR4/i386 ABI (pages 3-31, 3-32) says that when the program starts %edx
+     * contains a pointer to a function which might be registered using
+     * `atexit'.  This provides a mean for the dynamic linker to call DT_FINI
+     * functions for shared libraries that have been loaded before the code
+     * runs.
+     *
+     * A value of 0 tells we have no such handler.
+     */
     regs->edx = 0;
 }
 
diff --git a/bsd-user/x86_64/target_arch_elf.h b/bsd-user/x86_64/target_arch_elf.h
index d3c139c7a9..e7c8aa2755 100644
--- a/bsd-user/x86_64/target_arch_elf.h
+++ b/bsd-user/x86_64/target_arch_elf.h
@@ -25,10 +25,12 @@ static const char *get_elf_platform(void)
 {
     static char elf_platform[] = "i386";
     int family = object_property_get_int(OBJECT(thread_cpu), "family", NULL);
-    if (family > 6)
+    if (family > 6) {
         family = 6;
-    if (family >= 3)
+    }
+    if (family >= 3) {
         elf_platform[1] = '0' + family;
+    }
     return elf_platform;
 }
 
@@ -42,13 +44,14 @@ static uint32_t get_elf_hwcap(void)
 }
 
 #define ELF_START_MMAP 0x2aaaaab000ULL
-#define elf_check_arch(x) ( ((x) == ELF_ARCH) )
+#define elf_check_arch(x) (((x) == ELF_ARCH))
 
 #define ELF_CLASS      ELFCLASS64
 #define ELF_DATA       ELFDATA2LSB
 #define ELF_ARCH       EM_X86_64
 
-static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
+static inline void init_thread(struct target_pt_regs *regs,
+                               struct image_info *infop)
 {
     regs->rax = 0;
     regs->rsp = infop->start_stack;
-- 
2.32.0


