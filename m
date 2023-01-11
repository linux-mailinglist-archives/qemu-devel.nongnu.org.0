Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A552665E33
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 15:43:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFcJ4-0002r7-Vn; Wed, 11 Jan 2023 09:42:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+193d99197280eaff698e+7080+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pFcIx-0002pN-Lw
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 09:42:16 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+193d99197280eaff698e+7080+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1pFcIu-00040R-D4
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 09:42:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:Date:Cc:To:
 From:Subject:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=MjTucfSGF8vL+HsYrAB7s0NGo/naeXoNtnf1Mx3WXWA=; b=LQ4VHP7Sfpzm6pdqiRmlqP33ND
 mcq1JUpD5/CnFWsSRcwhZeph5VLWH9mBZ/jvwXL55nbcFbabNah/6qkGzhVRc2JWH5+kr1CYCsB61
 aqrUWPqWeiUPltxls+fEqu0NswhO/L6zhPUWBKB6+Rfyond9wyIPL6POWfNgVyeudpTFGzPHI9NLP
 aioxNvBELnSICY7npeQlVxZnvnODIbxoGtmRhnxvVckql/7Nxm4Xw1udTK9ySZnXiFFXF0KhucZIk
 0KG842UxuHStTHRYIXY9Vj4hMgoUG8HvDRyciKB77YfV99v0z5fKkWuzVk74dGn5YnqIpIOiu4tt9
 CDi0JLWg==;
Received: from [2001:8b0:10b:5::bb3] (helo=u3832b3a9db3152.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pFcIu-004DH1-AQ; Wed, 11 Jan 2023 14:42:12 +0000
Message-ID: <23caafffdd9546b8eeff851660015f3bfc021ed3.camel@infradead.org>
Subject: [RFC] Notify IRQ sources of level interrupt ack/EOI
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, Marcelo Tosatti <mtosatti@redhat.com>, Alex
 Williamson <alex.williamson@redhat.com>,  paul@xen.org
Date: Wed, 11 Jan 2023 14:41:58 +0000
Content-Type: multipart/signed; micalg="sha-256";
 protocol="application/pkcs7-signature"; 
 boundary="=-zav6Lt3CzpBs+adqYCHm"
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+193d99197280eaff698e+7080+infradead.org+dwmw2@casper.srs.infradead.org;
 helo=casper.infradead.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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


--=-zav6Lt3CzpBs+adqYCHm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This allows drivers to register a callback on a qemu_irq, which is
invoked when a level-triggered IRQ is acked on the irqchip.

This allows us to simulate level-triggered interrupts more efficiently,
by resampling the state of the interrupt only when it actually matters.

This can be used in two ways.=C2=A0

The example in the patch below shows the event source literally being
resampled from the callback =E2=80=94 in this case the line level is tied t=
o
the Xen evtchn_upcall_pending flag in vCPU0's vcpu_info, and the
callback from the irqchip allows us to avoid having to constantly poll
for that being clearer).

As we hook it up to INTx interrupts on VFIO PCI devices, it would
unconditionally return 'true' to clear the level in the irqchip, and
also send an event on the 'resample' eventfd to the kernel, so that the
kernel will reraise the interrupt if it's still actually physically set
on the device.

There's theoretically a race condition there, if the kernel reraises
the interrupt before the callback even returns and the irqchip clears
its internal s->irr. But I think we get away with it by being single-
threaded for the I/O processing so we won't actually consume the event
until later?

It was the Xen part firt that offended me, having to poll on vmexit:
https://git.infradead.org/users/dwmw2/qemu.git/commitdiff/7bada5e4f#patch5

But then I looked at how VFIO handles this, and it offends me even
more; sending the resample eventfd down to the kernel on *ever* MMIO
read/write.... having unmapped the device's BARs from the guest in
order to *trap* those MMIO accesses... with a timer to map it back
again...

