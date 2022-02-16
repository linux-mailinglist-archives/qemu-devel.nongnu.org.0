Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D03854B82F7
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 09:33:50 +0100 (CET)
Received: from localhost ([::1]:46288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKFkz-0004Wb-LB
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 03:33:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDqm-0007H7-7C
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:31:40 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:61797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDqk-0006rz-Dp
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:31:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644993098; x=1676529098;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5vRYbIbePo4KYXoM1wvOSBCxKj+8Dktw8/euqWyCoA0=;
 b=Ir7itmKY4594hpzytEFtIAvrGDB/1dRMQzsq4FmKQKKgyOxg7IOAKOYI
 gRHlC8Msrvbc1xsd1keUaRJM4u9xhY0oVVUSh/hTIJalhZdbkGn5+E7Kj
 PURjZ9eL3X0zWSv8UVc7rZ99H8Mtd8svqkYN4l0HJbC7O+okcJiz/wzf+
 S+ppH4P72L0M2bKkzZtsz/CpabDv9wmYndEtGyQWOpzZ+QM99B9R0bd4e
 lBl3xuDEALBSqMxWhg0RJdiEPPhbJtpNlQG+mCoObjCrYfpgpfBh83tQv
 Nxb8Aidh1kU1WloIzbbweDmuRWR6ePYIGr5Tswk5n4v1UcvflYXn7+FYG w==;
X-IronPort-AV: E=Sophos;i="5.88,373,1635177600"; d="scan'208";a="297181863"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Feb 2022 14:31:32 +0800
IronPort-SDR: q9d7pNnZX+E77vSmrzfNXByIjTT30J00enmlh/7H7bxUAtw0cdGtoVL8By6rjvehlNyXw6JsyO
 Ha/UrRoxAcBrsS7YuvadYVR1L3OQJWnXfKj+zZ0owXLSDN41a0qeOfyMVRUsJhl6mkEiZvqonI
 faojrIEWonnkM/oGv0MxJ8ZtbMuRYXBbL7iTixYVW7lRGYfziO1qjKuGs34bkCOAeF6Y6rJJlE
 Jty8y8fEm9sg0/rwMfDxvM3whi58sKEQxLm8DPfHfVGwNUUoYmyUj2bKZg2aYO8cyYfLdi51K/
 N7XrubPTmQZRHgSnC4OHfLfH
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:04:20 -0800
IronPort-SDR: uMATEU3eEHUQWx9hNNO3NGMip4HNwGImM5BcpKqUgPX/6ksDAf5HIAtyoEzFbsTCgzzl9wzIij
 DHqUnfgwcw53db9Lq42Q54pLxzGdc7+0iiyEq+qFwCLeQCwZBzWXIKhziIxqo7pRNb/zUGQpsS
 MZCtE+mpN7u94Y7Qn7SH2tT+he7ybwk5nSMcGYTqS4xXBHAdsqwph738LgEdK3lTVOsVml94WH
 YG2OoNd4tbf8X5yg7BqDjQSuQt4Y+NjitYUxVUgFb66xtrzSZtM8YrAfmeplrUWdVoiTHURc81
 aU4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:31:33 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jz7QX3BX1z1SVp0
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:31:32 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644993092; x=1647585093; bh=5vRYbIbePo4KYXoM1w
 vOSBCxKj+8Dktw8/euqWyCoA0=; b=XuQtDWv8tX2iOcxCuDvpdS7Tkt61KhmJc7
 ttUSQAaKMIdyWC93rJdmV43jLCJjs1Zbnwz1ccyYSuhAnTyyXxCXrAd1GCgKUVDN
 eMfbjYue6zBdM/glk8sTfdYxm0PQ3UB8nEHK/psKM4oefxZ/yAoGFVxM7WWvGJAE
 xZC+w+giLIx10LWkRsLgWtjU3QjlHWsvK00JK3/25QDrVOsSdYR/NJSxzoY/6XpS
 3HD5p4jVhme0kaAa0zZOPHeQeYij9OXLgKde/9U97rSqyDaO9bY8TjwUzcTaRiaF
 6fV4coEn7X6j4jTD11XpyY+EcsfUt1tHCMCu4fBNLgj0VF7GvH2Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id LeHf3IYgQqxd for <qemu-devel@nongnu.org>;
 Tue, 15 Feb 2022 22:31:32 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.97])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jz7QR6sj1z1Rwrw;
 Tue, 15 Feb 2022 22:31:27 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PULL v2 28/35] target/riscv: Allow users to force enable AIA CSRs in
 HART
Date: Wed, 16 Feb 2022 16:29:05 +1000
Message-Id: <20220216062912.319738-29-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
References: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=039576d22=alistair.francis@opensource.wdc.com;
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

From: Anup Patel <anup.patel@wdc.com>

We add "x-aia" command-line option for RISC-V HART using which
allows users to force enable CPU AIA CSRs without changing the
interrupt controller available in RISC-V machine.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Message-id: 20220204174700.534953-18-anup@brainfault.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 1 +
 target/riscv/cpu.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index c70de10c85..7ecb1387dd 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -376,6 +376,7 @@ struct RISCVCPUConfig {
     bool mmu;
     bool pmp;
     bool epmp;
+    bool aia;
     uint64_t resetvec;
 };
=20
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5fb0a61036..9dce57a380 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -537,6 +537,10 @@ static void riscv_cpu_realize(DeviceState *dev, Erro=
r **errp)
         }
     }
=20
+    if (cpu->cfg.aia) {
+        riscv_set_feature(env, RISCV_FEATURE_AIA);
+    }
+
     set_resetvec(env, cpu->cfg.resetvec);
=20
     /* Validate that MISA_MXL is set properly. */
@@ -782,6 +786,7 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
+    DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
=20
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVE=
C),
     DEFINE_PROP_END_OF_LIST(),
--=20
2.34.1


