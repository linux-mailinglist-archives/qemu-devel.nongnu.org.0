Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE9965065A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:25:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75jr-0001RT-GY; Sun, 18 Dec 2022 21:18:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75jp-0001L6-2k
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:45 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75jn-0001CM-Hw
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416323; x=1702952323;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nlKcnGFnnezn/uyVuR1UsLHc6jl6EbJxpvVfxGJcUTE=;
 b=a8QWhtd/W2AmulYRSbcXa/VQWuTIU+z9HXc6N6lhKEqKj9/tgzdPXuMO
 +9kgyB5hp+OGOIYr7vl1fOrZHx1qY1v6pCi7yw6JplFajYdWkRl9satIo
 sy8kppotNAY/F2Rn8O8OW2O7PYU2y/SIRTVcNOc6Oi35rMNDzLpXL9hLJ
 fe5Hiv1+90wGKAI7Pw73Pkkss8L05/qlGh4YnNU3+M3NvuuzMkACSZ3n/
 g+8KBnYsl1fQhJoLl8pNGJJ1OXvDZDWs5MQrUxBu2Xfu5PhhCW8VL2tJj
 S11L7+acUqUEaM5WQkZ0bOm/ePpau7xWYaO0rnMaA3X6XoA1tbVnHNIWF g==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="331056817"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:18:42 +0800
IronPort-SDR: mUmhO3HKGOseiAemGny0EGf1eWrl2dQj2959IoEbaZ4xIIwWMUabdCT3B1YQjE7Bg+rNtC8rK6
 60wACv1SG4JT9GTl1fT12qU3QkZAAcEXMg+Qx93aQ1rYuF3YgUPztGj3UlBXruS8k6woeAIcJg
 H/WpQZ42ULqTw4rWoZMSqVASHvH/gIgnjEa4TCv9V8kQlEhn+YZzzQXklRCSWSt/DRTMxJreCZ
 OgIUy3nEwW551sSvoBzq9JrwuuwGlSgWvIZSJK9aDm/cSiQT2Lce23HZdVSqRbrUB263PCnlhN
 ZkQ=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:36:58 -0800
IronPort-SDR: 5crEQua0m7srMhGaY2TJ6mjBYEHlAw2kwJc6YVRJCw6XQ5DQn+CfasbPqxhZKBXoFEBGMwG0et
 fPB0e3LL4uEiX8KKPA32R3wPmxqIleDsT3DaPgVYdxKt3OSPE5F2eqbErkG0iRu/x30fbem0cj
 uCwUrDvjbFRTjaQZBuF79fjQtzaav+fQmQtu22Bm8SaKv/b7A0nBsQwRcuKLBFzWuEzlrR6Rmz
 Lv1Frg8jnpbCSnLML2tb2BO3znnwFQagY5TeyGqxn1+b7FgMk8GTUIYOyMXwX09JTYUwY5COHj
 Iuk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:18:42 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3KZ0p3rz1RvTp
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:18:42 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1671416321; x=1674008322; bh=nlKcnGF
 nnezn/uyVuR1UsLHc6jl6EbJxpvVfxGJcUTE=; b=kt+M1IzW/wLjrpCSsrkHhS4
 K9cBJFa0fLGtCbeCCJGSyShml4mK6GduxZxzb+A/psISx2Hbz+YdDtQYuS/65Drc
 A7XIszoCY/APGZGy/HvGKSNapN4xJt5RiyAYEBPsnii0gSzLUZqXKNaO37/q8x+8
 n3RzTD+WEFML0VihStdBob2lzEv7wVyyNuhOVnuYB4QoL3j9pdhjiHTAURrbPgXh
 TKtDXIXTOrBwvg+XnVUJFWWOzkp3p6KOaHFRXVUAEOyftWR4lhl0iyyX4qsZWZli
 BZD9AlEdV+GzKFrQsZcR/z2DVd/gNAzx4Q1Qonxa8GUT0iMEZSBukPSONORiyeQ=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id nmN13YVq1Ndt for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:18:41 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3KW73Pjz1Rwrq;
 Sun, 18 Dec 2022 18:18:39 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 37/45] hw/intc: sifive_plic: Use error_setg() to propagate the
 error up via errp in sifive_plic_realize()
Date: Mon, 19 Dec 2022 12:16:55 +1000
Message-Id: <20221219021703.20473-38-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
References: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=345d64987=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bmeng@tinylab.org>

The realize() callback has an errp for us to propagate the error up.
While we are here, correct the wrong multi-line comment format.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Message-Id: <20221211030829.802437-8-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/sifive_plic.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index c9af94a888..9cb4c6d6d4 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -379,7 +379,8 @@ static void sifive_plic_realize(DeviceState *dev, Err=
or **errp)
     s->m_external_irqs =3D g_malloc(sizeof(qemu_irq) * s->num_harts);
     qdev_init_gpio_out(dev, s->m_external_irqs, s->num_harts);
=20
-    /* We can't allow the supervisor to control SEIP as this would allow=
 the
+    /*
+     * We can't allow the supervisor to control SEIP as this would allow=
 the
      * supervisor to clear a pending external interrupt which will resul=
t in
      * lost a interrupt in the case a PLIC is attached. The SEIP bit mus=
t be
      * hardware controlled when a PLIC is attached.
@@ -387,8 +388,8 @@ static void sifive_plic_realize(DeviceState *dev, Err=
or **errp)
     for (i =3D 0; i < s->num_harts; i++) {
         RISCVCPU *cpu =3D RISCV_CPU(qemu_get_cpu(s->hartid_base + i));
         if (riscv_cpu_claim_interrupts(cpu, MIP_SEIP) < 0) {
-            error_report("SEIP already claimed");
-            exit(1);
+            error_setg(errp, "SEIP already claimed");
+            return;
         }
     }
=20
--=20
2.38.1


