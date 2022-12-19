Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EBA65064A
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 03:20:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p75jU-0000MY-6k; Sun, 18 Dec 2022 21:18:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75jS-0000Jw-Ou
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:22 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=345d64987=alistair.francis@opensource.wdc.com>)
 id 1p75jQ-00019F-NM
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 21:18:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1671416300; x=1702952300;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SvE69aK7bAVRqVg7LOCIAVD1/g2aMYl/gyVgZLYkuxo=;
 b=QuvuhqWM0c9s5JLGeOaoHyW/+H/GJ3dYgZvEEPJPVfbmrfl49vggkEEM
 ByNpdl3IgWfhsoywEDbmtuWTwEyGfWNilk4xI3B3RflsxGxbZqujrYQ18
 Ai2t4GEg/RfMFycr7iXanI/i7GXgA3JvDvR+Ft0piPJ0w1sJzrIhjKavW
 x2e195NKFtZsj4+L5VVNAHQRailPM7nEEiscVgs0jynl7qM+WSNrJQWre
 +F9ogpWMfm7BBXrklemgyvplOQN0Hy8e/opHBl9e/AK6GSHu/v2Q1p2NS
 pvVC9yI2vRyBvfxtV8CF4Ljb83UztnnRmXK944xLirG1Voj3DZzFDKq+n A==;
X-IronPort-AV: E=Sophos;i="5.96,254,1665417600"; d="scan'208";a="331056793"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2022 10:18:16 +0800
IronPort-SDR: 2B8lmyRm2swy49srkEG9RVQfpy5KlKCGh6+ZrzEan8/lGTPPaMo1FBvqnQ0ZQ37L1ueJUPBjaa
 ZdvxQki2sgCX1i91mObfDWvNU4AG5MbWs+YbIjnKl/OrZwcmxmAkUPeNbq7sfEynhPCaRqDnLa
 52Ior/8ptf7cchEIOTtMamrONIuOl8zptVKv86O4M//Nt3Kha08DuofL4uEpRHpnXC6x9Yd9Vj
 GsUXGbYyrE5NAIGmmwRIrGvYfA6KVuIcPec5f57lUWBpLSIXYI0JwofXMDP043G/wKfR4IjL2D
 kos=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 17:36:33 -0800
IronPort-SDR: rGh2VywX4y/N6+w118sUGRNX585T4caY8P1PziB6fbOhBi5hjTTnHAj2Dmidq6A4ATV1YK1+5z
 5/D8ZVdVwFrlIM3oLTWWjnOO2mxp/gntxCY6uA5yT4+XBfBhEpOIjrZv3Gc+RFa/qVhFes+sZJ
 9QeNa2TMsV6fufSpBAsq55TNTcr5yg7HF9sy544j9sMul7m6kWEUy+M/RHaFHaZDze2Wc5q5ry
 xCvURZKt4jjuuvfJUum/TdBl8YbtjpM5hBrhfdD7LQdBDoBzUN1a/ugexAfLgGb3AzsCqHXEz/
 b+s=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Dec 2022 18:18:17 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nb3K46Sddz1RvTr
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 18:18:16 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1671416296; x=1674008297; bh=SvE69aK7bAVRqVg7LO
 CIAVD1/g2aMYl/gyVgZLYkuxo=; b=C+MoE9qJP96rPt8pvmNvlEETmd658lTPbS
 ovSK4YJlGV3NwIqiPoO+Aedz8481FX0UIDqqNXss5ppkDxaCZH/L7FDVp8gG3J4O
 aqztmMQQFIEz0OAvbuCf5vMeAVIA0El9FGZ5MfdX6toSPpCvlWFT5s7qNis8uu4T
 MmVfSXKmcfCHAKrlbzHUxkPby6PYAz+Oi1KaHivuLR+nCywHTvWc7pvBR2d/hT1u
 Jpo20WqizQLIClJVFdlJRZWVyhG1/CI7/8EmAen/i/I9EoZzDJUTzdp8whoDabyi
 EiqYURtFTtg3RDYpki2KJW+1Ie4KCFPBJYBcYwrDL6gNowbEjAww==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id jRVtmDC6ODMx for <qemu-devel@nongnu.org>;
 Sun, 18 Dec 2022 18:18:16 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.167.4])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nb3K26zmMz1RvLy;
 Sun, 18 Dec 2022 18:18:14 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Bin Meng <bmeng@tinylab.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 27/45] target/riscv: Simplify helper_sret() a little bit
Date: Mon, 19 Dec 2022 12:16:45 +1000
Message-Id: <20221219021703.20473-28-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
References: <20221219021703.20473-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=345d64987=alistair.francis@opensource.wdc.com;
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

From: Bin Meng <bmeng@tinylab.org>

There are 2 paths in helper_sret() and the same mstatus update codes
are replicated. Extract the common parts to simplify it a little bit.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221207090037.281452-1-bmeng@tinylab.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/op_helper.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index d7af7f056b..a047d38152 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -149,21 +149,21 @@ target_ulong helper_sret(CPURISCVState *env)
     }
=20
     mstatus =3D env->mstatus;
+    prev_priv =3D get_field(mstatus, MSTATUS_SPP);
+    mstatus =3D set_field(mstatus, MSTATUS_SIE,
+                        get_field(mstatus, MSTATUS_SPIE));
+    mstatus =3D set_field(mstatus, MSTATUS_SPIE, 1);
+    mstatus =3D set_field(mstatus, MSTATUS_SPP, PRV_U);
+    env->mstatus =3D mstatus;
=20
     if (riscv_has_ext(env, RVH) && !riscv_cpu_virt_enabled(env)) {
         /* We support Hypervisor extensions and virtulisation is disable=
d */
         target_ulong hstatus =3D env->hstatus;
=20
-        prev_priv =3D get_field(mstatus, MSTATUS_SPP);
         prev_virt =3D get_field(hstatus, HSTATUS_SPV);
=20
         hstatus =3D set_field(hstatus, HSTATUS_SPV, 0);
-        mstatus =3D set_field(mstatus, MSTATUS_SPP, 0);
-        mstatus =3D set_field(mstatus, SSTATUS_SIE,
-                            get_field(mstatus, SSTATUS_SPIE));
-        mstatus =3D set_field(mstatus, SSTATUS_SPIE, 1);
=20
-        env->mstatus =3D mstatus;
         env->hstatus =3D hstatus;
=20
         if (prev_virt) {
@@ -171,14 +171,6 @@ target_ulong helper_sret(CPURISCVState *env)
         }
=20
         riscv_cpu_set_virt_enabled(env, prev_virt);
-    } else {
-        prev_priv =3D get_field(mstatus, MSTATUS_SPP);
-
-        mstatus =3D set_field(mstatus, MSTATUS_SIE,
-                            get_field(mstatus, MSTATUS_SPIE));
-        mstatus =3D set_field(mstatus, MSTATUS_SPIE, 1);
-        mstatus =3D set_field(mstatus, MSTATUS_SPP, PRV_U);
-        env->mstatus =3D mstatus;
     }
=20
     riscv_cpu_set_mode(env, prev_priv);
--=20
2.38.1


