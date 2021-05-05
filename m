Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD83374C08
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:41:33 +0200 (CEST)
Received: from localhost ([::1]:43730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leR92-0006nA-Lk
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQtN-0001AW-0w
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:25:21 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:33271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQtI-0000ys-1N
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:25:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620257116; x=1651793116;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AqdonLUuZyYbToc+r7mOqmQfOKiL5G8dfgQnAVG1UWQ=;
 b=XTlEm1OdW+EoZeZ8TaamiRR0ZU8eT8mAYIGjgMI+l8WmyUdcapQELfkN
 AZm/4E1Y016aGckT3tdZ/qwy4cFsIXxhg/rrbaZY97BlvwcMT5T1c4eF6
 vrmzreznW6iRTAsNyzCo9Euuw0LLcep2XH1NQ68fyAcQI2O0jtPT16+3w
 pZH5lER/IpEnshZfxOUKqp9Kte9TWXz24c0Dg5s88mGiCmSyWRHgfoPxc
 UbKs+ZvAN4hBE5AWdksH8SuqJR7m5qzKe4y6Ul+/hLw3ViMFUlEwUgpJj
 f/gScEw0oeHquGvhoKhlseGpfeqH0stIp3beHpdiC7QjiIuUuPN+9zS/T A==;
IronPort-SDR: lvxv0WasdpSAo0pH+R3/yBWUT0fWDBO4aX2vZ7Kr+umbk+syO+ji5AJVOk7+LCKxkXU7v0bkfA
 jRsv0/k1Zl6IrqayJQOj3Kvoa3bPMza56jAQBqSAnx3hDL2itsKQ/8IrAMKYGJzrdF3/hDTtaX
 VSdSu1x9iS3cN59SAN9yfdfDz1vTSSM58mnp6lmmE6/7RJ5OkSC0+LN4paXMePT5SsngX9ob5v
 MACeFGqdTAjwDvQECWJmW3yM0Ordf8ZJqMj4W3lbfHRvaOG6mGnnnd7NRkm45aOvX/ySLCETIF
 FlA=
X-IronPort-AV: E=Sophos;i="5.82,276,1613404800"; d="scan'208";a="166585997"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2021 07:25:02 +0800
IronPort-SDR: ayg7mT2XsYX3dC9DT/cCYd4GzyrgTipKitev3iSX5w5ia7cdAGhheLZWzP0CdPrkG+gQkCoPuA
 WL7aGV53iSfAR7K7SqrqHT0QqU30AXGfe389Jtro8Dx/DA2We5v4ha2CMdotN/p0FgtNi7JuMy
 317wTJqu0Ekuxsi+scc3xyxTkq+3Bx+PXoc2fCwv19Hnx2BX7EoPqe4833j7DUdSoo7j0GYGmD
 +CM/+XgdP020eILV8RSL/gTbvX32MKCPRufHTphJJWYPZwuqjeJ7dBjpBvzTc0Ixjzf1w0B6Dc
 NGMJXh1IF92ZJ94MX7U8LpVu
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 16:03:42 -0700
IronPort-SDR: ApOcS4iZdVb/qcDuW7SoCHBEQRl3iBj0rrkebMjB3NzvH5XSGnQfLvN5beSy/fnJZhW4vZCKpA
 VNs9SvM24nUjN4Y5bxef6VBPEQuV7TmCFaIWmvYzV/crBpLBPomjOFAVMwgZt0n4bS07ZdqGee
 RU6kfHBdtVfAgJktAnDVMeJR+vcdC8sLlxm47Bu3Qr6glorLlBSyeFAjTsB/d1CXB5mZIJljCO
 H8cXzK0RZZBJ8U9mG3+ES36bjO9noaNx2lfrybFXfYweVfbcYnEzw7lD1tEtFm460lYZBsinCu
 Auk=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.46])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2021 16:24:59 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 31/42] fpu/softfloat: set invalid excp flag for RISC-V
 muladd instructions
Date: Thu,  6 May 2021 09:23:01 +1000
Message-Id: <20210505232312.4175486-32-alistair.francis@wdc.com>
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


