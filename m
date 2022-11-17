Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A825F62D615
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 10:11:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovaub-0007YJ-29; Thu, 17 Nov 2022 04:10:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ovauY-0007Xb-5Y
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 04:10:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ovauW-0001r7-3X
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 04:10:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668676215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xVyFPyVSwupTgXx3RauOn52dEzy0+GPS97vq4WsSwJg=;
 b=WsTuq6Ek3mImxp3J7a71r50mDbwwnTvPSncmlXm/bILExMj2d3MI5svyaFCD3GCkN/uwqZ
 xl17jmSA8bEiJHRw8JWcMCrju9ju77JqKYlEzV9u7dVgAM8UAq81AA0T1N5drdlcsTrq/D
 12hfqS25nS2XhuLsdR4a2R5oLPFBmJ4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-UWnxrO0kOG25lesWRex1BA-1; Thu, 17 Nov 2022 04:10:13 -0500
X-MC-Unique: UWnxrO0kOG25lesWRex1BA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38FFD86E922
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 09:10:13 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 626FD2024CCA;
 Thu, 17 Nov 2022 09:10:12 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PULL 1/4] s390x: Fix spelling errors
Date: Thu, 17 Nov 2022 10:10:03 +0100
Message-Id: <20221117091006.525072-2-thuth@redhat.com>
In-Reply-To: <20221117091006.525072-1-thuth@redhat.com>
References: <20221117091006.525072-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Fix typos (discovered with the 'codespell' utility).
Note: Though "migrateable" still seems to be a valid spelling, we change
it to "migratable" since this is the way more common spelling here.

Message-Id: <20221111182828.282251-1-thuth@redhat.com>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/s390x/ipl.h                      | 2 +-
 pc-bios/s390-ccw/cio.h              | 2 +-
 pc-bios/s390-ccw/iplb.h             | 2 +-
 target/s390x/cpu_models.h           | 4 ++--
 hw/s390x/s390-pci-vfio.c            | 2 +-
 hw/s390x/s390-virtio-ccw.c          | 6 +++---
 target/s390x/ioinst.c               | 2 +-
 target/s390x/tcg/excp_helper.c      | 2 +-
 target/s390x/tcg/fpu_helper.c       | 2 +-
 target/s390x/tcg/misc_helper.c      | 2 +-
 target/s390x/tcg/translate.c        | 4 ++--
 target/s390x/tcg/translate_vx.c.inc | 6 +++---
 pc-bios/s390-ccw/start.S            | 2 +-
 13 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/hw/s390x/ipl.h b/hw/s390x/ipl.h
index dfc6dfd89c..7fc86e7905 100644
--- a/hw/s390x/ipl.h
+++ b/hw/s390x/ipl.h
@@ -140,7 +140,7 @@ void s390_ipl_clear_reset_request(void);
  * have an offset of 4 + n * 8 bytes within the struct in order
  * to keep it double-word aligned.
  * The total size of the struct must never exceed 28 bytes.
