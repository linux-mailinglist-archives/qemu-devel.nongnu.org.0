Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A1C64E299
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 21:55:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5vGO-0007YW-9n; Thu, 15 Dec 2022 15:55:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+0ba4edd36d7839b3bd96+7053+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p5vG3-0007Sp-Sa
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 15:55:17 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+0ba4edd36d7839b3bd96+7053+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p5vG0-0004Fb-2J
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 15:55:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=o9lzMtbt0n+nDEHHdgUkYIygE7i1D+qaPLN2VLAIpyQ=; b=oGcUj8erRoVIQ2QnT3oImpOH9A
 ngwucFnoDHUWx7emd+F6wr7TfTQVRMMAkhFlaFGBkPXFMsYjp9w7K4gCjCzqwEj41MEKjuon5rARp
 YlRaHUveg03H9ZXvDsL9T0sFufJ0VoqBv+6aidX3YRKpkeIwrJEIYuQdubuJw7UaXCytgLjLcbfPK
 YB/Co8CVUxNbRCvrONzQZZFmERj6Qhe7o2UZKFdTfjB/sfMfDsHm5aBDiPoFagKcJBpVSxvojPIUw
 qqww/2Mkveb0eG7oY1R6KMlUq5Utyjs9ramFsS8HgvoD/qrYROfwVVgTQw0nZ17HXi9mPEPom/ovZ
 zORKxoSQ==;
Received: from [2001:8b0:10b:5::bb3] (helo=u3832b3a9db3152.ant.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p5vFy-00EkB4-Ri; Thu, 15 Dec 2022 20:55:06 +0000
Message-ID: <eba6ab55c8fa4bf889744287d006a5c085ba8976.camel@infradead.org>
Subject: Re: [RFC PATCH v2 20/22] i386/xen: HVMOP_set_param /
 HVM_PARAM_CALLBACK_IRQ
From: David Woodhouse <dwmw2@infradead.org>
To: Paul Durrant <xadimgnik@gmail.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Joao Martins
 <joao.m.martins@oracle.com>, Ankur Arora <ankur.a.arora@oracle.com>, 
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <philmd@linaro.org>, Thomas Huth <thuth@redhat.com>, Alex
 =?ISO-8859-1?Q?Benn=E9e?=
 <alex.bennee@linaro.org>, Juan Quintela <quintela@redhat.com>, "Dr . David
 Alan Gilbert" <dgilbert@redhat.com>, Claudio Fontana <cfontana@suse.de>
Date: Thu, 15 Dec 2022 20:54:56 +0000
In-Reply-To: <65ccf311-be94-7cf2-6610-360549b547ab@xen.org>
References: <20221209095612.689243-1-dwmw2@infradead.org>
 <20221209095612.689243-21-dwmw2@infradead.org>
 <f4b7feff-c41a-25c6-d098-c4eab9b94eb1@xen.org>
 <9dbe4265d43063348a8fe6ddd2b732615f0631b9.camel@infradead.org>
 <65ccf311-be94-7cf2-6610-360549b547ab@xen.org>
Content-Type: multipart/signed; micalg="sha-256";
 protocol="application/pkcs7-signature"; 
 boundary="=-zSj2xIOpem4th3CM0f+w"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+0ba4edd36d7839b3bd96+7053+infradead.org+dwmw2@casper.srs.infradead.org;
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


--=-zSj2xIOpem4th3CM0f+w
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2022-12-12 at 16:39 +0000, Paul Durrant wrote:
> On 12/12/2022 16:26, David Woodhouse wrote:
> > On Mon, 2022-12-12 at 16:16 +0000, Paul Durrant wrote:
> > > On 09/12/2022 09:56, David Woodhouse wrote:
> > > > From: Ankur Arora <ankur.a.arora@oracle.com>
> > > > The HVM_PARAM_CALLBACK_IRQ parameter controls the system-wide event
> > > > channel upcall method.  The vector support is handled by KVM intern=
ally,
> > > > when the evtchn_upcall_pending field in the vcpu_info is set.
> > > > The GSI and PCI_INTX delivery methods are not supported. yet; those
> > > > need to simulate a level-triggered event on the I/OAPIC.
> > >=20
> > > That's gonna be somewhat limiting if anyone runs a Windows guest with
> > > upcall vector support turned off... which is an option at:
> > >=20
> > > https://xenbits.xen.org/gitweb/?p=3Dpvdrivers/win/xenbus.git;a=3Dblob=
;f=3Dsrc/xenbus/evtchn.c;;hb=3DHEAD#l1928
> > >=20
> >=20
> > Sure. And as you know, I also added the 'xen_no_vector_callback' option
> > to the Linux command line to allow for that mode to be tested with
> > Linux too:=20
> > https://git.kernel.org/torvalds/c/b36b0fe96a
> >=20
> >=20
> > The GSI and PCI_INTX modes will be added in time, but not yet.
>=20
> Ok, but maybe worth calling out the limitation in the commit comment for=
=20
> those wishing to kick the tyres.

Hm... this isn't as simple in QEMU as I hoped.

The way I want to handle it is like the way that VFIO eventfd pairs
work for level-triggered interrupts: the first eventfd is triggered on
a rising edge, and the other one is a 'resampler' which is triggered on
EOI, and causes the first one to be retriggered if the level is still
actually high.

However... unlike the kernel and another VMM that you and I are
familiar with, QEMU doesn't actually hook that up to the EOI in the
APIC/IOAPIC at all.

Instead, when VFIO devices assert a level-triggered interrupt, QEMU
*unmaps* that device's BARs from the guest so it can trap-and-emulate
them, and each MMIO read or write will also trigger the resampler
(whether that line is currently masked in the APIC or not).

I suppose we could try making the page with the vcpu_info as read-only,=20
and trapping access to that so we spot when the guest clears its own
->evtchn_upcall_pending flag? That seems overly complex though.

So I've resorted to doing what Xen itself does: just poll the flag on
every vmexit. Patch is at the tip of my tree at=20
https://git.infradead.org/users/dwmw2/qemu.git/shortlog/refs/heads/xenfv
and below.

However, in the case of the in-kernel irqchip we might not even *get* a
vmexit all the way to userspace; can't a guest just get stuck in an
interrupt storm with it being handled entirely in-kernel? I might
decree that this works *only* with the split irqchip.

Then again, it'll work *nicely* in the kernel where the EOI
notification exists, so I might teach the kernel's evtchn code to
create those eventfd pairs like VFIO's, which can be hooked in as IRQFD
routing to the in-kernel {IOA,}PIC.

--------------------
=46rom 15a91ff4833d07910abba1dec093e48580c2b4c4 Mon Sep 17 00:00:00 2001
From: David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH] hw/xen: Support HVM_PARAM_CALLBACK_TYPE_GSI callback

