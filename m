Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E11C47A4EF
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 07:20:45 +0100 (CET)
Received: from localhost ([::1]:57778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzC2M-0006aw-Iz
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 01:20:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAp0-0004dr-2G
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:02:50 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:51758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAom-0000GG-Ss
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:02:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976556; x=1671512556;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Mz1dt0NAEoNSSiRkFNIxh89mgk0i2xFnR8/ZgKs2wzU=;
 b=rAjQNhC70BVg7r2s+GEItug+SymzGBnhJVwlN9XhJsSiFSnM7UUh5DPd
 pWecZY5emZIsQ30NnFRr/L/1tkyct0cskAIcqpdtYIxGMkSBhYc1Pd3Sz
 wp4ZCS/5/ki0Q409Hv7EABxEBMPUwf7zcz+MQ+qsqiTedKCczf4RUZ/8v
 1jFwxTJoeFsY6s1IzC2/0F+Cr3yUCUzD+o1OU7dmxV8SajutNlK+Vx9JH
 7aaK0+kxDHe8efHWABL/nV7ox/bVYrRr/jZh+rWjr0m9ycEQQDu8tG7Lt
 AA/cSy7GmwDSEQUXnlYiSQHlLKzoTCnHS2cTacLdP8c7dxVMkpaCkZMr1 g==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="292662334"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:02:33 +0800
IronPort-SDR: jjVJRjBvrEU1eStVMx0qrTv3s+LJFWB29HMsVy4lvmnG2z5eILnhPFznrqjXzX7AqHS/B0EOv8
 jTIt2KZySIDIZe2jAkpI7ORo/nGLsFlmMDWaU01eTvM8Asan40W/vvPfYeR6ZAcQ3VKVOBFNh/
 QSLk5RWD+je/smZ8l4u5g4tZOUs4MozjA6X+XwICU/jbGYORDfG7gop0ZPEEfN0hIfU2SuNtKY
 RNVZnfWxZ24QaYvqj4Tf7ljgDXc1Q8FJEpy21tKgMWDvY2ftZQ6T69LfDDhkfQiszM6o9g8hzS
 Andh34e7QwoZDhHRkIx8175T
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:35:23 -0800
IronPort-SDR: 7dZp8PIVwmf6c7Ips8/z/tqxOeepU/lr8kPOVpfTFXpzY3vsDx7qY+Qb33yKq6VRQOMg/ZbsTs
 0JilkH7GsdryIxAy6EqilDwDjEUyBROD6JUL4vIVlwaLtqQtinidWKCkkrBLMiqWwCVIr/EoMm
 prrkeaHvaMoxeYtDfbTKy+E1LL/79Qw/uP2puZpKBOuz9a1hTB/nMYkBmAHruQjNxjVP5GdB8G
 9u1QQ8WGD0iwhyftbjqmgWCF/7jEK7ba0hzVIL2YeT/GtY6yrgH27e9i/HKrIG0iHe0NJIyCb1
 pN4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:02:33 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHSBd0yQRz1RvTh
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:02:33 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976552; x=1642568553; bh=Mz1dt0NAEoNSSiRkFN
 Ixh89mgk0i2xFnR8/ZgKs2wzU=; b=li0939W/nt4L14mMGIvg5VwreAz/O3Lfxm
 m5jMuscJ+6nH17N+Ycx+GxZlSd6fLdSzEYoUbRp8moJLCa7QnELW8ocozuBcjyuG
 2T6TJ7gnZ4C7+yem4qjqe+ciQN788tJjupZPxZiD4zsN96Llm57mJzUAMGy80A8U
 Vu6V6otC3OPzb24bisU4yYvIM4EeemxUtNDnDGPBlk0bfsBT1AXlkNMJxnlHzIuy
 McWLgUzk1Yl8av8KbOvuuu9/Aq04I4ZU13bo0sTVMNRmY6M89JVpeL1ODmLF08F8
 2tdBgaUpiELiigiAs9/rc7UFbmPNlzT3SeJxYeTGO/GL1uM/HDWg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id YWB-Sv7CvtCN for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:02:32 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHSBY6kH8z1RvTg;
 Sun, 19 Dec 2021 21:02:29 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 79/88] target/riscv: rvv-1.0: rename r2_zimm to r2_zimm11
Date: Mon, 20 Dec 2021 14:56:56 +1000
Message-Id: <20211220045705.62174-80-alistair.francis@opensource.wdc.com>
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

From: Frank Chang <frank.chang@sifive.com>

Rename r2_zimm to r2_zimm11 for the upcoming vsetivli instruction.
vsetivli has 10-bits of zimm but vsetvli has 11-bits of zimm.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-72-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 952768f8de..d7c6bc9af2 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -78,7 +78,7 @@
 @r_vm    ...... vm:1 ..... ..... ... ..... ....... &rmrr %rs2 %rs1 %rd
 @r_vm_1  ...... . ..... ..... ... ..... .......    &rmrr vm=3D1 %rs2 %rs=
1 %rd
 @r_vm_0  ...... . ..... ..... ... ..... .......    &rmrr vm=3D0 %rs2 %rs=
1 %rd
-@r2_zimm . zimm:11  ..... ... ..... ....... %rs1 %rd
+@r2_zimm11 . zimm:11  ..... ... ..... ....... %rs1 %rd
 @r2_s    .......   ..... ..... ... ..... ....... %rs2 %rs1
=20
 @hfence_gvma ....... ..... .....   ... ..... ....... %rs2 %rs1
@@ -671,7 +671,7 @@ vsext_vf2       010010 . ..... 00111 010 ..... 101011=
1 @r2_vm
 vsext_vf4       010010 . ..... 00101 010 ..... 1010111 @r2_vm
 vsext_vf8       010010 . ..... 00011 010 ..... 1010111 @r2_vm
=20
-vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
+vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm11
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
=20
 # *** RV32 Zba Standard Extension ***
--=20
2.31.1


