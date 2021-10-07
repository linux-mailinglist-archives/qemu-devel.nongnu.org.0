Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF75424DAF
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 09:06:15 +0200 (CEST)
Received: from localhost ([::1]:51782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYNTq-0003Dc-Q7
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 03:06:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNDV-0004DB-Bu
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:49:21 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:14598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=907902f29=alistair.francis@opensource.wdc.com>)
 id 1mYNDS-0006IC-V8
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 02:49:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1633589359; x=1665125359;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/4xbYMv52y8WUOUrMRngpDSSgYeT23Q/QDQ52Sz6QKs=;
 b=ar209T4+n2bt4zjPy5+TuLlQpNlOCglGX7H7dyGrA3JzHMeZt3/KgFSE
 AEWYd/rKfiA3RjQHhqdg1N73UMugkqynx7s2XC5JFQB6F4eVEyJE4DAY3
 7oPoe9ejz9YcCWATMRvDw/U1rkJCrHhIgBrihZbGvydTxA9OMIU+TMf7v
 y15VzPr8reNRszdlvNgxTArnbLnnh90R18vo/IMdw/fbcjL6s479p3eHK
 XE/LdTwQK03kjwexZEhprmsW7EwGmUU7Q1caKu3w53Cgw+GoP/sXjO8T9
 OThQgH8uk5Dvu6zX8G3eNvyBr56ibnOnHL1bbgcHzndJJ/F9ErOkxfNmA A==;
X-IronPort-AV: E=Sophos;i="5.85,352,1624291200"; d="scan'208";a="182849367"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Oct 2021 14:49:16 +0800
IronPort-SDR: BjSO9hNWbza4rxdgaHEC153Yk7FdOEK98kR9B/7Z6OJgIk5ADveMcZOPsYtamo06CpSVJHec7T
 lMXtgoipUAH2BnFJphgiErRnhYM1cKxjEqFa68DCSSF/MNnXI/XjxKryvWKRmhl4aAcK3BnyUI
 nvPR6fdFUP09TuOdD50P3YPAiSX0m07fq+JTbKFgmrcY3CntD/akgqlLrzFNKIt9Z+7kQVXjeF
 L+otzpIcckJyxjTecpy0756vskwlq9ChRTgRropi3zxSJSGfm8mSl2Dd+NGv9j2Fwv30Tly7x9
 pYAArv1OMBz2NGqB/xNq6yl3
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:25:10 -0700
IronPort-SDR: QMsUa7fW72Mo8V/MOclA0Jy8GGCw8zKoWjudAUO0UcXdmQWAN/upHIJbYcVYW5lOcy70OsJyzc
 fszV99+2u4sunjkUnkr1w7kx03oLM9dnoSw6HyIaYW1sXlgzZeYI/Y7QX7MYKE9LPcOaeezGGT
 7flRSLPsm+JZp4mDNSr4NvwuKRmEDgq00/oPofXxfXQQjzigppTbbmvysYNr/4c9WoCcGrkQFV
 /MBB1esPqbCnjINNqSCb5sulicPz1Y+BApSdLP3BRRpEQexvgBykzq/Bo6byr+aM5EjywOrgUk
 +W0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 23:49:17 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HQ23v5ts6z1Rvll
 for <qemu-devel@nongnu.org>; Wed,  6 Oct 2021 23:49:15 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1633589355; x=1636181356; bh=/4xbYMv52y8WUOUrMR
 ngpDSSgYeT23Q/QDQ52Sz6QKs=; b=ZakjrwE0hlu/EauoJC08lcDZmDDbtYk0u4
 1OdZfm9i8/7afuSIFgoL4KL8z1iLjU1b7aFDYCExCSSShMTjLDzlXkBFJYwOUJdW
 YqZwi9QusKbyp4x6zWPvhESUoNJ4EmZrleSq+0K9NJh4tJmB9gbGcVvQxfytRHoP
 GS9SoVMYr7eF0/Ekn4F7YVj2fYAud2xlAC61OGLDQFg1lFJwD5y2vB35bzw18Qg1
 tK+37Ie3kXL+p4ktozURW8MMNb7/GqoPMYtL007xv2FQATB1l97fJIKebQ0I4oly
 dQ5/iEk3WRssZOOnlFCM0DyhvIKOuoXVm9aCX/AFLg8HGALzyElA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id YxppQAi5UuG7 for <qemu-devel@nongnu.org>;
 Wed,  6 Oct 2021 23:49:15 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.32])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HQ23q05ngz1RvTg;
 Wed,  6 Oct 2021 23:49:10 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 12/26] target/riscv: Add a REQUIRE_32BIT macro
Date: Thu,  7 Oct 2021 16:47:37 +1000
Message-Id: <20211007064751.608580-13-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
References: <20211007064751.608580-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=907902f29=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Philipp Tomsich <philipp.tomsich@vrull.eu>

With the changes to Zb[abcs], there's some encodings that are
different in RV64 and RV32 (e.g., for rev8 and zext.h). For these,
we'll need a helper macro allowing us to select on RV32, as well.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 20210911140016.834071-13-philipp.tomsich@vrull.eu
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/translate.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 74b33fa3c9..b2d3444bc5 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -337,6 +337,12 @@ EX_SH(12)
     }                              \
 } while (0)
=20
+#define REQUIRE_32BIT(ctx) do { \
+    if (!is_32bit(ctx)) {       \
+        return false;           \
+    }                           \
+} while (0)
+
 #define REQUIRE_64BIT(ctx) do { \
     if (is_32bit(ctx)) {        \
         return false;           \
--=20
2.31.1


