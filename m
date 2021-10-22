Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1616543784E
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 15:47:21 +0200 (CEST)
Received: from localhost ([::1]:36520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdutE-0005EU-1j
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 09:47:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdula-0008UJ-7f
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:39:27 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:64417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdulY-00013i-9W
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:39:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634909964; x=1666445964;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+blsV58pE8V4aRd/mxoZFyuWTYmOcGZcMQW8lUPKM0I=;
 b=EUjBOBeT70AjjKvThp80Ije72NplgsoBLEDb3dU46JwYL2kqtig2yJFU
 ehrHvZJSy7uH90mjduW34m99YL2LGZLGMyj8/Zk1D1ciDvwLp0AxyHzjF
 1x49TdawUDaTlAiApyDQP4E3Wyir3pPpv5jIv0ttW/+xfGUgXq1pKdwxL
 bwxYtZsLef8ALAHAnux10TU9ns/VmB9LehnWkfqMeJXPbLDY9FZ2EErXZ
 QtHiMwzKgfUXOe2ymrtr3qz6EWuvyvht1RAXxFGmNwbyIUa4FAU/Ph9Ko
 cOVayv4EHgGGPuOJOSL2Es2ymjr1vmdtcuworTIo6aVhcdGrWnPkCQZPY w==;
X-IronPort-AV: E=Sophos;i="5.87,172,1631548800"; d="scan'208";a="182632591"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 21:39:23 +0800
IronPort-SDR: gjJVSfMVly8jH2ssUFxBm3eEOBlCIxdoSgn3yt0xUlMo5TeLdFUTMYiYf70Qr+ZhaAiC5MOytL
 YWfATodomDIg+iSdpjcE7UYNSV5kU9vGntV6cDmV9tq1HP7ry6s6IDLqFfjaj7dNL3QnxFIRDc
 K3/AA/+KPePHRFeutTIq7wTRfdQXEnw3D5xGXdyMO6MY5rYMp33iBnGzVGbot+8uNf2jvzKGkX
 MEu3T3oBLpjZIwXHp8plxLRtn4zqQIrAbtbWztQaBTIErS1MYElqx1Zmio8Byarhij1xYso4y7
 bcgDl8NLEiEOQy+eWkpE+lfC
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:14:58 -0700
IronPort-SDR: qR9fQ1XchViRqVUj3gPtkNCfP5bcin58N3OE1BW7utGDwO5DxMrUsJVichHl90NU4RfQ4kdWpf
 nPkVgPpO+lOQ1mN/E0xyvFiAOODWXK4TNbMYPHgV/yzcAjsPAuI3iUTrvZg2VSLGBMGp7bCxw7
 fQoAUwJqgXfCeSDq7OE/7BJq4E4u0zbi7qJKi7hf0Z2fFDpzHrRv91l0K/K5wMyQuFIK4sBAtE
 vQpnVScQwcn/CDyXSFXggPhcmXb6dLXgmmHuuG34LVxO7Jx5RQLoV8qQ1MxXjkMTWN4qQlPreO
 /Tw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:39:24 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbQSC3mMkz1RtVt
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 06:39:23 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634909963; x=1637501964; bh=+blsV58pE8V4aRd/mx
 oZFyuWTYmOcGZcMQW8lUPKM0I=; b=QLOYhqHndwV8/fOrLN8CQAIw2cBs58Y32m
 KKgKjBD0NqZj57LNGXw57tj5twUdHLf1o0eqX4y6AjiLBi68afQ0iidd4r9vGpNH
 yeZw60hmu2hXsudIwtDCLoIaBFloP/pVfbTFsKenwvgzcLu04SL1g+nmLhrp/pEp
 l633Yi8Md3humvEKuwbBsJ4ufXZs4gxqq/PBdgXwlBTF3xhmqNAv5YRkqi1/kYCt
 eTijSedsxHf/rb6FLBuAzIXlba392eRNhTKulygk2/TbntN8zSj+dheDYYSbvqn0
 JCo1utgWbxHXk45hmiSPrTxVq0vaQ196VKmQYviFrOumF9NGjTrQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 0t4sExo3TpLH for <qemu-devel@nongnu.org>;
 Fri, 22 Oct 2021 06:39:23 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbQS70y07z1RtVl;
 Fri, 22 Oct 2021 06:39:18 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 09/33] target/riscv: Create RISCVMXL enumeration
Date: Fri, 22 Oct 2021 23:37:48 +1000
Message-Id: <20211022133812.3972903-10-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
References: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=9222bbd82=alistair.francis@opensource.wdc.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Move the MXL_RV* defines to enumerators.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20211020031709.359469-3-richard.henderson@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_bits.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 3aa2512d13..cffcd3a5df 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -364,9 +364,11 @@
 #define MISA32_MXL          0xC0000000
 #define MISA64_MXL          0xC000000000000000ULL
=20
-#define MXL_RV32            1
-#define MXL_RV64            2
-#define MXL_RV128           3
+typedef enum {
+    MXL_RV32  =3D 1,
+    MXL_RV64  =3D 2,
+    MXL_RV128 =3D 3,
+} RISCVMXL;
=20
 /* sstatus CSR bits */
 #define SSTATUS_UIE         0x00000001
--=20
2.31.1


