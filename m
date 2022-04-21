Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 754C65098B6
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 09:16:24 +0200 (CEST)
Received: from localhost ([::1]:54710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhR39-00081s-8d
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 03:16:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQRx-0005Yf-72
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:37:57 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:13339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQRu-0007xw-HQ
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:37:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650523074; x=1682059074;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z0bcwNN6HlsL1bsaGzbPna1G2EFlJ2LfVwXnwKyKZhQ=;
 b=lENrD0ZKMpPPxFe7ot2Dx5FOBwBZz8rNvy7df4mtyQ46DrC5iS6zlhMW
 iF23kBgDE+ZoB9d2rldLrnxNRgulpMnkiMWDJc33CGzcX+qo23heSVf2b
 eZvddaGwYkRBvEPBmJpSzsLB7wsFlkc0HTW5jXJVttDGtvMfV9+m1JdoL
 9wiw4KH6j4Gtl4rc7IAgTuXVMl7vk5leLIKSUz9DiPYv+yHcLaX+8yRIg
 fm02rUEB8/cYxuBedqb3Q5otp2N4iFVA5a3uXBc2duKJw2XrJQM7z0m7t
 v11PF7+0HfgAJTkOUGLOT0cU0DaT3vB6WH1IBofxPLVZqIKiiyV9YpupM w==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643644800"; d="scan'208";a="302639995"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Apr 2022 14:37:36 +0800
IronPort-SDR: 7vY9/uCVer+3/zSnvZCeRvB6DyWaNnyItMi1IIgpRsXIeL32drm7QYMOFCUJzeNPDniutY0tKz
 WyIVD3ikFQ+5eZjIS8uHU5GALFeQZbEwoDmEiXrbEqemxkga6BrgvWUQY6sWNFsrxY9eMpD7Yo
 +MdEBwdCq3NojXZLgjeJa6YYOXWHQE6HBV1NH++I4MwE4lRXc44gl60QPxbEnedHROSvv9TAn+
 UAg2A1xitCe3n8O8d0AoYDTE9aPIBppAZGhiXDdCypYkmhKmog20yTjSocKnyjOQ4jGc/Oe7A5
 Mz2EhbU4de2T/N8AcJApionC
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:08:39 -0700
IronPort-SDR: FH7MvDARn62zC/iKTrxTuaDlsHAQYoxoturSLEyF1Th9itW2Rioix/6G2x9mk55kdz6iwxDBIl
 XE3hae/AbT024FCg52067dCTNyhfJJsK2FbOe2U6mGxhkKGiYqB5UbffTuVdLQyAfLBmG2TZo+
 07BVL86r6P7loFkHa04aKG0No7pjY0VlodUY/uzOaba8Opoxt7f2hXR+cHihLvA5UT1O386lMR
 SH032GqKdVOlcHcwbtRcQJfYiAWQ+ZktEinfV+j6egd6ntMgVsODu1DuzId9KZqjcZ9F1ivJbJ
 nII=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:37:37 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkSX04FhYz1SHwl
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 23:37:36 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650523056; x=1653115057; bh=Z0bcwNN6HlsL1bsaGz
 bPna1G2EFlJ2LfVwXnwKyKZhQ=; b=XqnKWbg07CtFvXh+dJTA0gmOiAlsBqNDCg
 DvqoLK4RlBy3KmrJE9lUreqkgFE5Wko8xKJ95Zo88W7FW5jQU55vmTga7zjHUEb8
 zDdf0NefQCA1eToIS+Jz3kLq8u2+UfAdYHOHnw6VEVr73vW1rIdUVeNAYU4gj0YX
 ehFhP3Y4goLynR8FGrMgYzBVqNOlmd3MZMoRoReJ1B12Bb2m9yL4kJdogEFFiwmY
 IHD3s1xjPDWKdNGgRjhzulvEl17IZk9ueSlM6DP04m3pZKlQWqjt3FOkVsqRHGLy
 3lgWsj4oGz+NZFkxCUVO7Y2XTKWHKdPRd9B4qtoY04GYyN4/M5Xw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id jhjplSMW3G_O for <qemu-devel@nongnu.org>;
 Wed, 20 Apr 2022 23:37:36 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkSWx6Pp8z1Rwrw;
 Wed, 20 Apr 2022 23:37:33 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 16/31] target/riscv: fix start byte for vmv<nf>r.v when vstart
 != 0
Date: Thu, 21 Apr 2022 16:36:15 +1000
Message-Id: <20220421063630.1033608-17-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
References: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=10363b772=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

The spec for vmv<nf>r.v says: 'the instructions operate as if EEW=3DSEW,
EMUL =3D NREG, effective length evl=3D EMUL * VLEN/SEW.'

So the start byte for vstart !=3D 0 should take sew into account

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220330021316.18223-1-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 99f3134aa0..576b14e5a3 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4890,13 +4890,15 @@ GEN_VEXT_VCOMPRESS_VM(vcompress_vm_d, uint64_t, H=
8)
 /* Vector Whole Register Move */
 void HELPER(vmvr_v)(void *vd, void *vs2, CPURISCVState *env, uint32_t de=
sc)
 {
-    /* EEW =3D 8 */
+    /* EEW =3D SEW */
     uint32_t maxsz =3D simd_maxsz(desc);
-    uint32_t i =3D env->vstart;
+    uint32_t sewb =3D 1 << FIELD_EX64(env->vtype, VTYPE, VSEW);
+    uint32_t startb =3D env->vstart * sewb;
+    uint32_t i =3D startb;
=20
     memcpy((uint8_t *)vd + H1(i),
            (uint8_t *)vs2 + H1(i),
-           maxsz - env->vstart);
+           maxsz - startb);
=20
     env->vstart =3D 0;
 }
--=20
2.35.1


