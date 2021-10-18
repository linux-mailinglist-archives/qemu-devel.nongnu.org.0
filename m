Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AF9430DF1
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 04:43:58 +0200 (CEST)
Received: from localhost ([::1]:53320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcId3-00028h-Tm
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 22:43:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=918244500=alistair.francis@opensource.wdc.com>)
 id 1mcIYl-0003wz-Q7
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 22:39:31 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:39474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=918244500=alistair.francis@opensource.wdc.com>)
 id 1mcIYj-0006FF-6o
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 22:39:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634524769; x=1666060769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sGvXZ7gbqwE2Gs2i+V2A5rZ4fDqWSNjQndpH3kVaf/Y=;
 b=Mv9+QUmRcuKhLvZ6IZV6UpqVoZJtInYGLUFIwU+mlB3dkCO/zNhv/VI8
 4l4FsJOvbpznqg8oZSELzQ/p/jRjJws6/vTN41DD75LCXkxvvE3rAW67w
 KCoOYa+WwRUi12IjFvZdwaJpB0PpqXD6yxOPBw0NyH+SqMiwJEdSPMmjS
 TOzl0jf+XGqjpDqO8+vw1IP7rcANdUcLvGBF5cFgupzoRrdroD/rBHgZx
 2nMDAK0x46YT2/+h3xbImV3Ul2QMu2FTjORpb//VtrXkg04lKHeoRc64n
 BdsDsc866xn8cjsvZwgtfhW+cBMOheTFuIW/bRX/+AXFiNV/6+FiieIGX w==;
X-IronPort-AV: E=Sophos;i="5.85,381,1624291200"; d="scan'208";a="184083889"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Oct 2021 10:39:24 +0800
IronPort-SDR: 6N+uuR3Mdhy8PebZ6N47vBFQRAszZIxhYqY8nWBUCD21HcZ/NN2JT8J6T//mZIJWtaimInuDjd
 EHkBRtgJxNfyVDSlavSYgjq4MbH7o/jMAL4mr4y+zvL0HtDti/FLFz4shHE+akzdicwhgSAlJS
 +hYpz5a1nPbW8uE1s8kdLAhf2IHwInvJ6FGpudnLHOkn0IntSCF55D3fJOZvYIB5vC2tm6ij3L
 1QnG7cuI3JzZAjuL3Cr/1pdubxWssNco/Hin3pjcnhu3grIa66RF3as+lTKqtYk3R3Zjay4CJf
 xpZtshcQrz8yRGgqyWu2l5xR
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 19:15:04 -0700
IronPort-SDR: dCIOF6M+slaMpFMFD/K3qV7nzM58qN3Ef4+iFamAvWNIXkbDiyU9hoqDABi3vG+f0ocGqDp7dv
 C07/BIBXPa3PxlXG5AUXzu0J6NhejwFPXgSyWOwXOUHd9/4q/h6kg7N4XpRo19nynVjkyAjT2t
 8cdT3/BxMe9LWMjF1jgBeTinc61FKKS4PPx/don76aby58Xe6QSfHgmIV9cJTlKZDanmwEqyhK
 203/VqU1fW0E/G+VHAJMYs2SErXUYaX6xvSUcqR2gRzCHDZQ27Mt/259CDZgYYDDyyWIEPLPIm
 J3o=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 19:39:24 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HXh0W4xLTz1RvlM
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 19:39:23 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634524763; x=1637116764; bh=sGvXZ7gbqwE2Gs2i+V
 2A5rZ4fDqWSNjQndpH3kVaf/Y=; b=Fg0qphSGptDzHGvSBRXbr4GbWmBpb1MaaY
 Jr9VaeD4Y1nbt74q6+bSxKi2BScfQOg7HwzM8OTnxQ8++apExGs/Yv90EQMYzUb4
 MAriChJZktnZRC5vUMpKnckK2FsbhZ54d4aIIjD/gcePYf4H5HnnZ5/40wzJ3XsG
 cbsN+eiVTRisLRL2Qe1LC5cxkhnp7/N/COGnlXEGSG990sJKzrS1l9qMoJF+lZCn
 r3cpklR3RByKwHxfUC0bxEbQ66ihk/c2MpImaLbO3F4hBMFqeIdpdaIvbqAEe8sY
 ND693+68yyDG5VdOCaAtOAmv18QCECEDcZ3JLMkuMIhLqJIgyNZQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id emQNn0BJSsRf for <qemu-devel@nongnu.org>;
 Sun, 17 Oct 2021 19:39:23 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HXh0Q2v2rz1RvlJ;
 Sun, 17 Oct 2021 19:39:17 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 3/9] hw/intc: sifive_plic: Move the properties
