Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3467F3B132A
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 07:21:38 +0200 (CEST)
Received: from localhost ([::1]:50152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvvKS-0008DM-Lz
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 01:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lvvH2-0006IG-VP; Wed, 23 Jun 2021 01:18:04 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:39341 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lvvGy-0006YC-I5; Wed, 23 Jun 2021 01:18:04 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4G8s3F3Flqz9sVp; Wed, 23 Jun 2021 15:17:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1624425465;
 bh=05nYhqQICs5dcHfoYhAYQ9HiHPjwCxVs+kMb1dvwXVI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F22GiSYLevvcGxK4d6pZaozr7qszdZWvpw9Vd1x59MSQiPJUjiCLo/K1nJauutHGi
 6OJM8KS1gUI3DSPMzwpx62p8gnOdwDyzXZxN65KHH+LbURNGa9kESm04KjG1XzlOnq
 F71ulL19gCsoaudsY6TSj69ukwVF4/hNJug/8CsY=
Date: Wed, 23 Jun 2021 11:51:21 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 2/5] usb: drop usb_host_dev_is_scsi_storage hook
Message-ID: <YNKTmRIMtMZHZRF4@yekko>
References: <20210622124915.261060-1-kraxel@redhat.com>
 <20210622124915.261060-3-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QBwvCDncMsGl2Fwk"
Content-Disposition: inline
In-Reply-To: <20210622124915.261060-3-kraxel@redhat.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--QBwvCDncMsGl2Fwk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 22, 2021 at 02:49:12PM +0200, Gerd Hoffmann wrote:
> Introduce an usb device flag instead, set it when usb-host looks at the
> device descriptors anyway.  Also set it for emulated storage devices,
> for consistency.  Add an inline helper function to check the flag.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

