Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E3A332963
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 15:58:47 +0100 (CET)
Received: from localhost ([::1]:35048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJdos-0004gu-7w
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 09:58:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdK4-0004Rq-Bp
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:26:56 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:40499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdK2-00069e-QM
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:26:56 -0500
Received: by mail-ej1-x62d.google.com with SMTP id ci14so28095439ejc.7
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kTzOWUKGqF7Ld/iGKjPTw96gS52bnIzue7kcTaEyF0A=;
 b=P1E0nl4ApF344B/DEimob+BwmXQW9S6iciz3emiux8uHmIECrr+jOfxXv324ArZ/l3
 5BuuX6hvFHbT9qJWtQSEbwze4CfsdP+z+PJKqQjfN0i5n6VU110tmesCMonhmBwmTajq
 BZeIcMu/tl5rYLi0ZcszMQ7boFmRCgTcVw4cDDnnSWUhRkMS3CdFz0/7FNcLbnisJ6rQ
 jl3qZDAT7XdS2PZTd0jKEJ5BlLmwTR/CCY3d7Ejzyr2l2Cc86utx0tG8mABGNwHC8Y0D
 P7lCO/B5OIXd1kP97nH3nr+U/huyr0a8f1mJDxoFavbC2yD9McRM4FZSuPDVaVAV4fvw
 RKUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kTzOWUKGqF7Ld/iGKjPTw96gS52bnIzue7kcTaEyF0A=;
 b=KjiN2Ugr1iFB+7x5QkfEgZ4zNQrH2fmfYejcJQCWKJGiKtF0XPJsBEqWOYB1si8jkr
 N7iwY/0hrUhTd++jTj7LyS6WafVaejPDGBK5NytgYDNAsKPh9ktP/+6lXE6ycBpLgz/M
 Obf1qYYsXXWZfq6t2GZia7kxsiB2sfXeAFx95Ao1fxMTKIO8klliuTLafzXP0ogby4M3
 lvcq1nQY15iR2AFjXIBXhgPdwaH1VQfc5IiWLlL5HS3FWtKzp9+zbiVdYKueRpTmBn2E
 RLsdNTBu/TaCF9xQcf4KLoXPxsaQU0L4qwOlkxugD7PKxJP379sdOvvm+9PjPfzT6k1P
 HhjQ==
X-Gm-Message-State: AOAM530DM/nrikJK0iVpaQxecV4VJnG+Os1nbQKuvJHFCnI+3fyOBclr
 Zc1HH6CVRvKW/ue0oHhZCI99TV0o79A=
X-Google-Smtp-Source: ABdhPJw1XqhAvLADOuBl1+YA1ITDwzXbDHzpgnzAGtL0saGD7JJTelhu2DDZ9z6mM6SVcOgEnV8Sew==
X-Received: by 2002:a17:906:3849:: with SMTP id
 w9mr20939996ejc.7.1615300013215; 
 Tue, 09 Mar 2021 06:26:53 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id fi11sm8334289ejb.73.2021.03.09.06.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:26:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND 4/6] hw/mips/gt64xxx: Rename trace events related to
 interrupt registers
Date: Tue,  9 Mar 2021 15:26:28 +0100
Message-Id: <20210309142630.728014-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309142630.728014-1-f4bug@amsat.org>
References: <20210309142630.728014-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62d.google.com
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


