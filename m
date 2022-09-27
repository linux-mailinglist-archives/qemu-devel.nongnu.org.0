Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 513F95EBBCF
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 09:44:19 +0200 (CEST)
Received: from localhost ([::1]:55476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od5GM-00081L-ED
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 03:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od48e-0005mX-NM
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:32:20 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:44585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od48Z-0001Ix-JA
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:32:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1664260331; x=1695796331;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tWJvhpRWP2n9qD3jHsJubgMcNxUKlbLx7GjjYPzDh80=;
 b=GUWO0gpLO88xnJ964hFvrNttiq2hMnlN0e6qipiBXQ7wAfTMWDJLWZ+C
 oFpFoNgA/qbYhBGPbPGciLVh30Zpqs3mt3dsLF/HaID2PwbfD1qmavtJ3
 03RIeqi5yaeBSmD+oCaKVElBGcALsWAuVuHD6hpM9ycJ4/QiiaS1PNyXu
 2Grw8wEqu76zkLLSZWa3fOdaHmd2lA+lIWHvbTr0gvJZY9nX0Gef4Kdlh
 PfxjuMspNoexUOszvgadi+8SrSgzsCJifmkKYbLGws/Lye+xqOfFxjfwB
 E1usVHA29cxJ2sGaXSeF0ZeP2TY5pP01K2sE4yRcb8yrUeoyevKQNSsEG w==;
X-IronPort-AV: E=Sophos;i="5.93,348,1654531200"; d="scan'208";a="217530925"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 27 Sep 2022 14:31:43 +0800
IronPort-SDR: vUn0BpxRI4o2fROzIikx43ycDMkrYuLaP9ii2e/NVBOXqC069sKVPBtuixpw7/96OMxM+PSS78
 ItfKwSRJ+FJL8viqA2MsvUmJzlMGca3am5Hhncmc8fhBJOPLwfkmBP3dIcoYfj10tV4G99MMH4
 Qq3oWzadns2tclSrhwyK8gUCqkYyymTVV90pp9wc0Z9fBJ7kAttEL2iyvte+KIkQpg/NKnfNPT
 VZyfYpHjOmKG85FSN0XV//rosB+oD3SL/jgopV/RLIyp/QROWofGDSUlqApQ2PfaX9f3LcwKi0
 PZqo0HKuH8FJL/u8jegkb+Qi
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 22:51:40 -0700
IronPort-SDR: tDUJat2JY08GW89nyX+uNigc/qtUGXQU0tY8taPgrx+fTSARIBuTIcScLtvIr22cXj0Fv8jOTH
 GiZcso6jNxrKOo+MT5wa1sc0KN1TCpBv0x8WnvF49s84qvc8WBW32uTz4lqP9B4d6hdzyVJscO
 /YpxgevqyMNK1mcEow2qt+9BqonT1zOqoCgrn2wkurJ1osxTe4Ap2NoCZSqBSbBZXEZYBPM3Hq
 JkVBjWn+doL7XdyGsMcv6vhOFldiP2OnjQgSxPJVDKzhzfRKIJGSaaiUvDYvYvtxpDydLGCSg1
 TbU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 23:31:43 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mc8sq1gBnz1RwtC
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 23:31:43 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1664260302; x=1666852303; bh=tWJvhpRWP2n9qD3jHs
 JubgMcNxUKlbLx7GjjYPzDh80=; b=GBTRxuPTbXJ7Nr+vrt8ARQtSddtvN19Tcv
 evXwHGCaNaaqbztx0mZzjquptTYzc/Ga8VIu8R8J13rEsyqDFjaO5+3Y55kzqIgO
 46s1i6lKHYvG94TaCM9AW9OhRN15vteJNixoG3UgCdGDb3zFRBc7njPSGxAISXHr
 fJ3n8CE2lc6DMNFu4FN0xxyuL37gSYwnqjlYTP+63juoguEexzfRh4VcJSiCwGBr
 lHlEQ4X3DbE7gCb12EG8ivlwEGII2ch3vgFq2N0//ZSqWBXMP5Qr6f4jY9ZDTouv
 t+FWIWjWoE4cuEglXv1J2vAp5/KqTtRR9xwqPmBHofQQS1oB86dA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 4ULu52mDtSTd for <qemu-devel@nongnu.org>;
 Mon, 26 Sep 2022 23:31:42 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mc8sn3j6rz1RvTr;
 Mon, 26 Sep 2022 23:31:41 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 19/22] target/riscv: debug: Check VU/VS modes for type 2
 trigger
Date: Tue, 27 Sep 2022 16:31:01 +1000
Message-Id: <20220927063104.2846825-20-alistair.francis@opensource.wdc.com>
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

Type 2 trigger cannot be fired in VU/VS modes.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
Message-Id: <20220909134215.1843865-8-bmeng.cn@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/debug.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 7a8910f980..e16d5c070a 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -464,6 +464,11 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
=20
             switch (trigger_type) {
             case TRIGGER_TYPE_AD_MATCH:
+                /* type 2 trigger cannot be fired in VU/VS mode */
+                if (riscv_cpu_virt_enabled(env)) {
+                    return false;
+                }
+
                 ctrl =3D env->tdata1[i];
                 pc =3D env->tdata2[i];
=20
@@ -499,6 +504,11 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, =
CPUWatchpoint *wp)
=20
         switch (trigger_type) {
         case TRIGGER_TYPE_AD_MATCH:
+            /* type 2 trigger cannot be fired in VU/VS mode */
+            if (riscv_cpu_virt_enabled(env)) {
+                return false;
+            }
+
             ctrl =3D env->tdata1[i];
             addr =3D env->tdata2[i];
             flags =3D 0;
--=20
2.37.3


