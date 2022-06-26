Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F1F55B382
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 20:31:36 +0200 (CEST)
Received: from localhost ([::1]:46688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5X2l-0008W5-P2
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 14:31:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WS3-0005Xl-Cp
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:53:39 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WS1-0000wm-9D
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:53:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zQKkpwGZxCh3KoMzMCtFItcG/IrBQ8JhFurBTqhXVJ4=; b=N83zQL7U9DRAOsDpjEFRHsXY35
 mk2vU7kCnR11ilojQoEhawPXwVyzOZvODKmlrHfiEsA+qMXSwCm0FSNyvCuwa9l6/OgX8XVgM5N+1
 Jhz9BszqCuVH98ie0rfoWj3Z8ikrcAZq45HAmyDs4X2n4CjmDDV0oe4h3kV6exwaRhtgwQEAJNLhq
 /EYuy9bzeNyz2sQmSDLyo9N5gtPR5crFlsIAwfhl7wmhZn4grN+u5wj+bD0l4HwfdslIYQRQQsYxF
 6LlQn3/kjcwQhqAbcjRzwZEaapFugfFF9kHKeb0c1i3y7p3AKQ8jmQpuXTT/UtaivZpxaND+E6mGY
 4VK+WeKlnzWUJrqoDcyWKfgqqUQKHYBly8KypQn80yn3Bbgm/yFRai19wBLL7CnrO4ebIgV39mnrD
 C8sg49N4gnDGzzVdiDHyeUOms/WyT0YZWgY93n0bllHTbcGNe0q67PT16gjRp7S1ybY6v10PTjhCY
 /HiLMhc+IA6O45mZfvP8HTjsou4muRK5YPoOQPLFB8UpfdAQDJ/sboVkZ3yirQ9VNjRzHTt5EbxUJ
 q95NareW1SLQuE6JgKrDAuN9qchaLOhqqExzyPCirMoj5PnZ+b/bOd3nmfn30+HzFkUG4GS2GTUyg
 Y9uWILHRjMrSi7tHlRlUz+R9cN7/ly/tbaCNyBBF0=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WM9-0007KY-No; Sun, 26 Jun 2022 18:47:37 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Date: Sun, 26 Jun 2022 18:45:26 +0100
Message-Id: <20220626174531.969187-51-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
References: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 50/55] pckbd: add QEMU interface comment for I8042_MMIO device
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

This describes the I8042_MMIO device interface implemented within QEMU.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220624134109.881989-51-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/input/i8042.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
index 4ba2664377..d4747b62b8 100644
--- a/include/hw/input/i8042.h
+++ b/include/hw/input/i8042.h
@@ -52,6 +52,17 @@ struct ISAKBDState {
     uint8_t mouse_irq;
 };
 
+/*
+ * QEMU interface:
+ * + sysbus MMIO region 0: MemoryRegion defining the command/status/data
+ *   registers (access determined by mask property and access type)
+ * + Named GPIO input "ps2-kbd-input-irq": set to 1 if the downstream PS2
+ *   keyboard device has asserted its irq
+ * + Named GPIO input "ps2-mouse-input-irq": set to 1 if the downstream PS2
+ *   mouse device has asserted its irq
+ * + Unnamed GPIO output 0-1: i8042 output irqs for keyboard (0) or mouse (1)
+ */
+
 #define TYPE_I8042_MMIO "i8042-mmio"
 OBJECT_DECLARE_SIMPLE_TYPE(MMIOKBDState, I8042_MMIO)
 
-- 
2.30.2