It'll take a little more work to hook up the reverse path for the ack
back through PCI INTx handling, a bit like I've had to do it with
gsi_ack_handler to convey the ack events back from the {i8259,ioapic}
qemu_irq to the GSI qemu_irqs. And I'll need to do it for more than
just i8259 and ioapic. But I suspect it'll be worth it.

Opinions?

Tested by booting a (KVM) Xen guest with xen_no_vector_callback on its
command line, and sometimes also 'apic=3Doff'. In PIC mode we still seem
to get two interrupts per event, but I think that's actually genuine
because printfs in the evtchn code confirm that ->evtchn_upcall_pending
for vCPU0 really *is* still set the first time the interrupt is acked
in the i8259 and genuinely doesn't get cleared.

diff --git a/hw/core/irq.c b/hw/core/irq.c
index 3623f711fe..552e732835 100644
--- a/hw/core/irq.c
+++ b/hw/core/irq.c
@@ -32,6 +32,9 @@ DECLARE_INSTANCE_CHECKER(struct IRQState, IRQ,
 struct IRQState {
     Object parent_obj;
=20
+    qemu_irq_ack_fn ack_cb;
+    void *ack_opaque;
+
     qemu_irq_handler handler;
     void *opaque;
     int n;
@@ -45,6 +48,22 @@ void qemu_set_irq(qemu_irq irq, int level)
     irq->handler(irq->opaque, irq->n, level);
 }
=20
+void qemu_set_irq_ack_callback(qemu_irq irq, qemu_irq_ack_fn cb, void *opa=
que)
+{
+    if (irq) {
+        irq->ack_cb =3D cb;
+        irq->ack_opaque =3D opaque;
+    }
+}
+
+bool qemu_notify_irq_ack(qemu_irq irq)
+{
+    if (irq && irq->ack_cb) {
+        return irq->ack_cb(irq, irq->ack_opaque);
+    }
+    return false;
+}
+
 qemu_irq *qemu_extend_irqs(qemu_irq *old, int n_old, qemu_irq_handler hand=
ler,
                            void *opaque, int n)
 {
diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 084249c56d..5867868549 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -288,6 +288,16 @@ void xen_evtchn_set_callback_level(int level)
     }
 }
