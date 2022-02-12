Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D36B14B31CD
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 01:16:03 +0100 (CET)
Received: from localhost ([::1]:51868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIg54-0002xl-U0
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 19:16:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfrK-0005mp-5c
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:01:50 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:7708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfrE-0000Db-QX
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:01:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644624106; x=1676160106;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XJeXutckRnVhH5Vy2OITVBmD5/mG6S1mFr2JvvP7Mqs=;
 b=AaEs8xqhrh6U9826ILk9e1aRfuf9rFWTialVeCz5ciFnCm40X0J8QZBG
 QzEGx2O6i+l3UaqijQx3TGRhSiLUedWiiovGaXmvgltJ4s8b0YbvaSIc6
 If70khQ/n4Xoh5xLXmZg6bjDm1LQybHkok9+Rh2jbGvpVjvOBqHPRdrzu
 UrIyBRE/6cyz6fEBmhvQnz52puN5AwnLI/iY1FeWSBHYja0W1E2CdfX7K
 rhWzeBSUkfxPzvDD/44v1jOOPMyHo/UJ5YkBl2f3TRIxrmbAodWRYS4Ua
 80qjGqBpES74EL77PB4QYQ9X6qG1VeBJDEUNQyGtYSi3xgkHiqZoMkykm g==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635177600"; d="scan'208";a="193710064"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2022 08:01:45 +0800
IronPort-SDR: mobQHu0Ki/amtIEIObpoPolkWpCANJ+exCz7j2oNbR3kJAUa4ol6ts3K5KSxAPo9DMncBM69MQ
 oNIpR5e43JSpQRGYArXsTTT8n5ML0pH/qkQmBkaJZ13uxNHlwXd/npBctTvduWjUkw4zHk5GHR
 uSv9X9Ja+OF8yhbiN1bGU9xK8OLkKiuBAYIHZ/zJwJsnOM8ldxE/pzK0TXofH/Evo/A3OCdNc5
 olf3kUE34sLMc4HOv7yqHtXFna8FNUBz6JGjno+yEHDFD2vapaD/JhoAetCGMKsKs8DtbGnavg
 IngaEuBC2dsrht03+A9Tche+
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 15:33:29 -0800
IronPort-SDR: s8dTJNwPgq9ymoOIn1C2QbhWvbR/kiT1wwImtp27DhH394JZOzDStNLXxjm16ZQqCU2mjDWxVO
 ed+2h45fkufNx5TB/q59N2eNAMZ708DlvaTOXFPBhSKTJo+gPmanMnsz6DvpLEgu/A+E8lRUyl
 gDixuNVgAZdzxUUzwOd20yEFHe4Q2eS/lP+5fbFP457UJEKDC5dGfabynH2t82qQNiX1coTLnK
 tpYyVqVxc+0qqZXhw8N5feq6h6Ypt2pysL7iCpJUvxJ+FCqkhqZqKLU+sz4CU8T3jtoVy8mnsC
 Ps4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 16:01:43 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JwVyb4CCnz1SVp0
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 16:01:43 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644624103; x=1647216104; bh=XJeXutckRnVhH5Vy2O
 ITVBmD5/mG6S1mFr2JvvP7Mqs=; b=IK2tS9NU4iGGLiMzY0g5kfzVo4J0ZKLLfy
 HFxqsYUj+zXUJEd2hcUBlLRlrO/vBSHunxYCQ/D6iEa7nhDBqWwK09pS6H4/3UYX
 iU3Ba3KCt6+cAcpU2yxT9QKs8zXr+OJH8zTBugYyCqz2Wf1wMg2Oyaseu9hDA7Jc
 Y9SGC35bMnimaVUgUG7qnF6aKGDdllgIetu7NWW3eH01T4lgzFPvhFBZnDZTxuQ5
 2SH7ttHr7z6ar2+Y9oaH59wbP5Klyt3lHwAuAujfI/bWD8AXkXciu2kKNz3WBtcH
 o7xckV/i3lJ4xkEGfoH71KHRcRfqUVRYOEWSFjD9HpGFbli9GyJA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id u_yZOCc6jqFk for <qemu-devel@nongnu.org>;
 Fri, 11 Feb 2022 16:01:43 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.96])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JwVyW19GJz1SVp1;
 Fri, 11 Feb 2022 16:01:38 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 10/40] target/riscv: add a MAINTAINERS entry for XVentanaCondOps
Date: Sat, 12 Feb 2022 10:00:01 +1000
Message-Id: <20220212000031.3946524-11-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
References: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=03511bb56=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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

From: Philipp Tomsich <philipp.tomsich@vrull.eu>

The XVentanaCondOps extension is supported by VRULL on behalf of the
Ventana Micro.  Add myself as a point-of-contact.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220202005249.3566542-8-philipp.tomsich@vrull.eu>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9814580975..c3f6e70a15 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -286,6 +286,13 @@ F: include/hw/riscv/
 F: linux-user/host/riscv32/
 F: linux-user/host/riscv64/
=20
+RISC-V XVentanaCondOps extension
+M: Philipp Tomsich <philipp.tomsich@vrull.eu>
+L: qemu-riscv@nongnu.org
+S: Supported
+F: target/riscv/XVentanaCondOps.decode
+F: target/riscv/insn_trans/trans_xventanacondops.c.inc
+
 RENESAS RX CPUs
 R: Yoshinori Sato <ysato@users.sourceforge.jp>
 S: Orphan
--=20
2.34.1


