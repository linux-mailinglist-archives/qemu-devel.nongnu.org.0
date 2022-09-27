Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0765D5EBB7C
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 09:31:23 +0200 (CEST)
Received: from localhost ([::1]:55194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od53o-0004Dq-SB
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 03:31:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od48P-0005k2-6k
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:32:06 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:44585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od48N-0001Ix-07
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:32:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1664260318; x=1695796318;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=55V6njmXdEsCaFO7pLGWF/knEmH302KisFRpog8umNI=;
 b=biykmsKBv01iqrrnnKCXHSxFIfPjWlqoLQes5L+NqP9MOPxCUMF0FN33
 iYOuzFjGpiEp62Jnwt7sJUFdpDlaaZyx4ZciltWhBfWGL7s0XNyOECF/4
 seecWSeb3aO/0VNloHInWAIVcqf66v13qFLxxPThCER5PN2q0iBEA7f9R
 xzPlLtMzKlkwQVuWcGT52OUJIeUia2qItzTyCNmw1Uzre2oR3sJmQkOri
 UsxU5wZ3oF2VWrubIZTlMakIENIqaQrCK87E1fvuHIMTarBD8Fxg6w43P
 mlTrZDUUNcRRdRbbn5Dic5RyaJVSoPnNOCi2XfmG0pt8OAAWanXuL8jtI Q==;
X-IronPort-AV: E=Sophos;i="5.93,348,1654531200"; d="scan'208";a="217530915"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 27 Sep 2022 14:31:38 +0800
IronPort-SDR: n1uP5HgqMThYu2Nil7q3GIRCpl7Dm6OouC4GKs9fqEbIU+TETRClorwz+qWu+HGHiI9//siqwg
 M+YkAg1X9M03k9CE3ICLFCkwjXUbSfdljwwrg0ly6aNK3RTec861XTNE6+ISYUbrkzgi0D+puq
 hjqpkYJ+wgrQQgROxm07QbKsaDKZ8jS0lnmxa0FHZdPXgaI+I+c9J5wI6d8UR9agXAWhj50u31
 IK9qVcpQHaoWMsQV+NZmlNxq2sD5ghjeXZdlN30PWZG20fh5NzkbsxqrpFWJZtDIKaCBilfN3o
 Q6tdN5R5izRzIcpRWucsnZiG
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 22:51:35 -0700
IronPort-SDR: Ei6zGvd9BM6KuXmGohlOh2Ou5KwORJfoxRA/gIVVfoK/o/xSCa/WgdZxyi+xH/DTd1Zgln0L/z
 Ld7ekGv61uuOswIdkLJxNdtTY6jkz7qJUTa/ek9EstwxzLOD+ErdWUpKmPE/WpRg2kGYmpMsMn
 +EGzBnqTZEgePdq9z7A2suSlLkGX6VAgsMOiNuEgO5fGix2IgMgdsolwQWA41T8R6PQHfVbj8V
 aEShOZY5TucTzCpAC0iuhmhu+81+HSxV+8NMCqwLxZGOTZ2zW0DqbjDtEUNX5E4WcbzJnvMwtg
 DnM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 23:31:38 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mc8sj5GDYz1Rwrq
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 23:31:37 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1664260297; x=1666852298; bh=55V6njmXdEsCaFO7pL
 GWF/knEmH302KisFRpog8umNI=; b=bsET8h5FMW/NNsiBKW8kiQpDBb3vVMHRx8
 A4+8oLdJeLWv/wY0N4jCRf3O4eiaJe7UuNKNTyBvSkGyEaBFA8zj23E1bHQLdKwT
 bUWDMZea3hfysj5ulztlJfNH7UwoFDJ/XI7Aic8Ns8MSnjm8Cq/HvMKuVoTShikY
 gTbcRxA0aRVKlvdEm34HNCm1uzejXnIdlOun/LvvlwVIc3gnhamPuGvwH8lFonAZ
 cGNN/30OEPbErw/CVYzat1+fC5vHS3Sn+Xn7cHBOoclbzTDshtCnGVhUZfZqq+kr
 KsHISPFrghUbnFT6xpzUu5uFoVE9MNhSoKE6rZQqlxCwFCCMnIEQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id PT_TWl3iTcmG for <qemu-devel@nongnu.org>;
 Mon, 26 Sep 2022 23:31:37 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mc8sg5553z1RvLy;
 Mon, 26 Sep 2022 23:31:35 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bmeng.cn@gmail.com>, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 16/22] target/riscv: debug: Restrict the range of tselect
 value can be written
Date: Tue, 27 Sep 2022 16:30:58 +1000
Message-Id: <20220927063104.2846825-17-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927063104.2846825-1-alistair.francis@opensource.wdc.com>
References: <20220927063104.2846825-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=262caef14=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Frank Chang <frank.chang@sifive.com>

The value of tselect CSR can be written should be limited within the
range of supported triggers number.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Message-Id: <20220909134215.1843865-5-bmeng.cn@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/debug.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 06feef7d67..d6666164cd 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -127,10 +127,6 @@ bool tdata_available(CPURISCVState *env, int tdata_i=
ndex)
         return false;
     }
=20
-    if (unlikely(env->trigger_cur >=3D RV_MAX_TRIGGERS)) {
-        return false;
-    }
-
     return tdata_mapping[trigger_type][tdata_index];
 }
=20
@@ -141,8 +137,9 @@ target_ulong tselect_csr_read(CPURISCVState *env)
=20
 void tselect_csr_write(CPURISCVState *env, target_ulong val)
 {
-    /* all target_ulong bits of tselect are implemented */
-    env->trigger_cur =3D val;
+    if (val < RV_MAX_TRIGGERS) {
+        env->trigger_cur =3D val;
+    }
 }
=20
 static target_ulong tdata1_validate(CPURISCVState *env, target_ulong val=
,
--=20
2.37.3


