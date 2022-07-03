Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCE856437E
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jul 2022 02:32:05 +0200 (CEST)
Received: from localhost ([::1]:33392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7nWu-0005bI-9S
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 20:32:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nEu-0000XH-B4
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:13:28 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:46146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=176813b30=alistair.francis@opensource.wdc.com>)
 id 1o7nEo-0001p4-Jv
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 20:13:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656807201; x=1688343201;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SBRzBpEor0Dw6AJYQyfJP6yZs8/fFYYqZlfbL2SMAw0=;
 b=Zzi2xPKC3T44fy0M/NEii3j00eyJZl7RMbikyBJwPJtZcebjegB0yji+
 BeKbRTTs+qPlfdrDAcdLtq7TOCqO+Esk5tcTHnOVoUeyRiN42RvskPPT1
 bNWzM8DD4UTsCEPjYkLRhr/nynOMVT4gbCdVX1r42IFc0+VV4vOEWowjA
 mi3kFZpa/q3Ue12VZcYkHcF99kOaksX2VFoUVkvMZA3ESwxOYat0Jhncv
 TLmFfRPGgpFIsC0B6NjQ5Az29V2hDypLa62Hr25Q9OzPscr7fE+fVQ0zW
 T5+LWHJehPbmVPzphO/hmyr34njokmb4aM3rY2b/v8OfkjBAnoLcCUQsW A==;
X-IronPort-AV: E=Sophos;i="5.92,241,1650902400"; d="scan'208";a="204667261"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 03 Jul 2022 08:13:10 +0800
IronPort-SDR: LnFx9cLbRaskkZ+wtfJ0ZZbTBIZcYVeXvbrE8pkrg6sswYZgO/TCaKU8PV5mCo8wnIlDNRNxqW
 Ro/Ce9ZZm+JX1KyJ3I74hZ8CWa4gfECbcr2cAKDzYdUsFY6Z7qtWTcvgiLMK8QtUK1dN9y41sF
 nXiRkS7/8pubo8sACNDGq5SPWy7NM0uyxNp+qzmwG9l5CVCcHUk4baRgsHtmF22TYGKPhwCIdg
 7NeDOMzZkzuPc+Jnh6ZOfPiXxgsbGOv58k7KRYtp9mJ3XhtAIxfddzBXWOTRQsfNUzWeBN45xj
 OfJjtPb/SdltS4OuZIRRkpRn
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 16:30:33 -0700
IronPort-SDR: seYnWD3xatZ/gn8EZj7+lCMvwgS7BZbXMX8RggSSrjWSI431AqJoaqK9y9cSuwxpkY7aA+DFa6
 CwhvMR/BRwk+VImhiYPm6r7xj6+L/uwBV6cxeINIjkWRCN1Hoej8pGXVO2dEBSs1BZ+SjvNyBN
 S9Fk4Hz1A09fqoxPwlGb7p31kg9/ukzu7Z8In2TAXDYIg5aRIbuqzPlOE+WpdnGBfoxIZfXD/6
 wem1uXpMTqJ5Ixq2o+rf37/a7ONMt8OFACyYRktosBWZZCoqXO6Km48u38fzRVYc0saOnNqkUW
 QAQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jul 2022 17:13:12 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Lb8Xl4Lm2z1Rwnx
 for <qemu-devel@nongnu.org>; Sat,  2 Jul 2022 17:13:11 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1656807191; x=1659399192; bh=SBRzBpEor0Dw6AJYQy
 fJP6yZs8/fFYYqZlfbL2SMAw0=; b=ZBMLNWcZR+pvAupjytYwDmMrRtHDTvUlnd
 oCl3PsZQWQL41MAhASkfQCC22v9lQsU2vY3j3CspQSV96I1JT/ZspMf50D5yq3OQ
 o7ueZlg1+u53CbBMQvjLtjsa/ubqVDyLWLofK++dTConapBuYu0gZb7fYND08ma+
 RMi/IowNf+EKmoC6qp9HcnTfr6Kfv8XR1ocuTSqN02vMB+uAeJ1aSsr7JDoPtuXC
 3fRIrHaEGFNCmHvJA2KM6tPv4f8PawxN1Vfua163JwHYuP5ecV7cSuezyqs6mM81
 25Tx2mMr1M2jb5JO1/ErXUEpceChLpTeJxr9itza8hjSgdrNsR5Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id kfxB1Hj_c8tU for <qemu-devel@nongnu.org>;
 Sat,  2 Jul 2022 17:13:11 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Lb8Xj10FKz1RtVk;
 Sat,  2 Jul 2022 17:13:08 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL v2 14/19] target/riscv: Ibex: Support priv version 1.11
Date: Sun,  3 Jul 2022 10:12:29 +1000
Message-Id: <20220703001234.439716-15-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220703001234.439716-1-alistair.francis@opensource.wdc.com>
References: <20220703001234.439716-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=176813b30=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Alistair Francis <alistair.francis@wdc.com>

The Ibex CPU supports version 1.11 of the priv spec [1], so let's
correct that in QEMU as well.

1: https://ibex-core.readthedocs.io/en/latest/01_overview/compliance.html

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20220629233102.275181-3-alistair.francis@opensource.wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index d12c6dc630..aac0576fe1 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -237,7 +237,7 @@ static void rv32_ibex_cpu_init(Object *obj)
     RISCVCPU *cpu =3D RISCV_CPU(obj);
=20
     set_misa(env, MXL_RV32, RVI | RVM | RVC | RVU);
-    set_priv_version(env, PRIV_VERSION_1_10_0);
+    set_priv_version(env, PRIV_VERSION_1_11_0);
     cpu->cfg.mmu =3D false;
     cpu->cfg.epmp =3D true;
 }
--=20
2.36.1


