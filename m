Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5F04881D9
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 07:25:12 +0100 (CET)
Received: from localhost ([::1]:42808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n65A7-0008RE-9S
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 01:25:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64fR-0001QG-Q6
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:53:29 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:63959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64fQ-0006xO-2R
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:53:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641621206; x=1673157206;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GDWMD++bNpkFYK+rm/4lqXk5uuP28kwQtKhksc+UPfk=;
 b=KbSHM0JmbiNeuSCyihf+D0NMiae6KeCgysy2K+uVWmGf+22QZ5n/Ogfk
 yXBsZ3EplOWagK6mQpBWvvuKjd2n4kQlyERCzokp2KOuOxEMU5wRR9Z7V
 j7AsaST+0HTaFz9C3gHr0NtsiQ7sRiH8mithlqJ3v2gSOKxsad6cIU0cj
 ynQroihw/d8TkuHV3ysLpb50rXf+NmU8N9CYANM3OZBIgzlIrrBXTqq9I
 MymtLAsQRqFEnbxBIPp+Bnlz1XXFeiLzlEWBvVphnjI/VYBLHtecz2KSz
 PbuCOKy0vf2fV4bw1bycX1/3AxrGUdsWPEs+lc68umEe+rfyJTMdhSE07 A==;
X-IronPort-AV: E=Sophos;i="5.88,272,1635177600"; d="scan'208";a="189984951"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2022 13:53:21 +0800
IronPort-SDR: 5MlbIVLYbHi5e88Kn4RqollaGVY5MF69thKKNgncXs8dVP2k6P8c8Wx7TsGdXVY1jmy+uhK+VW
 Wd7bCkICbVXg+ExkBAd5GOEn08iBdIymVMQP/nfHFq5wBiLY/SI3xPw5UB+iKGvED38P3c20Wa
 q6j/9d/FcN0DpazwgRNuvYwPfBZwZ1G4jyLodaTfhC5crmm+HTkmF3wgZsVKg7eBX9/KrO3Er+
 EAWLAWhgoGHV9tBFi4/cdFyVmG9+WrzUVhE59cBGcE5B+El+e17u2PERoPe/9VDKMAp1P+SxeD
 zq2iHvl4BvkD36PmDWhqKAbI
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:25:49 -0800
IronPort-SDR: AnwWJea7Q9fp4j9pZ2gJL+MZhqQ6VOVeJOfq9UXGdO4QS6kYWJ+0PmPwkdMeeDUHFYV+I319L8
 D6mBrqj3SmXCirH3TvlzDRSpRlz/Jh1yWIa/EXiCoKOYdNZQI8DFY8uNqqJKuzD3QavmM5FAiN
 8WTSR3zQz755NSbDypzSIN29vq7KQMO5DM7uOrz2M4NrwuMjtC/hqOe/dXNmvJoRJGH7IGIMxZ
 /HvVpVdtUNaUQ1dPeoqKAg4Eu38MHJMNEJbToYugA/q+8X7bzYvWLYfZVRKeP1GZ36xbOsA00m
 lJ0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:53:24 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JW8QV5Jxtz1VSkf
 for <qemu-devel@nongnu.org>; Fri,  7 Jan 2022 21:53:22 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1641621202; x=1644213203; bh=GDWMD++
 bNpkFYK+rm/4lqXk5uuP28kwQtKhksc+UPfk=; b=jMcGXIdy9vXbAyQCfBZnzOU
 3uLLmGn2WQFx0vVYOENzTaE93Tt9gwWEN5C8gXNqfviTPKRQ02J0pzMZX2ge34Nf
 U8BH7uxjbd6Os8a2rIDfpCATuhdDR/IDqL5dcEvUbYO5qn9Gd4VK8/aIUWPqrCBp
 6keTOjkdiS/rCS/07acDPYDbpJx4oNFXCBd4L5LMt7UB3LkBOLcAqEsDzaJnYe8e
 kWekmfGSiM636NZzbn4gnlIslplmi4NSCOfzLgvhB+E2ri/s9o18LhH+JQ5voylJ
 lnongL0ITk/Rg1bWgONiNRe+Fo+0HdQ+sJGRpOwy75TS85e8Z1vfCUFioM5Y2YA=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id WFm_HWP1MakH for <qemu-devel@nongnu.org>;
 Fri,  7 Jan 2022 21:53:22 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.74])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JW8QQ4ft2z1VSkX;
 Fri,  7 Jan 2022 21:53:17 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, 
 Fabien Portas <fabien.portas@grenoble-inp.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 31/37] target/riscv: adding high part of some csrs
Date: Sat,  8 Jan 2022 15:50:42 +1000
Message-Id: <20220108055048.3512645-32-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
References: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=000118587=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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

From: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-grenoble-alpes=
.fr>

Adding the high part of a very minimal set of csr.

Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220106210108.138226-16-frederic.petrot@univ-grenoble-alpes.=
fr
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h     | 4 ++++
 target/riscv/machine.c | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index b9dee7d147..e8c664a956 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -195,6 +195,10 @@ struct CPURISCVState {
     target_ulong hgatp;
     uint64_t htimedelta;
=20
+    /* Upper 64-bits of 128-bit CSRs */
+    uint64_t mscratchh;
+    uint64_t sscratchh;
+
     /* Virtual CSRs */
     /*
      * For RV32 this is 32-bit vsstatus and 32-bit vsstatush.
diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 8af9caabf5..13b9ab375b 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -179,6 +179,8 @@ static const VMStateDescription vmstate_rv128 =3D {
     .needed =3D rv128_needed,
     .fields =3D (VMStateField[]) {
         VMSTATE_UINTTL_ARRAY(env.gprh, RISCVCPU, 32),
+        VMSTATE_UINT64(env.mscratchh, RISCVCPU),
+        VMSTATE_UINT64(env.sscratchh, RISCVCPU),
         VMSTATE_END_OF_LIST()
     }
 };
--=20
2.31.1


