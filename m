Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EC14B80DB
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 07:58:03 +0100 (CET)
Received: from localhost ([::1]:58520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKEGI-00089C-It
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 01:58:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDow-0004cU-9S
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:29:46 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:59472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDot-0006Gk-89
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:29:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644992981; x=1676528981;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1LlxeqPKUqxNZbvQuHDGyDTVNCxzSfXuXd+6hiz6RuQ=;
 b=W37aIva/RL3xwV6CPQk2NlWR+6J4yYt0JD63p5LxSpJ4cMUh7x82YDBx
 5NpxdHQpX6R25tAqc2wD93oo27t7weyO8ExSrRsgr+J/8qbFcnl7bPo4D
 NfMNzd7+RlfSlFYPXV7Td/mrmo625BZtBXkwFqujkffUxQs/eTqXa4zon
 VDzWEZI3BcBemCY4hSvthWK3PlsfIf38dObIpkDTV2z1SYgATvldF9qIl
 F0WbGlz7FEhKy3rcY9htKOv1SopndUMIwSl3cZdnACwdGQjG8NyNFTGfR
 rKFeJOu2E9f3PVNdszErWyPoedxXc+wQWMIvutqLK7ZsJrWBegrlA2p9g Q==;
X-IronPort-AV: E=Sophos;i="5.88,373,1635177600"; d="scan'208";a="193072673"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Feb 2022 14:29:33 +0800
IronPort-SDR: LnLI+KxJJ6979i6RW75oe+m37cxbfbUrj1pP/fk0w8S5jy2Vy5klO7VbNpZnH4Dg1lJQoFlGkt
 j+p19uJ3/8gkKhk4XcKTJ8LEs3nqJyDH20XzaUd8aO/qnfrRIwZ4y2eJPmG6sJ4DDaOh6Y/KRQ
 HKHBwUwcTsu3PrMb2xrINDOW7meVUp10TravhXPpPfmhD3qNDbOy9d+B0Ll9J+yX0RultuQST9
 8Jfxg8iXtujsP/6YR3DGrG+B/bf16BHVSRulFZIdlFBwoGj4Qm3wJj0yli9qKNg567L59QV9Jg
 V9vHYzXCqwHyuP3L84UvnmES
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:02:23 -0800
IronPort-SDR: QKeq8i9huMn9jNkbdpzAWXLBX34su2QXNp4plIQ7mbz2qMzBQr51orxqlIKtRKTg2UR2Ivsp5d
 3+Ymr55eqE7CF5JXaRTut4tpknPEVYXncjKVTvYWQlJ6PyTfPqznnntt48UkLWBq1nwWw91hKV
 B9dksk7dOgr/wiv6MM87RTlkOBBTgGWZ818VV8zvXhD3mug3YozhFDUl6xxHHhad5GJLZbjqW2
 rZkxyTk71ZdAy8hzHbDCXhkZ7rR6wSbTMJRhlUTwXO3YJqxlpWCz+8+p4nesPvwpqd35ctIjCe
 kDQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:29:35 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jz7NH00Y4z1SVnx
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:29:34 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1644992974; x=1647584975; bh=1LlxeqP
 KUqxNZbvQuHDGyDTVNCxzSfXuXd+6hiz6RuQ=; b=e4Zvz2c/W4jcd2yyAqUlGOQ
 eC3YGISTWdeGYV1V1zp/Qy+vjDkJsxq+1G//VAHok5Mkd5ozkXQD1RPgH16QHJMA
 F42JqJtUaNOXm/J5U7QudB5FFsV1PCTkms22gBeMn8nQzRIBlZ4NwH7lAngRULtY
 siuiUF5U7K67fGHednEBqMuxvjnp1MCpK/0AGM4SwlusnRyBMLUvjgM3I+2sNSqz
 nW5onmu3esr54tNrDe7HJUXWiE126HpQCSSjsdUh4EWU8oXHdvogSynBF3Fi6NVQ
 UKhaePFSI5yeusuwwdDceDZqoS4EoOIOg4Y8gxz/Ob1DTk4HppwVJ6tS1nNoz/w=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id ziz7E5vCTin6 for <qemu-devel@nongnu.org>;
 Tue, 15 Feb 2022 22:29:34 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.97])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jz7NC1CwFz1Rwrw;
 Tue, 15 Feb 2022 22:29:30 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, 
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 03/35] target/riscv: correct "code should not be reached"
 for x-rv128
Date: Wed, 16 Feb 2022 16:28:40 +1000
Message-Id: <20220216062912.319738-4-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
References: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=039576d22=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-grenoble-alpes=
.fr>

The addition of uxl support in gdbstub adds a few checks on the maximum
register length, but omitted MXL_RV128, an experimental feature.
This patch makes rv128 react as rv64, as previously.

Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220124202456.420258-1-frederic.petrot@univ-grenoble-alpes.f=
r
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c     | 3 +--
 target/riscv/gdbstub.c | 3 +++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 1cb0436187..5ada71e5bf 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -528,9 +528,8 @@ static void riscv_cpu_realize(DeviceState *dev, Error=
 **errp)
     switch (env->misa_mxl_max) {
 #ifdef TARGET_RISCV64
     case MXL_RV64:
-        cc->gdb_core_xml_file =3D "riscv-64bit-cpu.xml";
-        break;
     case MXL_RV128:
+        cc->gdb_core_xml_file =3D "riscv-64bit-cpu.xml";
         break;
 #endif
     case MXL_RV32:
diff --git a/target/riscv/gdbstub.c b/target/riscv/gdbstub.c
index f531a74c2f..9ed049c29e 100644
--- a/target/riscv/gdbstub.c
+++ b/target/riscv/gdbstub.c
@@ -64,6 +64,7 @@ int riscv_cpu_gdb_read_register(CPUState *cs, GByteArra=
y *mem_buf, int n)
     case MXL_RV32:
         return gdb_get_reg32(mem_buf, tmp);
     case MXL_RV64:
+    case MXL_RV128:
         return gdb_get_reg64(mem_buf, tmp);
     default:
         g_assert_not_reached();
@@ -84,6 +85,7 @@ int riscv_cpu_gdb_write_register(CPUState *cs, uint8_t =
*mem_buf, int n)
         length =3D 4;
         break;
     case MXL_RV64:
+    case MXL_RV128:
         if (env->xl < MXL_RV64) {
             tmp =3D (int32_t)ldq_p(mem_buf);
         } else {
@@ -420,6 +422,7 @@ void riscv_cpu_register_gdb_regs_for_features(CPUStat=
e *cs)
                                  1, "riscv-32bit-virtual.xml", 0);
         break;
     case MXL_RV64:
+    case MXL_RV128:
         gdb_register_coprocessor(cs, riscv_gdb_get_virtual,
                                  riscv_gdb_set_virtual,
                                  1, "riscv-64bit-virtual.xml", 0);
--=20
2.34.1


