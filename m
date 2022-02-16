Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE564B8250
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 08:54:11 +0100 (CET)
Received: from localhost ([::1]:54086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKF8c-0003ZF-3L
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 02:54:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDpT-0005qK-2c
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:30:19 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:59531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDpQ-0006Zz-V5
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:30:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644993016; x=1676529016;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=32il3/FXEqWt9Om01xQlWBhHPsrFjWspEJktojPne5o=;
 b=o5pBExL7ELmfvTzUCz5N/rNSr3dO64viTdZXZr35ap5pnoRy9/cwyMvy
 o4fbHJt0Z7ue2SQ3rDpOZIHK206xu6CBA0zPFhic1O/7WKJnYSNKrxbnj
 YbppXD7rmJihN0wmYTxVa7tGewqY7wuwQLb2wtnXhSZHxANCD2PrvC+ot
 JvMv7mueDMoJ2DssumUD4/hvKdTA1no7Sxrz123x40SPShQmPh+dOl5yl
 k2bmH4HqQfzSGUfG6syO5TiociyZV4PQOklAgGb19JnB5E21oPg1YPE1y
 Zs/AXHnc+XiXJa4lfcu8Qs2F6EvTHqWGXlq9iQOfkDz48jM/w71SL0/jc A==;
X-IronPort-AV: E=Sophos;i="5.88,373,1635177600"; d="scan'208";a="193072748"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Feb 2022 14:30:14 +0800
IronPort-SDR: Dq5k1rsAHLoBs9tNsGlcKAjLdyk9LptV2BfqDtvL0unDozq01dyFAp/a+TwkAmkryKlLfIXgnL
 otdORbn+FHzwOk7/uUrTazgWRfp5DUD7oLmIJsoJzhImOVb8uhQFYcn5PBvC4gCtr0qG/5q7Xd
 1sJn+pt+jEV2PUE7LV+v5JBvOz61uYasL3peoEsm0p4eR9w6rJ1gd4hyEIsSw0+QqqciiMy9Hs
 SBLVp+hcQI25YMcufqDqnFepu2b39KkzOu4Aqfk0cDMQiFAzA1hvdUvUDb0LabBMSEmOGUgWlg
 66Ipdo2LW5cw082NqcwoE55J
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:03:03 -0800
IronPort-SDR: X44q1mY1RUpXY5o7u1icsZKKQpRNAMcr8P40j+mJvM3cM3LCLVTpkqJkOws06RWhOyS0AWx0YR
 JegQIZRXoJfBDYsKF5kTmsqGHJjos5kOdz8Gpm43lnsgsCjDq7EPI6CTUJuTXRyTU4Xczg1FKA
 mHGkuhWEakyaZO9hfeTJiDn5kvfR0P/feaZvjl6gU6IhSn8tm5OUnAK5Gck1N/POjTX8hY6K1Z
 nKDhIwbnc+ZVsgOk+yV/zPKi2kvdHLrF/iEUnSc9CwlTzSYOE3o2OLpC8onrsa6sR+VKaBsy2v
 ehk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:30:15 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jz7P25npjz1SVp0
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:30:14 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644993014; x=1647585015; bh=32il3/FXEqWt9Om01x
 QlWBhHPsrFjWspEJktojPne5o=; b=IynmICDSAW0DbeOGcgGEa85aRwfwtKN+GV
 ITtMeIcOEIPYH1G5VmtwJkCK0Rt71Nz9aUCQYfkytcUUPvcZd9rehQMk5mumclYt
 wIGvM35dlgADZJJxmgdXHBq9OADIbWpygWqshNLzZQhyjrh0ip4wH29vVKcKY8Yx
 zk9w0jZK0w1qerFoHdfGrWmyoKEgsIBLXy5P4XdWXJIAiVRVo9jmY6okto3lUHzA
 1hgI/wsLjktG77y32jAdiU5Sk89ptiTGraSi9ewybVnuPJXuoVkPH/kVz78V1p0J
 XDCG2RDUjJNlyEMxtodpeVgJkjTD4TQ9YkU6kZxMSDZIFXz7EXEg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Ufy3UlFnCUjE for <qemu-devel@nongnu.org>;
 Tue, 15 Feb 2022 22:30:14 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.97])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jz7Ny074Dz1Rwrw;
 Tue, 15 Feb 2022 22:30:09 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PULL v2 12/35] target/riscv: Fix trap cause for RV32 HS-mode CSR
 access from RV64 HS-mode
Date: Wed, 16 Feb 2022 16:28:49 +1000
Message-Id: <20220216062912.319738-13-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
References: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=039576d22=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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

From: Anup Patel <anup.patel@wdc.com>

We should be returning illegal instruction trap when RV64 HS-mode tries
to access RV32 HS-mode CSR.

Fixes: d6f20dacea51 ("target/riscv: Fix 32-bit HS mode access permissions=
")
Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Message-id: 20220204174700.534953-2-anup@brainfault.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/csr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index e5f9d4ef93..41a533a310 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -186,7 +186,7 @@ static RISCVException hmode(CPURISCVState *env, int c=
srno)
 static RISCVException hmode32(CPURISCVState *env, int csrno)
 {
     if (riscv_cpu_mxl(env) !=3D MXL_RV32) {
-        if (riscv_cpu_virt_enabled(env)) {
+        if (!riscv_cpu_virt_enabled(env)) {
             return RISCV_EXCP_ILLEGAL_INST;
         } else {
             return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
--=20
2.34.1


