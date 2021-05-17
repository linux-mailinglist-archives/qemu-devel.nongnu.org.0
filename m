Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 503AF382348
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 06:12:23 +0200 (CEST)
Received: from localhost ([::1]:44606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liUcA-00070t-DH
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 00:12:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1liUa9-0004YC-Oc; Mon, 17 May 2021 00:10:17 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:43201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1liUa6-000284-HF; Mon, 17 May 2021 00:10:17 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fk5JK0Zljz9sWP; Mon, 17 May 2021 14:10:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621224609;
 bh=fPbAyNzehfibTLmySHTK4ozx03bWAidSpoDNeb+MNYU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QpHGPAlnBipbTmqIhXP0iX+iE6pHIipDGiFKsLpsM8hIluNuEeU6XHrpVzkzWZ/VA
 GW9xQxxiCNosbsV2liwfwJh2N36Zd3yK5jTJAT8H6dn4XBBNy5l9oQ1asWWeSLylLg
 gVPhLTe4aDU9PLdHEZIAiz2aevU/bonVt7UkbErU=
Date: Mon, 17 May 2021 13:53:21 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Subject: Re: [RFC PATCH 10/11] target/ppc: created tcg-stub.c file
Message-ID: <YKHosTp7I7vpq4uw@yekko>
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-11-bruno.larsen@eldorado.org.br>
 <YJykOuYj9xgjVPZQ@yekko>
 <4954165f-c4fe-aad8-3d0f-070297e6722c@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="S/BxmolPx4ssU+eh"
Content-Disposition: inline
In-Reply-To: <4954165f-c4fe-aad8-3d0f-070297e6722c@eldorado.org.br>
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--S/BxmolPx4ssU+eh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 13, 2021 at 09:56:27AM -0300, Bruno Piazera Larsen wrote:
>=20
> On 13/05/2021 00:59, David Gibson wrote:
> > On Wed, May 12, 2021 at 11:08:12AM -0300, Bruno Larsen (billionai) wrot=
e:
> > > Created a file with stubs needed to compile disabling TCG.
> > >=20
> > > We're not sure about keeping the softmmu stubs in this file. if there=
 is
> > > a better place to put them, please let us know.
> > >=20
> > > The other 3 functions have been stubbed because we didn't know what to
> > > do with them. Making the file compile in the !TCG case would create an
> > > ifdef hell, but extracting the functions meant moving many others as
> > > well, and there weren't any good places to put them.
> > >=20
> > > Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> > > ---
> > >   target/ppc/tcg-stub.c | 33 +++++++++++++++++++++++++++++++++
> > >   1 file changed, 33 insertions(+)
> > >   create mode 100644 target/ppc/tcg-stub.c
> > >=20
> > > diff --git a/target/ppc/tcg-stub.c b/target/ppc/tcg-stub.c
> > > new file mode 100644
> > > index 0000000000..67099e2676
> > > --- /dev/null
> > > +++ b/target/ppc/tcg-stub.c
> > > @@ -0,0 +1,33 @@
> > > +
> > > +#include "qemu/osdep.h"
> > > +#include "exec/hwaddr.h"
> > > +#include "cpu.h"
> > > +#include "hw/ppc/spapr.h"
> > > +
> > > +hwaddr ppc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
> > > +{
> > > +    return 0;
> > > +}
> > > +
> > > +void dump_mmu(CPUPPCState *env)
> > > +{
> > > +}
> > > +
> > > +void ppc_tlb_invalidate_all(CPUPPCState *env)
> > > +{
> > > +}
> > > +
> > > +target_ulong softmmu_resize_hpt_prepare(PowerPCCPU *cpu,
> > > +                                        SpaprMachineState *spapr,
> > > +                                        target_ulong shift)
> > > +{
> > > +    g_assert_not_reached();
> > > +}
> > > +
> > > +target_ulong softmmu_resize_hpt_commit(PowerPCCPU* cpu,
> > > +                                       SpaprMachineState *spapr,
> > > +                                       target_ulong flags,
> > > +                                       target_ulong shift)
> > > +{
> > > +    g_assert_not_reached();
> > > +}
> > I think these last two stubs should be obsoleted by the patch from
> > Lucas I already merged "hw/ppc: moved hcalls that depend on softmmu".
>=20
> They aren't,

Ah, sorry.  I forgot (again) that the resize_hpt stuff is a bit
different from the other kvm-implemented mmu hypercalls.

> when talking to him he said he wanted to use as few ifdefs as
> possible. Which do you think is better, to go back and ifdef away those
> calls, or keep the stubs? And if we keep the stubs, do we keep them here =
or
> in hw/ppc/spapr_hcall.c, along with other stubs?

Hmm.. I don't think you should need to do either.  IIUC, when in a
!TCG build, kvm_enabled() should evaluate to true at compile time.  In
which case as long as the calls to these functions are protected by an
if (!kvm_enabled()) the compiler should be able to just figure it out
without stubs.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--S/BxmolPx4ssU+eh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCh6K8ACgkQbDjKyiDZ
s5IDgBAAzCp17vppkAzEwyFWavLHBbzJDxN5/oIR+9T16wHVdkNJ1tQ5PT4KM3e9
3U2ZPOqbcoQUfg8r0SJ1QyzJIQ6YT/dt8lip7j2j+Er7z0h1hvOK6COrUY29O9Zh
BwotWwtAYUVhxUhIbv89PUQgSDs+91J1MbY1IH8X9V52ovZTD0R+DTV00TomHe6T
k+dx4oeFw0J6ypOHeyEU7yJW7KvBucSAj6L1WMjLkiiBa0pbB+ruBYl/2FruKYbr
cc4A6tDUq7OsbtlQjxSEeCChZb3A3R9iJ0RI5EZ7zXnEkrRlormQTbPPXwn6HyFD
5/zXpxphPn1nY4KgEioDubW+VyMCOfw9Bbxd7wj3pgQbY0VskgmevZ4fU1i9LNJj
Yxx2ET5qwTnsysJxrzJcfNsjvzAJRXIrwBXkAsLCvIWLxrsPuEwFEY0D3JLvygGl
2lzhkeKf3fO+YLH5fp4d68GQQnVekk2GIyEtLeS7kWFMNyAbGye42fVrA+ILwYyY
l4ZJw7ILL39d4OXX8qpkmTMXgvY61hOLPp9kjxJL15JxIpoOnfEE2ZhyPtbvLGLE
ikwS2lY0jpSFv43RBK2CWfFVyLVzG54Q47jDFVmT/CIvYoipruVD4VBsH7ucbWhN
DXJLni2rAlxOz3fowsMOiDNS5l9NfXCAajrMr2PLq4NM2WAVrbg=
=GCMB
-----END PGP SIGNATURE-----

--S/BxmolPx4ssU+eh--

