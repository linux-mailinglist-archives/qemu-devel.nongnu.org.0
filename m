Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47942338326
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 02:25:53 +0100 (CET)
Received: from localhost ([::1]:44284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKWYq-0002Ps-BN
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 20:25:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lKWXH-0001wg-AB; Thu, 11 Mar 2021 20:24:15 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:52443 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lKWXE-0000uj-KQ; Thu, 11 Mar 2021 20:24:15 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DxSlD3WLCz9sW4; Fri, 12 Mar 2021 12:24:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1615512248;
 bh=hlFk5kiyLpMF793LoHbPsPwJ4htztunCmXarUYrHbcE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=myxO1XMLGd5t3/mR4BUk5m8nEboKurSuN0lfUx6kEBuqMhkWJ5SQHNlwBKc8q22eu
 THkW9e2qnI1ATPnJUD7mz5q9lqdVv3gQdKXGnC9BRawJzMrEmfs8dGo9LmhovYEEIG
 jRlEZRZgb+ErcZpl5DegwHn/BaGdzuCD/LWaBZok=
Date: Fri, 12 Mar 2021 12:20:33 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v7 1/8] vt82c686: Implement control of serial port io
 ranges via config regs
Message-ID: <YErB4WOuqwaAZd5E@yekko.fritz.box>
References: <cover.1615345138.git.balaton@eik.bme.hu>
 <8cf90aad5a9fce1a20cbf49e4ef71c51ba04faed.1615345138.git.balaton@eik.bme.hu>
 <3c1c3d6b-44e4-66e1-366e-e40245589f7e@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eDrVpvzkDffO7C4+"
Content-Disposition: inline
In-Reply-To: <3c1c3d6b-44e4-66e1-366e-e40245589f7e@amsat.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--eDrVpvzkDffO7C4+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 12, 2021 at 12:47:54AM +0100, Philippe Mathieu-Daud=E9 wrote:
> ping for review?

I'm not sure who you're asking for a review from.

