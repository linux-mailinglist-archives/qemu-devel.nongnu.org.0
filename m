Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB46650652
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:22:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75jJ-0008Ri-RX; Sun, 18 Dec 2022 21:18:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75jH-0008RE-8E
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:11 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75jF-00017E-Ha
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416289; x=1702952289;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KOmkdsaG2L/1f6aUZirO4FA9LnT3y2PXMdUmb+q6hDk=;
 b=X7SzGwESbVn1fUj0vEOcMUyr7+Ju+3pnZv8zfOdCV5T8Z9tTGfda3FxT
 HWCApJ4/Sgowk1dX3zF0XUhrlgqudKtefJul+pdMEEl4SNHot0uZCX3Xy
 G+tDJ3XKBpn0ER29AzFRcmweKzUjZ1R24X7mduIPI46hzCZtb5nu5/Q85
 YxaVR9Qa/Xt1yV30PSq/5TeypPFoSJfIqoOxWq6rqLzhD4Bh1c1A/WgXX
 /+3q0uep7xATHlL3oP/+RvIcmU+c5ZVpnEn4YdlPyUvDgcJAEWkzb7U1H
 U2DDFLZvTp0pj8xY0O2IPNV/zaLEUa9PinKzMSmyointEiExZRJQrKyGu w==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="217199333"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:17:53 +0800
IronPort-SDR: 7wuaqMJEdLofbsIwgjaRPmN150OTN+wZPKIpwOhLQwRB5m19TtVC7/kv63RcBBdQ/jnvSivcQE
 jmkW8ShsiQ8E+C3FXi8w3jtmAdBcS48Jmp3wqBrtMH8j1CU80z+gcCZc1Fc6lhuIeTRzlpSHuH
 1ygDu/PKxCymkIGp/tRSp7YwU4LowmQggcSTMjnOThhBD6HNGNDfRRSEI4jnOpE+vDQGNNBaJU
 KlzNyG4B15jFf7oxm1TpvFGxh/Hr7Xt2+uZYmI8W6W2X9ykN4UijDcVk3WZsVmrbbm9uDcEqap
 HIc=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:30:26 -0800
IronPort-SDR: vS4upLhhZZX0jqXpLPM44+F+ixEnIbcXSwck95x2tEvDa1DFlahPp2Hq6Er3UPI3mf8zXKMEGI
 aIVbwaPuokUS76HLv3DwtZJPICci2QFMW6AgPiSRx6UrUTM2ojY1eBY/C3UijFBV0nyYt4w5x2
 5bOzmYMWza0xCfpMt3W2CzIvzG6XPdD6tYTxy9sj8nb197Wqt4qaRtuyj4uTFaM4kxo5n7asEJ
 RLRSF2mR723zCQzOSMIz5tAX/ZNrVBl8QMeXvsII6v4mE4NABHlAFMZ9wCqziXKVFsiSzbHrX/
 Bk4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:17:53 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3Jd2DSpz1RvLy
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:17:53 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1671416272; x=1674008273; bh=KOmkdsa
 G2L/1f6aUZirO4FA9LnT3y2PXMdUmb+q6hDk=; b=qHj3wviRfEb5N4g1e424rIQ
 2t3tSeAkPNTk/uWm3cJhwMBI2pOm3QYuiQGp8sbMcnzCnhjUY5Ms+aYpfg0034+G
 AM8v37Ib4Lf7u0QEFnBEE1v+5KLk0k3+g82Oq/MWiZpSFVlb9F/Ult4Ez9Otj4B2
 8u9sCzNGleAk1HsjRNDA91JBCF2+pne9qjNQFPdlYL55x+TFWtPbdncgC2zJPJxZ
 VHQpElEyea5CzzZRy60VVCi/SWs7uggemTL8w7hKlPSMaW3o5FWzC6cOc1Vmij5W
 3/ur26/aAA8FbGh3fUoFwPJj1Y6dC0w68H7V3AsurYyzX75o00uzbgXxjzo8n8Q=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id anBcRDukexnx for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:17:52 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3JZ1mpYz1RwqL;
 Sun, 18 Dec 2022 18:17:49 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, 
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 16/45] hw/intc: sifive_plic: Renumber the S irqs for numa
 support
Date: Mon, 19 Dec 2022 12:16:34 +1000
Message-Id: <20221219021703.20473-17-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
References: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=345d64987=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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

From: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-grenoble-alpes=
.fr>

Commit 40244040a7a changed the way the S irqs are numbered. This breaks w=
hen
using numa configuration, e.g.:
./qemu-system-riscv64 -nographic -machine virt,dumpdtb=3Dnuma-tree.dtb \
                      -m 2G -smp cpus=3D16 \
		      -object memory-backend-ram,id=3Dmem0,size=3D512M \
		      -object memory-backend-ram,id=3Dmem1,size=3D512M \
		      -object memory-backend-ram,id=3Dmem2,size=3D512M \
		      -object memory-backend-ram,id=3Dmem3,size=3D512M \
		      -numa node,cpus=3D0-3,memdev=3Dmem0,nodeid=3D0 \
		      -numa node,cpus=3D4-7,memdev=3Dmem1,nodeid=3D1 \
		      -numa node,cpus=3D8-11,memdev=3Dmem2,nodeid=3D2 \
		      -numa node,cpus=3D12-15,memdev=3Dmem3,nodeid=3D3
leads to:
Unexpected error in object_property_find_err() at ../qom/object.c:1304:
qemu-system-riscv64: Property 'riscv.sifive.plic.unnamed-gpio-out[8]' not
found

This patch makes the nubering of the S irqs identical to what it was befo=
re.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
Message-Id: <20221114135122.1668703-1-frederic.petrot@univ-grenoble-alpes=
.fr>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/sifive_plic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index c2dfacf028..b4949bef97 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -476,11 +476,11 @@ DeviceState *sifive_plic_create(hwaddr addr, char *=
hart_config,
         CPUState *cpu =3D qemu_get_cpu(cpu_num);
=20
         if (plic->addr_config[i].mode =3D=3D PLICMode_M) {
-            qdev_connect_gpio_out(dev, num_harts - plic->hartid_base + c=
pu_num,
+            qdev_connect_gpio_out(dev, cpu_num - hartid_base + num_harts=
,
                                   qdev_get_gpio_in(DEVICE(cpu), IRQ_M_EX=
T));
         }
         if (plic->addr_config[i].mode =3D=3D PLICMode_S) {
-            qdev_connect_gpio_out(dev, cpu_num,
+            qdev_connect_gpio_out(dev, cpu_num - hartid_base,
                                   qdev_get_gpio_in(DEVICE(cpu), IRQ_S_EX=
T));
         }
     }
--=20
2.38.1


