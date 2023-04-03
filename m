Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3580B6D4D50
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 18:13:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjMnV-0003hz-WC; Mon, 03 Apr 2023 12:12:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pjMnT-0003gj-RV
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 12:12:43 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pjMnQ-0004Ml-Jo
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 12:12:43 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Pqwmj3vVYz67ds9;
 Tue,  4 Apr 2023 00:08:37 +0800 (CST)
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 3 Apr
 2023 17:12:33 +0100
Date: Mon, 3 Apr 2023 17:12:32 +0100
To: Thomas Huth <thuth@redhat.com>
CC: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, "Michael S.
 Tsirkin" <mst@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, "Ben
 Widawsky" <ben.widawsky@intel.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, <qemu-devel@nongnu.org>, Paolo Bonzini
 <pbonzini@redhat.com>
Subject: Re: [PULL 02/10] pci-bridge/cxl_downstream: Add a CXL switch
 downstream port
Message-ID: <20230403171232.000020bb@huawei.com>
In-Reply-To: <0ce0c313-61af-213f-96f6-16ab5f137b0f@redhat.com>
References: <20220616165703.42226-1-mst@redhat.com>
 <20220616165703.42226-3-mst@redhat.com>
 <4274de61-292d-b3e0-8f86-d7000122a715@redhat.com>
 <06f4e22c-1c30-42a6-6f80-1f04e9d55c96@redhat.com>
 <20221205105403.00003d0f@huawei.com>
 <20221205124516.00006362@huawei.com> <87y1rlnb28.fsf@linaro.org>
 <20221207132119.000036a8@huawei.com>
 <29cf9b02-be97-753a-797f-c72fb0099c56@redhat.com>
 <0ce0c313-61af-213f-96f6-16ab5f137b0f@redhat.com>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 24 Mar 2023 11:17:50 +0100
Thomas Huth <thuth@redhat.com> wrote:

