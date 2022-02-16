Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BF84B82DE
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 09:24:12 +0100 (CET)
Received: from localhost ([::1]:58684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKFbf-0001zY-BP
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 03:24:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDq1-0006ut-QP
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:30:54 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:31617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=039576d22=alistair.francis@opensource.wdc.com>)
 id 1nKDpy-0006hk-Rf
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:30:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644993050; x=1676529050;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ussBVH1+4h81kyuO/1QLKONncT5n9KCiu13m38fRO1M=;
 b=TxWFcsg/V8J3nqwM/NwssX1kx9z6ev9k92eM3W6m7K67EjgidF8mQQ7M
 6d32Z/QU3ikL/FNA15HM37YF1YJG6vGXoXxEbF5dZKbcfLho0FZEfH1Hl
 ZNz7ZGDR6fvuy0h1JXn7rE/CfkXRf0IwVFzYD1aLwxw0sQk5wzF1PxdaN
 WKPq/NNFx8OgtfCx7paQTdQR+Ngr+lGlayN6XehThTPTRKbx71IeZ5ovL
 r3+84XViKsIULFurYaPEMsO5exuCbu2nk5hb/1VE3d89J22nDIVH4dOE8
 P8sLSOymeTDOS6lmZHVZ0kIju8sig+OiY5NPYl3baYbEt9zZLzIec0Uw+ Q==;
X-IronPort-AV: E=Sophos;i="5.88,373,1635177600"; d="scan'208";a="304974598"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 16 Feb 2022 14:30:50 +0800
IronPort-SDR: oQvYfIFgj2OjerVQx1/A5UkBXTAv8ei30prY+DvOaT0//kCpSTUqV5f72MA8B+ON5v1TgC/8y/
 ZvhBeLqOSXOFO7ecdnPaOnVPH9ehxRiIb7FNEVG6vjjKoFugRImmqVRdviLhj/Lgoi1Jl4L0jK
 VO4pgE8MlgAUUVD8OW3xnYn32a1zaaZjGMGpI09KtzuJEjBYSmUEKJlVLe1Ibt5tv3NWaBlKCj
 vRG6gBzH+inDDwSChb2wT8eqXSemyytz4yS0f401l98OlcAruumIrVvVM+xbakC8ShrmpKkQVP
 c7dASLGtiIPmV/oyue0PwbG0
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:03:38 -0800
IronPort-SDR: BONvIsffB7LMLf9QEVpMsgyK8V30AFDRtRc5DxTRZ/nK4Y4ofa/oT8MhV7MdjGo8z4rwb5wEdx
 KLY4MxyGH3Np4ZCXcyJZ8lcaar0VLIaMvUtKP50Mx/FM1JtW44ZSlbaiwIH9Mo6YLyOseCbIkA
 bJUZZXmnKdw7DP/5Dz1JLKCfR7Y/0SS9NGTeGDUTFXNgQGSng/CB++UjQOu/n1MbZNyDabQ+BO
 rDyqJGZdhXD8CXU7mvH3+pm+mHYRtuNW32MBP4H3M5zg2cHPxtg4VJTel5nmfjZVA/PVvJxj9z
 IBM=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 22:30:50 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Jz7Pj5k0Bz1SVp0
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:30:49 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1644993049; x=1647585050; bh=ussBVH1+4h81kyuO/1
 QLKONncT5n9KCiu13m38fRO1M=; b=Cb7XAQ2szVM+cOdv60+1lC0pWctP6vdKjD
 aNXwyVYR2PsZyIJ8WV+N/SFiTbLKmGij6qpjU8QOdqs48nP/RxStuJnJn3CsxgsJ
 55iedxlL2YXKDf9zymvIBRL5zCzRRAAoEBj9sAlxPm8fCE+ZWfFfft9A507AQ2Xf
 jMwqxGYHIobZTrRZ0v0346SwrD4Z7nvXacEenOHyKvUNHV0hc0z7LE8uhfifTe6d
 vNfVXL7TH6ya+8fWCFkJUMQg4bh/RgX0/vqvQB6EombfP8LzSo9UBvOisaEOvIRE
 OwxrgJwaymA/udyGcS7mou7dA1RKGPhpwM0beh40LWacEiW59tWw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id yYlLP7wmZOe7 for <qemu-devel@nongnu.org>;
 Tue, 15 Feb 2022 22:30:49 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.165.97])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Jz7Pd0ywwz1Rwrw;
 Tue, 15 Feb 2022 22:30:44 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Anup Patel <anup.patel@wdc.com>,
 Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Frank Chang <frank.chang@sifive.com>
