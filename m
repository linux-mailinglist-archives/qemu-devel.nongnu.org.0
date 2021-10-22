Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC0C43784F
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 15:47:21 +0200 (CEST)
Received: from localhost ([::1]:36616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdutE-0005IT-PG
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 09:47:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdum2-0000hz-Nr
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:39:55 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:39644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdulu-0001BC-M3
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:39:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634909985; x=1666445985;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gsNRy12OxPmsaBEkJDWQD9vc2OEoJ0pt5OX5v6VjZ8Y=;
 b=IxDL0TOofQWQcg5/FON5FNGXbtFMe2t30EnrzqqFcYZZJMnsRQ09zZE4
 LoURHDlRBRTURFMmxYRo2QN2zemUcZi6C3K2d119PfCYpFn9OXnSUDbjv
 6DO5miUS03VwHiRhws0mJp46X+SUCpZxProDl58PcP4SyaGd16pHpOI/w
 y7cCygE6Eoi7KELgwoVDzZVPCF2qXAIpH3U/zz33TexFbYaBxzAOwZD5L
 dRUdjBVhs1j2VPxld8ivQnJrABPcPQuQjhD/dUVSNbIHImbofApeGoY5Z
 yNKcR8Bm//x4mhPg70VcRBUvygzhC+GwfCavbiZzILdA0iBMa4Ak1VTWW g==;
X-IronPort-AV: E=Sophos;i="5.87,172,1631548800"; d="scan'208";a="183617854"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 21:39:44 +0800
IronPort-SDR: 4GE891NVBN5ySSQfxDkBFD3kNZNz+sl+kGPXT17qACPgAwKHXzbd8vnZXB2ZQ6W5ezTIjk70ZB
 ku1PEdiHiH7o5BLLxgutEDdV0pYGlXfDqNwO+/nCIWRguI+ZB2CODbsIEx6N8N89fOQztOkRM6
 5bw5eiXPIGHwwNnXCb2QjLy8hlZMWI5hLSCYtTnANUopUieKK6P0D5vo6blNLzABCINoVa+MST
 1BhyBVbqwYBotwqpx2uRKKh9zH6XRvlRmNWl3o4V3cStap6IP5W22Lhoi3dist7CVmJZ0gww6F
 tWVEYje2qx1Es3TMy5SHcIUz
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:15:20 -0700
IronPort-SDR: BdCWWWkoJ4jaDspi3k1q8b1xznZ6IA07aHKsiG2UDikeT/EMvtuY6/TF5aLoIIEODmh7pvR8Hy
 FNbgEAYavU9gqEljsyQwlr92XUD/qsUvP6eBqr6Luouxlhq4v0YHDIt4o9a3xlJsUNXWujmXSx
 ffFLwlJb4Ur3VaTh4ktZbVUNFmyQ0BZX4MuYYSHBy4+0zQtFDrYMtKJoSsvpiizv4lN1I7AcP8
 R2NhqudZc2yRpVSwEr/kl0g1kAhpQXPqdWZVCslG3xU0FEZJt6jG/jUcyzjVd+ocP2u8Cx9W5d
 Ivo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:39:45 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbQSd1kkwz1RtVv
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 06:39:45 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634909984; x=1637501985; bh=gsNRy12OxPmsaBEkJD
 WQD9vc2OEoJ0pt5OX5v6VjZ8Y=; b=TKwtD/FMcxI8pUZy15vy6ymlHcqhvXCNgk
 BKylbjnOangCv0l+j7G2dVFhQypd7Uu/w9AlWhecY9HpGAVLUFU4ku66j035TQZ9
 KT3oovKnhXF3n76BH4VsaXe+WN5972L5WEDHTFZXdJxugcQ+RLUuVybr9wDWNbpC
 fvnyvXtSnGOpbZNwVVmGqrXyj/qvQcMZg7XzkrICVL26ZYirH6Sb8d7waafQAcCQ
 bYdlZAoCv6svFzodLIpReMKWUu80I9DFYQ+L05ldmtSiZNGg695pivVq5dOvipQV
 C0XHA8Au373DtHKbRqEbNtCjAOJuXIDW5emUrHvat4K8LfyfHaMQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id UfB6Kr-wjBxp for <qemu-devel@nongnu.org>;
 Fri, 22 Oct 2021 06:39:44 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbQSX62zbz1RtVl;
 Fri, 22 Oct 2021 06:39:40 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 13/33] target/riscv: Use REQUIRE_64BIT in amo_check64
Date: Fri, 22 Oct 2021 23:37:52 +1000
Message-Id: <20211022133812.3972903-14-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
References: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=9222bbd82=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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

Use the same REQUIRE_64BIT check that we use elsewhere,
rather than open-coding the use of is_32bit.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20211020031709.359469-7-richard.henderson@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 45be491ed4..233131bae1 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -743,7 +743,8 @@ static bool amo_check(DisasContext *s, arg_rwdvm* a)
=20
 static bool amo_check64(DisasContext *s, arg_rwdvm* a)
 {
-    return !is_32bit(s) && amo_check(s, a);
+    REQUIRE_64BIT(s);
+    return amo_check(s, a);
 }
=20
 GEN_VEXT_TRANS(vamoswapw_v, 0, rwdvm, amo_op, amo_check)
--=20
2.31.1


