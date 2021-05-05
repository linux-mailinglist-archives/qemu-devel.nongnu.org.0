Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B1A374C00
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:36:21 +0200 (CEST)
Received: from localhost ([::1]:55748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leR40-00005b-Ei
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:36:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQsY-0008Qx-Pk
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:24:30 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:33229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQsX-0000cg-13
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:24:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620257069; x=1651793069;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8y3Un5Hxd2E2PcjnIHIP4w4G78fYCc51KoJUltBBqoo=;
 b=Skc6ebu0WBEJvnlPFmgpuHzf9MNvW9inghIgWfawAE8vfpBv3XGhJPf/
 Gvsntkt0JS6LgKAHYHrJXrgBLpKDXOsMQHuLOWPjhL5li/fP1vupGFXVI
 89ffWx8Vqb/ia1PjrubNjTl08M2l99OZ8qhFQB6euRdQJZ3LXzxEdWQT+
 kJnfQLYzbuWDuJDqOd2X6dAn69Sj6UnjtNyciamTPFSRJgZcUvcvIXELq
 ri9nefaYARjWh9J8SlYdIUpgIlC/J0WdzmajctrAAAwDaT8Qx5H1S5u9C
 G5VRZKKb7ExdGS95mpQn06SskBIvCepv3Fl3wmkG47xjsrJVONq7GeNG6 w==;
IronPort-SDR: INnOVLT+TLMjI2utwLQbuFxNujgb47IdqQEloZrpNUfKpbxcs3BUTez1I53cDPP453J+pDnFJ9
 I7QdZ6+lzBpFCTFAB/xCcqxvu21t7GvS+ZPqpGEFaLeDf8qf9OUrz+yweRynJqSOx6VYc494gW
 1ouSGzMM24HsPY/YxhkoopCCYDf7EAIozFeka8fIPagiHGVf1sTZgkNAUuNJkCS+y27yA4Tcpk
 hFK8ow7dBRCgY+KF7bEzAA7D3rTIlLwkVOAeSC7+sBOBHSD6ouqoB+qbvFZYCluxyTwtjMGFxM
 IMA=
X-IronPort-AV: E=Sophos;i="5.82,276,1613404800"; d="scan'208";a="166585944"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2021 07:24:28 +0800
IronPort-SDR: vhOBYrFr4j2y4/ZWq7+iqEKSOgT2/pFn0j6VZ8F2GFHM7hSsO0CA1IMZgNkaqHw6PJtC4U7Jhk
 ok8ev0vd0/ICT/4RlKPaIuJJxYl2/2CXFwyA4Wj/uMiZe9PY7TS+elZnpnMmuhedVBnrBytqEf
 5Tpb7uhUut4lFJXTIKlB/QnLnxx8IEh9pAR86BJxD14qpxHphNEpusGdPWv87RggMgUm+TxXh5
 nAxAPS30FHnBP7LYI3Uz3sxW4RO1IL1S8f+hH0ziv2ayEPW4NpGlDqxfrUeTQSGel41PF/P5mo
 ftaUejr/c5wiKHDkgwmZ0Jq6
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 16:03:09 -0700
IronPort-SDR: Z8nhPd5AikBiFHzuwQ5nij4+tRF+1R2FlkluNL7uJPLuSu/ENvMqzf74b9s7FTCshef+rZsHoN
 YWkApFrvcX/UPp9qCjBY8fTyMnisxXaWTSlDK8udPTsPDRO4slR8XUbuBmkfkss9ILMOeCjrvT
 oJA/jKF6uJHNrUyY0E+beto+8I5lhZ41/0rbKa2Ooe3dms1KSMkj3uPifdxZRN0omraYEoaVJo
 YzYGJ3RzH3YbIwc1sbKixrwrSAr+ITKP9cNQhfuL4OI9V4K2Nm7P1KRZQvOqv/zof3mBiFsAV8
 WSY=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.46])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2021 16:24:25 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 21/42] target/riscv: Define ePMP mseccfg
Date: Thu,  6 May 2021 09:22:51 +1000
Message-Id: <20210505232312.4175486-22-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505232312.4175486-1-alistair.francis@wdc.com>
References: <20210505232312.4175486-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=752564754=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: Hou Weiying <weiying_hou@outlook.com>, qemu-devel@nongnu.org,
 Hongzheng-Li <Ethan.Lee.QNL@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, alistair23@gmail.com,
 Bin Meng <bmeng.cn@gmail.com>, Myriad-Dreamin <camiyoru@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hou Weiying <weiying_hou@outlook.com>

Use address 0x390 and 0x391 for the ePMP CSRs.

Signed-off-by: Hongzheng-Li <Ethan.Lee.QNL@gmail.com>
Signed-off-by: Hou Weiying <weiying_hou@outlook.com>
Signed-off-by: Myriad-Dreamin <camiyoru@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 63245b559f477a9ce6d4f930136d2d7fd7f99c78.1618812899.git.alistair.francis@wdc.com
[ Changes by AF:
 - Tidy up commit message
]
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 target/riscv/cpu_bits.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 8549d77b4f..24d89939a0 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -220,6 +220,9 @@
 #define CSR_MTINST          0x34a
 #define CSR_MTVAL2          0x34b
 
+/* Enhanced Physical Memory Protection (ePMP) */
+#define CSR_MSECCFG         0x390
+#define CSR_MSECCFGH        0x391
 /* Physical Memory Protection */
 #define CSR_PMPCFG0         0x3a0
 #define CSR_PMPCFG1         0x3a1
-- 
2.31.1


