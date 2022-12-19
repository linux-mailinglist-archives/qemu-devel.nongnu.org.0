Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3810665066E
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:30:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75jp-0001KV-CB; Sun, 18 Dec 2022 21:18:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75jn-0001Hn-45
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:43 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75jl-00015X-Bo
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416321; x=1702952321;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lkr40dqOmoRlHb4uKWd/0UnkaNvhnwtWV+0/s7TpnTE=;
 b=aK3Nyub/Q3PVHzxLrhj/Qf/f+Dn2HUgr44kEITMty0U725qrBDwZaqSo
 LmxjhMozt805Cj4sQ+RVZe3IcyxFlWRm5uVrmYvBMR9gQLcFEm+c349qa
 +VxqVQ3D0GuH11/n7mHg1C/cc6/Xw5rkT2eyiHS1wZTnaBD0OyjPkB0SS
 Oor42u7vLs90CIRGoRZ94b6Gv94oqS/M7vlFDHV2ColdbusU3dhFI2Pw7
 G/CmKcdn5CVfyz1MPD6wtE0AbiI5SjI9PJE40H2kRZD1iUL1lWayb7fn+
 eY7RPasd1s6UAd9M5N3JQ69EsJTGRDISgG9+FaIJDTAvwQLxTUKneFhqU A==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="217199367"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:18:10 +0800
IronPort-SDR: AaKvkI3gGAVPwL3Jm6/88E+9+N6uIQn3hEHiaFju56kNp1xdpcpkp3mgtzUDdMvKSXKrB/duay
 8vACgDX6ZH189/WQTDTFBtAwtvjCtl2xe3OCHEvqyv8qtfX35iOwvzlLRlmck2onjlMPoNxWRl
 9N6vLMVzbFgG4D2OnlW5pfwhzEAfiH1ZfY6jLjgdabn9GehiUYlmo/Q2jjSt5wagrQ4BZMyS6w
 s+yl19D1juqDF88E7bRLCDRv2cZfgXsFVnUJ4RaB3ELAjDOnLI4REkcvMo0de3HV/SfuE4qOSY
 kvw=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:30:42 -0800
IronPort-SDR: zY8UsQj28fNKyRIaIwsPI5gv/jxhriDwsZXfvXzuB7Fwg9bDEgzjIONd3oh3ok84K4BbOjRe76
 +k7btxPIlb1lTF38Spvi+mNVYY1HyEVT1KtxMYKQyJ4vNMtnrasZ1tev1aUWETPhjETK4FElmM
 Rjkty2iWvzUW7xwHRJ8VNvtv4TTDGXxtfdaQXBR77FLYY+6M8oXTpX67rRneUz21k9boY+zSE0
 DnmCzpUrjWvqP/flQQYt2B9VA1vqcBD4q3hLikKn8Z1L5il23Y7fHqTMmhKB0YJ9LbfIwrCNoc
 Vl8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:18:10 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3Jx6tFNz1RwqL
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:18:09 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671416289; x=1674008290; bh=lkr40dqOmoRlHb4uKW
 d/0UnkaNvhnwtWV+0/s7TpnTE=; b=Jx+9OJ3EYcHw0vlVR27hHzgLwV+hDbJOEH
 pm14Ed4ycp26tY9ZsXNTShlZlj125E5q+Ua9DeJX5sSfnd4rYYZ1IZB1/KmX3uNJ
 7X0r6ykYugzAwxsvJD9l9W1z4EIQsMQEEidC8VwYBIwnEWiYvJPB/Q62vm47MMGB
 3HvJsU3CTD+0cnevgO+/ZYtix9YPQAmMfBAeSqswZUFi0umnzwupaXCx+N2RT8bo
 89qypD46sz5Y1V67GToqmav8LGIEyfc4W4CnsEOWyTJj6PmJTe+DUzLauYwGvRGE
 B9BNzFQLfrXwOiOvPz2doDngbA2gQ57XKlODyupAk3kPuuvNPCuA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id pMTwTUpGWKvD for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:18:09 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3Jv5JKsz1RvTp;
 Sun, 18 Dec 2022 18:18:07 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Jim Shu <jim.shu@sifive.com>,
 Bin Meng <bmeng@tinylab.org>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 24/45] hw/intc: sifive_plic: fix out-of-bound access of
 source_priority array
Date: Mon, 19 Dec 2022 12:16:42 +1000
Message-Id: <20221219021703.20473-25-alistair.francis@opensource.wdc.com>
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

From: Jim Shu <jim.shu@sifive.com>

If the number of interrupt is not multiple of 32, PLIC will have
out-of-bound access to source_priority array. Compute the number of
interrupt in the last word to avoid this out-of-bound access of array.

Signed-off-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Message-Id: <20221127165753.30533-1-jim.shu@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/sifive_plic.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index b4949bef97..0c7696520d 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -78,6 +78,7 @@ static uint32_t sifive_plic_claimed(SiFivePLICState *pl=
ic, uint32_t addrid)
     uint32_t max_irq =3D 0;
     uint32_t max_prio =3D plic->target_priority[addrid];
     int i, j;
+    int num_irq_in_word =3D 32;
=20
     for (i =3D 0; i < plic->bitfield_words; i++) {
         uint32_t pending_enabled_not_claimed =3D
@@ -88,7 +89,16 @@ static uint32_t sifive_plic_claimed(SiFivePLICState *p=
lic, uint32_t addrid)
             continue;
         }
=20
-        for (j =3D 0; j < 32; j++) {
+        if (i =3D=3D (plic->bitfield_words - 1)) {
+            /*
+             * If plic->num_sources is not multiple of 32, num-of-irq in=
 last
+             * word is not 32. Compute the num-of-irq of last word to av=
oid
+             * out-of-bound access of source_priority array.
+             */
+            num_irq_in_word =3D plic->num_sources - ((plic->bitfield_wor=
ds - 1) << 5);
+        }
+
+        for (j =3D 0; j < num_irq_in_word; j++) {
             int irq =3D (i << 5) + j;
             uint32_t prio =3D plic->source_priority[irq];
             int enabled =3D pending_enabled_not_claimed & (1 << j);
--=20
2.38.1


