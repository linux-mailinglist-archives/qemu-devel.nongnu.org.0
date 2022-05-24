Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B071B5333BF
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 01:02:58 +0200 (CEST)
Received: from localhost ([::1]:46854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntdYH-0001RR-PS
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 19:02:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdH2-0007sN-SP
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:45:09 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:62474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1363756b6=alistair.francis@opensource.wdc.com>)
 id 1ntdGx-0002Yx-42
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:45:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653432302; x=1684968302;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9SufCANF8geHOkg1Chg5+Nle288s9EOyVpjtMhiXPNU=;
 b=aGJ74v0BAsUhhCgUJIjtzeFgw5M8ydJ38hSkdi8LCwX55u+Crj0i5tMa
 Yzw6FSWMWF1uodplAZxZn+pCFG+MsRwjsLltWb5tk0zapbhOdxa51mYJt
 XiegE5dxowo6oDwG/Z+dsnUTqCt2aaa9Do1dT4nCV9pJA+AtG3MvmF+LG
 I4SsZCV+1SKssTKFBiovRnTYamXxzWoEDBpNKoPSzcHbAxbjO0TZsPMGn
 CDTXitUyLhuOOmsnRmgu3g6cg2zic4QlBQoW7Ptjrr6vRq3WHbBvjCMfd
 lJwd1mbGcFKnJ5QyRyv18t1E1rVK3+1tyjanLcqaqwiuq82eUy0vaJEqw Q==;
X-IronPort-AV: E=Sophos;i="5.91,250,1647273600"; d="scan'208";a="305566672"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 25 May 2022 06:45:02 +0800
IronPort-SDR: mqK4IqxSaW8hqKPiITGATkGiYGN+HP/ZuVcyW8sowTVDEXI9TxJTh0PFPVVY6lNUgilw7iqqGO
 oBOeTqu8B8IlHi/wyOV2UF56ZfmkVCNlH51cxlUn62aOZuwkoEd4MogDUZapVegOvArIH5KMRR
 bUk2pdjDEoBS7ZJmxuEIfpt4E6PSykroJAAPRNJpcsLVEuo+wC9Deo+2AkWmIN70TNygxWiri6
 vYI0LV/Sg+GILhbVx63lh/NhzmjBOdQCigYsRAP3/tWP7lPAirsFPknsIW3ZwJpoNO4oVqijOp
 aebdyBns7T7fQR8rsr3gBBgL
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:04:34 -0700
IronPort-SDR: 75GBmvVRNUdTNfE4VSaAMX3yO3Ez5VU1Xj31/f+N8Hf35tbLf5Cp40xBuV8UpC+XT6ojaGad4m
 AXX/M8+6mXFnsZHGOXrvZjoxAE+c4cbWbVqkDwhdsXAr4Ndq2KL7wllG8RXsvmc1wUV+PEming
 K/rhrhsaCyaEHqBVr+qD4ZRfiBjsdD3PcsGBEaHRTwfX9oid0/UIKT21l5R5vgA0AiA9NVBSJS
 mu/D1UKb16Oc1ZpBlWRLBn6m7wy3DOsfU3lHKEPdIaUF6PRZI1kT8HBf1/Bhzysgfdp2Y5YKlG
 Hvw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 May 2022 15:45:02 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4L78R21HbTz1SVnx
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 15:45:02 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1653432301; x=1656024302; bh=9SufCANF8geHOkg1Ch
 g5+Nle288s9EOyVpjtMhiXPNU=; b=QjjPPodCvc4CGlOcoUe55JZknjv+IFelrU
 AdvJLsrpjthZoXpr+ZHFq/3iAwFrZP3R1sRV3YmMQHdk8HCGadwEXWGtE+yl1wKi
 mAL8Rg7JIyFRnIR6Um30F+p5O1t57tFsLUvkqfj/GqzBHDk+AUM+AovNaACQxVP0
 Os49GbvM1CSF6IsF5L4AvGxS8DRNk8oEEEcO3zXV7NtWYvnk82xHmf/WCWmH7Obu
 IoYUP2tiHI3Jdfga3TlkLKPiM1RlSUJJacQtyqaJsrR+zHjv4i11wE3RkiXpVdmv
 jqUUhJg49bnGrRPvh3d8FC7HPNU9YAT3Na/gCw1aAsw+QDaoiwYw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id l_sq_u1SdkLL for <qemu-devel@nongnu.org>;
 Tue, 24 May 2022 15:45:01 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.5])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4L78Qz6XDlz1Rvlc;
 Tue, 24 May 2022 15:44:59 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Tsukasa OI <research_trasio@irq.a4lg.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 10/23] target/riscv: Change "G" expansion
Date: Wed, 25 May 2022 08:44:15 +1000
Message-Id: <20220524224428.552334-11-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
References: <20220524224428.552334-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1363756b6=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

On ISA version 20190608 or later, "G" expands to "IMAFD_Zicsr_Zifencei".
Both "Zicsr" and "Zifencei" are enabled by default and "G" is supposed to
be (virtually) enabled as well, it should be safe to change its expansion=
.

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <d1b5be550a2893a0fd32c928f832d2ff7bfafe35.1652583332.git.rese=
arch_trasio@irq.a4lg.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1fb76b4295..4ca6a8623f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -598,13 +598,16 @@ static void riscv_cpu_realize(DeviceState *dev, Err=
or **errp)
=20
         if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
                                 cpu->cfg.ext_a && cpu->cfg.ext_f &&
-                                cpu->cfg.ext_d)) {
-            warn_report("Setting G will also set IMAFD");
+                                cpu->cfg.ext_d &&
+                                cpu->cfg.ext_icsr && cpu->cfg.ext_ifence=
i)) {
+            warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
             cpu->cfg.ext_i =3D true;
             cpu->cfg.ext_m =3D true;
             cpu->cfg.ext_a =3D true;
             cpu->cfg.ext_f =3D true;
             cpu->cfg.ext_d =3D true;
+            cpu->cfg.ext_icsr =3D true;
+            cpu->cfg.ext_ifencei =3D true;
         }
=20
         if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
--=20
2.35.3


