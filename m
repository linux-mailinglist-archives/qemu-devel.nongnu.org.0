Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB864881D8
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 07:24:37 +0100 (CET)
Received: from localhost ([::1]:41296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n659Z-0007Oe-1g
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 01:24:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64dm-0007uA-Mn
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:51:46 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:24134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64dg-0006jE-8l
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:51:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641621100; x=1673157100;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ov5z5cRqAyoneYRDReqXwvkXhNKBUFb2MR3YdD0bYCk=;
 b=SUi/cBnjzP5kSdeU9GzFoZq/gCdC6GoGdu4LDNpFfrOhDLEM5iohJtjJ
 40A2plFsDgiuOweaxGJblNuq1e0NCCmiwzPSgDTpzq3xgE4voFw+FnkPf
 DRbyGccqKWnzVOhPrzOAl46s/KTSVYaYGsTPr0cYyIsaGajqq9csoOxv0
 smLUMJvtTaBTTNd5QEcdlBh82VhMGF/H0Hhf3Pu8p2I/CzbanW0kU0y1j
 hkl/oaxnZBsePN65Or6QL0D0iXeMA6bNzE6nhj0HKOZeAB6W9nVaUfs/M
 pE7IOag1MLbnMflGp6CpMi8Q0maDuP/8ze7/b3dXBp5uysxvYGxGEdsfx A==;
X-IronPort-AV: E=Sophos;i="5.88,272,1635177600"; d="scan'208";a="294027347"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2022 13:51:39 +0800
IronPort-SDR: +REbyqomZHFj3XusqkHaeNZP/cYDjHpmW4z6x/4ud4acKh+xJ36uGk3e/BA5cWr6S7zzR1D4mF
 LZLpW2PUTwpLLsx+F9IcgWahWK+HC0fij8E81ZLp3OsyjdvKewZPZbNVxWbl5OiDu/QHv/FGbl
 aPffFngiG5p5KJFx18Cnm0xeqpfiEFrpB6ZBlHv+E1VclMSOpikh3nPfs7TzdE/A4bF6dRyQ2Q
 tjQQKxcf8plKHbjOM01QTeit7KMZQV23ZbXDCfHMo9yPokqODHzEV3uPyZbMIB3td3CW1oSqJV
 4pgSgUv9sshqCqZ6gvvjmk9s
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:25:27 -0800
IronPort-SDR: teAGjmgjn8QaT30p2v1mMeYcLttHPXjWarM3ZG1xgR4P+IJCAOxDL8eY+BeaG4GEmXohJWaMbM
 YZ4PL9jQOW+Bh8AGKPVyEUS2u5z1z1GRQCjlIG1GPsZPfDy2Z7l6wBBJCJZn4i2kaVZlZbVMvL
 ohp1nx1/8AXWHUysc3k/XWln3dhdKaF3VlCk/i365JJdssSLatfDWu+mOmGnoKrrlHMM7bE7wU
 4OCwSp5E12IX07MWIaviiOlzRtIr1SV9NIJRKL7uDRSjig5wkONvoyk0DMSV0YKpczlvbdY+jN
 13A=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:51:40 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JW8NW1Q0Wz1VSkZ
 for <qemu-devel@nongnu.org>; Fri,  7 Jan 2022 21:51:39 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1641621098; x=1644213099; bh=ov5z5cRqAyoneYRDRe
 qXwvkXhNKBUFb2MR3YdD0bYCk=; b=Q5J3y/uMNEbjh+zVeVYXuS/kUNsGwrFaLQ
 RS3NVM+oIvG5r8JYIO86wShBoHpzI7/1J8M65rsugOZM+Mw7P3w/JuJn1Xig4e5f
 qatwWXKoGufvWtNw4HiHTQBW9mlB90QWEReIQe62M2zRP+k7YtCv4bOM9bFPbRN3
 NSahuM/byjVihAHUNLiY8xIcy98khvD59KXMfDXdqzb/mnrqKd2SjWWB5gWCYuSP
 gArLo3nfkQNwO/UR9X7AI0a/viv0pDJyceWjn7CseqxG7IFa4RBNzYq0oh6W4IXE
 +/aqlbxmDfBWX7Mew8QQ0cIpR2qik/x5g74+tebSzHG2BhANocRw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id NARFh4LuARlL for <qemu-devel@nongnu.org>;
 Fri,  7 Jan 2022 21:51:38 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.74])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JW8NR4F16z1VSkV;
 Fri,  7 Jan 2022 21:51:35 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <anup.patel@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 08/37] target/riscv: Mark the Hypervisor extension as non
 experimental
Date: Sat,  8 Jan 2022 15:50:19 +1000
Message-Id: <20220108055048.3512645-9-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
References: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=000118587=alistair.francis@opensource.wdc.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alistair Francis <alistair.francis@wdc.com>

The Hypervisor spec is now frozen, so remove the experimental tag.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20220105213937.1113508-6-alistair.francis@opensource.wdc.com=
>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6ef3314bce..9ea67bedd3 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -627,6 +627,7 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
+    DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
@@ -645,7 +646,6 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
     DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
     DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
-    DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     /* ePMP 0.9.3 */
     DEFINE_PROP_BOOL("x-epmp", RISCVCPU, cfg.epmp, false),
--=20
2.31.1


