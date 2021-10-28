Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B398843DAA2
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 07:07:14 +0200 (CEST)
Received: from localhost ([::1]:57380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfxd9-0001Qb-TX
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 01:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=928ee31ee=alistair.francis@opensource.wdc.com>)
 id 1mfxI1-0001As-O4
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:45:21 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:42396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=928ee31ee=alistair.francis@opensource.wdc.com>)
 id 1mfxHz-0005CM-Hv
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 00:45:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635396318; x=1666932318;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W7oMGLcX+AkD/y2P+BS1j3A9Z2Cmw5E00UfbyUS7hiA=;
 b=r3Ipv7QOLkcHG5qfRedLWuKklqlrBM81M2glbGWv8kKVBFFMxDNsvZ0V
 suAaoLSvWprGg0UR3PF2qSFy8ujZxKYlB1QaNKY7IoqttV1GR8UYYRNMX
 xlMki9gc3pM71LVniRDxAD6hMlUfxPjA+t9g+CJmEOS1ytod3InQC+mC4
 XUBW6rnRc/GQUn4nsnyppjwa11X686ps489XafR1kpmXCB9h9J/dFDjQN
 bK3CIQm1IkfXjrNiJU9s1lBWkZN2kJRk8h7e3GZ7x3Vd/VmTqy9CwY33L
 b/yVpJxCpWhsZipJ8QwEuyXL99gTm9SnKjjXfykSTuIUUA5shjtZuwQj1 w==;
X-IronPort-AV: E=Sophos;i="5.87,188,1631548800"; d="scan'208";a="188815821"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2021 12:45:17 +0800
IronPort-SDR: WS4KSC3mYdm5XvQQTc//36csLrJeKEoQnKeoK2qqAzSnJT+en+AUA2WPSoo8QGyjsLJSdaYFKl
 PQPjP+iJW+E79fkgyicgkcJO+7plXzjo8UTAGGaysBvFDraMgbS8afO/rmI0SHtVXJKLyhej66
 kamnIFOOLh4laAYYB/ZFvsDyFF9Dt+iQymJb0RbEzId3WTSXD9z0gGOqnIHC1GBin++9rv5Ybk
 Af5F9afOaJrUDhD1/oPfDwvUXLlsHWipyfUplGyYS10kYssH2+KIwOnV2voaB7l/hj89R0TxPX
 ZoVj94ycBTUCpBwyMgv5w+mW
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 21:19:13 -0700
IronPort-SDR: 5UqtuiJ4+7ewsadXsuo6qedJOuv+qzYICuciF1APnpCdom9kcey7Y0+NRbsaxeyKs+EZhbKfQg
 QGijAXuwg5DV+Z5v67KQ2u+muZs1PD+fcpf7ctO7mhoSrC4TOUxIzMXNd8HLZoy9vkDhmcWuKe
 MIV9x06R8M2pJ8fFy5olWKk++dfg3nr4aDye6LfMc452EsyfLDIg42Or0Z8nS5Wre6jctas+/u
 zvBDMFCL5GW7GgIZohNkui3LeNAiKSiQFj9XMN5qSPkrgcQrXtMof/2SQ7/CvMdwUkmY0aeTZy
 dKU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 21:45:19 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4HftKB3VQxz1RtVn
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 21:45:18 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1635396317; x=1637988318; bh=W7oMGLcX+AkD/y2P+B
 S1j3A9Z2Cmw5E00UfbyUS7hiA=; b=jScEq1whPQBokB2yaWHl7T7S5reLy1OH3/
 mAhzyjP7Ay0Aplw92reaqrHPSpgowvflWYYA0svWUwfqU4ztjpLF5/Mm43DHnEiF
 t/3CtOKCULLQKDbRQlE1thj2XObm7W5/deJb5lgcrAmTIuHlJ0GdgvupAoKvPGqZ
 9zKyxvRENUD11QzY29F2dUEmLaZWw9Dyto89G3I791p937oEodeK8NnXWWFCbOJx
 cwapWBVe9f8f/GLZENdFYQzTmSYJn53YNClUl7bbcJt+KXNHQX5atqwWmJUeHAXN
 gnvqvihNQH4Hv0nN/T2/H1q+FB01fHEDzJ1nnESZiB0bfvcLtXdQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id Hd5Xt9s8BpZh for <qemu-devel@nongnu.org>;
 Wed, 27 Oct 2021 21:45:17 -0700 (PDT)
Received: from toolbox.alistair23.me (unknown [10.225.165.40])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4HftK64X3rz1RtVl;
 Wed, 27 Oct 2021 21:45:13 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Jose Martins <josemartins90@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 17/18] target/riscv: fix VS interrupts forwarding to HS
Date: Thu, 28 Oct 2021 14:43:41 +1000
Message-Id: <20211028044342.3070385-18-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
References: <20211028044342.3070385-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.153.141;
 envelope-from=prvs=928ee31ee=alistair.francis@opensource.wdc.com;
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


