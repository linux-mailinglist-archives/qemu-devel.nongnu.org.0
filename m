Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B406538F7
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:46:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87mN-0007xG-Qk; Wed, 21 Dec 2022 17:41:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87mJ-0007ql-Uq
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:41:35 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87mI-0000bf-0l
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:41:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662493; x=1703198493;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=icpZO5Thn7rLQmM9zLyvo4epmOEtTo4HPzPsWRyUaiM=;
 b=MaIO02G8/eiyH3jbJ6DNpWsK+CvKhP2oiSVO8qGdAhb0Wa28HVpxuDHe
 RB+/lkqokXvkD55GrMFTr4fFG6j8Wl6ELH7zasKpCgy1Na+vuQ3QP1XnD
 aUNtIUkVE5VkuyUOU3m9+GThs5+xUmUQdU0ZRJNFSCb1tfWQVAH/J69yW
 EObkoUNEVn0Sd+g/tJZf22U60nT8tDtpOQ4+IA4PIo2PGToloRP2cW5Sw
 uk8wXFi9+sXhYB/kE6KsuxFAvfkZxUFtFBuiE8SqVOHUSBJr652RalonC
 SBP/qzLpiS9elwwp7AbJiLEGRfhN/bnzN+hlB+ocKkTD0WDCXV5gTUBqA A==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561346"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:41:05 +0800
IronPort-SDR: nZIfk5uW0MQZH7Y/KwlPndKdJT5fWgLWtH/im5OjWXD/4PUPPwctPuc5qYZQV8X+3pqt9EjiFN
 5bk48BuGcUD9V3y+as4wvj8B+7ChJcyq0bZf+8W8bHWGuUCHEjH7hYJgR0A1fz/WnNR+sAT3nS
 dWzVFYkX2+hPgYLnMUC/jq7/GEiReAHqYYPfVoQ/L+e9KrKFqL+VRAF/Z+e9ea65EIdT7Gp3E3
 Jh5VgENTniLQ0E2l8DFasdkfZtFelsKLWMUlWtKPu+rVb86MuQgNBMqimH4tDiwTvgJ0cH2DHa
 lDA=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:53:34 -0800
IronPort-SDR: CiKQwP8OMweF7q7XhrcWhBoUzwyJIAZoXu7sDZ2WwQuWTo2DtMDfyNMPl6IPiLTuH+0YkjBaOW
 RBhN+RA1jSA1XXg5p3dIzXFgZtEeA5ztsJwt0/gaNbe0YT3U1ZOmlQYELdYLABX6RsINk+1MWs
 KUL64nkMA8PASjXGU3qmHiuQ7N/aIO8f63FbnJC0w92MYc4eylDS745BhEUR6F2ih/j2sQx/bc
 HcVBd+mCLS4faMmfvQ7KiGT5Kw7gBm/2RUZ1UY690jbVpHHBQiVOQ7jVQpKrga1R7kwEacZ259
 mGM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:41:05 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpM50lyfz1RvLy
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:41:05 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671662464; x=1674254465; bh=icpZO5Thn7rLQmM9zL
 yvo4epmOEtTo4HPzPsWRyUaiM=; b=CQOb1xPa0Iytu+YdDIBLk+2mCGljHgJe9Y
 KvVjcNs+egS2lX54jYT/ahPQPmKHeFDvAIzB9pycr8m/P9iR6kjLXgVG0iazDByY
 NfDyfczpUhz5yYMDuVDEFavvY4HDfnT1ulFnaplJXLneF80/6Not1TOUThP73q0o
 ruGHpBgJDvCyfHRbt372oFz1zxfm7x/YjxP5MRQIW38ehmQQC7JLSve2YMzPGHsX
 S/6TWInlcVY45YU7si/rr3vgkZGqJ0mpfSZHA6rwU/EOdrI01rtzFR8ZTuztaO/t
 +Jzd5MUL5VQIRonH0RzFUkbkLKOLFICMAmFcS5Qmie0jTGG+dhCA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id HSkCmtEm0-Db for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:41:04 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpM319rnz1RvTr;
 Wed, 21 Dec 2022 14:41:02 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 17/45] target/riscv: Typo fix in sstc() predicate
Date: Thu, 22 Dec 2022 08:39:54 +1000
Message-Id: <20221221224022.425831-18-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
References: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=3472792e2=alistair.francis@opensource.wdc.com;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Anup Patel <apatel@ventanamicro.com>

We should use "&&" instead of "&" when checking hcounteren.TM and
henvcfg.STCE bits.

Fixes: 3ec0fe18a31f ("target/riscv: Add vstimecmp suppor")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221108125703.1463577-2-apatel@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 71236f2b5d..0db2c233e5 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -940,7 +940,7 @@ static RISCVException sstc(CPURISCVState *env, int cs=
rno)
     }
=20
     if (riscv_cpu_virt_enabled(env)) {
-        if (!(get_field(env->hcounteren, COUNTEREN_TM) &
+        if (!(get_field(env->hcounteren, COUNTEREN_TM) &&
               get_field(env->henvcfg, HENVCFG_STCE))) {
             return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
         }
--=20
2.38.1


