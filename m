Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED46B47A4F3
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 07:22:23 +0100 (CET)
Received: from localhost ([::1]:59814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzC3z-0007xe-1t
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 01:22:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzApG-0004hK-AY
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:03:06 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:51799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzApE-0000Me-C3
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:03:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976584; x=1671512584;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MlOc7gzzEoH+mrkpfuwF80CqkYllueLnrvRzSKegruQ=;
 b=Y8AdrPV2rlBjseXGeaCekNKihA/PZMEBj34BOb4BYt+zulvh4GYMpg2v
 NfOX7vppxp26qjnEix72L1bwHfXQU/JGaOneX0V9STehOgQ3Tj72Ao9Ex
 Xou6SZcYmLFyZ2E1JNz+K8S73fKclRxN2WC7fmDIL8K0dgmEyrj1Rvvn6
 +DpvwoDATdCF2D+wZ68XrJWmeEIs3P2h7STV7LpqTSmxLg28vITGp9aUH
 RM4bwE6QphgZl5zNdBIm65KquMwEAUDCC1Uv5qJnTI1ravAESSDJfO0+W
 r0zWkPyfroG+EGDX5uudYQdN29BrqshoBwJsbiaY80cky3dWMkX2kU4s+ A==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="292662380"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:03:03 +0800
IronPort-SDR: vxoxcl5gjPHd1de/aRgvzNcilI2LjTOtdSwZFmMwFnJv/kZdOePb8ShgnmMZRbNfBbJD20FUXZ
 b0y4hYvGxf1oBVwrs46Z0c3Ivpu9gq4wlevi02agkmfsU7zXB/8ZnQ5rLVHL8oHhDGmwymAj/3
 vzRXnM6XrFCkjx/P+K9psC3NYM1Xvt26MAvM8U77Y0OqOwGq+osuduQDUCPk6NFYAhzXIZXviY
 5Yw6IZvwOFTyrAZyfZ225KhbMHGaiLi55JMt0jjI8hb/H/PzrdHh9MqFpUw9smW1Uux/easeYn
 7+7p7vrQyhWmKSG0cPdyIkqE
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:35:53 -0800
IronPort-SDR: r3XLU32mvU/F4sCEOjnGKTt60UxV5c7uy88wH9Riz2BZtO4BKn8DYTZ6psCeIWKjlU3R9Ddjj1
 kf9LBP4UHYJVoL/jYfvr6Gzg9AYtmhZp+WNU5McR4Y0jKmx9Fy83VGVZBzXHoq/o7q6PKnjTNo
 QBjutWaskJIOGflikxSLj18PVIupUdMCzgmmUiqpZ4idAEIsU8JFZgCFt3y2DvvhHBySVM6Eog
 7QWX8woh7g8JZfLZ3LDOiAwytnGIm43FzF1E5drSI3gZ35AVg2MFiHH73Y3jGYjluGY4wAJOPB
 Ios=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:03:03 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHSCC1g18z1Rvlf
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:03:03 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976582; x=1642568583; bh=MlOc7gzzEoH+mrkpfu
 wF80CqkYllueLnrvRzSKegruQ=; b=K5m1aC0doFMqbZmr/pgGxzs9R+axjUvqDn
 0WFZzsuOlNtn0q1F4iZi3+DiTFt+G23kUPioH8spwBHv2YWCEnS5uBTbrXhUnyfp
 9847DJcOdQpbPvuBAItDm7k/hWF7lYfvDPVSxoTPgGmkNJxxkG/igzw4BkTH4KE2
 wu39P8dqm9kVe6Ur78UqHggprzjyVZkL6V7hwLUv13dVp55E01UukqrgoQlpy3LI
 m0Y7Gqc0MsFgMi4q83xyz7NcuavtkJKuyR6IQKUU02By8O03Gd0jEu1abif5iV3H
 F91JdMCGE8bYHsytoFXAZYsh7H8Iilh97fEJarncUqKnlUt9PvMg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id qq6K_02U5LlQ for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:03:02 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHSC76WDWz1RtVG;
 Sun, 19 Dec 2021 21:02:59 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Vineet Gupta <vineetg@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 87/88] target/riscv: Enable bitmanip Zb[abcs] instructions
Date: Mon, 20 Dec 2021 14:57:04 +1000
Message-Id: <20211220045705.62174-88-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
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

From: Vineet Gupta <vineetg@rivosinc.com>

The bitmanip extension has now been ratified [1] and upstream tooling
(gcc/binutils) support it too, so move them out of experimental and also
enable by default (for better test exposure/coverage)

[1] https://wiki.riscv.org/display/TECH/Recently+Ratified+Extensions

Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211216051844.3921088-1-vineetg@rivosinc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9776297c79..6ef3314bce 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -641,10 +641,10 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_UINT16("elen", RISCVCPU, cfg.elen, 64),
=20
     /* These are experimental so mark with 'x-' */
-    DEFINE_PROP_BOOL("x-zba", RISCVCPU, cfg.ext_zba, false),
-    DEFINE_PROP_BOOL("x-zbb", RISCVCPU, cfg.ext_zbb, false),
-    DEFINE_PROP_BOOL("x-zbc", RISCVCPU, cfg.ext_zbc, false),
-    DEFINE_PROP_BOOL("x-zbs", RISCVCPU, cfg.ext_zbs, false),
+    DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
+    DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
+    DEFINE_PROP_BOOL("zbc", RISCVCPU, cfg.ext_zbc, true),
+    DEFINE_PROP_BOOL("zbs", RISCVCPU, cfg.ext_zbs, true),
     DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     /* ePMP 0.9.3 */
--=20
2.31.1


