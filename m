Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CC22E7E92
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 08:24:49 +0100 (CET)
Received: from localhost ([::1]:43884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kusKG-0008U1-3c
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 02:24:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kusJ3-0007a0-2O; Thu, 31 Dec 2020 02:23:33 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:39995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kusJ0-0005x0-5B; Thu, 31 Dec 2020 02:23:32 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D604N3CKBz9sRN; Thu, 31 Dec 2020 18:23:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609399396;
 bh=KOlwfTbYkujAFVPSc0vSKvhpU0uvA8sZehtB9k66/zs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f7q2zgZZkk80EDkBQhq08hW+lX97wQ2BhL56xSSg2c9v+M+o6N4Srn+cll4xxl4ML
 PMxBhiA3hK+T7zkP7MgIsIhVAu1rrq/ge1Av5aXMxu0uK/qCQwc8T2aOhdSITOizy/
 5QUOqj/g485nNhB2cVYegPYJ69s/niVZuGqrcKxg=
Date: Thu, 31 Dec 2020 17:48:22 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: Re: [PATCH v2 5/7] macio: move OpenPIC inside macio-newworld device
Message-ID: <20201231064822.GB25471@yekko.fritz.box>
References: <20201229175619.6051-1-mark.cave-ayland@ilande.co.uk>
 <20201229175619.6051-6-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2B/JsCI69OhZNC5r"
Content-Disposition: inline
In-Reply-To: <20201229175619.6051-6-mark.cave-ayland@ilande.co.uk>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--2B/JsCI69OhZNC5r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 29, 2020 at 05:56:17PM +0000, Mark Cave-Ayland wrote:
> The OpenPIC device is located within the macio device on real hardware so=
 make it
> a child of the macio-newworld device. This also removes the need for sett=
ing and
> checking a separate PIC object property link on the macio-newworld device=
 which
> currently causes the automated QOM introspection tests to fail.
>=20
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/misc/macio/macio.c         | 19 +++++++++----------
>  hw/ppc/mac_newworld.c         | 25 +++++++++++--------------
>  include/hw/misc/macio/macio.h |  2 +-
>  3 files changed, 21 insertions(+), 25 deletions(-)
>=20
> diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
> index cfb87da6c9..36be77cede 100644
> --- a/hw/misc/macio/macio.c
> +++ b/hw/misc/macio/macio.c
> @@ -273,7 +273,7 @@ static void macio_newworld_realize(PCIDevice *d, Erro=
r **errp)
>  {
>      MacIOState *s =3D MACIO(d);
>      NewWorldMacIOState *ns =3D NEWWORLD_MACIO(d);
> -    DeviceState *pic_dev =3D DEVICE(ns->pic);
> +    DeviceState *pic_dev =3D DEVICE(&ns->pic);
>      Error *err =3D NULL;
>      SysBusDevice *sysbus_dev;
>      MemoryRegion *timer_memory =3D NULL;
> @@ -284,17 +284,19 @@ static void macio_newworld_realize(PCIDevice *d, Er=
ror **errp)
>          return;
>      }
> =20
> +    /* OpenPIC */
> +    qdev_prop_set_uint32(pic_dev, "model", OPENPIC_MODEL_KEYLARGO);
> +    sysbus_dev =3D SYS_BUS_DEVICE(&ns->pic);
> +    sysbus_realize_and_unref(sysbus_dev, &error_fatal);
> +    memory_region_add_subregion(&s->bar, 0x40000,
> +                                sysbus_mmio_get_region(sysbus_dev, 0));
> +
>      sysbus_dev =3D SYS_BUS_DEVICE(&s->escc);
>      sysbus_connect_irq(sysbus_dev, 0, qdev_get_gpio_in(pic_dev,
>                                                         NEWWORLD_ESCCB_IR=
Q));
>      sysbus_connect_irq(sysbus_dev, 1, qdev_get_gpio_in(pic_dev,
>                                                         NEWWORLD_ESCCA_IR=
Q));
> =20
> -    /* OpenPIC */
> -    sysbus_dev =3D SYS_BUS_DEVICE(ns->pic);
> -    memory_region_add_subregion(&s->bar, 0x40000,
> -                                sysbus_mmio_get_region(sysbus_dev, 0));
> -
>      /* IDE buses */
>      macio_realize_ide(s, &ns->ide[0],
>                        qdev_get_gpio_in(pic_dev, NEWWORLD_IDE0_IRQ),
> @@ -369,10 +371,7 @@ static void macio_newworld_init(Object *obj)
>      NewWorldMacIOState *ns =3D NEWWORLD_MACIO(obj);
>      int i;
> =20
> -    object_property_add_link(obj, "pic", TYPE_OPENPIC,
> -                             (Object **) &ns->pic,
> -                             qdev_prop_allow_set_link_before_realize,
> -                             0);
> +    object_initialize_child(OBJECT(s), "pic", &ns->pic, TYPE_OPENPIC);
> =20
>      object_initialize_child(OBJECT(s), "gpio", &ns->gpio, TYPE_MACIO_GPI=
O);
> =20
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index 708bb2f1ab..e991db4add 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -293,18 +293,6 @@ static void ppc_core99_init(MachineState *machine)
>          }
>      }
> =20
> -    pic_dev =3D qdev_new(TYPE_OPENPIC);
> -    qdev_prop_set_uint32(pic_dev, "model", OPENPIC_MODEL_KEYLARGO);
> -    s =3D SYS_BUS_DEVICE(pic_dev);
> -    sysbus_realize_and_unref(s, &error_fatal);
> -    k =3D 0;
> -    for (i =3D 0; i < smp_cpus; i++) {
> -        for (j =3D 0; j < OPENPIC_OUTPUT_NB; j++) {
> -            sysbus_connect_irq(s, k++, openpic_irqs[i].irq[j]);
> -        }
> -    }
> -    g_free(openpic_irqs);
> -
>      if (PPC_INPUT(env) =3D=3D PPC_FLAGS_INPUT_970) {
>          /* 970 gets a U3 bus */
>          /* Uninorth AGP bus */
> @@ -378,8 +366,6 @@ static void ppc_core99_init(MachineState *machine)
>      qdev_prop_set_uint64(dev, "frequency", tbfreq);
>      qdev_prop_set_bit(dev, "has-pmu", has_pmu);
>      qdev_prop_set_bit(dev, "has-adb", has_adb);
> -    object_property_set_link(OBJECT(macio), "pic", OBJECT(pic_dev),
> -                             &error_abort);
> =20
>      escc =3D ESCC(object_resolve_path_component(OBJECT(macio), "escc"));
>      qdev_prop_set_chr(DEVICE(escc), "chrA", serial_hd(0));
> @@ -387,6 +373,7 @@ static void ppc_core99_init(MachineState *machine)
> =20
>      pci_realize_and_unref(macio, pci_bus, &error_fatal);
> =20
> +    pic_dev =3D DEVICE(object_resolve_path_component(OBJECT(macio), "pic=
"));
>      for (i =3D 0; i < 4; i++) {
>          qdev_connect_gpio_out(DEVICE(uninorth_pci), i,
>                                qdev_get_gpio_in(pic_dev, 0x1b + i));
> @@ -407,6 +394,16 @@ static void ppc_core99_init(MachineState *machine)
>          }
>      }
> =20
> +    /* OpenPIC */
> +    s =3D SYS_BUS_DEVICE(pic_dev);
> +    k =3D 0;
> +    for (i =3D 0; i < smp_cpus; i++) {
> +        for (j =3D 0; j < OPENPIC_OUTPUT_NB; j++) {
> +            sysbus_connect_irq(s, k++, openpic_irqs[i].irq[j]);
> +        }
> +    }
> +    g_free(openpic_irqs);
> +
>      /* We only emulate 2 out of 3 IDE controllers for now */
>      ide_drive_get(hd, ARRAY_SIZE(hd));
> =20
> diff --git a/include/hw/misc/macio/macio.h b/include/hw/misc/macio/macio.h
> index 707dfab50c..6c05f3bfd2 100644
> --- a/include/hw/misc/macio/macio.h
> +++ b/include/hw/misc/macio/macio.h
> @@ -115,7 +115,7 @@ struct NewWorldMacIOState {
> =20
>      bool has_pmu;
>      bool has_adb;
> -    OpenPICState *pic;
> +    OpenPICState pic;
>      MACIOIDEState ide[2];
>      MacIOGPIOState gpio;
>  };

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--2B/JsCI69OhZNC5r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl/tdDYACgkQbDjKyiDZ
s5LauA//TVLXwNAt2hUHSkNp0ovL1VNQx18KNllIXLdOQa0UNZldyQuqzQ+Vi8Rx
6i9/uzKS3ON4HMt6uCPo41A3CvWRoDxYL7NL2T1cx/4+V4QT69DLCckVU0onA/kJ
HcFxwa9GiBYqfhqDfydCcPQxvv9MUtSxPxkfavBYFs8g9KKIKANv2o0lRNKyXwzS
WOzoIbUZPz2wx3Z5qKO467KykukXOaDLFWOTIczhNiUW7AM1MkYDHhV3DTEmjPXI
bfOIQDw8nH0hXA3a+7X6be0mPMXAVroKvVVnN3llELAOjagpMrcUE9J4MdZIsNes
OpQw3Cb6pvfh2iFsnty8fY5pHrkK2FtSBSHWo/6gymQIKsNEki5YXGVzIdSL3kQA
/MElDdVuE05IyOIKcijHd2yCmRoEnUk4rl/TGxku2dmZYb5e6jJ+U2wVq/SY3yaZ
TPTqYWZ6e/voGwBlWR2lGE139Zv8Q6zZzglcaz4JyXYeBu7EBJPVENcmTHOpYtFD
8A7Yzi9Dx+l80DgPShkGySd9W5YsP5VafPYF25jvWh0e47L6rbZ+kTGc4Y/HC5fv
EH/oAXmr4P1PO4j2Zhp7Iso9Cqv+6ZO1kEA1gVEbs+D+Tx+DpmAaVCOWqC6KbGer
WjbVWK0+gTZp/TJMcSsS2WOpw0TvnmNUvRIp8cFEzy4RNKAEXgI=
=h/qM
-----END PGP SIGNATURE-----

--2B/JsCI69OhZNC5r--