The GSI callback (and later PCI_INTX) is a level triggered interrupt. It
is asserted when an event channel is delivered to vCPU0, and is supposed
to be cleared when the vcpu_info->evtchn_upcall_pending field for vCPU0
is cleared again.

Thankfully, Xen does *not* assert the GSI if the guest sets its own
evtchn_upcall_pending field; we only need to assert the GSI when we
have delivered an event for ourselves. So that's the easy part.

However, we *do* need to poll for the evtchn_upcall_pending flag being
cleared. In an ideal world we would poll that when the EOI happens on
the PIC/IOAPIC. That's how it works in the kernel with the VFIO eventfd
pairs =E2=80=94 one is used to trigger the interrupt, and the other works i=
n the
other direction to 'resample' on EOI, and trigger the first eventfd
again if the line is still active.

However, QEMU doesn't seem to do that. Even VFIO level interrupts seem
to be supported by temporarily unmapping the device's BARs from the
guest when an interrupt happens, then trapping *all* MMIO to the device
and sending the 'resample' event on *every* MMIO access until the IRQ
is cleared! Maybe in future we'll plumb the 'resample' concept through
QEMU's irq framework but for now we'll do what Xen itself does: just
check the flag on every vmexit if the upcall GSI is known to be
asserted.

This is barely tested; I did make it waggle IRQ1 up and down on *every*
delivery even through the vector method, and observed that it is indeed
visible to the guest (as lots of spurious keyboard interrupts). But if
the vector callback isn't in use, Linux guests won't actually use event
channels for anything except PV devices... which I haven't implemented
here yet, so it's hard to test delivery :)

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/kvm/xen_evtchn.c  | 88 +++++++++++++++++++++++++++++++++++----
 hw/i386/kvm/xen_evtchn.h  |  3 ++
 hw/i386/pc.c              | 10 ++++-
 include/sysemu/kvm_xen.h  |  2 +-
 target/i386/cpu.h         |  1 +
 target/i386/kvm/kvm.c     | 13 ++++++
 target/i386/kvm/xen-emu.c | 64 ++++++++++++++++++++--------
 target/i386/kvm/xen-emu.h |  1 +
 8 files changed, 154 insertions(+), 28 deletions(-)

