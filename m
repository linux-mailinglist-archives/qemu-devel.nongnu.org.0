Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2263A4B31CF
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 01:16:54 +0100 (CET)
Received: from localhost ([::1]:54326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIg5t-0004kC-7z
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 19:16:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfrN-0005tB-LF
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:01:53 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:7710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfrJ-0000FE-0j
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:01:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644624110; x=1676160110;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lq1YADGSCZFa18AOrj3oFEX4AW2ekGKuYY1tpRjAVEA=;
 b=OAGX0ODzrOfDVozqpL1C6IBvwayqm7ERA+jamaoZMudL3zrTPXGFQgG4
 b4jhavcTWnAZD4xcV1Y8NoCw6WciSBR2+dRKLRqh/ECFi1croVFtFeZwC
 ZATnVxliIelOYoxJNfYEph2lqQAs05KXK++aQreSvHHxreKrgxoyfW4iA
 uY+0ySRqv8qsQ9LezjS5gbS1tjNNiPz7P3sxEfFsy6S8bmgmcwFrdRVrl
 6u+7UPwYZMA+4X0GpsCiRO1TzpsKca15rxYjc7w7BDfwHnO6HrgN6Ywyp
 5UsX2v12PhyAMn5iOJeb/vlfogETofhcFq0g9BdogzLm8EJCpKDk24hyX g==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635177600"; d="scan'208";a="193710085"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2022 08:01:49 +0800
IronPort-SDR: vnbKPYLWQQOF77bO46Z5tFdnju6eC3Ol2lW78DvHc+G8OdDwM8Yfmyyv5b1RxT/HjLiabtjiaT
 RIR+rGEqmeYP4yw5WQ0Lf7oC8lRZBVPFTIrqkAfVRP9o9yHbMluwO+GmTKTmKdixzrlbUq8zxA
 sNx2vTFXmPUruWrxuWWOqG5q2UMVCrvsjG6dHdNDKGTJ4K/H4ppI2teDVE3m1XM1GU67wCbned
 OpklOIv48TiWxNhHg/Wte6f4bu0ndowQVnt6dfNqUbUeWzeqIj984WRoRq8Cmfcn6TwpPQtIMD
 nwFR2jPE5vGPcrQl0BiE5pB1
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 15:33:33 -0800
IronPort-SDR: WjPleI9mOoYWkXOiBUJIi23dusVggpc83XQQWApQMjhMzMtBQoGE7eUvKZb/9vRHcozKosOxMn
 5z+D4ECjnp5fYoXICwWjrk5baFKyDPd7tgxjr0gtd1YtwPihqIyYBvLtSBbvfVj36aqRTTJYP0
 cxidulxW2zEWn4oiMK0KwcBT82P9ZFkyRkdGAyfLBSovdzEDegd7rwTaxVw/jYCC5wqHLvgV7i
 S+Zgdkc+yS1+RpmWLsmCytp09vFqELWl3KGF6BOK8mE3mnTH0fdadNJxcyH1zhZeD+l9UgVI6n
 NNA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 16:01:48 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JwVyh14LYz1SVp0
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 16:01:48 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644624107; x=1647216108; bh=lq1YADGSCZFa18AOrj
 3oFEX4AW2ekGKuYY1tpRjAVEA=; b=k24cU1iQDrbIVJ2g1Tngd5gy/NAIhlWBtW
 QPN7FBLTW2tQbaFyZOz+ONCpqwfnQ3TI/WtNi5CbLOvVeSd2EeBq6KmSEk4TwXVi
 uBVmLBi+PQrRTgAy0f8QygHv8IeoR17RD7s2wYOg6npRmyRPSOw8azIkIFfvp1Ma
 UBVEtesLe3uk22fTV/sXZ/Lz1t/tMjFw0l42xis6IC1MXiACYlN2Wt8T87ygthF4
 UiHjOQ+wdy3rYXPr9OYh+5PJ5NqTbuFewJ6QX9z5pzgYxUo0B7pzSdcYc+0JvgIh
 1Wohzm3i9GVN0Vurd3Hfv/zBtrdjFDmv9BI5w51Opm7RLAfBj0IA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id nGwAgO-TfJ7U for <qemu-devel@nongnu.org>;
 Fri, 11 Feb 2022 16:01:47 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.96])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JwVyc2gY9z1Rwrw;
 Fri, 11 Feb 2022 16:01:43 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 11/40] target/riscv: Fix vill field write in vtype
Date: Sat, 12 Feb 2022 10:00:02 +1000
Message-Id: <20220212000031.3946524-12-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
References: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=03511bb56=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

The guest should be able to set the vill bit as part of vsetvl.

Currently we may set env->vill to 1 in the vsetvl helper, but there
is nowhere that we set it to 0, so once it transitions to 1 it's stuck
there until the system is reset.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220201064601.41143-1-zhiwei_liu@c-sky.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 020d2e841f..3bd4aac9c9 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -71,6 +71,7 @@ target_ulong HELPER(vsetvl)(CPURISCVState *env, target_=
ulong s1,
     env->vl =3D vl;
     env->vtype =3D s2;
     env->vstart =3D 0;
+    env->vill =3D 0;
     return vl;
 }
=20
--=20
2.34.1


