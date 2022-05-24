Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DEA5333B4
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 00:55:46 +0200 (CEST)
Received: from localhost ([::1]:60548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntdRJ-0005gJ-J4
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 18:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdGm-0007hD-42
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:44:52 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:62474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdGk-0002Yx-CD
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:44:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653432290; x=1684968290;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AR2Xo5Vgkvfi6fTgKymXOZMbwye6kSu5m9fSdAdzu6o=;
 b=fycpjgfrbnndeo+aIMZnpTi3fR1wprw6ePE+QsuMsRHeEBzaX0qQLlim
 5RYDwuztxfN7/kOlVbxYceHc/2+348d0v62yWlRWM8IU/hJeJ/4jByVnY
 sOAY2uHUXyMHYGT+OYxjsGhQbQkEunfO3s0ksxBzWvkJFhIL1ULIiyTE2
 pWY6xen4OFLn6QSCpUKmxxhVeUvyCQrUv2GDvHOOzkqYBjwQTDJnrfpXq
 uMoacXr/upZUGHVw0PwAep+meXCkm7r2oFOS4KlDS2jXJqcQGgnUUSbIr
 USKcI0ezeWPYEGOGEq7qXhyQ6PSb1jyPcGNik7X3TprsrK8DCLn5vDr6v A==;
X-IronPort-AV: E=Sophos;i="5.91,250,1647273600"; d="scan'208";a="305566657"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 25 May 2022 06:44:49 +0800
IronPort-SDR: gjQ00WBhFUPrQXjLC47Kq7tCHz40BSBzGLduA/eQaiVlfd9HYUv1cw0+RwqexBiIJ6X+sz2Y+T
 PNZ7uW6SreRU/mNRZFG6+L3SHAz2u5zs8uC7qkH5meT2AWQ8Z9JH8oncmfonvAVELY5cxw3xbd
 PSqJuW0TJ8RNMzwP26a9GWZazKgBrGlqtXtJ/AX0sHP+nxa2ScYRMdzhcvA/wNB/udeJNYK6UB
 Wx12jeF1hCktuDMduhEY5ifZQ41NU/XqnyqAvPF6LSJzxj6o4E16f6SpmegR91BiPuzQBoKLWj
 jzeBV7O9rVuciP7mqF631/wq
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:04:21 -0700
IronPort-SDR: 3GguGRy0miE7grIKnN4jUX0kIb78JkqergamQvhpP065W1k+ceOVcKol+Zi3lnKBlTCPeYcBaT
 jL9me2UeySJuTGQDJgwTRc4fVDbZOeG45JUML/qiu4WJQSWyTJ49UJdK89eRvbsfV69dhr2Tqe
 /uORmmOXgW+RXa7URGREHmpBxXI0od/EtkjT0R0BOJlGOFOkXaNcl9ojrlSpUbQ7gYbmvNtI/F
 7Ot17/n9Kq/TB16ZWSF8FzCOYmpz5mwtGpDwxK6TJCZ5V08SP2OZiyp/y2WQmIZY0YJjn2obqj
 qvo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:44:50 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4L78Qn3M9Fz1Rwrw
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 15:44:49 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1653432289; x=1656024290; bh=AR2Xo5Vgkvfi6fTgKy
 mXOZMbwye6kSu5m9fSdAdzu6o=; b=ffdZLpvnx5EFjd58pRoLN/JEQUApLbh86x
 qqdt4bXMVOeN+waN9JYMvKsywDa+LWmoz2R54PoJID8OSN5EIDDzK4S5bRetWDdd
 JwgxReCmDrArIflUpgGyme8eoHqi/XVyt/Bupsyhj9M1iELQx++cwwoOnXhTp2h4
 RBFmTmpqZ3uVI3hs+GBrVb5/foBW8OikKQpDUCQPhc5Vs+5hF3ZZZON/s99qLguy
 dn90d/Tglf7bGwQERaufh1BzCEGcHEwDh0eV9iYIguUYEfQCjrXnZhK8PljY90Rt
 UDoj7Qm1Byw5K/cJFuPtXmdn9Czg1RkIzAArD7hZl56c6XNu3HBA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 41eNTD9DrQ0L for <qemu-devel@nongnu.org>;
 Tue, 24 May 2022 15:44:49 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.5])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4L78Ql1sLRz1Rvlc;
 Tue, 24 May 2022 15:44:46 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 05/23] target/riscv: Add short-isa-string option
Date: Wed, 25 May 2022 08:44:10 +1000
Message-Id: <20220524224428.552334-6-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
References: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1363756b6=alistair.francis@opensource.wdc.com;
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

From: Tsukasa OI <research_trasio@irq.a4lg.com>

Because some operating systems don't correctly parse long ISA extension
string, this commit adds short-isa-string boolean option to disable
generating long ISA extension strings on Device Tree.

For instance, enabling Zfinx and Zdinx extensions and booting Linux (5.17=
 or
earlier) with FPU support caused a kernel panic.

Operating Systems which short-isa-string might be helpful:

1.  Linux (5.17 or earlier)
2.  FreeBSD (at least 14.0-CURRENT)
3.  OpenBSD (at least current development version)

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <7c1fe5f06b0a7646a47e9bcdddb1042bb60c69c8.1652181972.git.rese=
arch_trasio@irq.a4lg.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 2 ++
 target/riscv/cpu.c | 6 +++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index fe6c9a2c92..f5ff7294c6 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -425,6 +425,8 @@ struct RISCVCPUConfig {
     bool aia;
     bool debug;
     uint64_t resetvec;
+
+    bool short_isa_string;
 };
=20
 typedef struct RISCVCPUConfig RISCVCPUConfig;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9f38e56316..dc93412395 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -879,6 +879,8 @@ static Property riscv_cpu_properties[] =3D {
     DEFINE_PROP_BOOL("x-aia", RISCVCPU, cfg.aia, false),
=20
     DEFINE_PROP_UINT64("resetvec", RISCVCPU, cfg.resetvec, DEFAULT_RSTVE=
C),
+
+    DEFINE_PROP_BOOL("short-isa-string", RISCVCPU, cfg.short_isa_string,=
 false),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
@@ -1049,7 +1051,9 @@ char *riscv_isa_string(RISCVCPU *cpu)
         }
     }
     *p =3D '\0';
-    riscv_isa_string_ext(cpu, &isa_str, maxlen);
+    if (!cpu->cfg.short_isa_string) {
+        riscv_isa_string_ext(cpu, &isa_str, maxlen);
+    }
     return isa_str;
 }
=20
--=20
2.35.3


