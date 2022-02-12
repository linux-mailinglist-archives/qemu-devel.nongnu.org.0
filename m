Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8461A4B322D
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 01:44:52 +0100 (CET)
Received: from localhost ([::1]:38800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIgWx-0007aw-Kr
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 19:44:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfsj-0008BR-CD
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:03:18 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:54871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfsh-0000RP-DF
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:03:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644624194; x=1676160194;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5vRYbIbePo4KYXoM1wvOSBCxKj+8Dktw8/euqWyCoA0=;
 b=n61Y+Dn92dMt8WMlWWpkiSp1N2kOCsVGJ5ueq+9BkbflquIlqeRksMb+
 jeC283pLVsBKRuB3u0p8zGILQQ/2UtgdqNEtlMOK9LHo02/0O3H9PHw3L
 7UCvVkdjBIYZquyvwqSXeECg+3SK/eR3S0I3Y1/3Wq9reFJTLveYFSB4H
 0h546YIgpK3NWUBxx0XBFV60U+DYWkdzS5Uq2CWLkFS7P9S9kULdTLv4A
 EK2FtVD6xd6AcFf3RXAowK4y4QymC9J9x9Onxh3RKxSJ5ZEnp61DxXDrb
 HaH6JO5cn0BssBmL6azxlEwIBhWfubJYWiydWd2euq6ewcWPYuLoL3cHK Q==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635177600"; d="scan'208";a="197552534"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2022 08:03:12 +0800
IronPort-SDR: A6fHWK2SJgZ4Mzpn2hA3ict6CjBXx0MYV3iYiLsUG2L8ibg7tfrEToE4mFw9LIdbUYnp06FYn8
 dGdyifJcND/w7bLSsyIGDP9qn8iC5ufh5oQM88DD4TYu69v0zXZF6UUTbd+5AWOBp7c1/vMg3b
 SHzoW+6I77eKHdbspcJ+wdmCKnkMtVK83PpghAe89jbzeOGhbLTQIJnTjDQMDf/lCeXYCxb/Aj
 Q5tuMdgRUoJmtmnNIrtAp7iDW3zJa1Lg339MrEAIbNq1vLxE6szzh5PzlDfjwux8sUTsJXcPUw
 anmS/QA8iYVO3nJpS3OOXyja
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 15:34:59 -0800
IronPort-SDR: ldNWgrtKNNCK4hZ7AOHxexqouX054bOLij3aMBTaNPgKCqrkyd/0RRtlatygPjUHVh5BTcbbW6
 9uDaxe6DLLnBIBsezQJb3386UaOOm7hopwKwidMbUCHbGeS1msQKBOhtWLVLnvSzxLkcBJ5S+I
 n9yjZNeOmPXoC+fI11Gxc8CaBH1FnBh8k7uMoOMEmUKRyd0TeDQoVdoJkQ4Fl0+b69EgFU2Ma2
 eLcjnMmxPRQfwFVsy5kmF2JlorSBDMNTJvpD390TAQtuwNSGV+3NO7JI+v6/JbV9xOQ5oGOoO6
 iWM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 16:03:14 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JwW0K5wxHz1SVp1
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 16:03:13 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644624193; x=1647216194; bh=5vRYbIbePo4KYXoM1w
 vOSBCxKj+8Dktw8/euqWyCoA0=; b=PZvwtd9nfGPObkfA2Vrox/NVIvosYuox0i
 CduUZHvI/QXOffT5pfs+nWaLozuW9BScLzwnqD8P/tRum2dH1pJ2LzRc1oaU9fFJ
 nML4VwKO1EOvhLcEncxjBO60XnG92Y+qMOwnXzcLvM1WlbnQEvEuBXm53ohVCCq7
 hMji9qehcjBeTN7a2Lwh2UTx9ynv1NGlR2O/yhbwzXwDUd11QZ6Tc9CbfqeFlQ3U
 S1K2NlYsjqRIKf75Nqf5GRhjG9GL2YoSXjQDQ6AGanBXErNgDZbHkRQKRGYFg03b
 L8MRlT3TeGwxa3WErBvfDkQsgb6vAqofSz8CNlPRNaUnT361Km1w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id C2Lof_4tXnVW for <qemu-devel@nongnu.org>;
 Fri, 11 Feb 2022 16:03:13 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.96])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JwW0F2Hzmz1Rwrw;
 Fri, 11 Feb 2022 16:03:08 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PULL 28/40] target/riscv: Allow users to force enable AIA CSRs in
 HART
Date: Sat, 12 Feb 2022 10:00:19 +1000
Message-Id: <20220212000031.3946524-29-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
References: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=03511bb56=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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


