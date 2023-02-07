Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAE968D03C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:11:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPI7O-0006Q5-Vg; Tue, 07 Feb 2023 02:10:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI7A-0006Oj-C2
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:10:05 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI78-0008RS-Fn
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:10:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1675753802; x=1707289802;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C7UyNoLtd43Q7ZvkD7nzVoBCaDAdw9MFAAq8b0QwQB0=;
 b=koSTilNUYZF3KGO2m6tS9f8Bpf2XSixYmBjhJdmwFLZ4MCZS6q6XqktJ
 ylrB+oSSWhjnN4djjPemJKljcQUo54LKT28FawbbXcTjqFs4IFgr+EjOr
 +MtV+8VmTJ5QU2iKWPveO4dvyiBWPti9W9noe8kI/BBR8yZlopidWB0Mv
 QT9BxAd9LTm50we5GUa2FxgSPgyaRjt1ZT+1s+CqB5Fu5ATpYHpI9C7HB
 bEWJSs5ced41xBn56+G5DKY2935e9sxFbonHH0z1LulciPZrivf2IxTDF
 quZuOnkUIvlW6M8TpQm4oYj3ISRNo9Ah4CC3oeqzSZS9xnQLC4aWbbtUd w==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669046400"; d="scan'208";a="227657452"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Feb 2023 15:09:55 +0800
IronPort-SDR: JOO44ngbdUwYPu3CYp9KUKGPlEeZIt2tip78yG3eDs2jEjPGeU2R8hDZdoDOy4HC8ixNwJ592B
 pWMtaUJmAmPUQZeleik5SLNxQEQ90JT28/jRpU0SazrcS0l3pOKkb5k7MBiq+iRrhMEsNPf9v/
 9LLD/NASvMrl87TJANGx/uJYEYnTL4MYtkI3FodpiZupXn+ayx3EhSCCspB8Xb0H8xOOSB6K6Y
 FjKrUzqxCT77Fttr36OgEWZ9XOjYf7o5Ra/Ucv2a6A2gd9a+ZJcNBhit6IAd2BNqVFOWhAww3P
 U9U=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 22:27:12 -0800
IronPort-SDR: yJD7EBqbNYuMgn4wvRBn22BNL+HTzoslphSnBJ2n86ZgIPmyd1OB7O6qiGv0rZ0cndeAARhu99
 Q2TIN4zra1opHSAhfHGwEXEg57HwSmoMd2SUlLlA+gENZF3GOTUSc4Ko/KFO5UtOJtMU5nEbCd
 DUUeYW/g4WXyDcSOwD0jil84RskCJx/Nj29wvU/JJfSuHBzYXc5tEiS0NekpoolnvVK+dpfhvD
 55a83vtZtHBbfKh6pLbPqavQbATADEhy3+gvXhEzLlapzsk58wi7Fb+IE1z0Bgi63KCGJxddu6
 OtE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 23:09:55 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P9vQW19vGz1RwqL
 for <qemu-devel@nongnu.org>; Mon,  6 Feb 2023 23:09:55 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1675753794; x=1678345795; bh=C7UyNoLtd43Q7ZvkD7
 nzVoBCaDAdw9MFAAq8b0QwQB0=; b=R5PNIEptPki6wG6x9+jGs+NiWnEwmQUoHT
 Li8MlSjSCd3wG7pTRvCizDtaiLZrVQcawppfTbC0BLJ18TJjfKhCKadwrEaC2Z2O
 GFP1OxsOPDKHO+sWr6rIHfq56bwyXhTiq+n3ohqVQaDj5TyMrbHgc2fMH4b5k6kU
 QzChvYfMD1Stk4Ksp6UV/q6inLSeF4lzUTkeI8+7uyvlHBug89b2zXklyn/kRC6t
 U8qvu1bpH214il4VBVVKDaUxCn26Ufn+NzdUc7eawhVoxfEdkl47rvEU99bvLnon
 QvpSsolNtcZGIzrlyk6EYIEYtQ5SC351c8XnlcTDqRDqGJcpdLVQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id PtjWY5pJ1Hz0 for <qemu-devel@nongnu.org>;
 Mon,  6 Feb 2023 23:09:54 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P9vQT2ZVwz1RvLy;
 Mon,  6 Feb 2023 23:09:53 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL 03/32] hw/riscv: boot: Don't use CSRs if they are disabled
Date: Tue,  7 Feb 2023 17:09:14 +1000
Message-Id: <20230207070943.2558857-4-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
References: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=395dd5341=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
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

From: Alistair Francis <alistair.francis@wdc.com>

If the CSRs and CSR instructions are disabled because the Zicsr
extension isn't enabled then we want to make sure we don't run any CSR
instructions in the boot ROM.

This patches removes the CSR instructions from the reset-vec if the
extension isn't enabled. We replace the instruction with a NOP instead.

Note that we don't do this for the SiFive U machine, as we are modelling
the hardware in that case.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1447
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230123035754.75553-1-alistair.francis@opensource.wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/riscv/boot.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index 2594276223..cb27798a25 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -356,6 +356,15 @@ void riscv_setup_rom_reset_vec(MachineState *machine=
, RISCVHartArrayState *harts
         reset_vec[4] =3D 0x0182b283;   /*     ld     t0, 24(t0) */
     }
=20
+    if (!harts->harts[0].cfg.ext_icsr) {
+        /*
+         * The Zicsr extension has been disabled, so let's ensure we don=
't
+         * run the CSR instruction. Let's fill the address with a non
+         * compressed nop.
+         */
+        reset_vec[2] =3D 0x00000013;   /*     addi   x0, x0, 0 */
+    }
+
     /* copy in the reset vector in little_endian byte order */
     for (i =3D 0; i < ARRAY_SIZE(reset_vec); i++) {
         reset_vec[i] =3D cpu_to_le32(reset_vec[i]);
--=20
2.39.1


