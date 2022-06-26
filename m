Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD0855B37D
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 20:26:22 +0200 (CEST)
Received: from localhost ([::1]:34424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5Wxh-0008H0-5C
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 14:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WSG-0005rU-ID
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:53:52 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WSF-0000xp-5K
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:53:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8eCfNUm5vJhjFcFCMiawsT7CCWIH9C+rsIP8prC6Kc8=; b=nQTgUWmbVnemoYTa4OY5q3KgeW
 THltCN02P7sD9+KExR3BdXAD9QamkoKlcHUkeyYPYURfr9Z6Vn9sNyFwHJ7b9S+VLMHMl4K5a5dKq
 zYHDapEv+OMyuxYqXiVVzZMT5RZHHnoCO0xmuJFwRqPGuzpNlimS7vsMC+cUKbFXeSpL1jI4xdeZM
 fK56tie+FN5fhswZmAUIjLvLlOsQa0dU9QX6xYJ24ynogruvHkZ2uWo6ev0+pjPHIzCP9EPKiRXam
 Dxps1QP3wEkZ3/hsAmaIqiwQdj6Wb+4/vzzUC4C3zfvLJwzkYDokfcJzjhWRU59Wxwz5iEdyI7dgV
 smizLIeznEtuM6nV1Jzxo8RxFwCYPjPf4ld34IPaw5SjeKXMBB1E14sJ0s6sT24HTMXct8/fVw2FO
 Be3I71CQCYx2NhGzk15QSSO0On5F/eXkOscZBWdz9OB0HzRzZKAjYUq/wi5dYxOl0sx+s6M2MohGV
 BF9IOZsJrE3wN8Qp1giMw+i/jivjDyiBwvLIoaXDyX03txREXq11KoP0/iPnsPHPQ1gUUnaPEjreZ
 ie6pKOUM+QgN3MulRHfAkR2bZr2wIWYHstzq/qN6sx2w3nGKLyUqk8b2DwcU7O7T2pvewEeattJSh
 Dl3+CabKsEn/CHB1DSb2oeRXI7kHvgur5S535wp5I=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WML-0007KY-Jq; Sun, 26 Jun 2022 18:47:49 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Date: Sun, 26 Jun 2022 18:45:29 +0100
Message-Id: <20220626174531.969187-54-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
References: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 53/55] pckbd: add QEMU interface comment for I8042 device
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

This describes the I8042 device interface implemented within QEMU.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220624134109.881989-54-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/input/i8042.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
index d4747b62b8..ca933d8e1b 100644
--- a/include/hw/input/i8042.h
+++ b/include/hw/input/i8042.h
@@ -39,6 +39,16 @@ typedef struct KBDState {
     hwaddr mask;
 } KBDState;
 
+/*
+ * QEMU interface:
+ * + Named GPIO input "ps2-kbd-input-irq": set to 1 if the downstream PS2
+ *   keyboard device has asserted its irq
+ * + Named GPIO input "ps2-mouse-input-irq": set to 1 if the downstream PS2
+ *   mouse device has asserted its irq
+ * + Named GPIO output "a20": A20 line for x86 PCs
+ * + Unnamed GPIO output 0-1: i8042 output irqs for keyboard (0) or mouse (1)
+ */
+
 #define TYPE_I8042 "i8042"
 OBJECT_DECLARE_SIMPLE_TYPE(ISAKBDState, I8042)
 
-- 
2.30.2


