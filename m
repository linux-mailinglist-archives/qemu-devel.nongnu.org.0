Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F33B58CF96
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 23:19:43 +0200 (CEST)
Received: from localhost ([::1]:45772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLAA2-0001aq-AQ
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 17:19:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oL9z7-0008EQ-Ie
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 17:08:25 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mail@conchuod.ie>) id 1oL9z4-0006KW-Jx
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 17:08:25 -0400
Received: by mail-wr1-x42b.google.com with SMTP id z17so12214429wrq.4
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 14:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=maIqyDhug0EL/mXAyR5nYeGttmLcfb6O/BjdQzpTa5E=;
 b=XK4wHIwZI1VIgmfh4aS4nuMCqHus/q6qeAh93CvJuKLLBPDj+zCi/bsntDY3EFjQbh
 3D/x/fnF40VpSYbtsW08BZUJLdIvsQXcDevW1TQudOYbRVKJjWiI9YlfMBGZGUg4FJcG
 e/Wr0FGwOTEFatMiN9f449TLEuz10NB13BQiW683VKgNryHQFgHEQhTNH9zlhq8I+Mtu
 LpOvp8Iu+/NRDrXZ7VPfKOc19TxmLoOSb6JOEQURjoconCTnQqRDZQnEfUPp9YcbruVl
 G3YrNnTG4i3uOzKpijtFdrZH5hnAMNW4Z2FPq4YExIWyKs6FLqDCzJx5dkKGJsXPIzGg
 RVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=maIqyDhug0EL/mXAyR5nYeGttmLcfb6O/BjdQzpTa5E=;
 b=ILXKDsiDULlW+rALlhc5fCJqAimhLsqR01poTqPFJFHr1/W48T1UBOC55teHhZXB0R
 jwDtiGaKTzTPQ0jJj8SEDx4AqgV02ZgfEe6BEgomaX1uXiOYEZmhd+octfWckLyif093
 +Hs96Al+ixVErtgtsWuw1p8D/UjQ/jxbwtJKIZ+DxyBMyUxQXcgEuXhpv9FTStAtGxvq
 Pm42psR+L4fk79jh/xAWLfcKPANhXsu7GhVbwlc9r/5kHAPQMHlC7lVXNdQhLik4cfBz
 v1XN7trkPXiaXQJOedtABIAmx7jOOgKXFBO1cLZAkZPikoyz3gm4ABHsl9639kDNMDnb
 WvxQ==
X-Gm-Message-State: ACgBeo2TBSVpE5z2NLz49gWmf4bOZZY/aOCrQGFcDKaF/GAyKtunUiaZ
 258hOWlMSZioShh6teoJPgucoQ==
X-Google-Smtp-Source: AA6agR7z6uM/3AoQrwZic1UwZS/GsB1rbuTP3rAL8ggDxUp68YD0jOskdhjlF6fIheITRBHxIzEp8w==
X-Received: by 2002:a5d:6609:0:b0:21f:ff6:9090 with SMTP id
 n9-20020a5d6609000000b0021f0ff69090mr13240982wru.30.1659992901275; 
 Mon, 08 Aug 2022 14:08:21 -0700 (PDT)
Received: from henark71.. ([109.76.58.63]) by smtp.gmail.com with ESMTPSA id
 i17-20020a05600c355100b003a2e92edeccsm19811955wmq.46.2022.08.08.14.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 14:08:20 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor.dooley@microchip.com>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/4] hw/riscv: virt: fix uart node name
Date: Mon,  8 Aug 2022 22:06:41 +0100
Message-Id: <20220808210643.2192602-2-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220808210643.2192602-1-mail@conchuod.ie>
References: <20220808210643.2192602-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=mail@conchuod.ie; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Conor Dooley <conor.dooley@microchip.com>

"uart" is not a node name that complies with the dt-schema.
Change the node name to "serial" to ix warnings seen during
dt-validate on a dtbdump of the virt machine such as:
/stuff/qemu/qemu.dtb: uart@10000000: $nodename:0: 'uart@10000000' does not match '^serial(@.*)?$'
        From schema: /stuff/linux/Documentation/devicetree/bindings/serial/8250.yaml

Reported-by: Rob Herring <robh@kernel.org>
Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
Fixes: 04331d0b56 ("RISC-V VirtIO Machine")
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 hw/riscv/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index bc424dd2f5..6c61a406c4 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -917,7 +917,7 @@ static void create_fdt_uart(RISCVVirtState *s, const MemMapEntry *memmap,
     char *name;
     MachineState *mc = MACHINE(s);
 
-    name = g_strdup_printf("/soc/uart@%lx", (long)memmap[VIRT_UART0].base);
+    name = g_strdup_printf("/soc/serial@%lx", (long)memmap[VIRT_UART0].base);
     qemu_fdt_add_subnode(mc->fdt, name);
     qemu_fdt_setprop_string(mc->fdt, name, "compatible", "ns16550a");
     qemu_fdt_setprop_cells(mc->fdt, name, "reg",
-- 
2.37.1


