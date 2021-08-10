Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 985513E5264
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 06:43:02 +0200 (CEST)
Received: from localhost ([::1]:58800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDJbR-00070t-L4
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 00:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDJZE-00068m-Nu; Tue, 10 Aug 2021 00:40:44 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:43431 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDJZC-0004XG-3W; Tue, 10 Aug 2021 00:40:44 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GkKyD4RL5z9sXV; Tue, 10 Aug 2021 14:40:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628570436;
 bh=jMrdxJD34kWETxGyLvthGaS+A6TwPpmJ9O4pGElf1e4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DOPOEr7vc1jbBCZp3m2IRUJnMHrwAWNg/hVanNKHjNz1Sh/6BOEpNrYN56ceiNwIY
 +taHbNAGFCx2Oo9UsZHjOZ9jKVZHhxBns+hIG/vFu9752sCvS+a1DqXH64FRqHJ74c
 FrUY4yvvRHa/KJmG/ceqsnD4KxrjTJd8TgeJSQps=
Date: Tue, 10 Aug 2021 14:29:35 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 24/30] spapr_pci: populate ibm,loc-code
Message-ID: <YRIAr6HIW742LSZd@yekko>
References: <1436284182-5063-1-git-send-email-agraf@suse.de>
 <1436284182-5063-25-git-send-email-agraf@suse.de>
 <CAFEAcA9TQKAU94OUuSzYH8A_7CFfSYc+R8-Mz4mai0vwMbjsxA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wXfI/tJOKpDi25++"
Content-Disposition: inline
In-Reply-To: <CAFEAcA9TQKAU94OUuSzYH8A_7CFfSYc+R8-Mz4mai0vwMbjsxA@mail.gmail.com>
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--wXfI/tJOKpDi25++
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 09, 2021 at 10:57:00AM +0100, Peter Maydell wrote:
> On Tue, 7 Jul 2015 at 16:49, Alexander Graf <agraf@suse.de> wrote:
> >
> > From: Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>
> >
> > Each hardware instance has a platform unique location code.  The OF
> > device tree that describes a part of a hardware entity must include
> > the =E2=80=9Cibm,loc-code=E2=80=9D property with a value that represent=
s the location
> > code for that hardware entity.
> >
> > Populate ibm,loc-code.
>=20
> Ancient patch, but Coverity has just noticed a bug in it
> which is still present in current QEMU (CID 1460454):
>=20
> > +static char *spapr_phb_vfio_get_loc_code(sPAPRPHBState *sphb,  PCIDevi=
ce *pdev)
> > +{
> > +    char *path =3D NULL, *buf =3D NULL, *host =3D NULL;
> > +
> > +    /* Get the PCI VFIO host id */
> > +    host =3D object_property_get_str(OBJECT(pdev), "host", NULL);
> > +    if (!host) {
> > +        goto err_out;
> > +    }
> > +
> > +    /* Construct the path of the file that will give us the DT locatio=
n */
> > +    path =3D g_strdup_printf("/sys/bus/pci/devices/%s/devspec", host);
> > +    g_free(host);
> > +    if (!path || !g_file_get_contents(path, &buf, NULL, NULL)) {
> > +        goto err_out;
> > +    }
> > +    g_free(path);
>=20
> Here we create a 'path' string, use it as the argument to
> g_file_get_contents() and then free it (either here or in the err_out pat=
h)...
>=20
> > +
> > +    /* Construct and read from host device tree the loc-code */
> > +    path =3D g_strdup_printf("/proc/device-tree%s/ibm,loc-code", buf);
> > +    g_free(buf);
> > +    if (!path || !g_file_get_contents(path, &buf, NULL, NULL)) {
> > +        goto err_out;
> > +    }
> > +    return buf;
>=20
> ...but here we forget to free it before returning in the success case.
>=20
> > +
> > +err_out:
> > +    g_free(path);
> > +    return NULL;
> > +}
>=20
> Cleanest fix would be to declare 'path' and 'host' as
>    g_autofree char *path =3D NULL;
>    g_autofree char *host =3D NULL;
> and then you can remove all the manual g_free(path) and g_free(host) call=
s.

Thanks for the report.  I've committed the fix (I hope) below to ppc-for-6.=
1:

