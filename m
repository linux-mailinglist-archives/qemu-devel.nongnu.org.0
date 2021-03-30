Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4224934F549
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 02:07:08 +0200 (CEST)
Received: from localhost ([::1]:54646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lROO2-0005e2-Qm
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 20:07:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lROLL-0004FQ-Au; Tue, 30 Mar 2021 20:04:19 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:50869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lROLH-0002us-2L; Tue, 30 Mar 2021 20:04:19 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F96492fX7z9shx; Wed, 31 Mar 2021 11:04:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1617149049;
 bh=KKbWb1jeZ7gWEamN12RZBI5mqQukpe0Qp9oQlldnmn8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LSWWjhJ+ukQXA3xz5bLB5x0QIjWDVsP0MwO9H13F3IG40dRb/BP650WHF02h71EeD
 Eu6rRE7PgthkEELUk31MlSI6FbQNo1P3s5lhRZ3xo1zl8bpbauzrtwpkmAqCSwPXoM
 HK8rM3t0kRpvDvSRK3P+G76aGSd60rmIFuUvA90s=
Date: Wed, 31 Mar 2021 10:49:07 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: [PATCH] ppc/spapr: Add support for implement support for
 H_SCM_HEALTH
Message-ID: <YGO488mqe2RMHBiu@yekko.fritz.box>
References: <20210329162259.536964-1-vaibhav@linux.ibm.com>
 <20210330161437.45872897@bahia.lan>
 <87r1jwpo3p.fsf@vajain21.in.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="f7ONA1GK+uW2NGpv"
Content-Disposition: inline
In-Reply-To: <87r1jwpo3p.fsf@vajain21.in.ibm.com>
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
Cc: xiaoguangrong.eric@gmail.com, mst@redhat.com, aneesh.kumar@linux.ibm.com,
 Greg Kurz <groug@kaod.org>, kvm-ppc@vger.kernel.org, qemu-devel@nongnu.org,
 shivaprasadbhat@gmail.com, qemu-ppc@nongnu.org, bharata@linux.vnet.ibm.com,
 imammedo@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--f7ONA1GK+uW2NGpv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 30, 2021 at 10:37:06PM +0530, Vaibhav Jain wrote:
>=20
> Thanks for looking into this patch Greg. My responses below inline.
>=20
>=20
> Greg Kurz <groug@kaod.org> writes:
>=20
> > Hi Vaibhav,
> >
> > Great to see you around :-)
>=20
> :-)
>=20
> >
> > On Mon, 29 Mar 2021 21:52:59 +0530
> > Vaibhav Jain <vaibhav@linux.ibm.com> wrote:
> >
> >> Add support for H_SCM_HEALTH hcall described at [1] for spapr
> >> nvdimms. This enables guest to detect the 'unarmed' status of a
> >> specific spapr nvdimm identified by its DRC and if its unarmed, mark
> >> the region backed by the nvdimm as read-only.
> >>=20
> >
> > Any chance that you can provide the documentation of this new hcall ?
> >
> H_SCM_HEALTH specifications is already documented in linux kernel
> documentation at
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/powerpc/papr_hcalls.rst

Putting a reference to that in the commit message would be a good idea.

