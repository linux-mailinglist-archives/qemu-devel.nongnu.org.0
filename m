Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 925DF47B89E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 03:54:35 +0100 (CET)
Received: from localhost ([::1]:54932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzVIQ-0001Xx-O5
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 21:54:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzVEK-0003ck-5t
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 21:50:20 -0500
Received: from [2607:f8b0:4864:20::62c] (port=38787
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzVEI-0000AT-Gn
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 21:50:19 -0500
Received: by mail-pl1-x62c.google.com with SMTP id c7so801932plg.5
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 18:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zi74zX03AzlDYSTcNyOeKzOi2PA59RfE+ydGeg7N9HY=;
 b=Fw7zeAnKqY9GgyMFP5//31pAZL4+H5ZEBINP2esOAQPdAaSQgYCkH/sALJz8g7B1lL
 EOiO2ylgEalGv50W52V2gnWJSkrqmHaMAidDpGOUlbOaVzLXLq3pbzX3sia5yDXGoQ7b
 OW+fEVcsGzl+dwA3rfuWIwHxendwJlfquk30LCfxW8v6QjNb+FqFDVxdrjoIbQQ5CK/W
 58GEIBCHrehIywX98O0LQioKcxaxRCP4T6D+J1BCcI9vkYtKdhdKve9Y7EkduUsne9VJ
 lJ5Dp0zAFwpNsm08QRGxtESNx/wDo0bOUXOtoTlUDCcP121XSKuNW4xzBNv5Rue0/MPE
 zmkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zi74zX03AzlDYSTcNyOeKzOi2PA59RfE+ydGeg7N9HY=;
 b=0mzZYDIX9bbc+wru2hsXMmHUtyebq07Ha3Bzfwj1W/Wra+OwoVBK0ewJvMi5n4MtyM
 z9e3jI8+8Z3fdn6csj5w8LcQs834syqOABE2JGa0Rk7N0V4SF0Y/auviPcEzr3pgKMnX
 9W5I10ukIhe1wixMe1jVuBmmFW9OWuDvg+HnZx8w/s2qRSY5xAT8brtYH3FXhMM2oWJ8
 yrmXcz4fNN4NVXNDNTaUMkokVJ8MPHlAv8B7uj0aYyOh/On4PPyqynu5ezsKGm5K35UJ
 u9XuZvuUa4Zj9QYly+d3P99GlRoOHb97FsXqrB1pcGb/iey0kvmYco3GwwdOBeNJnigv
 3uLw==
X-Gm-Message-State: AOAM532V5FWt8lNWOrgoaZCsOhghs1HMS91ataEN6e4tG6/8U3c6d+ZX
 cZHU5XnT4XkBnVkgL8vQydkpQ31Vaj8pfw==
X-Google-Smtp-Source: ABdhPJzTGRRYENAjGviqAThKSPWIknmULUMW7fu50tGSWotahxlXJHS3MJ+v/GV+qTuxlCe8qzckxA==
X-Received: by 2002:a17:90a:6b44:: with SMTP id
 x4mr1303915pjl.27.1640055017198; 
 Mon, 20 Dec 2021 18:50:17 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id bg23sm694025pjb.24.2021.12.20.18.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 18:50:16 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/7] linux-user/elfload: Rename ARM_COMMPAGE to HI_COMMPAGE
Date: Mon, 20 Dec 2021 18:50:08 -0800
Message-Id: <20211221025012.1057923-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221025012.1057923-1-richard.henderson@linaro.org>
References: <20211221025012.1057923-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Arm will no longer be the only target requiring a commpage,
but it will continue to be the only target placing the page
at the high end of the address space.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/elfload.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 767f54c76d..d34cd4fe43 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -390,11 +390,11 @@ enum {
 
 /* The commpage only exists for 32 bit kernels */
 
-#define ARM_COMMPAGE (intptr_t)0xffff0f00u
+#define HI_COMMPAGE (intptr_t)0xffff0f00u
 
 static bool init_guest_commpage(void)
 {
-    void *want = g2h_untagged(ARM_COMMPAGE & -qemu_host_page_size);
+    void *want = g2h_untagged(HI_COMMPAGE & -qemu_host_page_size);
     void *addr = mmap(want, qemu_host_page_size, PROT_READ | PROT_WRITE,
                       MAP_ANONYMOUS | MAP_PRIVATE | MAP_FIXED, -1, 0);
 
@@ -2160,8 +2160,8 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
     return sp;
 }
 
-#ifndef ARM_COMMPAGE
-#define ARM_COMMPAGE 0
+#ifndef HI_COMMPAGE
+#define HI_COMMPAGE 0
 #define init_guest_commpage() true
 #endif
 
@@ -2361,7 +2361,7 @@ static void pgb_static(const char *image_name, abi_ulong orig_loaddr,
     }
 
     loaddr &= -align;
-    if (ARM_COMMPAGE) {
+    if (HI_COMMPAGE) {
         /*
          * Extend the allocation to include the commpage.
          * For a 64-bit host, this is just 4GiB; for a 32-bit host we
@@ -2372,14 +2372,14 @@ static void pgb_static(const char *image_name, abi_ulong orig_loaddr,
         if (sizeof(uintptr_t) == 8 || loaddr >= 0x80000000u) {
             hiaddr = (uintptr_t) 4 << 30;
         } else {
-            offset = -(ARM_COMMPAGE & -align);
+            offset = -(HI_COMMPAGE & -align);
         }
     }
 
     addr = pgb_find_hole(loaddr, hiaddr - loaddr, align, offset);
     if (addr == -1) {
         /*
-         * If ARM_COMMPAGE, there *might* be a non-consecutive allocation
+         * If HI_COMMPAGE, there *might* be a non-consecutive allocation
          * that can satisfy both.  But as the normal arm32 link base address
          * is ~32k, and we extend down to include the commpage, making the
          * overhead only ~96k, this is unlikely.
@@ -2400,7 +2400,7 @@ static void pgb_dynamic(const char *image_name, long align)
      * All we need is a commpage that satisfies align.
      * If we do not need a commpage, leave guest_base == 0.
      */
-    if (ARM_COMMPAGE) {
+    if (HI_COMMPAGE) {
         uintptr_t addr, commpage;
 
         /* 64-bit hosts should have used reserved_va. */
@@ -2410,7 +2410,7 @@ static void pgb_dynamic(const char *image_name, long align)
          * By putting the commpage at the first hole, that puts guest_base
          * just above that, and maximises the positive guest addresses.
          */
-        commpage = ARM_COMMPAGE & -align;
+        commpage = HI_COMMPAGE & -align;
         addr = pgb_find_hole(commpage, -commpage, align, 0);
         assert(addr != -1);
         guest_base = addr;
-- 
2.25.1


