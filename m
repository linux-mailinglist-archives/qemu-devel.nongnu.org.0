Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B54C677489
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 04:59:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJnyK-0000y0-Ql; Sun, 22 Jan 2023 22:58:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=380dee0ef=alistair.francis@opensource.wdc.com>)
 id 1pJnyH-0000xb-UI
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 22:58:14 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=380dee0ef=alistair.francis@opensource.wdc.com>)
 id 1pJnyF-0003tv-Ta
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 22:58:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674446291; x=1705982291;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FxoK4IQ1hDzxmuW2EbFKJk8WcNRVQ67PURdzoxUFdNg=;
 b=NKarBnIsmjr0k3vL0aBeyDC+nhTnkd37NPh7KdqOw6rBIYh3W4uGnP8G
 GPnvJLLPWVw3xjLqgm/7HoQ1h0TAkfWRJ6d7jxNGfmAbcIhl8vt6sGwcB
 2kwrBPq4ZEf+Yy9b9vQr34m5XBZLSVQPlEXnTmjsE3DtpKlSFpwtBRC/Y
 +OeRZ6uFvL1Dr/nBuPAfUKIQOpbdzC3x7ynmg9SVB/jU/KMcTp9YobzZF
 7O0FXt4Ymtah+rH/ZqIeYYcX0+Cez1q6Mrx2edeqdPdiLFFXW8fWhq+Al
 uAGmc61wBkS3HSeYdbbovKNJ3a/fzanWm5Q3dnZbrZAORiIowUugY8FWW g==;
X-IronPort-AV: E=Sophos;i="5.97,238,1669046400"; d="scan'208";a="221590460"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Jan 2023 11:57:59 +0800
IronPort-SDR: NnhKvOS2X2FHjJPHQx6wQokbEK+D3IKnIOgAHB76im/XkfOv2Ue/9VKagVssRxPsXFOXWnElbE
 KX3oICJq0Gn2ToaxD7cOBNiIW1tV/LYN3SuJ9HlWlbYHHpfOQuf5JlaRiXl9B0HWraPGl49j7a
 m4n78h0xnEZuG7CyMfeyRWVp7UzRADqOJzU2evB+iSVrlVIiAouViESGBhF3WXhlNDET9zYZR8
 7Zzdx2BZvGB6E4eQAB1wsivPE71J++qettmKohccARVzyB36F5OYCDWR3BonOrwjQZGaNDEWbp
 e98=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Jan 2023 19:15:34 -0800
IronPort-SDR: a0ob1rqW8wwA5eRxjPgV40sP7z9IWDD8gTBwPSejBx27YK36RB4AgcZewUW+m2chDIEKxpkX3D
 bHNWMWHKKoDQ9Cc/CDHyW1+962QwDtOSn3oXMGjQ7jbOeiB0j+UB3Y1zuNqrcyUXUZ0S8FT7Xt
 RvVNMaCokSzdu2+8FiD/8rMYBOaXM1Ipi5bwiP1+SmhINdz0KyTWWjTQlO3tQ27OLNf7H5fpvM
 uhWrKGEYLJlISUdUtInpZyJvQ29qLVTiZZ4q3W+AkwkNjBbprocgh/T/2cJYozmMVxFscT+DDZ
 SzI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Jan 2023 19:58:00 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P0bsz4vzVz1Rwt8
 for <qemu-devel@nongnu.org>; Sun, 22 Jan 2023 19:57:59 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1674446278;
 x=1677038279; bh=FxoK4IQ1hDzxmuW2EbFKJk8WcNRVQ67PURdzoxUFdNg=; b=
 bnF0Xs1tw8Osn5skKiR/ZYDZUfoEC3cjXX4d3Pz5QJ8niRwZBRiiWYYxpnZ7zlnO
 +CQBb1ztPQucFxUuTjzb2MPDlcdi6MijU1qhT6wruUmZ5RWYlDnlEReYF89DPWPi
 ZnbHx1NIJnk7D3V+CPaPMKdDdZ9hP9/isXWoyADfQQzAygBkhKe7d7WkinBVdb6t
 chC1QfMu2czzM1mazpL7FcxSY/J6OyO4gxhBFvQmBiUzpdN9m+bMgqtmF8rj3yNs
 eCW8FKlODktCNnAI/ZyzGS2CYb87xcWxorst4fjAxCQP4GX8qx9ndzmb8wIRmzDP
 eZmeUJMEjKPCVEsslRwoXg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id X_n6TFdJ-AKz for <qemu-devel@nongnu.org>;
 Sun, 22 Jan 2023 19:57:58 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P0bsx0BLQz1RvLy;
 Sun, 22 Jan 2023 19:57:56 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com,
 Bin Meng <bin.meng@windriver.com>, alistair23@gmail.com, bmeng.cn@gmail.com
Subject: [PATCH] hw/riscv: boot: Don't use CSRs if they are disabled
Date: Mon, 23 Jan 2023 13:57:54 +1000
Message-Id: <20230123035754.75553-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=380dee0ef=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Alistair Francis <alistair.francis@wdc.com>

If the CSRs and CSR instructions are disabled because the Zicsr
extension isn't enabled then we want to make sure we don't run any CSR
instructions in the boot ROM.

This patches removes the CSR instructions from the reset-vec if the
extension isn't enabled. We replace the instruction with a NOP instead.

Note that we don't do this for the SiFive U machine, as we are modelling
the hardware in that case.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1447
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/boot.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 2594276223..cb27798a25 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -356,6 +356,15 @@ void riscv_setup_rom_reset_vec(MachineState *machine=
, RISCVHartArrayState *harts
         reset_vec[4] =3D 0x0182b283;   /*     ld     t0, 24(t0) */
     }
=20
+    if (!harts->harts[0].cfg.ext_icsr) {
+        /*
+         * The Zicsr extension has been disabled, so let's ensure we don=
't
+         * run the CSR instruction. Let's fill the address with a non
+         * compressed nop.
+         */
+        reset_vec[2] =3D 0x00000013;   /*     addi   x0, x0, 0 */
+    }
+
     /* copy in the reset vector in little_endian byte order */
     for (i =3D 0; i < ARRAY_SIZE(reset_vec); i++) {
         reset_vec[i] =3D cpu_to_le32(reset_vec[i]);
--=20
2.39.0