>=20
> On 3/10/21 3:58 AM, BALATON Zoltan wrote:
> > In VIA super south bridge the io ranges of superio components
> > (parallel and serial ports and FDC) can be controlled by superio
> > config registers to set their base address and enable/disable them.
> > This is not easy to implement in QEMU because ISA emulation is only
> > designed to set io base address once on creating the device and io
> > ranges are registered at creation and cannot easily be disabled or
> > moved later.
> >=20
> > In this patch we hack around that but only for serial ports because
> > those have a single io range at port base that's relatively easy to
> > handle and it's what guests actually use and set address different
> > than the default.
> >=20
> > We do not attempt to handle controlling the parallel and FDC regions
> > because those have multiple io ranges so handling them would be messy
> > and guests either don't change their deafult or don't care. We could
> > even get away with disabling and not emulating them, but since they
> > are already there, this patch leaves them mapped at their default
> > address just in case this could be useful for a guest in the future.
> >=20
> > Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> > ---
> >  hw/isa/vt82c686.c | 84 +++++++++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 82 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> > index 05d084f698..a3353ec5db 100644
> > --- a/hw/isa/vt82c686.c
> > +++ b/hw/isa/vt82c686.c
> > @@ -252,8 +252,24 @@ static const TypeInfo vt8231_pm_info =3D {
> >  typedef struct SuperIOConfig {
> >      uint8_t regs[0x100];
> >      MemoryRegion io;
> > +    ISASuperIODevice *superio;
> > +    MemoryRegion *serial_io[SUPERIO_MAX_SERIAL_PORTS];
> >  } SuperIOConfig;
> > =20
> > +static MemoryRegion *find_subregion(ISADevice *d, MemoryRegion *parent,
> > +                                    int offs)
> > +{
> > +    MemoryRegion *subregion, *mr =3D NULL;
> > +
> > +    QTAILQ_FOREACH(subregion, &parent->subregions, subregions_link) {
> > +        if (subregion->addr =3D=3D offs) {
> > +            mr =3D subregion;
> > +            break;
> > +        }
> > +    }
> > +    return mr;
> > +}
> > +
> >  static void superio_cfg_write(void *opaque, hwaddr addr, uint64_t data,
> >                                unsigned size)
> >  {
> > @@ -279,7 +295,53 @@ static void superio_cfg_write(void *opaque, hwaddr=
 addr, uint64_t data,
> >      case 0xfd ... 0xff:
> >          /* ignore write to read only registers */
> >          return;
> > -    /* case 0xe6 ... 0xe8: Should set base port of parallel and serial=
 */
> > +    case 0xe2:
> > +    {
> > +        data &=3D 0x1f;
> > +        if (data & BIT(2)) { /* Serial port 1 enable */
> > +            ISADevice *dev =3D sc->superio->serial[0];
> > +            if (!memory_region_is_mapped(sc->serial_io[0])) {
> > +                memory_region_add_subregion(isa_address_space_io(dev),
> > +                                            dev->ioport_id, sc->serial=
_io[0]);
> > +            }
> > +        } else {
> > +            MemoryRegion *io =3D isa_address_space_io(sc->superio->ser=
ial[0]);
> > +            if (memory_region_is_mapped(sc->serial_io[0])) {
> > +                memory_region_del_subregion(io, sc->serial_io[0]);
> > +            }
> > +        }
> > +        if (data & BIT(3)) { /* Serial port 2 enable */
> > +            ISADevice *dev =3D sc->superio->serial[1];
> > +            if (!memory_region_is_mapped(sc->serial_io[1])) {
> > +                memory_region_add_subregion(isa_address_space_io(dev),
> > +                                            dev->ioport_id, sc->serial=
_io[1]);
> > +            }
> > +        } else {
> > +            MemoryRegion *io =3D isa_address_space_io(sc->superio->ser=
ial[1]);
> > +            if (memory_region_is_mapped(sc->serial_io[1])) {
> > +                memory_region_del_subregion(io, sc->serial_io[1]);
> > +            }
> > +        }
> > +        break;
> > +    }
> > +    case 0xe7: /* Serial port 1 io base address */
> > +    {
> > +        data &=3D 0xfe;
> > +        sc->superio->serial[0]->ioport_id =3D data << 2;
> > +        if (memory_region_is_mapped(sc->serial_io[0])) {
> > +            memory_region_set_address(sc->serial_io[0], data << 2);
> > +        }
> > +        break;
> > +    }
> > +    case 0xe8: /* Serial port 2 io base address */
> > +    {
> > +        data &=3D 0xfe;
> > +        sc->superio->serial[1]->ioport_id =3D data << 2;
> > +        if (memory_region_is_mapped(sc->serial_io[1])) {
> > +            memory_region_set_address(sc->serial_io[1], data << 2);
> > +        }
> > +        break;
> > +    }
> >      default:
> >          qemu_log_mask(LOG_UNIMP,
> >                        "via_superio_cfg: unimplemented register 0x%x\n"=
, idx);
> > @@ -385,6 +447,7 @@ static void vt82c686b_realize(PCIDevice *d, Error *=
*errp)
> >      DeviceState *dev =3D DEVICE(d);
> >      ISABus *isa_bus;
> >      qemu_irq *isa_irq;
> > +    ISASuperIOClass *ic;
> >      int i;
> > =20
> >      qdev_init_gpio_out(dev, &s->cpu_intr, 1);
> > @@ -394,7 +457,9 @@ static void vt82c686b_realize(PCIDevice *d, Error *=
*errp)
> >      isa_bus_irqs(isa_bus, i8259_init(isa_bus, *isa_irq));
> >      i8254_pit_init(isa_bus, 0x40, 0, NULL);
> >      i8257_dma_init(isa_bus, 0);
> > -    isa_create_simple(isa_bus, TYPE_VT82C686B_SUPERIO);
> > +    s->superio_cfg.superio =3D ISA_SUPERIO(isa_create_simple(isa_bus,
> > +                                                      TYPE_VT82C686B_S=
UPERIO));
> > +    ic =3D ISA_SUPERIO_GET_CLASS(s->superio_cfg.superio);
> >      mc146818_rtc_init(isa_bus, 2000, NULL);
> > =20
> >      for (i =3D 0; i < PCI_CONFIG_HEADER_SIZE; i++) {
> > @@ -412,6 +477,21 @@ static void vt82c686b_realize(PCIDevice *d, Error =
**errp)
> >       */
> >      memory_region_add_subregion(isa_bus->address_space_io, 0x3f0,
> >                                  &s->superio_cfg.io);
> > +
> > +    /* Grab io regions of serial devices so we can control them */
> > +    for (i =3D 0; i < ic->serial.count; i++) {
> > +        ISADevice *sd =3D s->superio_cfg.superio->serial[i];
> > +        MemoryRegion *io =3D isa_address_space_io(sd);
> > +        MemoryRegion *mr =3D find_subregion(sd, io, sd->ioport_id);
> > +        if (!mr) {
> > +            error_setg(errp, "Could not get io region for serial %d", =
i);
> > +            return;
> > +        }
> > +        s->superio_cfg.serial_io[i] =3D mr;
> > +        if (memory_region_is_mapped(mr)) {
> > +            memory_region_del_subregion(io, mr);
> > +        }
> > +    }
> >  }
> > =20
> >  static void via_class_init(ObjectClass *klass, void *data)
> >=20
>=20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--eDrVpvzkDffO7C4+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBKweAACgkQbDjKyiDZ
s5KIYhAAlVef/YXDe7rYkqsaROt14YA8RdzrNwwk68hLYNkEMljF0okZTYJtFCm3
YhCo6S644Sk/DKOGCYb9vJTbj9VdlZxUYRkPeH0c2bdlf0Jyb48cvE7YFRQwiSK3
gwkiSySPW5OoihBsNZNtHHiAMP7i7Zw8U6k8XOmGuoJ+yRXhgneSOdWa1lFw9LbC
rvQlVaa3/8cqbWr8QizeXlNcsozkmE7sqDoHxNxnaH/rnn0y9zwJcMYl8aiktJLs
Bkpa9XgI03QqkMJTcqWIYcFswlt/QDwdFJX26hjqtgSS7ZMeqlIEx2M4oFqD/7ma
JYyWz7Sijr0u3oLpN8gEkQqGkjLUDxOF7PljFrHd+DIukE8vboZG/UPiy1c/73zw
ckDDrf7hHcTrEy6IMPVFXufZ2K/qc/yb2z/ZJzZtAZax4IDAqBcyQqi79WDtRYf4
YPamfvt1WnsZWSCOvBotqDOR9XsVViBPV1YVXu5YnG/tpD9aKmLqO0+Q97E33zHI
VlvaAZshA9qvsZy/wgDgR/2oXciibs0GCJ2FfTpBpWmGn/hP3ce9eTqOFTn3o4FT
rq/Iwjk2LIljiETc/6JGX9CiEpPi9ZGg1F+3bhlsI5Y3zoynvLv6IvE5wFld39ns
mOs7h9yM3VFauxkAd8ZXQB62l9+P/Jt31vugI84UUZyAy/OluGM=
=AxJt
-----END PGP SIGNATURE-----

--eDrVpvzkDffO7C4+--

