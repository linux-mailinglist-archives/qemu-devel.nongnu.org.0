Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E821E437878
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 15:56:57 +0200 (CEST)
Received: from localhost ([::1]:33768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdv2X-0005Xk-0O
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 09:56:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdumc-0001oF-Cy
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:40:30 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:39690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=9222bbd82=alistair.francis@opensource.wdc.com>)
 id 1mdumZ-0001Qs-UT
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 09:40:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1634910026; x=1666446026;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NukPHe0iX3t5gd8afqd9RhYtpIE/sHpPRoxsNoRCGq4=;
 b=CQTS8kCuq5Cioi2N89Sf77dKIG/lposRux1oFyLOtZuBIHk5rCLvjxs5
 uj2cFzMiaxFZeJwF3fevOCeu9y7dwUqeGuCJAqCm8O5Tbn5iRXXjnJ9vt
 kWkgLmaj30RDXMJeCZ181QFzM6sRFGRnv1YmW6y4lSIVxvonnqjurGWBh
 2IPEvW9saUwmShVggjuppHto7rqb7UyCwNiGHKYmMRxWNZMiadsCajYCw
 8S2MHjpdIIZDXOZFGS8VAN7hYAu6R17l2XpnaNDks47BfAeCumtABTyLA
 P7RNTev32PawtA/PYI5j/ROR6A+BJATYz4+magW0k+M27AZyA0Ih0Em7X g==;
X-IronPort-AV: E=Sophos;i="5.87,172,1631548800"; d="scan'208";a="183617893"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 22 Oct 2021 21:40:25 +0800
IronPort-SDR: oRV9JD/ZVhgo439QA30m3U+KGztaWZg/uYH/Rkjqv2eO3yqMC9uOjctD3hrRiwA70EJ4S2l/I3
 jXG7dtBG7hvooYmLqKSAKx9ZGFMoa1C8sgGPFFqGyurTnh75fIO5uUq/LAqPUg6nxpRzdBwpQZ
 h3JOg5JW/tTNyepoWLOPpWj57fOiP5qy5D99lGdyFFYQnk7eViAvPRfZpCXCo7v2tQLvspjsY8
 O+0GOVCeR37p8G9oileb57FtDNlpyIB8oijd4DaB9Yw+cv9sIV7CP3F8bDUQlObYzDUBi+YvPa
 L6Cs/L0EKobAle+e76C29YN/
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:16:01 -0700
IronPort-SDR: REF48Jri0nfK6XtJs+MMf7YG/l0UWpe/Bu7Ddsibnp29zDy4flbJI2Pl+KTiUBIUvYh3dA0BUk
 fbuVBugWJYh5AiIW8vqkCSd00Kpkrh2I97wl7uS2TMmA4lJ4Zybz75UfzP1NoT/FlKZ9Bx/rIN
 8FQ2MMLMC3uCCOThKkLghwedBBap4ISJgcmjc3oGDcGcf+THE9fRLBk41WREaez/awKyHp6OIy
 wnGXuGjcz5T/ogIVh4wv/1nzfWbNI8aEdGhSkrF735TWpF2Cvmlmpjn3A9ntQARlkr1/fzraV9
 phs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 06:40:27 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HbQTQ69rQz1RtVm
 for <qemu-devel@nongnu.org>; Fri, 22 Oct 2021 06:40:26 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1634910026; x=1637502027; bh=NukPHe0iX3t5gd8afq
 d9RhYtpIE/sHpPRoxsNoRCGq4=; b=ePzcD/Jc3FfE9X5DTSGPF/PTzU8K0LZzT4
 pGWQ7HPaRwJjrN2GxPFCMWv79LABAuH28Cft4Di+Et0QEbVIFAv3s6azq7jtAjQi
 a6Xnd1Jo/oJj7E5r/I+pE6DhruRVhGFuDL4xF+HCEQeWihI4HtrjDMfWhLD6gwra
 ncacOQ73xuLOAz23YjaUR5sGTFwdGX3M8ONzKcM8jnWAbXI6egmLT6GwJFF5w69c
 +hn96+l/ZlMMTYhIcysTkmwId8xBvhGP7qvmTlwFWQ+AuPndzp6NFPOZwVXYo5QP
 aC9fYFqdq4zH+nQe/IKDiT+dx94jgGRvPp5f+rUrp8k8tnjQj2dA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 5Xr-a8PHU_3E for <qemu-devel@nongnu.org>;
 Fri, 22 Oct 2021 06:40:26 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.39])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HbQTL6PVxz1RtVl;
 Fri, 22 Oct 2021 06:40:22 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 21/33] target/riscv: Use riscv_csrrw_debug for cpu_dump
