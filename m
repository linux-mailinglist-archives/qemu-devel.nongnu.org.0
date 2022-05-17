Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E0B529899
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 06:14:11 +0200 (CEST)
Received: from localhost ([::1]:34194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqob4-0005k0-Rf
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 00:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=129fa4c84=alistair.francis@opensource.wdc.com>)
 id 1nqoYM-0001AB-TN
 for qemu-devel@nongnu.org; Tue, 17 May 2022 00:11:22 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:17754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=129fa4c84=alistair.francis@opensource.wdc.com>)
 id 1nqoYK-0001fr-Ri
 for qemu-devel@nongnu.org; Tue, 17 May 2022 00:11:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1652760680; x=1684296680;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ztmteRWb8i441NouTFGuv8lt2boGY+fkUWE8ffGyLY0=;
 b=mgcU1RuPVAWRJ24TfdTbrfXSIocpHwPzdPilLAl4JJZnHoa9+uVBLFAq
 ZaCZCq+LV8fe88rS+2I/hnORJILiCWwnvjfvmHNfLXpogPbwSq8YEm0jP
 7fMmkqvNcjJuVEguS9RLPAZBaOVkJf5y9TXk3RrL3y4qCHzQB3GBgxlK0
 SIMoLRWLd4zaI3AluIYeADhqzFTG6HZjNKC7AACLRQn8KrLv2IQBCDXu5
 lYOAVbB7RxIFz3DlgIO1X61akiB1LYjdyBVtT/xofLGxa6KSHzd0It05L
 NoFwYxLQViKUF2XaDBM/lJXgv9QPTH4TYFrYP1KNcBS9tWxQIpxre+O6+ g==;
X-IronPort-AV: E=Sophos;i="5.91,231,1647273600"; d="scan'208";a="205370381"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 17 May 2022 12:11:17 +0800
IronPort-SDR: cA5Z0zNr5/CpmkpyfCDIJoNfj9pw3Cxhpt1tPUDNrSWiYX42H5hHJWuNTBNiAh2WRSLx5hmAsU
 QgaHzPpfeXHv7vgUO11/4PY8TACTVcqHXVNMnZGelLFuUxWzzVgkx8zDt1OyYyi2cEhuOuQXSH
 9+K2WFHKyAe94zUqGS6E6hTnzUWmP4iuIVE+A0aLBX1eIxs321oKBeUc0DQpgKzJotaNq5kQLz
 9oDnBiCOn2X6XmeiwFBSqbIkpO8aiYUFKbPRIasI4w8NkrWG43rW7SjPDA03ypsN6fB0jwT2Tu
 NX7duTxlpDa7hFBcBYOlfRXK
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 May 2022 20:36:57 -0700
IronPort-SDR: 8t2TFLkLXkvGyzhAvbdn4i4BDUIUBSbUlKtmyQKjwtOjUMa2JaPKY9b4EuXtiIz4SOkV9L/2az
 z9cn/+EwMp7s/bAtrA7fPbg4O2T3u8jMu6EhNt2/6f9HVPyaOqQ6FZHuBVImcYD3d7XaKtCH8q
 cSuCoZIZQOWG3Gr/rzpT3IwGH//drd9eGr3SS/yKKcg1r5Y/gokt14jfIFOYOhEQwzuah35JZV
 TT0exqq33RNVA7WUeG4DTIBMSsHSo8OXuyGcEMfUwaIqz+xKdEo/EbdvhrftuvOrhvqDEAu65A
 +AU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 May 2022 21:11:17 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4L2N386XTBz1SVny
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 21:11:16 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1652760676; x=1655352677; bh=ztmteRWb8i441NouTF
 Guv8lt2boGY+fkUWE8ffGyLY0=; b=oh9ZfSWLTsAa7fx4n47TUdWgAVUp8mcL4q
 n/Ej8YmLhbM/XJJQ3Cuk8Uyzxv/oh2RKPF53y9X0Y0fSQGDz8zKF+XjUe+yetiZY
 D4vsM1XCjE7ARTK2/QGj2sPykvUsWAKltE2stY3RxtVk1MBREK+UyMmqbDrY9Id3
 UoZEWrtdt2SXOjg85Mg7N3V7s1k6/iK/Sos94pEBJ5TPpyBwkMH7s5Bj0EJgS1u3
 /8n8NDuWKHFQRdZLB1PCn/WQ4ihqY0N6Gg98GV5pk+nHVZ97f+4xWebC4Gu1N1q/
 uqr/1YKKF4aQkwq4deLc8cTb334kBJiwbipBUVQIZ9JbggSqXVPA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id rWt3uQViHebF for <qemu-devel@nongnu.org>;
 Mon, 16 May 2022 21:11:16 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.2])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4L2N360cFVz1Rvlc;
 Mon, 16 May 2022 21:11:13 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: bmeng.cn@gmail.com,
	palmer@dabbelt.com,
	alistair23@gmail.com
