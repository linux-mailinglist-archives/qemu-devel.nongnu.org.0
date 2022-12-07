Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2346458BB
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 12:17:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2sP2-0006TW-2J; Wed, 07 Dec 2022 06:15:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+b88c7ff54d16f042dafa+7045+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p2sOm-0006Sk-Dj
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 06:15:42 -0500
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <BATV+b88c7ff54d16f042dafa+7045+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1p2sOi-00015r-CX
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 06:15:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=XVz3Xks1CrugwtkNAkpZpfF1cYtGO7J33GsyXKZpTcY=; b=bg+t4b4GPDqm2qA/60JccF1nK9
 cz+o3k+SYoztNO3L7NL+RUmZ8evz1oxjCH1Elc4eDalJJtktMWlQlP4FcoMNu8drQkd5sHEKjdK/3
 1ChL052CcDWwPRNBihVuVbhwjb7aJi6w4rUfhda2IpS35ak+aTDMFWkto0JYNt8aC7dr0JqFCa1Tc
 YXo8f3+KxzD1rUFgZPrlM/+8AFVqce1nKDJTiVENgFzMge4sNVAzDBqvUvA0B9HUma0BA/BhXpguX
 M0LwhqNLqrfkWLlSsauL0pfE+1TyQZp3Dybuk7+Vh7aQA7VvPhTOfyjKnpXNdNW6pBoyY2bO6gQRo
 eBQ4oKpg==;
