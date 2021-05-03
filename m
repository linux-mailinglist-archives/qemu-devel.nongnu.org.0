Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE8E372320
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:41:29 +0200 (CEST)
Received: from localhost ([::1]:57956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldhFo-0007T4-N5
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:41:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgrC-0006mt-Fg
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:16:04 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgr9-0000Fd-L8
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:16:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620080159; x=1651616159;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AqdonLUuZyYbToc+r7mOqmQfOKiL5G8dfgQnAVG1UWQ=;
 b=oTv82hnoTHIIFlhGuYIQBlAQnWkhQRglwrPsBMc7Blli5SKy/HoW/BVn
 nFN7/G52CmjTLEhmck+7K2tTHKn1crV3F4WaMwTpwIzZBPeezlNLzNBIz
 kwLxDdJWv8uIXWmk/uByeUdZ2fnLJafTn6uCSsdpgZIPWxbaq3mZwss6v
 P7wu+j42i68WRKKPRjryGLpOoah3HayJTWu2iRmbgWmLgBbNXkxgj8/WM
 rYrmJCbfGVpmmh6nWQJFimBVxmrZfESReEGEaoxZ8WpTPB7ACVv+boa33
 sMjVMekASNvEwCezQ7pVf6LEqTuYJCVRqqyDQEMLuWRgssoIQ7g7tVvgw g==;
IronPort-SDR: E6n5JoCxZaMgvHQQ/x0kaMD1wPEX59Ssh7v43/zcaYRgfroUCKPf1Xq/FSDtxyaCz7Ci8Yg8h8
 B0GB/oql8Y10bkT6un7A1bDsMUWEwdYvPCdrfd3CdrKDZD+IruRYUK8WIZXVc+Vv1QcGxvvl3z
 cmPzWCdm9I2R+aBT8v9aBur293tLrHMbo8z0xBvBq6uBmcwPMliRpnLl0FQSxOON4seOl9EGCm
 20+BZFXeuQN4v5L3Q2tQWp+dJkY4nvnumvgWQ9mEq3bHmfxZQoc2oOMEeFB6yY/tI2YYRjuCjo
 opQ=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278114692"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:15:22 +0800
IronPort-SDR: nWI2WxLkfDcc7tx3OcoUq4etoYOvqnFo4VpFd9l60/YAMRyjgYCptKPjzkWD/5p/RW8vZslqTh
 r48iUz6lpgNqTVY/HWxw5K7yNJz6c0I/aN/+WMADgxCqV5KlYuW4BacZX/H/upfd5V+9sfc99T
 I1sjGSMIOq4vvaSdry/pmxTrpdgu6BgykC7oIPAifzfTSXHWabOV4EMUuOlC8Ibtlz8BdHlhH4
 hpZgq7o35WGL3o4dDaKerv4Mcvlq9jtN16Vki4J+y/pDgKysDrCHZhaD6/10p2s2ltog4Sto6E
 O6EQiW1CpVHPQl6gQDo6HQq4
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 14:55:33 -0700
IronPort-SDR: gCXRcWANiI733h/w44fMIRfLNalp7gUFna0b0Tj6vjTmKwqJ8XpjZLlk70GJQnbATzPpvzpO5S
 cqlQz15+t3n5CdBs57HjUtCmvE24WzYL9rhOem2c29vuGxmm0pLRt/tmZK6HmSACS6cu4nLM0y
 +6md3iNE/6mzh75FkbCS/sIs0UCg1sdwIce0vzj/wei94pE7hf2jRU70fgYWBCd+2lUhLk7XIp
 xlEuBWWBCkdMR6EjAq6IcjRWqglfaRmKqS8NugOVOCVU2ote+n8dL5HgLHPhuypxFdlPwrvS3y
 oRg=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:15:20 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 31/42] fpu/softfloat: set invalid excp flag for RISC-V muladd
 instructions
Date: Tue,  4 May 2021 08:13:16 +1000
Message-Id: <20210503221327.3068768-32-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503221327.3068768-1-alistair.francis@wdc.com>
References: <20210503221327.3068768-1-alistair.francis@wdc.com>
MIME-Version: 1.0
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
Cc: Frank Chang <frank.chang@sifive.com>, alistair23@gmail.com,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

In IEEE 754-2008 spec:
  Invalid operation exception is signaled when doing:
  fusedMultiplyAdd(0, Inf, c) or fusedMultiplyAdd(Inf, 0, c)
  unless c is a quiet NaN; if c is a quiet NaN then it is
  implementation defined whether the invalid operation exception
  is signaled.

In RISC-V Unprivileged ISA spec:
  The fused multiply-add instructions must set the invalid
  operation exception flag when the multiplicands are Inf and
  zero, even when the addend is a quiet NaN.

This commit set invalid operation execption flag for RISC-V when
multiplicands of muladd instructions are Inf and zero.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210420013150.21992-1-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 fpu/softfloat-specialize.c.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fpu/softfloat-specialize.c.inc b/fpu/softfloat-specialize.c.inc
index 9ea318f3e2..78f699d6f8 100644
--- a/fpu/softfloat-specialize.c.inc
+++ b/fpu/softfloat-specialize.c.inc
@@ -627,6 +627,12 @@ static int pickNaNMulAdd(FloatClass a_cls, FloatClass b_cls, FloatClass c_cls,
     } else {
         return 1;
     }
+#elif defined(TARGET_RISCV)
+    /* For RISC-V, InvalidOp is set when multiplicands are Inf and zero */
+    if (infzero) {
+        float_raise(float_flag_invalid, status);
+    }
+    return 3; /* default NaN */
 #elif defined(TARGET_XTENSA)
     /*
      * For Xtensa, the (inf,zero,nan) case sets InvalidOp and returns
-- 
2.31.1


