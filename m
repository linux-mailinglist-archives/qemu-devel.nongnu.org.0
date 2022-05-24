Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F29D5333BB
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 00:59:04 +0200 (CEST)
Received: from localhost ([::1]:39300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntdUV-0002rh-Nq
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 18:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdHM-0008AP-0R
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:45:29 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:62493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdHK-0002oX-7j
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:45:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653432326; x=1684968326;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/km2jMjpOPfQy5UybcLUCqHKpRCYx8nEX6nYcOp0r3w=;
 b=IdAHmKQB96ROVsd5nuTqvt7bElUyL8Zm6PXEleOFfnOkgHPx0YPvmFUd
 qGwX4oFk02sHBMoSnVJekr3C1uIujLXEWMUMBj8mmy+JfIm8iHn8qYOYJ
 VQDc2N6NvxxC+TuU5JBlXmnLcl0zMZ7Tj8G1PJWzCrbLvcNg1Vx6KjYaP
 xsyBv2lUk41sSJgmBG9QIJItQE+oxFOb0PGUutcS079uWDgeK4jDDvYn8
 D4o8q8YxwB/RJyeqDtfa5UF9g6Ut6Q61LsaVU/QPNEcKdSwq1Yg1uy9Cg
 jG/L67X5WAD62NLmf0Kp/hQNKizG7jvcWZjFtlTDNltlXekrbGxUPaQFA Q==;
X-IronPort-AV: E=Sophos;i="5.91,250,1647273600"; d="scan'208";a="305566693"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 25 May 2022 06:45:15 +0800
IronPort-SDR: JskTBFVy2btLYftrokFySjnwT8kSim0gy4Yi3K+tsuoCHsfaLdbwl2UUjIwseNKnljTrl+Rdbf
 7XJJUUvcj5ahvPS1bhcen1Ypcjjn+/GtZYV2B87VDEXpAvtDWkzSoIYBh1yb4yvDQWYlafW/EH
 B5BlnuS4MVDFp8b9Hqu8hJe0BZi3gZARrTEb4QGZBb7ofxcTHKF+rxYsNNzjwJ5gsp18mDr5gp
 pDzerBfre61dZDkMysMcp3gotXRxi3dwbeefOaTtL+o2ZY3pXtRVLf6scN727MVgaCoyxZFPHG
 dIofYKbbzpo5Rci6CNxFpLg/
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:04:47 -0700
IronPort-SDR: UYkOdTzCVzQakLcPtkWUgT4XCqZUTbWNsvrdm49tjIueHt9ALOaqNtzbpEXBz59U5iRk0tR6Ta
 q8aTrEn8sCmfpN58sXx3WRBScWwJgCgTIhvg427S5nLX82vs4UIW5fDr7/Sel2GR6EVh5f8mre
 mJF9bVA1dVKo4xQaKpWZetpfhnohv7yHf8E19qIlH2Qb7eXWhl+hxNm0c64/8k4FlMGQ5x6cEv
 kRU2uBhZ/J1L/6fefjzNkQVmpQyeLAG5VWhxZBRlTFj7SfJC2d4fjmNFnpJrJpo4BBpGcU06lr
 aNs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:45:16 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4L78RH1fXnz1SVp0
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 15:45:15 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1653432314; x=1656024315; bh=/km2jMjpOPfQy5Uybc
 LUCqHKpRCYx8nEX6nYcOp0r3w=; b=mL8mu7QqfKu4Kk4OroWKEnRRuoEPh3wTD6
 ho5jwndK/ytCWqmFJaTFe2PzVSFpEfhK2o8g3agyMHAk9JWAzLkENlXlIvZyPwe3
 pn9CIA0yuUsoJLCPg2CKrq7KsBAMt03Us0ABuyGU55vRS+Ix0NV7GmsUKCgHjkgQ
 SJuZg/6p7lRgw8IS9sKa/MgG42f2N6qXV3Bx1LLRZVJYJOBtPn2DNqAKTed36ecE
 Y3dvooc+13nuRPzBpDPk+4qzeepAuR1f/NyLwpA6T1iFkCjZlNXMA4Uj6u7M0FA7
 ukpFlJPSeCji3asAughoXHDrDU45XunLx4r6bBMEnm1d4ij11YXg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id ywdpEg9-KXCl for <qemu-devel@nongnu.org>;
 Tue, 24 May 2022 15:45:14 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.5])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4L78RD4zKRz1Rvlc;
 Tue, 24 May 2022 15:45:12 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 15/23] target/riscv: check 'I' and 'E' after checking 'G' in
 riscv_cpu_realize
Date: Wed, 25 May 2022 08:44:20 +1000
Message-Id: <20220524224428.552334-16-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
References: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1363756b6=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

 - setting ext_g will implicitly set ext_i

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220518012611.6772-1-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 00a068668f..87e1eddce6 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -584,18 +584,6 @@ static void riscv_cpu_realize(DeviceState *dev, Erro=
r **errp)
         uint32_t ext =3D 0;
=20
         /* Do some ISA extension error checking */
-        if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
-            error_setg(errp,
-                       "I and E extensions are incompatible");
-            return;
-        }
-
-        if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
-            error_setg(errp,
-                       "Either I or E extension must be set");
-            return;
-        }
-
         if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
                                 cpu->cfg.ext_a && cpu->cfg.ext_f &&
                                 cpu->cfg.ext_d &&
@@ -610,6 +598,18 @@ static void riscv_cpu_realize(DeviceState *dev, Erro=
r **errp)
             cpu->cfg.ext_ifencei =3D true;
         }
=20
+        if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
+            error_setg(errp,
+                       "I and E extensions are incompatible");
+            return;
+        }
+
+        if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
+            error_setg(errp,
+                       "Either I or E extension must be set");
+            return;
+        }
+
         if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
             error_setg(errp, "F extension requires Zicsr");
             return;
--=20
2.35.3


