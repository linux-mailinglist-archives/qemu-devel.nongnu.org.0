Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C4A5333B6
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 00:55:54 +0200 (CEST)
Received: from localhost ([::1]:60984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntdRQ-0005yB-T0
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 18:55:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdHJ-00088i-8U
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:45:25 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:62474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdHH-0002Yx-Eu
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:45:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653432323; x=1684968323;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N5cF/dKhhyij4qdfnlOlBNkdhxs3pRkkLV8LA+excZE=;
 b=mIyt1hnQIZ/889ByUltNkajDQkTnZ8ICKFmfUS2gjSLrjZ5vpLWgKDfY
 C8ZlobmzVr5ey/TK3peyxlQoWNmgAF5ABfZuK49Ke9BLhxmaPuqtIyqfD
 2c5aNlZdF1VsGSy2mSfQ7ywYz+mmpsFf8aseY1S7I56+zE9OxeKQwuL6y
 FMLiDInQuam0vKm3kyb+i/NBJzoNZa4nY30OmEplVPhMAwIOwgrv7C3Z7
 oCBvQQw/xtFq2GxyIwBwqvKkETs2hFrQfsQi6KNL6FmwfYQzvor/aJZIp
 x2RiPPUs1CPOwz1Zmf99uYeAarn+hpRAEfHwCFGU0svq1duyjvFxU4KcL w==;
X-IronPort-AV: E=Sophos;i="5.91,250,1647273600"; d="scan'208";a="305566685"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 25 May 2022 06:45:12 +0800
IronPort-SDR: 265SSAN8H8pU0OCE+sOZF3OPBtckMj7TXveYMRUqarBzbRtX1ypx/SPu/QJ5s1Y//ijr17JOEJ
 J471kSzk4IFQO954NHpb4kEZictidfJk3WAhRzOCFIgUxPKlueRIz62vjdX7gu8T1mRsviPzBB
 wzrhIWP51MlXNb/kznh8G3eTaa6JeF8V5gmFAAsHLHZYnj8qB241qz94M3J3/zxaLc8ziFlntd
 V/aKy7QbIDhva/PV3vwbnALwYlnOMIwhBYalyaVJvuWGk4vv7U3N1Kp6+ohEyaPi1cal5rqUud
 yjV79kz8MbFz8otxrr3y61ij
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:04:44 -0700
IronPort-SDR: 6M/yJFvBV4WMbbv8JxXvLMpqG0dbQgf9a0tqdd37ecvjikD/30qpeJiLtA1Wb/WU8DsyFed4ne
 xgO07PdBhEB0lvb3W0f80UZWCZsCXBubGGwT+6cnVaZIJcd7MxoEIv29FZHW0FEC11k/00tCbQ
 FzPS8uGXrVLkcO7qvL8P+vObNzg0zSd12i9DYEnJnXl9X1gJnzcZqkOJWi3rLmvXxH4K0m7/MK
 9AuKVYpdbNFwPN2Tr3q+XcXUivd1ncUtCq4XmJRkWHIkcRhE2V5ah1uxM9PXMGfP8Vvz1FRDlm
 p/s=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:45:13 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4L78RD3cx2z1SVp1
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 15:45:12 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1653432312; x=1656024313; bh=N5cF/dK
 hhyij4qdfnlOlBNkdhxs3pRkkLV8LA+excZE=; b=YzmTf6q+ORRpYyJEG9jzfjn
 aQXu0GXVi80ylPF4a4Q28mmRu/ldjPx1DqU5lr9sttenfNDooSMSVMGEiZXTNyLZ
 eO9zHArLT9Wt1hIOvp2nPFDXDabtUKYZUXoopGqPIMDiUAMtsd92x4iHN5yrwTIs
 IBykVbo2zZMBrJ9CfvXj3RfIPnaj4t1lNbUrA3dHlAdVahgTDsM3cjbBcMXSw8AT
 0E0ou4Aaf5vBlClxkxF29+yTvqHH9PdNFgKqrORsmI7Etu7fMF8W+GHONj0aPzmv
 GdQQ6XYHmKdlZ5aYsE0cwL9RlsKdjy5irjBqg2ExmQTKWWJQE+i4zmQ//kzMJYg=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id a4mt1z2Cksza for <qemu-devel@nongnu.org>;
 Tue, 24 May 2022 15:45:12 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.5])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4L78R96mh8z1Rvlc;
 Tue, 24 May 2022 15:45:09 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 14/23] hw/riscv/sifive_u: Resolve redundant property accessors
Date: Wed, 25 May 2022 08:44:19 +1000
Message-Id: <20220524224428.552334-15-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
References: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Bernhard Beschow <shentey@gmail.com>

The QOM API already provides accessors for uint32 values, so reuse them.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220301225220.239065-3-shentey@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/sifive_u.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index a2495b5ae7..e4c814a3ea 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -713,36 +713,20 @@ static void sifive_u_machine_set_start_in_flash(Obj=
ect *obj, bool value, Error *
     s->start_in_flash =3D value;
 }
=20
-static void sifive_u_machine_get_uint32_prop(Object *obj, Visitor *v,
-                                             const char *name, void *opa=
que,
-                                             Error **errp)
-{
-    visit_type_uint32(v, name, (uint32_t *)opaque, errp);
-}
-
-static void sifive_u_machine_set_uint32_prop(Object *obj, Visitor *v,
-                                             const char *name, void *opa=
que,
-                                             Error **errp)
-{
-    visit_type_uint32(v, name, (uint32_t *)opaque, errp);
-}
-
 static void sifive_u_machine_instance_init(Object *obj)
 {
     SiFiveUState *s =3D RISCV_U_MACHINE(obj);
=20
     s->start_in_flash =3D false;
     s->msel =3D 0;
-    object_property_add(obj, "msel", "uint32",
-                        sifive_u_machine_get_uint32_prop,
-                        sifive_u_machine_set_uint32_prop, NULL, &s->msel=
);
+    object_property_add_uint32_ptr(obj, "msel", &s->msel,
+                                   OBJ_PROP_FLAG_READWRITE);
     object_property_set_description(obj, "msel",
                                     "Mode Select (MSEL[3:0]) pin state")=
;
=20
     s->serial =3D OTP_SERIAL;
-    object_property_add(obj, "serial", "uint32",
-                        sifive_u_machine_get_uint32_prop,
-                        sifive_u_machine_set_uint32_prop, NULL, &s->seri=
al);
+    object_property_add_uint32_ptr(obj, "serial", &s->serial,
+                                   OBJ_PROP_FLAG_READWRITE);
     object_property_set_description(obj, "serial", "Board serial number"=
);
 }
=20
--=20
2.35.3