Received: from [2001:8b0:10b:5::bb3] (helo=u3832b3a9db3152.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1p2sOY-005c87-Vf; Wed, 07 Dec 2022 11:15:23 +0000
Message-ID: <f17661a607af68c84980b5770a42970544fb7f72.camel@infradead.org>
Subject: Re: [RFC PATCH 12/21] i386/xen: set shared_info page
From: David Woodhouse <dwmw2@infradead.org>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant
 <paul@xen.org>, Joao Martins <joao.m.martins@oracle.com>, Ankur Arora
 <ankur.a.arora@oracle.com>, Juan Quintela <quintela@redhat.com>, Claudio
 Fontana <cfontana@suse.de>
Date: Wed, 07 Dec 2022 11:15:14 +0000
In-Reply-To: <Y48Sty6Q6xHlClU3@work-vm>
References: <20221205173137.607044-1-dwmw2@infradead.org>
 <20221205173137.607044-13-dwmw2@infradead.org>
 <cbb522e1-3d8d-5332-7ac8-c0e054be33e2@linaro.org>
 <ffcf677c1669a8dc43f8eda498e0d7914028a3c1.camel@infradead.org>
 <73e22a62-d319-7a18-098f-1e4df70e5439@linaro.org>
 <Y48Sty6Q6xHlClU3@work-vm>
Content-Type: multipart/signed; micalg="sha-256";
 protocol="application/pkcs7-signature"; 
 boundary="=-/IXlkK4FQJAZCXTiMIi6"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Received-SPF: none client-ip=2001:8b0:10b:1236::1;
 envelope-from=BATV+b88c7ff54d16f042dafa+7045+infradead.org+dwmw2@casper.srs.infradead.org;
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


--=-/IXlkK4FQJAZCXTiMIi6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2022-12-06 at 10:00 +0000, Dr. David Alan Gilbert wrote:
> * Philippe Mathieu-Daud=C3=A9 (
> philmd@linaro.org
> ) wrote:
> > +Juan/David/Claudio.
> >=20
> > On 6/12/22 03:20, David Woodhouse wrote:
> > > On Mon, 2022-12-05 at 23:17 +0100, Philippe Mathieu-Daud=C3=A9 wrote:
> > > > On 5/12/22 18:31, David Woodhouse wrote:
> > > > > From: Joao Martins <
> > > > > joao.m.martins@oracle.com
> > > > > >
> > > > >=20
> > > > > This is done by implementing HYPERVISOR_memory_op specifically
> > > > > XENMEM_add_to_physmap with space XENMAPSPACE_shared_info. While
> > > > > Xen removes the page with its own, we instead use the gfn passed
> > > > > by the guest.
> > > > >=20
> > > > > Signed-off-by: Joao Martins <
> > > > > joao.m.martins@oracle.com
> > > > > >
> > > > > Signed-off-by: David Woodhouse <
> > > > > dwmw@amazon.co.uk
> > > > > >
> > > > > ---
> > > > >    accel/kvm/kvm-all.c      |  6 ++++
> > > > >    include/hw/core/cpu.h    |  2 ++
> > > > >    include/sysemu/kvm.h     |  2 ++
> > > > >    include/sysemu/kvm_int.h |  3 ++
> > > > >    target/i386/cpu.h        |  8 ++++++
> > > > >    target/i386/trace-events |  1 +
> > > > >    target/i386/xen-proto.h  | 19 +++++++++++++
> > > > >    target/i386/xen.c        | 61 ++++++++++++++++++++++++++++++++=
++++++++
> > > > >    8 files changed, 102 insertions(+)
> > > > >    create mode 100644 target/i386/xen-proto.h
> > > >=20
> > > >=20
> > > > > diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> > > > > index 8830546121..e57b693528 100644
> > > > > --- a/include/hw/core/cpu.h
> > > > > +++ b/include/hw/core/cpu.h
> > > > > @@ -443,6 +443,8 @@ struct CPUState {
> > > > >        /* track IOMMUs whose translations we've cached in the TCG=
 TLB */
> > > > >        GArray *iommu_notifiers;
> > > > > +
> > > > > +    struct XenState *xen_state;
> > > >=20
> > > > Since you define a type definition below, use it.
> > >=20
> > > Ack.
> > >=20
> > > More importantly though, some of that state needs to be persisted
> > > across live migration / live update.
> > >=20
> > > There is per-vCPU state (the GPAs for vcpu_info etc., upcall vector,
> > > timer info). I think I see how I could add that to the vmstate_x86_cp=
u
> > > defined in target/i386/machine.c.
> > >=20
> > > For the machine-wide state, where do I add that? Should I just
> > > instantiate a dummy device (a bit like TYPE_KVM_CLOCK, AFAICT) to han=
g
> > > that state off?
> >=20
> > XenState in CPUState indeed is an anti-pattern.
> >=20
> > As you said elsewhere (patch 2 maybe) your use is not a new accelerator
> > but a machine, so new state should go in a derived MachineState.
>=20
> I *think* the vmstate tends to be attached to a device rather than the
> machinetype itself; eg a PCIe bridge that the Machine instantiates.
> But yes, a 'dummy' type is fine for hanging vmstate off.

Below is an attempt at that. It adds a 'xen-overlay' device which hosts
the memory regions corresponding to "xenheap" pages, which need to be
mapped over guest GPAs on demand.

There's plenty to heckle here, but it basically seems to be working.
I've dumped the state (migrate "exec:cat>foo") and I can see the
correct shinfo_gpa there when the guest was running.

I added the device under hw/xen covered by CONFIG_XEN_EMU, and will
amend the existing shinfo patch to call xen_overlay_map_page() instead
of just *assuming* that there'll already be RAM there... which is true
for Linux guests but Windows uses an empty GFN instead of wasting a
page of real RAM.

There are some target-specific things to be migrated too, so if this
approach is sane then I'll probably add a similar dummy device in
target/i386/xen.c for the system-wide state in *addition* to...

> > Migration is not my area of expertise, but since only the xenfv machine
> > will use this configuration, it seems simpler to store the vCPUs
> > migration states there...
>=20
> As long as ordering issues don't bite; i.e. between loading the
> new Xen specific stuff and loading the main cpu;  you can force
> order using the MIG_PRI_ constants on the .priority field.
>=20
> I was going to suggest maybe you could add it to vmstate_cpu_common
> as a subsection; but I don't *think* that's used for x86
> (I think that's vmstate_x86_cpu instead???)

... using vmstate_x86_cpu for the per-vCPU state, which seems fairly
straightforward.

-------
=46rom 6ac40ff7731bc2144aa7fa4015b9308c2eea8f3d Mon Sep 17 00:00:00 2001
From: David Woodhouse <dwmw@amazon.co.uk>
Date: Wed, 7 Dec 2022 09:19:31 +0000
Subject: [PATCH] hw/xen: Add xen_overlay device for emulating shared xenhea=
p
 pages

For the shared info page and for grant tables, Xen shares its own pages
from the "Xen heap" to the guest. The guest requests that a given page
from a certain address space (XENMAPSPACE_shared_info, etc.) be mapped
to a given GPA using the XENMEM_add_to_physmap hypercall.

To support that in qemu when *emulating* Xen, create a memory region
(migratable) and allow it to be mapped as an overlay when requested.

Xen theoretically allows the same page to be mapped multiple times
into the guest, but that's hard to track and reinstate over migration,
so we automatically *unmap* any previous mapping when creating a new
one. This approach has been used in production with.... a non-trivial
number of guests expecting true Xen, without any problems yet being
noticed.

This adds just the shared info page for now. The grant tables will be
a larger region, and will need to be overlaid one page at a time. I
think that means I need to create separate aliases for each page of
the overall grant_frames region, so that they can be mapped individually.

Expecting some heckling at the use of xen_overlay_singleton. What is
the best way to do that? Using qemu_find_recursive() every time seemed
a bit wrong. But I suppose mapping it into the *guest* isn't a fast
path, and if the actual grant table code is allowed to just stash the
pointer it gets from xen_overlay_page_ptr() for later use then that
isn't a fast path for device I/O either.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 hw/i386/pc_piix.c    |   6 ++
 hw/xen/meson.build   |   4 ++
 hw/xen/xen_overlay.c | 158 +++++++++++++++++++++++++++++++++++++++++++
 hw/xen/xen_overlay.h |  14 ++++
 4 files changed, 182 insertions(+)
 create mode 100644 hw/xen/xen_overlay.c
 create mode 100644 hw/xen/xen_overlay.h

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index d1127adde0..322232cce1 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -57,6 +57,7 @@
 #ifdef CONFIG_XEN
 #include <xen/hvm/hvm_info_table.h>
 #include "hw/xen/xen_pt.h"
+#include "hw/xen/xen_overlay.h"
 #endif
 #include "migration/global_state.h"
 #include "migration/misc.h"
@@ -411,6 +412,11 @@ static void pc_xen_hvm_init(MachineState *machine)
=20
     pc_xen_hvm_init_pci(machine);
     pci_create_simple(pcms->bus, -1, "xen-platform");
+#ifdef CONFIG_XEN_EMU
+    if (xen_mode =3D=3D XEN_EMULATE) {
+            xen_overlay_create();
+    }
+#endif
 }
 #endif
=20
diff --git a/hw/xen/meson.build b/hw/xen/meson.build
index ae0ace3046..74b1b60afe 100644
--- a/hw/xen/meson.build
+++ b/hw/xen/meson.build
@@ -22,3 +22,7 @@ else
 endif
=20
 specific_ss.add_all(when: ['CONFIG_XEN', xen], if_true: xen_specific_ss)
+
+softmmu_ss.add(when: ['CONFIG_XEN_EMU'], if_true: files(
+  'xen_overlay.c',
+))
diff --git a/hw/xen/xen_overlay.c b/hw/xen/xen_overlay.c
new file mode 100644
index 0000000000..86865082cf
--- /dev/null
+++ b/hw/xen/xen_overlay.c
@@ -0,0 +1,158 @@
+/*
+ * QEMU Xen emulation: Shared/overlay pages support
+ *
+ * Copyright =C2=A9 2022 Amazon.com, Inc. or its affiliates. All Rights Re=
served.
+ *
+ * Authors: David Woodhouse <dwmw2@infradead.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/host-utils.h"
+#include "qemu/module.h"
+#include "qemu/main-loop.h"
+#include "qapi/error.h"
+#include "qom/object.h"
+#include "exec/target_page.h"
+#include "exec/address-spaces.h"
+#include "migration/vmstate.h"
+
+#include "hw/sysbus.h"
+#include "hw/xen/xen.h"
+#include "xen_overlay.h"
+
+#include "standard-headers/xen/memory.h"
+
+#define INVALID_GPA UINT64_MAX
+
+#define TYPE_XEN_OVERLAY "xenoverlay"
+OBJECT_DECLARE_SIMPLE_TYPE(XenOverlayState, XEN_OVERLAY)
+
+struct XenOverlayState {
+    /*< private >*/
+    SysBusDevice busdev;
+    /*< public >*/
+
+    MemoryRegion shinfo_mem;
+    void *shinfo_ptr;
+    uint64_t shinfo_gpa;
+};
+
+struct XenOverlayState *xen_overlay_singleton;
+
+static void xen_overlay_realize(DeviceState *dev, Error **errp)
+{
+    XenOverlayState *s =3D XEN_OVERLAY(dev);
+    size_t pg_sz =3D qemu_target_page_size();
+
+    if (xen_mode !=3D XEN_EMULATE) {
+        error_setg(errp, "Xen overlay page support is for Xen emulation");
+        return;
+    }
+
+    memory_region_init_ram(&s->shinfo_mem, OBJECT(dev), "xen:shared_info",=
 pg_sz, &error_abort);
+    memory_region_set_enabled(&s->shinfo_mem, true);
+    s->shinfo_ptr =3D memory_region_get_ram_ptr(&s->shinfo_mem);
+    s->shinfo_gpa =3D INVALID_GPA;
+    memset(s->shinfo_ptr, 0, pg_sz);
+}
+
+static int xen_overlay_post_load(void *opaque, int version_id)
+{
+    XenOverlayState *s =3D opaque;
+
+    if (s->shinfo_gpa !=3D INVALID_GPA) {
+            xen_overlay_map_page(XENMAPSPACE_shared_info, 0, s->shinfo_gpa=
);
+    }
+
+    return 0;
+}
+
+static bool xen_overlay_is_needed(void *opaque)
+{
+    return xen_mode =3D=3D XEN_EMULATE;
+}
+
+static const VMStateDescription xen_overlay_vmstate =3D {
+    .name =3D "xen_overlay",
+    .version_id =3D 1,
+    .minimum_version_id =3D 1,
+    .needed =3D xen_overlay_is_needed,
+    .post_load =3D xen_overlay_post_load,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT64(shinfo_gpa, XenOverlayState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void xen_overlay_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+
+    dc->realize =3D xen_overlay_realize;
+    dc->vmsd =3D &xen_overlay_vmstate;
+}
+
+static const TypeInfo xen_overlay_info =3D {
+    .name          =3D TYPE_XEN_OVERLAY,
+    .parent        =3D TYPE_SYS_BUS_DEVICE,
+    .instance_size =3D sizeof(XenOverlayState),
+    .class_init    =3D xen_overlay_class_init,
+};
+
+void xen_overlay_create(void)
+{
+    xen_overlay_singleton =3D XEN_OVERLAY(sysbus_create_simple(TYPE_XEN_OV=
ERLAY, -1, NULL));
+}
+
+static void xen_overlay_register_types(void)
+{
+    type_register_static(&xen_overlay_info);
+}
+
+type_init(xen_overlay_register_types)
+
+int xen_overlay_map_page(uint32_t space, uint64_t idx, uint64_t gpa)
+{
+    MemoryRegion *ovl_page;
+
+    if (space !=3D XENMAPSPACE_shared_info || idx !=3D 0)
+        return -EINVAL;
+
+    if (!xen_overlay_singleton)
+        return -ENOENT;
+
+    qemu_mutex_lock_iothread();
+
+    ovl_page =3D &xen_overlay_singleton->shinfo_mem;
+
+    if (memory_region_is_mapped(ovl_page)) {
+        /* Xen allows guests to map the same page as many times as it like=
s
+         * into guest physical frames. We don't, because it would be hard
+         * to track and restore them all. One mapping of each page is
+         * perfectly sufficient for all known guests... and we've tested
+         * that theory on a few now in other implementations. dwmw2. */
+        memory_region_del_subregion(get_system_memory(), ovl_page);
+    }
+
+    if (gpa !=3D INVALID_GPA) {
+        memory_region_add_subregion_overlap(get_system_memory(), gpa, ovl_=
page, 0);
+    }
+    xen_overlay_singleton->shinfo_gpa =3D gpa;
+
+    qemu_mutex_unlock_iothread();
+    return 0;
+}
+
+void *xen_overlay_page_ptr(uint32_t space, uint64_t idx)
+{
+    if (space !=3D XENMAPSPACE_shared_info || idx !=3D 0)
+        return NULL;
+
+    if (!xen_overlay_singleton)
+        return NULL;
+
+    return xen_overlay_singleton->shinfo_ptr;
+}
diff --git a/hw/xen/xen_overlay.h b/hw/xen/xen_overlay.h
new file mode 100644
index 0000000000..afc63991ea
--- /dev/null
+++ b/hw/xen/xen_overlay.h
@@ -0,0 +1,14 @@
+/*
+ * QEMU Xen emulation: Shared/overlay pages support
+ *
+ * Copyright =C2=A9 2022 Amazon.com, Inc. or its affiliates. All Rights Re=
served.
+ *
+ * Authors: David Woodhouse <dwmw2@infradead.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or late=
r.
+ * See the COPYING file in the top-level directory.
+ */
+
+void xen_overlay_create(void);
+int xen_overlay_map_page(uint32_t space, uint64_t idx, uint64_t gpa);
+void *xen_overlay_page_ptr(uint32_t space, uint64_t idx);
--=20
2.25.1


--=-/IXlkK4FQJAZCXTiMIi6
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
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjIxMjA3MTExNTE0WjAvBgkqhkiG9w0BCQQxIgQg4ww5s1Wl
cBotqYY3Hm/nH/BDp+Vh1iQHWn7/txRIndYwgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgCKkvlxXNR6YC6Kp/Ddk2r5uyw6aV8zLekq
+7g4aN641peJLnEWAynXV6hkXDyI/VFRKYan3FtqEYkDj8LsRvTf4su55CRVTa3RWj8FXhIGBihI
4f8ccbvS2djGWGHgjXCMGE7oHCJX58TfdZ3JG5wKM9F5KpEJSrvHAnF8PqXAD5y1i3jY5a7nOjsg
jG6f+rFylyWEkm26NzvwOhRaMxkqo6v/TOajPoL3J+eJfdbXwO5u/dRiLBOZGOIaCDaLUqLputIb
AkWtRGqY3wkVBmDLubhosoOG1oIVDB/CW0/udTqXbNnMK+o+ATJVyi2zUbJP7X+93RFxAr4fZaQd
o9MFuzGwlS/goNvbZXswYyFVycTDnCMaAE7MdxQTjQ0ggInMaUbN0kNXFRpxAJO09jvt8FTm7auM
sqZRP0HbZPUBkCxjiXseXj8uMtll6EN8HRoTJcRfgGX98rzvnTSfVxzeZT6a2OFJ1Ljjp2ji5/q5
FMwY0m93z8iInq/akZKY+HtNpmMqN6pXY8FmBKaJi9WHkl2xmyjirvqawd7coDKw6ugRCER0a0sj
Bic57MQPvVqwWP3uDpPAdhtmomxy02Mb6fQQS01nLhAWFqU+7uPKcd8sGuFLzx2ovPFBdAYQ31uw
izWUeolxpWTi8JzTbdrpYSDl5EruVV0Fe9TYxHhI6QAAAAAAAA==


--=-/IXlkK4FQJAZCXTiMIi6--


