Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 429F933A0C5
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 20:53:45 +0100 (CET)
Received: from localhost ([::1]:41704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLAKV-00032L-Mo
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 14:53:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAFq-0006GS-Uy
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:48:54 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAFp-0006sz-Dz
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:48:54 -0500
Received: by mail-wr1-x429.google.com with SMTP id l11so6619088wrp.7
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 11:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IjSXtEma9Ce1RqOZdI2+7Q74pg1NHqIsfhqlfuqbobI=;
 b=eFlae2YUbIpYxH+Kcj7lN5xm9Yl/sFvzpL6v3Nw0DkrIp1snhkH1aaFyJwyh4Je2y3
 ivORJabTwi7QK9Fw9KoLmBfiD6pZLnhRg256Q6YBRo07v9Oh9UOjqyuCRyTTZK19LX50
 yeGGk2WqoUHoB2IyW5EN7h6pkbj2iXDhmP3FQRnXtpilSGoz9/9sSEk5OPM+z/oHyFOt
 GRO0VSg8h1Sn0Uum3tkgMcfEoOgXa7/6UzZYTLzfztpJfIiI7QYvKHHdJGCoEHy9wbzz
 2oq0cAZhsiIBWNZM1BfGtxBINzZz3uPmMUJAGzdhQtHHz2EGTB8wy4Vn60TWpc5Rvlka
 Jffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IjSXtEma9Ce1RqOZdI2+7Q74pg1NHqIsfhqlfuqbobI=;
 b=tZtkb58Sr1sAGNbQglsMRTwuVjd9LKk/BrBN7S7w/W65EKfGr2lOT5uPGvP1gCL85z
 mhIC5hdwoDxSzMbdYE3DxixRlydHWjvUOxn6K/DotQYWK+8ewmLMXXJU0hwKkFGAQ5AF
 nBlFI3Jh6iTYfxdw0tOxdaQ1w8hia4NSSZPX3Nu+Tj9/zAO5901hWpav6pAjMQbSS5ZE
 bh5ANAFveAJnXcNmfr25QNnNqkjRLONQE+3e/x1P3aS+Mfm2NJ6oW/K6enDpK9+mHWMr
 Qg3zATR4UhA5NcxaWG2VxzL/ks4DzrBh5XApYoleafX0uBfHm1gsMmmBEFBLdoAHWf+D
 quEA==
X-Gm-Message-State: AOAM532Pdi8+NJGCkNYANTkhEQ2qQHRIRCoKc3b8iU2ZYilirR1TtUzQ
 333ePBHR733LfPMrg3qPkgsbOnSVBxptGQ==
X-Google-Smtp-Source: ABdhPJy0Qx92uHR4wXK9fF6N6suGUXi3lKnHHO1BOM8BvEUlaN3L9e4ze556B4U3kGVVMGqJ2UdN1A==
X-Received: by 2002:adf:ea8b:: with SMTP id s11mr20813334wrm.413.1615664931780; 
 Sat, 13 Mar 2021 11:48:51 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id g202sm7402468wme.20.2021.03.13.11.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 11:48:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/27] hw/mips/gt64xxx: Rename trace events related to
 interrupt registers
Date: Sat, 13 Mar 2021 20:48:06 +0100
Message-Id: <20210313194829.2193621-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210313194829.2193621-1-f4bug@amsat.org>
References: <20210313194829.2193621-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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

We want to trace all register accesses. First rename the current
gt64120_read / gt64120_write events with '_intreg' suffix, as they
are restricted to interrupt registers.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <20210309142630.728014-5-f4bug@amsat.org>
---
 hw/mips/gt64xxx_pci.c | 16 ++++++++--------
 hw/mips/trace-events  |  4 ++--
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index 8ff31380d74..9a12d00d1e1 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -642,19 +642,19 @@ static void gt64120_writel(void *opaque, hwaddr addr,
         /* not really implemented */
         s->regs[saddr] = ~(~(s->regs[saddr]) | ~(val & 0xfffffffe));
         s->regs[saddr] |= !!(s->regs[saddr] & 0xfffffffe);
-        trace_gt64120_write("INTRCAUSE", size, val);
+        trace_gt64120_write_intreg("INTRCAUSE", size, val);
         break;
     case GT_INTRMASK:
         s->regs[saddr] = val & 0x3c3ffffe;
-        trace_gt64120_write("INTRMASK", size, val);
+        trace_gt64120_write_intreg("INTRMASK", size, val);
         break;
     case GT_PCI0_ICMASK:
         s->regs[saddr] = val & 0x03fffffe;
-        trace_gt64120_write("ICMASK", size, val);
+        trace_gt64120_write_intreg("ICMASK", size, val);
         break;
     case GT_PCI0_SERR0MASK:
         s->regs[saddr] = val & 0x0000003f;
-        trace_gt64120_write("SERR0MASK", size, val);
+        trace_gt64120_write_intreg("SERR0MASK", size, val);
         break;
 
     /* Reserved when only PCI_0 is configured. */
@@ -929,19 +929,19 @@ static uint64_t gt64120_readl(void *opaque,
     /* Interrupts */
     case GT_INTRCAUSE:
         val = s->regs[saddr];
-        trace_gt64120_read("INTRCAUSE", size, val);
+        trace_gt64120_read_intreg("INTRCAUSE", size, val);
         break;
     case GT_INTRMASK:
         val = s->regs[saddr];
-        trace_gt64120_read("INTRMASK", size, val);
+        trace_gt64120_read_intreg("INTRMASK", size, val);
         break;
     case GT_PCI0_ICMASK:
         val = s->regs[saddr];
-        trace_gt64120_read("ICMASK", size, val);
+        trace_gt64120_read_intreg("ICMASK", size, val);
         break;
     case GT_PCI0_SERR0MASK:
         val = s->regs[saddr];
-        trace_gt64120_read("SERR0MASK", size, val);
+        trace_gt64120_read_intreg("SERR0MASK", size, val);
         break;
 
     /* Reserved when only PCI_0 is configured. */
diff --git a/hw/mips/trace-events b/hw/mips/trace-events
index 915139d9811..b7e934c3933 100644
--- a/hw/mips/trace-events
+++ b/hw/mips/trace-events
@@ -1,4 +1,4 @@
 # gt64xxx_pci.c
-gt64120_read(const char *regname, unsigned size, uint64_t value) "gt64120 read %s size:%u value:0x%08" PRIx64
-gt64120_write(const char *regname, unsigned size, uint64_t value) "gt64120 write %s size:%u value:0x%08" PRIx64
+gt64120_read_intreg(const char *regname, unsigned size, uint64_t value) "gt64120 read %s size:%u value:0x%08" PRIx64
+gt64120_write_intreg(const char *regname, unsigned size, uint64_t value) "gt64120 write %s size:%u value:0x%08" PRIx64
 gt64120_isd_remap(uint64_t from_length, uint64_t from_addr, uint64_t to_length, uint64_t to_addr) "ISD: 0x%08" PRIx64 "@0x%08" PRIx64 " -> 0x%08" PRIx64 "@0x%08" PRIx64
-- 
2.26.2


