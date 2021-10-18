Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BB8430EF2
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 06:37:47 +0200 (CEST)
Received: from localhost ([::1]:53932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcKPB-0004kx-2y
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 00:37:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=918244500=alistair.francis@opensource.wdc.com>)
 id 1mcKK3-0003Lh-Lw
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 00:32:27 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:53215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=918244500=alistair.francis@opensource.wdc.com>)
 id 1mcKJy-0007Jl-Ut
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 00:32:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634531542; x=1666067542;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cw3jbC2acfXXTGaYZW5mCXskhVw/6SE8x3quIlsh5K0=;
 b=Fityij5DFWz8ecYxlQ3NpsaT4pSQf1aOFSZd5nEnNWr5Op6WBzLhpQ1k
 nkhnXdum9VsmtgbTxI4DM3XBQHwAF5Py3c/KGQsCB+4IcK/NhNdbE6H2K
 SsMAtjxwRk7R9OuPSmn36zVA8DPJ9UDL8WwPZO2BmP8zK6Tj76VO/nwdy
 uKIbg1O2P5UKGHz/gmBDDPpnawaRpEAyZ3MLUtrOfS5Mzr1wlDfA/jGTO
 NLWT9et48jWEi6gfkxKP1l00FL9R+E0QyoBTUB9h7kemu0+SMkrmM9lVb
 mauRDHXXDRlLJvO3qyOvVTxZKvWo2gaDfB+JKABLLyfxorAN2yOWV9CTl A==;
X-IronPort-AV: E=Sophos;i="5.85,381,1624291200"; d="scan'208";a="183146763"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Oct 2021 12:32:13 +0800
IronPort-SDR: TSALEKlzPVezOH6ROqw35qAYdJbmSzF4eePLKub2F5Rb8MAdbBTX3dDz6eVvOex3C63xzciJfH
 H45uTgi3h4lBEJMx77j+exZNufUQHb1tAWV7zZgOB8e2Pbo/eoGnaNC4xSb+3J/lGrCbWHFfOp
 /rj+Fi9ZDmTGGTSlb3cxPF09OtRfzXqE2YsxkcoxlGxC3MBB86kEPX8rtdGkbn7EF59QsNZtpf
 dCrRoXwNE6Mv5qzRyl/7QfZ1SX25M2Z6LcxzYkWLWhkqFIPWHy2pKbRn35oK5WWt2mLPeazMVw
 a8NQpwrTkdrO8hA4xWybwz/3
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 21:07:53 -0700
IronPort-SDR: cxEm9tenrTStuLCAKjNo/yfi+k9XUVjppOcmRf9/04XyhSsE10oQfWxzOWYNjDS1+RB9nbMJ2i
 gl4dBt2sPTSWHxVjzyLIBImnVDk8vsvJGOSOr2FGOjjNCU+WgJzpha9R5t7rOLEAR8BPvIvCgB
 PBooyP2PMTwQlJ7EFhERiXVaVyWqPYUr19PmQFwg6/85yyV/17VVfMLPqVVA81E+3rYRGXn94/
 8hW1lnBpzKBg01xcqUj8uWNmITiafsV79pfXDhpyK/kBC5UCAc9wDDtVoQkTY5O5obpdfx0H1q
 5JY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2021 21:32:14 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HXkVj3yg4z1Rvlw
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 21:32:13 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1634531532;
 x=1637123533; bh=cw3jbC2acfXXTGaYZW5mCXskhVw/6SE8x3quIlsh5K0=; b=
 BSIoyScN5QuDNiS7vYTx7t9VaON7JMIVPyEdCfR/+UMsT/iqXSZCsM0mY4IxUx0j
 D3rv+qnoKUSv6fXJLNqGktOcOSpPanseYndgvidvIodfkbYpywgSGbv4d0zI9xt8
 VHAmwIMZHwRNRE2K8yx1ddUrWFVqL1fCFG/WyCx0D5r2Tj3mUduvWkRL1MhLn6j2
 vjjJmTsRl5/Oq/Edfds/DGv1FZ5h7ndA1d6aP8AdTIllYCqVKfpu9HOTdPc5dTya
 vJ6AWtG7UEz4oHxzDzCRKCWkprw5+wqq6KAsGvF6Fwov2t5oXARvchNmC3hKMgjo
 Ms9NLawLHDXEle67ZGl8NQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id AsUS8ROYDMLq for <qemu-devel@nongnu.org>;
 Sun, 17 Oct 2021 21:32:12 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HXkVb6Zs1z1RvlJ;
 Sun, 17 Oct 2021 21:32:07 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: bmeng.cn@gmail.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 alistair23@gmail.com
Subject: [PATCH v1 1/2] target/riscv: Remove some unused macros
Date: Mon, 18 Oct 2021 14:32:00 +1000
Message-Id: <f4d8a7a035f39c0a35d44c1e371c5c99cc2fa15a.1634531504.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=918244500=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Alistair Francis <alistair.francis@wdc.com>

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 999187a9ee..3aa2512d13 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -427,14 +427,6 @@
 #define SATP64_ASID         0x0FFFF00000000000ULL
 #define SATP64_PPN          0x00000FFFFFFFFFFFULL
=20
-/* VM modes (mstatus.vm) privileged ISA 1.9.1 */
-#define VM_1_09_MBARE       0
-#define VM_1_09_MBB         1
-#define VM_1_09_MBBID       2
-#define VM_1_09_SV32        8
-#define VM_1_09_SV39        9
-#define VM_1_09_SV48        10
-
 /* VM modes (satp.mode) privileged ISA 1.10 */
 #define VM_1_10_MBARE       0
 #define VM_1_10_SV32        1
--=20
2.31.1


