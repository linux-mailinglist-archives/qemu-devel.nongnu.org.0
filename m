Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 244C13FD146
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 04:23:41 +0200 (CEST)
Received: from localhost ([::1]:49314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLFue-0008IO-56
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 22:23:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFjw-0007bL-FJ
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:12:36 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:10433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFju-0000fz-HR
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:12:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630462354; x=1661998354;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jiKOZJRaBXBKcFzhnrRqXaoj0xRlXy+gX5m8el1Ul2k=;
 b=Zz97JiM1duewj+K3c72ChADuMtdnum4TyanQr6PY3juIY3OdS0Guw4es
 an9rBPxJPdEVRnElmTvfBN7nhMboklEhW9qBS1cgEbfny7JVj0dcBpzuU
 7j5Eq4SH+Y0VuD/2HBTI203f6y1dkQbOFMg853l8ZpuGbXSqIOvypfEl2
 PZeShpsGKUdsWoVgKNyI1N3UjxlKjIX+nTYuvtdvWAEpVfKiwNZmOMIeN
 GskwSkgRJd7l6kqabGw63sLq1wAgVgHGKuuXlXTREWz8QSxN31arhe34D
 ifaLZAMOAXQR2PZMZYRKuWI8TxdP5fWzRgwY3h507Im9kUx/SFwpFVlVG w==;
X-IronPort-AV: E=Sophos;i="5.84,368,1620662400"; d="scan'208";a="178011767"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Sep 2021 10:12:33 +0800
IronPort-SDR: zzm9gn2Nvy8D6LNaWGi+t9gFSxSmo/T7T/fATD9HjLc+WDKb9kWtFtD4+Mmr91GXdKwwg7/9q/
 vcFZA2Srvf0xmoarBtWih66kB+a3MOQ0/O2Ub4cmxLitxXpNMbgZ/k5JoFEF9XuYzAweplnaAd
 NRHRisXK8K+yrwP5FV23PJ8OcSVHvY7v0UPE0w8T1cYFZ05pCU/EbTIsMV/K1JJdUfXyv9C3tc
 1c6xui/zBapbh9i9HnCqBLncYFJtaMzR3puah+XTnv9szjZyYAifgeJyiTNiPJQr8EPdC2XgDB
 IzYXs/mWeWTMJO6Ea6W+oHeB
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 18:49:21 -0700
IronPort-SDR: 7DQbVhmKDKmqYjKAiqzvcQn6QzBQJE2JjITWq3mQP7Qgq/AE1vFLLSSbamVNxI+Anw1+R9v7Qn
 DraKr44TWTpu24NH73Wx0wFOtCrpQiXZUyn9CjRpK6Yr8wDUQcBybiKKcsRtW4KyiOzhHj7HKe
 C8D5x1u7Jyv0UzUin01IaGGMYkb/dXGWsXrvCEbWlAg7LkBrYq8qgGfQcd/X6szMjkYM9vuWPs
 ETlVRmfz1KogLzx3ewfJoiuh2aBYav7hb70XaP5wphoGa0CGyrmGIU+83GNLJV3Ca0SaHMGhc6
 sPQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 19:12:33 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4GzndF15KGz1RvmF
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 19:12:33 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1630462352; x=1633054353; bh=jiKOZJRaBXBKcFzhnr
 RqXaoj0xRlXy+gX5m8el1Ul2k=; b=PnIc+5cpmZm/8N5WoZ3looZ3wCmShx5ltb
 6k2x1DeddEG2ZJ3HTLhyI/qpl61sj6XkFDrJ4Sxw8vqVdhxGcrLav2Ry2c37fA1s
 5ofs0ASh25HkvwITvxDtAvjdYu1oSH5aZQvU97D8UCXsn+0iiiNddDyuVgLCWNdI
 RlFfpa33te/PG7Tu/nO4iaqKx9B4X99DhRoEheQ87Rv1UCx1A0/aFJOo9Qftkugx
 rpvasVPa9qBv5+0zN6URd42C3zero3eL0MeRzB0BFQzhNvTD9Ot51jLK6yCOSk3g
 re/7HE9T+n7br54V3g68w7Bwq3/blVDrviEao/PH82GCeQqj78XQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id E1TLYpm-28PA for <qemu-devel@nongnu.org>;
 Tue, 31 Aug 2021 19:12:32 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.16])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Gznd810k8z1RvmD;
 Tue, 31 Aug 2021 19:12:27 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 25/33] target/riscv: Fix rmw_sip, rmw_vsip,
 rmw_hsip vs write-only operation
Date: Wed,  1 Sep 2021 12:09:50 +1000
Message-Id: <20210901020958.458454-26-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
References: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=871df42ed=alistair.francis@opensource.wdc.com;
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

From: Richard Henderson <richard.henderson@linaro.org>

We distinguish write-only by passing ret_value as NULL.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210823195529.560295-17-richard.henderson@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 6d7f2c2a95..16bd859121 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -937,9 +937,12 @@ static RISCVException rmw_vsip(CPURISCVState *env, i=
nt csrno,
     /* Shift the S bits to their VS bit location in mip */
     int ret =3D rmw_mip(env, 0, ret_value, new_value << 1,
                       (write_mask << 1) & vsip_writable_mask & env->hide=
leg);
-    *ret_value &=3D VS_MODE_INTERRUPTS;
-    /* Shift the VS bits to their S bit location in vsip */
-    *ret_value >>=3D 1;
+
+    if (ret_value) {
+        *ret_value &=3D VS_MODE_INTERRUPTS;
+        /* Shift the VS bits to their S bit location in vsip */
+        *ret_value >>=3D 1;
+    }
     return ret;
 }
=20
@@ -956,7 +959,9 @@ static RISCVException rmw_sip(CPURISCVState *env, int=
 csrno,
                       write_mask & env->mideleg & sip_writable_mask);
     }
=20
-    *ret_value &=3D env->mideleg;
+    if (ret_value) {
+        *ret_value &=3D env->mideleg;
+    }
     return ret;
 }
=20
@@ -1072,8 +1077,9 @@ static RISCVException rmw_hvip(CPURISCVState *env, =
int csrno,
     int ret =3D rmw_mip(env, 0, ret_value, new_value,
                       write_mask & hvip_writable_mask);
=20
-    *ret_value &=3D hvip_writable_mask;
-
+    if (ret_value) {
+        *ret_value &=3D hvip_writable_mask;
+    }
     return ret;
 }
=20
@@ -1084,8 +1090,9 @@ static RISCVException rmw_hip(CPURISCVState *env, i=
nt csrno,
     int ret =3D rmw_mip(env, 0, ret_value, new_value,
                       write_mask & hip_writable_mask);
=20
-    *ret_value &=3D hip_writable_mask;
-
+    if (ret_value) {
+        *ret_value &=3D hip_writable_mask;
+    }
     return ret;
 }
=20
--=20
2.31.1


