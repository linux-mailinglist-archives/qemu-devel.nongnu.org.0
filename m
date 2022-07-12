Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0892572946
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 00:26:14 +0200 (CEST)
Received: from localhost ([::1]:53302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBOKb-0007ga-Ki
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 18:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNqa-0004WS-N3; Tue, 12 Jul 2022 17:55:12 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNqZ-0007y1-3s; Tue, 12 Jul 2022 17:55:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4SGkGXr1/y9u8npp54SOz4TilYqVNmQFSGSm53nVSZE=; b=cLaOqiwUGO35GWWIEzP8/kLjP5
 jktlckfUppsrPI5wMEyxhFpRKGH7nWu6cOawT50a84T5ZVpia5iYU24f4swmws17WCjQmciuXw/l3
 WeMTUohCpLGCR67QdKZMDljlTqw/VFZ1lT3f5xWkc/8NwU0zVpe46a9oXPky/fQHJqJ8BtZsB/Q3V
 oaGeKP0xQdDG6caxmRH2g4LMhgr7xhh8ar59FUSz7K/ymavadkf6JoRHpxKwEoIX1/P2tQlcnLFY9
 POyfrwe608uMtEYEhReRf8mi5bVJ5aXxNaUNNCRkCvdxSh9rmG7+qfeTWHMvCKdF5g3ksfbfnRajM
 Jb4HEqydHwygczFerTuDL6DdkmXC6Hx+0/n30Uh/79UTjs2q0kGBfh/znoJn7RrkF1fWdQAiaxjU4
 jOSLKikdocEHaqsNhphTymhJADNpjr/3TYFN9Jq5W3MP5oHVTFIyEy76++QKxMPuVVBrmX9dQZif6
 ijK747UkSmetAjvYVnJ2xfBGbXHz5gUfAFR57CHO9xKq3CGvZhL54AuiS3GeCOwLFGvca8uQXF3vN
 Hzdpe31rYowr1hFBvuRPN2TBftrpcrodz0XxQ3vjf4M1rHkMqKD+4xsWDPNFp/w0+tJ63m5N/PAOu
 WIKIRqRiiUtAYLAHOy4USZ4aUoUA4i79exBhNPJV8=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNoq-000Bqt-OP; Tue, 12 Jul 2022 22:53:28 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:41 +0100
Message-Id: <20220712215251.7944-31-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 30/40] lasips2: standardise on lp name for LASIPS2Port
 variables
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is shorter to type and keeps the naming convention consistent within the
LASIPS2 device.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/lasips2.c | 52 +++++++++++++++++++++++-----------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 0f392e2bee..09d909c843 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -139,28 +139,28 @@ static void lasips2_set_irq(void *opaque, int n, int level)
 static void lasips2_reg_write(void *opaque, hwaddr addr, uint64_t val,
                               unsigned size)
 {
-    LASIPS2Port *port = opaque;
+    LASIPS2Port *lp = LASIPS2_PORT(opaque);
 
-    trace_lasips2_reg_write(size, port->id, addr,
+    trace_lasips2_reg_write(size, lp->id, addr,
                             lasips2_write_reg_name(addr), val);
 
     switch (addr & 0xc) {
     case REG_PS2_CONTROL:
-        port->control = val;
+        lp->control = val;
         break;
 
     case REG_PS2_XMTDATA:
-        if (port->control & LASIPS2_CONTROL_LOOPBACK) {
-            port->buf = val;
-            port->loopback_rbne = true;
-            qemu_set_irq(port->irq, 1);
+        if (lp->control & LASIPS2_CONTROL_LOOPBACK) {
+            lp->buf = val;
+            lp->loopback_rbne = true;
+            qemu_set_irq(lp->irq, 1);
             break;
         }
 
-        if (port->id) {
-            ps2_write_mouse(PS2_MOUSE_DEVICE(port->ps2dev), val);
+        if (lp->id) {
+            ps2_write_mouse(PS2_MOUSE_DEVICE(lp->ps2dev), val);
         } else {
-            ps2_write_keyboard(PS2_KBD_DEVICE(port->ps2dev), val);
+            ps2_write_keyboard(PS2_KBD_DEVICE(lp->ps2dev), val);
         }
         break;
 
@@ -176,53 +176,53 @@ static void lasips2_reg_write(void *opaque, hwaddr addr, uint64_t val,
 
 static uint64_t lasips2_reg_read(void *opaque, hwaddr addr, unsigned size)
 {
-    LASIPS2Port *port = opaque;
+    LASIPS2Port *lp = LASIPS2_PORT(opaque);
     uint64_t ret = 0;
 
     switch (addr & 0xc) {
     case REG_PS2_ID:
-        ret = port->id;
+        ret = lp->id;
         break;
 
     case REG_PS2_RCVDATA:
-        if (port->control & LASIPS2_CONTROL_LOOPBACK) {
-            port->loopback_rbne = false;
-            qemu_set_irq(port->irq, 0);
-            ret = port->buf;
+        if (lp->control & LASIPS2_CONTROL_LOOPBACK) {
+            lp->loopback_rbne = false;
+            qemu_set_irq(lp->irq, 0);
+            ret = lp->buf;
             break;
         }
 
-        ret = ps2_read_data(port->ps2dev);
+        ret = ps2_read_data(lp->ps2dev);
         break;
 
     case REG_PS2_CONTROL:
-        ret = port->control;
+        ret = lp->control;
         break;
 
     case REG_PS2_STATUS:
         ret = LASIPS2_STATUS_DATSHD | LASIPS2_STATUS_CLKSHD;
 
-        if (port->control & LASIPS2_CONTROL_DIAG) {
-            if (!(port->control & LASIPS2_CONTROL_DATDIR)) {
+        if (lp->control & LASIPS2_CONTROL_DIAG) {
+            if (!(lp->control & LASIPS2_CONTROL_DATDIR)) {
                 ret &= ~LASIPS2_STATUS_DATSHD;
             }
 
-            if (!(port->control & LASIPS2_CONTROL_CLKDIR)) {
+            if (!(lp->control & LASIPS2_CONTROL_CLKDIR)) {
                 ret &= ~LASIPS2_STATUS_CLKSHD;
             }
         }
 
-        if (port->control & LASIPS2_CONTROL_LOOPBACK) {
-            if (port->loopback_rbne) {
+        if (lp->control & LASIPS2_CONTROL_LOOPBACK) {
+            if (lp->loopback_rbne) {
                 ret |= LASIPS2_STATUS_RBNE;
             }
         } else {
-            if (!ps2_queue_empty(port->ps2dev)) {
+            if (!ps2_queue_empty(lp->ps2dev)) {
                 ret |= LASIPS2_STATUS_RBNE;
             }
         }
 
-        if (port->lasips2->int_status) {
+        if (lp->lasips2->int_status) {
             ret |= LASIPS2_STATUS_CMPINTR;
         }
         break;
@@ -233,7 +233,7 @@ static uint64_t lasips2_reg_read(void *opaque, hwaddr addr, unsigned size)
         break;
     }
 
-    trace_lasips2_reg_read(size, port->id, addr,
+    trace_lasips2_reg_read(size, lp->id, addr,
                            lasips2_read_reg_name(addr), ret);
     return ret;
 }
-- 
2.30.2


