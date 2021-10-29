Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A11743F7C1
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 09:18:17 +0200 (CEST)
Received: from localhost ([::1]:34812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgM9Y-00073x-Es
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 03:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=929275e61=alistair.francis@opensource.wdc.com>)
 id 1mgM1r-0008R2-4E
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:10:20 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:17601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=929275e61=alistair.francis@opensource.wdc.com>)
 id 1mgM1n-0004hn-1L
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:10:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635491414; x=1667027414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wGyIdKI9dEPN8wPZ1iUdWigMHa8SpOE+exKfNqVyO4w=;
 b=J9fXWYDdqFHaT2rXNRBqCwQzLPbuLL87P8wTL4Y2Gg+fmShGy4gjSLz9
 Fty532jSm3mIHnJS3w1hFTENJSJdyNnjUGsa0Wmit9SNQzI2L0abdoiXv
 L+BigtCAfnbMAIKZX61nID9TeVUnHMZtI9iEZHPOufg3euZXPOD1LIeB8
 PWEoUk9sa4Ns1NNaY73JUsHUYN4tml1ER1de51mCHZwN+5JuFOMfHVQCW
 Trp06IBw6y6MZnpGoq5JOGkjAb6Ttj8Zi4hBYYKHsHbdVkwBaFyRp3CLH
 qwRbZeGo1Kh58C15B23dpb2ZUqI8NbKqJH08ucbzAQapJBM3rlzhOxf9v Q==;
X-IronPort-AV: E=Sophos;i="5.87,191,1631548800"; d="scan'208";a="188933915"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Oct 2021 15:10:12 +0800
IronPort-SDR: WWEQOxAamb3iEjI+VT5cBOWNVxVIfu0qScmbym//+ll8QnA87PqBvDh7fbvJ/uzy2SpN/PYqCo
 U157eE+VbLteE8kcYqMTipI/ZeGbgt8UQHkhhPBMN+DpucuhPEcvsTEPVALH9/xxvO9QU6U9RZ
 s7lDhGucAotG36Q8xuoonYNC3jZQlAQ97Y5BCPviC20NU4CvES8ufaikwG5Sbz706gaWRXGXjb
 Hz9nEVHAECXH5MBIk6o+g5gdWNzXV2awZhX1elSBCGpSvu6UVQev+URCiZ3eauYJaTQwvwSQNp
 rPs8hSeDW6QzfAT1zfzi7+0x
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 23:44:06 -0700
IronPort-SDR: zgMWU86Bb/5UJmrD3LAuh44WW7xNDT/4KV3ckdMMX0OMiwIU0AWJuL/zGMHTfF4JaHxAMBMvM0
 Cvvnou+cxFbX78W+7L89XrhKlqgBl3QLDu/dNY/jyX7JlhsBO9hPBHxrScaGHBH/5opByq0cLH
 NRFNLfmoGzKX/OlOz5+jimjUnUf5jxsSDSGl90jiSSfeFzBMSfZAHWpttuaF5sACuPdxyBNIIo
 a3Z8Nu8tF1jVpec9aoplqUVR4j0w46QWSzUAl5e0NaWVt2YaVpILw+WbI/f5HxyCEEPQrEhQ24
 Uj0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 00:10:14 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HgYTx20ntz1RtVp
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 00:10:13 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1635491412; x=1638083413; bh=wGyIdKI
 9dEPN8wPZ1iUdWigMHa8SpOE+exKfNqVyO4w=; b=PbMm9ki6wVfaxO0Yxet20/0
 4266CvRcVseR+bSkZUOx06BzLaYNNUjjvP2lncULVpMnpwzBq1lkOIgYS7rfyeOb
 nb0w94Q6xYCmdTfjD6BOEUnjTk51py1BwuAD1f//ZG46xGWOsoObb/B2DlzT8cAv
 WbsnSvXN7vOscAX1LJRCwOoQ6uokdbOS5hAbqZfueuDACHmdcXHo4ACPKiRVeJu0
 JtrVHBC4XjaRpXFhDEnSm6J2irHa60Jn4WUtw74ijcSfYfppFRsCtKneL60t2Ihe
 +LxLkS/XNu2v6jeCTyYHjdkyNPckL7fR9EM3RSHMn+KHV/EjLU7g6CgYvkC7ncw=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id DmhW1Ow8caNb for <qemu-devel@nongnu.org>;
 Fri, 29 Oct 2021 00:10:12 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.42])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HgYTr6yHcz1RtVl;
 Fri, 29 Oct 2021 00:10:08 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PULL v2 02/18] hw/riscv: boot: Add a PLIC config string function
Date: Fri, 29 Oct 2021 17:08:01 +1000
Message-Id: <20211029070817.100529-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211029070817.100529-1-alistair.francis@opensource.wdc.com>
References: <20211029070817.100529-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=929275e61=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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


