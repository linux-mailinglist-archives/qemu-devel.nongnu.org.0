Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E2F7B9BD
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 08:35:41 +0200 (CEST)
Received: from localhost ([::1]:38274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsiD7-0005pB-22
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 02:35:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46527)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hsiBc-0003VN-TB
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 02:34:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hsiBV-0000zq-UY
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 02:34:06 -0400
Received: from ozlabs.org ([203.11.71.1]:49971)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hsiBL-00086K-NM; Wed, 31 Jul 2019 02:33:52 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45z3Xk3bR7z9sN4; Wed, 31 Jul 2019 16:33:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1564554822;
 bh=YO3lr6xTHisSEYSyCUnctjxyty/C9WJkfz5EmRT6FYE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bLwqy+vAEeA2cjt5W1QkWFKfTEx47DU2DBj/w173Yl3KirlbwcF37t7ysJIemu3fU
 gyBqh426IFzx9c6/QRqtoMCHUZUVJygdnmH8RSzEzhvi+5sTr2tWyvQH2Fxb+2GTyY
 h8THgoCbsqBsMY6OV63dcTKHboio5S6Ou6zZiSIE=
Date: Wed, 31 Jul 2019 15:56:40 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <20190731055640.GC2032@umbus.fritz.box>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-5-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="O3RTKUHj+75w1tg5"
Content-Disposition: inline
In-Reply-To: <20190729145654.14644-5-damien.hedde@greensocs.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 203.11.71.1
Subject: Re: [Qemu-devel] [PATCH v3 04/33] make Device and Bus Resettable
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
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, kraxel@redhat.com, edgar.iglesias@xilinx.com,
 hare@suse.com, qemu-block@nongnu.org, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, marcandre.lureau@redhat.com, thuth@redhat.com,
 ehabkost@redhat.com, alistair@alistair23.me, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, clg@kaod.org, jsnow@redhat.com, rth@twiddle.net,
 berrange@redhat.com, cohuck@redhat.com, mark.burton@greensocs.com,
 qemu-ppc@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--O3RTKUHj+75w1tg5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2019 at 04:56:25PM +0200, Damien Hedde wrote:
