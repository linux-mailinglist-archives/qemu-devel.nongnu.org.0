Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71549559AE0
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 16:05:44 +0200 (CEST)
Received: from localhost ([::1]:38296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4jwN-0002Jt-GE
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 10:05:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jaE-0001Iz-SY; Fri, 24 Jun 2022 09:42:51 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jaB-0005EJ-Ou; Fri, 24 Jun 2022 09:42:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/D3x0EPgbd1rsMLyHkuf/aV6SyVyhXgHYMBz9CwlEVE=; b=vXhbFhtR5er3uzbOdjUXJGAu9z
 GCOyWnOdA0ab7TRnE8D75eXkM4/NE85YO4IU4RTYdpkYubvB3Qh5e/JjCONEQwAcXeUtcDh0XKOO2
 jwiiHWXdTtkg2bsVb/swICcBJeHh14p2WJyDGZ/jtZBCFRAJ/YMF3hJAcqwOFerFQVRVOov37tuMw
 q/0mki3EJJ2rLZN3W4ygnlnvylCUcdDqKTNAArEYy0xY5VQW9apu0/qLkcQhH01IqmZxNzwLDXsF2
 3+9KPhbXeUBVv8Ybt9No0zGNVWkxaMKBVN1OjIDXEyb5/+tkhhoa/JEc9iu16uySqCH5uRx9hYzTo
 o9wE7oCmB32HzsvmY1pAl2AbjacJDNAF3w5/Y4c/xZP+jqchvl/RY/S5ZNmBuU8gHCLqE378sfKo0
 BDZAnPr5tDnGC62gn3mZzx5x2OOfgtbGxnKEcOJxeJzzdwgVocjGUyLeKgaGGzVYbLxidQsfS6t05
 1gfLduuNAwiA67+kNXqPkxQ4iZnDfhL2mIPjY4DV1ywnbx01P8Dv7EaH5O6tf0khzQqS/PWGj531J
 AcK9GjgO/EWqR48KuDAYUdB/fh+qvcd2AQtrjvPbAmSSbVfz4cYOS11h838s0QDHP1GzBd8ubwkDT
 F5845J5Lch3Tr/T+vtWUrybF046O1KnRcrvhLCmOE=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jYZ-00037t-0y; Fri, 24 Jun 2022 14:41:10 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, jiaxun.yang@flygoat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 24 Jun 2022 14:40:32 +0100
Message-Id: <20220624134109.881989-18-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
References: <20220624134109.881989-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 17/54] lasips2: rename ps2dev_update_irq() to
 lasips2_port_set_irq()
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

This better reflects that the IRQ input opaque is a LASIPS2Port structure
and not a PS2_DEVICE.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Helge Deller <deller@gmx.de>
---
 hw/input/lasips2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 2ac3433014..adfde1684f 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -253,7 +253,7 @@ static const MemoryRegionOps lasips2_reg_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static void ps2dev_update_irq(void *opaque, int level)
+static void lasips2_port_set_irq(void *opaque, int level)
 {
     LASIPS2Port *port = opaque;
 
@@ -275,8 +275,8 @@ void lasips2_init(MemoryRegion *address_space,
 
     vmstate_register(NULL, base, &vmstate_lasips2, s);
 
-    s->kbd.dev = ps2_kbd_init(ps2dev_update_irq, &s->kbd);
-    s->mouse.dev = ps2_mouse_init(ps2dev_update_irq, &s->mouse);
+    s->kbd.dev = ps2_kbd_init(lasips2_port_set_irq, &s->kbd);
+    s->mouse.dev = ps2_mouse_init(lasips2_port_set_irq, &s->mouse);
 
     memory_region_init_io(&s->kbd.reg, NULL, &lasips2_reg_ops, &s->kbd,
                           "lasips2-kbd", 0x100);
-- 
2.30.2


