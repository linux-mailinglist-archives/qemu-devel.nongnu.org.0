Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3112B2EC317
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 19:17:54 +0100 (CET)
Received: from localhost ([::1]:39864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxDNY-00073O-Df
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 13:17:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kxDLc-0006VN-Dc
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 13:15:52 -0500
Received: from 10.mo52.mail-out.ovh.net ([87.98.187.244]:40990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kxDLZ-0001GP-GB
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 13:15:52 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.53])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 8F7F622BBB3;
 Wed,  6 Jan 2021 19:15:38 +0100 (CET)
Received: from kaod.org (37.59.142.99) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 6 Jan 2021
 19:15:37 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0033c497e1d-b962-4f41-b373-088387330350,
 63494697DF0D740EAFE7DDD5B9B810A000FD86CF) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 82.253.208.248
Date: Wed, 6 Jan 2021 19:15:36 +0100
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 6/6] spapr: Model DR connectors as simple objects
Message-ID: <20210106191536.4d4c4991@bahia.lan>
In-Reply-To: <20201228082839.GL6952@yekko.fritz.box>
References: <20201218103400.689660-1-groug@kaod.org>
 <20201218103400.689660-7-groug@kaod.org>
 <20201228082839.GL6952@yekko.fritz.box>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KmjVOfwdivqrLv8Sw7HRGpa";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 8c2e8a77-0506-4c2b-a2a1-8738ca465de7
X-Ovh-Tracer-Id: 18323458037034621408
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrvdegtddgudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtihesghdtreerredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfeehtdffgfefheegvdefkedvheeltdehgeffhffhheeguefgkeehveehteeihfehnecuffhomhgrihhnpehprghttghhvgifrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepuggrnhhivghlhhgssehlihhnuhigrdhisghmrdgtohhm
Received-SPF: pass client-ip=87.98.187.244; envelope-from=groug@kaod.org;
 helo=10.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb@linux.ibm.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/KmjVOfwdivqrLv8Sw7HRGpa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 28 Dec 2020 19:28:39 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Fri, Dec 18, 2020 at 11:34:00AM +0100, Greg Kurz wrote:
> > Modeling DR connectors as individual devices raises some
> > concerns, as already discussed a year ago in this thread:
> >=20
> > https://patchew.org/QEMU/20191017205953.13122-1-cheloha@linux.vnet.ibm.=
com/
> >=20
> > First, high maxmem settings creates too many DRC devices.
> > This causes scalability issues. It severely increase boot
> > time because the multiple traversals of the DRC list that
> > are performed during machine setup are quadratic operations.
> > This is directly related to the fact that DRCs are modeled
> > as individual devices and added to the composition tree.
> >=20
> > Second, DR connectors are really an internal concept of
> > PAPR. They aren't something that the user or management
> > layer can manipulate in any way. We already don't allow
> > their creation with device_add by clearing user_creatable.
> >=20
> > DR connectors don't even need to be modeled as actual
> > devices since they don't sit in a bus. They just need
> > to be associated to an 'owner' object and to have the
> > equivalent of realize/unrealize functions.
> >=20
> > Downgrade them to be simple objects. Convert the existing
> > realize() and unrealize() to be methods of the DR connector
> > base class. Also have the base class to inherit from the
> > vmstate_if interface directly. The get_id() hook simply
> > returns NULL, just as device_vmstate_if_get_id() does for
> > devices that don't sit in a bus. The DR connector is no
> > longer made a child object. This means that it must be
> > explicitely freed when no longer needed. This is only
> > required for PHBs and PCI bridges actually : have them to
> > free the DRC with spapr_dr_connector_free() instead of
> > object_unparent().
> >=20
> > No longer add the DRCs to the QOM composition tree. Track
> > them with a glib hash table using the global DRC index as
> > the key instead. This makes traversal a linear operation.
>=20
> I have some reservations about this one.  The main thing is that
> attaching migration state to something that's not a device seems a bit
> odd to me.  AFAICT exactly one other non-device implements
> TYPE_VMSTATE_IF, and what it does isn't very clear to me.
>=20

Even with your proposal below, the current SpaprDrc type, which is
used all over the place, will stop being a TYPE_DEVICE but we still
need to support migration with existing machine types for which DRC
are devices. Implementing TYPE_VMSTATE_IF is essentially a hack that
allows to do that without keeping the current TYPE_DEVICE based
implementation around.

