Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 440CA3BF475
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 06:11:28 +0200 (CEST)
Received: from localhost ([::1]:58090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1LNn-0000GY-AR
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 00:11:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1LFV-0001QD-Ie
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 00:02:53 -0400
Received: from ozlabs.org ([203.11.71.1]:60911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1LFR-0004eL-Bw
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 00:02:53 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GL2gk3MBXz9sWq; Thu,  8 Jul 2021 14:02:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625716962;
 bh=4RS8ROM9basfpXUHSYwWPCOWe0knsW7kdislQqJNHQg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mKfjkAtuKgSSDKLy5aFoLuxK0Vk/L03sS/2pbsu8VgbEttbZNQ3rLd6b//ik/t8pG
 qK9Vr6Ybj9HtMT3sxCFVFAl0nFO3uw6S4SInM4O/3hszE1OZTF2qn9+syqhGM5T+t/
 KwRwDuyIplhlLjCv69PpcQfqA6J80RWm+f2VOTPQ=
Date: Thu, 8 Jul 2021 12:40:59 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH 2/2] docs/system: ppc: Update ppce500 documentation with
 eTSEC support
Message-ID: <YOZlu+5tMFKaBUQs@yekko>
References: <20210706043124.1871866-1-bmeng.cn@gmail.com>
 <20210706043124.1871866-2-bmeng.cn@gmail.com>
 <YOZNo9N0hpcVRV6Q@yekko>
 <CAEUhbmWs=F7a4Ox7KZ-F9eBe81Ysh+Jw9HqFRyd4AC28Z5LQqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ECHMqSco58dBV2SG"
Content-Disposition: inline
In-Reply-To: <CAEUhbmWs=F7a4Ox7KZ-F9eBe81Ysh+Jw9HqFRyd4AC28Z5LQqg@mail.gmail.com>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ECHMqSco58dBV2SG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 08, 2021 at 09:22:48AM +0800, Bin Meng wrote:
> Hi David,
>=20
> On Thu, Jul 8, 2021 at 9:08 AM David Gibson <david@gibson.dropbear.id.au>=
 wrote:
> >
> > On Tue, Jul 06, 2021 at 12:31:24PM +0800, Bin Meng wrote:
> > > This adds eTSEC support to the PowerPC `ppce500` machine documentatio=
n.
> > >
> > > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> >
> > Applied to ppc-for-6.1, thanks.
>=20
> Thanks!
>=20
> Are both 2 patches applied, or only this one?

Both, sorry I wasn't clear.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--ECHMqSco58dBV2SG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmDmZbsACgkQbDjKyiDZ
s5LQzQ//aV0dQnnuL+vylj69b6kaH10dhw1RIcF6fHnYG1iP9c3IX/BIm+IawIeR
t3b/v+GXKye8CTnQuw7K2MVce2S8BR6Q6tUfZnmOvThZrKWX0xt6q8BTf5KbpPHV
1g7aKZAtAh5dBt0cVcYZVCExjxP01h9/tFG6hNfsHyL/jsPZogoq7+I3YyWNQ3Gm
lSoFg5D13JGTKtSBGxbbPsgm/cpqw9jBhe+2Q25xZrNBfDZo3jOXpGpQG8+5Mns/
TG9NvE5P1rYjkrxXM0JXtyhn0WtEcJP/nd5h4BmjnPQaa7jHBsHzs95kyEsqwbsO
8MICWLQvpf2iRqe6p/PZ75qUgGlRKqXGGOX6OKeeI79Wfp8Eu9t223otqPWorkBC
pCRhpFgi+L4mBnQbjWcYKTsRh7oIBfPYWqXO39Yt6+M7XKv1JSsNvCvd24r6TmmG
XGNCYWvAeVV3Ss/m6jmWZEXm5HtSkH9VDWVKkQtw4Gpe3aR3S0ci/fbd7PlraCIH
KqxglUqte32lIdP8GnUgrrimbuWu1MSpkyIqMQmgHMlYOW45wBoNphjrwUrwfrWH
5sdC3iUuQZKrp6UgrkL03SE6KSk0LIFnMEnIkZzIZB5fJHCacxYWWrF2eX86ugmO
N/HuVMENMC0hwbMvRwliw42YmzdqseBhGiPeyLOjeW7Gc5eWzjI=
=3GST
-----END PGP SIGNATURE-----

--ECHMqSco58dBV2SG--