> On 07/12/2022 14.26, Thomas Huth wrote:
> > On 07/12/2022 14.21, Jonathan Cameron wrote: =20
> >> On Mon, 05 Dec 2022 14:59:39 +0000
> >> Alex Benn=E9e <alex.bennee@linaro.org> wrote:
> >> =20
> >>> Jonathan Cameron via <qemu-devel@nongnu.org> writes:
> >>> =20
> >>>> On Mon, 5 Dec 2022 10:54:03 +0000
> >>>> Jonathan Cameron via <qemu-devel@nongnu.org> wrote: =20
> >>>>> On Sun, 4 Dec 2022 08:23:55 +0100
> >>>>> Thomas Huth <thuth@redhat.com> wrote: =20
> >>>>>> On 04/11/2022 07.47, Thomas Huth wrote: =20
> >>>>>>> On 16/06/2022 18.57, Michael S. Tsirkin wrote: =20
> >>>>>>>> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> >>>>>>>>
> >>>>>>>> Emulation of a simple CXL Switch downstream port.
> >>>>>>>> The Device ID has been allocated for this use.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> >>>>>>>> Message-Id: <20220616145126.8002-3-Jonathan.Cameron@huawei.com>
> >>>>>>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >>>>>>>> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> >>>>>>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >>>>>>>> ---
> >>>>>>>> =A0=A0 hw/cxl/cxl-host.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
|=A0 43 +++++-
> >>>>>>>> =A0=A0 hw/pci-bridge/cxl_downstream.c | 249=20
> >>>>>>>> +++++++++++++++++++++++++++++++++
> >>>>>>>> =A0=A0 hw/pci-bridge/meson.build=A0=A0=A0=A0=A0 |=A0=A0 2 +-
> >>>>>>>> =A0=A0 3 files changed, 291 insertions(+), 3 deletions(-)
> >>>>>>>> =A0=A0 create mode 100644 hw/pci-bridge/cxl_downstream.c =20
> >>>>>>>
> >>>>>>> =A0 =A0Hi!
> >>>>>>>
> >>>>>>> There is a memory problem somewhere in this new device. I can mak=
e QEMU
> >>>>>>> crash by running something like this:
> >>>>>>>
> >>>>>>> $ MALLOC_PERTURB_=3D59 ./qemu-system-x86_64 -M x-remote \
> >>>>>>> =A0 =A0=A0=A0 -display none -monitor stdio
> >>>>>>> QEMU 7.1.50 monitor - type 'help' for more information
> >>>>>>> (qemu) device_add cxl-downstream
> >>>>>>> ./qemu/qom/object.c:1188:5: runtime error: member access within=20
> >>>>>>> misaligned
> >>>>>>> address 0x3b3b3b3b3b3b3b3b for type 'struct Object', which requir=
es 8=20
> >>>>>>> byte
> >>>>>>> alignment
> >>>>>>> 0x3b3b3b3b3b3b3b3b: note: pointer points here
> >>>>>>> <memory cannot be printed>
> >>>>>>> Bus error (core dumped)
> >>>>>>>
> >>>>>>> Could you have a look if you've got some spare minutes? =20
> >>>>>>
> >>>>>> Ping! Jonathan, Michael, any news on this bug?
> >>>>>>
> >>>>>> (this breaks one of my local tests, that's why it's annoying for m=
e) =20
> >>>>> Sorry, my email filters ate your earlier message.
> >>>>>
> >>>>> Looking into this now. I'll note that it also happens on
> >>>>> device_add xio3130-downstream so not specific to this new device.
> >>>>>
> >>>>> So far all I've managed to do is track it to something rcu related
> >>>>> as failing in a call to drain_call_rcu() in qmp_device_add()
> >>>>>
> >>>>> Will continue digging. =20
> >>>>
> >>>> Assuming I'm seeing the same thing...
> >>>>
> >>>> Problem is g_free() on the PCIBridge windows:
> >>>> https://elixir.bootlin.com/qemu/latest/source/hw/pci/pci_bridge.c#L2=
35
> >>>>
> >>>> Is called before we get an rcu_call() to flatview_destroy() as a
> >>>> result of the final call of flatview_unref() in=20
> >>>> address_space_set_flatview()
> >>>> so we get a use after free.
> >>>>
> >>>> As to what the fix is...=A0 Suggestions welcome! =20
> >>>
> >>> It sounds like this is the wrong place to free the value then. I guess
> >>> the PCI aliases into &w->alias_io() don't get dealt with until RCU
> >>> clean-up time.
> >>>
> >>> I *think* using g_free_rcu() should be enough to ensure the free occu=
rs
> >>> after the rest of the RCU cleanups but maybe you should only be clean=
ing
> >>> up the windows at device unrealize time? Is this a dynamic piece of
> >>> memory which gets updated during the lifetime of the device? =20
> >>
> >> There is unfortunately code that swaps it for an updated structure
> >> in pci_bridge_update_mappings()
> >> =20
> >>>
> >>> If the memory is being cleared with RCU then the access to the base
> >>> pointer should be done with the appropriate qatomic_rcu_[set|read]
> >>> functions.
> >>> =20
> >>
> >> I'm annoyingly snowed under this week with other things, but hopefully
> >> can get to in a few days.=A0 Note we are looking at an old problem
> >> here, just one that's happening for an additional device, not sure
> >> if that really affects urgency of fix though. =20
> >=20
> > It's too late now for QEMU 7.2 anyway, so there is no hurry, I think. =
=20
>=20
> I'm still seeing problems with this device, I guess it's still the
> same issue:
>=20
> $ valgrind -q ./qemu-system-x86_64 -M x-remote -monitor stdio
> ...
> QEMU 7.2.91 monitor - type 'help' for more information
> (qemu) device_add cxl-downstream,id=3Dc1
> =3D=3D46154=3D=3D Thread 2:
> =3D=3D46154=3D=3D Invalid read of size 8
> =3D=3D46154=3D=3D    at 0x7A0A0B: memory_region_unref (memory.c:1798)
> =3D=3D46154=3D=3D    by 0x7A0A0B: flatview_destroy (memory.c:298)
> =3D=3D46154=3D=3D    by 0x9A5E32: call_rcu_thread (rcu.c:284)
> =3D=3D46154=3D=3D    by 0x99CC19: qemu_thread_start (qemu-thread-posix.c:=
541)
> =3D=3D46154=3D=3D    by 0xB6A31C9: start_thread (in /usr/lib64/libpthread=
-2.28.so)
> =3D=3D46154=3D=3D    by 0xB8F4E72: clone (in /usr/lib64/libc-2.28.so)
> =3D=3D46154=3D=3D  Address 0x1a2a95c0 is 64 bytes inside a block of size =
1,632 free'd
> =3D=3D46154=3D=3D    at 0x4C39A93: free (vg_replace_malloc.c:872)
> =3D=3D46154=3D=3D    by 0x79B62B1: g_free (in /usr/lib64/libglib-2.0.so.0=
.5600.4)
> =3D=3D46154=3D=3D    by 0x55E06F: cxl_dsp_realize (cxl_downstream.c:201)
> =3D=3D46154=3D=3D    by 0x5523AC: pci_qdev_realize (pci.c:2098)
> =3D=3D46154=3D=3D    by 0x833A1E: device_set_realized (qdev.c:510)
> =3D=3D46154=3D=3D    by 0x836DC5: property_set_bool (object.c:2285)
> =3D=3D46154=3D=3D    by 0x838FA2: object_property_set (object.c:1420)
> =3D=3D46154=3D=3D    by 0x83C01E: object_property_set_qobject (qom-qobjec=
t.c:28)
> =3D=3D46154=3D=3D    by 0x839213: object_property_set_bool (object.c:1489)
> =3D=3D46154=3D=3D    by 0x5F9787: qdev_device_add_from_qdict (qdev-monito=
r.c:714)
> =3D=3D46154=3D=3D    by 0x5F98F0: qdev_device_add (qdev-monitor.c:733)
> =3D=3D46154=3D=3D    by 0x5F99E1: qmp_device_add (qdev-monitor.c:855)
> =3D=3D46154=3D=3D  Block was alloc'd at
> =3D=3D46154=3D=3D    at 0x4C37135: malloc (vg_replace_malloc.c:381)
> =3D=3D46154=3D=3D    by 0x79B61A5: g_malloc (in /usr/lib64/libglib-2.0.so=
.0.5600.4)
> =3D=3D46154=3D=3D    by 0x553072: pci_bridge_region_init (pci_bridge.c:19=
1)
> =3D=3D46154=3D=3D    by 0x553575: pci_bridge_initfn (pci_bridge.c:388)
> =3D=3D46154=3D=3D    by 0x55E032: cxl_dsp_realize (cxl_downstream.c:147)
> =3D=3D46154=3D=3D    by 0x5523AC: pci_qdev_realize (pci.c:2098)
> =3D=3D46154=3D=3D    by 0x833A1E: device_set_realized (qdev.c:510)
> =3D=3D46154=3D=3D    by 0x836DC5: property_set_bool (object.c:2285)
> =3D=3D46154=3D=3D    by 0x838FA2: object_property_set (object.c:1420)
> =3D=3D46154=3D=3D    by 0x83C01E: object_property_set_qobject (qom-qobjec=
t.c:28)
> =3D=3D46154=3D=3D    by 0x839213: object_property_set_bool (object.c:1489)
> =3D=3D46154=3D=3D    by 0x5F9787: qdev_device_add_from_qdict (qdev-monito=
r.c:714)
>=20
> Could we get a fix for QEMU 8.0 ?

