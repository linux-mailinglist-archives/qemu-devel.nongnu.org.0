Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCBE34FA4B
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 09:32:30 +0200 (CEST)
Received: from localhost ([::1]:32784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRVL3-0003pw-6B
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 03:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1lRVJT-00039R-OC; Wed, 31 Mar 2021 03:30:51 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:35595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1lRVJN-0006cp-FG; Wed, 31 Mar 2021 03:30:51 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.197])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id B69F6961FDDF;
 Wed, 31 Mar 2021 09:30:42 +0200 (CEST)
Received: from kaod.org (37.59.142.100) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 31 Mar
 2021 09:30:42 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003fbe5f0e3-c0ea-452d-a226-a2f12fecd0b4,
 9D8442807461E38AC8E896D56D3346AE12FD8989) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Wed, 31 Mar 2021 09:30:40 +0200
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v5 02/10] target/ppc: Disconnect hflags from MSR
Message-ID: <20210331093040.6f618ad4@bahia.lan>
In-Reply-To: <YGP+3m96lwZrMxwU@yekko.fritz.box>
References: <20210323184340.619757-1-richard.henderson@linaro.org>
 <20210323184340.619757-3-richard.henderson@linaro.org>
 <YFqBtsijRRcEBB/k@yekko.fritz.box>
 <20210329150522.1b00607d@bahia.lan>
 <d0221e19-6c8b-6cc3-c4aa-2d5fff4ecb8b@linaro.org>
 <YGKvDOCtfbj0avYF@yekko.fritz.box>
 <c368bcc2-3aa0-608e-c596-b7c9df1923e3@linaro.org>
 <YGO9oklIrjN7O0f2@yekko.fritz.box>
 <20210331060427.16984110@bahia.lan>
 <YGP+3m96lwZrMxwU@yekko.fritz.box>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+C9aCxDHAplmbNYUd_F6fvj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 630cf38f-472d-4dca-b244-aad46cac5f22
X-Ovh-Tracer-Id: 2675701132829301155
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudeiuddguddulecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtghisehgtderreertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigfeljefgvedthfejvdduudefudffgeehleefgeeiveegudffueelhfelvedtleenucffohhmrghinhepghhithhlrggsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ivan Warren <ivan@vmfacility.fr>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/+C9aCxDHAplmbNYUd_F6fvj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 31 Mar 2021 15:47:26 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

> On Wed, Mar 31, 2021 at 06:04:27AM +0200, Greg Kurz wrote:
> > On Wed, 31 Mar 2021 11:09:06 +1100
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> >=20
> > > On Tue, Mar 30, 2021 at 08:01:13AM -0700, Richard Henderson wrote:
> > > > On 3/29/21 10:54 PM, David Gibson wrote:
> > > > >    B) Just the hflags patches from my / Richard's tree
> > > > >       https://gitlab.com/dgibson/qemu/-/pipelines/278497244
> > > >=20
> > > > Look closer at this one -- it's an s390x test that's failing:
> > > >=20
> >=20
> > I've been seeing errors with s390x as well in CI but I couldn't
> > reproduce locally... and of course, now it seems I cannot
> > reproduce locally with ppc64abi32 either :-\
>=20
> Huh.  Well supporting the idea that the issues I've seen on gitlab
> were just bad luck, I've now gotten a clean check with the hflags
> patches... bug only on my ppc-for-6.1 branch.
>=20
> The ppc64 bug that Greg was seeing still makes me nervous, as does the
> failures which we saw at one point which showed that new hflags assert
> explicitly failing.
>=20
> Since the hflags stuff is of moderate complexity and is a bug fix,
> it's not a regression fix.  So, I'm going to postpone that until
> ppc-for-6.1, and move ahead with this PR without it.
>=20
> Richard - the remaining possible problem with the hflags stuff seems
> to manifest with the assert failing in the last patch.  However, I'm
> guess that's just exposing some more subtle problem introduced by an
> earlier patch.  Any chance you could re-order the series to insert the
> assert near the beginning, which might give us a better way of
> bisecting if this shows up again.
>=20
> Greg, if this shows up again for you locally, can you please try to
> track it down.
>=20

Will do.

Cheers,

--
Greg

--Sig_/+C9aCxDHAplmbNYUd_F6fvj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEtIKLr5QxQM7yo0kQcdTV5YIvc9YFAmBkJSAACgkQcdTV5YIv
c9b/Xg//WcrfrM1Mj5fjSLb6T5uPUB8m1p1VDVAnY2zrOwwHZc0JX1RM3/v+UWZl
FAcGO1VfcUzLheZQh0mkjS0Q+ciRAOmpjoOURD6+tr2mM+q67NlI2BZfeWtYloRL
qNy8+eEHHx2MYHH9106NETAw72LJyqGT6Uz1zUJN+ejuCNOUnTGlsh+QpRc442ON
HcztEHU2fVWYUBibbgZZYC1WjSF+qD7ZCgS+HotdPkgDwLcDbymhDCTk9qwuK0yq
63Qm+8YIBPDOkmgQMuPpfGSA6sDTjpDAFnnzwe1q6vhZwNFDuvXCKMW5/Ab8SFVm
nn8wWAug1T8fhJ+6FVWKAbNcFwf4Hx3VFf/0DgVPZ5ogLss6au2tNEVegZ5+K5im
FA54sYnKptiuhRPBKukWm7jp1R7RG6S1l5HLr/G6oYNqJuhj5J33IlSUvla8zVJn
Acno7sTdUFmjF/+3ZZwnMGcYLsac7oVHYAHEtRakJ5tQ+YxUmtzoLDqBVhvKUfmt
YNYgPzs6mIOzxCAmyG9WpZTiaRm91XesJ4Lu4E3/DC3+M800MP6lAwxS8XhKfopK
JlLTHILh9mQOLGXzFdJYzy0uUhCfnuZlSC0hs2Nf80c4dCfupmhtuN+jwH0qF3W6
aqEMO5qqs0BdJ2zajWB3q5m9e12v06QvWcpvB4bhOgsOKEJnwWs=
=I96l
-----END PGP SIGNATURE-----

--Sig_/+C9aCxDHAplmbNYUd_F6fvj--

