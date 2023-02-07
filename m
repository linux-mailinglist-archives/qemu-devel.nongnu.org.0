Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A48068D061
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:16:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPI7U-0006UU-Ul; Tue, 07 Feb 2023 02:10:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI7P-0006RX-4Q
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:10:19 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI7L-0000FW-Vt
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:10:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1675753815; x=1707289815;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T/okmQ3vJWrqwoW/gdxItX1Z/aqo1403IcRoaMDUpPk=;
 b=Q0yfKSbClIhwOuAa+6w8O+Ts55Wzu7b6NHjBU+X10YTJT7BQiOaIsbno
 sO0sBH6OGqh7dzcWeTfgF7CIuTmcaP87cmPUJ6m2UdvPyETfYTf46V7yu
 NC3eblk3GR6ZKVtyyL/fTv+3v/nYevl8IkY1DZbiXOKz/JXKDjc3RTb4N
 IvYMZLCtT919W9Xvp9QIvfTr9z078vtDfsDF8VHAal7IDHSe16s/ypc6N
 Jppc4az2+LCopvnc2DPQxFVFl1q7oP0zH8jm2DJfXWBo4CeCFevC+MizP
 HvREZRkAC2lJFwQu/NE8x8oBPi0j5uMfrZS5sXRvD49Xd7X2ClupdV6AL w==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669046400"; d="scan'208";a="227657492"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Feb 2023 15:10:11 +0800
IronPort-SDR: 23qEe+wUDzwDEIXALcOxYcWWdd4fhaifuR/bEBqBYNExvPJKMDUAhdSgJzaDHwSp5B3yj5C1tx
 LvGd/YNHCOnWmAcFGKkXIeXyfNxCOkf03xTasWUDVzKSIBpyrSifQyyntmnI4UbA6l+L8qyn62
 P2OaWC4sv91QY54b7U+SuAFiKNC7wmqf1g7y90SrTQwvTwIJ2YsAkrARhsyTySBxd1oLREPAaD
 UnCco31EeYwCSNwGKpJwJj+sKJOiNjI63/QaSTtgWqTH9ctIkiyShUEXG8ByI+oI3kOk9uD6Mz
 U5I=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 22:27:27 -0800
IronPort-SDR: r0jaiLRN5GttIkzgRNoXNXxPu2L3RtPw8aiHpF0kNL654IrAlrRXKtzcvFmI1QQjvvZ47CVwbj
 ud0mNt1lVpRd87HcAYXGgQ0y/tCkrkiyUxwXtKs2y3MtyNZ0TDn2t2LZgawE5LCaLoAse4wt+Q
 X7twabGntT5T4kjji/OZ2gcH0k54Dr+vpsKWSVD7+8xMZsaGd4oqEhW1C9IyLDpV0kxe4Bf2Jy
 FvYQqlZLGdsBVRjL+XawV7wHv45xTyr10KhIJwWFz2LKRplGOwsdCdQi2gF0lZpYQt2Z9smGUC
 +ug=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 23:10:11 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P9vQp5pcBz1Rwt8
 for <qemu-devel@nongnu.org>; Mon,  6 Feb 2023 23:10:10 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1675753810; x=1678345811; bh=T/okmQ3vJWrqwoW/gd
 xItX1Z/aqo1403IcRoaMDUpPk=; b=kcsTgmjG3H1ssiOiWWtga4Kkyh/rX8r1wT
 MNBEhc9tugYyJRAsaAFVT3bh4tc0o2Fq3NC4rVhDELxpPkuOTF1rbfLS2TIwTgJo
 MjuHWTSP+Smywl+SMKw8q4cY+ovSnZO+4ymJdfE2npQ16ePl/MZ1rth+TIVamfKR
 3RPmBCRXZkgKP3hZFiYZS0Aj8ngDtW8mkJQnD+ss1Ie8/IHzALT1FZ7vqCRl2p9D
 Vv/mhutizk5L1XH8zbKscfmQKFDoA9NOcj3/EUasgs7a1suuWdfZph6dVJJUtihl
 aV6U+ji+ch2ixxjfUPrncS0sY+wK+4onGl6mxVSbaO11vD/rwDLg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Tw5XrGbhzs9C for <qemu-devel@nongnu.org>;
 Mon,  6 Feb 2023 23:10:10 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P9vQm6Dv4z1RwqL;
 Mon,  6 Feb 2023 23:10:08 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com,
 Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
 Bin Meng <bmeng@tinylab.org>, Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 11/32] target/riscv: set tval for triggered watchpoints
Date: Tue,  7 Feb 2023 17:09:22 +1000
Message-Id: <20230207070943.2558857-12-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
References: <20230207070943.2558857-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=395dd5341=alistair.francis@opensource.wdc.com;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>

According to privileged spec, if [sm]tval is written with a nonzero
value when a breakpoint exception occurs, then [sm]tval will contain
the faulting virtual address. Set tval to hit address when breakpoint
exception is triggered by hardware watchpoint.

Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230131170955.752743-1-geomatsi@gmail.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 6 ++++++
 target/riscv/debug.c      | 1 -
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 0d72466f3b..ad8d82662c 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1639,6 +1639,12 @@ void riscv_cpu_do_interrupt(CPUState *cs)
         case RISCV_EXCP_VIRT_INSTRUCTION_FAULT:
             tval =3D env->bins;
             break;
+        case RISCV_EXCP_BREAKPOINT:
+            if (cs->watchpoint_hit) {
+                tval =3D cs->watchpoint_hit->hitaddr;
+                cs->watchpoint_hit =3D NULL;
+            }
+            break;
         default:
             break;
         }
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index bf4840a6a3..b091293069 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -761,7 +761,6 @@ void riscv_cpu_debug_excp_handler(CPUState *cs)
=20
     if (cs->watchpoint_hit) {
         if (cs->watchpoint_hit->flags & BP_CPU) {
-            cs->watchpoint_hit =3D NULL;
             do_trigger_action(env, DBG_ACTION_BP);
         }
     } else {
--=20
2.39.1


