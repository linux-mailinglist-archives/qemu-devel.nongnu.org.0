Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E805750AD07
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 03:03:07 +0200 (CEST)
Received: from localhost ([::1]:47152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhhhT-0003qx-1a
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 21:03:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhK5-0000Js-3b
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:38:57 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:17628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhK3-0005W4-B5
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:38:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650587935; x=1682123935;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z0Ulg+24zPCwJIxJpTUer4xH4+Yiy2Eg0AQK/CqThWc=;
 b=OkaCZnb4PvRKs22psSQ5RY1ulKMC2y+2P1ZTYkur+z0dqPb+sCfluf1D
 sjl2XAmvTvUUaVekq2GThufodRDqF8oHaJh9AGuEk759pDYDd1AXMpy2y
 WrUmFScJU0GXvj/kAv0G2C5VX6OWHwr8UaR2Se8C+aUmPPpfN018V57Ce
 fmsiLjNSM5IfL1soQuSZYB7Nf/hwhveA8ajn9n98iCfNbGs9zV75WU4ri
 RqEKHRB4DCoM0pVYbQ+NGK8N1svJWQTSTwnzsVOVvpIgpYKG3etmLloGJ
 JmnERBO4RwwCwwvBpDufM4z6pQeAB23roi5ge5w/1l7i4rW4/WyxNhgV+ A==;
X-IronPort-AV: E=Sophos;i="5.90,280,1643644800"; d="scan'208";a="310483449"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Apr 2022 08:38:35 +0800
IronPort-SDR: nvO/EHVsZ9T4FASCq9e5xGfhtcYMAidogQlDs8P5IT6wosJBsubJ7a80DUmHC9EWlach+TrrMB
 CrKSKAe1k3iTiDbOOSgrDAxypzVXDK8rSR1mNwEBwxXNFIP4PwF8rySYj29nBUg4F7ECiEv0NT
 Jss7jFxoMAe7eBX0+/fjED4YpHu5w7LaarLf/N9qIMTVMqDbMdb+SwTTEQh8GCmMmJwHXPyNWS
 6/HqxR7aZ6P8l2bW6s85nNElW/QgbVnqC2dEEDnuTJiUdnvuFpzNo7iGvDsbjtb2rLn1hZ3czq
 BJdUwNjXrEiauCjO0CFCcqwF
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:08:52 -0700
IronPort-SDR: 7RivIEWYY4hYUoCq8NujIJ5Il68OFgEXEViGU3lEXRD76g4H09oTZcvL6fSg8EjGQphIYH7bH0
 HDwtX/rnMAG7nyaT2k7yMst8sIhPLxqnc0ElM1m/GMXW7G0y1jgpIN1a6f1Fl0zXyMgN6LY2Lu
 YBg6qyjGk7TCj8er08ZSLyFDvbF47wMiqY4FxhrFuF+fuye36o32QGlhcZKdfBgK60VxCu1CQM
 xcp9CFJ/9wjGQnxIdZ1Tr7zJmZRXVc9WP1VCJuce/Qay5OLx1ft9TMHpOSzEaNIGUFA0Fboj8P
 vMM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:38:35 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkwWH1W7cz1SVnx
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 17:38:35 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650587914; x=1653179915; bh=z0Ulg+24zPCwJIxJpT
 Uer4xH4+Yiy2Eg0AQK/CqThWc=; b=G1AT473Ee+XKhFfJV2zivqzwDWsuhEpwoS
 i90z+Mj+LT77Hjj72Acj4sOzSj+qqJCRFzxlBSoguVc+Vd6fBOCjo26q23Zru1Ts
 Gk5B/HTy7Zq8T/Llzba6IrbUK90wyZ3qv7oZeijLsQzPl4LElLEcpLtM1hN+FLTi
 d7UJ/tRUs86+uSlB5rxUm2elguaYdUxFf0Yd34pyQQ4wSaVOrH51lpkwFqSZ1nGF
 oTqi9o2I1wyfPehGcPqKTEIhTAhZj8kFxzdZF8iRN29xlALwKzk7GAybkaPRdB0S
 9IEbs70GaTEQvAVy2urpyeRZLfJYonSBnRgDvy/PmOh7E+58EPzw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id BLS6g6j5P9Zt for <qemu-devel@nongnu.org>;
 Thu, 21 Apr 2022 17:38:34 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.120])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkwWD5Wdsz1Rvlx;
 Thu, 21 Apr 2022 17:38:32 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 26/31] target/riscv: cpu: Add a config option for native
 debug
Date: Fri, 22 Apr 2022 10:36:51 +1000
Message-Id: <20220422003656.1648121-27-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
References: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=1041ecfe3=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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

From: Bin Meng <bin.meng@windriver.com>

Add a config option to enable support for native M-mode debug.
This is disabled by default and can be enabled with 'debug=3Dtrue'.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220421003324.1134983-3-bmeng.cn@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 4 +++-
 target/riscv/cpu.c | 5 +++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5d1259d4ae..34c22d5d3b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -79,7 +79,8 @@ enum {
     RISCV_FEATURE_PMP,
     RISCV_FEATURE_EPMP,
     RISCV_FEATURE_MISA,
-    RISCV_FEATURE_AIA
+    RISCV_FEATURE_AIA,
+    RISCV_FEATURE_DEBUG
 };
=20
 /* Privileged specification version */
@@ -405,6 +406,7 @@ struct RISCVCPUConfig {
     bool pmp;
     bool epmp;
     bool aia;
+    bool debug;
     uint64_t resetvec;
 };
=20
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 8919928f4f..477961b619 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -548,6 +548,10 @@ static void riscv_cpu_realize(DeviceState *dev, Erro=
r **errp)
         riscv_set_feature(env, RISCV_FEATURE_AIA);
     }
=20
+    if (cpu->cfg.debug) {
+        riscv_set_feature(env, RISCV_FEATURE_DEBUG);
+    }
+
     set_resetvec(env, cpu->cfg.resetvec);
=20
     /* Validate that MISA_MXL is set properly. */
@@ -795,6 +799,7 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
+    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, false),
=20
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
--=20
2.35.1


