Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C65064B31B9
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 01:10:47 +0100 (CET)
Received: from localhost ([::1]:43232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIfzy-0005S6-SY
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 19:10:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfqt-0004yW-2K
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:01:23 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:14672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=03511bb56=alistair.francis@opensource.wdc.com>)
 id 1nIfqr-0000AG-4j
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 19:01:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644624081; x=1676160081;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1LlxeqPKUqxNZbvQuHDGyDTVNCxzSfXuXd+6hiz6RuQ=;
 b=MgTUnkNFh1GoBBn315HGOE60PCSZ9VxMCZAQdbpwZPtpvsdqCnFdXpYQ
 Xp9KBoCXvahVxEG+BEhIORqKL2dJbaMdEOBbFBCtNXEgP8U3DxQnU4BXY
 yJGkT4vykAl06Z8A2L6LrTnJq9Qodkh6ODCFFv+FgPxgem+Dq/kz79YNQ
 abwoqNkXUrhVRPcr6tVJR1BefcWbB1sbpDcoss2APX/IiE7GA5ZidnaNl
 JDZayd8YEKlPokCOwkzF1flVT1e8O0W68RmpTvIyDA/N1g7aS6VdmiY3C
 Yw8EHou35/ebNxRIKiE/9y+39WK57B4+qtpJtJ1j69yKl4YK9Tobr/FOF A==;
X-IronPort-AV: E=Sophos;i="5.88,361,1635177600"; d="scan'208";a="191669363"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 12 Feb 2022 08:01:11 +0800
IronPort-SDR: m8JH4csPIdee2Jk+G/AMDf4bJhQsFiVt9x0r7GvdOB4pe7IXl9QAjHws617ty0Rm3pRyKMYPzc
 pOrtftWnkpBhYtKV1sMnGIvirBvQrdDMIem4P0HCRMQWoHNZtQBcLq+Yj/wiPFbmX8OoYyo8eO
 PAXehxIDNeN6LIemK9gUMgj2bwBM6vCYcJK6LZMBN0r+wRx9e28cG0plYhxBZW9ASkM61sp1/d
 WWHMNLlmQcD9YSeVUPbjt+0k+6kbdAr7JuwBukgjFHTl215XmBkSKm6ohfTydeHQ+zJJAggUxl
 6Ehnh/s0hbKGoH4K5ktoez/Q
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 15:32:56 -0800
IronPort-SDR: oI5ZaWOFMtvPxwp2isp8aEC5tBz36zk5i78X95uRPiV4P5mvbIjfde0AT6npYlcH1wJ/TGg3ln
 8ZJWzHqUlxS3HnT0vxGt0PDYu1XKbSSwzHdbNnbvdBfcAyCIM1jk8pBUYBKa+CVkY2TkWciy/9
 vC5DqGmrdoN6B8l+x69ZDnIRSFyGv46sApCgzyui3hb6LSdjr//3sXJZ2XTB0DOdQjC/GqjVbA
 U2pvFNnO4K1rDHJrJykN2brfN5DGP/O5fqwi6RvCwJtMkiSMQbzPOToUYnRv4IUfQdM8QXrnpt
 ZXg=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 16:01:11 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JwVxy6tysz1SHwl
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 16:01:10 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1644624070; x=1647216071; bh=1LlxeqP
 KUqxNZbvQuHDGyDTVNCxzSfXuXd+6hiz6RuQ=; b=OGF9qatY05lvrViEV54XrZq
 URI6qETSPTGlIOmJlMy4as83hVQQe1qTXxEKcbFRAguAzARH1M0O4hI4ai/ABm/h
 iXiWK/5gFxPgH99bc9HTRxpwPE2pozQN05e2X2k06qkCl5Y+DB9eS/iQr8vgg60Y
 Hva8DEx90TmwWJju1zkwf3b3GDBfHxCVRq2oPSVZIigmbLBrLw9ZSfLZeQjUNhk3
 zhoupUQiqcR7CrDoJOA3gBg2tv9D0RrCQR7689gaQrlsmViO6y76x4sAIENxH7D0
 qjc/wAjzG9+/WpAvXswhzv3pz/nRzV+XjtKJWFyyWNkx42zRY16Gy+ypNIjRFPA=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id IgfYsAoltPG9 for <qemu-devel@nongnu.org>;
 Fri, 11 Feb 2022 16:01:10 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.96])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JwVxt1PVxz1Rwrw;
 Fri, 11 Feb 2022 16:01:05 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, 
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 03/40] target/riscv: correct "code should not be reached" for
 x-rv128
Date: Sat, 12 Feb 2022 09:59:54 +1000
Message-Id: <20220212000031.3946524-4-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
References: <20220212000031.3946524-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=03511bb56=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


