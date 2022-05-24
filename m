Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE2B5333AF
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 00:52:19 +0200 (CEST)
Received: from localhost ([::1]:52326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntdNy-0008Ge-QY
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 18:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdH8-0007xQ-O4
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:45:14 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:62493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdH2-0002oX-Ko
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:45:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653432308; x=1684968308;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/TIOY+nvX4poh/55m167fBtn+VEzcKILhkO0mLZRjj8=;
 b=NkZjL12yeG7V0nFqgxQTp7Ai5j8ttJNCaSRSfWqD5ihYxpm2wBz1nT48
 zQqAP3SEEo3KPUO53FV3LZq38QLjSW5EzWepZCEakR3LrsOfqbGYIZOMD
 aHsQ5EmVHdHZHsARN6B7w01QfKfLzU6FM/IBCjyMgN5iuNghD48ZJQdMa
 Jd9M8oHBZFVLO2B7qLGLSkkMe2CXxTnysl179omkXuRvKSunq+BsC0x3m
 dHPX7SWLWu6QVKIRcZoafsP3pCAoXsCRDV8pVsxlazVonlAyXgYt454k2
 1Idhnw59RZLcmUUJa7iR6L2JPbUQmSXbzWd+QVC8vcv7fzRiBC6HhwCUl w==;
X-IronPort-AV: E=Sophos;i="5.91,250,1647273600"; d="scan'208";a="305566678"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 25 May 2022 06:45:07 +0800
IronPort-SDR: rJgetsfPI4y9c7RDZAOuOWa7VHGPJjQvT1AYNRx9Esja8zi7yWAuw+qL41Rrh52x8NrmR0K2ar
 0C1MeP6lOBFu0bci/E5V22SAUUGeCMpRJZDP4+iFie86jF9ntHSwZ/JeBORhPndoSK7L0s56jL
 OZa5VUJwv/oSWNXnbZM2TNGIhDNIe8DSdgm3SrzCuUUTVMr4mYgAjiKx5dh3KFGmXlHLN+qAup
 akDvN8jV9z+L5MIoAcHZHWH7ISkFeXFqcDUWQp80NStZxvpFp49qgu+GA9tCQK9wtotVgbEYyr
 MCKuN/DPGS9LovogIWEN/1cO
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:04:39 -0700
IronPort-SDR: h7qLj8hIAsJoEhiEMYfQmlhRGPgVedpIzXXBpOK6UY6/MkZ9a1mx6sX2ic+CdBvYx7RLhzqOvu
 BE9Mg5XNGbaS9PDDUs4311bioQmnDbODqReB3t9DsWGQ+xNcprXCUO7vZpBKiLKOZ5csVpeoMt
 +KgE2ZIr3QUKB30LRL687IhQYjie/AEII0xeJ8xpNpAnWy3ZIB+Rm+9sI7aH+SYuL3qBiq8NYv
 xc0h2iiocooyp7j8d8Z65OITDmIIDXJmbRCj9ZlD0T7gBK0oHdEn3IKrsMjLNRhYiNKDlFUhRo
 URU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:45:07 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4L78R66x3yz1Rvlx
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 15:45:06 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1653432306; x=1656024307; bh=/TIOY+nvX4poh/55m1
 67fBtn+VEzcKILhkO0mLZRjj8=; b=RLRLhUFgQE1CaIw2CW5nYU+EjrcpYAAga+
 Py2IoKzXqjaoKJw2vInIfbAf07TIGbZVe2DJ2IfJWOilAfLzulVsTDiUIevaznvo
 G3B2NtGaAdnoY3brEbwC8PqM7NP8zzkZiI2qxPBMaeS/ZaFbxVr/vPQqYhw5pRoV
 5ZunLJp7BAv4Hld8UvW85VYNVM+46Mq2hStak/Z4kijzc13DQoTkDwpNqf7cMLHS
 /0jx2DK7r6PZFfU2fM703cyAagzHqVp94ovCEVzZxC5M4sDEefQPBf4w19udH0YQ
 xpW/xODyiyljVitoWg6oK5+CVbF9spGLf5bzPrxXeSkhK+AV8Zfg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 2ybqTabL8IcT for <qemu-devel@nongnu.org>;
 Tue, 24 May 2022 15:45:06 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.5])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4L78R45VqFz1Rvlc;
 Tue, 24 May 2022 15:45:04 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 12/23] target/riscv: Move/refactor ISA extension checks
Date: Wed, 25 May 2022 08:44:17 +1000
Message-Id: <20220524224428.552334-13-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
References: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1363756b6=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

From: Tsukasa OI <research_trasio@irq.a4lg.com>

We should separate "check" and "configure" steps as possible.
This commit separates both steps except vector/Zfinx-related checks.

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <c3145fa37a529484cf3047c8cb9841e9effad4b0.1652583332.git.rese=
arch_trasio@irq.a4lg.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b960473f7d..00a068668f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -630,14 +630,27 @@ static void riscv_cpu_realize(DeviceState *dev, Err=
or **errp)
             return;
         }
=20
+        if ((cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) && !cpu->cfg.ex=
t_f) {
+            error_setg(errp, "Zve32f/Zve64f extensions require F extensi=
on");
+            return;
+        }
+
+        /* Set the ISA extensions, checks should have happened above */
         if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
             cpu->cfg.ext_zhinxmin) {
             cpu->cfg.ext_zfinx =3D true;
         }
=20
-        if (cpu->cfg.ext_zfinx && !cpu->cfg.ext_icsr) {
-            error_setg(errp, "Zfinx extension requires Zicsr");
-            return;
+        if (cpu->cfg.ext_zfinx) {
+            if (!cpu->cfg.ext_icsr) {
+                error_setg(errp, "Zfinx extension requires Zicsr");
+                return;
+            }
+            if (cpu->cfg.ext_f) {
+                error_setg(errp,
+                    "Zfinx cannot be supported together with F extension=
");
+                return;
+            }
         }
=20
         if (cpu->cfg.ext_zk) {
@@ -663,7 +676,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error=
 **errp)
             cpu->cfg.ext_zksh =3D true;
         }
=20
-        /* Set the ISA extensions, checks should have happened above */
         if (cpu->cfg.ext_i) {
             ext |=3D RVI;
         }
@@ -734,20 +746,9 @@ static void riscv_cpu_realize(DeviceState *dev, Erro=
r **errp)
             }
             set_vext_version(env, vext_version);
         }
-        if ((cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) && !cpu->cfg.ex=
t_f) {
-            error_setg(errp, "Zve32f/Zve64f extension depends upon RVF."=
);
-            return;
-        }
         if (cpu->cfg.ext_j) {
             ext |=3D RVJ;
         }
-        if (cpu->cfg.ext_zfinx && ((ext & (RVF | RVD)) || cpu->cfg.ext_z=
fh ||
-                                   cpu->cfg.ext_zfhmin)) {
-            error_setg(errp,
-                    "'Zfinx' cannot be supported together with 'F', 'D',=
 'Zfh',"
-                    " 'Zfhmin'");
-            return;
-        }
=20
         set_misa(env, env->misa_mxl, ext);
     }
--=20
2.35.3


