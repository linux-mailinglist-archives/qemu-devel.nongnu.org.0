Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3591F5E72D7
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 06:23:22 +0200 (CEST)
Received: from localhost ([::1]:41318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obaDh-0005yp-6d
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 00:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2580c328f=alistair.francis@opensource.wdc.com>)
 id 1obZya-0001kF-Ks
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 00:07:45 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:63953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2580c328f=alistair.francis@opensource.wdc.com>)
 id 1obZyX-0005dr-Rv
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 00:07:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1663906061; x=1695442061;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=49WlqYfO64I71tqOUFqqzaqviZGiRfGdnwt6HuZ6xNk=;
 b=qIJHMKy26SQqXK2rXTCfAAJPcpvrtSDIca6M2cfP6mrVKE8DXISNCNjR
 bUv7Bbr6GyBVHWy5IwrRL87skipR/laUEZf1F7P4WzNp+fwi3ZXrK36GO
 Ijncu+I9mOP471XUYgvtnBokWcRF5/8zeMCsOCviDahKxdlKYBePItdyk
 q1Youul7ky2uoiDBl7MUedzfMH1QVFTUpElQTvIp2uE84p9qQiFqBk7Ht
 KUx5/BOFC0mJt837V7+rvTyE0+CUIFEersjw0VrXonyx/Y6oc2KWSnpXG
 xymYWoq0TQbJ+jjDzqFi+XgSt6tjXTN0qFsDyJ5MRW5pn7enKeSSJkLYn w==;
X-IronPort-AV: E=Sophos;i="5.93,337,1654531200"; d="scan'208";a="212510487"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Sep 2022 12:07:40 +0800
IronPort-SDR: MhXRTS/2Ei7UQvjsoFn3KZCm4OeckVi3vGJK/NBqeLkTRZOg1mCjnNU/Aqa4d89uNB2FMbZ2gz
 v42Do0pMPyi3WAOqCNlsSFmdazTFNt9p7f3l0T9vT72YwRPBrjjAqcv1TO21RgyhzcnUsQnWQE
 27Tc6FAC2+efENp1FFRcVzE5Co1+REBPnGIXuNN8xieUgKVDF3By/SA7CMc+yiuoVK23aYousm
 ppMMbLtoWKAlUBJtsoTXUTAVOQMyEOiOSiy7Zd8Zi49CSo5WPegwH0A87aEfTnrciS+4drDmrz
 SznVvM1R26dvSJ9p+CdPPMdM
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Sep 2022 20:27:42 -0700
IronPort-SDR: TKd1x61m6kU1sWKCwDrZ3RH3v4GJhdjgWgX6eX7iy7g7hsVqSn58NlH6yss6YBIzbq5OEpbgS9
 H90rXPyz1mrp5RVfF9K2EkCESosvnJYhfCZBV6k0xBUlPlutOgoQsgjRFWkCNP6PHCzCjn0+8j
 xe2oofLbExtPkSn8aHwUYw3Lb2/jmvPmXyuaLsI/UPELFP6oqzZAMFwV7BS/KDK/Q7dAa5z/sW
 DIP3nImfu95yixxLNW5q6PyjotqOuoXhqFnURidRsMPvcUmdJ/+cHPIeIvFB0kPTXlGzkY9rXz
 qco=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Sep 2022 21:07:40 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MYdsR4Ms0z1Rwtl
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 21:07:39 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1663906059; x=1666498060; bh=49WlqYfO64I71tqOUF
 qqzaqviZGiRfGdnwt6HuZ6xNk=; b=tDCyC30figVprxSoPuSUwJnW37ryc9pruY
 FNn5TQ3mGx+t68u1TITSFzL7FK4jI0dNoSWUPjRiH/ZAgvIbwmggrWR1Cv5R7Hk7
 dWeqfeVnFE8GpTbBlmUZVIvPn2ObtpcsxIoL0642tK0Ep4GEQjWbKNTYo84qfZCS
 PYPeySru+FBqieBo6B5cxEiRChZT5xK7tWYH8XPyOx2GAG1QzRN5Ux7CMnt2UvSP
 EVQwnNYCorHWEZCH1wbr5L+Nbr7ay+jznUqbtr9yIoxjRzw/BwEyM95BPsozwkn0
 XNxuBpM8AwT6GVp4hGwulBEwor1e1R8yfwsVQFborgbGU5OayX8A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id BhAbIOPHVKI3 for <qemu-devel@nongnu.org>;
 Thu, 22 Sep 2022 21:07:39 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.167.114])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MYdsN3jwMz1RvLy;
 Thu, 22 Sep 2022 21:07:36 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Frank Chang <frank.chang@sifive.com>,
 Jim Shu <jim.shu@sifive.com>, Tommy Wu <tommy.wu@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PULL 11/12] target/riscv: Check the correct exception cause in
 vector GDB stub
Date: Fri, 23 Sep 2022 14:07:03 +1000
Message-Id: <20220923040704.428285-12-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923040704.428285-1-alistair.francis@opensource.wdc.com>
References: <20220923040704.428285-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=2580c328f=alistair.francis@opensource.wdc.com;
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


