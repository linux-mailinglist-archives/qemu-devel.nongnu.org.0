Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E57EF32EFFB
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 17:25:51 +0100 (CET)
Received: from localhost ([::1]:53558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIDGw-0002kZ-Up
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 11:25:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIDCl-0006oZ-Rn
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:21:31 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIDCj-0007KG-LP
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:21:31 -0500
Received: by mail-wr1-x42a.google.com with SMTP id h98so2677725wrh.11
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 08:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kTzOWUKGqF7Ld/iGKjPTw96gS52bnIzue7kcTaEyF0A=;
 b=pfxbPtH/jI83c4YupKkE1LFPlUPQj+VLu0TgEbAPdZhINRU0mz+FXo69duOv8+kBew
 jWGZ0ZFJ1Bxw+uwrh9k+cRrKjNBEb/JL1ayRyNbvTAe9wRvTNqPge067UEnfiE+kan/U
 KQGxVKYVCbYrjO9mXJHS0y9Pt6VvAAgJnQN8e5DRP9cnvEJgJQXx4VJMky58xglYLsyg
 msPx4g2zEWYi3aeVN54ljR33q2oQeDI9kzEDBh+huApC+Py+7Uu1o1qhg5HAT4T35TQV
 ZwfLloRKZOhkAL21KVxwUk5idpFjT/eyZrAF+nrHZ7thzmQbYzPWMSuumjoF06vPNqPF
 YN6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kTzOWUKGqF7Ld/iGKjPTw96gS52bnIzue7kcTaEyF0A=;
 b=lf1IDH1S06l4R4ycr5zi+FWXLonSBisdrgKND3CC706lcY2Gl0g1dXV4ARSVEC4huJ
 bJ+MUNrdhRwD9gy58lXPPrCu/WRHpZl08ZM6GdxfyVF+PP02jyP7XKQr2jUhj7CKfSDs
 nE57zWUqbXj2JNVYisqlbS4HouCnWAYyYwcYocVfySsG/4i/IhXb4jywkJ9/N8N6WdQm
 /EIUfYxKQONHViwWYur4sMT2W6RbkDdNPSQeWkufFPvDdh/LZBac78Lj+10xt8wvIsWV
 vVi8t72CiSwqPf1ax/O6CPNcUOezicWEjyOXh9SKQOGXUTl96sUDbhL/Dosgz06+pVOn
 zu2Q==
X-Gm-Message-State: AOAM532MsG+n6TJSizSTlfnL+lYjntmG41I+R+CosW2lt+9WMH18SSOt
 6INZ3T35B/DQorjDXYbw6J3s05MYQYw=
X-Google-Smtp-Source: ABdhPJywnQJZHSShpVoh4UTDEWKmXEgQNzWV6Rp6s/JxHpStL68LkJb20dazazHeuXuB2kQc7q1Y8w==
X-Received: by 2002:adf:f303:: with SMTP id i3mr10031298wro.67.1614961288160; 
 Fri, 05 Mar 2021 08:21:28 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y10sm4867483wrl.19.2021.03.05.08.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 08:21:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/6] hw/mips/gt64xxx: Rename trace events related to interrupt
 registers
Date: Fri,  5 Mar 2021 17:21:05 +0100
Message-Id: <20210305162107.2233203-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210305162107.2233203-1-f4bug@amsat.org>
References: <20210305162107.2233203-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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

We want to trace all register accesses. First rename the current
gt64120_read / gt64120_write events with '_intreg' suffix, as they
are restricted to interrupt registers.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


