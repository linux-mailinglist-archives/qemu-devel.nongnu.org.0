Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4795347694A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 05:57:03 +0100 (CET)
Received: from localhost ([::1]:44570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxipC-0005jk-EM
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 23:57:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=977d27bfe=alistair.francis@opensource.wdc.com>)
 id 1mxinM-0002vk-HG
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 23:55:08 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:18147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=977d27bfe=alistair.francis@opensource.wdc.com>)
 id 1mxinK-0003rR-IK
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 23:55:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639630506; x=1671166506;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ayBTYXwSr3LpHDfXsatQL6OmSGThM5dBa3wy7BLUtaE=;
 b=C8MRi5r7AHuEmzD57iM5aPeWaEcTGmw9JMfTT7XxR0bxVvuDUYNbwU2n
 ZebMFVN4SlOkJujXFMn6RdLW1BTR1vbRIDC9FuKPZsuVXWhb8dCQNxnjr
 5+/UACK13lxNEPAiG/oOwgPK+MIWaNh8u+3PLKNe8VvJddgYnzPd4ML2z
 MO03R5TmQPPctaKTeARjLwFZaZcoWZ29c6SK+2uc79H1hR2p952xml0ro
 tzPk+3/NUnoHBY/CfLIiSAsR7kTKvKxAZaQ4ucqineNeITN9oYuZAJIl7
 5GWWndd9qRs2oKqJo0ZEmK8ZCJ1n1DRpawDF4hxpmifieXwVjSAtrXE3J g==;
X-IronPort-AV: E=Sophos;i="5.88,210,1635177600"; d="scan'208";a="187354576"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 Dec 2021 12:55:05 +0800
IronPort-SDR: 2uaFq9qmy2VrlF7tm7CBpewfyJ47hWJnbxi+vPTBQ5loqDwQH0Oj3+LunFh2xCl+NOyErHSFtu
 4F8uZ7/HNUS0hx7Fx++P/mx2dF5SilO16tu8RronKv0dY6M7f6Uf/kH4uBGhCUTz5jihzd/sEQ
 YZME3weYv7XT7nrw91pMoCx33aN+lDH+9CS7lXV7evUuW42dfIxqyxgJfR2bYXdRDLwzTmzE9V
 GpmVLAjCsa+n3Q1Q1M0jGnuLy1h6EBu01zwx9AG6kE2F4ApVGyynij8AWaxwxy2ixiq6ZegQgb
 jzXLyJf+TSqthPs/0REpvwK8
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 20:27:59 -0800
IronPort-SDR: gTxaejzAjUq2/z6jSrAqpYv+w9KKT0Aw0ye/Gtt7dml+s0zoNjxMx5b7kjDH1SEZ5MhFOSJmta
 2il+XCNNqFLJCu36XU2gD8JCBZh/OTVv+7XqFXU3ZxmQlPFUUCLhQEuwgUOyYrLGf9se8t2wZf
 DFkVWCdBmM78rMZXUJFm6Po5x4JjUO40WvVMAQI4a/e+jrQO3X5ZS+NbvfqH8n7utUw/Paog0u
 p/BVhBENVYqNiJ4Q+UbVmc9ftH0vWfizv5t0uyNbjVs7DCnwnCCyb1KbELy+YTEKaTuA0tz2Va
 dvg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 20:55:06 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JF0Cs3pnCz1Rwnx
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 20:55:05 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639630505; x=1642222506; bh=ayBTYXwSr3LpHDfXsa
 tQL6OmSGThM5dBa3wy7BLUtaE=; b=i6Oxe4x0hZqPYWqMoKJnO6vc6wcPapDJfV
 7dK+iK2Q1q6xlmhfZV5pIfvNL8G3tLskNM6o6tW6cvCmVPR6MbGlvdspx01b8IGo
 YU3VybzAS573Ox6BbXTLNoTPJjc5Gp7UOtBJPweJOB2oXifZODhQgKdwBJ65qfDr
 ziunGRppeeu/EO8i2hiz5bRmtyeW24h++xZMqQ+Mic3UeadIqQjdjlvb9xPGfH6O
 Fxc01AnXaibRgmYWBVlJrSKmpypJRMGAHgmoBBabc3fulXU0rAl1O+sotivUgZFb
 osNSswvWQyEN09/WDGshpYT9qDyLrnlCyDht9AvUhovv4otHC88Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id haSqCZjMPmsK for <qemu-devel@nongnu.org>;
 Wed, 15 Dec 2021 20:55:05 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.66])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JF0Cm4Hrdz1RtVG;
 Wed, 15 Dec 2021 20:55:00 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, alistair23@gmail.com,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com
Subject: [PATCH v2 5/9] target/riscv: Mark the Hypervisor extension as non
 experimental
Date: Thu, 16 Dec 2021 14:54:23 +1000
Message-Id: <20211216045427.757779-6-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
References: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=977d27bfe=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
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
---
 target/riscv/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index f812998123..1edb2771b4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -626,6 +626,7 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("c", RISCVCPU, cfg.ext_c, true),
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
+    DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
@@ -639,7 +640,6 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("x-zbb", RISCVCPU, cfg.ext_zbb, false),
     DEFINE_PROP_BOOL("x-zbc", RISCVCPU, cfg.ext_zbc, false),
     DEFINE_PROP_BOOL("x-zbs", RISCVCPU, cfg.ext_zbs, false),
-    DEFINE_PROP_BOOL("x-h", RISCVCPU, cfg.ext_h, false),
     DEFINE_PROP_BOOL("x-j", RISCVCPU, cfg.ext_j, false),
     DEFINE_PROP_BOOL("x-v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),
--=20
2.31.1


