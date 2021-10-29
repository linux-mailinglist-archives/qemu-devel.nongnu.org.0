Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E72AB43F7DF
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 09:32:41 +0200 (CEST)
Received: from localhost ([::1]:33412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgMNU-0001Dk-VK
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 03:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=929275e61=alistair.francis@opensource.wdc.com>)
 id 1mgM7P-0006wD-Ns
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:16:04 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:60735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=929275e61=alistair.francis@opensource.wdc.com>)
 id 1mgM7K-0001sI-DA
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:16:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635491755; x=1667027755;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W7oMGLcX+AkD/y2P+BS1j3A9Z2Cmw5E00UfbyUS7hiA=;
 b=bdqtUtDRz3IPI+swKx0nEnnVJR2Omkeh42zev2qpbLZRZTX6HA5TZMUJ
 AqrwTUVT5M9myGYLAt73JZs7H8tzQH6vRx1DaPLGOgZW3yKtnYESFTYz9
 U83QB7LRtQ5KwmYyi549qjBoD/pZBsfau6qzC/qy7X2QoUeHjuCGLMhm1
 XgQ7Ud5LSbeiGc78aN7Y4g67Ncx2P3DkCj++8bch1CIWHhaXPcoAmyppy
 aXbHiaHVrV4Xx6nOLGC7f29uBR1refq1XXaoGoRcSp5QxE1s1QAnJg2el
 Ry8LE5xUWRtvGTgbOPUUyTMjWLzqSVrjDO7Ie/14mgaH2K2NVHkVMuFLk w==;
X-IronPort-AV: E=Sophos;i="5.87,191,1631548800"; d="scan'208";a="184153264"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 Oct 2021 15:15:54 +0800
IronPort-SDR: BoB78xQEyEPiujMdWdAnl+NkA7dO9rkBmAcHzZJHuNc1pewlS5dZ0dvOnhDNVUkrbr9QLE120v
 4qxO+XQXahjhzj0DlHSH80hCPYbOGPT9tmFe6YNgLkitAsiVIhxp4TB9jtxq52tOUaFQvr+i6Q
 ue49DcuUmaWUhePx4y9mdq13Xi6l92vdpeUWvtArQIuXxsvfp8FkR4QvWW3HO16FnA4db/rqNH
 2XMfrGwUAamysv0H+8eyz9wiAAMYiQt0PXCkoyfw+k/pddfWK3kjKWuIjBfdaV3CtX3ks4+qXn
 I0qvmAhIdEAoW43k0xdRWeFP
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 23:49:49 -0700
IronPort-SDR: 1Q3KUQ2eC5ylSi+jEXUiM1WET1z6ctvEZFMmOeE8pXhqo+L9zO3Or/eVSKsNVXGLIUq5qYjncH
 Sf2+v6ngP9zix+QW+M7Te7tkKh11zw811BWGaPs9iQeWFstkT/2DgX7FwqRrahVvk8Pb7twxb+
 2gMA2ieMiTLwFBittgAC2sJvOuJoAogbAIMvPhg+yMs0atEKUcuuMImDnNIteFu+1bD4B5hghF
 nLn0ftyAI6oLPSf0ngRamWL8gKr5URMpi6/bVhK9xlsQkjRrNJFkoDpSVp7Ssl2delKRs2jggr
 zqw=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 00:15:57 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HgYcX156vz1RtVn
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 00:15:56 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1635491755; x=1638083756; bh=W7oMGLcX+AkD/y2P+B
 S1j3A9Z2Cmw5E00UfbyUS7hiA=; b=MPI43ZkIJ0xStR1W+19sZ882xUF1ap216S
 4C6SNJxFuCfFTk5xg6UaM0atqCwGN2hht3MWKZEBXrm7/sRX2euwOgOlIM2g6J+X
 KkA96WO/Llis73d/hiJRsdbou3geiHGrjF1NiA6jPXY/Lf09MtDopqRjf58zu/Bp
 VUoG2MvC6OwMs0tzo4ifsKMXlmSTEpoue0viJiDWguZ9pgtD+k8/uSuTPLQkXugA
 9ipaZuqgB3ZfWZ2v4wVgj4z0M3WmGsbyP00Egye4yrKVnLVMIxoqb+C7wT6VQucC
 KedJ3ge4o0K0R++HTANoCWxzCWTdpPdJ4VAvKRb7gBi/vr+Lu4YQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id pnmRN6cmWWF3 for <qemu-devel@nongnu.org>;
 Fri, 29 Oct 2021 00:15:55 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.42])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HgYcR3GH2z1RtVl;
 Fri, 29 Oct 2021 00:15:51 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Jose Martins <josemartins90@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v2 15/18] target/riscv: fix VS interrupts forwarding to HS