=20
+static bool resample_evtchn_irq(qemu_irq irq, void *opaques)
+{
+    struct vcpu_info *vi =3D kvm_xen_get_vcpu_info_hva(0);
+
+    if (vi && !vi->evtchn_upcall_pending) {
+        return true;
+    }
+    return false;
+}
+
 int xen_evtchn_set_callback_param(uint64_t param)
 {
     XenEvtchnState *s =3D xen_evtchn_singleton;
@@ -339,8 +349,14 @@ int xen_evtchn_set_callback_param(uint64_t param)
         if (gsi !=3D s->callback_gsi) {
             struct vcpu_info *vi =3D kvm_xen_get_vcpu_info_hva(0);
=20
-            xen_evtchn_set_callback_level(0);
+            if (s->callback_gsi) {
+                xen_evtchn_set_callback_level(0);
+                qemu_set_irq_ack_callback(s->gsis[s->callback_gsi], NULL, =
NULL);
+            }
             s->callback_gsi =3D gsi;
+            if (s->callback_gsi) {
+                qemu_set_irq_ack_callback(s->gsis[s->callback_gsi], resamp=
le_evtchn_irq, s);
+            }
=20
             if (gsi && vi && vi->evtchn_upcall_pending) {
                 /*
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index c5cf6581da..8cfd6ff641 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -410,7 +410,7 @@ GSIState *pc_gsi_create(qemu_irq **irqs, bool pci_enabl=
ed)
     if (kvm_ioapic_in_kernel()) {
         kvm_pc_setup_irq_routing(pci_enabled);
     }
-    *irqs =3D qemu_allocate_irqs(gsi_handler, s, GSI_NUM_PINS);
+    s->gsi_irq =3D *irqs =3D qemu_allocate_irqs(gsi_handler, s, GSI_NUM_PI=
NS);
=20
     return s;
 }
@@ -1355,7 +1355,7 @@ void pc_nic_init(PCMachineClass *pcmc, ISABus *isa_bu=
s, PCIBus *pci_bus)
     rom_reset_order_override();
 }
=20
-void pc_i8259_create(ISABus *isa_bus, qemu_irq *i8259_irqs)
+void pc_i8259_create(ISABus *isa_bus, GSIState *gsi_state)
 {
     qemu_irq *i8259;
=20
@@ -1368,7 +1368,10 @@ void pc_i8259_create(ISABus *isa_bus, qemu_irq *i825=
9_irqs)
     }
=20
     for (size_t i =3D 0; i < ISA_NUM_IRQS; i++) {
-        i8259_irqs[i] =3D i8259[i];
+        gsi_state->i8259_irq[i] =3D i8259[i];
+        qemu_set_irq_ack_callback(gsi_state->i8259_irq[i], gsi_ack_handler=
,
+                                  gsi_state->gsi_irq[i]);
+
     }
=20
     g_free(i8259);
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 5678112dc2..964a8b458d 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -250,7 +250,7 @@ static void pc_init1(MachineState *machine,
     isa_bus_irqs(isa_bus, x86ms->gsi);
=20
     if (x86ms->pic =3D=3D ON_OFF_AUTO_ON || x86ms->pic =3D=3D ON_OFF_AUTO_=
AUTO) {
-        pc_i8259_create(isa_bus, gsi_state->i8259_irq);
+        pc_i8259_create(isa_bus, gsi_state);
     }
=20
     if (pcmc->pci_enabled) {
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 67ceb04bcc..c2c9933170 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -274,7 +274,7 @@ static void pc_q35_init(MachineState *machine)
     isa_bus =3D ich9_lpc->isa_bus;
=20
     if (x86ms->pic =3D=3D ON_OFF_AUTO_ON || x86ms->pic =3D=3D ON_OFF_AUTO_=
AUTO) {
-        pc_i8259_create(isa_bus, gsi_state->i8259_irq);
+        pc_i8259_create(isa_bus, gsi_state);
     }
=20
     if (pcmc->pci_enabled) {
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 78cc131926..677e4ec3eb 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -617,6 +617,16 @@ void gsi_handler(void *opaque, int n, int level)
     }
 }
=20
+bool gsi_ack_handler(qemu_irq irq, void *opaque)
+{
+    /*
+     * This is a callback on the underlying PIC/IOAPIC irq but the
+     * opaque pointer that was registered is the GSI irq. Propagate
+     * the notifiation.
+     */
+    return qemu_notify_irq_ack(opaque);
+}
+
 void ioapic_init_gsi(GSIState *gsi_state, const char *parent_name)
 {
     DeviceState *dev;
@@ -637,6 +647,8 @@ void ioapic_init_gsi(GSIState *gsi_state, const char *p=
arent_name)
=20
     for (i =3D 0; i < IOAPIC_NUM_PINS; i++) {
         gsi_state->ioapic_irq[i] =3D qdev_get_gpio_in(dev, i);
+        qemu_set_irq_ack_callback(gsi_state->ioapic_irq[i], gsi_ack_handle=
r,
+                                  gsi_state->gsi_irq[i]);
     }
 }
=20
@@ -653,6 +665,8 @@ DeviceState *ioapic_init_secondary(GSIState *gsi_state)
=20
     for (i =3D 0; i < IOAPIC_NUM_PINS; i++) {
         gsi_state->ioapic2_irq[i] =3D qdev_get_gpio_in(dev, i);
+        qemu_set_irq_ack_callback(gsi_state->ioapic2_irq[i], gsi_ack_handl=
er,
+                                  gsi_state->gsi_irq[IO_APIC_SECONDARY_IRQ=
BASE + i]);
     }
     return dev;
 }
diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
index cc4e21ffec..0bc43f0fc3 100644
--- a/hw/intc/i8259.c
+++ b/hw/intc/i8259.c
@@ -166,9 +166,15 @@ static void pic_intack(PICCommonState *s, int irq)
     } else {
         s->isr |=3D (1 << irq);
     }
