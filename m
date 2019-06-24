Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FEB51E8A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jun 2019 00:47:04 +0200 (CEST)
Received: from localhost ([::1]:55186 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfXjr-0001rV-KX
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 18:47:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34166)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1hfXSP-0004Aw-9L
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 18:29:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1hfXSN-0005OD-Te
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 18:29:01 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:55970)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1hfXSL-0005Ke-MV
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 18:28:57 -0400
Received: by mail-wm1-x343.google.com with SMTP id a15so820436wmj.5
 for <qemu-devel@nongnu.org>; Mon, 24 Jun 2019 15:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XPVQ0Q7g0XVbgaspN3zKRxgg/gjh0Nu7ZJZjIIHtzpA=;
 b=MGuAyROEiihriTMfcWbLTvFHkTjaNVDMc20j78Y0Z7fN5y6m7a+yT+lajIX89VzuBL
 wQImMxi9bh0cGyV4PmYNxainGfi7hc8kTZCo4YHn+PtvWJOSQXz2i4oVduTo9kJUsjyH
 FicrZ1WmatowRuK2UVexMc5qUxktigwvSQ8ZzxoxxHgFNFMCbg+AakE1FuksvXK8ujT0
 jd8u8uZH/Wq/kstoQFRSA2+SmWGcUnRZvMIhzl2L9H8r++c6BbfaM8Szy+ivrNPz/GX7
 p9NpcrucAyXIAB2D4tD8TVZmpk89n+gLxhg/ZVhgWpTwCPnGFykZFtEVp7D6LvoHxQ/X
 FPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XPVQ0Q7g0XVbgaspN3zKRxgg/gjh0Nu7ZJZjIIHtzpA=;
 b=BDzq8/HPfEc6vaXDNlbxgNT1n0fQ1Mady3SRJ2jx2JC4ivcguZjiyPsX9dkpKO0+MO
 Tk1yKIg41KnVpXs3IqmRce95MsYyYtt2MfSShrmo8wxBTp7vpYuOXdf14DEzitmNoB+L
 cpTnZIv483fZvRcC2iVFl6nOYYAvwalb8PAbQjpVWS8cPiPQfJUHtOSZglQd8h0VTAmx
 CJA4Z60/63MVbFTojNwK6BThxyj1OpJI4tvCGzlzr2ezJOYkFtndCE4aIIpnFYmgTQEA
 nxcZ/2ZmI4/0RkYcYdz0bN19TE0vACwktH1TptpeTPWoVcE8RnUrGz1XfCPxXbiLyRZt
 Nqzw==
X-Gm-Message-State: APjAAAWLEb0DF4h/vYlpJR8lVyg4X+PdY/TPRk/U2tQ1lhP+jZTXKYoT
 uXBYWpLXjg+O3keeM+e3YtAB7RCI
X-Google-Smtp-Source: APXvYqxivGlhMAVo+PqGcY4XCw/vTqmKsyeryQuLNjwq5rdTl/mEYKIU6NvnOtbPxd7PDhWEUcbewg==
X-Received: by 2002:a7b:c051:: with SMTP id u17mr16886669wmc.25.1561415334291; 
 Mon, 24 Jun 2019 15:28:54 -0700 (PDT)
Received: from x1.local (183.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.183])
 by smtp.gmail.com with ESMTPSA id l1sm646781wmg.13.2019.06.24.15.28.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 24 Jun 2019 15:28:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Date: Tue, 25 Jun 2019 00:28:40 +0200
Message-Id: <20190624222844.26584-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190624222844.26584-1-f4bug@amsat.org>
References: <20190624222844.26584-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-devel] [PATCH 06/10] hw/mips/gt64xxx_pci: Convert debug
 printf()s to trace events
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 Makefile.objs         |  1 +
 hw/mips/gt64xxx_pci.c | 29 ++++++++++-------------------
 hw/mips/trace-events  |  4 ++++
 3 files changed, 15 insertions(+), 19 deletions(-)
 create mode 100644 hw/mips/trace-events

diff --git a/Makefile.objs b/Makefile.objs
index 658cfc9d9f..3b83621f32 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -163,6 +163,7 @@ trace-events-subdirs += hw/input
 trace-events-subdirs += hw/intc
 trace-events-subdirs += hw/isa
 trace-events-subdirs += hw/mem
+trace-events-subdirs += hw/mips
 trace-events-subdirs += hw/misc
 trace-events-subdirs += hw/misc/macio
 trace-events-subdirs += hw/net
diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
index f44326f14f..815ef0711d 100644
--- a/hw/mips/gt64xxx_pci.c
+++ b/hw/mips/gt64xxx_pci.c
@@ -30,14 +30,7 @@
 #include "hw/pci/pci_host.h"
 #include "hw/i386/pc.h"
 #include "exec/address-spaces.h"
-
-//#define DEBUG
-
-#ifdef DEBUG
-#define DPRINTF(fmt, ...) fprintf(stderr, "%s: " fmt, __func__, ##__VA_ARGS__)
-#else
-#define DPRINTF(fmt, ...)
-#endif
+#include "trace.h"
 
 #define GT_REGS                 (0x1000 >> 2)
 
@@ -294,9 +287,7 @@ static void gt64120_isd_mapping(GT64120State *s)
     check_reserved_space(&start, &length);
     length = 0x1000;
     /* Map new address */
-    DPRINTF("ISD: "TARGET_FMT_plx"@"TARGET_FMT_plx
-        " -> "TARGET_FMT_plx"@"TARGET_FMT_plx"\n",
-        s->ISD_length, s->ISD_start, length, start);
+    trace_gt64120_isd_remap(s->ISD_length, s->ISD_start, length, start);
     s->ISD_start = start;
     s->ISD_length = length;
     memory_region_add_subregion(get_system_memory(), s->ISD_start, &s->ISD_mem);
@@ -648,19 +639,19 @@ static void gt64120_writel(void *opaque, hwaddr addr,
         /* not really implemented */
         s->regs[saddr] = ~(~(s->regs[saddr]) | ~(val & 0xfffffffe));
         s->regs[saddr] |= !!(s->regs[saddr] & 0xfffffffe);
-        DPRINTF("INTRCAUSE %" PRIx64 "\n", val);
+        trace_gt64120_write("INTRCAUSE", size << 1, val);
         break;
     case GT_INTRMASK:
         s->regs[saddr] = val & 0x3c3ffffe;
-        DPRINTF("INTRMASK %" PRIx64 "\n", val);
+        trace_gt64120_write("INTRMASK", size << 1, val);
         break;
     case GT_PCI0_ICMASK:
         s->regs[saddr] = val & 0x03fffffe;
-        DPRINTF("ICMASK %" PRIx64 "\n", val);
+        trace_gt64120_write("ICMASK", size << 1, val);
         break;
     case GT_PCI0_SERR0MASK:
         s->regs[saddr] = val & 0x0000003f;
-        DPRINTF("SERR0MASK %" PRIx64 "\n", val);
+        trace_gt64120_write("SERR0MASK", size << 1, val);
         break;
 
     /* Reserved when only PCI_0 is configured. */
@@ -936,19 +927,19 @@ static uint64_t gt64120_readl(void *opaque,
     /* Interrupts */
     case GT_INTRCAUSE:
         val = s->regs[saddr];
-        DPRINTF("INTRCAUSE %x\n", val);
+        trace_gt64120_read("INTRCAUSE", size << 1, val);
         break;
     case GT_INTRMASK:
         val = s->regs[saddr];
-        DPRINTF("INTRMASK %x\n", val);
+        trace_gt64120_read("INTRMASK", size << 1, val);
         break;
     case GT_PCI0_ICMASK:
         val = s->regs[saddr];
-        DPRINTF("ICMASK %x\n", val);
+        trace_gt64120_read("ICMASK", size << 1, val);
         break;
     case GT_PCI0_SERR0MASK:
         val = s->regs[saddr];
-        DPRINTF("SERR0MASK %x\n", val);
+        trace_gt64120_read("SERR0MASK", size << 1, val);
         break;
 
     /* Reserved when only PCI_0 is configured. */
diff --git a/hw/mips/trace-events b/hw/mips/trace-events
new file mode 100644
index 0000000000..75d4c73f2e
--- /dev/null
+++ b/hw/mips/trace-events
@@ -0,0 +1,4 @@
+# gt64xxx.c
+gt64120_read(const char *regname, int width, uint64_t value) "gt64120 read %s value:0x%0*" PRIx64
+gt64120_write(const char *regname, int width, uint64_t value) "gt64120 write %s value:0x%0*" PRIx64
+gt64120_isd_remap(uint64_t from_length, uint64_t from_addr, uint64_t to_length, uint64_t to_addr) "ISD: 0x%08" PRIx64 "@0x%08" PRIx64 " -> 0x%08" PRIx64 "@0x%08" PRIx64
-- 
2.19.1