Date: Fri, 29 Oct 2021 17:08:14 +1000
Message-Id: <20211029070817.100529-16-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211029070817.100529-1-alistair.francis@opensource.wdc.com>
References: <20211029070817.100529-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=929275e61=alistair.francis@opensource.wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

From: Jose Martins <josemartins90@gmail.com>

VS interrupts (2, 6, 10) were not correctly forwarded to hs-mode when
not delegated in hideleg (which was not being taken into account). This
was mainly because hs level sie was not always considered enabled when
it should. The spec states that "Interrupts for higher-privilege modes,
y>x, are always globally enabled regardless of the setting of the global
yIE bit for the higher-privilege mode." and also "For purposes of
interrupt global enables, HS-mode is considered more privileged than
VS-mode, and VS-mode is considered more privileged than VU-mode". Also,
vs-level interrupts were not being taken into account unless V=3D1, but
should be unless delegated.

Finally, there is no need for a special case for to handle vs interrupts
as the current privilege level, the state of the global ie and of the
delegation registers should be enough to route all interrupts to the
appropriate privilege level in riscv_cpu_do_interrupt.

Signed-off-by: Jose Martins <josemartins90@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20211026145126.11025-2-josemartins90@gmail.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 28 ++++++++--------------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 662228c238..5076580374 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -135,36 +135,24 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, targe=
t_ulong *pc,
 #ifndef CONFIG_USER_ONLY
 static int riscv_cpu_local_irq_pending(CPURISCVState *env)
 {
-    target_ulong irqs;
+    target_ulong virt_enabled =3D riscv_cpu_virt_enabled(env);
=20
     target_ulong mstatus_mie =3D get_field(env->mstatus, MSTATUS_MIE);
     target_ulong mstatus_sie =3D get_field(env->mstatus, MSTATUS_SIE);
-    target_ulong hs_mstatus_sie =3D get_field(env->mstatus_hs, MSTATUS_S=
IE);
=20
-    target_ulong pending =3D env->mip & env->mie &
-                               ~(MIP_VSSIP | MIP_VSTIP | MIP_VSEIP);
-    target_ulong vspending =3D (env->mip & env->mie &
-                              (MIP_VSSIP | MIP_VSTIP | MIP_VSEIP));
+    target_ulong pending =3D env->mip & env->mie;
=20
     target_ulong mie    =3D env->priv < PRV_M ||
                           (env->priv =3D=3D PRV_M && mstatus_mie);
     target_ulong sie    =3D env->priv < PRV_S ||
                           (env->priv =3D=3D PRV_S && mstatus_sie);
-    target_ulong hs_sie =3D env->priv < PRV_S ||
-                          (env->priv =3D=3D PRV_S && hs_mstatus_sie);
+    target_ulong hsie   =3D virt_enabled || sie;
+    target_ulong vsie   =3D virt_enabled && sie;
=20
-    if (riscv_cpu_virt_enabled(env)) {
-        target_ulong pending_hs_irq =3D pending & -hs_sie;
-
-        if (pending_hs_irq) {
-            riscv_cpu_set_force_hs_excep(env, FORCE_HS_EXCEP);
-            return ctz64(pending_hs_irq);
-        }
-
-        pending =3D vspending;
-    }
-
-    irqs =3D (pending & ~env->mideleg & -mie) | (pending &  env->mideleg=
 & -sie);
+    target_ulong irqs =3D
+            (pending & ~env->mideleg & -mie) |
+            (pending &  env->mideleg & ~env->hideleg & -hsie) |
+            (pending &  env->mideleg &  env->hideleg & -vsie);
=20
     if (irqs) {
         return ctz64(irqs); /* since non-zero */
--=20
2.31.1