Date: Fri, 22 Oct 2021 23:38:00 +1000
Message-Id: <20211022133812.3972903-22-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
References: <20211022133812.3972903-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=9222bbd82=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Use the official debug read interface to the csrs,
rather than referencing the env slots directly.
Put the list of csrs to dump into a table.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20211020031709.359469-15-richard.henderson@linaro.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 89 +++++++++++++++++++++++-----------------------
 1 file changed, 45 insertions(+), 44 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index dd9eccd68e..788fa0b11c 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -242,51 +242,52 @@ static void riscv_cpu_dump_state(CPUState *cs, FILE=
 *f, int flags)
 #endif
     qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "pc      ", env->pc);
 #ifndef CONFIG_USER_ONLY
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mhartid ", env->mhartid)=
;
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatus ", (target_ulong=
)env->mstatus);
-    if (riscv_cpu_mxl(env) =3D=3D MXL_RV32) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mstatush ",
-                     (target_ulong)(env->mstatus >> 32));
-    }
-    if (riscv_has_ext(env, RVH)) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hstatus ", env->hsta=
tus);
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vsstatus",
-                     (target_ulong)env->vsstatus);
-    }
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mip     ", env->mip);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mie     ", env->mie);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mideleg ", env->mideleg)=
;
-    if (riscv_has_ext(env, RVH)) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hideleg ", env->hide=
leg);
-    }
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "medeleg ", env->medeleg)=
;
-    if (riscv_has_ext(env, RVH)) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "hedeleg ", env->hede=
leg);
-    }
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtvec   ", env->mtvec);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "stvec   ", env->stvec);
-    if (riscv_has_ext(env, RVH)) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vstvec  ", env->vstv=
ec);
-    }
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mepc    ", env->mepc);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "sepc    ", env->sepc);
-    if (riscv_has_ext(env, RVH)) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vsepc   ", env->vsep=
c);
-    }
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mcause  ", env->mcause);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "scause  ", env->scause);
-    if (riscv_has_ext(env, RVH)) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "vscause ", env->vsca=
use);
-    }
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval   ", env->mtval);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "stval   ", env->stval);
-    if (riscv_has_ext(env, RVH)) {
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "htval   ", env->htva=
l);
-        qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mtval2  ", env->mtva=
l2);
+    {
+        static const int dump_csrs[] =3D {
+            CSR_MHARTID,
+            CSR_MSTATUS,
+            CSR_MSTATUSH,
+            CSR_HSTATUS,
+            CSR_VSSTATUS,
+            CSR_MIP,
+            CSR_MIE,
+            CSR_MIDELEG,
+            CSR_HIDELEG,
+            CSR_MEDELEG,
+            CSR_HEDELEG,
+            CSR_MTVEC,
+            CSR_STVEC,
+            CSR_VSTVEC,
+            CSR_MEPC,
+            CSR_SEPC,
+            CSR_VSEPC,
+            CSR_MCAUSE,
+            CSR_SCAUSE,
+            CSR_VSCAUSE,
+            CSR_MTVAL,
+            CSR_STVAL,
+            CSR_HTVAL,
+            CSR_MTVAL2,
+            CSR_MSCRATCH,
+            CSR_SSCRATCH,
+            CSR_SATP,
+        };
+
+        for (int i =3D 0; i < ARRAY_SIZE(dump_csrs); ++i) {
+            int csrno =3D dump_csrs[i];
+            target_ulong val =3D 0;
+            RISCVException res =3D riscv_csrrw_debug(env, csrno, &val, 0=
, 0);
+
+            /*
+             * Rely on the smode, hmode, etc, predicates within csr.c
+             * to do the filtering of the registers that are present.
+             */
+            if (res =3D=3D RISCV_EXCP_NONE) {
+                qemu_fprintf(f, " %-8s " TARGET_FMT_lx "\n",
+                             csr_ops[csrno].name, val);
+            }
+        }
     }
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "mscratch", env->mscratch=
);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "sscratch", env->sscratch=
);
-    qemu_fprintf(f, " %s " TARGET_FMT_lx "\n", "satp    ", env->satp);
 #endif
=20
     for (i =3D 0; i < 32; i++) {
--=20
2.31.1


