Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9619F68D049
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:12:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPI7T-0006TU-3o; Tue, 07 Feb 2023 02:10:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI7D-0006PB-P5
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:10:08 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI7B-0008RG-SE
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:10:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1675753805; x=1707289805;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gcnU2z3zyBONFGYaHMbGRsbmykDiaelJ/LlnHvpcwpA=;
 b=LgNzKhDMNJePzpWvhENmWQu/H891V/iKF2YpQ/w6z4koc3YNrQaIlT9r
 vH/v2DEF8Y8Ov0IG9PsVNfhFE43+/XVEAgyDEAEzYFOOQWMJ8otu9FWSr
 1q8DIDzOGWC/fS/edV0rb3iQXpwL4e5d5xNjXMoC2kP/p3h/CLvdOO66y
 xBZ+ldO30UtRkQ2oHO+vxQEtJl8P+MTj6s9BpBJpXGlx050GONwjNJf7W
 f4uGq1/mBw7WIHJNBEk0J6WnqcLejfOFtqNwfOhMN2MHGbQ7TESIfLHhA
 oFw2ST3FkN8e5zUqCpaQGTthaeFGPgzOYNw3HTl2phACClCHF/zAnYdal A==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669046400"; d="scan'208";a="227657463"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Feb 2023 15:10:00 +0800
IronPort-SDR: pbbN4nkCm0/IMtVUDowFnQwIOzZRbZ0pNbb+QPeAU3AJMuzb3/vy9brrpNYkf4JQwQUifWHuiX
 Bjd0TAx3inxs3RnAVJY1ZmhMxteFZKpgEaVyU/FwAHqhnesT1zl/uLqq82MxKRQpOlHDK2YXtn
 /RppaHIqsze60+a2SB5ZxLQ5GiUrhwttCcMSstCh+DdCNN4sp6YwP6mV7eViPIRgaIfh/gWeD5
 LLmc5nnVG4IOGEpU/PHYaN/WGla4NeCkg/CoDcJs8KWC//0czdLtPeqVb4lhPylORaEFVBr9rE
 OHs=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 22:27:17 -0800
IronPort-SDR: zMjp0lSC2xMHmS/r9ug5CYS4cN0F3yXmnoNJc9mmn37OZxRE7Yc4iU+JKSDL6Hp01rnyOPuosZ
 4QVs3jgdIjTZeuB1PHSAh/hiNJmDx34mvF1rTFmmZMsqUZ/S2+1cqJeQSO+sWxiTBkv2eYeiKb
 zt9QDjIAzvyaVEuLxGRBXk93QsF5j5jNoRZxYsYrfcJ9ZoKMno2Q00c9JGcY2V4676rKJBzrDW
 2+a7VnCr+wFTFgdy9mfvYedccS2zoZIX4vyQSGs+drMqdiZ9eWAPrMC1FH/LEsOsiHMypIrXm0
 75k=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 23:10:00 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P9vQc0C0Cz1RvTr
 for <qemu-devel@nongnu.org>; Mon,  6 Feb 2023 23:10:00 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1675753799; x=1678345800; bh=gcnU2z3zyBONFGYaHM
 bGRsbmykDiaelJ/LlnHvpcwpA=; b=Bu2bXvfmAQPz4nvFhiaSGP79yK1McU7cp3
 JycESKZqHLYz+FU42mMvQrNRI3JeYjC0W5TpYEFcX+s6tk0UyJOK+PMaByd6FG65
 19HkGR2Sl2PlmxIGj082+osm9ntszgyd/VybXalG0TWwWAoyPgy+Qodl+zbnQsyU
 yfQ1g5q5+PUHvPNEuCYiSamvRzy9cNCpQjIiRkjQAvGotS2FgSRvntiTFBymSdvz
 7iE0dPl/cjwh50n6FuISi1/G2vJtNfYILlpElXLOy2VUb1ieGyi6MbecXAR5/8Lf
 hSPSMwXgRnRi5gkx1cgVYqc1z5i1djtFD7jD6SDkwNWvb4TqYFlw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id U57V9hpqoxGW for <qemu-devel@nongnu.org>;
 Mon,  6 Feb 2023 23:09:59 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P9vQZ24pNz1RvTp;
 Mon,  6 Feb 2023 23:09:58 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 06/32] target/riscv: No need to re-start QEMU timer when
 timecmp == UINT64_MAX
Date: Tue,  7 Feb 2023 17:09:17 +1000
Message-Id: <20230207070943.2558857-7-alistair.francis@opensource.wdc.com>
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

From: Anup Patel <apatel@ventanamicro.com>

The time CSR will wrap-around immediately after reaching UINT64_MAX
so we don't need to re-start QEMU timer when timecmp =3D=3D UINT64_MAX
in riscv_timer_write_timecmp().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230120125950.2246378-4-apatel@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/time_helper.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
index 4fb2a471a9..b654f91af9 100644
--- a/target/riscv/time_helper.c
+++ b/target/riscv/time_helper.c
@@ -72,6 +72,30 @@ void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTime=
r *timer,
         riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(0));
     }
=20
+    /*
+     * Sstc specification says the following about timer interrupt:
+     * "A supervisor timer interrupt becomes pending - as reflected in
+     * the STIP bit in the mip and sip registers - whenever time contain=
s
+     * a value greater than or equal to stimecmp, treating the values
+     * as unsigned integers. Writes to stimecmp are guaranteed to be
+     * reflected in STIP eventually, but not necessarily immediately.
+     * The interrupt remains posted until stimecmp becomes greater
+     * than time - typically as a result of writing stimecmp."
+     *
+     * When timecmp =3D UINT64_MAX, the time CSR will eventually reach
+     * timecmp value but on next timer tick the time CSR will wrap-aroun=
d
+     * and become zero which is less than UINT64_MAX. Now, the timer
+     * interrupt behaves like a level triggered interrupt so it will
+     * become 1 when time =3D timecmp =3D UINT64_MAX and next timer tick
+     * it will become 0 again because time =3D 0 < timecmp =3D UINT64_MA=
X.
+     *
+     * Based on above, we don't re-start the QEMU timer when timecmp
+     * equals UINT64_MAX.
+     */
+    if (timecmp =3D=3D UINT64_MAX) {
+        return;
+    }
+
     /* otherwise, set up the future timer interrupt */
     diff =3D timecmp - rtc_r;
     /* back to ns (note args switched in muldiv64) */
--=20
2.39.1


