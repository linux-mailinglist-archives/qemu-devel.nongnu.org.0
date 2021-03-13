Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAD333A0AA
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 20:50:58 +0100 (CET)
Received: from localhost ([::1]:33190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLAHp-0007ms-AQ
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 14:50:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAFl-00063d-O4
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:48:49 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:33150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAFk-0006rH-85
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:48:49 -0500
Received: by mail-wr1-x42f.google.com with SMTP id 7so6626105wrz.0
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 11:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Vu9O6tCMWZUmivFcqYztsy3+MmYDuWhmuiNrezQaCQ=;
 b=ItpAcowJUxqDZkRJYCJ78V9RkDTQg50M7S6RgIokygkfvLQAmN8+oTAUBAJIO+Pl4m
 VBJqibro09vTJDxhRAF9YBtNF655cEMq1p2CYILYDIvOAnJ040M/eye1oNAB9yFVminE
 +M47LM1sRuUccWwbJw2mkAAoJPV7KZ9Fw5vIIkeuvAYRj+tu/MULAGjrQZYlUCCMYBHh
 G2M5r2N4iZgrOC/LKiMp9t3Am/mowozMPsLS3txuffSmlZbgfPWqQIZa+hyuTpQFgR1R
 AplX9rKfQ+L552jMCocpB1kBKpPtT6tvt5a68MT6+CT9f1eCKK2suo/ic/GjJmxEKnhW
 6vGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2Vu9O6tCMWZUmivFcqYztsy3+MmYDuWhmuiNrezQaCQ=;
 b=qVvEjgD66nNYckj0FK6agvsnZYUMHNKvT+YtqQchXYHoZPELJvfMeavO51xMNCyRb8
 iM7MVFgQQ3je4mupEYt+1ohMfKRXXC5HVLWxupvjGNe0m2VQhJ8YJw72rsz+rX+FZvpO
 qLCPZ0RGikGrERvObISCOxxM4HZJslUmvj4ZggEz/jW1AnNYuxxhy+cIT3NP453a8cBI
 S208i+JIrOY8i/p/ev3aDhNhBc9vC8HQaT4tj7u0TE6omz/itGbsrveME17r65vZJFQf
 NldI97EpWaSpbwk5o/Dt0meen/OGAC2LEhLiU4MqaKOykITMbodMfQp9+Zxk24m3q73c
 R4jg==
X-Gm-Message-State: AOAM530aLbt3t37annaK0G24FIrifdUDuuVW0p0MAumIKooNIVNfuziz
 X82XzVpsL44yjfPU/v6YqaCLi9O6tTC9GA==
X-Google-Smtp-Source: ABdhPJxk16o1MiM4X8u5oA0XFwOYRqunWYV57ndY3Nu6IOPKgeVpIHARdrY70CUKexXr7xa53CboQA==
X-Received: by 2002:a5d:4e85:: with SMTP id e5mr20564293wru.218.1615664926771; 
 Sat, 13 Mar 2021 11:48:46 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id y10sm13577848wrl.19.2021.03.13.11.48.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 11:48:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/27] hw/mips/gt64xxx: Fix typos in qemu_log_mask() formats
Date: Sat, 13 Mar 2021 20:48:05 +0100
Message-Id: <20210313194829.2193621-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210313194829.2193621-1-f4bug@amsat.org>
References: <20210313194829.2193621-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix the following typos:
- GT_PCI1_CFGDATA is not a timer register but a PCI one,
- zero-padding flag is out of the format

Fixes: 641ca2bfcd5 ("hw/mips/gt64xxx_pci: Use qemu_log_mask() instead of debug printf()")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <20210309142630.728014-4-f4bug@amsat.org>
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


