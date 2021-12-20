Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA41547A4FE
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 07:25:53 +0100 (CET)
Received: from localhost ([::1]:38132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzC7M-0003z9-OW
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 01:25:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAp7-0004em-3M
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:03:19 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:51767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9816edf2f=alistair.francis@opensource.wdc.com>)
 id 1mzAp4-0000Ga-Vx
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 00:02:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1639976574; x=1671512574;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oCiQCDJ9Pf4EErT3RmItLiiTVN1+WDAKi03iiSsJhpI=;
 b=eZc0vxBl3lvpAjzr56WGzfeLTi9kzteHVWkkRNy9o0Cx7TJorR+LQTzN
 UhljrJBVCxG9ApxmrstkLWV1fCFOEHCzfPIZ2+iKMIBx+poJNLgiMEBdv
 cf0+JrVazfCIBT/sPCC7HWHAWI49OG6pMX356LuJj3OrTdL2QRMSk8+S2
 TwgIeoXJ3UkVf9AhmHbKwJr/OuWEm138xB4FSwlXzCbg7j/+LpErUKjqD
 X2xuAjRKIJPz7QPqeeRHpN4jYnlhfYIgVdO6gqV1IpR+DCwKONCLcrRGs
 2BPdxkQP+QWLzNU6W6FU1UIdVmSH192BYh9c8RSRwlrQGM6lbKS8pWodt w==;
X-IronPort-AV: E=Sophos;i="5.88,219,1635177600"; d="scan'208";a="292662365"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2021 13:02:51 +0800
IronPort-SDR: R2Rsb4jWh8qQ1mdxNwZhq04I99Mjkga3U4q0dkAtXYsSaSIDJdYp92SzZzO2d9LaC3Vfn/cvua
 ZSSQmDHhAP+lsLz7X8Vrph4UCESUUHT6gJ9G6RagmXqbBw+ROdcLNJTRGwNaxFlYJIV0VL0M7t
 +IOdKu/252MYk9pooo8LReb0hoiI0Bcl20Pf/vaDlCEdGGJEYaY40V4ufEisbqHwb17OnYUdNR
 zkf7kVNYPN2FBFhFcgrkjzKLMlQfIY57dq4+96PMWDoQm+6oRO03YdLPpLiWa4roSycJF6P8GS
 bBjyQBsQnVtniMuozjiPrPK5
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 20:35:41 -0800
IronPort-SDR: DRwwIj+PKviboCnZsK2eqAe1ViVFhqf8mdo+6QFB47PQC5v4rvRTRuWy2yhXeJo3RXxafrM2Kq
 CBdYXTagH9cRXa/ZzKhShxFlMQ07jxLuxolI8DpxKBWO0gOzh1nAzBS1Zeu5E7WN0pLJBJUIRO
 wcqQCB9wMV51HLKto4NfA5nA00u/CRpizl0jLlK0ZWTiWxOANcMBlZYIWUSjIWdkQn+UMk+/Zr
 QXbKQaiIsQWLDBFc1r+RP9nWKhY1GqL6TdJ2OVVmn5aHxzPMhGCINqVBMdQ7LiPIIudg1303g0
 TGg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2021 21:02:51 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JHSBz2tbxz1Rvlf
 for <qemu-devel@nongnu.org>; Sun, 19 Dec 2021 21:02:51 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1639976571; x=1642568572; bh=oCiQCDJ9Pf4EErT3Rm
 ItLiiTVN1+WDAKi03iiSsJhpI=; b=qXcz0NV/GYF2A7C0EiOP4Uz+T8Sp+1fjkB
 l1CcT3L4CN6/AJNAwhni/GaE2V9GFhkCtGDCoCZzCVe25i2OJAC5qkkn74F3WPE2
 XUGxAi41lAV3TA3OW5kGccxfAW50bu4t+HFQuMjU557xXk1m+afk/NWqEEcipmi+
 gn8sFNprpsV+nhFKwEmuTAPwGAULmmBBF4HiVANUuZgQvuSQLryrrJcDeTo5XhBJ
 HCFvMCW3z36Z2f3ZCmDiBOpaOzUhmaOVUwBoL0bzjaN4nHN90Tp+FuktBeC93e4n
 kYEx6aa/NeIp3TTw/+RXD5bu01bQZE4kjoKpbExiuVykM419rfnw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 4nZbT7Bk0BVN for <qemu-devel@nongnu.org>;
 Sun, 19 Dec 2021 21:02:51 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.68])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JHSBw2nfbz1RtVG;
 Sun, 19 Dec 2021 21:02:47 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 84/88] target/riscv: rvv-1.0: update opivv_vadc_check() comment
Date: Mon, 20 Dec 2021 14:57:01 +1000
Message-Id: <20211220045705.62174-85-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
References: <20211220045705.62174-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=9816edf2f=alistair.francis@opensource.wdc.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Vector Integer Add-with-Carry / Subtract-with-Borrow Instructions is
moved to Section 11.4 in RVV v1.0 spec. Update the comment, no
functional changes.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20211210075704.23951-77-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 33ef7926e6..47eb3119cb 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1613,7 +1613,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr =
*a)             \
=20
 /*
  * For vadc and vsbc, an illegal instruction exception is raised if the
- * destination vector register is v0 and LMUL > 1. (Section 12.4)
+ * destination vector register is v0 and LMUL > 1. (Section 11.4)
  */
 static bool opivv_vadc_check(DisasContext *s, arg_rmrr *a)
 {
--=20
2.31.1


