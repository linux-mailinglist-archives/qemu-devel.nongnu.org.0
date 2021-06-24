Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6FD3B2E87
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 14:04:11 +0200 (CEST)
Received: from localhost ([::1]:36494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwO5a-0006Fu-1y
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 08:04:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=802348aeb=alistair.francis@wdc.com>)
 id 1lwO3w-0003ZX-GN
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 08:02:28 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:53600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=802348aeb=alistair.francis@wdc.com>)
 id 1lwO3u-0003qt-4r
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 08:02:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1624536146; x=1656072146;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o1fMzRHfUIya9XuwqHf51o/1khK1Dly0k/KbCVjHkIk=;
 b=mYysrgb5c45R6HpuTLlpdZhVwZO37YoUd5z1r2Ps7i2bIHuqn0+ygP6f
 H6ep0TDe+YTzMseag4vv1pvPy0RF5WB1BHeXcToJK9ZidMFewAuY0vPWG
 f8jnKQwJ7Op85rLBqDv8vOJuDVq56g/lZZApLsELA4fqX81IQoSS1hiZh
 NePlGhNOTTfjEPDNAbWXxTT8Y0mYDrS/HLkKngJaW58cM1PN1iflQDU4t
 ++acmrfsFLJq6L4LRCXj1+RrjDCKUStCexlj56eRBhZI/aw+faELUJvHs
 qqjDNjiyg5ZAWhgd5+fBWpiN04hc5WMP22NM2RFL/dsVumXMYuVhqGXO0 Q==;
IronPort-SDR: eAOzwPQzyeYGvd6kab8uafqXxDUduMvveE5V85kd1TxrXTxHoca5jmGZo/HiM+iylwwuPJxbot
 2CFIryZ1ub8zoKbzM7kFPjeSlA6KrsBZiuB8GvFwcxgaph5cRvRSPbvKVVauXHvFfykvrT9dIj
 5VYE/n08NiQQQocSKMk/GPoc83mtDi8thCQJYLLH9IwqV0qo5rglwyT50CNGRQbtNvXcDdz4dM
 fWRclb5CynTcWj+nph0jxGicahFtaEjVMd+6Wmukqjprsxl4TkoZXu6+8HTFv6hegbt106EbJd
 PnI=
X-IronPort-AV: E=Sophos;i="5.83,296,1616428800"; d="scan'208";a="173360800"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 24 Jun 2021 20:02:15 +0800
IronPort-SDR: U4VSL8BKP2uIQYiDasokOqoI5Z7E4de4L5hBufs9VqtPJ+HijQFVF7NfuM/mNYmHvbIqqMUcER
 ma4N01hERcdJBbmdAaJpvcTQhrmXRK5q2vCK3FE+u3lrPed2eP0SV6PEcnLuXIq77GMKizfFV1
 qqPGDTGYnBEiZ5w98pIJ7xtxF9jd3Yhe1DSs6QpCHVj102LJsaxdTb+GyavpF+31ub97Sl6gYG
 WN2/D/mSLrLhC00uqEaayDr75zoRzbmfhai9a/3iJ9e51K+BloshouqxmehQ1iGpzptMyGaWrR
 v+khSyGzQMNL/WL2NlbUHQtQ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 04:39:30 -0700
IronPort-SDR: fBoln/6UP9RyZ5JcqlD8tE/+vEBXAzw66SGhsr8WrCmPogohmrkezG8Zm3QI93VxIhj7WxRUdv
 MHmzSTrguQysoEsNkSDVQLgfDT3QRPuWSNQAUegL6SQZxPX349x/WZ9U2qrtODxx9y2cvdw7II
 QjuwGAkP+62R+80Q/dkmuiYLk+v2PcWDl/oeKfdkPolsEtxIif9MSuosA4WdLneb5ZfHRI5Ci8
 QerWTCr4zpA0QstINlt6neTLavcYXOuA1hFUxYMqGcK6Sya2PiFclZnj89KyxPjzaW9BSl58fT
 KvY=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.248])
 by uls-op-cesaip02.wdc.com with ESMTP; 24 Jun 2021 05:02:15 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 2/7] target/riscv: gdbstub: Fix dynamic CSR XML generation
Date: Thu, 24 Jun 2021 05:02:06 -0700
Message-Id: <20210624120211.85499-3-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624120211.85499-1-alistair.francis@wdc.com>
References: <20210624120211.85499-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=802348aeb=alistair.francis@wdc.com;
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
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Since commit 605def6eeee5 ("target/riscv: Use the RISCVException enum for CSR operations")
the CSR predicate() function was changed to return RISCV_EXCP_NONE
instead of 0 for a valid CSR, but it forgot to update the dynamic
CSR XML generation codes in gdbstub.

Fixes: 605def6eeee5 ("target/riscv: Use the RISCVException enum for CSR operations")
Reported-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Tested-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210615085133.389887-1-bmeng.cn@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/gdbstub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index ca78682cf4..a7a9c0b1fe 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -170,7 +170,7 @@ static int riscv_gen_dynamic_csr_xml(CPUState *cs, int base_reg)
 
     for (i = 0; i < CSR_TABLE_SIZE; i++) {
         predicate = csr_ops[i].predicate;
-        if (predicate && !predicate(env, i)) {
+        if (predicate && (predicate(env, i) == RISCV_EXCP_NONE)) {
             if (csr_ops[i].name) {
                 g_string_append_printf(s, "<reg name=\"%s\"", csr_ops[i].name);
             } else {
-- 
2.31.1


