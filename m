Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF3F3329BB
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:08:38 +0100 (CET)
Received: from localhost ([::1]:58562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJdyP-0006Mt-Jb
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:08:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdJz-0004DP-28
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:26:51 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:42733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdJx-00067T-Ea
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:26:50 -0500
Received: by mail-ej1-x632.google.com with SMTP id c10so28120348ejx.9
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wPcnqGU4UTHM8Jk/Lrqw/LIFbJVS4CYQnfKcUElhSEw=;
 b=Dbr/iudgcy31GQbHuC2eXzT8lxx/ihsiQsF3hU9uXw75ZUd5+vBvUSHuy+91bHMoBA
 h2TgpKcstOnpwmVrpbyqQSWeI2tXu/JnWbfGdBhvSkSGH8IS/g+aPYylH3DUlzykSE0+
 qn40jSS5jKBB/+gQWZ/h5PWFMX+9YvZUlkX1tj+3Poo4SUqR9IyqoCOE+W1rGVm9dQ74
 GH1OtpD4U/4H36R8JiHS9Ewh8GHzcJUTeHZzFVwybfWDu5BYiO+F4p4nxQz0Ag8RSf4N
 V9G+kYa3EBogi6geu2i8SQMWYqeRAaTP7yY+nfUJ1GO+y+5mzzVGLzunUp0BXviM75SW
 O4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wPcnqGU4UTHM8Jk/Lrqw/LIFbJVS4CYQnfKcUElhSEw=;
 b=PjpNA+vZdLkMXzqVLkVtApPuln14xOY6TY9Xc9fbmclw3UfScneNIDHV6L0Y7vS+ib
 v24YU1IW+5MWOh1rNrk2POYJlEC0eSRU3flXXNLPFDC19KlFKCSGvDDvaR61yKefSGbq
 RXkCrULj0TqVU+Ier74T1l5siaJD1C+5OC51QointxzJgN6Ny2SpVQ+VwVVEqmca8C43
 nZcAvTztEB94eL0WUYXn2QaYOV9jJjdviXE5KDoOMiv6uKGzpX6UqcMync5v2hwPCusj
 ZxHSyeLzYs91SAWuQV8kX68kWLeA7/yb19etVCgBw8T5Wkr/681AJio2lreDVIzTYXYR
 OYFg==
X-Gm-Message-State: AOAM533/lc6YdM/Jt1mMJnlKqDYfv3n5ka0AS1VzUAfPAf96XG+8gQcS
 KJL6NntWpXBe450t/9S3XdkLz4m7/Y0=
X-Google-Smtp-Source: ABdhPJwVZBel/BROAPrKw6VmjeWIQVoZGj2UUSz6vDOHTKTKVdOnDYy9d6ce9wLH+UWdd+aUpXSi4g==
X-Received: by 2002:a17:907:7355:: with SMTP id
 dq21mr18195608ejc.159.1615300007902; 
 Tue, 09 Mar 2021 06:26:47 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r17sm7184291edx.1.2021.03.09.06.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:26:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND 3/6] hw/mips/gt64xxx: Fix typos in qemu_log_mask()
 formats
Date: Tue,  9 Mar 2021 15:26:27 +0100
Message-Id: <20210309142630.728014-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309142630.728014-1-f4bug@amsat.org>
References: <20210309142630.728014-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
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


