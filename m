Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C165333CD
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 01:13:21 +0200 (CEST)
Received: from localhost ([::1]:36932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntdiK-0006Hv-5D
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 19:13:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdU3-0004Yj-07
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:58:36 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:2257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdTn-0005It-8A
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:58:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653433099; x=1684969099;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o33aK7IRIaR3yzkiXZGsKQ+ZxflfBO/YtB+tm9AfN88=;
 b=Cmo+my4eg8VsMzL/rX9jEPwOD/0Jb3fm9GcC+iA91Ldt+xYTu0C+QsZ7
 Vsr8Yw+49DKK0FaIhW38Mb3g++InA7cFeZIXevF7MqRrFmsRQFXfiuOx4
 Dce7qbwHikkj9to31bBUAlC7EU+H3X4gcy6d9vW2gmHRlE+58DtgN2SM7
 MmdUndxLAvI7/POg9VkWgcegGIeJXCqxk+in4MUXycy1ecy+fPYvY+7ep
 9sYIj8d0cUitNvtit+nMg0plxgaA9pTgc4cdjYUAgKpl5naHXosCNRTnc
 qbzUzbvAfgIc0EuUdrjWB+i2D9r8lF2IpcPoIGU5dpxbyd2PYOs9PKuWR Q==;
X-IronPort-AV: E=Sophos;i="5.91,250,1647273600"; d="scan'208";a="305567222"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 25 May 2022 06:58:17 +0800
IronPort-SDR: Yx69JYcKEcCF4GyihGiGOBzwMM+saiNPysQ2lv4SDsrTIWnMiJn6c8m3gq0N+bx9ru49hlW+pL
 6BJc810ImasdoZWSILXqzVQ0/BVLbWd67Z70MVz3jOUAHfsQ3wradb/xgXlCHxlaqLrXOI+OWh
 9ZSL51PjX0efqmTQ+8MasPJpQ8zl3ym2VkzfE41JXfA7/hlBEkzMcOm3bisqyQJCOqJPYPMEkh
 f0Kidd7oOcIB9S4kweQ6HPNnExegslYTIBuLIoxbzMq7iRhd2fU1fzM0XZsEd7GocP4GjOsIH9
 qB+9nBWVbP+nSL1FHEwF9439
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:17:49 -0700
IronPort-SDR: NFwWIbjl1T1dm5CkZSiM5EvUH1Fbx6hACzN20S2SDBj/QLvVqwaqpdvvV3Pny0VFVX1EMDZ8gv
 2PGRMWELMhTlMmjilLVF6Th2pAuPBavA+F/3NWOqzHXBQhCHveR489B6Gctk3BxtZelQ5ehsyI
 ZkDlgqkl3vxgX+eFFkPFdkTW0maQRL+hEdxES7iaazU4GUE4Abn+/gvXCMv+m05ZpuRF0RJQ3F
 LXW+TWa/5Pe/XnGg5qHWKeHvVIYsxMbfkQQKIL5YHuI0R6wnkggwAOTT3K69oPER7ct4PnkS98
 OiI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:58:18 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4L78R43tz2z1SHwl
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 15:45:04 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1653432304; x=1656024305; bh=o33aK7IRIaR3yzkiXZ
 GsKQ+ZxflfBO/YtB+tm9AfN88=; b=g4P9eYJYF3iCReBhjb2iWh++aAkT3MZklh
 zgi3XHIuW84tWS4dUmXU/53o9nCuTpZUyvCZXWZDqUaOVBHF/QNmhUcZOch2Gltq
 rYibZNTk2ib1SxjZk9sfBhv+U9B97J6ltR3nkTU6byreIIoHsXlcSRoFMXY645P6
 UJTdoABT4Bm8wCfAB8bcUyoBbPVYs0IdC26D3HyERRYBNWip/QCcr/E93W65gqxA
 u1etapW3LXsni3nwBQPDXmDIsMnAf8bL14lJvuqGDCtS3kuEWdlE4sLaC04As2kq
 Ei0t5fAiV904oMpKo5javzFBqjFu9F0IPPsX0ureLu8zM+2VCNPw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id rsFN37qFYmAx for <qemu-devel@nongnu.org>;
 Tue, 24 May 2022 15:45:04 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.5])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4L78R22WYLz1Rvlc;
 Tue, 24 May 2022 15:45:02 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 11/23] target/riscv: FP extension requirements
Date: Wed, 25 May 2022 08:44:16 +1000
Message-Id: <20220524224428.552334-12-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
References: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1363756b6=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

From: Tsukasa OI <research_trasio@irq.a4lg.com>

QEMU allowed inconsistent configurations that made floating point
arithmetic effectively unusable.

This commit adds certain checks for consistent FP arithmetic:

-   F requires Zicsr
-   Zfinx requires Zicsr
-   Zfh/Zfhmin require F
-   D requires F
-   V requires D

Because F/D/Zicsr are enabled by default (and an error will not occur unl=
ess
we manually disable one or more of prerequisites), this commit just enfor=
ces
the user to give consistent combinations.

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <00e7b1c6060dab32ac7d49813b1ca84d3eb63298.1652583332.git.rese=
arch_trasio@irq.a4lg.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 4ca6a8623f..b960473f7d 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -610,11 +610,36 @@ static void riscv_cpu_realize(DeviceState *dev, Err=
or **errp)
             cpu->cfg.ext_ifencei =3D true;
         }
=20
+        if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
+            error_setg(errp, "F extension requires Zicsr");
+            return;
+        }
+
+        if ((cpu->cfg.ext_zfh || cpu->cfg.ext_zfhmin) && !cpu->cfg.ext_f=
) {
+            error_setg(errp, "Zfh/Zfhmin extensions require F extension"=
);
+            return;
+        }
+
+        if (cpu->cfg.ext_d && !cpu->cfg.ext_f) {
+            error_setg(errp, "D extension requires F extension");
+            return;
+        }
+
+        if (cpu->cfg.ext_v && !cpu->cfg.ext_d) {
+            error_setg(errp, "V extension requires D extension");
+            return;
+        }
+
         if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
             cpu->cfg.ext_zhinxmin) {
             cpu->cfg.ext_zfinx =3D true;
         }
=20
+        if (cpu->cfg.ext_zfinx && !cpu->cfg.ext_icsr) {
+            error_setg(errp, "Zfinx extension requires Zicsr");
+            return;
+        }
+
         if (cpu->cfg.ext_zk) {
             cpu->cfg.ext_zkn =3D true;
             cpu->cfg.ext_zkr =3D true;
--=20
2.35.3