-    /* We don't clear a level sensitive interrupt here */
+    /*
+     * We don't clear a level sensitive interrupt here, unless the
+     * ack notifier asks us to.
+     */
     if (!(s->elcr & (1 << irq))) {
         s->irr &=3D ~(1 << irq);
+    } else if (qemu_notify_irq_ack(qdev_get_gpio_in(DEVICE(s), irq))) {
+        s->irr &=3D ~(1 << irq);
+        s->last_irr &=3D ~(1 << irq);
     }
     pic_update_irq(s);
 }
diff --git a/hw/intc/ioapic.c b/hw/intc/ioapic.c
index 264262959d..4d56bbedac 100644
--- a/hw/intc/ioapic.c
+++ b/hw/intc/ioapic.c
@@ -34,6 +34,7 @@
 #include "sysemu/sysemu.h"
 #include "hw/i386/apic-msidef.h"
 #include "hw/i386/x86-iommu.h"
+#include "hw/irq.h"
 #include "trace.h"
=20
 #define APIC_DELIVERY_MODE_SHIFT 8
@@ -259,7 +260,9 @@ void ioapic_eoi_broadcast(int vector)
              */
             kvm_resample_fd_notify(n);
 #endif
-
+            if (qemu_notify_irq_ack(qdev_get_gpio_in(DEVICE(s), n))) {
+                s->irr &=3D ~(1 << n);
+            }
             if (!(entry & IOAPIC_LVT_REMOTE_IRR)) {
                 continue;
             }
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index b866567b7b..77a8d0adfa 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -177,7 +177,7 @@ void pc_cmos_init(PCMachineState *pcms,
                   ISADevice *s);
 void pc_nic_init(PCMachineClass *pcmc, ISABus *isa_bus, PCIBus *pci_bus);
=20
-void pc_i8259_create(ISABus *isa_bus, qemu_irq *i8259_irqs);
+void pc_i8259_create(ISABus *isa_bus, GSIState *gsi_state);
=20
 /* port92.c */
 #define PORT92_A20_LINE "a20"
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 62fa5774f8..a315d7719f 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -138,6 +138,7 @@ bool x86_machine_is_acpi_enabled(const X86MachineState =
*x86ms);
 #define ACPI_BUILD_PCI_IRQS ((1<<5) | (1<<9) | (1<<10) | (1<<11))
=20
 typedef struct GSIState {
+    qemu_irq *gsi_irq;
     qemu_irq i8259_irq[ISA_NUM_IRQS];
     qemu_irq ioapic_irq[IOAPIC_NUM_PINS];
     qemu_irq ioapic2_irq[IOAPIC_NUM_PINS];
@@ -145,6 +146,7 @@ typedef struct GSIState {
=20
 qemu_irq x86_allocate_cpu_irq(void);
 void gsi_handler(void *opaque, int n, int level);
+bool gsi_ack_handler(qemu_irq, void *opaque);
 void ioapic_init_gsi(GSIState *gsi_state, const char *parent_name);
 DeviceState *ioapic_init_secondary(GSIState *gsi_state);
=20
diff --git a/include/hw/irq.h b/include/hw/irq.h
index 645b73d251..f21110d5f0 100644
--- a/include/hw/irq.h
+++ b/include/hw/irq.h
@@ -23,6 +23,16 @@ static inline void qemu_irq_pulse(qemu_irq irq)
     qemu_set_irq(irq, 0);
 }
=20
+/*
+ * Allows a callback to be invoked when an IRQ is acked at the irqchip,
+ * allowing it to be resampled and reasserted as appropriate. If the
+ * callback function returns true, the interrupt is deasserted at the
+ * irqchip.
+ */
+typedef bool (*qemu_irq_ack_fn)(qemu_irq irq, void *opaque);
+void qemu_set_irq_ack_callback(qemu_irq irq, qemu_irq_ack_fn cb, void *opa=
que);
+bool qemu_notify_irq_ack(qemu_irq irq);
+
 /* Returns an array of N IRQs. Each IRQ is assigned the argument handler a=
nd
  * opaque data.
  */
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index 273200bc70..a7d3fc33b3 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -391,7 +391,7 @@ void kvm_xen_maybe_deassert_callback(CPUState *cs)
     /* If the evtchn_upcall_pending flag is cleared, turn the GSI off. */
     if (!vi->evtchn_upcall_pending) {
         env->xen_callback_asserted =3D false;
-        xen_evtchn_set_callback_level(0);
+        //xen_evtchn_set_callback_level(0);
     }
 }