diff --git a/hw/i386/kvm/xen_evtchn.c b/hw/i386/kvm/xen_evtchn.c
index 9292602c09..8ea8cf550e 100644
--- a/hw/i386/kvm/xen_evtchn.c
+++ b/hw/i386/kvm/xen_evtchn.c
@@ -24,6 +24,8 @@
=20
 #include "hw/sysbus.h"
 #include "hw/xen/xen.h"
+#include "hw/i386/x86.h"
+#include "hw/irq.h"
=20
 #include "xen_evtchn.h"
 #include "xen_overlay.h"
@@ -102,6 +104,7 @@ struct XenEvtchnState {
     QemuMutex port_lock;
     uint32_t nr_ports;
     XenEvtchnPort port_table[EVTCHN_2L_NR_CHANNELS];
+    qemu_irq gsis[GSI_NUM_PINS];
 };
=20
 struct XenEvtchnState *xen_evtchn_singleton;
@@ -166,9 +169,29 @@ static const TypeInfo xen_evtchn_info =3D {
 void xen_evtchn_create(void)
 {
     XenEvtchnState *s =3D XEN_EVTCHN(sysbus_create_simple(TYPE_XEN_EVTCHN,=
 -1, NULL));
+    int i;
+
     xen_evtchn_singleton =3D s;
=20
     qemu_mutex_init(&s->port_lock);
+
+    for (i =3D 0; i < GSI_NUM_PINS; i++) {
+        sysbus_init_irq(SYS_BUS_DEVICE(s), &s->gsis[i]);
+    }
+}
+
+void xen_evtchn_connect_gsis(qemu_irq *system_gsis)
+{
+    XenEvtchnState *s =3D xen_evtchn_singleton;
+    int i;
+
+    if (!s) {
+        return;
+    }
+
+    for (i =3D 0; i < GSI_NUM_PINS; i++) {
+        sysbus_connect_irq(SYS_BUS_DEVICE(s), i, system_gsis[i]);
+    }
 }
=20
 static void xen_evtchn_register_types(void)
@@ -178,26 +201,75 @@ static void xen_evtchn_register_types(void)
=20
 type_init(xen_evtchn_register_types)
=20
-
 #define CALLBACK_VIA_TYPE_SHIFT       56
=20
 int xen_evtchn_set_callback_param(uint64_t param)
 {
+    XenEvtchnState *s =3D xen_evtchn_singleton;
     int ret =3D -ENOSYS;
=20
-    if (param >> CALLBACK_VIA_TYPE_SHIFT =3D=3D HVM_PARAM_CALLBACK_TYPE_VE=
CTOR) {
+    if (!s) {
+        return -ENOTSUP;
+    }
+
+    switch (param >> CALLBACK_VIA_TYPE_SHIFT) {
+    case HVM_PARAM_CALLBACK_TYPE_VECTOR: {
         struct kvm_xen_hvm_attr xa =3D {
             .type =3D KVM_XEN_ATTR_TYPE_UPCALL_VECTOR,
             .u.vector =3D (uint8_t)param,
         };
=20
         ret =3D kvm_vm_ioctl(kvm_state, KVM_XEN_HVM_SET_ATTR, &xa);
-        if (!ret && xen_evtchn_singleton)
-            xen_evtchn_singleton->callback_param =3D param;
+        break;
+    }
+    case HVM_PARAM_CALLBACK_TYPE_GSI:
+        ret =3D 0;
+        break;
     }
+
+    if (!ret) {
+        s->callback_param =3D param;
+    }
+
     return ret;
 }
=20
+static void xen_evtchn_set_callback_level(XenEvtchnState *s, int level)
+{
+    uint32_t param =3D (uint32_t)s->callback_param;
+
+    switch (s->callback_param >> CALLBACK_VIA_TYPE_SHIFT) {
+    case HVM_PARAM_CALLBACK_TYPE_GSI:
+        if (param < GSI_NUM_PINS) {
+            qemu_set_irq(s->gsis[param], level);
+        }
+        break;
+    }
+}
+
+static void inject_callback(XenEvtchnState *s, uint32_t vcpu)
+{
+    if (kvm_xen_inject_vcpu_callback_vector(vcpu, s->callback_param)) {
+        return;
+    }
+
+    /* GSI or PCI_INTX delivery is only for events on vCPU 0 */
+    if (vcpu) {
+        return;
+    }
+
+    xen_evtchn_set_callback_level(s, 1);
+}
+
+void xen_evtchn_deassert_callback(void)
+{
+    XenEvtchnState *s =3D xen_evtchn_singleton;
+
+    if (s) {
+        xen_evtchn_set_callback_level(s, 0);
+    }
+}
+
 static void deassign_kernel_port(evtchn_port_t port)
 {
     struct kvm_xen_hvm_attr ha;
@@ -359,7 +431,7 @@ static int do_unmask_port_lm(XenEvtchnState *s, evtchn_=
port_t port,
         return 0;
     }
=20
-    kvm_xen_inject_vcpu_callback_vector(s->port_table[port].vcpu);
+    inject_callback(s, s->port_table[port].vcpu);
=20
     return 0;
 }
@@ -413,7 +485,7 @@ static int do_unmask_port_compat(XenEvtchnState *s, evt=
chn_port_t port,
         return 0;
     }
=20
-    kvm_xen_inject_vcpu_callback_vector(s->port_table[port].vcpu);
+    inject_callback(s, s->port_table[port].vcpu);
=20
     return 0;
 }
@@ -481,7 +553,7 @@ static int do_set_port_lm(XenEvtchnState *s, evtchn_por=
t_t port,
         return 0;
     }
=20
-    kvm_xen_inject_vcpu_callback_vector(s->port_table[port].vcpu);
+    inject_callback(s, s->port_table[port].vcpu);
=20
     return 0;
 }