Subject: [PULL v2 19/35] target/riscv: Allow AIA device emulation to set ireg
 rmw callback
Date: Wed, 16 Feb 2022 16:28:56 +1000
Message-Id: <20220216062912.319738-20-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
References: <20220216062912.319738-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=039576d22=alistair.francis@opensource.wdc.com;
 helo=esa1.hgst.iphmx.com
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

From: Anup Patel <anup.patel@wdc.com>

The AIA device emulation (such as AIA IMSIC) should be able to set
(or provide) AIA ireg read-modify-write callback for each privilege
level of a RISC-V HART.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Message-id: 20220204174700.534953-9-anup@brainfault.org
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h        | 23 +++++++++++++++++++++++
 target/riscv/cpu_helper.c | 14 ++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 8838c61ae4..6b6df57c42 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -256,6 +256,22 @@ struct CPURISCVState {
     uint64_t (*rdtime_fn)(uint32_t);
     uint32_t rdtime_fn_arg;
=20
+    /* machine specific AIA ireg read-modify-write callback */
+#define AIA_MAKE_IREG(__isel, __priv, __virt, __vgein, __xlen) \
+    ((((__xlen) & 0xff) << 24) | \
+     (((__vgein) & 0x3f) << 20) | \
+     (((__virt) & 0x1) << 18) | \
+     (((__priv) & 0x3) << 16) | \
+     (__isel & 0xffff))
+#define AIA_IREG_ISEL(__ireg)                  ((__ireg) & 0xffff)
+#define AIA_IREG_PRIV(__ireg)                  (((__ireg) >> 16) & 0x3)
+#define AIA_IREG_VIRT(__ireg)                  (((__ireg) >> 18) & 0x1)
+#define AIA_IREG_VGEIN(__ireg)                 (((__ireg) >> 20) & 0x3f)
+#define AIA_IREG_XLEN(__ireg)                  (((__ireg) >> 24) & 0xff)
+    int (*aia_ireg_rmw_fn[4])(void *arg, target_ulong reg,
+        target_ulong *val, target_ulong new_val, target_ulong write_mask=
);
+    void *aia_ireg_rmw_fn_arg[4];
+
     /* True if in debugger mode.  */
     bool debugger;
=20
@@ -433,6 +449,13 @@ uint32_t riscv_cpu_update_mip(RISCVCPU *cpu, uint32_=
t mask, uint32_t value);
 #define BOOL_TO_MASK(x) (-!!(x)) /* helper for riscv_cpu_update_mip valu=
e */
 void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uint64_t (*fn)(uint32_t=
),
                              uint32_t arg);
+void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
+                                   int (*rmw_fn)(void *arg,
+                                                 target_ulong reg,
+                                                 target_ulong *val,
+                                                 target_ulong new_val,
+                                                 target_ulong write_mask=
),
+                                   void *rmw_fn_arg);
 #endif
 void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv);
=20
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index e45ca08ea9..37c58a891b 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -396,6 +396,20 @@ void riscv_cpu_set_rdtime_fn(CPURISCVState *env, uin=
t64_t (*fn)(uint32_t),
     env->rdtime_fn_arg =3D arg;
 }
=20
+void riscv_cpu_set_aia_ireg_rmw_fn(CPURISCVState *env, uint32_t priv,
+                                   int (*rmw_fn)(void *arg,
+                                                 target_ulong reg,
+                                                 target_ulong *val,
+                                                 target_ulong new_val,
+                                                 target_ulong write_mask=
),
+                                   void *rmw_fn_arg)
+{
+    if (priv <=3D PRV_M) {
+        env->aia_ireg_rmw_fn[priv] =3D rmw_fn;
+        env->aia_ireg_rmw_fn_arg[priv] =3D rmw_fn_arg;
+    }
+}
+
 void riscv_cpu_set_mode(CPURISCVState *env, target_ulong newpriv)
 {
     if (newpriv > PRV_M) {
--=20
2.34.1


