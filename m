Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2508F3ECE1F
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 07:46:06 +0200 (CEST)
Received: from localhost ([::1]:39990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFVRk-0001vC-Sk
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 01:46:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mFVNS-0000O7-04; Mon, 16 Aug 2021 01:41:38 -0400
Received: from ozlabs.org ([203.11.71.1]:36485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mFVNN-0000om-RW; Mon, 16 Aug 2021 01:41:37 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Gp31X6t9bz9sWX; Mon, 16 Aug 2021 15:41:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1629092480;
 bh=zVVZ3XD1dY5ub0BgsPxu2RxPdVuWL/Ry8qCHqqHkysM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CaEoUwRt0+Z8MdJspVNR2yRViiEAiUZQn80/3xng6TsY2iEy8sV/2ZlDr2Du3xrKf
 HooVsoC7SHpmz7M1u/FFoPGSCafk/VU9SsuCjbtSB11D6Qkp9yZ0uL5HR7RYmHkI8J
 DrnttewHKKrhXRYU3Aag220KM+/RlnpW2tf144ak=
Date: Mon, 16 Aug 2021 14:37:51 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PULL 24/30] spapr_pci: populate ibm,loc-code
Message-ID: <YRnrn0EeT8apvqFI@yekko>
References: <1436284182-5063-1-git-send-email-agraf@suse.de>
 <1436284182-5063-25-git-send-email-agraf@suse.de>
 <CAFEAcA9TQKAU94OUuSzYH8A_7CFfSYc+R8-Mz4mai0vwMbjsxA@mail.gmail.com>
 <YRIAr6HIW742LSZd@yekko>
 <CAFEAcA-GGNcm09xu5v65jQcghjBnj6cBtb0p0xYhOPPNt1g_sg@mail.gmail.com>
 <1daaacdf-4725-3350-601f-24025d3944f4@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vNWBCNOAsfNQemwb"
Content-Disposition: inline
In-Reply-To: <1daaacdf-4725-3350-601f-24025d3944f4@redhat.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--vNWBCNOAsfNQemwb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 15, 2021 at 04:36:18PM +0200, Philippe Mathieu-Daud=E9 wrote:
> On 8/13/21 5:17 PM, Peter Maydell wrote:
> > On Tue, 10 Aug 2021 at 05:40, David Gibson <david@gibson.dropbear.id.au=
> wrote:
> >>
> >> On Mon, Aug 09, 2021 at 10:57:00AM +0100, Peter Maydell wrote:
> >>>
> >>> Cleanest fix would be to declare 'path' and 'host' as
> >>>    g_autofree char *path =3D NULL;
> >>>    g_autofree char *host =3D NULL;
> >>> and then you can remove all the manual g_free(path) and g_free(host) =
calls.
> >>
> >> Thanks for the report.  I've committed the fix (I hope) below to ppc-f=
or-6.1:
> >>
> >> From 70ae61b510dc571c407b28c46498cae60e60ca66 Mon Sep 17 00:00:00 2001
> >> From: David Gibson <david@gibson.dropbear.id.au>
> >> Date: Tue, 10 Aug 2021 14:28:19 +1000
> >> Subject: [PATCH] spapr_pci: Fix leak in spapr_phb_vfio_get_loc_code() =
with
> >>  g_autofree
> >>
> >> This uses g_autofree to simplify logic in spapr_phb_vfio_get_loc_code(=
),
> >> in the process fixing a leak in one of the paths.  I'm told this fixes
> >> Coverity error CID 1460454
> >>
> >> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> >> Fixes: 16b0ea1d852 ("spapr_pci: populate ibm,loc-code")
> >> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> >> ---
> >>  hw/ppc/spapr_pci.c | 17 ++++++-----------
> >>  1 file changed, 6 insertions(+), 11 deletions(-)
> >>
> >> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> >> index 7a725855f9..13d806f390 100644
> >> --- a/hw/ppc/spapr_pci.c
> >> +++ b/hw/ppc/spapr_pci.c
> >> @@ -782,33 +782,28 @@ static AddressSpace *spapr_pci_dma_iommu(PCIBus =
*bus, void *opaque, int devfn)
> >>
> >>  static char *spapr_phb_vfio_get_loc_code(SpaprPhbState *sphb,  PCIDev=
ice *pdev)
> >>  {
> >> -    char *path =3D NULL, *buf =3D NULL, *host =3D NULL;
> >> +    g_autofree char *path =3D NULL;
> >> +    g_autofree char *host =3D NULL;
> >> +    char *buf =3D NULL;
> >>
> >>      /* Get the PCI VFIO host id */
> >>      host =3D object_property_get_str(OBJECT(pdev), "host", NULL);
> >>      if (!host) {
> >> -        goto err_out;
> >> +        return NULL;
> >>      }
> >>
> >>      /* Construct the path of the file that will give us the DT locati=
on */
> >>      path =3D g_strdup_printf("/sys/bus/pci/devices/%s/devspec", host);
> >> -    g_free(host);
> >>      if (!g_file_get_contents(path, &buf, NULL, NULL)) {
> >> -        goto err_out;
> >> +        return NULL;
> >>      }
> >> -    g_free(path);
> >>
> >>      /* Construct and read from host device tree the loc-code */
> >>      path =3D g_strdup_printf("/proc/device-tree%s/ibm,loc-code", buf);
> >> -    g_free(buf);
> >=20
> > This deletion doesn't look right -- 'buf' is not autofree
> > (and shouldn't be, since we're returning it).
>=20
> Oops, good catch!

Indeed.  Revised version below.  I'll only attempt to push this to 6.1
if we're going to rc4 for other reasons though.

=46rom 705a10b1cfbe6bcdde37f37f3548845970dc4986 Mon Sep 17 00:00:00 2001
=46rom: David Gibson <david@gibson.dropbear.id.au>
Date: Tue, 10 Aug 2021 14:28:19 +1000
Subject: [PATCH] spapr_pci: Fix leak in spapr_phb_vfio_get_loc_code() with
 g_autofree
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

This uses g_autofree to simplify logic in spapr_phb_vfio_get_loc_code(),
in the process fixing a leak in one of the paths.  I'm told this fixes
Coverity error CID 1460454

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Fixes: 16b0ea1d852 ("spapr_pci: populate ibm,loc-code")
Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_pci.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
index 7a725855f9..7430bd6314 100644
--- a/hw/ppc/spapr_pci.c
+++ b/hw/ppc/spapr_pci.c
@@ -782,33 +782,29 @@ static AddressSpace *spapr_pci_dma_iommu(PCIBus *bus,=
 void *opaque, int devfn)
=20
 static char *spapr_phb_vfio_get_loc_code(SpaprPhbState *sphb,  PCIDevice *=
pdev)
 {
-    char *path =3D NULL, *buf =3D NULL, *host =3D NULL;
+    g_autofree char *path =3D NULL;
+    g_autofree char *host =3D NULL;
+    g_autofree char *devspec =3D NULL;
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
-    if (!g_file_get_contents(path, &buf, NULL, NULL)) {
-        goto err_out;
+    if (!g_file_get_contents(path, &devspec, NULL, NULL)) {
+        return NULL;
     }
-    g_free(path);
=20
     /* Construct and read from host device tree the loc-code */
-    path =3D g_strdup_printf("/proc/device-tree%s/ibm,loc-code", buf);
-    g_free(buf);
+    path =3D g_strdup_printf("/proc/device-tree%s/ibm,loc-code", devspec);
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

--vNWBCNOAsfNQemwb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmEZ650ACgkQbDjKyiDZ
s5JfMRAApUMU4WZWXea4Y1wCw/mkI8yZPCne4WACr1S7VkE6a96XW2i3Ws+sJaq7
G0Mt+DVs+RGbBLHJLDzkOjiWKkClfd1GV/SF2NmNkRBFPk2Db6758t7Pv3Jcivbj
ZYMQZE7CR3RdRNkSrLglu9YL/BzzyVNF1DHamGqWUACbTcC5rP/XCOOKbzXNeT7o
LTBfeaRI+5WEya3xuNA8Ix5BnlWmgkZ8FVCMB8zEmvU5rTG36hAc0WPGL7FFMXjJ
Vk/E/Q00sBG4/0+4R+B7r3liT7NPQNV0Mb6/J6q0/muscrImiMvminxQ+gZ18NDn
qZnMbCgX3zyLe7rZx8r7NuWSdBmG2Jc6de21v3PBfNXjaDvh5dMSvgnFW9QamZQ3
kRZnUx2RaXEgXhpBYqz2Zw9B/0WaBglJhEtZMYux6BkH8JGU/+L5wQx8R4IydxgV
+SesLQHPGi6lsr7tZrXgxUNDOHvMDzf6KWW0eyHgiomujxULr9H1kyASjdsd9sJP
MmU+KnAUEHhVnoQ2KZ81432QekG1VT+n7/6zp2GAmdvA5EwP4zLajnIW648wIQI6
QQF4sM2BvfFoJj3Sqh3wGUVfH+XR8iywMTF+Wwas+mmAqXLwxCo4cB7kZgWZM0sL
ulqnlbJW6cT6bkRbixgSR7tdWzDp2rmX5afk9GE73CUCbCGP9Ag=
=l6Dj
-----END PGP SIGNATURE-----

--vNWBCNOAsfNQemwb--

