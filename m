Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B882674E9E
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:47:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIm1v-0002zz-A5; Fri, 20 Jan 2023 02:41:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm1f-0001uH-Pw
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:41:27 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=37747d9ec=alistair.francis@opensource.wdc.com>)
 id 1pIm1d-0004pk-TF
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:41:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1674200485; x=1705736485;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T772Us8m1gVIqd2SaHYeUWEzriOVRUmxs+boIsGHG+8=;
 b=EH3YlyneHIiHdU614hRLl6RUhIoAVSsQneDAtMr8GfHR1XwsX2gHYvm8
 V4EImugHtXPUJuEfjV3RC5+nEnqiQbqLjiutvvtVwJGvW+Ljus1M5urkr
 UJK31vEg4luKuQ42LBX+/ma6zOrGgqXIFOSFaQjhxM8GU0YwzgYCruoZg
 N8DGEVYeCe5XGpgSaXn1ppIHU4h4+Jb9WzyRe3z9PYHWDGvP2fFJunRWF
 g5HGLA8FMxDtKK+h9eniByyro0F4S8ZQs0nxVZla9DssNGNwX4i3B9V2X
 FdpmALtC7tx2s0h1XahLiv0UU27WLiNZ0xeOLKlZAEEnRpDjTwP1vcSzi A==;
X-IronPort-AV: E=Sophos;i="5.97,231,1669046400"; d="scan'208";a="221176764"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jan 2023 15:40:29 +0800
IronPort-SDR: 0EKbyeq4DcDmKBXpDbXKYCUCu9anW/w/5T3IAvYQOVHAQRdNCW67pYPlSGmQg5/w1NGiCQDAh1
 ozIu8H8pMLFy2k2eaQxRRVn8OAXrmYk84+0Yynirmn+ProzF0vdMnqnxNuyzGF0/+4EpLK1ERe
 pTfcrArECBUET1yUm9iyY0NwSZ1KWo1yem+K7fTTQ4qmysTON84aWzZZ8OTtDgsxyeuw+7YcYD
 gn3WULyxV7R/bNbhf3ACkacJxNBbxzSpmfgkBS2UKX5hagJctZS+CTZ5u7v8+wEeuUe1w6vK54
 H9k=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 22:58:08 -0800
IronPort-SDR: 14r6DdFTkzBNdIN3dDCvOiKEla/HH/6xvAbCC3JXsYsUJEdAh32Z7KomCmYnAHOaRBNzohpo/r
 6BvAlG0ehuyzmRANY0burrKRfKxnuYPcVBaROqfKhVt1LytdjSEe0etpdwe0N2akFkQxfZQj10
 tU5jWpyDp3aUZ6IdICg02x7d076Egd26yBJczUSUt25IcjHJvLUg9X2jVuZGkfmGOMnkzDwb8z
 vvq8PPgsx4eJ3ZqLf7sf6WjCoSCAMp/wyJbT44E/1CrxTeecNgnTriEYrYgaqWSy411JyGggoh
 1eU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jan 2023 23:40:30 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nyry55MzBz1RvTp
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 23:40:29 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1674200429; x=1676792430; bh=T772Us8m1gVIqd2SaH
 YeUWEzriOVRUmxs+boIsGHG+8=; b=JghP6dkcfkga/Cqw06mcGkw5zrXuJKsjZU
 U1voXDRDq2vHyerB8UULzczDrTZrYokyBSheCxhhgNQuBtMUN2PTuJr8itfM3/5p
 Pw4wG/96CTWaF/AC9+55WhV1GZkhluvAUI8FVq/+xCQYNtCtGRsVpdYhjUMymg1v
 FlVKHqej1Z1NwSfRgxPllWhOW19jgsFuhNCYOhPmSc54ILDZVzbTEwR6XUKo4H9f
 C0BRW3HoDxjEgG5cfka2YA74I8I4DsMW/L3yVIFiFCrc7l3NHg1Weza6jnZTe5OD
 8J/rbK/2F9GogcoSvVvMd9Wl5MZStDripu4XVaOw04shyLf6BiTw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id XPg7g5XKHGo3 for <qemu-devel@nongnu.org>;
 Thu, 19 Jan 2023 23:40:29 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nyry41fh7z1RvLy;
 Thu, 19 Jan 2023 23:40:28 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Andrew Bresticker <abrestic@rivosinc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 33/37] target/riscv: Trap on writes to stimecmp from VS when
 hvictl.VTI=1
Date: Fri, 20 Jan 2023 17:39:09 +1000
Message-Id: <20230120073913.1028407-34-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
References: <20230120073913.1028407-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=37747d9ec=alistair.francis@opensource.wdc.com;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Andrew Bresticker <abrestic@rivosinc.com>

Per the AIA specification, writes to stimecmp from VS level should
trap when hvictl.VTI is set since the write may cause vsip.STIP to
become unset.

Fixes: 3ec0fe18a31f ("target/riscv: Add vstimecmp support")
Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221215224541.1423431-2-abrestic@rivosinc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 270de7b1a8..62e6c4acbd 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1037,6 +1037,9 @@ static RISCVException write_stimecmp(CPURISCVState =
*env, int csrno,
     RISCVCPU *cpu =3D env_archcpu(env);
=20
     if (riscv_cpu_virt_enabled(env)) {
+        if (env->hvictl & HVICTL_VTI) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
         return write_vstimecmp(env, csrno, val);
     }
=20
@@ -1057,6 +1060,9 @@ static RISCVException write_stimecmph(CPURISCVState=
 *env, int csrno,
     RISCVCPU *cpu =3D env_archcpu(env);
=20
     if (riscv_cpu_virt_enabled(env)) {
+        if (env->hvictl & HVICTL_VTI) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        }
         return write_vstimecmph(env, csrno, val);
     }
=20
--=20
2.39.0