The original option of moving over to g_free_rcu() and need to then protect
all accesses to br->windows was make a mess of things and as far as I can
immediately spot seems to be unnecessary.

Unfortunately I don't understand why the window handling is complex in the
first place.  The following patch just embeds the structure
directly in the PCI Bridge and seems to avoid the issue you have reported.

As the code to update it on the fly is protected anyway by
memory_region_transaction_begin() I don't think we care about ensuring the
exposed windows are consistent whilst we update them.

If someone else could sanity check my logic that would be great.

Thanks,

Jonathan


diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
index dd5af508f9..698fd01ae6 100644
--- a/hw/pci/pci_bridge.c
+++ b/hw/pci/pci_bridge.c
@@ -184,11 +184,11 @@ static void pci_bridge_init_vga_aliases(PCIBridge *br=
, PCIBus *parent,
     }
 }
=20
-static PCIBridgeWindows *pci_bridge_region_init(PCIBridge *br)
+static void pci_bridge_region_init(PCIBridge *br)
 {
     PCIDevice *pd =3D PCI_DEVICE(br);
     PCIBus *parent =3D pci_get_bus(pd);
-    PCIBridgeWindows *w =3D g_new(PCIBridgeWindows, 1);
+    PCIBridgeWindows *w =3D &br->windows;
     uint16_t cmd =3D pci_get_word(pd->config + PCI_COMMAND);
=20
     pci_bridge_init_alias(br, &w->alias_pref_mem,
@@ -211,8 +211,6 @@ static PCIBridgeWindows *pci_bridge_region_init(PCIBrid=
ge *br)
                           cmd & PCI_COMMAND_IO);
=20
     pci_bridge_init_vga_aliases(br, parent, w->alias_vga);
-
-    return w;
 }
