Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDEB412EB4
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 08:40:47 +0200 (CEST)
Received: from localhost ([::1]:53890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSZSO-0004bn-VE
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 02:40:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mSZM6-0002JG-2m
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:34:14 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:55513 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mSZM2-0002xK-TY
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:34:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1632206039;
 bh=Km9b16jdqJgCcYNFA23dlseZmCDAd/Vj2a7DK4ucroo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k5Zrc0Nq0webxi6LCROpsE7F2kWEeFY7xcDfqdzHuCq073trL9OQ4lKxk/il+ASNO
 +qVuSv6ZGVVOvf6VhMtAGEGGj1ZaJuqUJlcA5ai+jjGj7eTbQAXjcPFu38Low0YNjI
 lb1WuI2k0dvac2aEKvKtfYZVePOa5vguqfysak3Y=
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4HDBTg2Mg6z9t0k; Tue, 21 Sep 2021 16:33:59 +1000 (AEST)
Date: Tue, 21 Sep 2021 15:57:23 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Rust in Qemu BoF followup: Rust vs. qemu platform support
Message-ID: <YUl0Q11+lh5/w4qa@yekko>
References: <YURYvaOpya498Xx2@yekko> <87k0jfh88i.fsf@redhat.com>
 <CAJ+F1CJJvqVQrG5iPXV2s7oLbduHfAhHs0pHdZ8XbxLkNi42VQ@mail.gmail.com>
 <YUR2BjppxkBo8mD0@yekko>
 <dc2df310-ee28-a912-3aad-4d3e38974182@linaro.org>
 <YUgC8HThCulgUFcB@yekko>
 <CAFEAcA8kd9h32eoXaFVQjvf1hzOhw6Bky_Nkfa5vhsPw=zG45w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EdlBeWmJ12xspaUS"
Content-Disposition: inline
In-Reply-To: <CAFEAcA8kd9h32eoXaFVQjvf1hzOhw6Bky_Nkfa5vhsPw=zG45w@mail.gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Sergio Lopez <slp@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, QEMU <qemu-devel@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--EdlBeWmJ12xspaUS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2021 at 09:13:44AM +0100, Peter Maydell wrote:
> On Mon, 20 Sept 2021 at 06:07, David Gibson <david@gibson.dropbear.id.au>=
 wrote:
> > On Sat, Sep 18, 2021 at 01:01:35PM -0700, Richard Henderson wrote:
> > > We dropped host support for sparcv8 (true 32-bit) a long time ago.
> > > We only support sparcv9 in ilp32 (sparcv8plus) and lp64 (sparc64).
> >
> > We really need to update
> > https://qemu-project.gitlab.io/qemu/about/build-platforms.html
> > to clarify this then.  I don't really know what the procedures are for
> > updating the website.
>=20
> It's automatically updated by building the documentation from current
> head-of-git, so the answer is "submit a patch to change
> docs/about/build-platforms.rst". (That's a pretty new file, and
> the stuff about CPU architectures has gone in only very recently,
> so it's not unsurprising if Marc-Andr=E9 and I got some things wrong:
> we were just looking through tcg/ to see what it seemed to have
> support for.)

Oh.. yeah.. that's pretty obvious now I look at it </sheepish>

>=20
> The structure of the build-platforms page currently assumes that
> "supported host CPU architectures" and "supported host OSes" are
> basically orthogonal, because historically the nature of QEMU has
> been that this is more-or-less true. If we want to try to be more
> specific about that then we'd need to re-jig things.

Yeah, I think we kind of need to do that.  Even apart from the Rust
support thing, I think it would help to clarify which build platforms
are merely kind of unusual versus which are very unusual (obscure OS *
obscure ISA).

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--EdlBeWmJ12xspaUS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmFJdEEACgkQbDjKyiDZ
s5I/XRAAhDnUf49cmCGOqrM5OiXOmpMSzHVsKgpep1M3OhZ9RGCT3eH1EORFKcNN
3aiKqnicfK5v5jNPH4n7N0DD+gSAcCk8yTr6koJmNE7cdv/qvWZOJje/W96rL+yH
K/WNablzIo1+/707IdYUhc/FS8ee4cIpnWK6BVCUxYb6GX8tboxmNRaxhNTet0Oo
jp2xAYYoyKPlw4N5q1xcUrdqxt89KGwhGrCIs7b9oKSGrBQ4Si8Kgdhb3m1QLX/+
F85vQOnpZ4HC2OcEsZ6GaZn+AGw0zGesbG9tTtIeBhOmfODEDL5XWOFxASSZrMWO
m26xBAS5c9Skr9g8Pu0lhM1fIRM50iUHV3W3Up+KBMpCn6sxCpiFINviR5Uy40GJ
Q8Vw9inq1OSkGLtp3Cv1IOvE/RaD1tlN2q5gHuHUDTxNj7ZvE/8Vpgb42a9N7m23
vx2ZP1TqNnh15j5tlL37z51dy9LtYPrHPGKQzlh5hpaz0VLe7RPxYApdmQdGRcJf
EEPVphY/Q8I4LFH3UZqSzn/esajyp732+89XdDfx6WfLbg1IKoDWXSiIjaGyD26/
/cxIRXcTwnrI63CR/TnuTj+0PjmT2Qb64czEv+pA8CczSLzHcnGb5n2QcnIIDV8J
+kANxk8T4EYpnQQoBIW/da/ha9f7y6bB8ACbrzfd+l+HPnFOCng=
=wLWf
-----END PGP SIGNATURE-----

--EdlBeWmJ12xspaUS--

