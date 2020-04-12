Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB9E1A6100
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Apr 2020 00:58:00 +0200 (CEST)
Received: from localhost ([::1]:38266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jNlY7-00058b-OA
	for lists+qemu-devel@lfdr.de; Sun, 12 Apr 2020 18:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49666)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlJ0-0001F3-7j
 for qemu-devel@nongnu.org; Sun, 12 Apr 2020 18:42:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlIz-00061H-7Y
 for qemu-devel@nongnu.org; Sun, 12 Apr 2020 18:42:22 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:41674)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlIz-00060p-1b; Sun, 12 Apr 2020 18:42:21 -0400
Received: by mail-wr1-x442.google.com with SMTP id h9so8535752wrc.8;
 Sun, 12 Apr 2020 15:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+O8FSNw/XveJvWULa4+Jfl3G5r6TBg2LXwiWGWDolCA=;
 b=JghYvfP+OE/gAaq/k+cmw+2Cnl+0TTmOt8CBP/wmQxsJlyVf0LD4yuAuTnaqH7E3sh
 gKBJK18MKq1hOPHqbQ0z7G/6xjnUF4pOu1jZ31vWP42WkDuXGr7qkK5H80E0okppPU9h
 OGjA2noOGYb3H02VQ6W3c0xiC6X/ZCopm23cocS/K+EjZS/Wu3Y36MZ6rmY/uLJruDTA
 HqB5DGm7XAYgoUzcZ/ktwSnoDBzVd7qHbPLnMcuq75XMeULNER7wyhfm38wDttEL/mqW
 bRQetBsR+Sj2uPvuStv3YPCwtPkJ1L2vY49CDQdOTLjnr7fYgq8kmnt8Rjdn1IQ+ToNZ
 YrHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+O8FSNw/XveJvWULa4+Jfl3G5r6TBg2LXwiWGWDolCA=;
 b=edadRrr9M6/DhanRZYuU3zSM9ckRcRaQX4oiF1raFLlRmGGb/uQXQmdxPWS3bFxDDI
 qgK3+kmpzcmG17OkPV1UMMvIOSa+TFHUcNZASlkQFcffaVn/89qO/xd8eqKhB8/4ZHDB
 uKkrGsw2B8CTTOnhXKjoQmR42BDVlMG/8a95sew+MQYdh4vdcRcUTcjyZvjVk18tIepW
 MZgKMG7M6udegEUeLJCPhQRZNU56JhAKTiXkIKF09uP9NgDFZv3i+7btGvfR4xp2NAIm
 ZRXvO1byV6AGE1tY3n/50CmlZnT+qAKxycAH+LES2dfbUNJ0qHgAI7S7qzQT5INy6633
 o7vw==
X-Gm-Message-State: AGi0PubWAbBPIOWh9ev+NGFju3hV+ebLyrfvGKL697az+MaBtHGVcKxQ
 3QtUNcSeIFbMTxacSVGFrzU/g4OEgXL+Hw==
X-Google-Smtp-Source: APiQypLZ1NMTXnAZenGdHIyB5P9HdjI1CtfX+Kh+BXtTBW28G1YeRa6BQP108OKwa/7Ig8phtUvQ9A==
X-Received: by 2002:adf:904e:: with SMTP id h72mr15645835wrh.367.1586731339864; 
 Sun, 12 Apr 2020 15:42:19 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id f63sm12083825wma.47.2020.04.12.15.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:42:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1 v3 09/23] hw/intc/arm_gicv3_its_kvm: Add missing
 error-propagation code
Date: Mon, 13 Apr 2020 00:41:30 +0200
Message-Id: <20200412224144.12205-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412224144.12205-1-f4bug@amsat.org>
References: <20200412224144.12205-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Patch created mechanically by running:

  $ spatch \
    --macro-file scripts/cocci-macro-file.h --include-headers \
    --sp-file scripts/coccinelle/use-error_propagate-in-realize.cocci \
    --keep-comments --smpl-spacing --in-place --dir hw

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/intc/arm_gicv3_its_kvm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
index ad0ebabc87..3d2c4e22f5 100644
--- a/hw/intc/arm_gicv3_its_kvm.c
+++ b/hw/intc/arm_gicv3_its_kvm.c
@@ -101,7 +101,11 @@ static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
 
     /* explicit init of the ITS */
     kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
-                      KVM_DEV_ARM_VGIC_CTRL_INIT, NULL, true, &error_abort);
+                      KVM_DEV_ARM_VGIC_CTRL_INIT, NULL, true, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
 
     /* register the base address */
     kvm_arm_register_device(&s->iomem_its_cntrl, -1, KVM_DEV_ARM_VGIC_GRP_ADDR,
-- 
2.21.1


