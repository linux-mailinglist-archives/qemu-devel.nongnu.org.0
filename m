Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFD450A958
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 21:38:17 +0200 (CEST)
Received: from localhost ([::1]:48108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhcd6-0005i3-QN
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 15:38:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcX8-0007NJ-Cz
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:32:07 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:33548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcX6-0005fz-Vr
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:32:06 -0400
Received: from [2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcW7-000Caf-48; Thu, 21 Apr 2022 20:31:03 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Thu, 21 Apr 2022 20:30:33 +0100
Message-Id: <20220421193100.5098-24-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220421193100.5098-1-mark.cave-ayland@ilande.co.uk>
References: <20220421193100.5098-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 23/50] lasi: checkpatch fixes
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/hppa/lasi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/hppa/lasi.c b/hw/hppa/lasi.c
index 88c3791eb6..3b77fba1c6 100644
--- a/hw/hppa/lasi.c
+++ b/hw/hppa/lasi.c
@@ -169,10 +169,11 @@ static MemTxResult lasi_chip_write_with_attrs(void *opaque, hwaddr addr,
         break;
     case LASI_IMR:
         s->imr = val;
-        if (((val & LASI_IRQ_BITS) != val) && (val != 0xffffffff))
+        if (((val & LASI_IRQ_BITS) != val) && (val != 0xffffffff)) {
             qemu_log_mask(LOG_GUEST_ERROR,
                 "LASI: tried to set invalid %lx IMR value.\n",
                 (unsigned long) val);
+        }
         break;
     case LASI_IPR:
         /* Any write to IPR clears the register. */
@@ -200,8 +201,9 @@ static MemTxResult lasi_chip_write_with_attrs(void *opaque, hwaddr addr,
         break;
 
     case LASI_PCR:
-        if (val == 0x02) /* immediately power off */
+        if (val == 0x02) { /* immediately power off */
             qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+        }
         break;
     case LASI_ERRLOG:
         s->errlog = val;
-- 
2.20.1


