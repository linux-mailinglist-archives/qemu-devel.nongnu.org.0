Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC19F5FEA4C
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 10:17:54 +0200 (CEST)
Received: from localhost ([::1]:40276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojFtA-0006nM-8Q
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 04:17:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2798045df=alistair.francis@opensource.wdc.com>)
 id 1ojFc4-0003TV-TE
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 04:00:12 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:22740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2798045df=alistair.francis@opensource.wdc.com>)
 id 1ojFc0-000203-Gw
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 04:00:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1665734408; x=1697270408;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JlOIGMlxsbLZSNQCP1g/Jmlg7IbKnnhXLKVCAdVyOZ8=;
 b=U1/nQpPn4LGjAlx3Jurp7Qncpzox67DpmPm9xOPbwoOVXQZAWz+6YtQt
 S0krJbwKIVdYf0XfcNElsY2im3nmSd6CYKtVhcw6z53eteV+NmhFn7JNZ
 xTEr6N5a+nuc86Vu/s3rvaTUMR4nX37+LXmZdk3krTRv7NHsIlaOIJexJ
 xs/HOHtrs5GZT++KscXGNGJmrmLz5QETRoxUtE9tg9FMOadaie7jhxrAw
 MoWjXVTpgQ0OMvr5K5/s0toAXEREz+pD37jgOMJ16YH4ue5NW9Y9JfexM
 E4FNI+03fujSVldenqP3clY1YHEkG2/djvs2BqBmrm1KdDkWlW2CCpFqJ w==;
X-IronPort-AV: E=Sophos;i="5.95,182,1661788800"; d="scan'208";a="218968413"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Oct 2022 16:00:06 +0800
IronPort-SDR: N1XMzANt96CohztiOnuKkljNPKb73+Dh2Z2nUoQvzOJOmpfsBMVxeKGuc5EqoPKin5XJmB+Xxm
 iqk6la8T5pwMV1Su9DYdHYDZkgNRejQdKbfEcXdlhfkZcWgHmaUGubRpriF6Ux7SqX0ZaCY3C6
 plLRMRQDqxm+j7WZaVieSK7xFf5PBFDlsviWTW0CJtWEmGE1y0m7DsVbqzw9lMgj/UDulBFGjL
 N1omdXskSAXAUam6hVfgARxiiI8M0pVCVo3jyWqWXN+N1uT0bGIg+iDpl8E/LmSRKs0gYcA6Gn
 srwOGACbdPCeMLNJG2u8ImrI
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 00:19:43 -0700
IronPort-SDR: 971V2F8Cdr2OiBg9I2TP+GXGtd6bFnuJyUriQliQGKM/I3SvoV63mBmuQ7zRCY48NwlkqAkVx3
 LPwse1et725VC+t1wcd86o6sPiwyGG6cO+ziAJtI7pMtTqe3I4g4VbHFvygaaM8vpT/YVbuzUj
 yNUXmpu4mX/oVioknKCjqzanberPI+a1S7Hrw8Oz2hOPMqcyCXrpctmprGsAAdgPMl8pjIDPZJ
 HOM8anORQQDk1NAcWhvupOEz1sMjvxwtugtX4lvPmHqnF7idcQWdqTm//UkD1NH+TGZ6wh+j6t
 DKA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 01:00:06 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mpf1y1bZ9z1Rwrq
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 01:00:06 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1665734405; x=1668326406; bh=JlOIGMl
 xsbLZSNQCP1g/Jmlg7IbKnnhXLKVCAdVyOZ8=; b=P+ousvnGpEjjuEm/49lJ/MT
 fvazo9vbM9ecjAN0vYO12XAzVicdDk3WS1WxVYRDSD20qomtpy9Yveint+rbQKB3
 2IZZMhEUNg0tg+TZ5zpUf/ewmZnQJayQEDrf8csuX2hOpiJcSt7f++MbWlQKpOde
 gk9jlNJZq5OvKgTKauXtcCrxFrVkpi1QnWPFyRiWz0SEia2BFg/4Kr5jwwU7kYsi
 nPLHoSUtYUjehr29KIc6DWpAz62/xQ0lno4LJxhQSeCflPwX3IKho/ImQ+98c/ye
 5nW/v3xrhlBxL3rdO3aXikFXahY8JYxuoPPMxAvqVsMYbt9xZ7EzO+ncN+14jOQ=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id rHEOMyjAkj6H for <qemu-devel@nongnu.org>;
 Fri, 14 Oct 2022 01:00:05 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.19])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mpf1m2F63z1RvLy;
 Fri, 14 Oct 2022 00:59:55 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Jim Shu <jim.shu@sifive.com>,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 09/10] hw/intc: sifive_plic: change interrupt priority register
 to WARL field
Date: Fri, 14 Oct 2022 17:58:29 +1000
Message-Id: <20221014075830.914722-10-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221014075830.914722-1-alistair.francis@opensource.wdc.com>
References: <20221014075830.914722-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=2798045df=alistair.francis@opensource.wdc.com;
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

From: Jim Shu <jim.shu@sifive.com>

PLIC spec [1] requires interrupt source priority registers are WARL
field and the number of supported priority is power-of-2 to simplify SW
discovery.

Existing QEMU RISC-V machine (e.g. shakti_c) don't strictly follow PLIC
spec, whose number of supported priority is not power-of-2. Just change
each bit of interrupt priority register to WARL field when the number of
supported priority is power-of-2.

[1] https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc#=
interrupt-priorities

Signed-off-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Cl=C3=A9ment Chigot <chigot@adacore.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221003041440.2320-3-jim.shu@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/sifive_plic.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index f864efa761..c2dfacf028 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -180,7 +180,15 @@ static void sifive_plic_write(void *opaque, hwaddr a=
ddr, uint64_t value,
     if (addr_between(addr, plic->priority_base, plic->num_sources << 2))=
 {
         uint32_t irq =3D ((addr - plic->priority_base) >> 2) + 1;
=20
-        if (value <=3D plic->num_priorities) {
+        if (((plic->num_priorities + 1) & plic->num_priorities) =3D=3D 0=
) {
+            /*
+             * if "num_priorities + 1" is power-of-2, make each register=
 bit of
+             * interrupt priority WARL (Write-Any-Read-Legal). Just filt=
er
+             * out the access to unsupported priority bits.
+             */
+            plic->source_priority[irq] =3D value % (plic->num_priorities=
 + 1);
+            sifive_plic_update(plic);
+        } else if (value <=3D plic->num_priorities) {
             plic->source_priority[irq] =3D value;
             sifive_plic_update(plic);
         }
@@ -207,7 +215,16 @@ static void sifive_plic_write(void *opaque, hwaddr a=
ddr, uint64_t value,
         uint32_t contextid =3D (addr & (plic->context_stride - 1));
=20
         if (contextid =3D=3D 0) {
-            if (value <=3D plic->num_priorities) {
+            if (((plic->num_priorities + 1) & plic->num_priorities) =3D=3D=
 0) {
+                /*
+                 * if "num_priorities + 1" is power-of-2, each register =
bit of
+                 * interrupt priority is WARL (Write-Any-Read-Legal). Ju=
st
+                 * filter out the access to unsupported priority bits.
+                 */
+                plic->target_priority[addrid] =3D value %
+                                                (plic->num_priorities + =
1);
+                sifive_plic_update(plic);
+            } else if (value <=3D plic->num_priorities) {
                 plic->target_priority[addrid] =3D value;
                 sifive_plic_update(plic);
             }
--=20
2.37.3


