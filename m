Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 866EF43F7DA
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 09:27:58 +0200 (CEST)
Received: from localhost ([::1]:54196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgMIv-0004Xq-LL
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 03:27:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=929275e61=alistair.francis@opensource.wdc.com>)
 id 1mgM7H-0006ms-8L
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:15:58 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:29575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=929275e61=alistair.francis@opensource.wdc.com>)
 id 1mgM7F-0001jw-1o
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:15:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635491753; x=1667027753;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7MDnK/8FcSTvs8XMDX1+mff0lWevalZQvp/ZJL03XgA=;
 b=lmOTSf3RsGfMhBkK6Zx2Qc82ZAUXZgEj3X/qOdwGDjHhHGt2iPrcsjHb
 xdXHHpwgb7S7tT2fqIyl68FxgBEcbDp5O93zLzYgdl50Sb8FqmObv2KdN
 HtojkaCKSZDk9NV1BP+X3BnDQqo7TlhdrZZi6hEE543nFHhiGUWhMD5r/
 0HvZwX9GH5/ByFmhukrIEO8+vva1z/wu30z4T+sANr3Kd3BpDlOz1vRTy
 ZOTg4u5Adjy8zCi323g0u7Ir4qFo6nQsMOefBl2VvU5e3fHKNqOo+bEqc
 1iAI1YIap6Ab3w109anLC36DE2a4dszTTj4iHceqte327U1kCPJHXZf20 A==;
X-IronPort-AV: E=Sophos;i="5.87,191,1631548800"; d="scan'208";a="288048100"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Oct 2021 15:15:51 +0800
IronPort-SDR: TL0XgVacb4bEPCsLRwymRWrKwbvMk51UJeI36chI07Lz3mPaBS4M3sJy+v/n53S2xUVNbbmzcT
 UgBVX3Rc6fbASpl60uV9hs1FNqFYaVOJhJGGphsQgkqjxoczsxENecKAjSk+fS59ycjrwMhIiT
 F2HfecoKclaHvqlPzG8zq3kTvYRLyCXkzP9/1MdoaFEzCHXVd/YM3/grEwdaQgX+BOFBaNH6aX
 DlD7uEZeHd/xVCfHUhxEDwOuIcwdLB+F3b3ocrJnGWoXSDL99aOlXcragpwPLOgjhSApPj8QGE
 Bh9sBBC96RswBo5QX1qxph08
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 23:49:44 -0700
IronPort-SDR: FO/MYgF7torg1NbgUJf0u+b/UXbXGzph/4GnjPDCxhBGGtS9NeeFKmi4rSrTFuonU7Zb80Cl1Z
 f01ornpEGEllCbse2l6qFVg9D1a4le7vG/COLgsEUEVivgOJ3daU1/NWQIgOSN3zQWSOtGgCY9
 GtieqloOml78vRYQ5Sk5Htf2A335MjgioOSQ4RhvyfghqF1r7WVCKI2oV9lBCQhcimIS/PUJyy
 PPldPPAgAPrxxI1KMR7evoPpzDTqxhMMcj4CcEodembOXokIWJMEzZ+VSK9xD53wypNlb/5kpd
 QDA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 00:15:52 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HgYcR01DSz1RtVt
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 00:15:51 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1635491750; x=1638083751; bh=7MDnK/8FcSTvs8XMDX
 1+mff0lWevalZQvp/ZJL03XgA=; b=VyljrgnnoipFXWArkR3pMw/GTv/4NsBbDr
 +Aqy0IVwjqBfDBDG+I7kf8n0IkM4WBKDTKyzHTc3ttonaVfKGogCN1C+58Vpbyfu
 euHqB/xEJzNOkcr3NAsPh53mpOsdd98fiaAdgtzqxFEJyEEdJ6BYrvzlz1fABMEy
 vyXsKh2XBqB+GpAxh/tOaaDpV38exliH2r4ETlPrBoEmQMkk2uebp57q8Ghm0+Mw
 eKlGGANV0Fqc8cpH/fX/JBDPU5X3KH6+GHoDW2rkfmw2lDvFaUsg8RcptnWuP/KL
 Ss41pW4XOmxzMH+cyqmV8DlCG6mpEU4ypw6/jxr7HUJFqAuGCIQg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id ZfOrws3f_FrD for <qemu-devel@nongnu.org>;
 Fri, 29 Oct 2021 00:15:50 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.42])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HgYcK5N5kz1RtVl;
 Fri, 29 Oct 2021 00:15:45 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alexey Baturo <baturo.alexey@gmail.com>,
 Alexey Baturo <space.monkey.delivers@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL v2 14/18] target/riscv: Allow experimental J-ext to be turned on
Date: Fri, 29 Oct 2021 17:08:13 +1000
Message-Id: <20211029070817.100529-15-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211029070817.100529-1-alistair.francis@opensource.wdc.com>
References: <20211029070817.100529-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=929275e61=alistair.francis@opensource.wdc.com;
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

From: Alexey Baturo <baturo.alexey@gmail.com>

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20211025173609.2724490-9-space.monkey.delivers@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 16fac64806..7d53125dbc 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -562,6 +562,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error=
 **errp)
             }
             set_vext_version(env, vext_version);
         }
+        if (cpu->cfg.ext_j) {
+            ext |=3D RVJ;
+        }
=20
         set_misa(env, env->misa_mxl, ext);
     }
@@ -637,6 +640,7 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("x-zbc", RISCVCPU, cfg.ext_zbc, false),
     DEFINE_PROP_BOOL("x-zbs", RISCVCPU, cfg.ext_zbs, false),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
+    DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
     DEFINE_PROP_UINT16("vlen", RISCVCPU, cfg.vlen, 128),
--=20
2.31.1