=20
@@ -432,7 +432,7 @@ void kvm_xen_inject_vcpu_callback_vector(uint32_t vcpu_=
id, int type)
     case HVM_PARAM_CALLBACK_TYPE_PCI_INTX:
         if (vcpu_id =3D=3D 0) {
             xen_evtchn_set_callback_level(1);
-            X86_CPU(cs)->env.xen_callback_asserted =3D true;
+            //X86_CPU(cs)->env.xen_callback_asserted =3D true;
         }
         break;
     }


--=-zav6Lt3CzpBs+adqYCHm
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCEkQw
ggYQMIID+KADAgECAhBNlCwQ1DvglAnFgS06KwZPMA0GCSqGSIb3DQEBDAUAMIGIMQswCQYDVQQG
EwJVUzETMBEGA1UECBMKTmV3IEplcnNleTEUMBIGA1UEBxMLSmVyc2V5IENpdHkxHjAcBgNVBAoT
FVRoZSBVU0VSVFJVU1QgTmV0d29yazEuMCwGA1UEAxMlVVNFUlRydXN0IFJTQSBDZXJ0aWZpY2F0
aW9uIEF1dGhvcml0eTAeFw0xODExMDIwMDAwMDBaFw0zMDEyMzEyMzU5NTlaMIGWMQswCQYDVQQG
EwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYD
VQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50
aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAyjztlApB/975Rrno1jvm2pK/KxBOqhq8gr2+JhwpKirSzZxQgT9tlC7zl6hn1fXjSo5MqXUf
ItMltrMaXqcESJuK8dtK56NCSrq4iDKaKq9NxOXFmqXX2zN8HHGjQ2b2Xv0v1L5Nk1MQPKA19xeW
QcpGEGFUUd0kN+oHox+L9aV1rjfNiCj3bJk6kJaOPabPi2503nn/ITX5e8WfPnGw4VuZ79Khj1YB
rf24k5Ee1sLTHsLtpiK9OjG4iQRBdq6Z/TlVx/hGAez5h36bBJMxqdHLpdwIUkTqT8se3ed0PewD
ch/8kHPo5fZl5u1B0ecpq/sDN/5sCG52Ds+QU5O5EwIDAQABo4IBZDCCAWAwHwYDVR0jBBgwFoAU
U3m/WqorSs9UgOHYm8Cd8rIDZsswHQYDVR0OBBYEFAnA8vwL2pTbX/4r36iZQs/J4K0AMA4GA1Ud
DwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEF
BQcDBDARBgNVHSAECjAIMAYGBFUdIAAwUAYDVR0fBEkwRzBFoEOgQYY/aHR0cDovL2NybC51c2Vy
dHJ1c3QuY29tL1VTRVJUcnVzdFJTQUNlcnRpZmljYXRpb25BdXRob3JpdHkuY3JsMHYGCCsGAQUF
BwEBBGowaDA/BggrBgEFBQcwAoYzaHR0cDovL2NydC51c2VydHJ1c3QuY29tL1VTRVJUcnVzdFJT
QUFkZFRydXN0Q0EuY3J0MCUGCCsGAQUFBzABhhlodHRwOi8vb2NzcC51c2VydHJ1c3QuY29tMA0G
CSqGSIb3DQEBDAUAA4ICAQBBRHUAqznCFfXejpVtMnFojADdF9d6HBA4kMjjsb0XMZHztuOCtKF+
xswhh2GqkW5JQrM8zVlU+A2VP72Ky2nlRA1GwmIPgou74TZ/XTarHG8zdMSgaDrkVYzz1g3nIVO9
IHk96VwsacIvBF8JfqIs+8aWH2PfSUrNxP6Ys7U0sZYx4rXD6+cqFq/ZW5BUfClN/rhk2ddQXyn7
kkmka2RQb9d90nmNHdgKrwfQ49mQ2hWQNDkJJIXwKjYA6VUR/fZUFeCUisdDe/0ABLTI+jheXUV1
eoYV7lNwNBKpeHdNuO6Aacb533JlfeUHxvBz9OfYWUiXu09sMAviM11Q0DuMZ5760CdO2VnpsXP4
KxaYIhvqPqUMWqRdWyn7crItNkZeroXaecG03i3mM7dkiPaCkgocBg0EBYsbZDZ8bsG3a08LwEsL
1Ygz3SBsyECa0waq4hOf/Z85F2w2ZpXfP+w8q4ifwO90SGZZV+HR/Jh6rEaVPDRF/CEGVqR1hiuQ
OZ1YL5ezMTX0ZSLwrymUE0pwi/KDaiYB15uswgeIAcA6JzPFf9pLkAFFWs1QNyN++niFhsM47qod
x/PL+5jR87myx5uYdBEQkkDc+lKB1Wct6ucXqm2EmsaQ0M95QjTmy+rDWjkDYdw3Ms6mSWE3Bn7i
5ZgtwCLXgAIe5W8mybM2JzCCBhQwggT8oAMCAQICEQDGvhmWZ0DEAx0oURL6O6l+MA0GCSqGSIb3
DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYD
VQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28g
UlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTIyMDEwNzAw
MDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJARYTZHdtdzJAaW5mcmFkZWFkLm9y
ZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3GpC2bomUqk+91wLYBzDMcCj5C9m6
oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZHh7htyAkWYVoFsFPrwHounto8xTsy
SSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT9YgcBqKCo65pTFmOnR/VVbjJk4K2
xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNjP+qDrh0db7PAjO1D4d5ftfrsf+kd
RR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy2U+eITZ5LLE5s45mX2oPFknWqxBo
bQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3BgBEmfsYWlBXO8rVXfvPgLs32VdV
NZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/7auNVRmPB3v5SWEsH8xi4Bez2V9U
KxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmdlFYhAflWKQ03Ufiu8t3iBE3VJbc2
5oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9aelIl6vtbhMA+l0nfrsORMa4kobqQ5
C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMBAAGjggHMMIIByDAfBgNVHSMEGDAW
gBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeDMcimo0oz8o1R1Nver3ZVpSkwDgYD
VR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMC
MEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYBBQUHAgEWF2h0dHBzOi8vc2VjdGln
by5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwuc2VjdGlnby5jb20vU2VjdGln
b1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgYoGCCsGAQUFBwEB
BH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdvLmNvbS9TZWN0aWdvUlNBQ2xpZW50
QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAjBggrBgEFBQcwAYYXaHR0cDovL29j
c3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5mcmFkZWFkLm9yZzANBgkqhkiG9w0B
AQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQvQ/fzPXmtR9t54rpmI2TfyvcKgOXp
qa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvIlSPrzIB4Z2wyIGQpaPLlYflrrVFK
v9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9ChWFfgSXvrWDZspnU3Gjw/rMHrGnql
Htlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0whpBtXdyDjzBtQTaZJ7zTT/vlehc/
tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9IzCCBhQwggT8oAMCAQICEQDGvhmW
Z0DEAx0oURL6O6l+MA0GCSqGSIb3DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3Jl
YXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0
ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJl
IEVtYWlsIENBMB4XDTIyMDEwNzAwMDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJ
ARYTZHdtdzJAaW5mcmFkZWFkLm9yZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3
GpC2bomUqk+91wLYBzDMcCj5C9m6oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZH
h7htyAkWYVoFsFPrwHounto8xTsySSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT
9YgcBqKCo65pTFmOnR/VVbjJk4K2xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNj
P+qDrh0db7PAjO1D4d5ftfrsf+kdRR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy
2U+eITZ5LLE5s45mX2oPFknWqxBobQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3
BgBEmfsYWlBXO8rVXfvPgLs32VdVNZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/
7auNVRmPB3v5SWEsH8xi4Bez2V9UKxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmd
lFYhAflWKQ03Ufiu8t3iBE3VJbc25oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9ae
lIl6vtbhMA+l0nfrsORMa4kobqQ5C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMB
AAGjggHMMIIByDAfBgNVHSMEGDAWgBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeD
Mcimo0oz8o1R1Nver3ZVpSkwDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYw
FAYIKwYBBQUHAwQGCCsGAQUFBwMCMEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYB
BQUHAgEWF2h0dHBzOi8vc2VjdGlnby5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9j
cmwuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1h
aWxDQS5jcmwwgYoGCCsGAQUFBwEBBH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdv
LmNvbS9TZWN0aWdvUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAj
BggrBgEFBQcwAYYXaHR0cDovL29jc3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5m
cmFkZWFkLm9yZzANBgkqhkiG9w0BAQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQv
Q/fzPXmtR9t54rpmI2TfyvcKgOXpqa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvI
lSPrzIB4Z2wyIGQpaPLlYflrrVFKv9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9Ch
WFfgSXvrWDZspnU3Gjw/rMHrGnqlHtlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0w
hpBtXdyDjzBtQTaZJ7zTT/vlehc/tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9
IzGCBMcwggTDAgEBMIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVz
dGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMT
NVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEA
xr4ZlmdAxAMdKFES+jupfjANBglghkgBZQMEAgEFAKCCAeswGAYJKoZIhvcNAQkDMQsGCSqGSIb3
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjMwMTExMTQ0MTU5WjAvBgkqhkiG9w0BCQQxIgQg2ygZBuo+
8XZP9VQdDGcaO0OlfEAcmlEdYYekisjmBX4wgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgBL1XFltjJ0b2ogHazUezeP9hjlHfdUqRRd
hKLY3eq+ji7MMHppva4lt+89wE93kEiYS2tQdsIabhY+ekVuwZzOmUae9VaHLx0JpyshxBZuCHKf
qZ+VUQBTpkvpxSNVYy+Hl7POVKQ2Xco/DUakhZclXO3UyylWIKFYSQiup/DGAc9bJW9iHutf4fmU
gXffhfvJFTHGpTQGVjvJBYuq4pqIS3LVvsqeqhv5AWkzkNHw1EdLzEI3WrHXUl7XO8jDMqEFcMKK
jwrM8CK5qOez1t/eTmNHcFupEs2KwYf3zDRsXx/kfSyNYdHVh9F/S9W9f1xH+dftvfsnQEMj47yJ
Yc0W94LT6gEsLCGdLwzzKpkezJTe2qmhGZF889v7ZOPAnRudl9B9htCLKlWabOqQLMp0XsZeBbDi
xaNT7aYB89UbQ9OFGI4R+OMX27qjZ/kX3new67NajjfVCnMIs5kXKmf++Ka8rsu6r20G51WYlwY/
LWH48caQdA4Mc7poplaG1DIpc3N8MZgH96rkfTVJAJKQOELRXJ+JVCotYZ3Xpm0Zy641ppO9S+Jq
Ts/wt3iEla8wU0bU7wYZIH4StIld/jQqtU3dk24NgFxyffkPOgkI5AevZe8xs8OTllASdi44YKhM
pjs2Zq8ii+/W3josgV6tZTGJ7uMvejxrNzCcN8k7pgAAAAAAAA==


--=-zav6Lt3CzpBs+adqYCHm--

