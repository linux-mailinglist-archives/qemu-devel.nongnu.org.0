Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE3D3E8AB1
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 09:03:24 +0200 (CEST)
Received: from localhost ([::1]:48152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDiGp-0004jN-LJ
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 03:03:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDi0k-0006Fm-Be; Wed, 11 Aug 2021 02:46:46 -0400
Received: from ozlabs.org ([203.11.71.1]:57343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDi0g-0002S8-E9; Wed, 11 Aug 2021 02:46:46 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Gl0j54Sz0z9sX1; Wed, 11 Aug 2021 16:46:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628664393;
 bh=SnfO59GrL3Y2DuhBIt6QMwbCRSk7s5nx7//Diuqe7Js=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kC4AFeDJvWyYdm7CQMLaZwf7hQ5n21Fu5SCdYD808RMuCNa6wNb+f68M+qzCdVq14
 GRgpff4y/0jp2cZNqEdlLvnNVkIRV+8+Cg1x26NyNuEL+r6jpKnx+Zq4pD2mMsjnhS
 B4EZG+0OCd7ZcgboD6D8d86f9T2PnBoK21d/7BEk=
Date: Wed, 11 Aug 2021 13:36:46 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 09/19] PPC64/TCG: Implement 'rfebb' instruction
Message-ID: <YRNFznayZC3AS0wT@yekko>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-10-danielhb413@gmail.com>
 <YRH3dJG5iKPGvrel@yekko>
 <df15bc5c-ee71-9cd2-bf20-77da9ec7cc11@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VpCle/evU23zLk4+"
Content-Disposition: inline
In-Reply-To: <df15bc5c-ee71-9cd2-bf20-77da9ec7cc11@gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: gustavo.romero@linaro.org, Gustavo Romero <gromero@linux.ibm.com>,
 qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--VpCle/evU23zLk4+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 10, 2021 at 04:32:35PM -0300, Daniel Henrique Barboza wrote:
>=20
>=20
> On 8/10/21 12:50 AM, David Gibson wrote:
> > On Mon, Aug 09, 2021 at 10:10:47AM -0300, Daniel Henrique Barboza wrote:
> > > From: Gustavo Romero <gromero@linux.ibm.com>
> > >=20
> > > An Event-Based Branch (EBB) allows applications to change the NIA whe=
n a
> > > event-based exception occurs. Event-based exceptions are enabled by
> > > setting the Branch Event Status and Control Register (BESCR). If the
> > > event-based exception is enabled when the exception occurs, an EBB
> > > happens.
> > >=20
> > > The EBB will:
> > >=20
> > > - set the Global Enable (GE) bit of BESCR to 0;
> > > - set bits 0-61 of the Event-Based Branch Return Register (EBBRR) to =
the
> > >    effective address of the NIA that would have executed if the EBB
> > >    didn't happen;
> > > - Instruction fetch and execution will continue in the effective addr=
ess
> > >    contained in the Event-Based Branch Handler Register (EBBHR).
> > >=20
> > > The EBB Handler will process the event and then execute the Return Fr=
om
> > > Event-Based Branch (rfebb) instruction. rfebb sets BESCR_GE and then
> > > redirects execution to the address pointed in EBBRR. This process is
> > > described in the PowerISA v3.1, Book II, Chapter 6 [1].
> > >=20
> > > This patch implements the rfebb instruction. Descriptions of all
> > > relevant BESCR bits are also added - this patch is only using BESCR_G=
E,
> > > but next patches will use the remaining bits.
> > >=20
> > > Note that we're implementing the extended rfebb mnemonic (BESCR_GE is
> > > being always set to 1). The basic rfebb instruction would accept an
> > > operand that would be used to set GE.
> > >=20
> > > [1] https://wiki.raptorcs.com/w/images/f/f5/PowerISA_public.v3.1.pdf
> > >=20
> > > CC: Gustavo Romero <gustavo.romero@linaro.org>
> > > Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
> > > Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> > > ---
> > >   target/ppc/cpu.h       | 12 ++++++++++++
> > >   target/ppc/translate.c | 21 +++++++++++++++++++++
> > >   2 files changed, 33 insertions(+)
> > >=20
> > > diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> > > index afd9cd402b..ae431e65be 100644
> > > --- a/target/ppc/cpu.h
> > > +++ b/target/ppc/cpu.h
> > > @@ -358,6 +358,18 @@ typedef struct ppc_v3_pate_t {
> > >   #define MMCR1_PMC3SEL PPC_BITMASK(48, 55)
> > >   #define MMCR1_PMC4SEL PPC_BITMASK(56, 63)
> > > +/* EBB/BESCR bits */
> > > +/* Global Enable */
> > > +#define BESCR_GE PPC_BIT(0)
> > > +/* External Event-based Exception Enable */
> > > +#define BESCR_EE PPC_BIT(30)
> > > +/* Performance Monitor Event-based Exception Enable */
> > > +#define BESCR_PME PPC_BIT(31)
> > > +/* External Event-based Exception Occurred */
> > > +#define BESCR_EEO PPC_BIT(62)
> > > +/* Performance Monitor Event-based Exception Occurred */
> > > +#define BESCR_PMEO PPC_BIT(63)
> > > +
> > >   /* LPCR bits */
> > >   #define LPCR_VPM0         PPC_BIT(0)
> > >   #define LPCR_VPM1         PPC_BIT(1)
> > > diff --git a/target/ppc/translate.c b/target/ppc/translate.c
> > > index 62356cfadf..afc254a03f 100644
> > > --- a/target/ppc/translate.c
> > > +++ b/target/ppc/translate.c
> > > @@ -2701,6 +2701,26 @@ static void gen_darn(DisasContext *ctx)
> > >           }
> > >       }
> > >   }
> > > +
> > > +/* rfebb */
> > > +static void gen_rfebb(DisasContext *ctx)
> >=20
> > Oof.. not necessarily a nack, but it would be nice to implement any
> > new instructions using the disastree path rather than the old ppc
> > specific decode logic.
>=20
>=20
> I'm not sure what is the disastree path. Is it similar to how rfscv is
> implemented?