=20
 static void pci_bridge_region_del(PCIBridge *br, PCIBridgeWindows *w)
@@ -234,19 +232,17 @@ static void pci_bridge_region_cleanup(PCIBridge *br, =
PCIBridgeWindows *w)
     object_unparent(OBJECT(&w->alias_vga[QEMU_PCI_VGA_IO_LO]));
     object_unparent(OBJECT(&w->alias_vga[QEMU_PCI_VGA_IO_HI]));
     object_unparent(OBJECT(&w->alias_vga[QEMU_PCI_VGA_MEM]));
-    g_free(w);
 }
=20
 void pci_bridge_update_mappings(PCIBridge *br)
 {
-    PCIBridgeWindows *w =3D br->windows;
-
+    PCIBridgeWindows *w =3D &br->windows;
     /* Make updates atomic to: handle the case of one VCPU updating the br=
idge
      * while another accesses an unaffected region. */
     memory_region_transaction_begin();
-    pci_bridge_region_del(br, br->windows);
+    pci_bridge_region_del(br, w);
     pci_bridge_region_cleanup(br, w);
-    br->windows =3D pci_bridge_region_init(br);
+    pci_bridge_region_init(br);
     memory_region_transaction_commit();
 }
=20
@@ -385,7 +381,7 @@ void pci_bridge_initfn(PCIDevice *dev, const char *type=
name)
     sec_bus->address_space_io =3D &br->address_space_io;
     memory_region_init(&br->address_space_io, OBJECT(br), "pci_bridge_io",
                        4 * GiB);
-    br->windows =3D pci_bridge_region_init(br);
+    pci_bridge_region_init(br);
     QLIST_INIT(&sec_bus->child);
     QLIST_INSERT_HEAD(&parent->child, sec_bus, sibling);
 }
@@ -396,8 +392,8 @@ void pci_bridge_exitfn(PCIDevice *pci_dev)
     PCIBridge *s =3D PCI_BRIDGE(pci_dev);
     assert(QLIST_EMPTY(&s->sec_bus.child));
     QLIST_REMOVE(&s->sec_bus, sibling);
-    pci_bridge_region_del(s, s->windows);
-    pci_bridge_region_cleanup(s, s->windows);
+    pci_bridge_region_del(s, &s->windows);
+    pci_bridge_region_cleanup(s, &s->windows);
     /* object_unparent() is called automatically during device deletion */
 }
=20
diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
index 81a058bb2c..b650748a39 100644
--- a/include/hw/pci/pci_bridge.h
+++ b/include/hw/pci/pci_bridge.h
@@ -30,6 +30,7 @@
 #include "hw/pci/pci_bus.h"
 #include "hw/cxl/cxl.h"
 #include "qom/object.h"
+#include "qemu/rcu.h"
=20
 typedef struct PCIBridgeWindows PCIBridgeWindows;
=20
@@ -39,8 +40,11 @@ typedef struct PCIBridgeWindows PCIBridgeWindows;
  * as subregions.
  */
 struct PCIBridgeWindows {
+//    struct rcu_head rcu;
     MemoryRegion alias_pref_mem;
+    //   uint8_t pad;
     MemoryRegion alias_mem;
+    // uint8_t pad2;
     MemoryRegion alias_io;
     /*
      * When bridge control VGA forwarding is enabled, bridges will
@@ -73,7 +77,7 @@ struct PCIBridge {
     MemoryRegion address_space_mem;
     MemoryRegion address_space_io;
=20
-    PCIBridgeWindows *windows;
+    PCIBridgeWindows windows;
=20
     pci_map_irq_fn map_irq;
     const char *bus_name;

>=20
>   Thomas
>=20