> As I might have mentioned to you I had a different idea for how to
> address this problem: still use a TYPE_DEVICE, but have it manage a
> whole array of DRCs as one unit, rather than just a single one.
> Specifically I was thinking:
>=20
> * one array per PCI bus (DRCs for each function on the bus)
> * one array for each block of memory (so one for base memory, one for
>   each DIMM)
> * one array for all the cpus
> * one array for all the PHBs
>=20
> It has some disadvantages compared to your scheme: it still leaves
> (less) devices which can't be user managed, which is a bit ugly.  On
> the other hand, each of those arrays can reasonably be dense, so we
> can use direct indexing rather than a hash table, which is a bit
> nicer.
>=20
> Thoughts?
>=20

I find it a bit overkill to introduce a new TYPE_DEVICE (let's
call it a DRC manager) for something that:
- doesn't sit on a bus
- can't be user managed
- isn't directly represented to the guest as a full node
  in the DT unlike all other devices, but just as indexes
  in some properties of actual DR capable devices.

Given that the DRC index space is global and this is what
the guest passes to DR RTAS calls, we can't do direct
indexing, strictly speaking. We need at least some logic
to dispatch operations on individual DRC states to the
appropriate DRC manager. This logic belongs to the machine
IMHO.

This shouldn't be too complex for CPUs and PHBs since they
sit directly under the machine and have 1:1 relation with
the attached device. It just boils down to instantiate
some DRC managers during machine init:

