Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2871B65FA0C
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:18:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdBQ-00015X-QL; Thu, 05 Jan 2023 22:14:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdBP-00015E-99
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:14:15 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdBM-000892-Ln
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:14:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974852; x=1704510852;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LqiVGAHoPImwvpbWVXhbOB9BTHqO5qtkROn9qlwrKqI=;
 b=eIfF5AjeA6aFlbRau+XigHs9ljqI7/SIbDj88S9bCjPnZ/tCfrLErfuh
 h0/Kyfrpxq/4dI5iXX+ONJevyTU3C8pgRlkhR6EBVhJcnD8ssWBuhYi/2
 9ZLnXDyOszsA7BxFxo9l4uLydqQgj/7YHeIIX8a39MiZSA9fcxuyODF4b
 3vDEExMwl6AqRtBH4gNUoo9EhUFbQZsJnoUWpijBCxMdLYq7x3nyq7DZB
 l3ji2zFPgouHvsKAOQo5MEXNF6YXkw4jZGX7nKszC/X+cxOwCaxj2a/7B
 9gX5zJUHLDnjpq8Ikr+ARUmsNRnvfOJuPcLZRCSw5POJ6C1alOkG4zHqb Q==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254743"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:14:07 +0800
IronPort-SDR: 9OZREGRlF9/1Y11WF5VwTiiO6a7GiSCC+B6Fwh0HLgtOqW+OCBvuBNCe9fNUpiRV4FX8PHcXvW
 39rtuZsSlRredC+Bq3yMQqapoZb5upAodRUFxI+tuRy61tEe55eCuVBAL8/CUQOof2RD75M8Yg
 e/a01okBZP17iIxdYf/byYi9C+grs8GZXaxm2sh228mDZAd/YqjTyQDDWCMr2ZZiC5qOtxdgKC
 o2jCizN9X86hr6X210QDMvzFUS4dADVgoifRVcCbdTrrxQQsvGkoZyWKukFnW/XOiGMvrrj08c
 tG0=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:26:18 -0800
IronPort-SDR: KpFqZpcjFQxJ3wXt9LXu9K+boVnh43TY/WihYg9pair4vPb17yJ02t8ipw6h5+4RJVLeEEwfFq
 ICmuI4zjIKEuvLikTjTWBoBGF8AzpYxZz0PyBeq4kFC8a8+9Zi1ws1NjD1Oa+syvnsYw50uNYE
 YkE6LupceNLKXjCx6lw8DSts9wiCcx2yD6q7PLoywdBUObQwXt5D9h6aaOpT97BQv0BKjIZLiH
 9eA1j8MsEodoIsPRne6a4zc+LJWs58dhKiocv/2hiVrZEutthBVvDFiUaKpQX6fZPSg+zGQ59d
 mlQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:14:09 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7jC22xxz1RwqL
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:14:07 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1672974846; x=1675566847; bh=LqiVGAHoPImwvpbWVX
 hbOB9BTHqO5qtkROn9qlwrKqI=; b=f0aoC7fps6BOozoBKJw71V13yew+0gkmj5
 AZFcsxrFwMM/xAWr2PbzhKXA/0JzKTA8L4VxNHbY7+nYQeMS27VwLpdLSPaKy/d4
 5/XFZGW9l5luOfC7CmxnAjzD6F0i234hwlV9bHiRnLQegzQIiMjz9vXfCK21SqS/
 5pNZhHtCMdz5jDz2o7UDxdI6o3Gk92viEc9jAj/UxlRSWFwgCHI/OCHXrgxztDqb
 yoRjEQdLRJImZjVAMI96WIpoUXFqWdY3x38PVek7cSXnJoYcl15CtUblPJrBminp
 0S3hGhay8bWnYhWwpiGirGfgF1xznYJSH7g/59dZXkNXHj8EJVcQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 4ramm712iH7y for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:14:06 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7j93S2nz1RvLy;
 Thu,  5 Jan 2023 19:14:05 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v3 02/43] tcg/riscv: Fix range matched by TCG_CT_CONST_M12
Date: Fri,  6 Jan 2023 13:13:16 +1000
Message-Id: <20230106031357.777790-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
References: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=363443eaf=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
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

From: Richard Henderson <richard.henderson@linaro.org>

We were matching a signed 13-bit range, not a 12-bit range.
Expand the commentary within the function and be explicit
about all of the ranges.

Reported-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221022095821.2441874-1-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 tcg/riscv/tcg-target.c.inc | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 81a83e45b1..191197853f 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -154,13 +154,26 @@ static bool tcg_target_const_match(int64_t val, TCG=
Type type, int ct)
     if ((ct & TCG_CT_CONST_ZERO) && val =3D=3D 0) {
         return 1;
     }
-    if ((ct & TCG_CT_CONST_S12) && val =3D=3D sextreg(val, 0, 12)) {
+    /*
+     * Sign extended from 12 bits: [-0x800, 0x7ff].
+     * Used for most arithmetic, as this is the isa field.
+     */
+    if ((ct & TCG_CT_CONST_S12) && val >=3D -0x800 && val <=3D 0x7ff) {
         return 1;
     }
-    if ((ct & TCG_CT_CONST_N12) && -val =3D=3D sextreg(-val, 0, 12)) {
+    /*
+     * Sign extended from 12 bits, negated: [-0x7ff, 0x800].
+     * Used for subtraction, where a constant must be handled by ADDI.
+     */
+    if ((ct & TCG_CT_CONST_N12) && val >=3D -0x7ff && val <=3D 0x800) {
         return 1;
     }
-    if ((ct & TCG_CT_CONST_M12) && val >=3D -0xfff && val <=3D 0xfff) {
+    /*
+     * Sign extended from 12 bits, +/- matching: [-0x7ff, 0x7ff].
+     * Used by addsub2, which may need the negative operation,
+     * and requires the modified constant to be representable.
+     */
+    if ((ct & TCG_CT_CONST_M12) && val >=3D -0x7ff && val <=3D 0x7ff) {
         return 1;
     }
     return 0;
--=20
2.39.0


