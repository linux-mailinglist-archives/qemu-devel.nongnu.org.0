Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA7547A4AB
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 06:41:11 +0100 (CET)
Received: from localhost ([::1]:39100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzBQ6-00050w-6f
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 00:41:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAmN-0004Ac-1w
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:00:07 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:13359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAm5-0008G0-7N
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:00:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976390; x=1671512390;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gHkJp8LcRqZa7IAD57qVJv9P1dSQ/o09UsCeO7AXZ84=;
 b=o13S4G9B6bQYzLQwFrNBKKCM6TsQ3MdEzZJDVyHP2403YyaKAmsV6E86
 JUxFAmS/pdpAWNENDl/bd8PA+EUZ3n71UaGeAm1/+zBgqWPKRSoE+FjwW
 xKXOhBEQdjzGBk3QU28sJQN7fYCZ6b3/Y0IXPzFIdsA8Nrflu7vvhJ3YM
 +/doQVYCqU2Qj4aKVaAoZnQBx9J58K0ETBDYCpK/5FgiK/Q3Xvk993Fsm
 8d+OUOtH8xYOCfN7sK1z3AJrz1ezgm8Gq5xVnx6n51Y1zK1zKuD/ghg31
 SmDqexFnUr/bs9nCN1iCvzOPH85NxSWeODBG6vM7/Ml6PpBzeuMjgXH4x Q==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="189680062"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 12:59:49 +0800
IronPort-SDR: fzXJFzFfF+sDu6CTEX+rjsvqoL2gruoYLWwNiY/+xl4JN37noPtYGuSR/UM+DJJiu+fEY0nnmD
 8l7LLc9ismpUO3RYB0ceniuCgrt/9EXbUYDh9NX50ZtoPn0wtQKRwUlByAlF786TSVMVegIucy
 xZpqIFy/oVnfNef/0RjpP4C+sTuD/DXtFtu/pDHKAtuq/PkqrsCGEg6tpxCp8s6cnVBsCF9ayV
 y85PZQTfjAl/vWJACw+xcbkvFAYNMyTjkzhgbwMxaOWQlVoWcUZcS4HA9SwNXIZq/3nXF8r9E2
 25P2vV0IGF9phCkXhnkeTCin
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:32:37 -0800
IronPort-SDR: CjVmdG1FSKsWTNmK7lCS/EFtcxGcW807V9OYplcQK04jP3qlDsELgSrt5akrg4tF2HVFRy+AoT
 wbQOU0tUU0gENuACbCRH5hwIiq4Z5SmlWJA4A1bEDmzVLPP0NVc7j21G28ZgY9DzaZqETSdjdR
 vgPYf2EdVIhmkx3gn+BD1TRKSGSbyWPjSSqPvMM4b5Knt1a1DlFsdEPObsfYPPUsqs1sJ/EMpP
 M24Me33+eVwZp4cPQSYbLTDQBQ5UKKXn+ppSsu7tujrgkBRqrNyjn5LhP7A3Lk0IUJbZb4SOmK
 8qU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:59:49 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHS7S0kPFz1RvTh
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 20:59:48 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976387; x=1642568388; bh=gHkJp8LcRqZa7IAD57
 qVJv9P1dSQ/o09UsCeO7AXZ84=; b=oCOAEgcflSICcqjkWP9PnR2v5/v9tXT4a9
 XK8H/VEu1G/2/jolAYulf8DtWMk8GudhfMrRLW3LVEZ/e4DAiHYfCZ76FyuLHT8p
 e4dU0cqBaSf0DtW9WX9/2EVA4pfQqEcxP2ItA6PFqVmqZNU+9v7ceTZ2DRNkpu2f
 0KkhvqMEmmau0rz9oHHVzbTbyh7cYSJP7liIeROCJ6tAnrElV7zKXB+23girF4Ap
 Xf1t1e4sXRojfqgXcbFpRXrjk6tUN7NEGeVAYbBasSgEaXntI0F6+/Dl6N7H5gof
 m2fh5yZmrT7cBUUq/XglTqF6SPfssZc50f0m7vJP6JDNIhYl7R0Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id TSQrlNjQppqO for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 20:59:47 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHS7N5VRTz1RtVG;
 Sun, 19 Dec 2021 20:59:44 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 36/88] target/riscv: rvv-1.0: floating-point classify
 instructions
Date: Mon, 20 Dec 2021 14:56:13 +1000
Message-Id: <20211220045705.62174-37-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-29-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 92a0e6fe51..f61eaf7c6b 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -586,7 +586,7 @@ vmfgt_vf        011101 . ..... ..... 101 ..... 101011=
1 @r_vm
 vmfge_vf        011111 . ..... ..... 101 ..... 1010111 @r_vm
 vmford_vv       011010 . ..... ..... 001 ..... 1010111 @r_vm
 vmford_vf       011010 . ..... ..... 101 ..... 1010111 @r_vm
-vfclass_v       100011 . ..... 10000 001 ..... 1010111 @r2_vm
+vfclass_v       010011 . ..... 10000 001 ..... 1010111 @r2_vm
 vfmerge_vfm     010111 0 ..... ..... 101 ..... 1010111 @r_vm_0
 vfmv_v_f        010111 1 00000 ..... 101 ..... 1010111 @r2
 vfcvt_xu_f_v    100010 . ..... 00000 001 ..... 1010111 @r2_vm
--=20
2.31.1