- range [ 0x10000000 ... 0x10000000 + ${max_cpus} [
  for CPUs
- range [ 0x20000000 ... 0x20000000 + 31 [
  for PHBs

For memory, the code currently generates DRC indexes in the range:

[ 0x80000000 ... 0x80000000 + ${base_ram_size}/256M ... ${max_ram_size}/256=
M [

ie. it doesn't generate DRC indexes for the base memory AFAICT. Also
each DIMM can be of arbitrary size, ie. consume an arbitrary amount
of DRC indexes. So the machine would instantiate SPAPR_MAX_RAM_SLOTS (32)
DRC managers, each capable of managing the full set of LMB DRCs, just
in case ? Likely a lot of zeroes with high maxmem settings but I guess
we can live with it.

PCI busses would need some extra care though since the machine
doesn't know about them. This would require to be able to
register/unregister DRC managers for SPAPR_DR_CONNECTOR_TYPE_PCI
indexes, so that the dispatching logic know about the ranges
they cover (PHB internals).

And finally comes migration : I cannot think of a way to generate
the VMState sections used by existing machine types out of a set
of arrays of integers... We could keep the current implementation
around and use it with older machine types, but this certainly
looks terrible from a maintenance perspective. Did you have any
suggestion to handle that ?

I seem to remember that one of the motivation to have arrays
of DRCs is to avoid the inflation of VMState sections that
we currently get with high maxmem settings, and it is considered
preferable to stream sparse arrays. This could be achieved by
building these arrays out of the global DRC hash table in a machine
pre-save handler and migrate them in a subsection for the default
machine type. Older machine types would continue with the current
VMState sections thanks to the TYPE_VMSTATE_IF hack.

Does this seem a reasonable trade-off to be able to support
older and newer machine types with the same implementation ?

> >=20
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> >  include/hw/ppc/spapr_drc.h |   8 +-
> >  hw/ppc/spapr_drc.c         | 166 ++++++++++++++-----------------------
> >  hw/ppc/spapr_pci.c         |   2 +-
> >  3 files changed, 69 insertions(+), 107 deletions(-)
> >=20
> > diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
> > index 8982927d5c24..a26aa8b9d4c3 100644
> > --- a/include/hw/ppc/spapr_drc.h
> > +++ b/include/hw/ppc/spapr_drc.h
> > @@ -170,7 +170,7 @@ typedef enum {
> > =20
> >  typedef struct SpaprDrc {
> >      /*< private >*/
> > -    DeviceState parent;
> > +    Object parent;
> > =20
> >      uint32_t id;
> >      Object *owner;
> > @@ -193,7 +193,7 @@ struct SpaprMachineState;
> > =20
> >  typedef struct SpaprDrcClass {
> >      /*< private >*/
> > -    DeviceClass parent;
> > +    ObjectClass parent;
> >      SpaprDrcState empty_state;
> >      SpaprDrcState ready_state;
> > =20
> > @@ -209,6 +209,9 @@ typedef struct SpaprDrcClass {
> > =20
> >      int (*dt_populate)(SpaprDrc *drc, struct SpaprMachineState *spapr,
> >                         void *fdt, int *fdt_start_offset, Error **errp);
> > +
> > +    void (*realize)(SpaprDrc *drc);
> > +    void (*unrealize)(SpaprDrc *drc);
> >  } SpaprDrcClass;
> > =20
> >  typedef struct SpaprDrcPhysical {
> > @@ -232,6 +235,7 @@ SpaprDrcType spapr_drc_type(SpaprDrc *drc);
> > =20
> >  SpaprDrc *spapr_dr_connector_new(Object *owner, const char *type,
> >                                           uint32_t id);
> > +void spapr_dr_connector_free(SpaprDrc *drc);
> >  SpaprDrc *spapr_drc_by_index(uint32_t index);
> >  SpaprDrc *spapr_drc_by_id(const char *type, uint32_t id);
> >  int spapr_dt_drc(void *fdt, int offset, Object *owner, uint32_t drc_ty=
pe_mask);
> > diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> > index 8571d5bafe4e..e26763f8b5a4 100644
> > --- a/hw/ppc/spapr_drc.c
> > +++ b/hw/ppc/spapr_drc.c
> > @@ -27,7 +27,6 @@
> >  #include "sysemu/reset.h"
> >  #include "trace.h"
> > =20
> > -#define DRC_CONTAINER_PATH "/dr-connector"
> >  #define DRC_INDEX_TYPE_SHIFT 28
> >  #define DRC_INDEX_ID_MASK ((1ULL << DRC_INDEX_TYPE_SHIFT) - 1)
> > =20
> > @@ -503,65 +502,56 @@ static const VMStateDescription vmstate_spapr_drc=
 =3D {
> >      }
> >  };
> > =20
> > -static void drc_realize(DeviceState *d, Error **errp)
> > +static GHashTable *drc_hash_table(void)
> >  {
> > -    SpaprDrc *drc =3D SPAPR_DR_CONNECTOR(d);
> > -    Object *root_container;
> > -    gchar *link_name;
> > -    const char *child_name;
> > +    static GHashTable *dht;
> > =20
> > +    if (!dht) {
> > +        dht =3D g_hash_table_new(NULL, NULL);
> > +    }
> > +
> > +    return dht;
> > +}
> > +
> > +
> > +static void drc_realize(SpaprDrc *drc)
> > +{
> >      trace_spapr_drc_realize(spapr_drc_index(drc));
> > -    /* NOTE: we do this as part of realize/unrealize due to the fact
> > -     * that the guest will communicate with the DRC via RTAS calls
> > -     * referencing the global DRC index. By unlinking the DRC
> > -     * from DRC_CONTAINER_PATH/<drc_index> we effectively make it
> > -     * inaccessible by the guest, since lookups rely on this path
> > -     * existing in the composition tree
> > -     */
> > -    root_container =3D container_get(object_get_root(), DRC_CONTAINER_=
PATH);
> > -    link_name =3D g_strdup_printf("%x", spapr_drc_index(drc));
> > -    child_name =3D object_get_canonical_path_component(OBJECT(drc));
> > -    trace_spapr_drc_realize_child(spapr_drc_index(drc), child_name);
> > -    object_property_add_alias(root_container, link_name,
> > -                              drc->owner, child_name);
> > -    g_free(link_name);
> > +
> > +    g_hash_table_insert(drc_hash_table(),
> > +                        GUINT_TO_POINTER(spapr_drc_index(drc)), drc);
> >      vmstate_register(VMSTATE_IF(drc), spapr_drc_index(drc), &vmstate_s=
papr_drc,
> >                       drc);
> >      trace_spapr_drc_realize_complete(spapr_drc_index(drc));
> >  }
> > =20
> > -static void drc_unrealize(DeviceState *d)
> > +static void drc_unrealize(SpaprDrc *drc)
> >  {
> > -    SpaprDrc *drc =3D SPAPR_DR_CONNECTOR(d);
> > -    Object *root_container;
> > -    gchar *name;
> > -
> >      trace_spapr_drc_unrealize(spapr_drc_index(drc));
> >      vmstate_unregister(VMSTATE_IF(drc), &vmstate_spapr_drc, drc);
> > -    root_container =3D container_get(object_get_root(), DRC_CONTAINER_=
PATH);
> > -    name =3D g_strdup_printf("%x", spapr_drc_index(drc));
> > -    object_property_del(root_container, name);
> > -    g_free(name);
> > +    g_hash_table_remove(drc_hash_table(),
> > +                        GUINT_TO_POINTER(spapr_drc_index(drc)));
> >  }
> > =20
> >  SpaprDrc *spapr_dr_connector_new(Object *owner, const char *type,
> >                                           uint32_t id)
> >  {
> >      SpaprDrc *drc =3D SPAPR_DR_CONNECTOR(object_new(type));
> > -    char *prop_name;
> > =20
> >      drc->id =3D id;
> > -    drc->owner =3D owner;
> > -    prop_name =3D g_strdup_printf("dr-connector[%"PRIu32"]",
> > -                                spapr_drc_index(drc));
> > -    object_property_add_child(owner, prop_name, OBJECT(drc));
> > -    object_unref(OBJECT(drc));
> > -    qdev_realize(DEVICE(drc), NULL, NULL);
> > -    g_free(prop_name);
> > +    drc->owner =3D object_ref(owner);
> > +    SPAPR_DR_CONNECTOR_GET_CLASS(drc)->realize(drc);
> > =20
> >      return drc;
> >  }
> > =20
> > +void spapr_dr_connector_free(SpaprDrc *drc)
> > +{
> > +    SPAPR_DR_CONNECTOR_GET_CLASS(drc)->unrealize(drc);
> > +    object_unref(drc->owner);
> > +    object_unref(drc);
> > +}
> > +
> >  static void spapr_dr_connector_instance_init(Object *obj)
> >  {
> >      SpaprDrc *drc =3D SPAPR_DR_CONNECTOR(obj);
> > @@ -575,17 +565,19 @@ static void spapr_dr_connector_instance_init(Obje=
ct *obj)
> >      drc->state =3D drck->empty_state;
> >  }
> > =20
> > +static char *drc_vmstate_if_get_id(VMStateIf *obj)
> > +{
> > +    return NULL;
> > +}
> > +
> >  static void spapr_dr_connector_class_init(ObjectClass *k, void *data)
> >  {
> > -    DeviceClass *dk =3D DEVICE_CLASS(k);
> > +    SpaprDrcClass *drck =3D SPAPR_DR_CONNECTOR_CLASS(k);
> > +    VMStateIfClass *vc =3D VMSTATE_IF_CLASS(k);
> > =20
> > -    dk->realize =3D drc_realize;
> > -    dk->unrealize =3D drc_unrealize;
> > -    /*
> > -     * Reason: DR connector needs to be wired to either the machine or=
 to a
> > -     * PHB in spapr_dr_connector_new().
> > -     */
> > -    dk->user_creatable =3D false;
> > +    drck->realize =3D drc_realize;
> > +    drck->unrealize =3D drc_unrealize;
> > +    vc->get_id =3D drc_vmstate_if_get_id;
> >  }
> > =20
> >  static bool drc_physical_needed(void *opaque)
> > @@ -623,39 +615,32 @@ static void drc_physical_reset(void *opaque)
> >      }
> >  }
> > =20
> > -static void realize_physical(DeviceState *d, Error **errp)
> > +static void realize_physical(SpaprDrc *drc)
> >  {
> > -    SpaprDrcPhysical *drcp =3D SPAPR_DRC_PHYSICAL(d);
> > -    Error *local_err =3D NULL;
> > -
> > -    drc_realize(d, &local_err);
> > -    if (local_err) {
> > -        error_propagate(errp, local_err);
> > -        return;
> > -    }
> > +    SpaprDrcPhysical *drcp =3D SPAPR_DRC_PHYSICAL(drc);
> > =20
> > +    drc_realize(drc);
> >      vmstate_register(VMSTATE_IF(drcp),
> >                       spapr_drc_index(SPAPR_DR_CONNECTOR(drcp)),
> >                       &vmstate_spapr_drc_physical, drcp);
> >      qemu_register_reset(drc_physical_reset, drcp);
> >  }
> > =20
> > -static void unrealize_physical(DeviceState *d)
> > +static void unrealize_physical(SpaprDrc *drc)
> >  {
> > -    SpaprDrcPhysical *drcp =3D SPAPR_DRC_PHYSICAL(d);
> > +    SpaprDrcPhysical *drcp =3D SPAPR_DRC_PHYSICAL(drc);
> > =20
> > -    drc_unrealize(d);
> > -    vmstate_unregister(VMSTATE_IF(drcp), &vmstate_spapr_drc_physical, =
drcp);
> >      qemu_unregister_reset(drc_physical_reset, drcp);
> > +    vmstate_unregister(VMSTATE_IF(drcp), &vmstate_spapr_drc_physical, =
drcp);
> > +    drc_unrealize(drc);
> >  }
> > =20
> >  static void spapr_drc_physical_class_init(ObjectClass *k, void *data)
> >  {
> > -    DeviceClass *dk =3D DEVICE_CLASS(k);
> >      SpaprDrcClass *drck =3D SPAPR_DR_CONNECTOR_CLASS(k);
> > =20
> > -    dk->realize =3D realize_physical;
> > -    dk->unrealize =3D unrealize_physical;
> > +    drck->realize =3D realize_physical;
> > +    drck->unrealize =3D unrealize_physical;
> >      drck->dr_entity_sense =3D physical_entity_sense;
> >      drck->isolate =3D drc_isolate_physical;
> >      drck->unisolate =3D drc_unisolate_physical;
> > @@ -731,12 +716,16 @@ static void spapr_drc_pmem_class_init(ObjectClass=
 *k, void *data)
> > =20
> >  static const TypeInfo spapr_dr_connector_info =3D {
> >      .name          =3D TYPE_SPAPR_DR_CONNECTOR,
> > -    .parent        =3D TYPE_DEVICE,
> > +    .parent        =3D TYPE_OBJECT,
> >      .instance_size =3D sizeof(SpaprDrc),
> >      .instance_init =3D spapr_dr_connector_instance_init,
> >      .class_size    =3D sizeof(SpaprDrcClass),
> >      .class_init    =3D spapr_dr_connector_class_init,
> >      .abstract      =3D true,
> > +    .interfaces =3D (InterfaceInfo[]) {
> > +        { TYPE_VMSTATE_IF },
> > +        { }
> > +    },
> >  };
> > =20
> >  static const TypeInfo spapr_drc_physical_info =3D {
> > @@ -789,14 +778,9 @@ static const TypeInfo spapr_drc_pmem_info =3D {
> > =20
> >  SpaprDrc *spapr_drc_by_index(uint32_t index)
> >  {
> > -    Object *obj;
> > -    gchar *name;
> > -
> > -    name =3D g_strdup_printf("%s/%x", DRC_CONTAINER_PATH, index);
> > -    obj =3D object_resolve_path(name, NULL);
> > -    g_free(name);
> > -
> > -    return !obj ? NULL : SPAPR_DR_CONNECTOR(obj);
> > +    return
> > +        SPAPR_DR_CONNECTOR(g_hash_table_lookup(drc_hash_table(),
> > +                                               GUINT_TO_POINTER(index)=
));
> >  }
> > =20
> >  SpaprDrc *spapr_drc_by_id(const char *type, uint32_t id)
> > @@ -824,13 +808,12 @@ SpaprDrc *spapr_drc_by_id(const char *type, uint3=
2_t id)
> >   */
> >  int spapr_dt_drc(void *fdt, int offset, Object *owner, uint32_t drc_ty=
pe_mask)
> >  {
> > -    Object *root_container;
> > -    ObjectProperty *prop;
> > -    ObjectPropertyIterator iter;
> > +    GHashTableIter iter;
> >      uint32_t drc_count =3D 0;
> >      GArray *drc_indexes, *drc_power_domains;
> >      GString *drc_names, *drc_types;
> >      int ret;
> > +    SpaprDrc *drc;
> > =20
> >      /*
> >       * This should really be only called once per node since it overwr=
ites
> > @@ -851,26 +834,12 @@ int spapr_dt_drc(void *fdt, int offset, Object *o=
wner, uint32_t drc_type_mask)
> >      drc_names =3D g_string_set_size(g_string_new(NULL), sizeof(uint32_=
t));
> >      drc_types =3D g_string_set_size(g_string_new(NULL), sizeof(uint32_=
t));
> > =20
> > -    /* aliases for all DRConnector objects will be rooted in QOM
> > -     * composition tree at DRC_CONTAINER_PATH
> > -     */
> > -    root_container =3D container_get(object_get_root(), DRC_CONTAINER_=
PATH);
> > -
> > -    object_property_iter_init(&iter, root_container);
> > -    while ((prop =3D object_property_iter_next(&iter))) {
> > -        Object *obj;
> > -        SpaprDrc *drc;
> > +    g_hash_table_iter_init(&iter, drc_hash_table());
> > +    while (g_hash_table_iter_next(&iter, NULL, (gpointer) &drc)) {
> >          SpaprDrcClass *drck;
> >          char *drc_name =3D NULL;
> >          uint32_t drc_index, drc_power_domain;
> > =20
> > -        if (!strstart(prop->type, "link<", NULL)) {
> > -            continue;
> > -        }
> > -
> > -        obj =3D object_property_get_link(root_container, prop->name,
> > -                                       &error_abort);
> > -        drc =3D SPAPR_DR_CONNECTOR(obj);
> >          drck =3D SPAPR_DR_CONNECTOR_GET_CLASS(drc);
> > =20
> >          if (owner && (drc->owner !=3D owner)) {
> > @@ -951,23 +920,12 @@ out:
> > =20
> >  void spapr_drc_reset_all(SpaprMachineState *spapr)
> >  {
> > -    Object *drc_container;
> > -    ObjectProperty *prop;
> > -    ObjectPropertyIterator iter;
> > +    GHashTableIter iter;
> > +    SpaprDrc *drc;
> > =20
> > -    drc_container =3D container_get(object_get_root(), DRC_CONTAINER_P=
ATH);
> >  restart:
> > -    object_property_iter_init(&iter, drc_container);
> > -    while ((prop =3D object_property_iter_next(&iter))) {
> > -        SpaprDrc *drc;
> > -
> > -        if (!strstart(prop->type, "link<", NULL)) {
> > -            continue;
> > -        }
> > -        drc =3D SPAPR_DR_CONNECTOR(object_property_get_link(drc_contai=
ner,
> > -                                                          prop->name,
> > -                                                          &error_abort=
));
> > -
> > +    g_hash_table_iter_init(&iter, drc_hash_table());
> > +    while (g_hash_table_iter_next(&iter, NULL, (gpointer) &drc)) {
> >          /*
> >           * This will complete any pending plug/unplug requests.
> >           * In case of a unplugged PHB or PCI bridge, this will
> > diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> > index 76d7c91e9c64..ca0cca664e3c 100644
> > --- a/hw/ppc/spapr_pci.c
> > +++ b/hw/ppc/spapr_pci.c
> > @@ -1262,7 +1262,7 @@ static void remove_drcs(SpaprPhbState *phb, PCIBu=
s *bus)
> >          SpaprDrc *drc =3D drc_from_devfn(phb, chassis, i);
> > =20
> >          if (drc) {
> > -            object_unparent(OBJECT(drc));
> > +            spapr_dr_connector_free(drc);
> >          }
> >      }
> >  }
>=20


--Sig_/KmjVOfwdivqrLv8Sw7HRGpa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAl/1/kgACgkQcdTV5YIv
c9ZAkw/+KT8WgU7jVh8+FfS2IJ8RGfX3hxClO0/XaI/0XvX1J5t3gcnk0J+zj0yL
R93JhNTK4CUyRnEGrPrkWegfK7zfsACXfoyFmCh1q6EnT/OfSVc76/FBWZGTjzJj
viXMKtfQ2dFLDJ0Lt+oDu6rHru11siq/QcwOQSRos8Tly6PwQjLO9dRPKwtbMmUB
gGuk7tWxITfu8pb9WGhZE10cZG08BbXw2zPWDl3CyjJPbSJGRb1rHesySzoH1Ms9
2BApn9Ny3VJFWwV26ubYHjiC1P4OlNQv1c69pQGEgzSsR76czh1Nv3y1i9J075po
OI3tFJwaS33haebR6BquVOhk48cynlq6UEnBLjIlONXw4Ji19A1I7UjaQH/hG+4+
acSbN5UWAY6HAesfLCesx2GtzmKNw1rDJRcaoHLpr1TDZVOg7CG0x5fUN3YKiN5m
mkBCGAU2Piz+pYRuWBQcKGncwtT+e2dqBQKowQEba0l5cq0gm0GLXZPEQ55WxQOT
g9ixaKg9oD8PiTyHcErgiSfNUMK2M/fAD1Eq4RsA6Gtc0vofYNJ/4PABtu0aC6JJ
AN1T8XUYFjRS9MuvhQTUqWyUL4WgbYLZeHQLaLbDSTizP3runeF3jFhnszUO6gAN
VvrudkQLiCVzdxWDc8Cllezeivgaa0C/CXHL0POb4MRZfaQKPx0=
=RKQ1
-----END PGP SIGNATURE-----

--Sig_/KmjVOfwdivqrLv8Sw7HRGpa--