Subject: [PATCH 2/2] target/riscv: Run extension checks for all CPUs
Date: Tue, 17 May 2022 14:11:00 +1000
Message-Id: <20220517041100.93045-3-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220517041100.93045-1-alistair.francis@opensource.wdc.com>
References: <20220517041100.93045-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=129fa4c84=alistair.francis@opensource.wdc.com;
 helo=esa3.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Alistair Francis <alistair.francis@wdc.com>

Instead of just running the extension checks for the base CPUs, instead
run them for all CPUs.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 161 ++++++++++++++++++++++-----------------------
 1 file changed, 80 insertions(+), 81 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 49b844535a..ee48a18ae4 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -593,102 +593,101 @@ static void riscv_cpu_realize(DeviceState *dev, E=
rror **errp)
     }
     assert(env->misa_mxl_max =3D=3D env->misa_mxl);
=20
-    /* If only MISA_EXT is unset for misa, then set it from properties *=
/
-    if (env->misa_ext =3D=3D 0) {
-        uint32_t ext =3D 0;
+    /* Do some ISA extension error checking */
+    if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
+        error_setg(errp,
+                   "I and E extensions are incompatible");
+        return;
+    }
=20
-        /* Do some ISA extension error checking */
-        if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
-            error_setg(errp,
-                       "I and E extensions are incompatible");
-            return;
-        }
+    if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
+        error_setg(errp,
+                   "Either I or E extension must be set");
+        return;
+    }
=20
-        if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
-            error_setg(errp,
-                       "Either I or E extension must be set");
-            return;
-        }
+    if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
+                            cpu->cfg.ext_a && cpu->cfg.ext_f &&
+                            cpu->cfg.ext_d &&
+                            cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) =
{
+        warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
+        cpu->cfg.ext_i =3D true;
+        cpu->cfg.ext_m =3D true;
+        cpu->cfg.ext_a =3D true;
+        cpu->cfg.ext_f =3D true;
+        cpu->cfg.ext_d =3D true;
+        cpu->cfg.ext_icsr =3D true;
+        cpu->cfg.ext_ifencei =3D true;
+    }
=20
-        if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
-                                cpu->cfg.ext_a && cpu->cfg.ext_f &&
-                                cpu->cfg.ext_d &&
-                                cpu->cfg.ext_icsr && cpu->cfg.ext_ifence=
i)) {
-            warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
-            cpu->cfg.ext_i =3D true;
-            cpu->cfg.ext_m =3D true;
-            cpu->cfg.ext_a =3D true;
-            cpu->cfg.ext_f =3D true;
-            cpu->cfg.ext_d =3D true;
-            cpu->cfg.ext_icsr =3D true;
-            cpu->cfg.ext_ifencei =3D true;
-        }
+    if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
+        error_setg(errp, "F extension requires Zicsr");
+        return;
+    }
=20
-        if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
-            error_setg(errp, "F extension requires Zicsr");
-            return;
-        }
+    if ((cpu->cfg.ext_zfh || cpu->cfg.ext_zfhmin) && !cpu->cfg.ext_f) {
+        error_setg(errp, "Zfh/Zfhmin extensions require F extension");
+        return;
+    }
=20
-        if ((cpu->cfg.ext_zfh || cpu->cfg.ext_zfhmin) && !cpu->cfg.ext_f=
) {
-            error_setg(errp, "Zfh/Zfhmin extensions require F extension"=
);
-            return;
-        }
+    if (cpu->cfg.ext_d && !cpu->cfg.ext_f) {
+        error_setg(errp, "D extension requires F extension");
+        return;
+    }
=20
-        if (cpu->cfg.ext_d && !cpu->cfg.ext_f) {
-            error_setg(errp, "D extension requires F extension");
-            return;
-        }
+    if (cpu->cfg.ext_v && !cpu->cfg.ext_d) {
+        error_setg(errp, "V extension requires D extension");
+        return;
+    }
=20
-        if (cpu->cfg.ext_v && !cpu->cfg.ext_d) {
-            error_setg(errp, "V extension requires D extension");
-            return;
-        }
+    if ((cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) && !cpu->cfg.ext_f)=
 {
+        error_setg(errp, "Zve32f/Zve64f extensions require F extension")=
;
+        return;
+    }
+
+    if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
+        cpu->cfg.ext_zhinxmin) {
+        cpu->cfg.ext_zfinx =3D true;
+    }
=20
-        if ((cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) && !cpu->cfg.ex=
t_f) {
-            error_setg(errp, "Zve32f/Zve64f extensions require F extensi=
on");
+    if (cpu->cfg.ext_zfinx) {
+        if (!cpu->cfg.ext_icsr) {
+            error_setg(errp, "Zfinx extension requires Zicsr");
             return;
         }
-
-        /* Set the ISA extensions, checks should have happened above */
-        if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
-            cpu->cfg.ext_zhinxmin) {
-            cpu->cfg.ext_zfinx =3D true;
+        if (cpu->cfg.ext_f) {
+            error_setg(errp,
+                "Zfinx cannot be supported together with F extension");
+            return;
         }
+    }
=20
-        if (cpu->cfg.ext_zfinx) {
-            if (!cpu->cfg.ext_icsr) {
-                error_setg(errp, "Zfinx extension requires Zicsr");
-                return;
-            }
-            if (cpu->cfg.ext_f) {
-                error_setg(errp,
-                    "Zfinx cannot be supported together with F extension=
");
-                return;
-            }
-        }
+    if (cpu->cfg.ext_zk) {
+        cpu->cfg.ext_zkn =3D true;
+        cpu->cfg.ext_zkr =3D true;
+        cpu->cfg.ext_zkt =3D true;
+    }
=20
-        if (cpu->cfg.ext_zk) {
-            cpu->cfg.ext_zkn =3D true;
-            cpu->cfg.ext_zkr =3D true;
-            cpu->cfg.ext_zkt =3D true;
-        }
+    if (cpu->cfg.ext_zkn) {
+        cpu->cfg.ext_zbkb =3D true;
+        cpu->cfg.ext_zbkc =3D true;
+        cpu->cfg.ext_zbkx =3D true;
+        cpu->cfg.ext_zkne =3D true;
+        cpu->cfg.ext_zknd =3D true;
+        cpu->cfg.ext_zknh =3D true;
+    }
=20
-        if (cpu->cfg.ext_zkn) {
-            cpu->cfg.ext_zbkb =3D true;
-            cpu->cfg.ext_zbkc =3D true;
-            cpu->cfg.ext_zbkx =3D true;
-            cpu->cfg.ext_zkne =3D true;
-            cpu->cfg.ext_zknd =3D true;
-            cpu->cfg.ext_zknh =3D true;
-        }
+    if (cpu->cfg.ext_zks) {
+        cpu->cfg.ext_zbkb =3D true;
+        cpu->cfg.ext_zbkc =3D true;
+        cpu->cfg.ext_zbkx =3D true;
+        cpu->cfg.ext_zksed =3D true;
+        cpu->cfg.ext_zksh =3D true;
+    }
=20
-        if (cpu->cfg.ext_zks) {
-            cpu->cfg.ext_zbkb =3D true;
-            cpu->cfg.ext_zbkc =3D true;
-            cpu->cfg.ext_zbkx =3D true;
-            cpu->cfg.ext_zksed =3D true;
-            cpu->cfg.ext_zksh =3D true;
-        }
+    /* If only MISA_EXT is unset for misa, then set it from properties *=
/
+    if (env->misa_ext =3D=3D 0) {
+        uint32_t ext =3D 0;
=20
         if (cpu->cfg.ext_i) {
             ext |=3D RVI;
--=20
2.35.1


