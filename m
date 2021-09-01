Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F343FD11B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 04:14:16 +0200 (CEST)
Received: from localhost ([::1]:51690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLFlS-0007vI-Qt
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 22:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFi1-00059I-NI
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:10:37 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:10271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFhz-0007kS-OI
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:10:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630462235; x=1661998235;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KoU7XkDouYiICT5qUBtMPqWtkXPozf9NzlFInuCAXa4=;
 b=AQtyX4aRqw2GOkUA0AW89coV4g0RPcz/7qb4LhgA3Mjd5B3fkoq3tIrQ
 G12nYF1rqezagVJ7Wrg+UKH7Y1D4vunFdkfWW7unpQVcwf3KDdeKvXvJC
 OHl3EQRNftptdVCaNig3h6xh+Tc5B3u7dhqj6xbruhMbgeNFN8fR+/lCG
 MBiBRhTIk1EEndgCQRoxlYxtNLTGZung22Lm5mxAmgfg18+hfkoXlTikM
 hTvqeN+OnPdBClxIdzo9Vvi+Ca4a2o2CiKkZbZJDghpY9hcl+LWjkmu+9
 uNU5cvTXzu1euzs9pog3UEAa0119V3H3IwRZc73A5W38Zp5d6VtkqgdbP A==;
X-IronPort-AV: E=Sophos;i="5.84,368,1620662400"; d="scan'208";a="178011634"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Sep 2021 10:10:34 +0800
IronPort-SDR: ot07Y8BjcA+Z5ObU8UNvX/vxXzeqGeEba+SOFIbk1nFIOr6JTuR8xaFq1TjJvr8vjDUZFjh5Dh
 qfN6SNTI6kF88VJ3jIi7iA13vnFqz79yFNF/E8Q0WQui8FXL/SqZT8dogWj2vvITNNS3H6/3S9
 9tUXoBxGKDxx/ZvlGHZfmH2g/BHxt0ZsgTy1sVUOm6eVvurXc0dU3nVVj/abmUgAah9Q72W2z3
 Ga2wF5ZJBKmwUg1romkmml0FemsjHE5uZQcT4h5AmG/CmRJgsoQDZb5iVKcbLRUUly50EjbsUF
 a2RVm9TftFp2/h//XGF1/b9K
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 18:47:22 -0700
IronPort-SDR: iArISWe8LYftNwqn/9tZRCEypxxSgeMTTf4rq3wC7OQpL83G89M1rBuX2wfMqBuBCKhY9J13NR
 nIVOEbkkZpk0NAUelFC2YVoYbQDIHqS20Pq12Yk0/AcbhwQ3rxe/IRii2SpXgG3xseDERyfC3d
 C0xCd5KhPRzcoL1Jx8TTYRTRnHeJfhRaOo6iCDBQrwI1w476kXAAB0stweos4Ro22PYN/rgPv5
 Sj7VXoHlEYoKuEmkqLTUhz89oa95WHGaCne1Cu+PHwrsV7qMKNngzcJ8rK8X+FO53GvwCQ3TMU
 rm4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 19:10:34 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4GznZy0gXzz1Rvm1
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 19:10:34 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1630462233; x=1633054234; bh=KoU7XkDouYiICT5qUB
 tMPqWtkXPozf9NzlFInuCAXa4=; b=fyTM4t4/hKkb/o3/rqAxq75gh8cjKVQVGB
 YyjMfiDcuf72Iu1uOIFzMImC2974ygmKIIIxKKaCgFJ0SfooTJ+VOZSlnX+QTitf
 XnUiLhUn57exuKT8ouDThN8pEGqXKYMx6C5ZENROSJQQ4Q2XuaDzzA0kpQRxe/gR
 XkvTLKZFPDa+10d8deT94Qk8Mu+Il0DgTTEdBk19MT67gdBdA+TV/sbAX1MrLf6T
 vPC4Ep1NB8ckc73pJnpiVm4RfinwZj51qW5qi0F/crEnGzprRSbBzl3rrjoGDedr
 k2HNty8aFFrOiCYlLY7A5b846TwRnl3RfiLQXPLeOvzSBN9AdnAA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id oNuxtZhg0HUk for <qemu-devel@nongnu.org>;
 Tue, 31 Aug 2021 19:10:33 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.16])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4GznZr3cJMz1Rvl9;
 Tue, 31 Aug 2021 19:10:28 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 04/33] target/riscv: Don't wrongly override isa version
Date: Wed,  1 Sep 2021 12:09:29 +1000
Message-Id: <20210901020958.458454-5-alistair.francis@opensource.wdc.com>
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

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

For some cpu, the isa version has already been set in cpu init function.
Thus only override the isa version when isa version is not set, or
users set different isa version explicitly by cpu parameters.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 20210811144612.68674-1-zhiwei_liu@c-sky.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 991a6bb760..1a2b03d579 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -392,9 +392,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error=
 **errp)
     RISCVCPU *cpu =3D RISCV_CPU(dev);
     CPURISCVState *env =3D &cpu->env;
     RISCVCPUClass *mcc =3D RISCV_CPU_GET_CLASS(dev);
-    int priv_version =3D PRIV_VERSION_1_11_0;
-    int bext_version =3D BEXT_VERSION_0_93_0;
-    int vext_version =3D VEXT_VERSION_0_07_1;
+    int priv_version =3D 0;
     target_ulong target_misa =3D env->misa;
     Error *local_err =3D NULL;
=20
@@ -417,9 +415,11 @@ static void riscv_cpu_realize(DeviceState *dev, Erro=
r **errp)
         }
     }
=20
-    set_priv_version(env, priv_version);
-    set_bext_version(env, bext_version);
-    set_vext_version(env, vext_version);
+    if (priv_version) {
+        set_priv_version(env, priv_version);
+    } else if (!env->priv_ver) {
+        set_priv_version(env, PRIV_VERSION_1_11_0);
+    }
=20
     if (cpu->cfg.mmu) {
         set_feature(env, RISCV_FEATURE_MMU);
@@ -497,6 +497,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error=
 **errp)
             target_misa |=3D RVH;
         }
         if (cpu->cfg.ext_b) {
+            int bext_version =3D BEXT_VERSION_0_93_0;
             target_misa |=3D RVB;
=20
             if (cpu->cfg.bext_spec) {
@@ -515,6 +516,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error=
 **errp)
             set_bext_version(env, bext_version);
         }
         if (cpu->cfg.ext_v) {
+            int vext_version =3D VEXT_VERSION_0_07_1;
             target_misa |=3D RVV;
             if (!is_power_of_2(cpu->cfg.vlen)) {
                 error_setg(errp,
--=20
2.31.1


