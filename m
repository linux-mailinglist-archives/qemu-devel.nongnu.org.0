Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC28314F5B7
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Feb 2020 02:31:13 +0100 (CET)
Received: from localhost ([::1]:34802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixhcu-0007tb-LP
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 20:31:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57320)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2939926b3=alistair.francis@wdc.com>)
 id 1ixhIj-0004Xk-4M
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 20:10:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2939926b3=alistair.francis@wdc.com>)
 id 1ixhIg-0006ni-V4
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 20:10:20 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:17177)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=2939926b3=alistair.francis@wdc.com>)
 id 1ixhIg-0006JU-9z; Fri, 31 Jan 2020 20:10:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1580519417; x=1612055417;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MfQu9HMHEmztw0Fa6fuBAxvAEoLIXu7ltowVnPTQQzc=;
 b=ELQ19UmRLizUTH97D2avYGKMzGK5UaS0dWAog1WzyAdjQfYWnNIu7tR/
 JWwsyHopInLA6wpNBPRPW7d5gSICeCixZQcw0Pca0NqVJDxLgXqHm0lUD
 qDHKRsbvMY998/o+2avh0MCM97jFXgi63tN0d/C6FACaFN20LH43ipNri
 cIA6DPMAe0W/dcnBw+J6k8aCJCf9IhVVIItA45mxkcCphzMNbgY2sP0+v
 34x2TuqrQZM5bUllzBmLj7qDvWuRSiZvQuLrYqlbCJO4i0KzTTKrHC4EE
 gXaSxRJn8ul88MYTJfCuWsMWJT5m3oJJcyz10/D/LEZV9LQ4VMT8LyjIt w==;
IronPort-SDR: su27YOiF+PqMUcfevtiOGdUysBRlXXCX90+ZzbtCLf1ip5mN7rrXc3Wur5pC8Pb8l9sq3aAkDc
 VGyP9hH5icsblAjNOiZLYE8z/nuuMzeckK2BS3OpO93mVRdnZf55Iq7xsd0RUbVTvrpPWsrDhQ
 ueFDS6k9DI8sUljrLV4Vy9h7jzJoLWCFCzIO7iooZjfzII7QtzU46l5F+cJ+hCjjBp+FxcGxbR
 sy3jWU5Go2wCfPk4EMo9q3l8GrShbIQmp6tqHfP9UblrH1fW36JOApmWsvTX0rrGvhVmlsdh6y
 wTU=
X-IronPort-AV: E=Sophos;i="5.70,388,1574092800"; d="scan'208";a="128872490"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 01 Feb 2020 09:09:26 +0800
IronPort-SDR: 3djEoM8uMpWHtYSUcn6br7uD3n29nKjFiY+n2nHwZqJnqyin7ErWkdCts8EqUJbttlkxL6Yz/q
 Fn+03R5tYBKh3MyZOVcxTrv61NgwPbnO+yP1dWFmVPMyThT0D/M1XGgizB1L4/J+mDDTUrpEYa
 k7VTRXG882UvAvpxU2XEpf5VwzR4i7CD5RGdey4f7pZbyvdObixBLF/hukLuv6EypVUBP6l6y7
 OdHC3Dwhkvlyi+/fleT+pR5ZdvDgHRITx28PrIKXYlnL0D0qWsOIUdu6Y3Df8YY0dqxwFDzaeb
 hrU6ZTU+KmTZi8A9eeUUfIo2
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2020 17:02:35 -0800
IronPort-SDR: 7Uv/QrlUt9NqU/BpRAZ50rxhslP37ctsEHcVvWMB92J3R4FPmUTXV0lfpZn5/bZ5yCrM2HcsZ2
 /x1BwE6/fv2QM2u+C453peJmB53e3q1yrkb6ANFWdhfAcmu985fZGF6nmxJ93ddXm+vJdVoPmq
 VWhAnfuCeQzxhJxOjfWcXU2IODJHv/Nhvc0qzhloUleP4jef21ul8ukr7IImgiM4RXvgrU9rqu
 JPogv8iRzB1j8InsvOaGUNQLU2YN/ex59qYyJsjKdnDpUaW+LXGx5sGtzo9e8ESJqYhmxJAHdX
 Chs=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.158.235])
 by uls-op-cesaip01.wdc.com with ESMTP; 31 Jan 2020 17:09:26 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 28/35] target/riscv: Respect MPRV and SPRV for floating
 point ops
Date: Fri, 31 Jan 2020 17:02:49 -0800
Message-Id: <eb113cb1ad6f4c76644556fa610297e62dd2a30d.1580518859.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1580518859.git.alistair.francis@wdc.com>
References: <cover.1580518859.git.alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 216.71.154.42
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
Cc: alistair.francis@wdc.com, palmer@dabbelt.com, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

mark_fs_dirty() is the only place in translate.c that uses the
virt_enabled bool. Let's respect the contents of MSTATUS.MPRV and
HSTATUS.SPRV when setting the bool as this is used for performing
floating point operations when V=0.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 target/riscv/translate.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 61fe9f03be..240fd7c971 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -748,7 +748,21 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->mstatus_fs = ctx->base.tb->flags & TB_FLAGS_MSTATUS_FS;
     ctx->priv_ver = env->priv_ver;
 #if !defined(CONFIG_USER_ONLY)
-    ctx->virt_enabled = riscv_cpu_virt_enabled(env);
+    if (riscv_has_ext(env, RVH)) {
+        ctx->virt_enabled = riscv_cpu_virt_enabled(env);
+        if (env->priv_ver == PRV_M &&
+            get_field(env->mstatus, MSTATUS_MPRV) &&
+            get_field(env->mstatus, MSTATUS_MPV)) {
+            ctx->virt_enabled = true;
+        } else if (env->priv == PRV_S &&
+                   !riscv_cpu_virt_enabled(env) &&
+                   get_field(env->hstatus, HSTATUS_SPRV) &&
+                   get_field(env->hstatus, HSTATUS_SPV)) {
+            ctx->virt_enabled = true;
+        }
+    } else {
+        ctx->virt_enabled = false;
+    }
 #else
     ctx->virt_enabled = false;
 #endif
-- 
2.25.0


