Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8102509800
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 08:49:32 +0200 (CEST)
Received: from localhost ([::1]:48692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhQd9-0006lr-R2
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 02:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQRA-00050u-JR
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:37:08 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:13313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=10363b772=alistair.francis@opensource.wdc.com>)
 id 1nhQR8-0007wT-TS
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 02:37:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650523026; x=1682059026;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mIE9dCUX/jW+hjEy3ZZiVtVl9b76i9LoJDy8JKCEnJQ=;
 b=kAHCqj62tOS01ow6TCAQPS2/VwybTt1wsop2Axv2BNOIph4l5PW0nnMg
 eLYZoRrPghM3TTIowtjGj7Z0eNHlsjgUj1icdZ/PgUTXY+nLLRKJsjWE8
 /FvemkbkJetTS3oWiy13NsVYXl+dCEgwES/Zab1t4IIisN4PYkZwNgdkx
 0Ek1SZXHTsCp2wF2sAwPcdtzwcT8X1dgmKFTXxJIFtR0AkzdZIcXJdV7w
 53MMcyniVyAJLsqGv5DIMOTTKUBXggEm6xwazprEgV3ZF5JP/BLvcAezo
 pr8CJYg3mY6V6LyvdtOFt7vSHKxcfiCCBzoHx7vJRT4M4PPNs5p2MEcaC g==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643644800"; d="scan'208";a="302639944"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Apr 2022 14:37:05 +0800
IronPort-SDR: JQg1ZGt2xEAhI1QhQkHzjN1qXHxcdf2sLHQzxv/m6rMWcEC7YKH1kRqnF/O0CXueyK61a+cgGk
 6mH3wtBMaSPsGfvbJS7sI+6sIVNtFyQNoWCiF03r/3HqRJNAEIK9Tu6gmA3PgOH8mgAsvCq9st
 efJ10hJMBUZ/ukYsZvwIvvIp9TI2u+5IwtubHqY6n23J+L7tas9W4N/MpcjEv+gxss13cSNfFn
 3+pMCneMbtexVKQ/0xPq2yxCRF6n+0dx8VfsnBN4kE8XnLuwEU0AqxUv7vrQmCmyUUvptgD6pC
 KxnJgnkrNADxyk/1a7f8i1lE
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:08:08 -0700
IronPort-SDR: UUVGqwCVpQZJbJwkj1GmGNnkR9MN4FxybTSeCZtPukNwy6qUZMieaofqzce6mSUf/kikM3s788
 hmwwiJhlInjVDUwsqHReN6gNaZ4hfQ6ler3/1EdEIeLjSgQgiCNQI/c3DOVHUhZv5gyp8qIdaP
 GmjVFQB/lE9wiO1KS0vFTeAHiMhklFgfV7QoMlV+409slCKH3LwoF5v+l1S9WduGFyANJfuSkc
 b5ptV1j5dxYgqZ/fvs/JBaOsmife2RJkLx45Kpj8R8M0o9h1VxlXf+orKgIuEEf+GnafWSg6Dm
 D1I=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Apr 2022 23:37:06 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkSWP3RgXz1SHwl
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 23:37:05 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650523025; x=1653115026; bh=mIE9dCUX/jW+hjEy3Z
 ZiVtVl9b76i9LoJDy8JKCEnJQ=; b=KwWveOEbe0PSsVU/YVEHO4MP2Vl9SL7784
 ezwv19bB1B3NEDMIq+sBwzvDO3YMtjNfbBYg7uVslGjwNuMlwbVgkRTJ3VqUIPl9
 Ne/eewdWpXjAHUbMOeBVfCZsDgM/CjVO8wLidNVwFAte937pLgQsrFKL6N6rtmu8
 ggEiwBvfZ5DiMn/s2fIvVIuzNJWLXn1ZVD/UomQi8EuzrYH41TRxN68x4Qic0Aai
 7LSuqnsijUmdpVj8rJXIpzSJmP+lHemtLlZ4ti1yuf/2+IrvvVZ/9xXpyY1/FnSp
 VEkimDlX7P1UWhYP7HAP8KM/akF8J8lSyw86PzId4UTE3zJS5h8Q==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id BNNeZPFEk2nX for <qemu-devel@nongnu.org>;
 Wed, 20 Apr 2022 23:37:05 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.119])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkSWM1yckz1SVnx;
 Wed, 20 Apr 2022 23:37:02 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Atish Patra <atishp@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 06/31] target/riscv: Add support for mconfigptr
Date: Thu, 21 Apr 2022 16:36:05 +1000
Message-Id: <20220421063630.1033608-7-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
References: <20220421063630.1033608-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=10363b772=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Atish Patra <atishp@rivosinc.com>

RISC-V privileged specification v1.12 introduced a mconfigptr
which will hold the physical address of a configuration data
structure. As Qemu doesn't have a configuration data structure,
is read as zero which is valid as per the priv spec.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
Message-Id: <20220303185440.512391-5-atishp@rivosinc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h | 1 +
 target/riscv/csr.c      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 0fe01d7da5..48d92a81c3 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -148,6 +148,7 @@
 #define CSR_MARCHID         0xf12
 #define CSR_MIMPID          0xf13
 #define CSR_MHARTID         0xf14
+#define CSR_MCONFIGPTR      0xf15
=20
 /* Machine Trap Setup */
 #define CSR_MSTATUS         0x300
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 1400027158..6590cc8aa7 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3110,6 +3110,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] =3D {
     [CSR_MIMPID]    =3D { "mimpid",    any,   read_zero    },
     [CSR_MHARTID]   =3D { "mhartid",   any,   read_mhartid },
=20
+    [CSR_MCONFIGPTR]  =3D { "mconfigptr", any,   read_zero,
+                                        .min_priv_ver =3D PRIV_VERSION_1=
_12_0 },
     /* Machine Trap Setup */
     [CSR_MSTATUS]     =3D { "mstatus",    any,   read_mstatus,     write=
_mstatus, NULL,
                                                read_mstatus_i128        =
           },
--=20
2.35.1


