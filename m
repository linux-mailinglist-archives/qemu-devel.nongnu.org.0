Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C08965FA23
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:26:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdC1-0001Jl-BV; Thu, 05 Jan 2023 22:14:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdBz-0001HU-24
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:14:51 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdBx-000892-Dx
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:14:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974889; x=1704510889;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lisI2/olqbPOcyDcVe0UviRfzjJJi4lTbwhC/Lww/qk=;
 b=DDnFBsJk4J7gN3WQmUHm6vEfo/GKhBT+ShNth/KMIgzkJsfgygcG4IY+
 FdLFMDIF7uruTWmaVEFBHuxb4Om3enMRicjexsFPUnlOZ9AYxUTY6ZXx4
 01L+ovEKWm5dnQLd+2JfkIQSUUFln1DzZ2JBPeO1nned12+hQJGUUzHWX
 0zSikssPBfzfhhfxADRFWqvqc/BvjQhsHt9TZqYVySBx+ZOX12fom5xlN
 CapofQXOblzxP4PO0AOR9CQsf8vjOA32Z9wR6rxe9nqOH0VOcP6UmpInT
 beWwmZ2wrEc2034cksK44UUcK5A2CdT92e3ioEm124gzV4ue2lla7oTp7 A==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254782"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:14:31 +0800
IronPort-SDR: npbEdBtKF24ehfmBXjrLkR/LqHBeLQTcKxWMVRbg7hfIKPkZxlrvUpucdSopam1ibB443F4e6+
 NPTDJYAZbNeIT7zVs8FRq073MSbdreL3X3ZgpaMhZDRKZCmAwgBy+2nvM7Zd954aa67+uIKOnQ
 rdEZ/b3mm8sdGYjlHYRxUBXgsqiMZsiEpbuhmAsSN6N+a467mfKY0LTuoZxDoEtE4BUdBaTVpz
 AzXKVX0bkstrxVB4OtvD1AGmgFyGr8jJjfi6A7H8lasHMVKyLXituB0DBk+eH/+5vWams6CaMN
 aFA=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:26:42 -0800
IronPort-SDR: TqmsH91JioE2e7RzPnuMP8cAxMvgORe0a6GyQUXi6yZEgbIhObHIsu2kdgh3o5oL3HQB5+y5Xe
 aC9nh7TbUe0f93gmbJFXoeogCmkfst4S7pxgAOSzNudstVbptLno63goHYzWH+3zUPCd3B7TbX
 rPJhT5bDeIZkrC8I2iTqniUcCIMYv8d22pJTMwIOkVkBHy7YWqj/evL4PEpEc3JIsKNjx6iw0d
 LcHewGHvS4OKKnZEUQIXek0i9gCDzdR8tdlN/OrZw0JBojfkTzNbQCmdPfyA9YHHHN1kqLy7fr
 CdU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:14:32 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7jg0yGTz1RvLy
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:14:31 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1672974870; x=1675566871; bh=lisI2/olqbPOcyDcVe
 0UviRfzjJJi4lTbwhC/Lww/qk=; b=n9tZD1j1J5CZT5JwczvCubC8LrqVnun/M6
 ihv2I1gw8wlOK+Lbk4iGbfucQeArGe0JPDEr4eliSTVPZld/7p8WmkVrCq2YGOom
 MorNEiBzXqy5W7uOi1sOIP2NnTL79oiq+ZMwfjtbf7d+7mfb1RZruspQR27ApkVE
 JxbLj3P6sSfOS7PQIz+SGCOLjcUI5GVTSle7gApOqVUuhQxOUG7CgANO1X5Ui/TP
 vfU9DQe1369hYbqV3ACYM+D+a8LW++zeVZED/W2Lf6cwD7LLwqNPOWYOENJVEy+z
 ARw7wtYyb5SvhUTzlhMpWa+6o1+ESfYZ7e4TbwZTVY9ti7W/quow==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id LgXQMGRBno_8 for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:14:30 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7jd4gFWz1RvTp;
 Thu,  5 Jan 2023 19:14:29 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v3 15/43] target/riscv: Typo fix in sstc() predicate
Date: Fri,  6 Jan 2023 13:13:29 +1000
Message-Id: <20230106031357.777790-16-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
References: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=363443eaf=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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
2.39.0


