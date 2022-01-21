Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E03D4959F1
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 07:31:12 +0100 (CET)
Received: from localhost ([::1]:58622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAnS3-0003N4-E0
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 01:31:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmxl-0006qe-8W
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 00:59:56 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:9014)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmxi-00045v-K4
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 00:59:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744790; x=1674280790;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2UhdumAafk0zqHBDS9WXcmpaS5RFtVLeSKQ+NzTffnE=;
 b=nBerR3AcIeMDS+ZhQ61AhGQ1c2myRieo0JZjyYNnJCez0izBB9b4n+IK
 41d7YuBai7+n1iMJ5nEAX5a05D0a7G1TJysQbGQjyTJgC9p5z/FUCYMjY
 ODXMvtbqgQCQuo9JO5JPTFVDTvNbxwGbbR3bwvlVWo91vlqs9K+3MCUwa
 vQ/ZmzNi6Z9IuGg9eVDlMYmhSS+MvW5XwD3ORZikN21RoDFkpCr2TbpsH
 ZxBTi2J71xc9SOlgobLj7Zz7D6JCqkprpA9dzyug/i4dx+nMqG1nN5Efj
 Uujt8nyTSnBkmrezVI4Ei5Ummn0lUzfB3vhRPvpMZPrnU7Rn+Gw2HbPo+ w==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="189976535"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 13:59:49 +0800
IronPort-SDR: Q0IfZGLobU3lSNVLCFCbRupnAhlGs3n+uNNW2Y4AiYsKGHSxzirX8WR1iGQn0oE8f6ruDKuZ3l
 qDxpmp+tgNIhuHHA8VVk3yR2mKvvOYnMqJaCMYxYidc8shcOabISzCIMXVil8IYDVTG3rJvaEl
 s40+M50k3kIOhooARS3TioIsbETRKsSTJJ0rUJ23Bx//dVXJLHFvGr1FGkL4+q3EevZ18w53or
 mLresxEBv/Z1h0T10Xc1OVuu9c48n0pJZ/1Cq/MEKUkpn+6rqTeZt1C7lUi7NLv5eW3FaeNGk5
 xtMX/vTWCcvh/BZ4vwEywCTt
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:32:00 -0800
IronPort-SDR: gwQ3r5epcj7n5dWcUCT3E2MGuZkgvHCA7Q8pPX5GK1Hy+ftdpCxRjX8ak3BUw9hBSn3ArMrFqd
 7FErd44EAshkA4eFlm0aZ8S+BGjCr4HN674Chq8Uf2JRIUw0CvY0NixSkKriMplRf6E3kgO/33
 ZRRW+xea2d++wY4ok9zsCEd7xdk6Z2yvxcd0JaK/LeSE1GzBFO8+u9byyePvja+sH4tY/keqRm
 ltx54j/O2QZhFBEq72Up/ukc6S/YzeBL21LA/VZ3rlQ1GiusPSx61ye9iaJpmAoNJRUjxjDfjf
 87g=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:59:49 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7xx0VXXz1SVny
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 21:59:49 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744788; x=1645336789; bh=2UhdumAafk0zqHBDS9
 WXcmpaS5RFtVLeSKQ+NzTffnE=; b=moA1w1tNjPJACVFVLvWW0lmwjhbAV3z5Ry
 gXYUoqG1KVF0ngeQHd49ob1lh6XeCmi1lcMT0HUZfHXglKYV6dMjWuyLg5xaiusB
 g7k0P78q42nU1M+MDeFI0+bXHmwtp9n3RD5Bf//n4UUmiuMbv4HcaydGp9eJX1l4
 AEdTe0FeM0iRTls3iQYM+Al6NGncue+txcIbuO1lGv6h3v6e4+VOjmHP9igsM/e6
 222CW/hn53WODsXVvYSquMsARTscKaYo48vEwKoFfOLy3fGfJtVFfQze+f+Q83PZ
 7p/KtkdergbiyW+AP0nxbL/IiVxP/IfOyZFhFK5YPqwVqjsAf4Wg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id T5btxHxnKIaG for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 21:59:48 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7xs0vZfz1RvlN;
 Thu, 20 Jan 2022 21:59:44 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Yifei Jiang <jiangyifei@huawei.com>,
 Mingwang Li <limingwang@huawei.com>, Anup Patel <anup.patel@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 15/61] target/riscv: Support virtual time context
 synchronization
Date: Fri, 21 Jan 2022 15:57:44 +1000
Message-Id: <20220121055830.3164408-16-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=0135fdaf6=alistair.francis@opensource.wdc.com;
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

From: Yifei Jiang <jiangyifei@huawei.com>

Add virtual time context description to vmstate_kvmtimer. After cpu being
loaded, virtual time context is updated to KVM.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Mingwang Li <limingwang@huawei.com>
Reviewed-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220112081329.1835-13-jiangyifei@huawei.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/machine.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 13b9ab375b..098670e680 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -185,6 +185,35 @@ static const VMStateDescription vmstate_rv128 =3D {
     }
 };
=20
+static bool kvmtimer_needed(void *opaque)
+{
+    return kvm_enabled();
+}
+
+static int cpu_post_load(void *opaque, int version_id)
+{
+    RISCVCPU *cpu =3D opaque;
+    CPURISCVState *env =3D &cpu->env;
+
+    env->kvm_timer_dirty =3D true;
+    return 0;
+}
+
+static const VMStateDescription vmstate_kvmtimer =3D {
+    .name =3D "cpu/kvmtimer",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .needed =3D kvmtimer_needed,
+    .post_load =3D cpu_post_load,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT64(env.kvm_timer_time, RISCVCPU),
+        VMSTATE_UINT64(env.kvm_timer_compare, RISCVCPU),
+        VMSTATE_UINT64(env.kvm_timer_state, RISCVCPU),
+
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 const VMStateDescription vmstate_riscv_cpu =3D {
     .name =3D "cpu",
     .version_id =3D 3,
@@ -240,6 +269,7 @@ const VMStateDescription vmstate_riscv_cpu =3D {
         &vmstate_vector,
         &vmstate_pointermasking,
         &vmstate_rv128,
+        &vmstate_kvmtimer,
         NULL
     }
 };
--=20
2.31.1


