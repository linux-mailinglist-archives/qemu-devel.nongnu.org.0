Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEC543785F
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 15:50:05 +0200 (CEST)
Received: from localhost ([::1]:47828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mduvs-0004MI-Of
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 09:50:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdum2-0000ht-5f
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:39:55 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:64459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdum0-0001F7-11
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:39:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634909991; x=1666445991;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rzduVeyxrhftLxj7Bxhixy7X2Ux7Xte9hpgfqqHpb84=;
 b=WkkIV5rUvpEP0KlcgPe7FvgUcj/c2YUPTmNmuCia2xougjZepzrBDq1t
 6kvl5J+PnMZ59Bar7/grNzwtj/Egg/0qAUhT6JBHrUKgXrEvTBT3iJhNi
 QGd4BpI8yLGp4F+6FRCfakP/eP9nkC9qOXIEps1m3a9nVnLiSf9OeLPOX
 guOiT8+/fST5Pfmj1uTL/s57fqOIysGKUX/Lo0ve4wamEWjyI92buNYEN
 35WAddEv3Mo1asQnO0MVu3xe1H1THlvwfPunmG1LzWKTNAOqx+hU83NGW
 bGzfrUUjUN7ZrJqU024hjGJqJh3ZGNF+65LLJmbND1QW4ljhXmfmPJZQz w==;
X-IronPort-AV: E=Sophos;i="5.87,172,1631548800"; d="scan'208";a="182632611"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 21:39:50 +0800
IronPort-SDR: shulwBmTF0B7nO/1ZmUwxq8yjFdiAxXFBi3LiASEBVEH2OQoSRcSleiRNXP7g8Ay9xD9uXCEdA
 aa9Fs0VH8dlibG3bQ0GqmsfnxeyD97pPXz8w51RijdYqkswYaHMtMjkW8qSSZG0Ohsv0X9y3Cr
 vOK9VPVzQOGXUy+A07KUdHvxYeOLHdcwkeRkFWVz6IK6JJmgByrI4t5FVyp9Qb3lwvP5EBysKQ
 g2ypJICZVRokiUyLNuawkitr+o65nxg7025hEVmQRuZtM/EfzG9DnBYsHf2CWwLu5Kma4zU20N
 6YJa9v0bGvkqRH4dSG+2nnTl
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:13:52 -0700
IronPort-SDR: 0kndYi0gUD4FyaKKPH0++EbMU875lsoqdUb3pPqSQXqCBn03+32/XmiVw3w9xRxLNt/i6fROVn
 +4Gh3EaKWLljTcEK+vFFCP4GGsvw65SEc1Z1DxSkXGXeKL9aFej2eFONLOhSvdcx2x20LNOZZT
 eb2ZdBds2EdXtwlLVCPbHp337cVjcpEIXyCuO2kEdmQ37HaEVuJVB1+rib1DjrKEC+rDGvf2iH
 91BuGQkEsoc8V/XgDbRQFUTmbtHWjysVjbP4lVJzEssRcunCbswMcUK2jOyrgldmbW+uDropgv
 MqI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:39:51 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbQSk4Hfjz1RtVv
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 06:39:50 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634909990; x=1637501991; bh=rzduVeyxrhftLxj7Bx
 hixy7X2Ux7Xte9hpgfqqHpb84=; b=rFM3rcm65t922PYV0+SO4FAcR+50Wt3CEf
 +kt6hkrT9mev/dVTfCNgIIJnr1XZ4xBiMWzc9WUder2E0jSxvOrAVNzXJoKLjuba
 eNNMqgUKfnw0K3YtoguYRMdwX1eV5ORkAEKscyYnqEKI8HfmKQdG3Wqk8RVkrJnJ
 wymRst+wDRRvlyHzc9l7sWzgr4TbhXEJX7G5xMokA1Jv6UfvVWDEeH9mB2bNQNBT
 OCo+F2S6PIEOnh7X/X80enJt6NDD+6NfRkmsHQqEhF6crQuUq16lqaIxuzGqVQur
 Ue+t4Lo8bIAXxbwulQLey6+eOZ0bYfHHkiFO1oKVh+foir1fhvZw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Vb4mHW0atVLl for <qemu-devel@nongnu.org>;
 Fri, 22 Oct 2021 06:39:50 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbQSf0VGbz1RtVl;
 Fri, 22 Oct 2021 06:39:45 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 14/33] target/riscv: Properly check SEW in amo_op
Date: Fri, 22 Oct 2021 23:37:53 +1000
Message-Id: <20211022133812.3972903-15-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
References: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=9222bbd82=alistair.francis@opensource.wdc.com;
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

We're currently assuming SEW <=3D 3, and the "else" from
the SEW =3D=3D 3 must be less.  Use a switch and explicitly
bound both SEW and SEQ for all cases.

Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20211020031709.359469-8-richard.henderson@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 26 +++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 233131bae1..17ee3babef 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -704,18 +704,20 @@ static bool amo_op(DisasContext *s, arg_rwdvm *a, u=
int8_t seq)
         gen_helper_exit_atomic(cpu_env);
         s->base.is_jmp =3D DISAS_NORETURN;
         return true;
-    } else {
-        if (s->sew =3D=3D 3) {
-            if (!is_32bit(s)) {
-                fn =3D fnsd[seq];
-            } else {
-                /* Check done in amo_check(). */
-                g_assert_not_reached();
-            }
-        } else {
-            assert(seq < ARRAY_SIZE(fnsw));
-            fn =3D fnsw[seq];
-        }
+    }
+
+    switch (s->sew) {
+    case 0 ... 2:
+        assert(seq < ARRAY_SIZE(fnsw));
+        fn =3D fnsw[seq];
+        break;
+    case 3:
+        /* XLEN check done in amo_check(). */
+        assert(seq < ARRAY_SIZE(fnsd));
+        fn =3D fnsd[seq];
+        break;
+    default:
+        g_assert_not_reached();
     }
=20
     data =3D FIELD_DP32(data, VDATA, MLEN, s->mlen);
--=20
2.31.1


