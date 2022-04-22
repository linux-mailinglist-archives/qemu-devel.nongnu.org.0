Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D47C50AD24
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 03:16:27 +0200 (CEST)
Received: from localhost ([::1]:41962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhhuM-0004eS-Mw
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 21:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhKL-0000og-V8
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:39:14 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:17628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhKJ-0005W4-7t
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:39:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650587951; x=1682123951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AC2dXbVlpogSRQbvLzTUXk+TjhjSi6pCJLR3L19S/+0=;
 b=ViMa9xGtlS9YsxSYJCWvTcGe7DGlON303lNBPnNWNg1WDUoOYNBUy17n
 vJDAoBYUmDCzBHKD3K3EknsHSxuHsY5FasyQjHlhqIZsTCvBVXexb1OLx
 PWZqBs13EVA+qPtudeoH8MT5JgcK6gxWabQuRonSm0v6hG0ztU8dZ1jkd
 uP8rDdSkafJJzNb6r6X/jgnaReIaAdtyFlPt+yE2sRIdYWXmmE6dl8LJ2
 gKoRmawxHGgDdQXA4d+oS+jUuDoeMTlo0tgGpWdRNCNP2EYpbBJmZTuC7
 427M9IVs4ZsmSEdP08XXyonVW0yZ83zvgwzhGEH4xWv73iTauDmybDw90 g==;
X-IronPort-AV: E=Sophos;i="5.90,280,1643644800"; d="scan'208";a="310483454"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Apr 2022 08:38:43 +0800
IronPort-SDR: 56q1hEM8otc2bge2sW8F8xE6DUI/moH14EPGl/TY4a3Le8S8enAhAbLB6pX4jZD/+p7BkFfNW5
 c4OVRVTrtMtptJ5GOAU7zMRLWu98eUOOxwN43WFCKzKliS8UMy5vqX8/IMP9vg1H6a0ChxLidM
 8RjLux1WdSuAxBKG/R1Cg0pqfAdr72e+quKzvZdc7VoVBdsNKBXZYRVK7lz92wyq9y4uWBrpX6
 CUPmpOIBmxtfDJdIAYCP6hv/PuUG72GZf77wP+iIvs7Ze6AjvC9mP8fBXbkVnBRTZMDiwW8Yhi
 P64YjkjkKv9mrptOLXL3RvSg
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:09:00 -0700
IronPort-SDR: 4yyxdhkGcH3vdUZ3MkV9KejmA8M+e8IB0x4GRDF8g4+gb9R0zhQrvN+w2WeqU/lplHV2F1uvxB
 GBfxwT2XA14tKPKowAex9qpPe9muHcyaTGwCElpVE802uWFJVijR4GtHcPRrJEFMdlgUkT5JVh
 6TPPOTGQwwFBCVxG1K9PO03bI0VO3h0e21LR3Q2NDE6mvc9M0LErXaN6azfzBIv6yMbLwWKet5
 TOMrzWkGjRAIs3d+Qli2rlWatCwenQlxwRJmFx+BQU0/F3DiUARGBSUJWYHWXfEFZRCpRKRBPZ
 iPg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:38:44 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkwWR3M8Cz1SVnx
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 17:38:43 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650587923; x=1653179924; bh=AC2dXbVlpogSRQbvLz
 TUXk+TjhjSi6pCJLR3L19S/+0=; b=Fb3CvpmRONpj00smCwt0yAvfnM0BsUT467
 Cf7tSPljmtEsr92JBfS7aU7o6RZaAFcWgM2hAxbKVcO001U642OX6KsosH7X1ORJ
 E5/2S4oxKrqQ2L9rSQtWFA8WVgD3JHoYi7b1uCPagp49Rxz4+GbbBvS3L7GEcQDe
 Y/6nQoYVwCw71joxWPQjb7v3MCgH8FgdKwWeKHJMhworXB2OZIdjDtu3U+7WgFrG
 LQQZN2SLkx0LC484oV8tKy+DN4WFYLFiftJzQI4KbfUl3dPRlWa7ph2bJcge4gr5
 nnBf4PmM77DjmtN3bKoJjitUMqygZkcQnoVDrFg1cg5iw29yCLrw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id jJqgIMmze6jD for <qemu-devel@nongnu.org>;
 Thu, 21 Apr 2022 17:38:43 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.120])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkwWP0ZQnz1Rvlx;
 Thu, 21 Apr 2022 17:38:40 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 29/31] target/riscv: cpu: Enable native debug feature
Date: Fri, 22 Apr 2022 10:36:54 +1000
Message-Id: <20220422003656.1648121-30-alistair.francis@opensource.wdc.com>
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

Turn on native debug feature by default for all CPUs.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220421003324.1134983-6-bmeng.cn@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 85656cdcc3..0c774056c5 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -803,7 +803,7 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("Zve64f", RISCVCPU, cfg.ext_zve64f, false),
     DEFINE_PROP_BOOL("mmu", RISCVCPU, cfg.mmu, true),
     DEFINE_PROP_BOOL("pmp", RISCVCPU, cfg.pmp, true),
-    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, false),
+    DEFINE_PROP_BOOL("debug", RISCVCPU, cfg.debug, true),
=20
     DEFINE_PROP_STRING("priv_spec", RISCVCPU, cfg.priv_spec),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
--=20
2.35.1