No, it's a generic system for decoding instructions.  A few things in
POWER have been moved over to it: that's the stuff in insn64.decode
and the trans_*() functions, rather than the gen_*() functions.

So far only the 64-bit prefixed instructions + instructions that were
immediately related to them were converted.  ppc_tr_translate_insn()
attempts first to decode using decode_insn32() (which is decodetree)
then if that fails, falls back to decode_legacy().

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--VpCle/evU23zLk4+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmETRc4ACgkQbDjKyiDZ
s5LFcxAAzH7TYp02Cm21sPD12eLjlMgWDyraAFx7zkM0nrekkdEp+LD3R+TmefnW
qlTCW8rBByRiOVBWCWUdKk5xf3gYHsu4K4IZhSRD8NYY8BET9WUSerVEdep2gq7G
oIqICzgVYiTh6knqGnrrWFcTjDL+/xSPMva6RqIk4byhuBfpetIFhH1ByX2t9M8/
b2x9RPJ9UP5y8KqgYmmtZZQ8RFQcZ6Jdz/md8F5FS00AEuC1a7elTMOUAES1faUz
m3dNhzmbXrz1CUP82AP0u8jc0D5FK1A7wfrXQp2YX/ggiKT//CmnTRjtt50CfXjh
2DVsBo+AIsPX4+iwHGABH5eYc4t53K4U91hZhRdO2qZSW9NP4eVBg7ekW7S0TO9Z
mi2IQCz+5knj7WbaNOPy+H/YXEEdjIozP5iVQhnaDXyz1RRBMbriqPHoUOoInnxl
yxS7TGSu6V9lnPE0EIpWeiDGpuseJf57n3GbkjEj8xCGCyR/ORgGHERLbRqj2O3Z
qsmyModtQ2Svkm9YrWRP5qg+Xh8HXlND5JffwgOWKJQuNCWimqVA2Qg1DuYTU37k
ADmvX+zmXqa1DyCq8S17DE9bJd4OH/sSprjd474lej9t+Enz+5zsxU5KTOUbpGWs
G5Y0DhUyJsXa2XzdoiVMt2qlv3bpZn44Lh45BS6sR6CGYiP3Uko=
=tSFl
-----END PGP SIGNATURE-----

--VpCle/evU23zLk4+--

