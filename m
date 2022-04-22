Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 721AD50AD19
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 03:13:43 +0200 (CEST)
Received: from localhost ([::1]:37626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhhri-0000gu-CV
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 21:13:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhKB-0000TP-9r
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:39:04 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:17590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1041ecfe3=alistair.francis@opensource.wdc.com>)
 id 1nhhK8-0005V8-Oi
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 20:39:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650587940; x=1682123940;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CDXzKpjjddD5WzsgwtbuNALNh5AMoIiu9HJXurmxYAc=;
 b=KHlqnnW3v/+9Q92FcKURbYiGlWFB5EhR048z6/2TURvkSVOna5xoRgTa
 r2oU4Ebf9CbHLTbNyPvDwhn4yG8l4NpW0rE9a529JJKdP0+57NoX6Otal
 O0QBjY37OWLiSZsYI5B+qgmD9kJ0RVLhOiTlk+fhoPaLvFUUMM7Ji5tcP
 6qSL7fcKtSgcUCkj+HlXxcdujei/8JK0zpr/V54ti1HPudGbLCB5nxSmn
 V4wzQfQS7eD+KpL9H/sAXLiHvsMJwub65kwA/BtCM6KBmJ3PEKD8hXXE6
 h3jwcg2N6C15z7Wf3Gm7iznMq2NItlezdwW/9KGzooK4iolV887NLN8WB w==;
X-IronPort-AV: E=Sophos;i="5.90,280,1643644800"; d="scan'208";a="310483452"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Apr 2022 08:38:40 +0800
IronPort-SDR: 1oh1qC7Zu75dACA0CGp6uF361OYQyg9vCBHCvCErbcUepCza5smqU5HOdSiotGBsjV5Kkn0Xwz
 C1vs+l60XbYUkHkZTVHpQNlmPrO5+sN8gOstlmGchXSBTyLW+s1Iyfdmv+QTF+/EKMEtXF0+D2
 zSRs6dc1MR5Xfe1ivTL0guHZP/RxD5YE4ps325YFAUIpnlHoY7DkCylDs6bH4/q4ku+qZy26mg
 cuMx4LUotwZe2DO3pCPqi0mVefoANHmjDDHEJKGVe6hCCXLIPNWB0Yst0geemievMcyxt5p/is
 IVilj3BfQK0PCxpAfqNYFkJF
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:08:57 -0700
IronPort-SDR: 3lDHxPuqS+F5ED9E7Yb0FzEAPv/VP287KYeL3raps9Itbo97Y7SWMs5Zvso8lEorjWcuqVFQPC
 iZts+qPGOusOplbIPfiWRrWDThEdMlr10aKqYuB2sc4ZLPMnNhDz5mbG5P/xgmosqJ2EuhXXLi
 P0H/CDZLZ/tyntdWn/ZjvE1CTdfFv++gycDppiqYhoga6gObI19g7ByanoZEZuFUc2piIfN8GY
 Dr2XRZb/tawn+ADiWEExfFUt1F2DygqoRztMsq9R4lLzqiigS7mt+wCflriQBhbUvKG+dGxcq2
 nZo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Apr 2022 17:38:41 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KkwWN4t7xz1SVnx
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 17:38:40 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1650587920; x=1653179921; bh=CDXzKpjjddD5Wzsgwt
 buNALNh5AMoIiu9HJXurmxYAc=; b=CDUbH8WK7YrbGjCLDZ3E8KNIcySPD9vpB0
 xRpt1IPKCI11HXMlxmm/5t/MPYCJp/01diLLO+HKpa/xfqjKvry7AH7SzisGgrpM
 RY3Kf6AKoSJTQD9gVaus4uAMnJJZLXsaV6zU8eFXmQWYBgOGyXEFi06c25I8HQYZ
 YnOPQkSaRXUNUPWRIeW0oagzSbSWPgjGxKeZ02yjUPBTC+IA2Mb+nbOHrduKw9VN
 F22CBRS4tPS5Reun3/WLg7XuhPIs+LgUygXzprm5+wj6wN9pczPMk4O7utMSAnMo
 yGCOkcRMctd/PKMEGVCB/yiOC6PfNJD3003B3QJj/B999ID1zeyg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Zmk1yn7U92RI for <qemu-devel@nongnu.org>;
 Thu, 21 Apr 2022 17:38:40 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.120])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KkwWL1SXJz1Rvlx;
 Thu, 21 Apr 2022 17:38:37 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 28/31] target/riscv: machine: Add debug state description
Date: Fri, 22 Apr 2022 10:36:53 +1000
Message-Id: <20220422003656.1648121-29-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
References: <20220422003656.1648121-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=1041ecfe3=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Bin Meng <bin.meng@windriver.com>

Add a subsection to machine.c to migrate debug CSR state.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20220421003324.1134983-5-bmeng.cn@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/machine.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index 243f567949..2a437b29a1 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -216,7 +216,38 @@ static const VMStateDescription vmstate_kvmtimer =3D=
 {
         VMSTATE_UINT64(env.kvm_timer_time, RISCVCPU),
         VMSTATE_UINT64(env.kvm_timer_compare, RISCVCPU),
         VMSTATE_UINT64(env.kvm_timer_state, RISCVCPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static bool debug_needed(void *opaque)
+{
+    RISCVCPU *cpu =3D opaque;
+    CPURISCVState *env =3D &cpu->env;
+
+    return riscv_feature(env, RISCV_FEATURE_DEBUG);
+}
=20
+static const VMStateDescription vmstate_debug_type2 =3D {
+    .name =3D "cpu/debug/type2",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINTTL(mcontrol, type2_trigger_t),
+        VMSTATE_UINTTL(maddress, type2_trigger_t),
+        VMSTATE_END_OF_LIST()
+   }
+};
+
+static const VMStateDescription vmstate_debug =3D {
+    .name =3D "cpu/debug",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .needed =3D debug_needed,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINTTL(env.trigger_cur, RISCVCPU),
+        VMSTATE_STRUCT_ARRAY(env.type2_trig, RISCVCPU, TRIGGER_TYPE2_NUM=
,
+                             0, vmstate_debug_type2, type2_trigger_t),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -315,6 +346,7 @@ const VMStateDescription vmstate_riscv_cpu =3D {
         &vmstate_rv128,
         &vmstate_kvmtimer,
         &vmstate_envcfg,
+        &vmstate_debug,
         NULL
     }
 };
--=20
2.35.1


