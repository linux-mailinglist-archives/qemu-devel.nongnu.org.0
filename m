Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5472332EFF7
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 17:23:45 +0100 (CET)
Received: from localhost ([::1]:47014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIDEu-0008Jr-Cc
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 11:23:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIDCi-0006gQ-OR
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:21:28 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:55610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIDCh-0007IR-5D
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:21:28 -0500
Received: by mail-wm1-x32d.google.com with SMTP id w7so1946358wmb.5
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 08:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wPcnqGU4UTHM8Jk/Lrqw/LIFbJVS4CYQnfKcUElhSEw=;
 b=aLJjVx8mUzS2bizwLYi+Xa6EajYA53wSDFn7GVS1jSOYnZEXDJuwUHMjoCZlCoRhRU
 WAXLaTTASD0vFKT29VN8G/5tpmFC1J2GcAU01HgkrcqvWqq6M7yhEdP3lLEVshneoKHQ
 7H6ZZYPF9fxbna3T5X3GakxUiKmgBUkmJBnVtm3Xj86d5jcCEsPa7ueWIq4gkIPyfyI6
 03DYRAwV/TJY7LuGPXeeku1d+UTnOakTS7v8jrpI7znrIcOBNENxz2MgQe7ErY5lPRjB
 YjkcxUl1e4Js36fUD4YtNRBeygJi8FXO22rwLwUudmQ0ATeYbl3YaWELW0Z2/m3Nxwmr
 RKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wPcnqGU4UTHM8Jk/Lrqw/LIFbJVS4CYQnfKcUElhSEw=;
 b=IV9sWOFdDTMAVTj8eWt1DtbvBgKa0bFTPF4utQl/J2DFllkYKKEkh5gWTDCZzzxU8T
 kVP7yJEl+s4hlhOFh6fMmS5EA3DIUUUVnvl6Nfg00iVMnv1UtXLS3qderyVUCkmoW7P4
 FXcdugB5rXLeZeyve7L3DvCqe1HlLgsh2PUcIOVlQ2Qpeu8L8WQ3yy9SAWTZ4XDIFKNT
 aAslstPA8E4r7+Mr6hV4B5NfRiCQfLw0S3drO/BFNg0Hrc/iByasU8RZEDr/8Y4uhAuW
 aRMZW6aHCrDcH6Ks3ag5omA7Akrg3vilMFbP7lXlmMTkibTsi/LMk+2oZUghsDL3IYwA
 yKkg==
X-Gm-Message-State: AOAM530KTxY9o3mS3rKKbZI8A/L27vp9Ozv9kkBiW/zVJxRV5ygo+DSR
 zyBY77dcEtVR5lcN0NhI574Nyh1COB4=
X-Google-Smtp-Source: ABdhPJyxntFx1LgxJiEpTvmXcEslXLMHAqvEVXjR+fBT+qB/NRotYpobdXDvpHDNG2SKQIFW9M+Q8g==
X-Received: by 2002:a1c:dd44:: with SMTP id u65mr9723008wmg.87.1614961283506; 
 Fri, 05 Mar 2021 08:21:23 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t14sm5422872wru.64.2021.03.05.08.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 08:21:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/6] hw/mips/gt64xxx: Fix typos in qemu_log_mask() formats
Date: Fri,  5 Mar 2021 17:21:04 +0100
Message-Id: <20210305162107.2233203-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210305162107.2233203-1-f4bug@amsat.org>
References: <20210305162107.2233203-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix the following typos:
- GT_PCI1_CFGDATA is not a timer register but a PCI one,
- zero-padding flag is out of the format

