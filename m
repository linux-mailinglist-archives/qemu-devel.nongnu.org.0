Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FAB43DA8B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 06:47:57 +0200 (CEST)
Received: from localhost ([::1]:50604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfxKW-000297-T2
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 00:47:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=928ee31ee=alistair.francis@opensource.wdc.com>)
 id 1mfxGo-0007k2-JQ
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:44:06 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:41715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=928ee31ee=alistair.francis@opensource.wdc.com>)
 id 1mfxGm-00027Z-Jd
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:44:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635396244; x=1666932244;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wGyIdKI9dEPN8wPZ1iUdWigMHa8SpOE+exKfNqVyO4w=;
 b=Ql9drBhT384Lwh/uH56raQldt/RZ9FWpJ/KCgOU6QEjY2A/WpV/SMHKr
 5D9TsMdehhXCsoAdmUqQ2/1lIJA5nAfwPbQymOI/xXFXHRR40e6/Ko+SC
 lOaC2nNXTJ7i9zaJXqwf+65pBS1tDO4ZgDZDMfTfUqwkGOkJTxVtuEWcW
 F7dWDmxqO6bayeeQ4f5MeB0jXLJFEKWMvOOuCr3zE6ysKe1Ro9ve5zFvx
 viGioYwGjQtZHwjdrLz6IlFHvgYo0cAYnPVHQ7MmJlt07LsE1AAe93Pfx
 VUA04iTctLTAOmrh96BaDrReGA4hG9uj81SMbLW1n/sBi7ynL5J/PCMqQ w==;
X-IronPort-AV: E=Sophos;i="5.87,188,1631548800"; d="scan'208";a="184975475"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2021 12:44:03 +0800
IronPort-SDR: uUACh98pLmEhX7ElZTmw5DjzQ16QRdqXqOABQWRrah7vAXPpldNKDTIEZt09InCz+8zSbiNDq+
 AHCzzX+0FdfwFakdZ8leZO9/yPYK6mX3JRw4Zuwh/Iw6lrolsQmzodPwOrKHC96SBncmxga9YI
 +4eqZUL4pRsLh0rnaOcHMfxLcr/cMhPJimLogQ+VWBJQ6MQ9jzX1m3UqB/bcgCEW3cyL72dhtL
 fIfkammIVJhBnEKuEX7cG0Pqp85jOB8CPJJC6l5C4TnF8tz0TbfjPNlkyyaA+2wgY7ZqsFA0IE
 7yFvZT1uFaPx7yI/fnTOyXbJ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 21:17:58 -0700
IronPort-SDR: a3zZ3otR6zIW2XahT3GsKl5qpckUfa9uWXamCsddLbHb2TXowcUCZA1HQ3ldYSQqjO79hTIy4p
 ONVYd7FX0drbQI7WWRf4XBlxYDdV6y/8Y8N43u26QCHgEOZPq/SGU2pmYDuUlUIiasLqOhQJhn
 kwnxH5KoBF77y8yOn10xO2opdkSzPlvpl51ULOeugcMamzk14/QsodlQ+NudgqKktXfreBIZRk
 uiekthByG34+Nu55FN295Lqp2Pz18ltb8BpOCDz6JRNnZugEesLEdXEF7z/N48MruBg+E1u94G
 Qfk=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 21:44:03 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HftHl1FxXz1RtVm
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 21:44:03 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1635396242; x=1637988243; bh=wGyIdKI
 9dEPN8wPZ1iUdWigMHa8SpOE+exKfNqVyO4w=; b=MhWNr9+Rq9EK4XAgDsGmXcG
 uhB+M8uPPmXfmnNXvDjrnHidRvI3b1AG1LQuAYaZSJsbUQgGfuaotTSx5yEVznxB
 dNZMxiGziyiMTd2849jhKUpsIETk0rAko0rKsxHLbv7eDDbu+HanvJzpfsBOc/jN
 ZyR0eScmi92LgA/10THh4p4E7SwOaNOzATHGUXN2UGTO10H28kSuOYyziFF/sgEL
 2R91bZE0A0tO6bgV5Fi2hz7WlB8zleiKdVoOfrFNZx+1Uj7UgYL338Jq49ZLXAGY
 A9dNxH+YStIC0PK5z8V++AsgbYKg+k0f/qFlqEDNederKpGcrtC5fqrJtEGwifA=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id uqeU_WL5Z2_H for <qemu-devel@nongnu.org>;
 Wed, 27 Oct 2021 21:44:02 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.40])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HftHg22FLz1RtVl;
 Wed, 27 Oct 2021 21:43:58 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL 02/18] hw/riscv: boot: Add a PLIC config string function
Date: Thu, 28 Oct 2021 14:43:26 +1000
Message-Id: <20211028044342.3070385-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
References: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=928ee31ee=alistair.francis@opensource.wdc.com;
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

From: Alistair Francis <alistair.francis@wdc.com>

Add a generic function that can create the PLIC strings.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Message-id: 20211022060133.3045020-2-alistair.francis@opensource.wdc.com
---
 include/hw/riscv/boot.h |  2 ++
 hw/riscv/boot.c         | 25 +++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/include/hw/riscv/boot.h b/include/hw/riscv/boot.h
index 0e89400b09..baff11dd8a 100644
--- a/include/hw/riscv/boot.h
+++ b/include/hw/riscv/boot.h
@@ -31,6 +31,8 @@
=20
 bool riscv_is_32bit(RISCVHartArrayState *harts);
=20
+char *riscv_plic_hart_config_string(int hart_count);
+
 target_ulong riscv_calc_kernel_start_addr(RISCVHartArrayState *harts,
                                           target_ulong firmware_end_addr=
);
 target_ulong riscv_find_and_load_firmware(MachineState *machine,
diff --git a/hw/riscv/boot.c b/hw/riscv/boot.c
index d1ffc7b56c..519fa455a1 100644
--- a/hw/riscv/boot.c
+++ b/hw/riscv/boot.c
@@ -38,6 +38,31 @@ bool riscv_is_32bit(RISCVHartArrayState *harts)
     return harts->harts[0].env.misa_mxl_max =3D=3D MXL_RV32;
 }
=20
+/*
+ * Return the per-socket PLIC hart topology configuration string
+ * (caller must free with g_free())
+ */
+char *riscv_plic_hart_config_string(int hart_count)
+{
+    g_autofree const char **vals =3D g_new(const char *, hart_count + 1)=
;
+    int i;
+
+    for (i =3D 0; i < hart_count; i++) {
+        CPUState *cs =3D qemu_get_cpu(i);
+        CPURISCVState *env =3D &RISCV_CPU(cs)->env;
+
+        if (riscv_has_ext(env, RVS)) {
+            vals[i] =3D "MS";
+        } else {
+            vals[i] =3D "M";
+        }
+    }
+    vals[i] =3D NULL;
+
+    /* g_strjoinv() obliges us to cast away const here */
+    return g_strjoinv(",", (char **)vals);
+}
+
 target_ulong riscv_calc_kernel_start_addr(RISCVHartArrayState *harts,
                                           target_ulong firmware_end_addr=
) {
     if (riscv_is_32bit(harts)) {
--=20
2.31.1


