Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB68419946B
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 12:56:04 +0200 (CEST)
Received: from localhost ([::1]:35892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJEYt-00087t-Qp
	for lists+qemu-devel@lfdr.de; Tue, 31 Mar 2020 06:56:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52980)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jJEU5-0002Rr-31
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 06:51:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jJEU3-0006Kn-Um
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 06:51:04 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39868)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jJEU3-0006Jo-OJ
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 06:51:03 -0400
Received: by mail-wr1-x42a.google.com with SMTP id p10so25307423wrt.6
 for <qemu-devel@nongnu.org>; Tue, 31 Mar 2020 03:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dEC1bGb3P9A30oXg5tR4om/EOk+NZGxuzJFx+2IxYmA=;
 b=N8Jg/+Z9wzqrZ2RKQHcN41u9xSqe48OAgOB8KwoSTIkUiMhs02J+alroqO56KZj9Dr
 odx5y8AxsACmsU/sNaIPn+f9BbjsmA3F1JkzZMRwU+YGriwxWuwClpaZ9KDhtRYkC88Q
 wrwDyM16CRyDtr7oLT23FDV1JVJ33T7wLgGqRjxOcbO4Nw9UA13gXdjz/AdqP7MW/n9g
 33Gx3mRywWZX6V/GTJsGjToiaCMrEwVyP3/OCSWHSxO9MCuo8gmzUiJjxTgSVNhobbrD
 TczWUTxoW1yxIIBiRhLBO5I1poYtMnQEPKo7CXNDmnUtEJjlm2O7T5EfnT+C1tNg7H9n
 PJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dEC1bGb3P9A30oXg5tR4om/EOk+NZGxuzJFx+2IxYmA=;
 b=n9UUS8PwKxBcOnHhdoJyeLBnPH2Sro+RrLyA/LTzsbN6ptOplHVDLULpWjgg2lX8MF
 A3HCV3bhsl43AvsNBTTrLti2ZAIpXeX/6ztSfxJGO4JXeDHTABnwXI1f1mIQErsVuNKL
 TWVUuySFyxNMVjMnx2kXrANCojr2RFNw3w0OiNnCKOFSSIcMqph3qNXjf/sY2lHoaOBY
 CTeH/jUVULBt1wmCY7iZaXIhTPE2rjlGk92BPy/O4f+fmLCzqQEaQIF21jgoIwSAUo2J
 dblNj96h8VpzVbseF6gEMgEB8gpALS+klkJkdRoHg3pchu1+RkRpeUdQkdX6hdvceOfj
 CCPw==
X-Gm-Message-State: ANhLgQ0Osx/uZrzKJZX6z31jSu8j0iVyexMWLk4oBc/o0G8L4kLAI8Qg
 0SF2oari4+6fdqsdIHu+T5PoHHMgmrw=
X-Google-Smtp-Source: ADFU+vsuqFR7gRmyHV8ugr5RIWVdBtijl4He6v/cvZKXw9SKrXeIm5DHGDINiMCK8qhD/R76pyFILQ==
X-Received: by 2002:a5d:6a43:: with SMTP id t3mr18991985wrw.87.1585651862468; 
 Tue, 31 Mar 2020 03:51:02 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id w3sm26042830wrn.31.2020.03.31.03.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 03:51:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1 4/7] hw/misc/grlib_ahb_apb_pnp: Add trace events on
 read accesses
Date: Tue, 31 Mar 2020 12:50:45 +0200
Message-Id: <20200331105048.27989-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200331105048.27989-1-f4bug@amsat.org>
References: <20200331105048.27989-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42a
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, Jiri Gaisler <jiri@gaisler.se>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/misc/grlib_ahb_apb_pnp.c | 13 +++++++++++--
 hw/misc/trace-events        |  4 ++++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/hw/misc/grlib_ahb_apb_pnp.c b/hw/misc/grlib_ahb_apb_pnp.c
index d22ed00206..43e001c3c7 100644
--- a/hw/misc/grlib_ahb_apb_pnp.c
+++ b/hw/misc/grlib_ahb_apb_pnp.c
@@ -25,6 +25,7 @@
 #include "qemu/log.h"
 #include "hw/sysbus.h"
 #include "hw/misc/grlib_ahb_apb_pnp.h"
+#include "trace.h"
 
 #define GRLIB_PNP_VENDOR_SHIFT (24)
 #define GRLIB_PNP_VENDOR_SIZE   (8)
@@ -132,8 +133,12 @@ void grlib_ahb_pnp_add_entry(AHBPnp *dev, uint32_t address, uint32_t mask,
 static uint64_t grlib_ahb_pnp_read(void *opaque, hwaddr offset, unsigned size)
 {
     AHBPnp *ahb_pnp = GRLIB_AHB_PNP(opaque);
+    uint32_t val;
 
-    return ahb_pnp->regs[offset >> 2];
+    val = ahb_pnp->regs[offset >> 2];
+    trace_grlib_ahb_pnp_read(offset, val);
+
+    return val;
 }
 
 static void grlib_ahb_pnp_write(void *opaque, hwaddr addr,
@@ -239,8 +244,12 @@ void grlib_apb_pnp_add_entry(APBPnp *dev, uint32_t address, uint32_t mask,
 static uint64_t grlib_apb_pnp_read(void *opaque, hwaddr offset, unsigned size)
 {
     APBPnp *apb_pnp = GRLIB_APB_PNP(opaque);
+    uint32_t val;
 
-    return apb_pnp->regs[offset >> 2];
+    val = apb_pnp->regs[offset >> 2];
+    trace_grlib_apb_pnp_read(offset, val);
+
+    return val;
 }
 
 static void grlib_apb_pnp_write(void *opaque, hwaddr addr,
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index a5862b2bed..9387664823 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -198,3 +198,7 @@ via1_rtc_cmd_pram_read(int addr, int value) "addr=%u value=0x%02x"
 via1_rtc_cmd_pram_write(int addr, int value) "addr=%u value=0x%02x"
 via1_rtc_cmd_pram_sect_read(int sector, int offset, int addr, int value) "sector=%u offset=%u addr=%d value=0x%02x"
 via1_rtc_cmd_pram_sect_write(int sector, int offset, int addr, int value) "sector=%u offset=%u addr=%d value=0x%02x"
+
+# grlib_ahb_apb_pnp.c
+grlib_ahb_pnp_read(uint64_t addr, uint32_t value) "AHB PnP read addr:0x%03"PRIx64" data:0x%08x"
+grlib_apb_pnp_read(uint64_t addr, uint32_t value) "APB PnP read addr:0x%03"PRIx64" data:0x%08x"
-- 
2.21.1