Date: Mon, 18 Oct 2021 12:39:11 +1000
Message-Id: <3c125e27c49a4969df82bf8b197535ccd1996939.1634524691.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <18b1b681b0f8dd2461e819d1217bf0b530812680.1634524691.git.alistair.francis@wdc.com>
References: <18b1b681b0f8dd2461e819d1217bf0b530812680.1634524691.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=918244500=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/sifive_plic.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
index 9ba36dc0b3..f0e2799efc 100644
--- a/hw/intc/sifive_plic.c
+++ b/hw/intc/sifive_plic.c
@@ -355,21 +355,6 @@ static const MemoryRegionOps sifive_plic_ops =3D {
     }
 };
=20
-static Property sifive_plic_properties[] =3D {
-    DEFINE_PROP_STRING("hart-config", SiFivePLICState, hart_config),
-    DEFINE_PROP_UINT32("hartid-base", SiFivePLICState, hartid_base, 0),
-    DEFINE_PROP_UINT32("num-sources", SiFivePLICState, num_sources, 0),
-    DEFINE_PROP_UINT32("num-priorities", SiFivePLICState, num_priorities=
, 0),
-    DEFINE_PROP_UINT32("priority-base", SiFivePLICState, priority_base, =
0),
-    DEFINE_PROP_UINT32("pending-base", SiFivePLICState, pending_base, 0)=
,
-    DEFINE_PROP_UINT32("enable-base", SiFivePLICState, enable_base, 0),
-    DEFINE_PROP_UINT32("enable-stride", SiFivePLICState, enable_stride, =
0),
-    DEFINE_PROP_UINT32("context-base", SiFivePLICState, context_base, 0)=
,
-    DEFINE_PROP_UINT32("context-stride", SiFivePLICState, context_stride=
, 0),
-    DEFINE_PROP_UINT32("aperture-size", SiFivePLICState, aperture_size, =
0),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 /*
  * parse PLIC hart/mode address offset config
  *
@@ -496,6 +481,21 @@ static const VMStateDescription vmstate_sifive_plic =
=3D {
         }
 };
=20
+static Property sifive_plic_properties[] =3D {
+    DEFINE_PROP_STRING("hart-config", SiFivePLICState, hart_config),
+    DEFINE_PROP_UINT32("hartid-base", SiFivePLICState, hartid_base, 0),
+    DEFINE_PROP_UINT32("num-sources", SiFivePLICState, num_sources, 0),
+    DEFINE_PROP_UINT32("num-priorities", SiFivePLICState, num_priorities=
, 0),
+    DEFINE_PROP_UINT32("priority-base", SiFivePLICState, priority_base, =
0),
+    DEFINE_PROP_UINT32("pending-base", SiFivePLICState, pending_base, 0)=
,
+    DEFINE_PROP_UINT32("enable-base", SiFivePLICState, enable_base, 0),
+    DEFINE_PROP_UINT32("enable-stride", SiFivePLICState, enable_stride, =
0),
+    DEFINE_PROP_UINT32("context-base", SiFivePLICState, context_base, 0)=
,
+    DEFINE_PROP_UINT32("context-stride", SiFivePLICState, context_stride=
, 0),
+    DEFINE_PROP_UINT32("aperture-size", SiFivePLICState, aperture_size, =
0),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 static void sifive_plic_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
--=20
2.31.1


