Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2983D51F0FF
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 22:12:01 +0200 (CEST)
Received: from localhost ([::1]:59156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnnG4-0005pF-8E
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 16:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nnn2i-0006hf-94
 for qemu-devel@nongnu.org; Sun, 08 May 2022 15:58:13 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:55230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nnn2g-00071V-Mw
 for qemu-devel@nongnu.org; Sun, 08 May 2022 15:58:11 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nnn1h-0000yR-PU; Sun, 08 May 2022 20:57:13 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Sun,  8 May 2022 20:56:12 +0100
Message-Id: <20220508195650.28590-16-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220508195650.28590-1-mark.cave-ayland@ilande.co.uk>
References: <20220508195650.28590-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 15/53] dino.h: add defines for DINO IRQ numbers
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

This is to allow the DINO IRQs to be defined as qdev GPIOs.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
Message-Id: <20220504092600.10048-16-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/hppa/dino.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/hppa/dino.h b/hw/hppa/dino.h
index 1a26667377..70fb8c52c8 100644
--- a/hw/hppa/dino.h
+++ b/hw/hppa/dino.h
@@ -58,6 +58,18 @@ OBJECT_DECLARE_SIMPLE_TYPE(DinoState, DINO_PCI_HOST_BRIDGE)
 #define DINO_LOCAL_IRQS   (DINO_IRQS + 1)
 #define DINO_MASK_IRQ(x)  (1 << (x))
 
+#define DINO_IRQ_PCIINTA   0
+#define DINO_IRQ_PCIINTB   1
+#define DINO_IRQ_PCIINTC   2
+#define DINO_IRQ_PCIINTD   3
+#define DINO_IRQ_PCIINTE   4
+#define DINO_IRQ_PCIINTF   5
+#define DINO_IRQ_GSCEXTINT 6
+#define DINO_IRQ_BUSERRINT 7
+#define DINO_IRQ_PS2INT    8
+#define DINO_IRQ_UNUSED    9
+#define DINO_IRQ_RS232INT  10
+
 #define PCIINTA   0x001
 #define PCIINTB   0x002
 #define PCIINTC   0x004
-- 
2.20.1


