Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AC1559BC6
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 16:43:21 +0200 (CEST)
Received: from localhost ([::1]:54278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4kWl-0004ki-C6
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 10:43:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jkm-0001c6-RH; Fri, 24 Jun 2022 09:53:46 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jkk-0006wY-W8; Fri, 24 Jun 2022 09:53:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HwuYxJXmMxIUIsMZlBhsDz2pYSqDKUVRHYRn/I4psUM=; b=SSQX671yNkslfxjls931yPyVKe
 YTgEJhi6oJzyLD+DSLEDPoIebSY9v2DHA1DLQ3J5hLhcM95CUkICC7GQVGyo++8ECl9v+Uj1Rf6L1
 xWH4GPWBtdgA/XmlsMeXEY9rSbbZd1ibp66QaoDAlrnJ/+fO8XChwuLyDJFiRpw6rOSorbCEAnr/Z
 GGA/5yv7+3nJ2aQOyEFuN/crF9Xbd9vbDo6/dWHwJgECNsawZEIdpVs/KtgA7rqLl7q4oBne5KetW
 HM/tXJeaf2IcNBA99A3lLR3vXnKvL9Kn+da+82ZYnKHwAqtUamGU/0cNLCfyE9YbzVQOnas9EPKWO
 96meBQ6DQtUS8i0vR2kDO0hoNjY7gxIyrEvX+zBaUCsbQ04Gtw3MvHj1Ol+Wf4g8z+OoIyTF2iwD7
 rZsiHvqwI6GPuPyzZ71wDRh98bqkxjkddddtwog5JEmCGNTunfNkMFGwqpTVFNg9EgNjJoDgpDGNn
 oLExUPD2Hk2KPNwkYyuqrf8ChpeCkAIaVdWLRt8D3Ia+cSG4wPz9DUVS85ppSd4hKTdRPcV39xjpt
 zzajjtSkK+xPktrvdZTStyD9yjH+U5ek6PA/n8HPIK7xnBqo8MdUyCMu8u9+F3UXqIjfrLRZlSZqn
 TuYZcc0eBCLi3GPA8lXLWUelYiMa5NPFUnL3MPWMU=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jaO-00037t-Ko; Fri, 24 Jun 2022 14:43:01 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:41:05 +0100
Message-Id: <20220624134109.881989-51-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 50/54] pckbd: add QEMU interface comment for I8042_MMIO
 device
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


