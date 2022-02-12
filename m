Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F4D4B324E
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 02:08:03 +0100 (CET)
Received: from localhost ([::1]:56388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIgtO-0003x7-Qx
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 20:08:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIftW-0000Qx-Ds
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:04:06 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:7887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIftT-0000WU-Gd
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:04:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644624244; x=1676160244;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Op9MBksbJCLjCPcsH3y+BxEHX7yAAvSi//ZF4kTyuyI=;
 b=Auj0f+zVnTsKgpEjxu+JsWgu3b55QAqBq5PauOiwXSaf7+/TWEjWdUlx
 eIYO868kuEA9tDFD3agWmtXGwZe9TpN9LJZWzGIb0l6mIjC6PnFwfy5zF
 wKlPcuCYa2BORhU2k75+DZfBBFdDeWVQtaJ6IPI1q41pf9ijE8qoZsuN1
 R3aDZHSUk0KnBx1hMYL8tfrn5AGXjLSDzS4QDzBEmEwd74gzW3swqrgKK
 Ub2pV84rWOFngbR9bcgysrVWsBCD4B2wAoHuuDv7Pj7UTupRWvZvNs5Hf
 mwkYp1dTVQIx1wbi10VLVlDuyaFw8vOdTAFnjNBNY/Yn5CzWV3AyUN8Iz A==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635177600"; d="scan'208";a="193710285"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2022 08:03:57 +0800
IronPort-SDR: gP3kGCswlAF8lPlmhsrFeS5/vBP4rHl3le/q0146ybHkhrgGmI26o13YSOXkPdE0mKK08QpHhU
 LueZ8n5TxBkG75h04sEIgalcJLl9+ktB/1JLu+Te0czTpEmYGdbM9SkDLm7Sd6ruz3pLZdEK7b
 tt6Cj7BkIu7t64k/nsMjuL8jZt9qcYHkMc8p2St1SbmpBTukDrJOgtVDrTG8sMZXfX2MAkp/Ji
 952Vp6KP7gkZcwcNzPcN6FL+pfcj2V6WmUbRxHQi8m1XcOtjdXO/8TlNtvRqg7eDrOksw679vu
 mhgbH6W1gP7BAGWsDxw7Go8o
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 15:35:39 -0800
IronPort-SDR: vmVhSE1YduX89WMSqP0q7/4iesCMykezEhy2tTZDcaEVjL+fWgmwPk9JvxOiunNhhpyk8c8AFP
 BJUgZcrdopxLjVNaxkFnKd20PhDSfcfd2js/TUOObtR5KgsXGcJQaMSSVy7YldU/mJkl139/RP
 HPmQY6h/8ron+okgkwT8rk4Vczd2IA7HoRfGng11i2qyXtwRtkqEivlL2CyqG7ghRp8cxDafkB
 QX41suhMoQmHgCfsm5dnQpsmOl1Fvwwk4ulof/9I6/q3mIpJYv4pMOD/RqCY35pig/mWSefIwS
 NIA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 16:03:54 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JwW161PSnz1SVp1
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 16:03:54 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644624233; x=1647216234; bh=Op9MBksbJCLjCPcsH3
 y+BxEHX7yAAvSi//ZF4kTyuyI=; b=FPyzB0rV2v6Wj5MmLw0fztgYDwBStNztyC
 RU1OTbig3cujJs13gWQhxCQdhZRf96jvOFki1dbZ/7M6bOHYzKDtJZx4/ioNc/Yq
 C8G+ABmQzc6U0u0RDS7znVYeXvtOkp+4QvVxXpyAjS/flpz9ua4VaVSOQr9YYx9i
 O1vulwu7ICZ/XLAtqp4pSbqwMkYrpSc1gsJ0Fe6XjBPR37cgx97LuV8VzI41IyLC
 VY/lUQWGWwpVj4P+rybH5eR4KyUG48UpeI0rrTyRe51GSexgJNTdcyzYa/50fnJt
 rWpckLXOICqymFPUHvOUn5KtgyUep40fp8/ribRm+MzJL7gP8wfg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 4b3Us9-V09cX for <qemu-devel@nongnu.org>;
 Fri, 11 Feb 2022 16:03:53 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.96])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JwW116lWCz1Rwrw;
 Fri, 11 Feb 2022 16:03:49 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Weiwei Li <liweiwei@iscas.ac.cn>,
 Junqiang Wang <wangjunqiang@iscas.ac.cn>, Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 36/40] target/riscv: add PTE_A/PTE_D/PTE_U bits check for inner
 PTE
Date: Sat, 12 Feb 2022 10:00:27 +1000
Message-Id: <20220212000031.3946524-37-alistair.francis@opensource.wdc.com>
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

From: Weiwei Li <liweiwei@iscas.ac.cn>

For non-leaf PTEs, the D, A, and U bits are reserved for future standard =
use.

Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220204022658.18097-3-liweiwei@iscas.ac.cn>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 7df4569526..25ebc76725 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -937,6 +937,9 @@ restart:
             return TRANSLATE_FAIL;
         } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
             /* Inner PTE, continue walking */
+            if (pte & (PTE_D | PTE_A | PTE_U)) {
+                return TRANSLATE_FAIL;
+            }
             base =3D ppn << PGSHIFT;
         } else if ((pte & (PTE_R | PTE_W | PTE_X)) =3D=3D PTE_W) {
             /* Reserved leaf PTE flags: PTE_W */
--=20
2.34.1


