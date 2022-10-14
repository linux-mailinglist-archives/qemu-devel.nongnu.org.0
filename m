Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B0A5FEA84
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 10:27:45 +0200 (CEST)
Received: from localhost ([::1]:53428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojG2i-0007FN-TB
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 04:27:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2798045df=alistair.francis@opensource.wdc.com>)
 id 1ojFcB-0003Wb-GB
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 04:00:19 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:4637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2798045df=alistair.francis@opensource.wdc.com>)
 id 1ojFc8-0002BS-Fd
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 04:00:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1665734416; x=1697270416;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PB4NVadb5tV66ZG/JfTgFtufrHcx81/hfmhS5WGztdc=;
 b=kCH3R5lFTzN4I3jYZRfqFqU+d8srovGoqWwJPXBkPT+B2CB/hEIuphxV
 JdvNMiP4izcPIJz9MOpMRzD8POgY+iwPGhOMY6OmB8MMfLncEnvgPh5OL
 t06fZcOHYKwC8RVCjqqotSVaGddeQqYgkXG4ff330ViDDlqQL+SJn2kZX
 JzyHNJwP9sqMP5uN17eJDixKqldM4qslMyZOOT/qkUrFKOA4KHidg5c3O
 QnVKyvgJ+TVEh8PhOi7WVr7Q+C4yBJ0UVQ5wuOLd5R3WELzCB09AKzxQE
 /oRh08B1XsmU7J9vHl7kGKdFooMqvYHLVLOiZTPjimw3lXToH+HAnlpg5 Q==;
X-IronPort-AV: E=Sophos;i="5.95,182,1661788800"; d="scan'208";a="318091219"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 14 Oct 2022 16:00:13 +0800
IronPort-SDR: w/8K8rnS7bGqFRwD5+pt+RVt2MW0FiOtgW2xS+PV1kxiuYFlo2hXrVZivGZuZ3DqdOZao0VcIx
 ZnxDOETkSRFNi2Enxfoxy4PaEOG950Fv6sLd25jfxHTdpcWmGmpwFQpQD/FjqvoXQNJclwE76A
 tUKCANtGydX/pk0iky+v+u5yZ8L3MkBxUj6vZ/8VhZIMgR1nKfk/MZfWi1yOjbesagsI8mTx6G
 CmDoMGBTDqz8pEGLvPc3vZlkjpEQZVF1yBUqktNuBke4eONpDUda39YfqW8nEd3s14GFeaDpAT
 yH22VVwbnTIo3DfB3ojUyAKv
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 00:14:12 -0700
IronPort-SDR: reoaJejyIXVG4+VjcnAMYYzMmB/yWpIlfGgtbdn70jHZPTHqTykvLKt0+vhUaokl//R50wc+Zq
 t3l9OgbUp26eCf+kZF8WCByCLy9RNYywZz5QG6HEaVd2Qv2/5NwJGm/oyLPL6e7JXnzSvwWgSS
 Y+8uncrOs8gwUu/x6dKoG734I12ZHOZ6GMV8CyUW05sKmHhngzujbDM0pNNfGi/00dSsEOtgIQ
 zlCvD54ABg/bnfHZZbRuXMT1siqXI0EaiEyulfIfXc2nKmR2pOWsEVVUmqdARagFcEYFO8mn0G
 3mc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Oct 2022 01:00:14 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mpf253WLWz1RvTr
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 01:00:13 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1665734413; x=1668326414; bh=PB4NVadb5tV66ZG/Jf
 TgFtufrHcx81/hfmhS5WGztdc=; b=nv1RvOwqgOjZyF4nJGQIlEiuYkuQZY1mBl
 SVbqG4gLHkRgyqQW9cYiQ6T9mnj2+QP7tHK7V/9QXsrnWxTTz5Rs7F8bWLPUzfXl
 V1TNcnwc65VodBnmPk/Bs42uHljxQEJVWFeiNepsU2C/y6mUoh6co+8G9ATFnNtO
 UTqTH32Fb15SiB+LRxK5hFoYO/LVNC/kfYCghU/sEdkBRYv/8fQ+G0FfzfJFJhZl
 g0TMHUONnFF7unaFTlW+bLziGCgjloej33ILyB883oFHhiiU02z5lALQo2i8bnLq
 WdIRxqAh5EbXkLLQVXfy3u+hzbHU/5iRUChyAvL0AjS96K6v1zvA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 9-OxcEljMLeq for <qemu-devel@nongnu.org>;
 Fri, 14 Oct 2022 01:00:13 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.19])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mpf203BK3z1RvLy;
 Fri, 14 Oct 2022 01:00:06 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 10/10] target/riscv: pmp: Fixup TLB size calculation
Date: Fri, 14 Oct 2022 17:58:30 +1000
Message-Id: <20221014075830.914722-11-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221014075830.914722-1-alistair.francis@opensource.wdc.com>
References: <20221014075830.914722-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=2798045df=alistair.francis@opensource.wdc.com;
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

From: Alistair Francis <alistair.francis@wdc.com>

Since commit 4047368938f6 "accel/tcg: Introduce tlb_set_page_full" we
have been seeing this assert

    ../accel/tcg/cputlb.c:1294: tlb_set_page_with_attrs: Assertion `is_po=
wer_of_2(size)' failed.

When running Tock on the OpenTitan machine.

The issue is that pmp_get_tlb_size() would return a TLB size that wasn't
a power of 2. The size was also smaller then TARGET_PAGE_SIZE.

This patch ensures that any TLB size less then TARGET_PAGE_SIZE is
rounded down to 1 to ensure it's a valid size.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: LIU Zhiwei<zhiwei_liu@linux.alibaba.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20221012011449.506928-1-alistair.francis@opensource.wdc.com
Message-Id: <20221012011449.506928-1-alistair.francis@opensource.wdc.com>
---
 target/riscv/pmp.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/riscv/pmp.c b/target/riscv/pmp.c
index ea2b67d947..2b43e399b8 100644
--- a/target/riscv/pmp.c
+++ b/target/riscv/pmp.c
@@ -628,6 +628,18 @@ bool pmp_is_range_in_tlb(CPURISCVState *env, hwaddr =
tlb_sa,
     }
=20
     if (*tlb_size !=3D 0) {
+        /*
+         * At this point we have a tlb_size that is the smallest possibl=
e size
+         * That fits within a TARGET_PAGE_SIZE and the PMP region.
+         *
+         * If the size is less then TARGET_PAGE_SIZE we drop the size to=
 1.
+         * This means the result isn't cached in the TLB and is only use=
d for
+         * a single translation.
+         */
+        if (*tlb_size < TARGET_PAGE_SIZE) {
+            *tlb_size =3D 1;
+        }
+
         return true;
     }
=20
--=20
2.37.3