ppc parts
Acked-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  include/hw/usb.h             |  7 ++++++-
>  hw/ppc/spapr.c               |  2 +-
>  hw/usb/dev-storage-bot.c     |  1 +
>  hw/usb/dev-storage-classic.c |  1 +
>  hw/usb/dev-uas.c             |  1 +
>  hw/usb/host-libusb.c         | 36 +++++++-----------------------------
>  hw/usb/host-stub.c           |  5 -----
>  7 files changed, 17 insertions(+), 36 deletions(-)
>=20
> diff --git a/include/hw/usb.h b/include/hw/usb.h
> index 436e07b30404..33668dd0a99a 100644
> --- a/include/hw/usb.h
> +++ b/include/hw/usb.h
> @@ -219,6 +219,7 @@ enum USBDeviceFlags {
>      USB_DEV_FLAG_IS_HOST,
>      USB_DEV_FLAG_MSOS_DESC_ENABLE,
>      USB_DEV_FLAG_MSOS_DESC_IN_USE,
> +    USB_DEV_FLAG_IS_SCSI_STORAGE,
>  };
> =20
>  /* definition of a USB device */
> @@ -465,7 +466,6 @@ void usb_generic_async_ctrl_complete(USBDevice *s, US=
BPacket *p);
> =20
>  /* usb-linux.c */
>  void hmp_info_usbhost(Monitor *mon, const QDict *qdict);
> -bool usb_host_dev_is_scsi_storage(USBDevice *usbdev);
> =20
>  /* usb ports of the VM */
> =20
> @@ -561,6 +561,11 @@ const char *usb_device_get_product_desc(USBDevice *d=
ev);
> =20
>  const USBDesc *usb_device_get_usb_desc(USBDevice *dev);
> =20
> +static inline bool usb_device_is_scsi_storage(USBDevice *dev)
> +{
> +    return dev->flags & (1 << USB_DEV_FLAG_IS_SCSI_STORAGE);
> +}
> +
>  /* quirks.c */
> =20
>  /* In bulk endpoints are streaming data sources (iow behave like isoc ep=
s) */
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 4dd90b75cc52..f83a081af0f1 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3106,7 +3106,7 @@ static char *spapr_get_fw_dev_path(FWPathProvider *=
p, BusState *bus,
>       */
>      if (strcmp("usb-host", qdev_fw_name(dev)) =3D=3D 0) {
>          USBDevice *usbdev =3D CAST(USBDevice, dev, TYPE_USB_DEVICE);
> -        if (usb_host_dev_is_scsi_storage(usbdev)) {
> +        if (usb_device_is_scsi_storage(usbdev)) {
>              return g_strdup_printf("storage@%s/disk", usbdev->port->path=
);
>          }
>      }
> diff --git a/hw/usb/dev-storage-bot.c b/hw/usb/dev-storage-bot.c
> index 6aad026d1133..68ebaca10c66 100644
> --- a/hw/usb/dev-storage-bot.c
> +++ b/hw/usb/dev-storage-bot.c
> @@ -32,6 +32,7 @@ static void usb_msd_bot_realize(USBDevice *dev, Error *=
*errp)
> =20
>      usb_desc_create_serial(dev);
>      usb_desc_init(dev);
> +    dev->flags |=3D (1 << USB_DEV_FLAG_IS_SCSI_STORAGE);
>      if (d->hotplugged) {
>          s->dev.auto_attach =3D 0;
>      }
> diff --git a/hw/usb/dev-storage-classic.c b/hw/usb/dev-storage-classic.c
> index 00cb34b22f02..3d017a4e6791 100644
> --- a/hw/usb/dev-storage-classic.c
> +++ b/hw/usb/dev-storage-classic.c
> @@ -64,6 +64,7 @@ static void usb_msd_storage_realize(USBDevice *dev, Err=
or **errp)
> =20
>      usb_desc_create_serial(dev);
>      usb_desc_init(dev);
> +    dev->flags |=3D (1 << USB_DEV_FLAG_IS_SCSI_STORAGE);
>      scsi_bus_new(&s->bus, sizeof(s->bus), DEVICE(dev),
>                   &usb_msd_scsi_info_storage, NULL);
>      scsi_dev =3D scsi_bus_legacy_add_drive(&s->bus, blk, 0, !!s->removab=
le,
> diff --git a/hw/usb/dev-uas.c b/hw/usb/dev-uas.c
> index d2bd85d3f6bb..263056231c79 100644
> --- a/hw/usb/dev-uas.c
> +++ b/hw/usb/dev-uas.c
> @@ -926,6 +926,7 @@ static void usb_uas_realize(USBDevice *dev, Error **e=
rrp)
>      QTAILQ_INIT(&uas->requests);
>      uas->status_bh =3D qemu_bh_new(usb_uas_send_status_bh, uas);
> =20
> +    dev->flags |=3D (1 << USB_DEV_FLAG_IS_SCSI_STORAGE);
>      scsi_bus_new(&uas->bus, sizeof(uas->bus), DEVICE(dev),
>                   &usb_uas_scsi_info, NULL);
>  }
> diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
> index 2518306f527f..e6d21aa8e1d3 100644
> --- a/hw/usb/host-libusb.c
> +++ b/hw/usb/host-libusb.c
> @@ -770,6 +770,13 @@ static void usb_host_speed_compat(USBHostDevice *s)
>          for (i =3D 0; i < conf->bNumInterfaces; i++) {
>              for (a =3D 0; a < conf->interface[i].num_altsetting; a++) {
>                  intf =3D &conf->interface[i].altsetting[a];
> +
> +                if (intf->bInterfaceClass =3D=3D LIBUSB_CLASS_MASS_STORA=
GE &&
> +                    intf->bInterfaceSubClass =3D=3D 6) { /* SCSI */
> +                    udev->flags |=3D (1 << USB_DEV_FLAG_IS_SCSI_STORAGE);
> +                    break;
> +                }
> +
>                  for (e =3D 0; e < intf->bNumEndpoints; e++) {
>                      endp =3D &intf->endpoint[e];
>                      type =3D endp->bmAttributes & 0x3;
> @@ -1893,35 +1900,6 @@ static void usb_host_auto_check(void *unused)
>      timer_mod(usb_auto_timer, qemu_clock_get_ms(QEMU_CLOCK_REALTIME) + 2=
000);
>  }
> =20
> -/**
> - * Check whether USB host device has a USB mass storage SCSI interface
> - */
> -bool usb_host_dev_is_scsi_storage(USBDevice *ud)
> -{
> -    USBHostDevice *uhd =3D USB_HOST_DEVICE(ud);
> -    struct libusb_config_descriptor *conf;
> -    const struct libusb_interface_descriptor *intf;
> -    bool is_scsi_storage =3D false;
> -    int i;
> -
> -    if (!uhd || libusb_get_active_config_descriptor(uhd->dev, &conf) !=
=3D 0) {
> -        return false;
> -    }
> -
> -    for (i =3D 0; i < conf->bNumInterfaces; i++) {
> -        intf =3D &conf->interface[i].altsetting[ud->altsetting[i]];
> -        if (intf->bInterfaceClass =3D=3D LIBUSB_CLASS_MASS_STORAGE &&
> -            intf->bInterfaceSubClass =3D=3D 6) {                 /* 6 me=
ans SCSI */
> -            is_scsi_storage =3D true;
> -            break;
> -        }
> -    }
> -
> -    libusb_free_config_descriptor(conf);
> -
> -    return is_scsi_storage;
> -}
> -
>  void hmp_info_usbhost(Monitor *mon, const QDict *qdict)
>  {
>      libusb_device **devs =3D NULL;
> diff --git a/hw/usb/host-stub.c b/hw/usb/host-stub.c
> index 80809ceba542..bbe69baa390f 100644
> --- a/hw/usb/host-stub.c
> +++ b/hw/usb/host-stub.c
> @@ -38,8 +38,3 @@ void hmp_info_usbhost(Monitor *mon, const QDict *qdict)
>  {
>      monitor_printf(mon, "USB host devices not supported\n");
>  }
> -
> -bool usb_host_dev_is_scsi_storage(USBDevice *ud)
> -{
> -    return false;
> -}

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--QBwvCDncMsGl2Fwk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDSk5cACgkQbDjKyiDZ
s5JGWQ/8DNa4FZ62w5LPole1eOZiUAFVdRSfBmBCYpOZUHbrVxFcGdVS8UFBNdep
epEht9hCOnYA98cyBj3D/cAQ3H5pBFNBI1AdK2PZ4OGGQdkOPax8TlbLkgVewhFQ
LnF0OWvp5Ova7PMEr3mzcFpJCaIeNRSnizhOtNSAaduBs+jyA+yVJ/lF1XWMB1SC
zqMXyGscA9uAVNbs8ukwRedG1UEDGnKznpl8ilxCnDSKmQ0HV48emHfdoJH/Ut61
t+MLDMKAlH8BMXgH8fi3WDZgqDVxV2Zc+cgH8Z56VvcpjvzZbXpc3AzHh1C85uZ/
Rb+zDVd5w0kLLysEtjO9JiVXXTHmoijjDOdgQZHigZvmiJWlVArB4OBEZuU79z6S
/+aGxbdZjVxxdLRSAkIb1b4G3I33ZegcqNDzVP5y2KJW1WGa9EWsdg8N+h7jwwLe
s41i/ZdkcWWOk6p6oye9nn96xLgAWYqQX07IAIp2uvhFBa8u99/YJfuIOwdGGZ9I
A80aphUsdNrTRkhHf0HFQEq6BKvdzY4Le6AKPSKg+VKVTK7X8mTHXefmzNAVGj7F
4FR18FRude6Zl67Id3mU6F0LUe6ztTjZq+hIdPc52fkJrM7Glj+SBRG7VmOOQ5wn
2NCapRd1xDteWtbQvdhQ+b0bxc490r+q5oxc2idf6+u3R/uLpjk=
=XtNv
-----END PGP SIGNATURE-----

--QBwvCDncMsGl2Fwk--

