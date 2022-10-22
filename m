Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21067609797
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 02:51:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omhPi-0007ZR-1m
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 16:17:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5R-0007IT-LI; Sat, 22 Oct 2022 11:06:57 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG5Q-00022R-9Z; Sat, 22 Oct 2022 11:06:57 -0400
Received: by mail-ed1-x52d.google.com with SMTP id z97so16073582ede.8;
 Sat, 22 Oct 2022 08:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EbtYcb5eFZhFTw0lwbRQrA+9dbnsHJ+1Kgq6FNU5GiA=;
 b=HIbcn68id0Rp/M0JkHBJmVpZGkr50Mgi7s0hWRet+slS2LTXP7joY9qKlY6O7Gba41
 LeSzcEZCV1rmTxDpqX73SjH1ngU4k6u43qG86jOqo7PLa8m+uJOx7D7pljdSfTzn3DWN
 QkcFAcX7C4Rs/L0wtqWYtcjthxYrdppS4VsIaCuFxxiIBSaZr5kXI7pfiwo234j1Fm2a
 psdTQ2zvXUEwnWj5VzkXKnXbLs1Sq2SyZ1eNaYTmjVYsRP4xY85Ywv8Yf6d60+3HwSmX
 VLq/lFSActzgZPOJo4IQGVBjLY2POJ7Hd/bJ42hnGbAaIcF6PebbamQ2dYytBL9c0Cz9
 85Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EbtYcb5eFZhFTw0lwbRQrA+9dbnsHJ+1Kgq6FNU5GiA=;
 b=rM2D0yWPXuRSaCqCHN21Ogq213kDYXnSfltma/AE94z/uGDOJtqaXXiJBoLGuPLL5Q
 d2BhysSm0H4Q9NM6FCzJbUGe0CFy82q3IFsCnGTr2T6PEXlbmiFS6XOTaP1s1XizMvO/
 uD9ALGMMtxhJ2eX86YLsKBzkaA45wqfRFRQkJjJ4wtxFkHSXqmTXgpu/l1Vpyx8YmRYY
 mB0izg8S7rhng20yh4lXFcK/fYJQ8Nd7nEFYUzQgN3N7PEZ0MlYHeWZI8JgsuCdn2eW0
 I35TQoEusHsh2jRjVl7ytNLOPpZuZLQF8jAFINr8QbNozC0AdG6zMEr2F+btnYGHsuQf
 oELg==
X-Gm-Message-State: ACrzQf2js6w63ywMaIDv7uMZdYgOjnP1pS0N8elFxOEuLnBB6d2YoaSZ
 5QXfWzZgTGDY6Nr83DseAzQS937YhXFM0A==
X-Google-Smtp-Source: AMsMyM6cDAyscE2ZnBB9lAsVRFjt4+dyru4DcJ/sz1r4ZJ3FcXYkM20K/5vaopOoytu1NeoE+NyFHw==
X-Received: by 2002:aa7:cd92:0:b0:456:cbb5:2027 with SMTP id
 x18-20020aa7cd92000000b00456cbb52027mr22441389edv.384.1666451214843; 
 Sat, 22 Oct 2022 08:06:54 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-171-138.77.191.pool.telefonica.de. [77.191.171.138])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm13021558ejx.211.2022.10.22.08.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:06:53 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 25/43] hw/mips/malta: Reuse dev variable
Date: Sat, 22 Oct 2022 17:04:50 +0200
Message-Id: <20221022150508.26830-26-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221022150508.26830-1-shentey@gmail.com>
References: <20221022150508.26830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

While at it, move the assignments closer to where they are used.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/mips/malta.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 0e932988e0..0ec2ac2eaf 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -1239,7 +1239,6 @@ void mips_malta_init(MachineState *machine)
     MaltaState *s;
     PCIDevice *piix4;
     DeviceState *dev;
-    DeviceState *pm_dev;
 
     s = MIPS_MALTA(qdev_new(TYPE_MIPS_MALTA));
     sysbus_realize_and_unref(SYS_BUS_DEVICE(s), &error_fatal);
@@ -1405,13 +1404,13 @@ void mips_malta_init(MachineState *machine)
                                             TYPE_PIIX4_PCI_DEVICE);
     dev = DEVICE(piix4);
     isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
-    pm_dev = DEVICE(object_resolve_path_component(OBJECT(dev), "pm"));
-    smbus = I2C_BUS(qdev_get_child_bus(pm_dev, "i2c"));
 
     /* Interrupt controller */
     qdev_connect_gpio_out_named(dev, "intr", 0, i8259_irq);
 
     /* generate SPD EEPROM data */
+    dev = DEVICE(object_resolve_path_component(OBJECT(piix4), "pm"));
+    smbus = I2C_BUS(qdev_get_child_bus(dev, "i2c"));
     generate_eeprom_spd(&smbus_eeprom_buf[0 * 256], ram_size);
     generate_eeprom_serial(&smbus_eeprom_buf[6 * 256]);
     smbus_eeprom_init(smbus, 8, smbus_eeprom_buf, smbus_eeprom_size);
-- 
2.38.1


