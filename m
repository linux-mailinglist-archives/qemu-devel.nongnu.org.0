Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A64B3B071B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 16:11:58 +0200 (CEST)
Received: from localhost ([::1]:46472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvh87-0004aQ-Vs
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 10:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lvh5s-0002do-Oh
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 10:09:36 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:54812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lvh5r-0000h5-6D
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 10:09:36 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-VDwtQMmKME66JFPSCvzugQ-1; Tue, 22 Jun 2021 10:09:32 -0400
X-MC-Unique: VDwtQMmKME66JFPSCvzugQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F391B1084F53;
 Tue, 22 Jun 2021 14:09:30 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-113-182.ams2.redhat.com [10.36.113.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EAE855C1A3;
 Tue, 22 Jun 2021 14:09:29 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] target/ppc: Drop PowerPCCPUClass::interrupts_big_endian()
Date: Tue, 22 Jun 2021 16:09:26 +0200
Message-Id: <20210622140926.677618-3-groug@kaod.org>
In-Reply-To: <20210622140926.677618-1-groug@kaod.org>
References: <20210622140926.677618-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This isn't used anymore.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 target/ppc/cpu-qom.h  |  1 -
 target/ppc/cpu_init.c | 17 -----------------
 2 files changed, 18 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 06b6571bc9d5..7b424e3cb0bc 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -199,7 +199,6 @@ struct PowerPCCPUClass {
     void (*init_proc)(CPUPPCState *env);
     int  (*check_pow)(CPUPPCState *env);
     int (*handle_mmu_fault)(PowerPCCPU *cpu, vaddr eaddr, int rwx, int mmu=
_idx);
-    bool (*interrupts_big_endian)(PowerPCCPU *cpu);
 };
=20
 #ifndef CONFIG_USER_ONLY
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index d0411e7302a2..1a22aef874b1 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -2666,18 +2666,6 @@ static int check_pow_hid0_74xx(CPUPPCState *env)
     return 0;
 }
=20
-static bool ppc_cpu_interrupts_big_endian_always(PowerPCCPU *cpu)
-{
-    return true;
-}
-
-#ifdef TARGET_PPC64
-static bool ppc_cpu_interrupts_big_endian_lpcr(PowerPCCPU *cpu)
-{
-    return !(cpu->env.spr[SPR_LPCR] & LPCR_ILE);
-}
-#endif
-
 /*************************************************************************=
****/
 /* PowerPC implementations definitions                                    =
   */
=20
@@ -7740,7 +7728,6 @@ POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
                  POWERPC_FLAG_VSX;
     pcc->l1_dcache_size =3D 0x8000;
     pcc->l1_icache_size =3D 0x8000;
-    pcc->interrupts_big_endian =3D ppc_cpu_interrupts_big_endian_lpcr;
 }
=20
 static void init_proc_POWER8(CPUPPCState *env)
@@ -7918,7 +7905,6 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
                  POWERPC_FLAG_VSX | POWERPC_FLAG_TM;
     pcc->l1_dcache_size =3D 0x8000;
     pcc->l1_icache_size =3D 0x8000;
-    pcc->interrupts_big_endian =3D ppc_cpu_interrupts_big_endian_lpcr;
 }
=20
 #ifdef CONFIG_SOFTMMU
@@ -8136,7 +8122,6 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
                  POWERPC_FLAG_VSX | POWERPC_FLAG_TM | POWERPC_FLAG_SCV;
     pcc->l1_dcache_size =3D 0x8000;
     pcc->l1_icache_size =3D 0x8000;
-    pcc->interrupts_big_endian =3D ppc_cpu_interrupts_big_endian_lpcr;
 }
=20
 #ifdef CONFIG_SOFTMMU
@@ -8347,7 +8332,6 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
                  POWERPC_FLAG_VSX | POWERPC_FLAG_TM | POWERPC_FLAG_SCV;
     pcc->l1_dcache_size =3D 0x8000;
     pcc->l1_icache_size =3D 0x8000;
-    pcc->interrupts_big_endian =3D ppc_cpu_interrupts_big_endian_lpcr;
 }
=20
 #if !defined(CONFIG_USER_ONLY)
@@ -9094,7 +9078,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void =
*data)
     device_class_set_parent_unrealize(dc, ppc_cpu_unrealize,
                                       &pcc->parent_unrealize);
     pcc->pvr_match =3D ppc_pvr_match_default;
-    pcc->interrupts_big_endian =3D ppc_cpu_interrupts_big_endian_always;
     device_class_set_props(dc, ppc_cpu_properties);
=20
     device_class_set_parent_reset(dc, ppc_cpu_reset, &pcc->parent_reset);
--=20
2.31.1


