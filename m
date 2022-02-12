Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE934B31DE
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 01:20:16 +0100 (CET)
Received: from localhost ([::1]:60430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIg99-0000XH-GQ
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 19:20:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfrq-000714-85
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:02:22 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:1923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfro-0000JP-NK
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:02:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644624140; x=1676160140;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pvnxMTCRdBYWESBTahjlcU5dha2IzsUpRGE46NIzUNo=;
 b=PrlOlPor57lkw5V263MQYg4mROmA9fMPCZ2S4EXARe7UMbCWQ0+Q2D0B
 y5Nfr/5e3vFEtT0DOYO58pWtRLoTAdYXf69wbTfDyEhzFj4GmBy6M/0zJ
 jGTbLBLo6Agad68k8zfGRNT0sG4weMdQjXlDWE2y6fXmsqJVr3UfBKhX4
 ahTolgRRbirJ87f50cSOzpZ0NL2L5qrNaxsVpEH0v9r2gQR2c503oHZQ8
 hzFq4VJ99Zm3QPLfRFOD8QWGpVPRkLwGoWBvS6ReNywmxrh6K45WA9wRE
 e5HY6GPpqVGBTDvLooyeK7w0oYUdE2wmAINmzzMtExofXeX3YtliNnhQo Q==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635177600"; d="scan'208";a="296835818"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2022 08:02:19 +0800
IronPort-SDR: TdkpPDoNBcFHXGFH30ZLx/bICUdU3X+DYrk7xqUqOu/CDQZURZbj2mf7x4ugO2ja1aT6h4zL1J
 y8tvBMQPulQWEhOXT+a1zMQh3ljm9UKJZDNN5gQU3sjbRdY89UKDxRlnPUzcGdBSLmXoRCbao5
 6VJEoSVGSNW0JwXIp4Fgs8IzYfQSf45dbtLxp4etD4HIT/FAM+n1Dwzk8iLS26jMb7NXQGmJDO
 IjPtZ9lHZQOlwbmJEkGsdbXBxY8zRd62V9h+bbHG+YXJjapyrVgwrqJTTRV8PfZolvEaRjTB4J
 gn8h8Ph9hDkHOSBUSbxbmCf+
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 15:35:14 -0800
IronPort-SDR: hArZeJdSgbGgyZwqNw51T/MOqGkMYDyCUgUPzUD6RNwAhcnZ4F/eMwXSF/K4js251yErjDEK1m
 cYuTC3URSH5UGIe64NxkDTjpVRHUv9ZuIANuhwjnbG8UhTOkWV4ylH2PoNQj+NRvyJFNEu4oIB
 ddOFg0Va9ZjoTIGGeCvgDUXOuFKBF+cqGrZiOjtdCbD9u0sdwVkt+S9EuD96IhQ90xRvFDdmcM
 O66uwnkfMMUVx1Dl2ChXWSISWc2ccGXZfmRd920YF3iGFnf70xhY2P0O0qseE1An1hyyE4QljR
 +/M=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 16:02:19 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JwVzH5SH3z1SVny
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 16:02:19 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644624139; x=1647216140; bh=pvnxMTCRdBYWESBTah
 jlcU5dha2IzsUpRGE46NIzUNo=; b=LoVYvIQ9I1SdNKkxucZWGScviMmIyCF950
 avHyHl0DyBiEGrjWp/HVCu7Q0rPAHOJvyl8l3dVuzmWy6Mll3b/dtCvb9H1Duu1l
 jqrEqebGoap9uas6WKQujlm/BBmqbnlNdQ7z3ECEuc+XP1cKXPOb1qwx1KeOMMmw
 EJ8bAJ2YxakP6eUrqi6bDUNdAcWgND66hCXEB3KBth8tGNHMXjcRcYwVciXBdHD4
 x7zc4rCwlACUo92o/B6aAKj5UbwTkWUc52Ut3+4QxKyq/Hb1hDW2oPN5S/a9cwkX
 ZfhiDcHN94bFl/WycOz7C/wpfqtEdjZWjgOMvWeT9Jx6KzCGqNXQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id X2hm3sIjJeHI for <qemu-devel@nongnu.org>;
 Fri, 11 Feb 2022 16:02:19 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.96])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JwVzC2X1Lz1Rwrw;
 Fri, 11 Feb 2022 16:02:14 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup@brainfault.org>, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PULL 17/40] target/riscv: Add AIA cpu feature
Date: Sat, 12 Feb 2022 10:00:08 +1000
Message-Id: <20220212000031.3946524-18-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
References: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=03511bb56=alistair.francis@opensource.wdc.com;
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

From: Anup Patel <anup.patel@wdc.com>

We define a CPU feature for AIA CSR support in RISC-V CPUs which
can be set by machine/device emulation. The RISC-V CSR emulation
will also check this feature for emulating AIA CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Message-id: 20220204174700.534953-7-anup@brainfault.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 283a3cda4b..8838c61ae4 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -78,7 +78,8 @@ enum {
     RISCV_FEATURE_MMU,
     RISCV_FEATURE_PMP,
     RISCV_FEATURE_EPMP,
-    RISCV_FEATURE_MISA
+    RISCV_FEATURE_MISA,
+    RISCV_FEATURE_AIA
 };
=20
 #define PRIV_VERSION_1_10_0 0x00011000
--=20
2.34.1