> This add Resettable interface implementation for both Bus and Device.
>=20
> *resetting* counter and *reset_is_cold* flag are added in DeviceState
> and BusState.
>=20
> Compatibility with existing code base is ensured.
> The legacy bus or device reset method is called in the new exit phase
> and the other 2 phases are let empty. Using the exit phase guarantee that
> legacy resets are called in the "post" order (ie: children then parent)
> in hierarchical reset. That is the same order as legacy qdev_reset_all
> or qbus_reset_all were using.
>=20
> New *device_reset* and *bus_reset* function are proposed with an
> additional boolean argument telling whether the reset is cold or warm.
> Helper functions *device_reset_[warm|cold]* and *bus_reset_[warm|cold]*
> are defined also as helpers.
>=20
> Also add a [device|bus]_is_resetting and [device|bus]_is_reset_cold
> functions telling respectively whether the object is currently under rese=
t and
> if the current reset is cold or not.
>=20
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>  hw/core/bus.c          | 85 ++++++++++++++++++++++++++++++++++++++++++
>  hw/core/qdev.c         | 82 ++++++++++++++++++++++++++++++++++++++++
>  include/hw/qdev-core.h | 84 ++++++++++++++++++++++++++++++++++++++---
>  tests/Makefile.include |  1 +
>  4 files changed, 247 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/core/bus.c b/hw/core/bus.c
> index 17bc1edcde..08a97addb6 100644
> --- a/hw/core/bus.c
> +++ b/hw/core/bus.c
> @@ -22,6 +22,7 @@
>  #include "qemu/module.h"
>  #include "hw/qdev.h"
>  #include "qapi/error.h"
> +#include "hw/resettable.h"
> =20
>  void qbus_set_hotplug_handler(BusState *bus, Object *handler, Error **er=
rp)
>  {
> @@ -68,6 +69,75 @@ int qbus_walk_children(BusState *bus,
>      return 0;
>  }
> =20
> +void bus_reset(BusState *bus, bool cold)
> +{
> +    resettable_reset(OBJECT(bus), cold);
> +}
> +
> +bool bus_is_resetting(BusState *bus)
> +{
> +    return (bus->resetting !=3D 0);
> +}
> +
> +bool bus_is_reset_cold(BusState *bus)
> +{
> +    return bus->reset_is_cold;
> +}
> +
> +static uint32_t bus_get_reset_count(Object *obj)
> +{
> +    BusState *bus =3D BUS(obj);
> +    return bus->resetting;
> +}
> +
> +static uint32_t bus_increment_reset_count(Object *obj)
> +{
> +    BusState *bus =3D BUS(obj);
> +    return ++bus->resetting;
> +}
> +
> +static uint32_t bus_decrement_reset_count(Object *obj)
> +{
> +    BusState *bus =3D BUS(obj);
> +    return --bus->resetting;
> +}
> +
> +static bool bus_set_reset_cold(Object *obj, bool cold)
> +{
> +    BusState *bus =3D BUS(obj);
> +    bool old =3D bus->reset_is_cold;
> +    bus->reset_is_cold =3D cold;
> +    return old;
> +}
> +
> +static bool bus_set_hold_needed(Object *obj, bool hold_needed)
> +{
> +    BusState *bus =3D BUS(obj);
> +    bool old =3D bus->reset_hold_needed;
> +    bus->reset_hold_needed =3D hold_needed;
> +    return old;
> +}
> +
> +static void bus_foreach_reset_child(Object *obj, void (*func)(Object *))
> +{
> +    BusState *bus =3D BUS(obj);
> +    BusChild *kid;
> +
> +    QTAILQ_FOREACH(kid, &bus->children, sibling) {
> +        func(OBJECT(kid->child));
> +    }
> +}

IIUC, every resettable class would need more or less identical
implementations of the above.  That seems like an awful lot of
boilerplate.

> +
> +static void bus_obj_legacy_reset(Object *obj)
> +{
> +    BusState *bus =3D BUS(obj);
> +    BusClass *bc =3D BUS_GET_CLASS(obj);
> +
> +    if (bc->reset) {
> +        bc->reset(bus);
> +    }
> +}
> +
>  static void qbus_realize(BusState *bus, DeviceState *parent, const char =
*name)
>  {
>      const char *typename =3D object_get_typename(OBJECT(bus));
> @@ -192,6 +262,8 @@ static void qbus_initfn(Object *obj)
>                               NULL);
>      object_property_add_bool(obj, "realized",
>                               bus_get_realized, bus_set_realized, NULL);
> +
> +    bus->resetting =3D 0;
>  }
> =20
>  static char *default_bus_get_fw_dev_path(DeviceState *dev)
> @@ -202,9 +274,18 @@ static char *default_bus_get_fw_dev_path(DeviceState=
 *dev)
>  static void bus_class_init(ObjectClass *class, void *data)
>  {
>      BusClass *bc =3D BUS_CLASS(class);
> +    ResettableClass *rc =3D RESETTABLE_CLASS(class);
> =20
>      class->unparent =3D bus_unparent;
>      bc->get_fw_dev_path =3D default_bus_get_fw_dev_path;
> +
> +    rc->phases.exit =3D bus_obj_legacy_reset;
> +    rc->get_count =3D bus_get_reset_count;
> +    rc->increment_count =3D bus_increment_reset_count;
> +    rc->decrement_count =3D bus_decrement_reset_count;
> +    rc->foreach_child =3D bus_foreach_reset_child;
> +    rc->set_cold =3D bus_set_reset_cold;
> +    rc->set_hold_needed =3D bus_set_hold_needed;
>  }
> =20
>  static void qbus_finalize(Object *obj)
> @@ -223,6 +304,10 @@ static const TypeInfo bus_info =3D {
>      .instance_init =3D qbus_initfn,
>      .instance_finalize =3D qbus_finalize,
>      .class_init =3D bus_class_init,
> +    .interfaces =3D (InterfaceInfo[]) {
> +        { TYPE_RESETTABLE },
> +        { }
> +    },
>  };
> =20
>  static void bus_register_types(void)
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index 043e058396..559ced070d 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -254,6 +254,64 @@ HotplugHandler *qdev_get_hotplug_handler(DeviceState=
 *dev)
