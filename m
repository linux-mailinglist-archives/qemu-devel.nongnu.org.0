Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFF43722F6
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:27:58 +0200 (CEST)
Received: from localhost ([::1]:48280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldh2j-0000Fo-T3
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:27:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgps-00058O-L1
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:14:40 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgpq-0000ID-Qc
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:14:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620080078; x=1651616078;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a2pAMi9hjX043zXsl3vowvDjpX05yv4JvKnsdJ74+m4=;
 b=odPUUpkARnISHf5Cn2HeHBNmuboRe/7Q+SHlfJ7bgPYjCo/QXmLVVPmi
 dtfRBF07kTYoQWbW/aiPj9l2j25VovPYfKD/6kSB+yI60TA31UnAA/tVy
 2YJ2C2vVvTxPKwIsBSUHFqor/LMAuo/y/R+dnXkhj9gjD8lOCu6ml4Eep
 dpTol3nHruC2hCNk7YFcks4e8V1DzzYDEEiAfB3pRV5uHjSJLTX3RMt30
 4aaKNU6wtqScUrczoTj298ScM5LoyZrCpvo6iG1ZYMbZasDgBd5UpqPsG
 5miQNR+yW3s4iGxNOSj11poIMeWLh0J79SlSRiVw9kJ9uB7If8tCzKJvS A==;
IronPort-SDR: CTPhRkuLCaLI9vCPq1SpNnwh32sksEDEoVeSdOJk7GLn9fnb9itv4DXGTDzn0qXmJEzCARGPVz
 p6013e4lc99Yj0MDbkDtCyeRk1FRVxG3yGNv1qvmU2GkOvU/DIn8emy8nC74pOt54Wiad5vgj0
 WIboBLmoy1jEdIZTNlFu9PKF1FUc5fTIOlmvw4UV+HmjcDaG0K81LD0P3QCi9EwzQV403AdnKI
 iwkaVrfEXUrzwFRb3dFeBGSBFqFD3J3RgAg+Sy0muEJU1REwI243Z8RVj2+V2Rmm+VkvEk5tec
 cF4=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278114639"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:14:27 +0800
IronPort-SDR: D3IWQ5WBUrE5yXa6FGulX0DE8HjQSGYF6ACdGca+W+Ud2ukzzKf+tpXEUxofEMCtxdN6nD+Fo5
 j+OseAgSERmCIVC2u8pVHjEDyPqC/tOG4LckoIUOw0E6MdpwxVq3caM/YyZJ36mGOBgqU0PhEw
 KcBaBN5hZhzFzY+3EPX79M8xzkNvPicxn9id48gvNBhKfkbIlpYpqVsj2/pK8xpi7j66xynk9m
 m3KZFkLZwM8pscOzpnR8ZgLTC8rXev8mpHnhyipSpzpC2XSdapB0ZKDoBJdN1iWa5ZsYzJOGNB
 3Zym7SX8KVRQExxSEJJDl924
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 14:54:38 -0700
IronPort-SDR: IBAa8zgSyJUvyukZGRnt/XhJ5x5p2HrRjVwVLitvb3MegF0TqfNfiUGwJIlcgHF8imCc+WBtpl
 yjifJosQnTCz135g5Dr9fSQAFsXmuP4ZRINf3vOuwb65SinRB8ZEQ1fc9fGBHEc2d7FfWPNzAk
 XRMJQliOWULCMxKi0ertakfM2meyvhu0zqtULLKhI6VbAaxKh2iK7+DcZu4d6VuVf0PUvf1zhw
 5AYc79nD4yo0e8cDvA44JR7onldyp9kjxD2QzkRavltpplMIYXnxD2vTDUGKdK0ztm3glzT9RC
 nzE=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:14:24 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 14/42] MAINTAINERS: Update the RISC-V CPU Maintainers
Date: Tue,  4 May 2021 08:12:59 +1000
Message-Id: <20210503221327.3068768-15-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503221327.3068768-1-alistair.francis@wdc.com>
References: <20210503221327.3068768-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=750139ea6=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update the RISC-V maintainers by removing Sagar and Bastian who haven't
been involved recently.

Also add Bin who has been helping with reviews.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Bin Meng <bin.meng@windriver.com>
Acked-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 6564ba829c40ad9aa7d28f43be69d8eb5cf4b56b.1617749142.git.alistair.francis@wdc.com
---
 MAINTAINERS | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93830817f1..6086322886 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -295,9 +295,8 @@ F: tests/acceptance/machine_ppc.py
 
 RISC-V TCG CPUs
 M: Palmer Dabbelt <palmer@dabbelt.com>
-M: Alistair Francis <Alistair.Francis@wdc.com>
-M: Sagar Karandikar <sagark@eecs.berkeley.edu>
-M: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
+M: Alistair Francis <alistair.francis@wdc.com>
+M: Bin Meng <bin.meng@windriver.com>
 L: qemu-riscv@nongnu.org
 S: Supported
 F: target/riscv/
-- 
2.31.1


