Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4B45EBB08
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 08:56:48 +0200 (CEST)
Received: from localhost ([::1]:35062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od4WN-0007u6-1h
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 02:56:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od47o-00053L-6n
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:31:25 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:44546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od47l-0001Eu-O0
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:31:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1664260281; x=1695796281;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DHQzmPIeQnXV7uw2Rg+3jXi+Skw1XkHJaFatBF3mOvA=;
 b=i1HhtO7LkNT+6pDDwGcCzB7Q+inCpj4EiCKVN5+aPh4AcThzTtTUwFij
 AQ14tuojG58iVac+io5plNbjoULVpARUO1d9SUtIza61cnRd7WY6ht0cN
 cUMd43vcvJJMMjrFYQgZnX6ho2GgMI9FmNR6z6Zc6H//vwcYDNw0I0Mjo
 kB+vUhkzYYZ+j+mhOh7DrdolLhyJ9jbtladxd/N0klKR504/WZr3k5buV
 CBENUB0aaYIn2x53bT4IzrFcBHH3BGM6QKzugQAz7V5mETiBmzUMmfRP/
 J52yLO/Dth6ox5QUEamJuEuqvyiePcElQQ2mFKFB+OB9Gpx2udTSf7IDZ w==;
X-IronPort-AV: E=Sophos;i="5.93,348,1654531200"; d="scan'208";a="217530818"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 27 Sep 2022 14:31:17 +0800
IronPort-SDR: cGoXj5s5vMzomGnlka3ymQJe8nyMjAsOO+GDqs1rE512WZd9xn56mYCA9qRiMunCUd7E/eyiFP
 cs30zrXW5JsBwCavslsco5od8eFl4u/pzk+GmXaRzlpz7o0dLS4fIihid6PEg+Mzc+3W27cp7+
 fdSQmZ6xbe9PNs6WIXhdg1vs+/ng1oviYHPKuHN22TOcyPCV/xncTnFObvJL+k9ohVJdbM9kmS
 cwaZKLuw80UEZReNkjYzx7fIkrOVHfbxcyBvbC1A4TMc6bZzybB6A9BDcOnv81nnlMLZA1pRTZ
 25vX5Wen4kYU6HDS3sxnKi3S
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 22:51:14 -0700
IronPort-SDR: 4CRsvBMz3W/pnvJhxgM1tV9Di1RpqWQIRp7JmD69388wramOYDZDKH0LHjEcvlAe/xiqWq/v+R
 HxVKNks7OSurLHsB4nYL33UDg1cK7Er4Ec+Naiqg8t8UuxRpCZDLMznrE+AQloL9eFHbB09Z6J
 T6OxkwjcWgl/niVRFnOd+ZgNbR488U+slSaoJATL11sEalkAMrzA65+xQNsc22lJXuBfKIWDxj
 MNXEzxB4Zx9glsiFRgIgy/Qx/bYSjqHgqObvGob8ntsbwQffj2tf6u1D80qoYdPR0i/tjRlJEb
 dOk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 23:31:18 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mc8sK4ZWRz1RwqL
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 23:31:17 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1664260277; x=1666852278; bh=DHQzmPIeQnXV7uw2Rg
 +3jXi+Skw1XkHJaFatBF3mOvA=; b=Dk6I9lz3kbxFecYfW1nwneM3sunRF1wDGm
 jekIwZZK0oi4BIwuXhkbXuuwwxEoaijZuR4pHedvs+8OcLDN3pD+2Zd74yO97SGL
 nkHwbyw6I/3uVI2hTGffz378YcVlU354qnj22whHT5kq3IcXXD1cxDKFFjArIjJb
 GqlskoOydFozYqjlELQbGCtSXa3UnyWBo3I6BIsOwUmLITKkzarvgoI7d4nhe/67
 oMi+7S02OILh9qmosAZqLvQt7PTYs1eCaUYxiXkJA08WQHJhPnozTOh4X70WlDHK
 evopk+8PIDJXzckcKFIH+iZahZ3ttmmutUsPZ7n4jiG82aDUwHpw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id pbYrQocnkpkJ for <qemu-devel@nongnu.org>;
 Mon, 26 Sep 2022 23:31:17 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mc8sH6K62z1RvLy;
 Mon, 26 Sep 2022 23:31:15 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 05/22] target/riscv: fix csr check for cycle{h}, instret{h},
 time{h}, hpmcounter3-31{h}
Date: Tue, 27 Sep 2022 16:30:47 +1000
Message-Id: <20220927063104.2846825-6-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927063104.2846825-1-alistair.francis@opensource.wdc.com>
References: <20220927063104.2846825-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=262caef14=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Weiwei Li <liweiwei@iscas.ac.cn>

- modify check for mcounteren to work in all less-privilege mode
- modify check for scounteren to work only when S mode is enabled
- distinguish the exception type raised by check for scounteren between U
and VU mode

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220817083756.12471-1-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index b96db1b62b..092b425196 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -98,17 +98,22 @@ static RISCVException ctr(CPURISCVState *env, int csr=
no)
=20
 skip_ext_pmu_check:
=20
-    if (((env->priv =3D=3D PRV_S) && (!get_field(env->mcounteren, ctr_ma=
sk))) ||
-        ((env->priv =3D=3D PRV_U) && (!get_field(env->scounteren, ctr_ma=
sk)))) {
+    if (env->priv < PRV_M && !get_field(env->mcounteren, ctr_mask)) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
=20
     if (riscv_cpu_virt_enabled(env)) {
-        if (!get_field(env->hcounteren, ctr_mask) &&
-            get_field(env->mcounteren, ctr_mask)) {
+        if (!get_field(env->hcounteren, ctr_mask) ||
+            (env->priv =3D=3D PRV_U && !get_field(env->scounteren, ctr_m=
ask))) {
             return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
         }
     }
+
+    if (riscv_has_ext(env, RVS) && env->priv =3D=3D PRV_U &&
+        !get_field(env->scounteren, ctr_mask)) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
 #endif
     return RISCV_EXCP_NONE;
 }
--=20
2.37.3


