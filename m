Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F27065EBB5A
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 09:16:25 +0200 (CEST)
Received: from localhost ([::1]:43946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od4pN-0007X4-19
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 03:16:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od484-0005OZ-Qg
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:31:40 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:44546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=262caef14=alistair.francis@opensource.wdc.com>)
 id 1od483-0001Eu-0V
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 02:31:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1664260298; x=1695796298;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=49WlqYfO64I71tqOUFqqzaqviZGiRfGdnwt6HuZ6xNk=;
 b=P2C7yRkQN7CZyaK7JgJSBtT7GdOWEZYUz9T/ZcWr9dy5KO+Y4B0f4mEF
 TucQjLwbHcCLain7/FKF43zZ9dA31N7FrOdPMUx/YgBi2B4/4M0+mwnkP
 E6PVpI+tthBMtnT1KmOdjG1ZTm02zGVxjm15Js4xsQ69V4hp9QLiQOGYH
 Z1ppy02oIX3cCLXuVVEpy752nCdZRn0c58DPEfDsIC9qrcFPibeqGIEoY
 eX7ZJrhLzCY98xRkL/XP1nENYU/GX3O+xY93zFUI+merEqsX5rovRhZUj
 kedynbRWErHZVSnbT+L1breYkQbttAGUXWr/anXeeEnhTJhe4iHcNqWtz A==;
X-IronPort-AV: E=Sophos;i="5.93,348,1654531200"; d="scan'208";a="217530886"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 27 Sep 2022 14:31:28 +0800
IronPort-SDR: aJDcScBxJUSAPUCfyXYcZi6An0Uv6Hwq53klqun0qthAtAr+dbl1khmc+LXkc1iQm+Ca6qCWHt
 x+vrJYm8Pb4WpCAo5z+gdtUENj5XCrZBogEL2wedulqEv3AvOq+CZABh+CRTCl3LXD9bN9JD+N
 G+loeT/uor5gef/hBOwa/yCX+FiUqhfrY2Uwdq3t7dTg5obhSOpyviD70w/aslz2Hrv3CdIFcp
 YI4ZNG/gHKJE3BWMJbOoSPVY6Ph1pU1JJumyc5Uuolh6J4uLlC5EiG73Q62Mqc77R3/T+FEBqC
 fQf1G/graFE2TXssM0IqlkVB
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 22:51:25 -0700
IronPort-SDR: jVxv5Uj1FyKy7wH0k7PtLK0TZV41vFOMvniKO8MHo/rNNq3SDt4KmdbidSSUbAleu56EX7RdxX
 ayhlzeyscCsfnh2LOIfDBIiYA+MaXTK+c6wjDOvCxbx4HaU4uMLIFhpSbD7unhc/U/oCY+DUnV
 HYi+sBinUHAtOXfRXZiRAog3bRKe9z5RvvtXll9O2VB5T1zWdQkQsBW0ULC24K6DBU7ogXtGFL
 esJLT0+oOeGN6M3hDdXVKbQtR7OtLZS6oNd88/AGZ8KLu285ctJzZZ2M/lJTBbZi9v59EVI5cz
 B6k=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 23:31:28 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Mc8sW5JWlz1Rwt8
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 23:31:27 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1664260287; x=1666852288; bh=49WlqYfO64I71tqOUF
 qqzaqviZGiRfGdnwt6HuZ6xNk=; b=qGIWIZ6sFp0RRZwSjjLbClOsBAZzk9Csya
 rWmgiVB3S/Zyy0jTsrQIIWtrHtQAoKwRceMSXnPxiGlJrqIBi99xfGrIMlVBt9kW
 S7KzIGkS23u6f4FRKjwqUDJRjWCP7XGSm4wrkiKJkFmteWvzY4duQRa4snSOK3eH
 tV+i9lXqeLgl+NasOMxBtfkAflV/E/Ml+J0H4AYzE++yiw4a5oErkqMHkvRx6fQs
 Ku+8zG6OdGeKRt43/YSXqjtnYSgVFqvStp5ZwI+L9aHPNMT4+5/0H8G+JDry5VJ2
 phDe6CV9jgyOg7Z4kcNSlhi1FlQychPlLr74NNz+reR3tniC3LIg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id L2B_LbBLQ1c3 for <qemu-devel@nongnu.org>;
 Mon, 26 Sep 2022 23:31:27 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.123])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Mc8sT43nKz1Rwrq;
 Mon, 26 Sep 2022 23:31:25 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Jim Shu <jim.shu@sifive.com>, Tommy Wu <tommy.wu@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PULL v2 11/22] target/riscv: Check the correct exception cause in
 vector GDB stub
Date: Tue, 27 Sep 2022 16:30:53 +1000
Message-Id: <20220927063104.2846825-12-alistair.francis@opensource.wdc.com>
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

After RISCVException enum is introduced, riscv_csrrw_debug() returns
RISCV_EXCP_NONE to indicate there's no error. RISC-V vector GDB stub
should check the result against RISCV_EXCP_NONE instead of value 0.
Otherwise, 'E14' packet would be incorrectly reported for vector CSRs
when using "info reg vector" GDB command.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Jim Shu <jim.shu@sifive.com>
Reviewed-by: Tommy Wu <tommy.wu@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Message-Id: <20220918083245.13028-1-frank.chang@sifive.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/gdbstub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index 9974b7aac6..6e7bbdbd5e 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -183,7 +183,7 @@ static int riscv_gdb_get_vector(CPURISCVState *env, G=
ByteArray *buf, int n)
     target_ulong val =3D 0;
     int result =3D riscv_csrrw_debug(env, csrno, &val, 0, 0);
=20
-    if (result =3D=3D 0) {
+    if (result =3D=3D RISCV_EXCP_NONE) {
         return gdb_get_regl(buf, val);
     }
=20
@@ -210,7 +210,7 @@ static int riscv_gdb_set_vector(CPURISCVState *env, u=
int8_t *mem_buf, int n)
     target_ulong val =3D ldtul_p(mem_buf);
     int result =3D riscv_csrrw_debug(env, csrno, NULL, val, -1);
=20
-    if (result =3D=3D 0) {
+    if (result =3D=3D RISCV_EXCP_NONE) {
         return sizeof(target_ulong);
     }
=20
--=20
2.37.3


