Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EE6530C82
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 12:09:25 +0200 (CEST)
Received: from localhost ([::1]:33268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt508-0001Hg-C4
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 06:09:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nt4nu-0001Nr-Kr
 for qemu-devel@nongnu.org; Mon, 23 May 2022 05:56:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nt4nr-0002NG-79
 for qemu-devel@nongnu.org; Mon, 23 May 2022 05:56:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653299802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=sfWXSw8YzuNflUdZc9k3QCIuhA3VofWyA3OtiEjB/h8=;
 b=TpkQX0VbYGtiygrafzyyBEkuHvHVUfAjtv4Wt5ZuQA81aA3kID+t5PaTXj4oKco9rbnlyO
 eOxz8nJEpEvECy3xWqbtgW/7PS9oRN23/YrYPggBDzA57iE4iA+jjHGeqSHbhEHGvC3cL+
 1eeQT+iTzi3KehG5Ijcqt3d68n19poc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-20-1h8nZk-KPAKa2kEB2mky2w-1; Mon, 23 May 2022 05:56:37 -0400
X-MC-Unique: 1h8nZk-KPAKa2kEB2mky2w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5E2485A5AA;
 Mon, 23 May 2022 09:56:36 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FC451121314;
 Mon, 23 May 2022 09:56:34 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, laurent@vivier.eu,
 mjt@tls.msk.ru
Cc: danielhb413@gmail.com, clg@kaod.org, mst@redhat.com, qemu-arm@nongnu.org
Subject: [PATCH] Trivial: 3 char repeat typos
Date: Mon, 23 May 2022 10:56:29 +0100
Message-Id: <20220523095629.144441-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Inspired by Julia Lawall's fixing of Linux
kernel comments, I looked at qemu, although I did it manually.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hw/intc/openpic.c                | 2 +-
 hw/net/imx_fec.c                 | 2 +-
 hw/pci/pcie_aer.c                | 2 +-
 hw/pci/shpc.c                    | 2 +-
 hw/ppc/spapr_caps.c              | 2 +-
 hw/scsi/spapr_vscsi.c            | 2 +-
 qapi/net.json                    | 2 +-
 target/arm/cpu64.c               | 2 +-
 tools/virtiofsd/passthrough_ll.c | 2 +-
 ui/input.c                       | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/intc/openpic.c b/hw/intc/openpic.c
index 49504e740f..b0787e8ee7 100644
--- a/hw/intc/openpic.c
+++ b/hw/intc/openpic.c
@@ -729,7 +729,7 @@ static void openpic_tmr_set_tmr(OpenPICTimer *tmr, uint32_t val, bool enabled)
 }
 
 /*
- * Returns the currrent tccr value, i.e., timer value (in clocks) with
+ * Returns the current tccr value, i.e., timer value (in clocks) with
  * appropriate TOG.
  */
 static uint64_t openpic_tmr_get_timer(OpenPICTimer *tmr)
diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index 0db9aaf76a..8c11b237de 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -438,7 +438,7 @@ static void imx_eth_update(IMXFECState *s)
      *   assignment fail.
      *
      * To ensure that all versions of Linux work, generate ENET_INT_MAC
-     * interrrupts on both interrupt lines. This should be changed if and when
+     * interrupts on both interrupt lines. This should be changed if and when
      * qemu supports IOMUX.
      */
     if (s->regs[ENET_EIR] & s->regs[ENET_EIMR] &
diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
index 92bd0530dd..eff62f3945 100644
--- a/hw/pci/pcie_aer.c
+++ b/hw/pci/pcie_aer.c
@@ -323,7 +323,7 @@ static void pcie_aer_msg_root_port(PCIDevice *dev, const PCIEAERMsg *msg)
          */
     }
 
