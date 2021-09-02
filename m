Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 420363FE6B7
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 02:42:14 +0200 (CEST)
Received: from localhost ([::1]:48632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLany-0007xu-Cm
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 20:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8724dbd3c=alistair.francis@opensource.wdc.com>)
 id 1mLamL-00077r-PN
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 20:40:30 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:42924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8724dbd3c=alistair.francis@opensource.wdc.com>)
 id 1mLamI-0001Lg-66
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 20:40:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630543226; x=1662079226;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qwMeHP58WtBj+deCXtNeDtBP+B6nSvChobKqRyMCf/A=;
 b=bn/uT5mqFaC/ClWiWyJ8y6GQ+6+lPPsqMlaEILrIN9+PdUc+2O7KX4MU
 Jd4o3fby4GFhyfUWpb6Qe2gZvHB+i3z59POgJNa5mNtAUkwrkvy1HBf4q
 zZIhWaJ/fpDhfl6Wpda7HuZwu1zaUgv3SCnVV+GysW4dsGMiBlzJjQAdf
 ZRQmksR7qy+tjD8dGiDumU0mLr7Y9qc/U+5Z8JBJ3so3Wf6rFd8W8Cj0k
 QIzqxLZGIKjiHohVzaqutOEGaPxmSuLKOur5+DUPpW3t5q1dyrmH0piJv
 7x1CkYhJUVZJZDdO5QTrO6NfwLh/8CT/1w7D5wTF4jdhpKzo45FHnel9O w==;
X-IronPort-AV: E=Sophos;i="5.84,370,1620662400"; d="scan'208";a="282788596"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 02 Sep 2021 08:40:22 +0800
IronPort-SDR: ohpeq66JjEKhsMq/Yv6G5TLPUHWWVBi9pFQyK4YbwN8VbGdKdYXp9nK5jAe2iccg8MkQoqqjVq
 gPdqj4uVjyzNPyJJe/PPrq/4Cls2jLGBZCvt3nRGN/yRnivnHBKL9T1SW/UwS+toKbYnQuuhIX
 BQf6zb2meig0sGjEu/AmkaYsdMHuXj8Zmgw/MDvTggfzk4SC4poSmnqDIy1bgIzmJQGhWYz1h+
 28jVOXZGKxaKhsbz/hNx+ksYF5jHZ6zdH8+Eqf2hxk95aAqsPtO49PdxtfOsmWDN02nYJmz4tG
 ZnKwIXh3Qmm9n5jqilMMFTSO
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 17:17:08 -0700
IronPort-SDR: B+o+KTpnM49e+zNj95XZPVhAovhcEwcWuH7hkIRyUIyzAL/n9MeuAPzmqFxOXz0F7xjVfXnufo
 bOv8ss4abnqXmeN6j2OWPpYvbNMG94umqPSyO8QirtzgvkIcK6SP46dp9mzX1gur/t1i16+Ss9
 BOjjiVjG2c4gz9oPuv5LmG2BgkBVeEumJwt64dEsf6GM0bStkpPYYIdyKXP4axT2tKn8/ureWO
 EEITJqw/TNT0TgiDUH8ovNKMpKzkDz084D6wxFigFUlOGOiv66KJ4tFeNKlJ0Bc+eBs2doK9hX
 2Ug=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 17:40:22 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4H0MXP6xTHz1RvlT
 for <qemu-devel@nongnu.org>; Wed,  1 Sep 2021 17:40:21 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1630543221;
 x=1633135222; bh=qwMeHP58WtBj+deCXtNeDtBP+B6nSvChobKqRyMCf/A=; b=
 OSnpkBy2d83b1U1PLx9G2QGjeMt+O8SiMA4ucPIclmvpXYFclb+8Cwdrrton0mRC
 mPNtCC7Dlu1XX0uGiYrjdc3wrjqGcG4K2oKEhQCZHYrnUO4zp8EuHGVyC/R+YLup
 okxQfERRKXwNd5btAdusOhgk7L7EGiLyh2cMM+B4D3PfIKYB5T1o5aTt5Voei0Fu
 gIYmfNMufCn5E2DeYK/V3X1zgHulx4TDmMAnBcyUTBTRZf+dN9I63zoBeZ60omhK
 24IadH1dWT7K+T6ARDzEoyQVJsZRmZ8n2449/lxN44qlxZzdJKGeIGXv9BCVleW2
 Zm1ESR4364Skz6qx+JB2DA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id RzEjSnpbT65h for <qemu-devel@nongnu.org>;
 Wed,  1 Sep 2021 17:40:21 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.16])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4H0MXJ1jr7z1RvlP;
 Wed,  1 Sep 2021 17:40:15 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 1/1] target/riscv: Update the ePMP CSR address
Date: Thu,  2 Sep 2021 10:40:10 +1000
Message-Id: <28c908de60b9b04fa20e63d113885c98586053f3.1630543194.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=8724dbd3c=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alistair Francis <alistair.francis@wdc.com>

Update the ePMP CSRs to match the 0.9.3 ePMP spec
https://github.com/riscv/riscv-tee/blob/61455747230a26002d741f64879dd78cc=
9689323/Smepmp/Smepmp.pdf

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h | 4 ++--
 target/riscv/cpu.c      | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 7330ff5a19..ce9dcc030c 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -210,8 +210,8 @@
 #define CSR_MTVAL2          0x34b
=20
 /* Enhanced Physical Memory Protection (ePMP) */
-#define CSR_MSECCFG         0x390
-#define CSR_MSECCFGH        0x391
+#define CSR_MSECCFG         0x747
+#define CSR_MSECCFGH        0x757
 /* Physical Memory Protection */
 #define CSR_PMPCFG0         0x3a0
 #define CSR_PMPCFG1         0x3a1
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1a2b03d579..8ecb8df780 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -599,6 +599,7 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
+    /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
=20
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVE=
C),
--=20
2.31.1


