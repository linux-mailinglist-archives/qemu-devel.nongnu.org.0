Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DA455B357
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Jun 2022 20:03:26 +0200 (CEST)
Received: from localhost ([::1]:50466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5WbV-0003ke-O1
	for lists+qemu-devel@lfdr.de; Sun, 26 Jun 2022 14:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WLU-0003Cl-W7
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:46:54 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:45074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WLT-0008QV-4d
 for qemu-devel@nongnu.org; Sun, 26 Jun 2022 13:46:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nVbIrGc4vOmodznrkPB09EvKicunfquxzhLWhRzQEw4=; b=Cl0a1PdutQh8ieUrmY2MSBGfks
 GsJAy+GQ4plGqdDLvASn8pLOQlEVYxVal9/DqC6bIv6JxRVQTM4TVRJtmcRs3GAOZahc7zdLxN2AO
 yf30hPJfC1SJ8ENqAH+Twv9yD3+JRsOPUDZ7gRpGzWiz21vUn63hus5pGH0lPVKn1h+m8H+H25vCo
 eOGkBV+43EzIUjMTR8rLXSrPcUQeV96wvsyo1DzD2OodqywqbSdR+IQR7H4uuHQ0wyZdJ/uWeJjfw
 Nj+WyKhfmw/UglJxep7NIbBey1O/BHaAPw0nCJ2r9/ZBpiS/0GoEpwVu3hT5px/um/Y9TPJY82Ln5
 clfVPzqNwq6jyrS09kPdVdZg115AOy0d2TAtLYmre10B0S8s8s5kt4x6H7+aBbTF3LUlf3sE1x8sX
 OUOiu0JNmK0sQtzdJ2Z+zopmn31mlzkdHW7vL6RiO3iLiOxUICx0tDYPBW4Iie3soQw0BShd7rHkV
 mednYWLsEGLuirDgLXmepJaKSrdVigWseWbaYfW3pXSYLgpp6eQfkMMfBZrO2+FjROc5ikT1Go5cA
 2HJSzVB985T6j4xTNjwZhuNnokNmwhr6Yk9c0qz1XRlqIuf7S1/ezNf+o7IAyZBvdonkTBmAC5+YG
 LO87MtKNKRF5Ca7Irn82bfUAQQzrgFCQLEOLSNzco=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o5WK5-0007KY-5e; Sun, 26 Jun 2022 18:45:28 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Date: Sun, 26 Jun 2022 18:44:52 +0100
Message-Id: <20220626174531.969187-17-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
References: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 16/55] lasips2: spacing fixes
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

This helps improve the readability of lasips2.c.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Helge Deller <deller@gmx.de>
Message-Id: <20220624134109.881989-17-mark.cave-ayland@ilande.co.uk>
---
 hw/input/lasips2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 94f18be4cd..2ac3433014 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -205,7 +205,6 @@ static uint64_t lasips2_reg_read(void *opaque, hwaddr addr, unsigned size)
         break;
 
     case REG_PS2_STATUS:
-
         ret = LASIPS2_STATUS_DATSHD | LASIPS2_STATUS_CLKSHD;
 
         if (port->control & LASIPS2_CONTROL_DIAG) {
@@ -238,9 +237,9 @@ static uint64_t lasips2_reg_read(void *opaque, hwaddr addr, unsigned size)
                       __func__, addr);
         break;
     }
+
     trace_lasips2_reg_read(size, port->id, addr,
                            lasips2_read_reg_name(addr), ret);
-
     return ret;
 }
 
@@ -257,6 +256,7 @@ static const MemoryRegionOps lasips2_reg_ops = {
 static void ps2dev_update_irq(void *opaque, int level)
 {
     LASIPS2Port *port = opaque;
+
     port->irq = level;
     lasips2_update_irq(port->parent);
 }
-- 
2.30.2


