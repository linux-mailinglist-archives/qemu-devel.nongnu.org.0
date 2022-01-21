Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBAB495A01
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 07:35:51 +0100 (CET)
Received: from localhost ([::1]:39250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAnWY-0000zs-Fw
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 01:35:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmyG-0006xO-HD
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:00:25 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:60338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=0135fdaf6=alistair.francis@opensource.wdc.com>)
 id 1nAmyB-0004AK-Qe
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 01:00:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1642744819; x=1674280819;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kJZ2pkYgoZBiDqjiSH7rZR/fDtTv3nC21nqEvexgxE4=;
 b=aZm6tyWUSkYcpM2PsSL9rZqUiwQdEQ0q/JprOOgCv419PH6dDtus62bz
 K7f05TQjSKedKmlcElHAZFtlvVxh+7x1p2j3AFO7wDcJYOwa5ucxpMZN3
 NVQlHpqf2DSLmt6qp/5AZaRoVfR9tT8TatuY5NX17gSKWl6HO3HfB8sn4
 3GGAbJ094aqCjgLure/0kRFgmkGb9gfyPu2SNQIrsLxI2w0Xia/7CP/VQ
 JYR6SUcwsCXMjWK0Sn4KRSiqk+jZcbYvwj/r17eqo4hmIdTJQyLjp7WwB
 cAuZFqKi0ysj/XPci6EzQlZ0IV3JNUlRJWUvwDNObkRFqfME0jkM59ntH Q==;
X-IronPort-AV: E=Sophos;i="5.88,304,1635177600"; d="scan'208";a="295082907"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2022 14:00:12 +0800
IronPort-SDR: Pek0TDmdQDrdzEVz/LV7MiNkLyDW2/eCQFFG+fkvX79lyATRscXY6+4K4yOf/lhw/zfT4EuO8V
 2SZBDMEPjVX5/A9CHIYRLO2vXqgdULVwJO/9Mn39hIrJ43hlChIm39Vg7lYpd5Koids3sVwvNB
 y0NTxmX4FXclkhKkV9F97z/zSf7gJOq2jmw4nhZMeu4rOH9h9pUM2TYEKCRJUjtDpGnigSJ2sx
 xbQ+70c5/V0TLAf2bmNVhQsfDM/hyEJNNC2uv1bbXCh1BU6GfdXMQE7dwqojG1YY+e5mEolbKF
 zVpSABy0K/Cvx0LCw0AdS2tZ
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 21:33:40 -0800
IronPort-SDR: fBFT2epgCwSFR0zxrrwQlRHDwux5M6XRUk3mxCVBxEF3svw47MySJB9YxzpymGYnWQ21YNJUBq
 hJxtJRlXlqx5Z9njHPnw8wNDx/zf5Xw2ZeNTAvlwy8QebBR7jUsl99M984L0R3gChS3O+wS0zu
 sf8+3jAWNY1zuNyhFPN43bmfPjX2spw+CsrnF0YgggA4R/gqDiUnosWnfyGD5inWgwELdVvb5W
 3Z8GtKq/BZNNGiBbVUsRXIAjygsNCmW5gFuJf4UMNaG+gCXrtrJgSsARqfa4ngxeYVq2vYuUtb
 LcE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 22:00:12 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jg7yN4GXWz1SVny
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 22:00:12 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1642744812; x=1645336813; bh=kJZ2pkYgoZBiDqjiSH
 7rZR/fDtTv3nC21nqEvexgxE4=; b=OZE3CPpSy4/untbNXXx8dE2JoH0K/04SNF
 qN3uVPuGmpEWYzRSGFWSXoijt+YhxML9nutegW3kYeJQP90v3S1rO7dNHyjm3OzE
 uqNWFSA8vInTXZNL+/S3XEVFzvU5xHiJgFODqScOdKKqH72kwrDVDJum8ZK+AiTB
 15Wsg5b1pJW6uZnb8oiI9Gkfzr6iEKIhmfKcg73j5MOBrtsaSO9SCa+FrEfjLlIE
 YMnYV5zzk85yot9HdcKHLNTv7o5wnNBE4Pprsa+OLTVNNfdDz4bl8SVnX29WtvGe
 eZj+VaqYQ4B4/NRRNfiyfsezvigggofHMN/7MzbGfU30nlXKX4aw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id fONxB7YFaOWN for <qemu-devel@nongnu.org>;
 Thu, 20 Jan 2022 22:00:12 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.80])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jg7yK1TPqz1RvlN;
 Thu, 20 Jan 2022 22:00:08 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 20/61] target/riscv: rvv-1.0: Add Zve64f support for
 configuration insns
Date: Fri, 21 Jan 2022 15:57:49 +1000
Message-Id: <20220121055830.3164408-21-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
References: <20220121055830.3164408-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=0135fdaf6=alistair.francis@opensource.wdc.com;
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

All Zve* extensions support the vector configuration instructions.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220118014522.13613-3-frank.chang@sifive.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 6c285c958b..5b47729a21 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -129,7 +129,8 @@ static bool do_vsetvl(DisasContext *s, int rd, int rs=
1, TCGv s2)
 {
     TCGv s1, dst;
=20
-    if (!require_rvv(s) || !has_ext(s, RVV)) {
+    if (!require_rvv(s) ||
+        !(has_ext(s, RVV) || s->ext_zve64f)) {
         return false;
     }
=20
@@ -164,7 +165,8 @@ static bool do_vsetivli(DisasContext *s, int rd, TCGv=
 s1, TCGv s2)
 {
     TCGv dst;
=20
-    if (!require_rvv(s) || !has_ext(s, RVV)) {
+    if (!require_rvv(s) ||
+        !(has_ext(s, RVV) || s->ext_zve64f)) {
         return false;
     }
=20
--=20
2.31.1


