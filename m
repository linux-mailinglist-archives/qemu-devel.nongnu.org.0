Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2364338234F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 06:15:47 +0200 (CEST)
Received: from localhost ([::1]:51616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liUfS-0003IO-7T
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 00:15:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1liUa9-0004YJ-UA; Mon, 17 May 2021 00:10:17 -0400
Received: from ozlabs.org ([203.11.71.1]:37739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1liUa6-000282-Kd; Mon, 17 May 2021 00:10:17 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fk5JK27WNz9sWc; Mon, 17 May 2021 14:10:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621224609;
 bh=krkexf5H3iNAIhaAtebRYlIx7ZUp/BSurw+J0ApgUMQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bd1iwwRcOT8F70NEWMtfICnI1F7vKfxm0ruznkkzEfX6ALXH81S4K9g8eQ70MGYsL
 OShR4kyo2tcL2RyhohNgmeVf/yKd/npor+lfHmnn15dwGIkV2ZClN1cz/6oodhUCmv
 TJY7TAfsaYpHeI2wRsx6h14JIBW8eSOpKujfVbCI=
Date: Mon, 17 May 2021 14:10:02 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Subject: Re: [RFC PATCH 08/11] target/ppc: wrapped some TCG only logic with
 ifdefs
Message-ID: <YKHsmsdJx2MKKLe/@yekko>
References: <20210512140813.112884-1-bruno.larsen@eldorado.org.br>
 <20210512140813.112884-9-bruno.larsen@eldorado.org.br>
 <40d53a3b-ca4b-0656-0b64-15ded89b3315@linaro.org>
 <4aab8498-580c-cdb3-9c87-b47d5e1ff33d@eldorado.org.br>
 <b5d3e93f-8324-c21f-4ec3-feb162be455b@eldorado.org.br>
 <81666d8f-e261-d13d-3f10-af52ea0edfa9@linaro.org>
 <b32575a0-07b6-1819-1dec-525277c98cb1@eldorado.org.br>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tNex0MqgaefgS7Mx"
Content-Disposition: inline
In-Reply-To: <b32575a0-07b6-1819-1dec-525277c98cb1@eldorado.org.br>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
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
Cc: farosas@linux.ibm.com, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, lucas.araujo@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, luis.pires@eldorado.org.br
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--tNex0MqgaefgS7Mx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 14, 2021 at 01:22:48PM -0300, Bruno Piazera Larsen wrote:
>=20
> On 14/05/2021 11:44, Richard Henderson wrote:
> > On 5/14/21 8:29 AM, Bruno Piazera Larsen wrote:
> > >=20
> > > On 12/05/2021 15:57, Bruno Piazera Larsen wrote:
> > > > On 12/05/2021 15:33, Richard Henderson wrote:
> > > > > On 5/12/21 9:08 AM, Bruno Larsen (billionai) wrote:
> > > > > > diff --git a/include/exec/helper-proto.h
> > > > > > b/include/exec/helper-proto.h
> > > > > > index ba100793a7..ce287222ee 100644
> > > > > > --- a/include/exec/helper-proto.h
> > > > > > +++ b/include/exec/helper-proto.h
> > > > > > @@ -38,7 +38,9 @@ dh_ctype(ret) HELPER(name)
> > > > > > (dh_ctype(t1), dh_ctype(t2), dh_ctype(t3), \
> > > > > > =A0 #define IN_HELPER_PROTO
> > > > > > =A0 =A0 #include "helper.h"
> > > > > > +#ifdef CONFIG_TCG
> > > > > > =A0 #include "trace/generated-helpers.h"
> > > > > > +#endif
> > > > > > =A0 #include "accel/tcg/tcg-runtime.h"
> > > > > > =A0 #include "accel/tcg/plugin-helpers.h"
> > > > >=20
> > > > > Um.. this file is exclusively TCG already.
> > > > > Are you missing some use of helper_foo()?
> > > > A lot of files that we are compiling (mainly mmu-*, excp_helper
> > > > and gdbstub IIRC). We could comb through all of them and remove
> > > > all declarations of helpers and wrap the inclusion of
> > > > helper-proto itself in ifdefs, but it felt unnecessarily long.
> > > > If it is preferable, we can do it.
> > > >=20
> > > So, I just looked and we'd need to change excp_helper.c and
> > > mmu-hash64.c, encasing 14 and 8 helper_foo() declarations. Is it
> > > better to work on those 2 files, or to change helper-proto?
> >=20
> > Let's work on excp_helper.c and mmu-hash64.c.
> >=20
> > For excp_helper.c, ideally everything in there would be tcg related.=A0
> > Either explicitly as helper_foo() or by being one of the TCGCPUOps
> > functions like ppc_cpu_exec_interrupt.
>=20
> Removing excp_helper.c gives linker errors for the functions:
>=20
> * ppc_cpu_do_system_reset, on hw/ppc/pnv.c and hw/ppc/spapr.c

Oof, that's a bit tricky.  We definitely do need this system reset
injection for KVM as well as TCG.  Unfortunately it calls into
powerpc_excp() which I think has a bunch of TCG specific stuff as
well.

Long term, I think the thing would be to remove the giant ugly
multiplexer in powerpc_excp() in favour of different entry points.
But that's a big job.

Short term, littering it with ifdefs might be the least worst we can
do.  Richard, any better ideas?


> * ppc_do_cpu_interrupt, on hw/ppc/spapr_events.c and target/ppc/kvm.c, and
> from what was discussed on the IRC this should still be compiled

Similar situation to above, but much easier because it doesn't go
through the giant multiplexer.
>=20
>=20
> I think ppc_do_cpu_interrupt could go to cpu.c, but no clue where the oth=
ers
> should go.

Yes, moving ppc_cpu_do_interrupt() to common code is the right call.

>=20
> >=20
> > For mmu-hash64.c... I guess the easiest thing in the short term is to
> > put big ifdefs around helper_slbi{a,e,eg}.=A0 Or they could be moved to
> > mmu_helper.c, with slb_lookup declared in mmu-hash64.h.
> >=20
> The ifdefs are easy enough, and not compiling it gives way too many linker
> errors. Moving the helpers and static functions sounds the cleanest thoug=
h,
> so I'll look into it while I wait for the excp_helper help
> >=20
> > r~

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--tNex0MqgaefgS7Mx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmCh7JoACgkQbDjKyiDZ
s5L1qQ/7BpHIx3qNedyc7n32ri25xtHHRG9BtcA2ZtG4d/R1oTZ1pMD79QpgrAQE
rl3dzqkc742VatCIoNgQG7IoYXrwdXtSqZen17IpsahJhIWH3ugutTC9W0YovVS3
cJyOl0771YjyqipdaXYgGdPrgPrnjaVYXjjGOLZS9lqaHVDCswrTTSHBV0waVR/3
PhPg9qNPdyTmvFLqelzClQJPaBmdY06A5TOnGnEKJtoD/THOZT94zsvKSJOMy2o1
0Z5rnLFkt1vXN234yBpJeckIBR1431yrS8fTBCKaat5Fr/ir81C0abPsTocGe1nZ
kLihPEPeLNy6Xawo9Rw6V5gg6nketHv4AjHZv/5g0Bc57iag4X7fhovzmG5R0kAF
7lSdVXJKcMl4FQOojdQMrfFs1DEB6A3IX3pDDErSCANL8cQXoafUC6dDYNOzqKeX
c8I/mxUkRKMvwzQzoFVnUX+E89LnCwUvnddCE+rc1cfM6n8O7T/6FApUD7r+YbAD
etz5xt/Rtg/KQ7dV6yc5RKCUNkbiM7V9YEwJwBauTvJ/oVusfpE9q/5P0CtY8cMy
6LWxJS4JnFFgq2/l92m8cGych97d6sboCFMyVyinDU14XU9ZSVgtfIHEV2nQdlyi
m5NgHN7fEMsVxza2F4sSRRzabM62ceEZ5iXrbgzZyzkhjBDzfSo=
=cpS6
-----END PGP SIGNATURE-----

--tNex0MqgaefgS7Mx--

