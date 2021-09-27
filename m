Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7457418E6A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 06:40:04 +0200 (CEST)
Received: from localhost ([::1]:40044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUiQt-0008O8-Mc
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 00:40:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mUiI3-0004D9-UG; Mon, 27 Sep 2021 00:30:56 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:56543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mUiI0-0002g7-RG; Mon, 27 Sep 2021 00:30:55 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HHqSk0fndz4xbV; Mon, 27 Sep 2021 14:30:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632717046;
 bh=Ivdti1UTLUM4ELt0uNWkY6gDR4Bc+twcO9caZxqKbSM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kBy5FidVMxRSgqN6VzgdJbl02FllTHxx5AHnzSK6Eq42KaCaXct4mAbEjtIpTmO7F
 /5kYqqyLSYn7tcTm92r/tg9iAOZDfxsc4oapp9wYmp/JwYCrxuEv0s3D238hV2LohH
 a9r5RVhbR8fH2x8IHCP+QCelvql0usf2SjPy2s0A=
Date: Mon, 27 Sep 2021 14:30:39 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [RESEND PATCH 1/3] hw/intc: openpic: Correct the reset value of
 IPIDR for FSL chipset
Message-ID: <YVFI78c5xctdjEOC@yekko>
References: <20210918032653.646370-1-bin.meng@windriver.com>
 <YUlQo68s9mxISwEs@yekko>
 <c329c9a4-0662-4a4f-70fc-b3eda07cb149@amsat.org>
 <CAEUhbmVn3VeGCV25jSXk4G6CRfFuBCX+wFbFKZNPoNKPakEZWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4Rpn6unSL9fzJ6SQ"
Content-Disposition: inline
In-Reply-To: <CAEUhbmVn3VeGCV25jSXk4G6CRfFuBCX+wFbFKZNPoNKPakEZWA@mail.gmail.com>
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
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
Cc: Maarten Koning <maarten.koning@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--4Rpn6unSL9fzJ6SQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 23, 2021 at 01:33:44PM +0800, Bin Meng wrote:
> On Tue, Sep 21, 2021 at 4:13 PM Philippe Mathieu-Daud=E9 <f4bug@amsat.org=
> wrote:
> >
> > On 9/21/21 05:25, David Gibson wrote:
> > > On Sat, Sep 18, 2021 at 11:26:51AM +0800, Bin Meng wrote:
> > >> The reset value of IPIDR should be zero for Freescale chipset, per
> > >> the following 2 manuals I checked:
> > >>
> > >> - P2020RM (https://www.nxp.com/webapp/Download?colCode=3DP2020RM)
> > >> - P4080RM (https://www.nxp.com/webapp/Download?colCode=3DP4080RM)
> > >>
> > >> Currently it is set to 1, which leaves the IPI enabled on core 0
> > >> after power-on reset. Such may cause unexpected interrupt to be
> > >> delivered to core 0 if the IPI is triggered from core 0 to other
> > >> cores later.
> > >>
> > >> Fixes: ffd5e9fe0276 ("openpic: Reset IRQ source private members")
> > >> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/584
> > >> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > >
> > > Since these patches are very simple and look sensible, I've applied
> > > them to ppc-for-6.2.
> > >
> > > However, you should note that Greg and I are both moving into other
> > > areas and don't have much capacity for ppc maintainership any more.
> > > Therefore I'll shortly be sending some MAINTAINERS updates moving
> > > openpic (amongst other things) to "Orphan" status.
> >
> > I'm not trying to force Bin to become (yet) another maintainer,
> > but from his previous contributions, he demonstrated a very good
> > knowledge of embedded PowerPC ISA & chipsets, his patches have good
> > quality and description, and he is consistent over time in his
> > contributions. So if he is interested, I'd vouch for him as a
> > maintainer for embedded ppc. Now up to him, his time and/or employer :)
> >
>=20
> Thanks Philippe for the offer.
>=20
> David, is this the whole PowerPC domain will become un-maintained
> soon, or is this just openpic and a few other things like a subset of
> PowerPC?

Essentially it's all of PowerPC, though we hope to make it a gradual
transition, rather than us dumping everything all at once.  We're
starting off with offloading the smaller sub-platforms, including
e500.

> I got extensive working experience on Freescale/AMCC PowerPC chipset
> in the past, but I never touched anything on the Mac stuff with IBM
> chip. And I am not sure if I have enough time to do the work :(

I'm not suggesting you take over all of ppc.  However, if you could
take e500, that could prevent it from being orphaned.  My latest spin
of these maintainers changes moves the openpic_kvm.c file under e500
as well, since that seems to be the only user.  The rest of openpic.c
is moving to the Mac platforms, maintainer by Mark Cave-Ayland.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--4Rpn6unSL9fzJ6SQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFRSO8ACgkQbDjKyiDZ
s5K3XRAAhjXqALbWE8lzroekdfFF8v5ZwGjrsv7JXaE+60IG8/vpXTgYD8HuavrM
1WJkoGEFRfZ8VsEMf5bCOHUh5JOw8btLf1t7i/uLt3vLOcrFB/19w21kRj6RtlPH
D7ACDwwn19c4L0MZlv/BVFqNDsimZ4UlfqDo62kmZhEWcF2Xu9hCjQgUYWSsRWZi
kPE5ECzylTA8sm3KpNp9rO7QjKgCixFMTdskU98KJYoclZvLoPRvzOyl6nOIbEPn
NXPJVkNwk4e2L53pCxkNiBzMQ1sS02iiPk4S+YizqY6MF1G4CIPBWCY3VTaTTSSo
mHUdk8c7ApnIycDC98NeFXF0bhfqxiKHusgC1ybw4NHdSWdIzfrG2UrNeEl7i1lB
+SQmfiMOV82BlmA0mSWgSQz2wP+XH47yxVKYqczcMQrQKgx2KeM5AJcgUI8HUUR1
W2aPfHPcj/7jF+RzwhvqGuEty1ZTCCjq9wdiVWUaMI+Fvn2EExtvHLG3acGiMqTP
0z6F53T05NTuCLbtRZcVhbiJLne+Vz66BVoanRIbZOIA2sGRmwTw7uaP6BS/hg86
FzP+fV9LOtSgtCjLtgJVCBUk95M+dXDvj9JML5uOOaZE6KUitvTLHZWFbjluOMEa
YdGKxN6S2uuDFNJxTNsERaFmzLS+D/DPyHzTmSv3BvYJmoOCTks=
=v1S7
-----END PGP SIGNATURE-----

--4Rpn6unSL9fzJ6SQ--