> That documentation was added when kernel support for H_SCM_HEALTH hcall
> support was implemented in 5.9 kernel.=20
>=20
> >> The patch adds h_scm_health() to handle the H_SCM_HEALTH hcall which
> >> returns two 64-bit bitmaps (health bitmap, health bitmap mask) derived
> >> from 'struct nvdimm->unarmed' member.
> >>=20
> >> Linux kernel side changes to enable handling of 'unarmed' nvdimms for
> >> ppc64 are proposed at [2].
> >>=20
> >> References:
> >> [1] "Hypercall Op-codes (hcalls)"
> >>     https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=
/tree/Documentation/powerpc/papr_hcalls.rst
> >>=20
> >> [2] "powerpc/papr_scm: Mark nvdimm as unarmed if needed during probe"
> >>     https://lore.kernel.org/linux-nvdimm/20210329113103.476760-1-vaibh=
av@linux.ibm.com/
> >>=20
> >> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> >> ---
> >>  hw/ppc/spapr_nvdimm.c  | 30 ++++++++++++++++++++++++++++++
> >>  include/hw/ppc/spapr.h |  4 ++--
> >>  2 files changed, 32 insertions(+), 2 deletions(-)
> >>=20
> >> diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
> >> index b46c36917c..e38740036d 100644
> >> --- a/hw/ppc/spapr_nvdimm.c
> >> +++ b/hw/ppc/spapr_nvdimm.c
> >> @@ -31,6 +31,13 @@
> >>  #include "qemu/range.h"
> >>  #include "hw/ppc/spapr_numa.h"
> >> =20
> >> +/* DIMM health bitmap bitmap indicators */
> >> +/* SCM device is unable to persist memory contents */
> >> +#define PAPR_PMEM_UNARMED (1ULL << (63 - 0))
> >
> > This looks like PPC_BIT(0).
> >
> Yes, right. Will update the patch in v2 to use the PPC_BIT macro.
>=20
> >> +
> >> +/* Bits status indicators for health bitmap indicating unarmed dimm */
> >> +#define PAPR_PMEM_UNARMED_MASK (PAPR_PMEM_UNARMED)
> >> +
> >>  bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice =
*nvdimm,
> >>                             uint64_t size, Error **errp)
> >>  {
> >> @@ -467,6 +474,28 @@ static target_ulong h_scm_unbind_all(PowerPCCPU *=
cpu, SpaprMachineState *spapr,
> >>      return H_SUCCESS;
> >>  }
> >> =20
> >> +static target_ulong h_scm_health(PowerPCCPU *cpu, SpaprMachineState *=
spapr,
> >> +                                 target_ulong opcode, target_ulong *a=
rgs)
> >> +{
> >> +    uint32_t drc_index =3D args[0];
> >> +    SpaprDrc *drc =3D spapr_drc_by_index(drc_index);
> >> +    NVDIMMDevice *nvdimm;
> >> +
> >> +    if (drc && spapr_drc_type(drc) !=3D SPAPR_DR_CONNECTOR_TYPE_PMEM)=
 {
> >> +        return H_PARAMETER;
> >> +    }
> >> +
> >> +    nvdimm =3D NVDIMM(drc->dev);
> >
> > Yeah as already suggested by Shiva, drc->dev should be checked like
> > in h_scm_bind_mem().
> >
> Yes, will send a v2 with this case handled.
>=20
> >> +
> >> +    /* Check if the nvdimm is unarmed and send its status via health =
bitmaps */
> >> +    args[0] =3D nvdimm->unarmed ? PAPR_PMEM_UNARMED_MASK : 0;
> >> +
> >
> > Shouldn't ^^ use PAPR_PMEM_UNARMED then ?
> >
> >> +    /* health bitmap mask same as the health bitmap */
> >> +    args[1] =3D args[0];
> >> +
> >
> > If so, it seems that PAPR_PMEM_UNARMED_MASK isn't even needed.
>=20
> Definition of these defines are similar to what kernel implementation
> uses at
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/a=
rch/powerpc/platforms/pseries/papr_scm.c#n53
>=20
> Since unarmed condition can also arise due to an unhealthy nvdimm hence
> the kernel implementation uses a mask thats composed of two bits
> PPC_BIT(0) and PPC_BIT(6) being set. Though we arent using PPC_BIT(6)
> right now in qemu, it will change in future when better nvdimm health
> reporting will be done. Hence kept the PPC_BIT(0) define as well as the
> mask to mimic the kernel definitions.
>=20
> >
> > Having access to the excerpts from the PAPR addendum that describes
> > this hcall would _really_ help in reviewing.
> >
> The kernel documentation for H_SCM_HEALTH mentioned above captures most
> if not all parts of the PAPR addendum for this hcall. I believe it
> contains enough information to review the patch. If you still need more
> info than please let me know.

We've missed the qemu-6.0 cutoff, so this will be 6.1 material.  I'll
await v2 for further review.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--f7ONA1GK+uW2NGpv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmBjuPIACgkQbDjKyiDZ
s5JzlA//T11BtMlXSLbvRPM52bSDvooPztpoMZGvaRtj7YJPJXsAUH76v4/XcFfl
lZ2ZELMyuQc4Dms4Ylff1/srXq73eC8p/GYIt9K5iAU7NZop5hbcFiaWv5FaU7um
CzimfPN8g+sPj0+O06O6oAELVTZZvcsdLn7Tq+alVegvg2vtfHesQklH7tHqVox3
FRrxrxmEpAHsaVVfZKqyOrrjEVwtcFpeh9cnqgWGtbJuF6rFuqMoNzLeyUJ6k4Ea
Z8vA0sj9wOP2uR2yROp6+R3+YKOlUZfMRxXO2Yqt50ePVwcaIA/fWZV5hNHGFu5V
D+I53u8lBZ6oFStXlBUREp+DtUMj0RH+l8jHfMKJnYIdu1jixWa8yh6qQibQ4+A4
tOzWCn5ipL2L48kAbq9xBZisz4c3v9BxF8UlluV21QmEtZZCd6P3Sjdg7Cf4Tsg+
AtSC+jfUIKzPi8QLeGmvJDDGQocvr/4WZ7D0EkZmpa7vwnviQfN6slyYj1fSIF2h
kV8sBi5AkqZAKGexeDHTdihR/AT64EdcRNM+1EFBXc+ZSXk/guGX7efmwWfBLW81
k0zjUyCongXcMAvotY3GI9DEEepaMJW1yN1aqrc3mqUt5dx8dv2JwaOvdF3TI84J
G9m6vGW92xUU2eyLIphMqgkHLVJzixEpFeHLBrTTKupLMD9BoOY=
=jjbl
-----END PGP SIGNATURE-----

--f7ONA1GK+uW2NGpv--

