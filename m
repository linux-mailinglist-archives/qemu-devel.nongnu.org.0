Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D12E65FA45
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:30:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdCp-0002BY-J0; Thu, 05 Jan 2023 22:15:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdCm-00029S-Kn
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:15:40 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdCh-00088g-Tg
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:15:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974935; x=1704510935;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jkqtf/nB1LyJ2kvaTpKBNvNheXkSnThcM37GAURNtck=;
 b=pxunDTQpaaMxyhZlaMRF/rqI265n7RUiGyOawmA/8o8DBoBy3OUMJ29P
 r/pWix4qP1/Ew8u0WCLpM+0VmAlCJMXNNZ6jPIbIfDP8f4eDQLd+9Srrt
 WW0stoLtuOuFHvMQGnfTxBypmgcudtFoLTvkREt8EOLimQosUyzhuGciP
 SZ8e4HyeNbGGGR83bEP/dYjGAPBlM0Ftaa5BRx0KRjtXEWbDrctsYu/nH
 vFPhMwtqHfYQJPEyIfAI8YaLQ44wYRqo6J/Jhdt/D/f68Zrrt9YLKjFRJ
 5EjBEpAgfY2MlMoIKDLytpDzOOpmxrI9TuYXsgdYunDMkH/XTM1lV+TIL A==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254808"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:14:48 +0800
IronPort-SDR: SUoJWhXMppWce7R+gqftUBbRlquyb1goaPMh4fPPOkk3t5CvgfuXA5e0Cc+k2gUxFr0JocN/L5
 19RnLQnY/TbXUB3Qxw2OZTv3/DdvfcTQzIbkuRJ7LdzI5tAQ035R4S8En7ewaWOUcb2IY3IS0o
 d06Yo/nPxUVdk974Oep108XAb01N0IWKhZ6TKA5oclmjyJ/bPibsclAjskB/QtreW2+WFeTORB
 59rG7iNV5Js+jQm6Ok3Vk1Ffu3OGm7fRGwLcEAHCBGpLljuyf0SsVXPT27n2wk5ukj99zRR5Mv
 ZjA=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:26:59 -0800
IronPort-SDR: Mvqc83Lwhh/dMeMnjITNIPpW3aNl46iujYuC6Hp/2mK51jRerT6N+mx33Yja9OYBIXX5CqhYz+
 UcUipPhiVTX80QWv1hgHIGZwFMO/CxK7hDGFyq0+XwYc185cBJYSqQP7SrU3VqGHjfO9sv3q4c
 yD3/aRYPBo2R5NgIWrf8khhVONB+l+zu8HKHTrT6dvmlxzCKNKItxSEw5gE6PH2K159EoVKTKp
 tB6OYgl9muekIAhhl7UYhIgHdKniTT5YdpfjPZ+PBk18o143uKoNOzbdxjKDjt2Bo4zsIPAPLQ
 QfE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:14:50 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7k01ztsz1RvTp
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:14:48 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1672974887; x=1675566888; bh=Jkqtf/nB1LyJ2kvaTp
 KBNvNheXkSnThcM37GAURNtck=; b=SP20GYP+/TGgs0Kukfi/q9WQMWcsqCON55
 3kQwNpA4fS/cotwWYInxNcMtxDuifzwJ/mXVsu5FDOfnj6QICVcgaKCak77NECFD
 mO9IFpEywhGQcYMnRlGm5p6oLjPjfOMAUEq/QqoNrTwPZIERNF832j4ubuS1sRZG
 3MXn0jgx8nj8geWcyZI6ZfKt4Yj5ubj2pofetLwxYJSEBkDKa4nZnp0G4IiXaERh
 fedNE2BoAXSp+uXwy/Zir2LnxNNymP0iluQMLbr6FU+a8jSJIkg2/dNX/bmSdBmK
 JSlUeTo+Q5lBvCuXzdaiA4CuI9O/M67bz5X1sx/1vEULntwNORRg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id WZBhZfItIyRD for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:14:47 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7jy5K1Kz1RvLy;
 Thu,  5 Jan 2023 19:14:46 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v3 25/43] target/riscv: Simplify helper_sret() a little bit
Date: Fri,  6 Jan 2023 13:13:39 +1000
Message-Id: <20230106031357.777790-26-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
References: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=363443eaf=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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

There are 2 paths in helper_sret() and the same mstatus update codes
are replicated. Extract the common parts to simplify it a little bit.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221207090037.281452-1-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/op_helper.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index d7af7f056b..a047d38152 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -149,21 +149,21 @@ target_ulong helper_sret(CPURISCVState *env)
     }
=20
     mstatus =3D env->mstatus;
+    prev_priv =3D get_field(mstatus, MSTATUS_SPP);
+    mstatus =3D set_field(mstatus, MSTATUS_SIE,
+                        get_field(mstatus, MSTATUS_SPIE));
+    mstatus =3D set_field(mstatus, MSTATUS_SPIE, 1);
+    mstatus =3D set_field(mstatus, MSTATUS_SPP, PRV_U);
+    env->mstatus =3D mstatus;
=20
     if (riscv_has_ext(env, RVH) && !riscv_cpu_virt_enabled(env)) {
         /* We support Hypervisor extensions and virtulisation is disable=
d */
         target_ulong hstatus =3D env->hstatus;
=20
-        prev_priv =3D get_field(mstatus, MSTATUS_SPP);
         prev_virt =3D get_field(hstatus, HSTATUS_SPV);
=20
         hstatus =3D set_field(hstatus, HSTATUS_SPV, 0);
-        mstatus =3D set_field(mstatus, MSTATUS_SPP, 0);
-        mstatus =3D set_field(mstatus, SSTATUS_SIE,
-                            get_field(mstatus, SSTATUS_SPIE));
-        mstatus =3D set_field(mstatus, SSTATUS_SPIE, 1);
=20
-        env->mstatus =3D mstatus;
         env->hstatus =3D hstatus;
=20
         if (prev_virt) {
@@ -171,14 +171,6 @@ target_ulong helper_sret(CPURISCVState *env)
         }
=20
         riscv_cpu_set_virt_enabled(env, prev_virt);
-    } else {
-        prev_priv =3D get_field(mstatus, MSTATUS_SPP);
-
-        mstatus =3D set_field(mstatus, MSTATUS_SIE,
-                            get_field(mstatus, MSTATUS_SPIE));
-        mstatus =3D set_field(mstatus, MSTATUS_SPIE, 1);
-        mstatus =3D set_field(mstatus, MSTATUS_SPP, PRV_U);
-        env->mstatus =3D mstatus;
     }
=20
     riscv_cpu_set_mode(env, prev_priv);
--=20
2.39.0