-    /* Errro Message Received: Root Error Status register */
+    /* Error Message Received: Root Error Status register */
     switch (msg->severity) {
     case PCI_ERR_ROOT_CMD_COR_EN:
         if (root_status & PCI_ERR_ROOT_COR_RCV) {
diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
index 28e62174c4..88b56da799 100644
--- a/hw/pci/shpc.c
+++ b/hw/pci/shpc.c
@@ -480,7 +480,7 @@ static const MemoryRegionOps shpc_mmio_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN,
     .valid = {
         /* SHPC ECN requires dword accesses, but the original 1.0 spec doesn't.
-         * It's easier to suppport all sizes than worry about it. */
+         * It's easier to support all sizes than worry about it. */
         .min_access_size = 1,
         .max_access_size = 4,
     },
diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
index 655ab856a0..b4283055c1 100644
--- a/hw/ppc/spapr_caps.c
+++ b/hw/ppc/spapr_caps.c
@@ -553,7 +553,7 @@ static void cap_ccf_assist_apply(SpaprMachineState *spapr, uint8_t val,
              * instruction is a harmless no-op.  It won't correctly
              * implement the cache count flush *but* if we have
              * count-cache-disabled in the host, that flush is
-             * unnnecessary.  So, specifically allow this case.  This
+             * unnecessary.  So, specifically allow this case.  This
              * allows us to have better performance on POWER9 DD2.3,
              * while still working on POWER9 DD2.2 and POWER8 host
              * cpus.
diff --git a/hw/scsi/spapr_vscsi.c b/hw/scsi/spapr_vscsi.c
index a07a8e1523..e320ccaa23 100644
--- a/hw/scsi/spapr_vscsi.c
+++ b/hw/scsi/spapr_vscsi.c
@@ -1013,7 +1013,7 @@ static int vscsi_send_capabilities(VSCSIState *s, vscsi_req *req)
     }
 
     /*
-     * Current implementation does not suppport any migration or
+     * Current implementation does not support any migration or
      * reservation capabilities. Construct the response telling the
      * guest not to use them.
      */
diff --git a/qapi/net.json b/qapi/net.json
index b92f3f5fb4..8da34360db 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -298,7 +298,7 @@
 #
 # @udp: use the udp version of l2tpv3 encapsulation
 #
-# @cookie64: use 64 bit coookies
+# @cookie64: use 64 bit cookies
 #
 # @counter: have sequence counter
 #
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 04427e073f..2467c5bf76 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -997,7 +997,7 @@ static void aarch64_a64fx_initfn(Object *obj)
     cpu->gic_vpribits = 5;
     cpu->gic_vprebits = 5;
 
-    /* Suppport of A64FX's vector length are 128,256 and 512bit only */
+    /* Support of A64FX's vector length are 128,256 and 512bit only */
     aarch64_add_sve_properties(obj);
     bitmap_zero(cpu->sve_vq_supported, ARM_MAX_VQ);
     set_bit(0, cpu->sve_vq_supported); /* 128bit */
diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
index b15c631ca5..7a73dfcce9 100644
--- a/tools/virtiofsd/passthrough_ll.c
+++ b/tools/virtiofsd/passthrough_ll.c
@@ -2319,7 +2319,7 @@ static int do_lo_create(fuse_req_t req, struct lo_inode *parent_inode,
          * If security.selinux has not been remapped and selinux is enabled,
          * use fscreate to set context before file creation. If not, use
          * tmpfile method for regular files. Otherwise fallback to
-         * non-atomic method of file creation and xattr settting.
+         * non-atomic method of file creation and xattr setting.
          */
         if (!mapped_name && lo->use_fscreate) {
             err = do_create_secctx_fscreate(req, parent_inode, name, mode, fi,
diff --git a/ui/input.c b/ui/input.c
index 8ac407dec4..e2a90af889 100644
--- a/ui/input.c
+++ b/ui/input.c
@@ -364,7 +364,7 @@ void qemu_input_event_send(QemuConsole *src, InputEvent *evt)
      * when 'alt+print' was pressed. This flaw is now fixed and the
      * 'sysrq' key serves no further purpose. We normalize it to
      * 'print', so that downstream receivers of the event don't
-     * neeed to deal with this mistake
+     * need to deal with this mistake
      */
     if (evt->type == INPUT_EVENT_KIND_KEY &&
         evt->u.key.data->key->u.qcode.data == Q_KEY_CODE_SYSRQ) {
-- 
2.36.1


