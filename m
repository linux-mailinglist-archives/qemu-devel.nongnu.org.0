Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C013460298
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Nov 2021 01:36:55 +0100 (CET)
Received: from localhost ([::1]:35852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mr8BZ-0008Ti-IT
	for lists+qemu-devel@lfdr.de; Sat, 27 Nov 2021 19:36:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mr88C-0007ae-2i; Sat, 27 Nov 2021 19:33:25 -0500
Received: from [2404:9400:2:0:216:3eff:fee2:21ea] (port=34047
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mr887-0008SK-EU; Sat, 27 Nov 2021 19:33:23 -0500
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4J1qFw2FFCz4xcK; Sun, 28 Nov 2021 11:33:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1638059588;
 bh=FaAHQRiiio7QZDDdwzdTbGtAm+Ce+UACl/2EgSGXj7U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A6Kf0WJk8K77SGa5lYxnAs1eduLQLuRlI6M1RgRy35QxBybKGiOgPjnPAJ1xUUOVW
 xOb9PFK+XDoDOTDp71yOV+RsmomAwgeonyFBXK6MSu2Huhyg9LhkoEecEKABCyfvmh
 yJ+S3z7BdtY6blsk5YWbv9j6Hcb+xtn2zvCaD/3Q=
Date: Sat, 27 Nov 2021 23:44:34 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v3] target/ppc: fix Hash64 MMU update of PTE bit R
Message-ID: <YaIoMlbVms+6awwL@yekko>
References: <20211126193940.52513-2-leandro.lupori@eldorado.org.br>
 <YaGfX6iiNqtO8qb4@yekko>
 <8ca89779-3af1-8761-3062-5bf3b4d150ec@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5rQydqBmnGmKlfFv"
Content-Disposition: inline
In-Reply-To: <8ca89779-3af1-8761-3062-5bf3b4d150ec@kaod.org>
X-Host-Lookup-Failed: Reverse DNS lookup failed for
 2404:9400:2:0:216:3eff:fee2:21ea (failed)
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com,
 Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--5rQydqBmnGmKlfFv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 27, 2021 at 10:05:18AM +0100, C=E9dric le Goater wrote:
> On 11/27/21 04:00, David Gibson wrote:
> > On Fri, Nov 26, 2021 at 04:39:40PM -0300, Leandro Lupori wrote:
> > > When updating the R bit of a PTE, the Hash64 MMU was using a wrong by=
te
> > > offset, causing the first byte of the adjacent PTE to be corrupted.
> > > This caused a panic when booting FreeBSD, using the Hash MMU.
> > >=20
> > > Fixes: a2dd4e83e76b ("ppc/hash64: Rework R and C bit updates")
> > > Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
> > > ---
> > > Changes from v2:
> > > - Add new defines for the byte offset of PTE bit C and
> > >    HASH_PTE_SIZE_64 / 2 (pte1)
> > > - Use new defines in hash64 and spapr code
> > > ---
> > >   hw/ppc/spapr.c          | 8 ++++----
> > >   hw/ppc/spapr_softmmu.c  | 2 +-
> > >   target/ppc/mmu-hash64.c | 4 ++--
> > >   target/ppc/mmu-hash64.h | 5 +++++
> > >   4 files changed, 12 insertions(+), 7 deletions(-)
> > >=20
> > > diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> > > index 163c90388a..8ebf85bad8 100644
> > > --- a/hw/ppc/spapr.c
> > > +++ b/hw/ppc/spapr.c
> > > @@ -1414,7 +1414,7 @@ void spapr_store_hpte(PowerPCCPU *cpu, hwaddr p=
tex,
> > >           kvmppc_write_hpte(ptex, pte0, pte1);
> > >       } else {
> > >           if (pte0 & HPTE64_V_VALID) {
> > > -            stq_p(spapr->htab + offset + HASH_PTE_SIZE_64 / 2, pte1);
> > > +            stq_p(spapr->htab + offset + HPTE64_R_BYTE_OFFSET, pte1);
> >=20
> > Urgh.. so, initially I thought this was wrong because I was confusing
> > HPTE64_R_BYTE_OFFSET with HPTE64_R_R_BYTE_OFFSET.  I doubt I'd be the
> > only one.
> >=20
> > Calling something a BYTE_OFFSET then doing an stq to it is pretty
> > misleading I think.  WORD1_OFFSET or R_WORD_OFFSET might be better?
>=20
> How about (inspired from XIVE) :
>=20
>  #define HPTE64_W1    (HASH_PTE_SIZE_64 / 2)
>  #define HPTE64_W1_R  14 // or HPTE64_W1 + 6
>  #define HPTE64_W1_C  15 // or HPTE64_W1 + 7

Good enough.

> Really these should be bitfields describing both words like we have
> for XIVE. See include/hw/ppc/xive_regs.h. Is there a reason why ?

I don't really know what you're getting at here.

> > Or you could change these writebacks to byte writes, as powernv has
> > already been changed.
>=20
> That's a bigger change. It depends if we want this fix for 6.2 or
> 7.0.

Good point; this is a nasty memory corruption bug, so we definitely
want to fix it for 6.2.  Further cleanups can wait.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--5rQydqBmnGmKlfFv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmGiKDAACgkQbDjKyiDZ
s5LGXQ//ajmE6G3xoteVg9wH5cLqnex0QEVc93go9pfcXQqgF4YnD2zeEfF/6flb
AG65G/9tnqJCdh3OaM1FIEqCb07kqxSwGAKuRYuzybKji1gOFe9qKyhay2JZ/W3y
Xofwh3h6IliFWinZsZebQlh86+NNRO1oY3nWaJQnmUfsd5FbdTVzooWKeJpSyDvB
oWs6pr12kIghgdT44KIYAB4T+dQWGW9BFopMKGHI/7lTq8ewJlCuhLVJf9OHADc8
00PoUnk73xlXrok/sMS1KfN9JWDi/Ma8lm7n0BoDtClYwYfdqLM7PWN3P1XfX0aS
yatMIGZBxN2Pzob/KSibW1F23NvLvka6+hs85u+s7Ymf9BsNXisDZKqJoBQmUYgD
8iPjVZVCPJU8fRdFRDs2msaTOF9yq+p+rIC+vKKkv/s0PpPrbb6hW25yiOeDQtb1
SBULlkNvCmEhVUKwmXlZaSQgNXerh8QTnuYfqEJE3Vu73l96agfMxA7WlpJrzGZR
GXbTPKBh2AjO9wjEmwMYZXP+uLtHbxC9DcWZnKeJjPvJDzCC/Hea2ZYcKQx13jae
JmDWstAxpE6VN/ak5jvAAWK379gsE38o+E3lPI6fUUq6a3Fz1UpOQKB80TNsbvTu
BAPt73gPtEKzpoJr4C32V+J+hnFTIPJGLa5GxeC42sMVK5H45ho=
=ZvzA
-----END PGP SIGNATURE-----

--5rQydqBmnGmKlfFv--