>      return hotplug_ctrl;
>  }
> =20
> +void device_reset(DeviceState *dev, bool cold)
> +{
> +    resettable_reset(OBJECT(dev), cold);
> +}
> +
> +bool device_is_resetting(DeviceState *dev)
> +{
> +    return (dev->resetting !=3D 0);
> +}
> +
> +bool device_is_reset_cold(DeviceState *dev)
> +{
> +    return dev->reset_is_cold;
> +}
> +
> +static uint32_t device_get_reset_count(Object *obj)
> +{
> +    DeviceState *dev =3D DEVICE(obj);
> +    return dev->resetting;
> +}
> +
> +static uint32_t device_increment_reset_count(Object *obj)
> +{
> +    DeviceState *dev =3D DEVICE(obj);
> +    return ++dev->resetting;
> +}
> +
> +static uint32_t device_decrement_reset_count(Object *obj)
> +{
> +    DeviceState *dev =3D DEVICE(obj);
> +    return --dev->resetting;
> +}
> +
> +static bool device_set_reset_cold(Object *obj, bool cold)
> +{
> +    DeviceState *dev =3D DEVICE(obj);
> +    bool old =3D dev->reset_is_cold;
> +    dev->reset_is_cold =3D cold;
> +    return old;
> +}
> +
> +static bool device_set_hold_needed(Object *obj, bool hold_needed)
> +{
> +    DeviceState *dev =3D DEVICE(obj);
> +    bool old =3D dev->reset_hold_needed;
> +    dev->reset_hold_needed =3D hold_needed;
> +    return old;
> +}
> +
> +static void device_foreach_reset_child(Object *obj, void (*func)(Object =
*))
> +{
> +    DeviceState *dev =3D DEVICE(obj);
> +    BusState *bus;
> +    QLIST_FOREACH(bus, &dev->child_bus, sibling) {
> +        func(OBJECT(bus));
> +    }
> +}
> +
>  static int qdev_reset_one(DeviceState *dev, void *opaque)
>  {
>      device_legacy_reset(dev);
> @@ -954,6 +1012,7 @@ static void device_initfn(Object *obj)
> =20
>      dev->instance_id_alias =3D -1;
>      dev->realized =3D false;
> +    dev->resetting =3D 0;
> =20
>      object_property_add_bool(obj, "realized",
>                               device_get_realized, device_set_realized, N=
ULL);
> @@ -1046,9 +1105,20 @@ static void device_unparent(Object *obj)
>      }
>  }
> =20
> +static void device_obj_legacy_reset(Object *obj)
> +{
> +    DeviceState *dev =3D DEVICE(obj);
> +    DeviceClass *dc =3D DEVICE_GET_CLASS(dev);
> +
> +    if (dc->reset) {
> +        dc->reset(dev);
> +    }
> +}
> +
>  static void device_class_init(ObjectClass *class, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(class);
> +    ResettableClass *rc =3D RESETTABLE_CLASS(class);
> =20
>      class->unparent =3D device_unparent;
> =20
> @@ -1060,6 +1130,14 @@ static void device_class_init(ObjectClass *class, =
void *data)
>       */
>      dc->hotpluggable =3D true;
>      dc->user_creatable =3D true;
> +
> +    rc->phases.exit =3D device_obj_legacy_reset;
> +    rc->get_count =3D device_get_reset_count;
> +    rc->increment_count =3D device_increment_reset_count;
> +    rc->decrement_count =3D device_decrement_reset_count;
> +    rc->foreach_child =3D device_foreach_reset_child;
> +    rc->set_cold =3D device_set_reset_cold;
> +    rc->set_hold_needed =3D device_set_hold_needed;
>  }
> =20
>  void device_class_set_parent_reset(DeviceClass *dc,
> @@ -1117,6 +1195,10 @@ static const TypeInfo device_type_info =3D {
>      .class_init =3D device_class_init,
>      .abstract =3D true,
>      .class_size =3D sizeof(DeviceClass),
> +    .interfaces =3D (InterfaceInfo[]) {
> +        { TYPE_RESETTABLE },
> +        { }
> +    },
>  };
> =20
>  static void qdev_register_types(void)
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 690ce72433..eeb75611c8 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -7,6 +7,7 @@
>  #include "hw/irq.h"
>  #include "hw/hotplug.h"
>  #include "sysemu/sysemu.h"
> +#include "hw/resettable.h"
> =20
>  enum {
>      DEV_NVECTORS_UNSPECIFIED =3D -1,
> @@ -132,6 +133,10 @@ struct NamedGPIOList {
>  /**
>   * DeviceState:
>   * @realized: Indicates whether the device has been fully constructed.
> + * @resetting: Indicates whether the device is under reset. Also
> + * used to count how many times reset has been initiated on the device.
> + * @reset_is_cold: If the device is under reset, indicates whether it is=
 cold
> + * or warm.
>   *
>   * This structure should not be accessed directly.  We declare it here
>   * so that it can be embedded in individual device state structures.
> @@ -153,6 +158,9 @@ struct DeviceState {
>      int num_child_bus;
>      int instance_id_alias;
>      int alias_required_for_version;
> +    uint32_t resetting;
> +    bool reset_is_cold;
> +    bool reset_hold_needed;
>  };
> =20
>  struct DeviceListener {
> @@ -199,6 +207,10 @@ typedef struct BusChild {
>  /**
>   * BusState:
>   * @hotplug_handler: link to a hotplug handler associated with bus.
> + * @resetting: Indicates whether the bus is under reset. Also
> + * used to count how many times reset has been initiated on the bus.
> + * @reset_is_cold: If the bus is under reset, indicates whether it is co=
ld
> + * or warm.
>   */
>  struct BusState {
>      Object obj;
> @@ -210,6 +222,9 @@ struct BusState {
>      int num_children;
>      QTAILQ_HEAD(, BusChild) children;
>      QLIST_ENTRY(BusState) sibling;
> +    uint32_t resetting;
> +    bool reset_is_cold;
> +    bool reset_hold_needed;
>  };
> =20
>  /**
> @@ -376,6 +391,70 @@ int qdev_walk_children(DeviceState *dev,
>                         qdev_walkerfn *post_devfn, qbus_walkerfn *post_bu=
sfn,
>                         void *opaque);
> =20
> +/**
> + * device_reset:
> + * Resets the device @dev, @cold tell whether to do a cold or warm reset.
> + * Uses the ressetable interface.
> + * Base behavior is to reset the device and its qdev/qbus subtree.
> + */
> +void device_reset(DeviceState *dev, bool cold);
> +
> +static inline void device_reset_warm(DeviceState *dev)
> +{
> +    device_reset(dev, false);
> +}
> +
> +static inline void device_reset_cold(DeviceState *dev)
> +{
> +    device_reset(dev, true);
> +}
> +
> +/**
> + * bus_reset:
> + * Resets the bus @bus, @cold tell whether to do a cold or warm reset.
> + * Uses the ressetable interface.
> + * Base behavior is to reset the bus and its qdev/qbus subtree.
> + */
> +void bus_reset(BusState *bus, bool cold);
> +
> +static inline void bus_reset_warm(BusState *bus)
> +{
> +    bus_reset(bus, false);
> +}
> +
> +static inline void bus_reset_cold(BusState *bus)
> +{
> +    bus_reset(bus, true);
> +}
> +
> +/**
> + * device_is_resetting:
> + * Tell whether the device @dev is currently under reset.
> + */
> +bool device_is_resetting(DeviceState *dev);
> +
> +/**
> + * device_is_reset_cold:
> + * Tell whether the device @dev is currently under reset cold or warm re=
set.
> + *
> + * Note: only valid when device_is_resetting returns true.
> + */
> +bool device_is_reset_cold(DeviceState *dev);
> +
> +/**
> + * bus_is_resetting:
> + * Tell whether the bus @bus is currently under reset.
> + */
> +bool bus_is_resetting(BusState *bus);
> +
> +/**
> + * bus_is_reset_cold:
> + * Tell whether the bus @bus is currently under reset cold or warm reset.
> + *
> + * Note: only valid when bus_is_resetting returns true.
> + */
> +bool bus_is_reset_cold(BusState *bus);
> +
>  void qdev_reset_all(DeviceState *dev);
>  void qdev_reset_all_fn(void *opaque);
> =20
> @@ -413,11 +492,6 @@ void qdev_machine_init(void);
>   */
>  void device_legacy_reset(DeviceState *dev);
> =20
> -static inline void device_reset(DeviceState *dev)
> -{
> -    device_legacy_reset(dev);
> -}
> -
>  void device_class_set_parent_reset(DeviceClass *dc,
>                                     DeviceReset dev_reset,
>                                     DeviceReset *parent_reset);
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index fd7fdb8658..1c0a5345b9 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -561,6 +561,7 @@ tests/fp/%:
> =20
>  tests/test-qdev-global-props$(EXESUF): tests/test-qdev-global-props.o \
>  	hw/core/qdev.o hw/core/qdev-properties.o hw/core/hotplug.o\
> +	hw/core/resettable.o \
>  	hw/core/bus.o \
>  	hw/core/irq.o \
>  	hw/core/fw-path-provider.o \

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--O3RTKUHj+75w1tg5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl1BLZgACgkQbDjKyiDZ
s5LRJBAAwVkJyW6r+BB4rDnY0nNiF/nIOloT6M90dQ5vLFqC5JAupWUbnfP0uAJI
ol7smVFYlUD/mpKWEtFJlmsfGYQV9VMv5o2Sn3SoqEdhdSiKms7s42Le3fqejn+I
Q/HiAoUTF6UJ2Xvx3/2d8JNAJplMHHG1eDo0TpniTXIYa0nGtfe15JXqXtEHBqro
BVzl9NVXcARWTvIvBBcSItn08GtoAdN9sI2PlP4sTfKKO0ANHIb5WA+4ciP0nNZe
UcAFRxhiA4tn0xZatnF32eS4JNlcGburvpiUuGCSSCTAkWVDfoqrC5H1FolNsApL
dS/ME/AjS5INBCFUCeiGz7j4Peu0c1d7PUhYCn5iC90nhRrikbiWh6Le5c2CGy9y
B6d2LgrmTCQJdCJ8GjK9zPr2wJA0GwGh9wumw/jkzAUzX+y88OOf1LxDuqQGJyC7
fdV2VJe6iqTDeJMkvpQvJVDbhWaewRjLSs3tqdn79P6dB6WZR5Ds64qfAkNZIKQG
AgEbAPBupnCQoIGQ5CjRcNd2NKBmhobPb1h7U87jP+kMzXIIilCNeM7LJe/xgp8V
+La/pa6RFcZXUB8dtGHXit/Y6+mXbUBSnwO7b0SX9N17C4Y68KE+BdZT3SoIqrfY
dmp3M005R19jIBv8L4Jq5FQluxisLD2B6vM4tP5VvS/WvL/+Foo=
=9No3
-----END PGP SIGNATURE-----

--O3RTKUHj+75w1tg5--

