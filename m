Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A113D2A22E1
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Nov 2020 03:06:58 +0100 (CET)
Received: from localhost ([::1]:33164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZPFJ-0002xU-8E
	for lists+qemu-devel@lfdr.de; Sun, 01 Nov 2020 21:06:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kZPDY-0001v6-Ii; Sun, 01 Nov 2020 21:05:08 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:54621 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kZPDV-0005b0-VP; Sun, 01 Nov 2020 21:05:08 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CPbpL74QPz9sVM; Mon,  2 Nov 2020 13:04:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1604282698;
 bh=PpjcCgFKPOrTr/1Mwl37mDOt0wU44Pa1fj8hbM+XJyo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hh2euoPJz+A9IiE15j8gm4Q6dv0ei2NUyqWja5/l7NH+VCEIfuyhwX8akrMnSYN1a
 kTnIziDeqyL0x0JbPZqIeKUk5FKHgJ5Os0tGwF+mf2cjF9RwqHKBgH5Dstvr5OnhZR
 u02hV0foC0+ml+BfFvT3rBONzV4zKww66mndcrdE=
Date: Mon, 2 Nov 2020 12:52:30 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 2/4] hw/pci-host/prep: Remove legacy PReP machine
 temporary workaround
Message-ID: <20201102015230.GD143651@yekko.fritz.box>
References: <20201012071906.3301481-1-f4bug@amsat.org>
 <20201012071906.3301481-3-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0IvGJv3f9h+YhkrH"
Content-Disposition: inline
In-Reply-To: <20201012071906.3301481-3-f4bug@amsat.org>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--0IvGJv3f9h+YhkrH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2020 at 09:19:04AM +0200, Philippe Mathieu-Daud=E9 wrote:
> The legacy PReP machine has been removed in commit b2ce76a0730
> ("hw/ppc/prep: Remove the deprecated "prep" machine and the
> OpenHackware BIOS"). This temporary workaround is no more
> required, remove it.
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  hw/pci-host/prep.c | 32 +++++++++++---------------------
>  1 file changed, 11 insertions(+), 21 deletions(-)
>=20
> diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
> index 80dfb67da43..064593d1e52 100644
> --- a/hw/pci-host/prep.c
> +++ b/hw/pci-host/prep.c
> @@ -75,7 +75,6 @@ struct PRePPCIState {
>      RavenPCIState pci_dev;
> =20
>      int contiguous_map;
> -    bool is_legacy_prep;
>  };
> =20
>  #define BIOS_SIZE (1 * MiB)
> @@ -229,24 +228,18 @@ static void raven_pcihost_realizefn(DeviceState *d,=
 Error **errp)
>      MemoryRegion *address_space_mem =3D get_system_memory();
>      int i;
> =20
> -    if (s->is_legacy_prep) {
> -        for (i =3D 0; i < PCI_NUM_PINS; i++) {
> -            sysbus_init_irq(dev, &s->pci_irqs[i]);
> -        }
> -    } else {
> -        /*
> -         * According to PReP specification section 6.1.6 "System Interru=
pt
> -         * Assignments", all PCI interrupts are routed via IRQ 15
> -         */
> -        s->or_irq =3D OR_IRQ(object_new(TYPE_OR_IRQ));
> -        object_property_set_int(OBJECT(s->or_irq), "num-lines", PCI_NUM_=
PINS,
> -                                &error_fatal);
> -        qdev_realize(DEVICE(s->or_irq), NULL, &error_fatal);
> -        sysbus_init_irq(dev, &s->or_irq->out_irq);
> +    /*
> +     * According to PReP specification section 6.1.6 "System Interrupt
> +     * Assignments", all PCI interrupts are routed via IRQ 15.
> +     */
> +    s->or_irq =3D OR_IRQ(object_new(TYPE_OR_IRQ));
> +    object_property_set_int(OBJECT(s->or_irq), "num-lines", PCI_NUM_PINS,
> +                            &error_fatal);
> +    qdev_realize(DEVICE(s->or_irq), NULL, &error_fatal);
> +    sysbus_init_irq(dev, &s->or_irq->out_irq);
> =20
> -        for (i =3D 0; i < PCI_NUM_PINS; i++) {
> -            s->pci_irqs[i] =3D qdev_get_gpio_in(DEVICE(s->or_irq), i);
> -        }
> +    for (i =3D 0; i < PCI_NUM_PINS; i++) {
> +        s->pci_irqs[i] =3D qdev_get_gpio_in(DEVICE(s->or_irq), i);
>      }
> =20
>      qdev_init_gpio_in(d, raven_change_gpio, 1);
> @@ -403,9 +396,6 @@ static Property raven_pcihost_properties[] =3D {
>      DEFINE_PROP_UINT32("elf-machine", PREPPCIState, pci_dev.elf_machine,
>                         EM_NONE),
>      DEFINE_PROP_STRING("bios-name", PREPPCIState, pci_dev.bios_name),
> -    /* Temporary workaround until legacy prep machine is removed */
> -    DEFINE_PROP_BOOL("is-legacy-prep", PREPPCIState, is_legacy_prep,
> -                     false),
>      DEFINE_PROP_END_OF_LIST()
>  };
> =20

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--0IvGJv3f9h+YhkrH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl+fZl4ACgkQbDjKyiDZ
s5JPrhAAxSoppKrhnl6dvbI1OtDemfr13PyXJp8HdtVC0frSbqtsXuI/XWh2Ha2P
m+Ym9Vagt4lZpRIMnS3mFGJDOkdH4/lsj8LuAUf/+KFOlvirG6GFwHAl2QfllFA3
ZOmqHztAlBig49iqXLWbwm8OWWCVOIJwNXGnbTJwdIZJHODcqPb/hKuCtgsG9kKL
TUCCRuMHe2U4ld9hwk73WKpEIHQA5uFBSjE5XNeXv2hqCAD3gVrLqZDRPmjzkhCb
Z/HWT4f8LEjJPV9i8ekycXTJdE7VY3Owed+noklfUBIb/WzwDoLZKp6SCphKWdxN
P7rY4ZfnXmkTfe0ZOHPGodgyTDNy4yPH1PL4p166t/wnwo7ZTQx8ecC+StP4qrrQ
Ea1UtNJAny4bso+oYQ4NQ6Sl4EZ+xY3ieNSnUegLaGqbYqRGXLskA7+Ef4CgkaKe
smYiuHh4uT0rOa4AvylNV0DjlsceCFsbqONSY8gW2LAfNDnPelHyi8LkzlljSO+b
mRiT6CsPnjmboQi5Zvn3xSzgrbxov+HwCCdTiZQH5RXGnq9JYKFAd2bPZe9QCumK
aAFF/egonUmQ+7o+hKyhLNG7NR9dIJCkUu+3dDz9jjE4Gv6OYXJsVHVhOLRn0cog
WrnxKvz0soeM/pfabXtZspxAZ9UkQAd0f/vcNdtMTvHMPotHSu8=
=wt8t
-----END PGP SIGNATURE-----

--0IvGJv3f9h+YhkrH--

