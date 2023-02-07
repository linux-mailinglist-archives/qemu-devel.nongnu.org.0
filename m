Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C68668D038
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 08:11:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPI7T-0006Ti-QA; Tue, 07 Feb 2023 02:10:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI7C-0006P9-SU
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:10:08 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=395dd5341=alistair.francis@opensource.wdc.com>)
 id 1pPI7A-0008RS-Ur
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 02:10:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1675753804; x=1707289804;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HrvGdwBQ1A0/YQ3vbbzrulPqW3kPC1uxYM1aaw0S+Hk=;
 b=Dgc0CEEi/+R56m+OBdlNQSMbe5IZrDjtV+ODQN6KFQbFXbl1+NhP/kt4
 571voTXNXK4g1ryOlMOj0K2rs4JUXGDosO9TFhw/g/9Ansl2rxeJAvDjx
 apVLmcUt528xeJMeW9AHxijtd4AHklJ1/2vGl+IHhrOTzc7t+hgHdi9Ei
 NfpTmQtFH+4YKm2+0yyHVoBWUazti/Pcvb2L3yTM10nanox57EGDlRQEM
 MPJUehc6FwGe4/Mj4JQdDwB3pOtqiCCrDGfHc8h2BwJ1Amndd/nVFq9Lh
 Z554/gZnywtl3WdTJbLLAOyllW+uwJS9zttb4oFnDAiVe23fuSss38CPq Q==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669046400"; d="scan'208";a="227657460"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Feb 2023 15:09:58 +0800
IronPort-SDR: 5ZgWs1LIAh4noLZSTbGGLCEA3lfu0bO07OM57aiM8C6ZExxj4/HMocAQuSrLT5zFo5kzYmdHiu
 jYv1g2J7o4VAH0x51LPvrvwejwxl6Bm8RHKWA9pPrOOWr5lTMVp7XtUCjKBFn8dDPeqsfBxQYy
 fNy8mWEfCFRrMdfOt2wLLuyTyO/3gqnAf1EvJoc3IG2oV4gYTibIifSGooK6o6hHx4+OV6c+Vs
 PQw9xJdG181O+Yn5AFzkEnBdXPWcIhNPXHUuGAmA+mVfTsh6s5ErRqNq2YULhugo3GKSKkOXGu
 ZsQ=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 22:27:15 -0800
IronPort-SDR: xWx1aSUA81BdGw4BQhUgddbU2TAqovuHGwKJfpxcLl3QcHug/rflpV/S0e4u7w8g2iAdCiRIhF
 mPT6PM7irYxTF+m+xe+IU9aMz5B1/fyAV6JqI9LEDtSchBS+EKL25qo6bWfZHz+Q+NVa8gS3Jb
 QHgD5zMwjMuIsnIFFoRHOE9K5AYDPiFKNYJP1S8zWpvrdRvq7SRPJX4kZVKCxY5ah1Xdv4D2dh
 BYEIVRwPOw67Iobmf/kY33l0IzVUOKu+UlxJhIOEquBxO22avn1G8w1oCW3LhTQhV1yQH3lvC6
 tVY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 23:09:58 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4P9vQZ23y1z1RvLy
 for <qemu-devel@nongnu.org>; Mon,  6 Feb 2023 23:09:58 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1675753797; x=1678345798; bh=HrvGdwBQ1A0/YQ3vbb
 zrulPqW3kPC1uxYM1aaw0S+Hk=; b=Cbcdu+1wYWIf6O+p82spXC2hZ6srH+fHWX
 Gkn1AHmjXdNNvTyI2mWNChswiVXVWeOvxrJNMLk9Kv4pTGjLcUnOuLcynPle5EYE
 3Wx57iLYD6FNskrRsJmgxWFfHHLThmw/vM2oET9p/LdO9Zgi3gB788Nfk8kdyrjS
 s0YXRGbE7exztdlZ4kiP60rPq/XVFTnPudUZCnGyX4wFq+VG98/QSGiDMKkRB9sq
 +iAEjo7gUV1oGoxAVajsrQWkYrCMitJ6GFsPCJb7U0XlXOGHw17w2eL5Mff27J0t
 Zu1Ea46AyPPRgGFyrFA/mXJwUHAHRv+YwQBjM76zQhAnh6vWXWEQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id QCcm-cntj9V2 for <qemu-devel@nongnu.org>;
 Mon,  6 Feb 2023 23:09:57 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.38])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4P9vQX4fzqz1RwqL;
 Mon,  6 Feb 2023 23:09:56 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <apatel@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 05/32] target/riscv: Don't clear mask in riscv_cpu_update_mip()
 for VSTIP
Date: Tue,  7 Feb 2023 17:09:16 +1000
Message-Id: <20230207070943.2558857-6-alistair.francis@opensource.wdc.com>
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

Instead of clearing mask in riscv_cpu_update_mip() for VSTIP, we
should call riscv_cpu_update_mip() with mask =3D=3D 0 from timer_helper.c
for VSTIP.

Fixes: 3ec0fe18a31f ("target/riscv: Add vstimecmp suppor")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230120125950.2246378-3-apatel@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c  |  2 --
 target/riscv/time_helper.c | 12 ++++++++----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 9a28816521..0d72466f3b 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -621,8 +621,6 @@ uint64_t riscv_cpu_update_mip(RISCVCPU *cpu, uint64_t=
 mask, uint64_t value)
         vsgein =3D (env->hgeip & (1ULL << gein)) ? MIP_VSEIP : 0;
     }
=20
-    /* No need to update mip for VSTIP */
-    mask =3D ((mask =3D=3D MIP_VSTIP) && env->vstime_irq) ? 0 : mask;
     vstip =3D env->vstime_irq ? MIP_VSTIP : 0;
=20
     QEMU_IOTHREAD_LOCK_GUARD();
diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
index 8cce667dfd..4fb2a471a9 100644
--- a/target/riscv/time_helper.c
+++ b/target/riscv/time_helper.c
@@ -27,7 +27,7 @@ static void riscv_vstimer_cb(void *opaque)
     RISCVCPU *cpu =3D opaque;
     CPURISCVState *env =3D &cpu->env;
     env->vstime_irq =3D 1;
-    riscv_cpu_update_mip(cpu, MIP_VSTIP, BOOL_TO_MASK(1));
+    riscv_cpu_update_mip(cpu, 0, BOOL_TO_MASK(1));
 }
=20
 static void riscv_stimer_cb(void *opaque)
@@ -57,16 +57,20 @@ void riscv_timer_write_timecmp(RISCVCPU *cpu, QEMUTim=
er *timer,
          */
         if (timer_irq =3D=3D MIP_VSTIP) {
             env->vstime_irq =3D 1;
+            riscv_cpu_update_mip(cpu, 0, BOOL_TO_MASK(1));
+        } else {
+            riscv_cpu_update_mip(cpu, MIP_STIP, BOOL_TO_MASK(1));
         }
-        riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(1));
         return;
     }
=20
+    /* Clear the [VS|S]TIP bit in mip */
     if (timer_irq =3D=3D MIP_VSTIP) {
         env->vstime_irq =3D 0;
+        riscv_cpu_update_mip(cpu, 0, BOOL_TO_MASK(0));
+    } else {
+        riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(0));
     }
-    /* Clear the [V]STIP bit in mip */
-    riscv_cpu_update_mip(cpu, timer_irq, BOOL_TO_MASK(0));
=20
     /* otherwise, set up the future timer interrupt */
     diff =3D timecmp - rtc_r;
--=20
2.39.1


