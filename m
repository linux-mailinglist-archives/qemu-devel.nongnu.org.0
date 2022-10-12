Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 475F45FBED2
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 03:18:19 +0200 (CEST)
Received: from localhost ([::1]:51562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiQO1-0001Y2-Ot
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 21:18:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=277d47975=alistair.francis@opensource.wdc.com>)
 id 1oiQL3-0008IZ-Vq
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 21:15:14 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:23146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=277d47975=alistair.francis@opensource.wdc.com>)
 id 1oiQL2-00079x-7F
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 21:15:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1665537312; x=1697073312;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+OpQTEF8UgNdGDhyzHmfDFQFjpK4Tr4WQ2QIYAH5hro=;
 b=aY/qmgiyRvGV8NfJ1QsxnYI9anYdeQKSyI8tkVuKaR2xq5gy2NzfR8k7
 UCK/u+px6mjBaUmE2eUqpCD+EJC4HlAIiDBExkN+mCnUe5Hcw30XPAG0S
 8YmL/CBagZdwyOVuq9Fx2RV95WKmONlZ570dcuTwlM+Jl23a8EJE9Dbg/
 afMyz0RxeTAvTesuUsMeEpA3d50Li6zK7xCxVutQgNQYjhusMqUoHoNQA
 gTKVepi/eQQfVTvmOYxhnvZvOM4EM/mF6ISPQrLiQtyyVE1X0SBgB3/Ur
 1LbCx7oi8XVIC7fShHG9ZRWyZfyzA+fiYcB46RyPz1WhOB3SXCXUEd67c w==;
X-IronPort-AV: E=Sophos;i="5.95,177,1661788800"; d="scan'208";a="213551685"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 12 Oct 2022 09:15:02 +0800
IronPort-SDR: NujC9ocVwLHOhCuzkRPJGde6Jul3aq+rWazRmadNsVSW6EMeGGr3zemnzq5yqluACIsleaZ6lG
 WjAFhXkJtsVFwvrQefzjAthKmyVAH7jKMODXFMeUZxjh5HtU/OA0th54tWaCkJNm6BCPxrFINc
 Vrk/TW+vSkEKf9e42nvWsghdgzxTmogyMzsEf43EXfmKbWqc+FrhpWjKFG8D/qtimGy2jPw42x
 g2YpZkdiMjx6c4KmfR+RpLlts34qCLvIm+2tIEiRGlUgY+jOKeeD4fOiSNdlegL08ZzdcsnmIz
 Rmjly4x0txV2sWgC2vUoQ8qs
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Oct 2022 17:34:41 -0700
IronPort-SDR: 0Qb9ZbzIcdEkswwpYTwXmB5mh9ketUrlfVT3qBaVSEFD6r3PZ4tjy4q0TbAkZFJFyvDGtoxSdR
 fYtOoR6Z4KHSCPx5uUQUBhTFeUUOhfDnXL5cnChSOME12HMnZz75c0rOhj+/Pyd5BDi+xn3yrx
 rIJ8nycFrNR5MDgCxCZhKleG7qGd2R+0eC1kAVcFkPrvKgcKjr6J0SpYL2p6bcP4Anfsk0GA0F
 MxmwHFsdYHG0qaUK26ssATZBtjsTZDxFrRnobnd/FZ3f64TqhIbno81p8j4tM3qLW90vKLggdj
 jhU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Oct 2022 18:15:03 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MnF7V4Ltlz1RwtC
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 18:15:02 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1665537301;
 x=1668129302; bh=+OpQTEF8UgNdGDhyzHmfDFQFjpK4Tr4WQ2QIYAH5hro=; b=
 hwTmuvurrhYQVDftXtM7sEKbknMud5RkYlS4OHKE4PxFINccE+nzIq34sILOwf+g
 VMFcTdEjLtw1kCfW8/4wiGx16w98IJtS7AV2beDY2+fSVGDGh20hlVz9b8Q80iJu
 t3qHtn4Zf0c6Ge3LKJr4XvAnMwU2KWtobMPTdVvJw/+7RAZFDL+MwbWgXfsM7Ocu
 conVN8yrD56Tnmc4AUX6JVs/RIUc5Lpo68gotBY5rSZAo1pWwLMpCr82V7uWf2SG
 pq3XG1SQZYapf8DYub7vnkdrnSpT1POQBAt7pn5n1nD/xVsVW630O2MC4f7SuzF1
 Neu5PJtTw0oldp87YZqEQA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 2ZdFtSls3mol for <qemu-devel@nongnu.org>;
 Tue, 11 Oct 2022 18:15:01 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.19])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MnF7Q30FYz1RvLy;
 Tue, 11 Oct 2022 18:14:57 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com, richard.henderson@linaro.org
Subject: [PATCH] target/riscv: pmp: Fixup TLB size calculation
Date: Wed, 12 Oct 2022 11:14:49 +1000
Message-Id: <20221012011449.506928-1-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=277d47975=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alistair Francis <alistair.francis@wdc.com>

Since commit 4047368938f6 "accel/tcg: Introduce tlb_set_page_full" we
have been seeing this assert

    ../accel/tcg/cputlb.c:1294: tlb_set_page_with_attrs: Assertion `is_po=
wer_of_2(size)' failed.

When running Tock on the OpenTitan machine.

The issue is that pmp_get_tlb_size() would return a TLB size that wasn't
a power of 2. The size was also smaller then TARGET_PAGE_SIZE.

This patch ensures that any TLB size less then TARGET_PAGE_SIZE is
rounded down to 1 to ensure it's a valid size.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
This is based on advice from Richard:
https://patchwork.kernel.org/project/qemu-devel/patch/20221004141051.1106=
53-9-richard.henderson@linaro.org/#25043166

 target/riscv/pmp.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index ea2b67d947..2b43e399b8 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -628,6 +628,18 @@ bool pmp_is_range_in_tlb(CPURISCVState *env, hwaddr =
tlb_sa,
     }
=20
     if (*tlb_size !=3D 0) {
+        /*
+         * At this point we have a tlb_size that is the smallest possibl=
e size
+         * That fits within a TARGET_PAGE_SIZE and the PMP region.
+         *
+         * If the size is less then TARGET_PAGE_SIZE we drop the size to=
 1.
+         * This means the result isn't cached in the TLB and is only use=
d for
+         * a single translation.
+         */
+        if (*tlb_size < TARGET_PAGE_SIZE) {
+            *tlb_size =3D 1;
+        }
+
         return true;
     }
=20
--=20
2.37.3


