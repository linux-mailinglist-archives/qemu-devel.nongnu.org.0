Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C61BF2EBD81
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 13:10:22 +0100 (CET)
Received: from localhost ([::1]:52292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx7dt-0008T6-PL
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 07:10:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kx7Zf-0004du-ET
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 07:06:01 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57848
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kx7Zd-0002Cr-Tn
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 07:05:59 -0500
Received: from host109-146-177-189.range109-146.btcentralplus.com
 ([109.146.177.189] helo=kentang.home)
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kx7Zg-0006Sn-3p; Wed, 06 Jan 2021 12:06:04 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Date: Wed,  6 Jan 2021 12:05:25 +0000
Message-Id: <20210106120526.29857-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210106120526.29857-1-mark.cave-ayland@ilande.co.uk>
References: <20210106120526.29857-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.146.177.189
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 3/4] include/hw/sparc/grlib.h: Remove unused set_pil_in_fn
 typedef
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: KONRAD Frederic <frederic.konrad@adacore.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

The grlib.h header defines a set_pil_in_fn typedef which is never
used; remove it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20201212144134.29594-3-peter.maydell@linaro.org>
Reviewed-by: KONRAD Frederic <frederic.konrad@adacore.com>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 include/hw/sparc/grlib.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/hw/sparc/grlib.h b/include/hw/sparc/grlib.h
index e1d1beaa73..2104f493f3 100644
--- a/include/hw/sparc/grlib.h
+++ b/include/hw/sparc/grlib.h
@@ -34,8 +34,6 @@
 /* IRQMP */
 #define TYPE_GRLIB_IRQMP "grlib,irqmp"
 
-typedef void (*set_pil_in_fn) (void *opaque, uint32_t pil_in);
-
 void grlib_irqmp_ack(DeviceState *dev, int intno);
 
 /* GPTimer */
-- 
2.20.1


