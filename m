Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5AA653907
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 23:52:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p87n1-0001Fd-Ck; Wed, 21 Dec 2022 17:42:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87mz-000194-1x
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:42:17 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=3472792e2=alistair.francis@opensource.wdc.com>)
 id 1p87mw-0000Xf-Nc
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 17:42:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671662534; x=1703198534;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SvE69aK7bAVRqVg7LOCIAVD1/g2aMYl/gyVgZLYkuxo=;
 b=pjg2mE288ogJf/w+aXXTHhnqCECNfCUZ+DiqVrDkCZYD2kaVIOhjw6zV
 lCfrq/0KmLgQd6Xu9nWYgvqpm2DTUkvTEivlnawg4t3QLrU9lG7plbxiP
 mC0s93jVeAF7cgUJNPaviCnAsQRwmhJvJ7N+yJ664QXoWivcB/yWSnwkV
 kVppCnwm3RG0/CC+wmdJyXWJepjPRtHWg5k6knGn6ihAQ1Q6C/ax8jCCR
 MDfFloadvZyZfszEZ3JfLMnz8hZScB+321Jy0TsDt+ZCCc5D0IU6MkXdL
 C6Jy9tGucyan5OeYRn+EEdjQQne2UXtLzPv0qnTstRxLBDZcRBZA2dbda A==;
X-IronPort-AV: E=Sophos;i="5.96,263,1665417600"; d="scan'208";a="323561393"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Dec 2022 06:41:26 +0800
IronPort-SDR: 3GDgH5wlkeju7PaaM4TKVHA9z9Uxhzi/CDCTTaZ2tVNGhJPZgTmmhsUoyKyFaFwfT8Nw9K2cN0
 LVmUL9FpOG+fwyolQTE0VGZ47LVWtZDTzcie+Zqt4zFo0H5vKB12DRTZMog6DsAHC+QtoeSaDY
 Uws1vQ2CUrVq2gxst0NwPGnTcmT2BJvDDEdNp93kw1dXJAO0Cv8jD9vKQzMMdr+NK6IErV8Pma
 P2uUv0fwwYMlivbC9PRxBooKbDDNxsoMGRq8XQWR+CyvwWPIc9l+VLTGjCQl85I7s5YgjZobkj
 GaU=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 13:53:55 -0800
IronPort-SDR: SS+vw8hef6yWCAj/qdSpCUvh85sDN5RXZb20EQBpSRIuw4+ZTDXgDtjLUV0bNjJKd/shP0nik1
 uk7SZEEaJJgMFF4ih0KjTrgf4v4rX61kmfZbkuD3TVKLTdWqMoIc76qHDCJTkEBE8/oLCAPV86
 hRNwbmaK6fNao0VfK8uldOdmypaXl5Ii+Nu/l4QOU8bW/xCzmgoxQ4tnYSM2r2MoUYdeGxFU8B
 XOSfSWER+bjAWxB0y14xGQ7+jxwRn4WYvafrc9mYMGbnH/au8tu8CCA48YBn1UV0LVk9zW4zQp
 2jQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Dec 2022 14:41:26 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4NcpMV24Mzz1RwqL
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 14:41:26 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671662485; x=1674254486; bh=SvE69aK7bAVRqVg7LO
 CIAVD1/g2aMYl/gyVgZLYkuxo=; b=egchbAuXZFKQfix1V/T9EbMtz2YtZle1uv
 5j7IFd4kR8Qr18bRMiqdi5MiNMqR1dcSmrXIPXFVrcNt2e4CwOGcQ4CvY1k+skBK
 fO1DDWRAiq5eaJm5+UQsyX6jwxcEtZRqFTcj6fb6B60tumP8jBQ7cCkP56h60zh3
 7nZECBa8ANpG4PrCvyJ5c0MlfA9MwZlvzd6S1MLtqt2MJoGBDAgTKf/09eKvp+lr
 JTkwTcQITfPBU2oykgltFrTl1VGob8kmvM5ZVldWWzLgIfobw6ZbLPfV78iUfV1h
 xkF29VBSYih/K+viWTYZzlgcTATze7rS8tgFykqkscYSPp6THGnQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id jDNwxKvblefE for <qemu-devel@nongnu.org>;
 Wed, 21 Dec 2022 14:41:25 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.8])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4NcpMS0LbBz1RvTp;
 Wed, 21 Dec 2022 14:41:23 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 27/45] target/riscv: Simplify helper_sret() a little bit
Date: Thu, 22 Dec 2022 08:40:04 +1000
Message-Id: <20221221224022.425831-28-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
References: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=3472792e2=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bmeng@tinylab.org>

There are 2 paths in helper_sret() and the same mstatus update codes
are replicated. Extract the common parts to simplify it a little bit.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221207090037.281452-1-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/op_helper.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index d7af7f056b..a047d38152 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -149,21 +149,21 @@ target_ulong helper_sret(CPURISCVState *env)
     }
=20
     mstatus =3D env->mstatus;
+    prev_priv =3D get_field(mstatus, MSTATUS_SPP);
+    mstatus =3D set_field(mstatus, MSTATUS_SIE,
+                        get_field(mstatus, MSTATUS_SPIE));
+    mstatus =3D set_field(mstatus, MSTATUS_SPIE, 1);
+    mstatus =3D set_field(mstatus, MSTATUS_SPP, PRV_U);
+    env->mstatus =3D mstatus;
=20
     if (riscv_has_ext(env, RVH) && !riscv_cpu_virt_enabled(env)) {
         /* We support Hypervisor extensions and virtulisation is disable=
d */
         target_ulong hstatus =3D env->hstatus;
=20
-        prev_priv =3D get_field(mstatus, MSTATUS_SPP);
         prev_virt =3D get_field(hstatus, HSTATUS_SPV);
=20
         hstatus =3D set_field(hstatus, HSTATUS_SPV, 0);
-        mstatus =3D set_field(mstatus, MSTATUS_SPP, 0);
-        mstatus =3D set_field(mstatus, SSTATUS_SIE,
-                            get_field(mstatus, SSTATUS_SPIE));
-        mstatus =3D set_field(mstatus, SSTATUS_SPIE, 1);
=20
-        env->mstatus =3D mstatus;
         env->hstatus =3D hstatus;
=20
         if (prev_virt) {
@@ -171,14 +171,6 @@ target_ulong helper_sret(CPURISCVState *env)
         }
=20
         riscv_cpu_set_virt_enabled(env, prev_virt);
-    } else {
-        prev_priv =3D get_field(mstatus, MSTATUS_SPP);
-
-        mstatus =3D set_field(mstatus, MSTATUS_SIE,
-                            get_field(mstatus, MSTATUS_SPIE));
-        mstatus =3D set_field(mstatus, MSTATUS_SPIE, 1);
-        mstatus =3D set_field(mstatus, MSTATUS_SPP, PRV_U);
-        env->mstatus =3D mstatus;
     }
=20
     riscv_cpu_set_mode(env, prev_priv);
--=20
2.38.1


