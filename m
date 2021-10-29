Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7441743F7D9
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 09:27:55 +0200 (CEST)
Received: from localhost ([::1]:54362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgMIs-0004em-Fo
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 03:27:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=929275e61=alistair.francis@opensource.wdc.com>)
 id 1mgM6w-0006cU-B8
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:15:36 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:18015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=929275e61=alistair.francis@opensource.wdc.com>)
 id 1mgM6t-0001J5-3G
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:15:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635491730; x=1667027730;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uXZMUuGz8PVeGA7k0v699hnnvPnR8BIPKrSp1FBz7Ms=;
 b=rhkiiwhcy2ow7wtwl8VQ31cYci78mISluttpjnEf23KOq0qnCSP3FDgf
 +XVJCcMyozCTR9S8ucE5eZtkyYJUIzzHsCwP0ElFAlE9wFsNOfZKtWonK
 YaOcjf1e9MrV0MzdviwwsvuyaliBjlXbJtSKRd/JkS1mo0NuOj0p8EM1p
 OS2Xu/MdJL76pRyvQv+cxIE7btGB3izQxBQl/lGMDG6LRxWG4uHRlvBDE
 HXIB6K8DXSIWe6ITz5MmDu3p39c9uCiKXD7Vpj+dlkaXNg0thol4TbWsK
 YSiPDepWBvd3qqaGB+M9cWoqy5Eg7TAtZkngH4PyKUfes7Clr9OFeoSBP w==;
X-IronPort-AV: E=Sophos;i="5.87,191,1631548800"; d="scan'208";a="188934241"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Oct 2021 15:15:29 +0800
IronPort-SDR: mRcSTI7GtTk9hHvVM0rD3bCtdia/BOEUtRS4LoRZvHNNbsD33vLLmt/1ak8SymMAuquq1r/qrU
 i3IH2sk+rKR46apmwsjFL5/k1unU02Fdy0Egr6LM/RIBJqMxMFJiSw2mTOZBK1SbiBwzZyaMFZ
 HDS+oDyUW8LK3I1VOfS2mizxtFxyY/p5FkNk3UkUka2srhH9eGoj0k70O/NzTXRtCyvC1cY/G/
 XfZ66pUjd0+t2iIthSZxfdgftwnQoYjKJTMgTZht2T9QrVQBooixoapkk82Xs3J/FvDqn4VkBv
 x+Lob9CwZO2fYxVddgqqPE5h
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 23:49:23 -0700
IronPort-SDR: V3pVVUsBMp9s8RysvB7pzcalVhbUPolQ1IfWnkr9j62BFMbLvykoDDyUzloNN+rs1yh3H7yMaH
 2fbF/6g26KfnlRChyCPHmQEefwD6HEceANlBcb3InmfRL5KptkM9LsumeoQIc1Zf9qaCETr3JZ
 I2+ttgVhX5hiWkr8BQq2xXVXyHpiPp82w8F8ltEgLk6mGmKDkLKuLkzhUeiInaheZFR0O6I6LV
 eYyzE2rCGBXe/j2rT382sKJs/Harur7YxCGgNuVik7M0TjQnVVjeFsUeb6hkohsXPDnsOknqti
 Szg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 00:15:30 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HgYc12wg1z1RtVp
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 00:15:29 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1635491729; x=1638083730; bh=uXZMUuGz8PVeGA7k0v
 699hnnvPnR8BIPKrSp1FBz7Ms=; b=ddxtTQsDUk5YB4dY/X7VZ0lzgQAXTgiwzP
 kL/3mB7q/3wIRbdKFVBOsIkNE/+0yuHlVv12shm0OSKGsq6zu2mQ/R5wDu8g7SlH
 kzg3eNzjV2//0C9xYbrsmVoyKDaXICwGH2TajIpQLHWqIQX+oPHAQaoZQAXiA0CS
 JKX3ekTPi1L1a3DXLniHAS40KiUN9B0+KTSdmL3Iz2Wz4DkUvvv6usTwbDHkQI+J
 1F143SCdHbdK2JNcmvWBPh2+g5GwlWbv6nrxDB938JqOsxq+NICu5zN0ALD1RZj/
 4O+Cg3qhWwfPmLkHtVq+IAd8U6Aa8TD6Px12vSYvlLG8z8gExOaA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id I-DKjTC5QAUU for <qemu-devel@nongnu.org>;
 Fri, 29 Oct 2021 00:15:29 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.42])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HgYbV1c8Vz1RtVl;
 Fri, 29 Oct 2021 00:15:00 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alexey Baturo <baturo.alexey@gmail.com>,
 Alexey Baturo <space.monkey.delivers@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 11/18] target/riscv: Print new PM CSRs in QEMU logs
Date: Fri, 29 Oct 2021 17:08:10 +1000
Message-Id: <20211029070817.100529-12-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211029070817.100529-1-alistair.francis@opensource.wdc.com>
References: <20211029070817.100529-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=929275e61=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

From: Alexey Baturo <baturo.alexey@gmail.com>

Signed-off-by: Alexey Baturo <space.monkey.delivers@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20211025173609.2724490-6-space.monkey.delivers@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6b767a4a0b..16fac64806 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -271,6 +271,13 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE =
*f, int flags)
             CSR_MSCRATCH,
             CSR_SSCRATCH,
             CSR_SATP,
+            CSR_MMTE,
+            CSR_UPMBASE,
+            CSR_UPMMASK,
+            CSR_SPMBASE,
+            CSR_SPMMASK,
+            CSR_MPMBASE,
+            CSR_MPMMASK,
         };
=20
         for (int i =3D 0; i < ARRAY_SIZE(dump_csrs); ++i) {
--=20
2.31.1


