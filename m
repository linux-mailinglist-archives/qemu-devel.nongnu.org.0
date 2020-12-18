Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B27982DDE6E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 07:12:02 +0100 (CET)
Received: from localhost ([::1]:39398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq8zh-0006cH-OY
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 01:12:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8pj-000578-3C
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:01:46 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:9924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=614e9c0eb=alistair.francis@wdc.com>)
 id 1kq8pT-0002G4-Lo
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 01:01:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1608271597; x=1639807597;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B+JkhcmDGmc6Nfc/9mLRaBekoxmwCX7d/r/vy1u3sLM=;
 b=mpyhT33GnUGVOsCeh9noe1j+a1haRqKWOHAG6BwHIGaVgLZuPFPLj0i3
 rLGNjdZ5IU7DzS0B7x0NqxtefoilyZ0IamaOfy2ZJdCtA3Rd7ptbxZg3r
 BlTe8Z3MugL6ggN6YQwI71G9tRFvn8qEBrX3auLmRwYnJcHB62rjZNgC5
 jDyruUEdMPqqXBFUB/r0frQd9G40gSBPSC+FDdKywKIWP5NiUuizMCiSv
 DCr56f9S+jwZ/3gMUIqKwqI5cfov4Ft6oCm77gDrvcdEO/HNgearVnpTZ
 ertCouTodOtYg5DdK6qFbYAgpOiCwqp+5F9aZLMga3JhLvEcHKLro1+yV g==;
IronPort-SDR: nCKImAdcqBzZ8n+Cb3gAt0zkz9ZYYD03wnrsaVDKyE2laWXwrMAjRiaqd4/U7XNimnZdSQcndo
 8s8ZEBTKCa8ow6sNh+/hAiWzAvGHlvUQeA9vPR9Cij3wZlNwDF1Z2D6sdRXRjDgPXb9+lbLKUr
 69QA6YY4BRmL90Q8fBZn+AekjEUhpjUuBmQ4l/e5KHx3ksrMx59Qhaq8NfnXRBuXxCihvN9/de
 E3zN0Vy9ruZTJWwEf1pFLwsfAI0V7Fls/khEdb06ydhbL/pT7af4kWawI0BwN1YvPe2bJZyBQj
 Uso=
X-IronPort-AV: E=Sophos;i="5.78,429,1599494400"; d="scan'208";a="259237042"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Dec 2020 14:06:25 +0800
IronPort-SDR: s3dJSxQQWLQq8PQn7BhOgT2gMmznBoRZFndRBKSSx7GCVBl1WsLsY6ZURVvx2tV8yWSYB6sA7s
 vlYRCfWgb5hJzF3HqYHDraaWgBzsb5Q0PudzKMoVbTmzvgmIeJgwEjC/z25QRbBbWmI09JHukC
 ZkV9Gakgn7O4IG4kOqMtzux1DtITlYHudCcRDLkUT2ETmJLytBfHmrzJdCtD7y+OeggjlKhY7W
 t5I0dHiIeP1gmjbWT52fo3Hne/USc2tkh7Hb8Ib1eA0lxJxgZkravHJnADYq5nTRk95eoYi4/d
 QR2X+vify14KKu7Rxtd78yPe
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2020 21:46:35 -0800
IronPort-SDR: 2KdFiPxvMSV91NlUmU22nYMS/uI29euUS36CnpQEL9fPKnDpacE6QEIrWkH1rx83/AZ7QcCQ3M
 0mfPZ60bIW3O2r594PLW2VN8aANuhsxaqHL/6IvRcupM7OHdHTT6Vv9Ed0I4rkJujeB8+SbUwu
 LVC+2Q9IR5nbWEOb0I4bpKjI1QNEeIhxktHs7S4wkCfI4KFk7R55y5LI/LwtVN7+ZSg+sjzufe
 ga/mvLPyBaD7plrwYxxbQQwxeId+77sWSkDEeh+NFuARjvk11p+IMf/aVHEGHTLue2oF5JSya/
 3fU=
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.68])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Dec 2020 22:01:19 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 06/23] intc/ibex_plic: Clear interrupts that occur during claim
 process
Date: Thu, 17 Dec 2020 22:00:57 -0800
Message-Id: <20201218060114.3591217-7-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218060114.3591217-1-alistair.francis@wdc.com>
References: <20201218060114.3591217-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=614e9c0eb=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Jackie Ke <jackieke724@hotmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Previously if an interrupt occured during the claim process (after the
interrupt is claimed but before it's completed) it would never be
cleared.
This patch ensures that we also clear the hidden_pending bits as well.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Tested-by: Jackie Ke <jackieke724@hotmail.com>
Message-id: 4e9786084a86f220689123cc8a7837af8fa071cf.1607100423.git.alistair.francis@wdc.com
---
 hw/intc/ibex_plic.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/hw/intc/ibex_plic.c b/hw/intc/ibex_plic.c
index 341c9db405..c1b72fcab0 100644
--- a/hw/intc/ibex_plic.c
+++ b/hw/intc/ibex_plic.c
@@ -43,16 +43,23 @@ static void ibex_plic_irqs_set_pending(IbexPlicState *s, int irq, bool level)
 {
     int pending_num = irq / 32;
 
+    if (!level) {
+        /*
+         * If the level is low make sure we clear the hidden_pending.
+         */
+        s->hidden_pending[pending_num] &= ~(1 << (irq % 32));
+    }
+
     if (s->claimed[pending_num] & 1 << (irq % 32)) {
         /*
          * The interrupt has been claimed, but not completed.
          * The pending bit can't be set.
+         * Save the pending level for after the interrupt is completed.
          */
         s->hidden_pending[pending_num] |= level << (irq % 32);
-        return;
+    } else {
+        s->pending[pending_num] |= level << (irq % 32);
     }
-
-    s->pending[pending_num] |= level << (irq % 32);
 }
 
 static bool ibex_plic_irqs_pending(IbexPlicState *s, uint32_t context)
-- 
2.29.2