Fixes: 641ca2bfcd5 ("hw/mips/gt64xxx_pci: Use qemu_log_mask() instead of debug printf()")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/gt64xxx_pci.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index 99b1690af19..8ff31380d74 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -463,7 +463,7 @@ static void gt64120_writel(void *opaque, hwaddr addr,
         /* Read-only registers, do nothing */
         qemu_log_mask(LOG_GUEST_ERROR,
                       "gt64120: Read-only register write "
-                      "reg:0x03%x size:%u value:0x%0*" PRIx64 "\n",
+                      "reg:0x%03x size:%u value:0x%0*" PRIx64 "\n",
                       saddr << 2, size, size << 1, val);
         break;
 
@@ -473,7 +473,7 @@ static void gt64120_writel(void *opaque, hwaddr addr,
         /* Read-only registers, do nothing */
         qemu_log_mask(LOG_GUEST_ERROR,
                       "gt64120: Read-only register write "
-                      "reg:0x03%x size:%u value:0x%0*" PRIx64 "\n",
+                      "reg:0x%03x size:%u value:0x%0*" PRIx64 "\n",
                       saddr << 2, size, size << 1, val);
         break;
 
@@ -515,7 +515,7 @@ static void gt64120_writel(void *opaque, hwaddr addr,
         /* Not implemented */
         qemu_log_mask(LOG_UNIMP,
                       "gt64120: Unimplemented device register write "
-                      "reg:0x03%x size:%u value:0x%0*" PRIx64 "\n",
+                      "reg:0x%03x size:%u value:0x%0*" PRIx64 "\n",
                       saddr << 2, size, size << 1, val);
         break;
 
@@ -528,7 +528,7 @@ static void gt64120_writel(void *opaque, hwaddr addr,
         /* Read-only registers, do nothing */
         qemu_log_mask(LOG_GUEST_ERROR,
                       "gt64120: Read-only register write "
-                      "reg:0x03%x size:%u value:0x%0*" PRIx64 "\n",
+                      "reg:0x%03x size:%u value:0x%0*" PRIx64 "\n",
                       saddr << 2, size, size << 1, val);
         break;
 
@@ -565,7 +565,7 @@ static void gt64120_writel(void *opaque, hwaddr addr,
         /* Not implemented */
         qemu_log_mask(LOG_UNIMP,
                       "gt64120: Unimplemented DMA register write "
-                      "reg:0x03%x size:%u value:0x%0*" PRIx64 "\n",
+                      "reg:0x%03x size:%u value:0x%0*" PRIx64 "\n",
                       saddr << 2, size, size << 1, val);
         break;
 
@@ -578,7 +578,7 @@ static void gt64120_writel(void *opaque, hwaddr addr,
         /* Not implemented */
         qemu_log_mask(LOG_UNIMP,
                       "gt64120: Unimplemented timer register write "
-                      "reg:0x03%x size:%u value:0x%0*" PRIx64 "\n",
+                      "reg:0x%03x size:%u value:0x%0*" PRIx64 "\n",
                       saddr << 2, size, size << 1, val);
         break;
 
@@ -621,8 +621,8 @@ static void gt64120_writel(void *opaque, hwaddr addr,
     case GT_PCI1_CFGDATA:
         /* not implemented */
         qemu_log_mask(LOG_UNIMP,
-                      "gt64120: Unimplemented timer register write "
-                      "reg:0x03%x size:%u value:0x%0*" PRIx64 "\n",
+                      "gt64120: Unimplemented PCI register write "
+                      "reg:0x%03x size:%u value:0x%0*" PRIx64 "\n",
                       saddr << 2, size, size << 1, val);
         break;
     case GT_PCI0_CFGADDR:
@@ -682,7 +682,7 @@ static void gt64120_writel(void *opaque, hwaddr addr,
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "gt64120: Illegal register write "
-                      "reg:0x03%x size:%u value:0x%0*" PRIx64 "\n",
+                      "reg:0x%03x size:%u value:0x%0*" PRIx64 "\n",
                       saddr << 2, size, size << 1, val);
         break;
     }
@@ -958,7 +958,7 @@ static uint64_t gt64120_readl(void *opaque,
         val = s->regs[saddr];
         qemu_log_mask(LOG_GUEST_ERROR,
                       "gt64120: Illegal register read "
-                      "reg:0x03%x size:%u value:0x%0*x\n",
+                      "reg:0x%03x size:%u value:0x%0*x\n",
                       saddr << 2, size, size << 1, val);
         break;
     }
-- 
2.26.2