@@ -524,7 +596,7 @@ static int do_set_port_compat(XenEvtchnState *s, evtchn=
_port_t port,
         return 0;
     }
=20
-    kvm_xen_inject_vcpu_callback_vector(s->port_table[port].vcpu);
+    inject_callback(s, s->port_table[port].vcpu);
=20
     return 0;
 }
diff --git a/hw/i386/kvm/xen_evtchn.h b/hw/i386/kvm/xen_evtchn.h
index 2acbaeabaa..1176b67b91 100644
--- a/hw/i386/kvm/xen_evtchn.h
+++ b/hw/i386/kvm/xen_evtchn.h
@@ -9,9 +9,12 @@
  * See the COPYING file in the top-level directory.
  */
=20
+#include "hw/sysbus.h"
=20
 void xen_evtchn_create(void);
 int xen_evtchn_set_callback_param(uint64_t param);
+void xen_evtchn_connect_gsis(qemu_irq *system_gsis);
+void xen_evtchn_deassert_callback(void);
=20
 void hmp_xen_event_list(Monitor *mon, const QDict *qdict);
 void hmp_xen_event_inject(Monitor *mon, const QDict *qdict);
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 427f79e6a8..1c4941de8f 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1303,6 +1303,12 @@ void pc_basic_device_init(struct PCMachineState *pcm=
s,
     }
     *rtc_state =3D mc146818_rtc_init(isa_bus, 2000, rtc_irq);
=20
+#ifdef CONFIG_XEN_EMU
+    if (xen_mode =3D=3D XEN_EMULATE) {
+        xen_evtchn_connect_gsis(gsi);
+    }
+#endif
+
     qemu_register_boot_set(pc_boot_set, *rtc_state);
