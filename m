Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 226D53FD12E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 04:20:29 +0200 (CEST)
Received: from localhost ([::1]:39944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLFrY-00021h-61
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 22:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFiM-0005OF-4S
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:10:59 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:17551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=871df42ed=alistair.francis@opensource.wdc.com>)
 id 1mLFiK-0007wz-Bu
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 22:10:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630462256; x=1661998256;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5K1mozyt4W1XrW3BXgv4zyOZRDhUhC1zOhW09n30Jus=;
 b=Lzb06/61cZkJapjjk+LhmUU1fR/9utPMMwlzvz3u2pt08O3/wHWHsczR
 4XbYzBG/An0ijfFFWh7s0RDrqdHpBWVjgFo6qbXlxq+UMq4gN92e5Cv1w
 K2qn4mChkiJKEfZfeEXpopOFsU0VyZQHWk1ca3EKLZEobrs8zedPzTVzo
 FqVycHbjxmkJd4B45qOJX/ZVBgQIfCtxPNikfu1+6gejOIvSb4iCTEdST
 svRcrqwPr/n8HikhwJ2qD+daRm60ot1npk2f1ZqBziPjoyAMhnJB4HBJ8
 wCqgkzNRsVpAAkxBuVfmQF0ciDvbgL6SH/kqpqwL5BTprCQqK719XyCBq g==;
X-IronPort-AV: E=Sophos;i="5.84,368,1620662400"; d="scan'208";a="290509000"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Sep 2021 10:10:54 +0800
IronPort-SDR: /Lt+zog+z//gk7RDxDpVpeEIW4Jq4bqZQCsfjNq1SztjvxWiUDAUoGBtLe3L3x+EQQ/sOmeCze
 TppRKJwGqOb28N5KKiiPYImWC53eA8yBEet9DJgwFWh3r3uu8LHg/xMg94EDAQs3I4ci1zPBvL
 XF/6znz1XxO3ycB24llIv+JpYZNWoGSeN2f/fmf+W//WT5+yCMj757V5JQMKeY2Fq1NkM0OSD+
 YXuwhKY0YzBDOTY9ymHWvT8TIyZa0DWBvLtx3YgR+RkZ6K+EQ8KElbrRcYStnrlu4kdQXEAUmC
 Q7ik2umt2zilgsb+Gh1+CrN+
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 18:47:43 -0700
IronPort-SDR: 1iTVDbXdcpQT6GsyXxIQuSq2rUwxWwhSliATbRzOKbnOcrxdZLbuflDPfecapzNircQIwjh69g
 M2LIJb0ePjqqgQ6hvQlTCAQYXn97dOhcE4KUtggw93VzuH1Jfp5lQtJWkcFQ+UXXwOp4xIVnwV
 gL/mXw0/GtpjVEfxpqRduVdmUY8jDy8urajUhthX+ve5tbYK4kqB/cQCnVhmjXjDriwGY2seDr
 emFUMiU/w+29Ijd345KMw0sI7QwBNPBWscUy2QAqhfC2jGE65tgWpRPkpyLsaOv8m2L2Og7kMF
 Syo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 19:10:55 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4GznbL3Xdlz1Rvm0
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 19:10:54 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1630462250; x=1633054251; bh=5K1mozyt4W1XrW3BXg
 v4zyOZRDhUhC1zOhW09n30Jus=; b=H2TCfSCVKjipwkDjJV+qhYmdVWZMfc91Tp
 aH/BV09PRWsQGvoSqKUqWZ09O6sz8chiIxJP7n6SI+4W6PRchZUqr+TiMR+hx7Nj
 Lmisx4q0ljdfNcKNWurEtAvaAaIBeWzmRFSAZdxsSCOvH0IfVp2AVVyyuIzATdGy
 +Erwes7VdKU+QmPNmngWBZkdpvvPAi6YcKEy8ykBJVv6RVJd/ayePl0XlXvCZDsn
 Nfi0SJSjol6DSRW/4x+Q+5blbYPgWhr6H00p7klMMg+trWk4k/dLJVCOLM/3ap/+
 axfrizk1yVhhmwKbvfuHeJP3j8+uu2i9LP2GAUpiSp66OJSb46VA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id bmohrBAFACdf for <qemu-devel@nongnu.org>;
 Tue, 31 Aug 2021 19:10:50 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.16])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4GznbB0pg4z1Rvl9;
 Tue, 31 Aug 2021 19:10:45 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, David Hoppenbrouwers <david@salt-inc.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 07/33] hw/intc/sifive_clint: Fix muldiv64 overflow in
 sifive_clint_write_timecmp()
Date: Wed,  1 Sep 2021 12:09:32 +1000
Message-Id: <20210901020958.458454-8-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
References: <20210901020958.458454-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=871df42ed=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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

From: David Hoppenbrouwers <david@salt-inc.org>

`muldiv64` would overflow in cases where the final 96-bit value does not
fit in a `uint64_t`. This would result in small values that cause an
interrupt to be triggered much sooner than intended.

The overflow can be detected in most cases by checking if the new value i=
s
smaller than the previous value. If the final result is larger than
`diff` it is either correct or it doesn't matter as it is effectively
infinite anyways.

`next` is an `uint64_t` value, but `timer_mod` takes an `int64_t`. This
resulted in high values such as `UINT64_MAX` being converted to `-1`,
which caused an immediate timer interrupt.

By limiting `next` to `INT64_MAX` no overflow will happen while the
timer will still be effectively set to "infinitely" far in the future.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/493
Signed-off-by: David Hoppenbrouwers <david@salt-inc.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210827152324.5201-1-david@salt-inc.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 hw/intc/sifive_clint.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/hw/intc/sifive_clint.c b/hw/intc/sifive_clint.c
index 0f41e5ea1c..99c870ced2 100644
--- a/hw/intc/sifive_clint.c
+++ b/hw/intc/sifive_clint.c
@@ -59,8 +59,29 @@ static void sifive_clint_write_timecmp(RISCVCPU *cpu, =
uint64_t value,
     riscv_cpu_update_mip(cpu, MIP_MTIP, BOOL_TO_MASK(0));
     diff =3D cpu->env.timecmp - rtc_r;
     /* back to ns (note args switched in muldiv64) */
-    next =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) +
-        muldiv64(diff, NANOSECONDS_PER_SECOND, timebase_freq);
+    uint64_t ns_diff =3D muldiv64(diff, NANOSECONDS_PER_SECOND, timebase=
_freq);
+
+    /*
+     * check if ns_diff overflowed and check if the addition would poten=
tially
+     * overflow
+     */
+    if ((NANOSECONDS_PER_SECOND > timebase_freq && ns_diff < diff) ||
+        ns_diff > INT64_MAX) {
+        next =3D INT64_MAX;
+    } else {
+        /*
+         * as it is very unlikely qemu_clock_get_ns will return a value
+         * greater than INT64_MAX, no additional check is needed for an
+         * unsigned integer overflow.
+         */
+        next =3D qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + ns_diff;
+        /*
+         * if ns_diff is INT64_MAX next may still be outside the range
+         * of a signed integer.
+         */
+        next =3D MIN(next, INT64_MAX);
+    }
+
     timer_mod(cpu->env.timer, next);
 }
=20
--=20
2.31.1