=46rom 70ae61b510dc571c407b28c46498cae60e60ca66 Mon Sep 17 00:00:00 2001
=46rom: David Gibson <david@gibson.dropbear.id.au>
Date: Tue, 10 Aug 2021 14:28:19 +1000
Subject: [PATCH] spapr_pci: Fix leak in spapr_phb_vfio_get_loc_code() with
 g_autofree

This uses g_autofree to simplify logic in spapr_phb_vfio_get_loc_code(),
in the process fixing a leak in one of the paths.  I'm told this fixes
Coverity error CID 1460454

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Fixes: 16b0ea1d852 ("spapr_pci: populate ibm,loc-code")
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_pci.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 7a725855f9..13d806f390 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -782,33 +782,28 @@ static AddressSpace *spapr_pci_dma_iommu(PCIBus *bus,=
 void *opaque, int devfn)
=20
 static char *spapr_phb_vfio_get_loc_code(SpaprPhbState *sphb,  PCIDevice *=
pdev)
 {
-    char *path =3D NULL, *buf =3D NULL, *host =3D NULL;
+    g_autofree char *path =3D NULL;
+    g_autofree char *host =3D NULL;
+    char *buf =3D NULL;
=20
     /* Get the PCI VFIO host id */
     host =3D object_property_get_str(OBJECT(pdev), "host", NULL);
     if (!host) {
-        goto err_out;
+        return NULL;
     }
=20
     /* Construct the path of the file that will give us the DT location */
     path =3D g_strdup_printf("/sys/bus/pci/devices/%s/devspec", host);
-    g_free(host);
     if (!g_file_get_contents(path, &buf, NULL, NULL)) {
-        goto err_out;
+        return NULL;
     }
-    g_free(path);
=20
     /* Construct and read from host device tree the loc-code */
     path =3D g_strdup_printf("/proc/device-tree%s/ibm,loc-code", buf);
-    g_free(buf);
     if (!g_file_get_contents(path, &buf, NULL, NULL)) {
-        goto err_out;
+        return NULL;
     }
     return buf;
-
-err_out:
-    g_free(path);
-    return NULL;
 }
=20
 static char *spapr_phb_get_loc_code(SpaprPhbState *sphb, PCIDevice *pdev)
--=20
2.31.1



--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--wXfI/tJOKpDi25++
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmESAKwACgkQbDjKyiDZ
s5LlixAAm2JaY7blgq/I9/zNF5cAX4RHVvuUy7tXUHOfUEnN15A8806lwlWSc6Jl
kaEKRmMR7CadlmcTLfm3LxKvjse4kWSQkD4K9FHQ2Oi0OIbMkcKZXtx7oQNqvcq2
NafJezpfU/03tK3UrvBYmdaSH54ecJtSZ1+X/1MVpqCPbCrgTjUy7NJlj29odrL9
AdIs+1w2Yfp0FjoUn8hjSaCvptmX5qhlnl3Me/CnAHzrA67Z+1ACRMj1gHh8kJ78
20KRqyvcKv91e6RvFZsupHo/HF/sBQAoRk5A1Xr+29MwslU7yPtNsxBt9ZksKwmb
HDD8JKTtg3XKUXIDTEcPNjSipzaTAieKMA0XkgLd4VxxT6p50i6KLYur0Hx+lskS
SnqVGRIqLvb4EXxjYqepVSWxGMbJ8x/rtVv2/PiB853npeS25N0RgnCbyKNioiYb
nE7n8zqseLR4q4lSdP+KuvNkdE4lSNzmmvcgsX+hlP+2Bj0uuL72movmanNTwQej
WhhGWT+h83sF9f8/IrrYN5i6iyIFKHsuObBPtUY1LYzELBg4O/+GeokkED7ADYw5
sUVcJpZyGdbJ0mlBH9w5+yCYfjRyow2apfQZM3V4zwhkyHOWJS9BU/uTeUMEjDy7
4r3a9u/J++LxGbUumKEV/ssnyjLuSsga5TmcGoa6NSiCVPeONzM=
=Hl5c
-----END PGP SIGNATURE-----

--wXfI/tJOKpDi25++--

