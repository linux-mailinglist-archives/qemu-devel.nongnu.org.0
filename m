Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B059E4881BC
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 07:02:37 +0100 (CET)
Received: from localhost ([::1]:35832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n64oG-00080Q-Df
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 01:02:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64dJ-0007ol-2c
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:51:17 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:10162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64dH-0006il-Cs
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:51:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641621073; x=1673157073;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ei4PEv3X5YS59poU8uL+cGvvNac0HX8bKORL4+PKq+g=;
 b=V7GtGcrK1WTuOBVYXWRBViyFIw1ddK2n0Ri01Ej2kSPRbhk+5NW58Jlg
 vuwbPccOepSvczkwWLENvx+9AI/ELpTAG+xtFANgb3VbG5DIHN4YGPpjW
 9W32XW0iqbgfsHTAHTIMSwpuTKT4JkacJl5KQ4paWq9DAYCrnSidl5CrO
 AvNSxzOZ5ZKO47RMb9lYhaDl967AQjfcvHcieVDZyxn34E/NDvNiSDTp2
 x3fqRGOkSE8NcznyyHwtwB7yL6Ez7NUxn6+pw9BHlWZ+52lL41a2GfWPo
 VLt4gF9lkJxfTHys4wsX6CngqjlC4ws1OsjnIifM907wF3YxpsToMyr4k g==;
X-IronPort-AV: E=Sophos;i="5.88,272,1635177600"; d="scan'208";a="194779699"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2022 13:51:09 +0800
IronPort-SDR: HT2idLJzCdIwV30bq03DDCTt+LupZGE4tgplA569YjTl6LnSKtcUeLuhS8WjurQUK+gK2UevOy
 fDSD39GA8dU02qIg4M9G2INN+2XGM+zCj47jipUf4VdD913MmyvchAyzd/tzbovTFCoiD8R+TQ
 mwCIH3h8JY4CunYScEEJwGZghcNeh7G47prpAd33ut6W2AJpu4891ZA59ThesA6XsugOOReqEA
 FPVsYcvQi9RaOIkOzCSWVJHWaArluckTGhOFaayrLJ1oiK9jLzobnNY8GNvGoMFaGQ0C7aabNt
 ssvp8yx20J12Mw8BL72Ory6I
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:24:59 -0800
IronPort-SDR: 1vfeof5TJBcGHTmVy6efCcWyLaODI3bZK7PcuO+/fSv4jUXoRNYs1gCNpS5jBZgHpvW8nqzyA+
 KyMBSqCrshmuSxJ3AVRWGhzT1nzr7soqepMPc/rfWZwhh0P0a3Zxo5aY6zdX4njWqJLv7czZrr
 gceZoRLjfUDn3kvoRl7sRklHrwjYJhDnJCOcizkj6Wv35fFtY2+7WXn7F2eAn9iquCVaSelkkI
 fRQlqd5yGZO9BGlIX/Sad6/Ydetc0oWYGXtS6vIe/Dvjv3wve2zqDp8xeD9S+hBIGO0yIWiay8
 +hc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:51:12 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JW8Mz0tbLz1VSkZ
 for <qemu-devel@nongnu.org>; Fri,  7 Jan 2022 21:51:11 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1641621070; x=1644213071; bh=Ei4PEv3X5YS59poU8u
 L+cGvvNac0HX8bKORL4+PKq+g=; b=sY6ulUJhQAezNM7f+nnQsrK1Zc0Ht55IFN
 h1WWU+UKX9ueWAZFYH+5ncPG5/k68XF6nlm0cx1/tl+WsZ7d5y7NIMduIdbN4YzP
 UjESD3GgFTaJR7/1cwZyw1oBv9QAMvsPfzOJcKYYegTm+dMeGubm4Mjdzsw3RLFH
 tX1eigRwcJt2loq+eryRaq5JEBKy37fE5rCgCpgkhnQg8jBMhyqZmVJp0yV/N7Os
 PqMR13Lln6dDBQTwg0Q4Tv7pAPPlBywP1+qoLJNe+8yDil4SPLD2vaH6RqB7D9a2
 1jTaozQFi8SP8RWS1Dwv+z1f/bh5sqO5loVs8qkN4F8upSXvGyzQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id wFn8Lc9LmoJJ for <qemu-devel@nongnu.org>;
 Fri,  7 Jan 2022 21:51:10 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.74])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JW8Mw02Yqz1VSkV;
 Fri,  7 Jan 2022 21:51:07 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Nikita Shubin <n.shubin@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 01/37] target/riscv/pmp: fix no pmp illegal intrs
Date: Sat,  8 Jan 2022 15:50:12 +1000
Message-Id: <20220108055048.3512645-2-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
References: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=000118587=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

From: Nikita Shubin <n.shubin@yadro.com>

As per the privilege specification, any access from S/U mode should fail
if no pmp region is configured and pmp is present, othwerwise access
should succeed.

Fixes: d102f19a208 (target/riscv/pmp: Raise exception if no PMP entry is =
configured)
Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20211214092659.15709-1-nikita.shubin@maquefel.me
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/op_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index ee7c24efe7..58d992e98a 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -146,7 +146,8 @@ target_ulong helper_mret(CPURISCVState *env, target_u=
long cpu_pc_deb)
     uint64_t mstatus =3D env->mstatus;
     target_ulong prev_priv =3D get_field(mstatus, MSTATUS_MPP);
=20
-    if (!pmp_get_num_rules(env) && (prev_priv !=3D PRV_M)) {
+    if (riscv_feature(env, RISCV_FEATURE_PMP) &&
+        !pmp_get_num_rules(env) && (prev_priv !=3D PRV_M)) {
         riscv_raise_exception(env, RISCV_EXCP_ILLEGAL_INST, GETPC());
     }
=20
--=20
2.31.1


