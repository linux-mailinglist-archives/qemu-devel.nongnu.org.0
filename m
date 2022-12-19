Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2392650642
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:19:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75ja-0000Ud-Bq; Sun, 18 Dec 2022 21:18:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75jU-0000Pk-Om
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:24 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75jT-00015O-70
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416303; x=1702952303;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o8dl9X7n0QpbDK6OlU8v1kgM0gsCxofq6AuWFPs0GJo=;
 b=O7YbFG4jSVE0KUwoYkxVLSBaYf1n3U7FU4+QL8jroKlI43uz/Qk7jYAc
 Lr3hbE3CeJkMal9/bNNBh+qwawm6/n+ldHD2i0IQe8mjuz5ULxcgrA5O7
 7/s1NiQw4oZbfyQm+zdOTu725YtQzKBRbxI0nh/xg2TxEUVaMRucb1bA1
 jKwSUef7L7L5roRaQC1npnilab3Fpt09MKTnB2uJegMfWpZgZkucWTM66
 0AqTyH2/HNbo+s5DxfIx8ce3GtXfsZg51MOPM2z7DrMNdF6Clzw0srX3J
 ylQjF1rMtR19HWsy0TbLah4ZNWh/OuBGc0U9Agpum3045x1he2XKzGG3x w==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="217199351"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:18:01 +0800
IronPort-SDR: Gs/RhNibEKnDJLHoNjIp+RWeJkiK2Wrh7DtwEAb1jGc7EkXtOkJ5EmgvWSWK3I1WV7iHk3hZXq
 GeOepuXE8P+nBRvvRlXfeNgIIFPq6TgH2PuT4TQuwG+Nb6WMoXP3FjdmpcN3yhzSJVLr3GuFIR
 FoaUwGNjtr4LekBC3zfKV/WhpJFZCDcEb0ihTVJNE0Etgwim8/Yy9kkmrZ9XWkfhqQcyCojDTt
 AQ+ORgHF/fKmPVFoQnCkxa2vtzN7KSNBWPLD38YIdDjCrxJc9PvNiYxGa3tEUGy9G2vvsd7Tny
 /Rc=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:30:34 -0800
IronPort-SDR: /JdMds7DJLRpaKQyNMywU3vzj3drmoUWSWIb3XaGrok0vw8q4g5VQeG3M7FcQ4MGd0+Vo2nRQN
 cWlqVC0nT/yL4klLLfc5ZG95tDLp3m1iFTPijIv+3C0s/F+1dsqpaWDV0Vf+qna/uzVgISDHlO
 E46QHwbEl5TWuBcmguxAJYJi7yobErfbP3mPfC4FgTyxwfsG3quAhGTyR+78GknrLxSdtXQodg
 S+mJrqdyEE/pulVniXPdEeoCzTjOn8Edd6f1dplaTFVzUGhbbijey308OAAH+yQS86FXtFzBQp
 BUU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:18:01 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3Jn1HQRz1RwqL
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:18:01 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671416280; x=1674008281; bh=o8dl9X7n0QpbDK6OlU
 8v1kgM0gsCxofq6AuWFPs0GJo=; b=hP+GYVBZ3+TMb/a+yo2sUmwEPioo7RjpvH
 Tjj+FK0ZMP1kw3D+7y76D7i+0kKgLgY21gMK0svc7785OB7EUqlmQMx7Nc5IEU2Y
 HgGfHS1dKpXGZ4Z46sSYm/vKP6RSGPYINxESX0J7uKz8/eZaT0J/+x6OZbTE7S+D
 PRQO5BdTqt6W46An7leq+oF8jOP6jNFHKFZP44XJhq9c1zdqNoUv5che/PgfRAyG
 OJV1MfXbtDd7XIrOXFtahAhNGrk98gjwHSL3AunHwirP9GH/drFln13/iZMEmrVU
 8MQK2CttUIkVW4togpsZ9US6GHm0O0nQakS7UE8ovv2Ey0kEs27g==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id ZPvzMFn47NZD for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:18:00 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3Jk71jDz1Rwrq;
 Sun, 18 Dec 2022 18:17:58 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 20/45] target/riscv: Add some comments for sstatus CSR in
 riscv_cpu_dump_state()
Date: Mon, 19 Dec 2022 12:16:38 +1000
Message-Id: <20221219021703.20473-21-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
References: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
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

From: Bin Meng <bmeng@tinylab.org>

sstatus register dump is currently missing in riscv_cpu_dump_state().
As sstatus is a copy of mstatus, which is described in the priv spec,
it seems redundant to print the same information twice.

Add some comments for this to let people know this is intentional.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221125050354.3166023-1-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6fe176e483..b2c132e269 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -382,6 +382,10 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE =
*f, int flags)
             CSR_MHARTID,
             CSR_MSTATUS,
             CSR_MSTATUSH,
+            /*
+             * CSR_SSTATUS is intentionally omitted here as its value
+             * can be figured out by looking at CSR_MSTATUS
+             */
             CSR_HSTATUS,
             CSR_VSSTATUS,
             CSR_MIP,
--=20
2.38.1


