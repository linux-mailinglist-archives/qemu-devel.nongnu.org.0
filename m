Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD316538FB
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:49:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87nv-00036f-9v; Wed, 21 Dec 2022 17:43:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87ni-0002ni-Fs
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:43:02 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87nX-0000Xf-CJ
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:43:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662571; x=1703198571;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FTpM9wSisWlcMO9trrZZ4PMyQatiOo+GCvuYX47JsM8=;
 b=GPSF/ZbI5gaJ3b8ofjNaMXZYU1cV9ZbaTUFVdssOZOB9ajJCTyPVX10X
 Y7YsXh5EfYcYTegb56nGEnz6iPYHtCaaMvSoxJxiq50dHvlpocoWp8nRb
 C+XLXEisSJijvE/T+OVHE0ieB62/dwSUoUPHBlKiie8wsjvCDA7c5O6gU
 Z2x3LR45zzrtXiFbr2F9Uu7gGUli7pb06sBX7rLZ74iePa7gwHgiD4mVi
 wR+QQdzm2rCZuygoqXDGc2+DvAatezDsGGRwV+div2A7K4onCnxLFzokJ
 RdDh1rXaVyxi2unZtm3szor/VZrlMq917rPnHu5nmE1AalkeVy+abQ9e+ g==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561440"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:41:45 +0800
IronPort-SDR: Sn9qk+fPAvUq1LaonfJQBYZ9bWM+wW0aOEiZ3GgGH5J/7CLoZP3zCJWpUQ5vj4ok4pwVgZdWRa
 cDV4/yXOfglXLnTWSiTZun58pAw1jGF1E7XwEJ54Pse0q2vgeI3+ZUEM7gdDngnGOoasN10Mq7
 yE0x2wNqy7f/u36Z1GQPRxyRVSf0XzvCS5C/bCV87MP4OZgRSpaEtFofJJxIUzHLsWXKl8cWsa
 rd/phG2Ahs7b3N05E9+bvjNjYSpuMaZgk3tbmzkS6ClNZZksTk//mhFIX0EoId+tS2XYmKL00e
 J2Y=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:54:14 -0800
IronPort-SDR: 8rA94bQ3qvXg04GEuqKB75iUP1tpV6i65XKYNxv7C5E0bvHNk2iAEJjbpVHplXXQ+ogkiPLCGa
 RG+UDSllPZU6DhYKpWK6WPe61/hFVMctSHe5TGad400XO3ZM6M4tV+sU0OvB2+ol1RPXkD4uwz
 HoblGWSU2gWsR8syHes4xlaUzHZDTd0j6lPw1KfE8RtSKka+XfwKTFbcRevbm60slpORf7vgOz
 rl7fmZNeraBqDAOwr8hmh9+zFUNSuitJA4zYDadMAEKW6SfN7J1nYmGXxNyzypUUPCra18fN2m
 guw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:41:46 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpMs691bz1RvTr
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:41:45 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671662505; x=1674254506; bh=FTpM9wSisWlcMO9trr
 ZZ4PMyQatiOo+GCvuYX47JsM8=; b=kYtGfFBYvzqidI5zbu/WCczRObfCrL3IkS
 PlLok71VcQD2LeuLcbonBWA4ezi+TBKAHyEYHmxIIJj5CsSoFfTpUpBesWRD1tjY
 3DwdyZvg0NBAFJvRWZlETxY0pUvtH9WmbkDa80yQCxVniaVZvRv2Ku8Xya+TyCOd
 VwswABz5St9fZ4kir9PaxVZ9FBbE5gmdJFQZdEhguxOlFhCAhv3aTDkqIsQo6W3P
 sklHnrTWW8x7MNHqEnUZm9Bjc6ExoJQSahe7RwoeoGbgxcYtLZs4Mypgw9480ns0
 dwpjvis0ShKssaLUVqClG41XkwAGQ9lJ8ukFvWH67LFY2vl+PNUg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 5KkKAlqKMP67 for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:41:45 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpMr1gJqz1RwtC;
 Wed, 21 Dec 2022 14:41:44 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 36/45] hw/intc: sifive_plic: Improve robustness of the PLIC
 config parser
Date: Thu, 22 Dec 2022 08:40:13 +1000
Message-Id: <20221221224022.425831-37-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
References: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=3472792e2=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

At present the PLIC config parser can only handle legal config string
like "MS,MS". However if a config string like ",MS,MS,,MS,MS,," is
given the parser won't get the correct configuration.

This commit improves the config parser to make it more robust.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221211030829.802437-7-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/sifive_plic.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 936dcf74bc..c9af94a888 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -290,7 +290,7 @@ static void sifive_plic_reset(DeviceState *dev)
  */
 static void parse_hart_config(SiFivePLICState *plic)
 {
-    int addrid, hartid, modes;
+    int addrid, hartid, modes, m;
     const char *p;
     char c;
=20
@@ -299,11 +299,13 @@ static void parse_hart_config(SiFivePLICState *plic=
)
     p =3D plic->hart_config;
     while ((c =3D *p++)) {
         if (c =3D=3D ',') {
-            addrid +=3D ctpop8(modes);
-            modes =3D 0;
-            hartid++;
+            if (modes) {
+                addrid +=3D ctpop8(modes);
+                hartid++;
+                modes =3D 0;
+            }
         } else {
-            int m =3D 1 << char_to_mode(c);
+            m =3D 1 << char_to_mode(c);
             if (modes =3D=3D (modes | m)) {
                 error_report("plic: duplicate mode '%c' in config: %s",
                              c, plic->hart_config);
@@ -314,8 +316,9 @@ static void parse_hart_config(SiFivePLICState *plic)
     }
     if (modes) {
         addrid +=3D ctpop8(modes);
+        hartid++;
+        modes =3D 0;
     }
-    hartid++;
=20
     plic->num_addrs =3D addrid;
     plic->num_harts =3D hartid;
@@ -326,11 +329,16 @@ static void parse_hart_config(SiFivePLICState *plic=
)
     p =3D plic->hart_config;
     while ((c =3D *p++)) {
         if (c =3D=3D ',') {
-            hartid++;
+            if (modes) {
+                hartid++;
+                modes =3D 0;
+            }
         } else {
+            m =3D char_to_mode(c);
             plic->addr_config[addrid].addrid =3D addrid;
             plic->addr_config[addrid].hartid =3D hartid;
-            plic->addr_config[addrid].mode =3D char_to_mode(c);
+            plic->addr_config[addrid].mode =3D m;
+            modes |=3D (1 << m);
             addrid++;
         }
     }
--=20
2.38.1