- * This definition must be kept in sync with the defininition
+ * This definition must be kept in sync with the definition
  * in pc-bios/s390-ccw/iplb.h.
  */
 struct QemuIplParameters {
diff --git a/pc-bios/s390-ccw/cio.h b/pc-bios/s390-ccw/cio.h
index 1e5d4e92e1..88a88adfd2 100644
--- a/pc-bios/s390-ccw/cio.h
+++ b/pc-bios/s390-ccw/cio.h
@@ -20,7 +20,7 @@ struct pmcw {
     __u32 intparm;      /* interruption parameter */
     __u32 qf:1;         /* qdio facility */
     __u32 w:1;
-    __u32 isc:3;        /* interruption sublass */
+    __u32 isc:3;        /* interruption subclass */
     __u32 res5:3;       /* reserved zeros */
     __u32 ena:1;        /* enabled */
     __u32 lm:2;         /* limit mode */
diff --git a/pc-bios/s390-ccw/iplb.h b/pc-bios/s390-ccw/iplb.h
index 772d5c57c9..cb6ac8a880 100644
--- a/pc-bios/s390-ccw/iplb.h
+++ b/pc-bios/s390-ccw/iplb.h
@@ -81,7 +81,7 @@ extern IplParameterBlock iplb __attribute__((__aligned__(PAGE_SIZE)));
 #define QIPL_FLAG_BM_OPTS_ZIPL  0x40
 
 /*
- * This definition must be kept in sync with the defininition
+ * This definition must be kept in sync with the definition
  * in hw/s390x/ipl.h
  */
 struct QemuIplParameters {
diff --git a/target/s390x/cpu_models.h b/target/s390x/cpu_models.h
index 74d1f87e4f..fb1adc8b21 100644
--- a/target/s390x/cpu_models.h
+++ b/target/s390x/cpu_models.h
@@ -24,13 +24,13 @@ struct S390CPUDef {
     uint8_t gen;            /* hw generation identification */
     uint16_t type;          /* cpu type identification */
     uint8_t ec_ga;          /* EC GA version (on which also the BC is based) */
-    uint8_t mha_pow;        /* Maximum Host Adress Power, mha = 2^pow-1 */
+    uint8_t mha_pow;        /* maximum host address power, mha = 2^pow-1 */
     uint32_t hmfai;         /* hypervisor-managed facilities */
     /* base/min features, must never be changed between QEMU versions */
     S390FeatBitmap base_feat;
     /* used to init base_feat from generated data */
     S390FeatInit base_init;
-    /* deafault features, QEMU version specific */
+    /* default features, QEMU version specific */
     S390FeatBitmap default_feat;
     /* used to init default_feat from generated data */
     S390FeatInit default_init;
diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
index 2aefa508a0..5f0adb0b4a 100644
--- a/hw/s390x/s390-pci-vfio.c
+++ b/hw/s390x/s390-pci-vfio.c
@@ -313,7 +313,7 @@ retry:
 /*
  * Get the host function handle from the vfio CLP capabilities chain.  Returns
  * true if a fh value was placed into the provided buffer.  Returns false
- * if a fh could not be obtained (ioctl failed or capabilitiy version does
+ * if a fh could not be obtained (ioctl failed or capability version does
  * not include the fh)
  */
 bool s390_pci_get_host_fh(S390PCIBusDevice *pbdev, uint32_t *fh)
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 7d80bc1837..2e64ffab45 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -354,7 +354,7 @@ static int s390_machine_protect(S390CcwMachineState *ms)
     }
 
     error_setg(&pv_mig_blocker,
-               "protected VMs are currently not migrateable.");
+               "protected VMs are currently not migratable.");
     rc = migrate_add_blocker(pv_mig_blocker, &local_err);
     if (rc) {
         ram_block_discard_disable(false);
@@ -449,7 +449,7 @@ static void s390_machine_reset(MachineState *machine, ShutdownCause reason)
         break;
     case S390_RESET_MODIFIED_CLEAR:
         /*
-         * Susbsystem reset needs to be done before we unshare memory
+         * Subsystem reset needs to be done before we unshare memory
          * and lose access to VIRTIO structures in guest memory.
          */
         subsystem_reset();
@@ -462,7 +462,7 @@ static void s390_machine_reset(MachineState *machine, ShutdownCause reason)
         break;
     case S390_RESET_LOAD_NORMAL:
         /*
-         * Susbsystem reset needs to be done before we unshare memory
+         * Subsystem reset needs to be done before we unshare memory
          * and lose access to VIRTIO structures in guest memory.
          */
         subsystem_reset();
diff --git a/target/s390x/ioinst.c b/target/s390x/ioinst.c
index b12f18d346..053aaabb5a 100644
--- a/target/s390x/ioinst.c
+++ b/target/s390x/ioinst.c
@@ -285,7 +285,7 @@ void ioinst_handle_stsch(S390CPU *cpu, uint64_t reg1, uint32_t ipb,
         /*
          * As operand exceptions have a lower priority than access exceptions,
          * we check whether the memory area is writable (injecting the
-         * access execption if it is not) first.
+         * access exception if it is not) first.
          */
         if (!s390_cpu_virt_mem_check_write(cpu, addr, ar, sizeof(schib))) {
             s390_program_interrupt(env, PGM_OPERAND, ra);
diff --git a/target/s390x/tcg/excp_helper.c b/target/s390x/tcg/excp_helper.c
index 2cd6d062b9..fe02d82201 100644
--- a/target/s390x/tcg/excp_helper.c
+++ b/target/s390x/tcg/excp_helper.c
@@ -553,7 +553,7 @@ try_deliver:
         /* don't trigger a cpu_loop_exit(), use an interrupt instead */
         cpu_interrupt(CPU(cpu), CPU_INTERRUPT_HALT);
     } else if (cs->halted) {
-        /* unhalt if we had a WAIT PSW somehwere in our injection chain */
+        /* unhalt if we had a WAIT PSW somewhere in our injection chain */
         s390_cpu_unhalt(cpu);
     }
 }
diff --git a/target/s390x/tcg/fpu_helper.c b/target/s390x/tcg/fpu_helper.c
index 4067205405..be80b2373c 100644
--- a/target/s390x/tcg/fpu_helper.c
+++ b/target/s390x/tcg/fpu_helper.c
@@ -89,7 +89,7 @@ static void handle_exceptions(CPUS390XState *env, bool XxC, uintptr_t retaddr)
     /*
      * invalid/divbyzero cannot coexist with other conditions.
      * overflow/underflow however can coexist with inexact, we have to
-     * handle it separatly.
+     * handle it separately.
      */
     if (s390_exc & ~S390_IEEE_MASK_INEXACT) {
         if (s390_exc & ~S390_IEEE_MASK_INEXACT & env->fpc >> 24) {
diff --git a/target/s390x/tcg/misc_helper.c b/target/s390x/tcg/misc_helper.c
index 10dadb002a..71388a7119 100644
--- a/target/s390x/tcg/misc_helper.c
+++ b/target/s390x/tcg/misc_helper.c
@@ -333,7 +333,7 @@ uint32_t HELPER(stsi)(CPUS390XState *env, uint64_t a0, uint64_t r0, uint64_t r1)
             /* same as machine type number in STORE CPU ID, but in EBCDIC */
             snprintf(type, ARRAY_SIZE(type), "%X", cpu->model->def->type);
             ebcdic_put(sysib.sysib_111.type, type, 4);
-            /* model number (not stored in STORE CPU ID for z/Architecure) */
+            /* model number (not stored in STORE CPU ID for z/Architecture) */
             ebcdic_put(sysib.sysib_111.model, "QEMU            ", 16);
             ebcdic_put(sysib.sysib_111.sequence, "QEMU            ", 16);
             ebcdic_put(sysib.sysib_111.plant, "QEMU", 4);
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 2fbdab7252..1e599ac259 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -435,7 +435,7 @@ static void gen_program_exception(DisasContext *s, int code)
 {
     TCGv_i32 tmp;
 
-    /* Remember what pgm exeption this was.  */
+    /* Remember what pgm exception this was.  */
     tmp = tcg_const_i32(code);
     tcg_gen_st_i32(tmp, cpu_env, offsetof(CPUS390XState, int_pgm_code));
     tcg_temp_free_i32(tmp);
@@ -491,7 +491,7 @@ static TCGv_i64 get_address(DisasContext *s, int x2, int b2, int d2)
 
     /*
      * Note that d2 is limited to 20 bits, signed.  If we crop negative
-     * displacements early we create larger immedate addends.
+     * displacements early we create larger immediate addends.
      */
     if (b2 && x2) {
         tcg_gen_add_i64(tmp, regs[b2], regs[x2]);
diff --git a/target/s390x/tcg/translate_vx.c.inc b/target/s390x/tcg/translate_vx.c.inc
index b69c1a111c..d39ee81cd6 100644
--- a/target/s390x/tcg/translate_vx.c.inc
+++ b/target/s390x/tcg/translate_vx.c.inc
@@ -960,7 +960,7 @@ static DisasJumpType op_vpk(DisasContext *s, DisasOps *o)
         }
         break;
     case 0x94:
-        /* If sources and destination dont't overlap -> fast path */
+        /* If sources and destination don't overlap -> fast path */
         if (v1 != v2 && v1 != v3) {
             const uint8_t src_es = get_field(s, m4);
             const uint8_t dst_es = src_es - 1;
@@ -2075,7 +2075,7 @@ static DisasJumpType op_vmsl(DisasContext *s, DisasOps *o)
     l2 = tcg_temp_new_i64();
     h2 = tcg_temp_new_i64();
 
-    /* Multipy both even elements from v2 and v3 */
+    /* Multiply both even elements from v2 and v3 */
     read_vec_element_i64(l1, get_field(s, v2), 0, ES_64);
     read_vec_element_i64(h1, get_field(s, v3), 0, ES_64);
     tcg_gen_mulu2_i64(l1, h1, l1, h1);
@@ -2084,7 +2084,7 @@ static DisasJumpType op_vmsl(DisasContext *s, DisasOps *o)
         tcg_gen_add2_i64(l1, h1, l1, h1, l1, h1);
     }
 
-    /* Multipy both odd elements from v2 and v3 */
+    /* Multiply both odd elements from v2 and v3 */
     read_vec_element_i64(l2, get_field(s, v2), 1, ES_64);
     read_vec_element_i64(h2, get_field(s, v3), 1, ES_64);
     tcg_gen_mulu2_i64(l2, h2, l2, h2);
diff --git a/pc-bios/s390-ccw/start.S b/pc-bios/s390-ccw/start.S
index 4d5ad21653..6072906df4 100644
--- a/pc-bios/s390-ccw/start.S
+++ b/pc-bios/s390-ccw/start.S
@@ -19,7 +19,7 @@ _start:
 	larl %r2, __bss_start
 	larl %r3, _end
 	slgr %r3, %r2		/* get sizeof bss */
-	ltgr	%r3,%r3 	/* bss emtpy? */
+	ltgr	%r3,%r3 	/* bss empty? */
 	jz	done
 	aghi	%r3,-1
 	srlg	%r4,%r3,8	/* how many 256 byte chunks? */
-- 
2.31.1