=20
     if (!xen_enabled() &&
@@ -1848,8 +1854,8 @@ int pc_machine_kvm_type(MachineState *machine, const =
char *kvm_type)
 {
 #ifdef CONFIG_XEN_EMU
     if (xen_mode =3D=3D XEN_EMULATE) {
-            xen_overlay_create();
-            xen_evtchn_create();
+        xen_overlay_create();
+        xen_evtchn_create();
     }
 #endif
     return 0;
diff --git a/include/sysemu/kvm_xen.h b/include/sysemu/kvm_xen.h
index e5b14ffe8d..73fe5969b8 100644
--- a/include/sysemu/kvm_xen.h
+++ b/include/sysemu/kvm_xen.h
@@ -13,7 +13,7 @@
 #define QEMU_SYSEMU_KVM_XEN_H
=20
 void *kvm_xen_get_vcpu_info_hva(uint32_t vcpu_id);
-void kvm_xen_inject_vcpu_callback_vector(uint32_t vcpu_id);
+bool kvm_xen_inject_vcpu_callback_vector(uint32_t vcpu_id, uint64_t callba=
ck_param);
 int kvm_xen_set_vcpu_virq(uint32_t vcpu_id, uint16_t virq, uint16_t port);
=20
 #endif /* QEMU_SYSEMU_KVM_XEN_H */
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 846c738fd7..9330eb83fd 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1795,6 +1795,7 @@ typedef struct CPUArchState {
     uint64_t xen_vcpu_time_info_gpa;
     uint64_t xen_vcpu_runstate_gpa;
     uint8_t xen_vcpu_callback_vector;
+    bool xen_callback_asserted;
     uint16_t xen_virq[XEN_NR_VIRQS];
 #endif
 #if defined(CONFIG_HVF)
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index cbf41d6f81..32d808da37 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -5431,6 +5431,19 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_ru=
n *run)
     char str[256];
     KVMState *state;
=20
+#ifdef CONFIG_XEN_EMU
+    /*
+     * If the callback is asserted as a GSI (or PCI INTx) then check if
+     * vcpu_info->evtchn_upcall_pending has been cleared, and deassert
+     * the callback IRQ if so. Ideally we could hook into the PIC/IOAPIC
+     * EOI and only resample then, exactly how the VFIO eventfd pairs
+     * are designed to work for level triggered interrupts.
+     */
+    if (cpu->env.xen_callback_asserted) {
+        kvm_xen_maybe_deassert_callback(cs);
+    }
+#endif
+
     switch (run->exit_reason) {
     case KVM_EXIT_HLT:
         DPRINTF("handle_hlt\n");
diff --git a/target/i386/kvm/xen-emu.c b/target/i386/kvm/xen-emu.c
index a8c953e3ca..48ae47809a 100644
--- a/target/i386/kvm/xen-emu.c
+++ b/target/i386/kvm/xen-emu.c
@@ -240,18 +240,11 @@ static void *gpa_to_hva(uint64_t gpa)
                                              mrs.offset_within_region);
 }
=20
-void *kvm_xen_get_vcpu_info_hva(uint32_t vcpu_id)
+static void *vcpu_info_hva_from_cs(CPUState *cs)
 {
-    CPUState *cs =3D qemu_get_cpu(vcpu_id);
-    CPUX86State *env;
-    uint64_t gpa;
-
-    if (!cs) {
-        return NULL;
-    }
-    env =3D &X86_CPU(cs)->env;
+    CPUX86State *env =3D &X86_CPU(cs)->env;
+    uint64_t gpa =3D env->xen_vcpu_info_gpa;
=20
-    gpa =3D env->xen_vcpu_info_gpa;
     if (gpa =3D=3D UINT64_MAX)
         gpa =3D env->xen_vcpu_info_default_gpa;
     if (gpa =3D=3D UINT64_MAX)
@@ -260,13 +253,38 @@ void *kvm_xen_get_vcpu_info_hva(uint32_t vcpu_id)
     return gpa_to_hva(gpa);
 }
=20
-void kvm_xen_inject_vcpu_callback_vector(uint32_t vcpu_id)
+void *kvm_xen_get_vcpu_info_hva(uint32_t vcpu_id)
+{
+    CPUState *cs =3D qemu_get_cpu(vcpu_id);
+
+    if (!cs) {
+            return NULL;
+    }
+
+    return vcpu_info_hva_from_cs(cs);
+}
+
+void kvm_xen_maybe_deassert_callback(CPUState *cs)
+{
+    struct vcpu_info *vi =3D vcpu_info_hva_from_cs(cs);
+    if (!vi) {
+            return;
+    }
+
+    /* If the evtchn_upcall_pending flag is cleared, turn the GSI off. */
+    if (!vi->evtchn_upcall_pending) {
+        X86_CPU(cs)->env.xen_callback_asserted =3D false;
+        xen_evtchn_deassert_callback();
+    }
+}
+
+bool kvm_xen_inject_vcpu_callback_vector(uint32_t vcpu_id, uint64_t callba=
ck_param)
 {
     CPUState *cs =3D qemu_get_cpu(vcpu_id);
     uint8_t vector;
=20
     if (!cs) {
-        return;
+        return false;
     }
     vector =3D X86_CPU(cs)->env.xen_vcpu_callback_vector;
=20
@@ -278,13 +296,25 @@ void kvm_xen_inject_vcpu_callback_vector(uint32_t vcp=
u_id)
             .data =3D vector | (1UL << MSI_DATA_LEVEL_SHIFT),
         };
         kvm_irqchip_send_msi(kvm_state, msg);
-        return;
+        return true;
     }
