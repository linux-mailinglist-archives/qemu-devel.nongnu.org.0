Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C31C15728DF
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 23:56:50 +0200 (CEST)
Received: from localhost ([::1]:35092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBNs9-0006YR-Kj
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 17:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNoj-00088s-Er; Tue, 12 Jul 2022 17:53:17 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNoi-0007m1-0P; Tue, 12 Jul 2022 17:53:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vhqbmb/OfAp1EbToOlQ9t2ACxijfrv+podwunxLOmZg=; b=aTR5d9bJs4PzzJ4evvv7kU40S+
 qeUA3K9cb3OAYCLIrsBhoC54euocZn9Etx4dfGLXclbQ/+NsDpo4aFKEFuyKizct8+Y/oGlQ0YRaL
 BK8hrfphE+4VX3ZfevG9dJXF+pwH9HHTI93JatKiHYg+WjtVz7wPoJe2M2sNLre7dlelWM6bmNkuR
 xxAmjSGJDNaq938U0LvhxReWZf6f+5NnNSFQRoKdzrJY5Hm3EUo+kBHEPTS6Z4jqvqCgi6ESKElzC
 d84zw6WhiMN0TA2sqVNROtCReDTdJpMBq2S1/yswLdhBsKgEhm8AEY/ldsu7x5u3GIDFMDiQtNaOR
 WRLsJApjoZm2jQ8IAyiipETscXZ6GVuhBnEqOw71Pgrq2joePli64VHFcXUp+ZkYC5NgodYlhogUE
 3OUQhz2zpGakuVPYZwPGQmScYrLlmTfhaYkyS7sziFL6eDoYD5ElxKdM8q6RBp6er089MmC6ZAwZx
 BpoNGZBvvrLPf7WiL8K2nqCvE6xN1cxjN+JD9bOr9WFos6do0vFyeHDmgaGCWz778/rh/b4jH+RNJ
 ssa0hK08Y/MRGkVpuO5uEkgE8XyOqjPDuQOKLRiUtlUxa535LYer+RgeDUJh+Tb/1II+YLEk5ZbZv
 gOdtLzFcRBsXuL2PI9TP/S+Vj1lbgxNJxomVuV/+8=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNnH-000Bqt-8q; Tue, 12 Jul 2022 22:51:51 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:13 +0100
Message-Id: <20220712215251.7944-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 02/40] pl050: rename pl050_keyboard_init() to
 pl050_kbd_init()
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

This is for consistency with all of the other devices that use the PS2 keyboard
device.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/pl050.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index c7980b6ed7..8e32b8ed46 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -166,7 +166,7 @@ static void pl050_realize(DeviceState *dev, Error **errp)
                           qdev_get_gpio_in_named(dev, "ps2-input-irq", 0));
 }
 
-static void pl050_keyboard_init(Object *obj)
+static void pl050_kbd_init(Object *obj)
 {
     PL050State *s = PL050(obj);
 
@@ -183,7 +183,7 @@ static void pl050_mouse_init(Object *obj)
 static const TypeInfo pl050_kbd_info = {
     .name          = "pl050_keyboard",
     .parent        = TYPE_PL050,
-    .instance_init = pl050_keyboard_init,
+    .instance_init = pl050_kbd_init,
 };
 
 static const TypeInfo pl050_mouse_info = {
-- 
2.30.2


