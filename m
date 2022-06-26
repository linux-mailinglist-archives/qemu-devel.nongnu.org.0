Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7D855B37F
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 20:27:18 +0200 (CEST)
Received: from localhost ([::1]:38176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5Wyb-0002Xr-Qi
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 14:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WNR-000576-HO
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:48:53 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WNQ-0000Gy-2l
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:48:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z783vrdJX4jvHDoeJCTvbpadpC7HUVDKNfmziNDxwEo=; b=HRE+NpjpB+yVQiPXX/FNfCsHsK
 N504Ya/WWNiHZbjIvjrTIyrguHhq1HQAMr8L7b5YdNO3i1w2qckId8/v1hDa8aNfvG7qh3SpyzTeC
 kWTBm5PHgGtT+x5QEn9xUcIGqQWI2YW6yOs1yEAi0YDr8+Gte/0IYw11lV2W2DW/AHFpLQwp/EjVV
 X8qcN9P8bsqER0O/p/SIGe1Q9TKEzlhK9SAmwryZnBpFC55HhGt+TL98C6aYrc3MPhd2L/397Ck1h
 Q5LHS+cQRRHz4N08sUEI/EdBvH3Sez+MruGU7P428/+WJdFo+xxM3OtZwxH6Qxecx6Qobz1MypK/n
 T0DcTh1ojN4mu3vUpyiIU95siRr1a1WuSLGh1/sImPHOfKE9TWRtWZs4XfL0tx/6ccIQqUIDb1iw1
 D8fSnCJO0zs3pIhwybkuhMZToVOiQmdNLLhQyuMEcgS1ZQM+r+AFMuGC1TYvT1JNEMM1tOoANoPnP
 t1bgQ0aRFr8wzpUpVtvztp0XiVrN6rJBmjnGsMmMyvusobAXdc3sfFptuRDTMG+emZH72PpmAPuR2
 hWMRjjBtAbRnqNRWnVN8nTaIrS0sWetc4hSOaDWau7PiFmm8+ySAD0R0HVu3LKphg5D/j0WwUaK7U
 eLl5H6O9Ri/oCjgS5zRaGzwUOcYx0z/QUFv9irvd8=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WM2-0007KY-Gd; Sun, 26 Jun 2022 18:47:30 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Date: Sun, 26 Jun 2022 18:45:24 +0100
Message-Id: <20220626174531.969187-49-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
References: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 48/55] lasips2: add QEMU interface comment
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

This describes the LASI PS2 device interface implemented within QEMU.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220624134109.881989-49-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/input/lasips2.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/hw/input/lasips2.h b/include/hw/input/lasips2.h
index 7e4437b925..03f0c9e9f9 100644
--- a/include/hw/input/lasips2.h
+++ b/include/hw/input/lasips2.h
@@ -4,6 +4,20 @@
  * Copyright (c) 2019 Sven Schnelle
  *
  */
+
+/*
+ * QEMU interface:
+ * + sysbus MMIO region 0: MemoryRegion defining the LASI PS2 keyboard
+ *   registers
+ * + sysbus MMIO region 1: MemoryRegion defining the LASI PS2 mouse
+ *   registers
+ * + sysbus IRQ 0: LASI PS2 output irq
+ * + Named GPIO input "ps2-kbd-input-irq": set to 1 if the downstream PS2
+ *   keyboard device has asserted its irq
+ * + Named GPIO input "ps2-mouse-input-irq": set to 1 if the downstream PS2
+ *   mouse device has asserted its irq
+ */
+
 #ifndef HW_INPUT_LASIPS2_H
 #define HW_INPUT_LASIPS2_H
 
-- 
2.30.2