=20
-    /* If the evtchn_upcall_pending field in the vcpu_info is set, then
-     * KVM will automatically deliver the vector on entering the vCPU
-     * so all we have to do is kick it out. */
-    qemu_cpu_kick(cs);
+    switch(callback_param >> 56) {
+    case HVM_PARAM_CALLBACK_TYPE_VECTOR:
+            /* If the evtchn_upcall_pending field in the vcpu_info is set,=
 then
+             * KVM will automatically deliver the vector on entering the v=
CPU
+             * so all we have to do is kick it out. */
+            qemu_cpu_kick(cs);
+            return true;
+
+    case HVM_PARAM_CALLBACK_TYPE_GSI:
+    case HVM_PARAM_CALLBACK_TYPE_PCI_INTX:
+            if (vcpu_id =3D=3D 0) {
+                X86_CPU(cs)->env.xen_callback_asserted =3D true;
+            }
+            return false;
+    }
+    return false;
 }
=20
 static int kvm_xen_set_vcpu_timer(CPUState *cs)
diff --git a/target/i386/kvm/xen-emu.h b/target/i386/kvm/xen-emu.h
index 58e4748d80..0ff8bed350 100644
--- a/target/i386/kvm/xen-emu.h
+++ b/target/i386/kvm/xen-emu.h
@@ -27,5 +27,6 @@ int kvm_xen_init(KVMState *s, uint32_t hypercall_msr);
 int kvm_xen_handle_exit(X86CPU *cpu, struct kvm_xen_exit *exit);
 int kvm_xen_set_vcpu_attr(CPUState *cs, uint16_t type, uint64_t gpa);
 int kvm_xen_set_vcpu_callback_vector(CPUState *cs);
+void kvm_xen_maybe_deassert_callback(CPUState *cs);
=20
 #endif /* QEMU_I386_KVM_XEN_EMU_H */
--=20
2.25.1


--=-zSj2xIOpem4th3CM0f+w
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
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjIxMjE1MjA1NDU2WjAvBgkqhkiG9w0BCQQxIgQgB3jOW8UD
o5jcI8g02BxSWfStNshrvSJZ3GjtcKo1Fu4wgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgA/IZ8/z7c220P1nB8xwR8iEJySmoifu3r+
hh9V8iq7iao9d8pWTj6UMmYfkYLrI5jbTwso+BOvN02eWKzORaKaKWqIT4UdlP6Sx7Xz3C8SEq2f
vMnTLL+nyxPDjfy2egNqbEiyJ936X6FrGMC2neGhDJGmOYTh9VoQ514Lt1Kg0HilAvHBWAseFGoj
idzKHxz71I+esENXpvAq7ukE5RL2m77KGvnE+UlbpNypXWXh6G/CgWctusB9bSuXu6wSxrqab8JG
aR7cdKLu7K4EEZwLL6nHfDJGaokgSvHkFKIUH85p536r5eG9lskWaCotVJmO7FZVVhOJUBDwULCJ
cjklN49AIIRFxmTWwmPh9L4oUb1Wm+FzXq25z/tGs7XcfYWp3kxruohnIfqde0+PQOzg2Sf5cAD+
19SmtQuX7fFcwe86FNXvRcbkwEvSKiBSyyOMSwYVo+JpLrdsjEbitYJE7nvvcaIHpDbOZDIcncnN
NowQciYSWOrxO+JqAST1hwM0BNtUYsvPLdrTKrP2jEQAlQYAtS82rfozeRpLcnDas3ogJZ5AzFB9
Ne+Hn9HSBYJWJO035VvmySWCHG5YAQhQ0lLXL+GR7hQEqdkm39pAT+5dFJtdBTzHR5S9SdZHFwez
Gf2eiEJ9bkTnRPCdWckkCmK4AWN3V666JDLLBYaDVwAAAAAAAA==


--=-zSj2xIOpem4th3CM0f+w--


