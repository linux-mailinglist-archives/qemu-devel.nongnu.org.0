Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD41316564
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 12:42:17 +0100 (CET)
Received: from localhost ([::1]:47946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9nsu-0000Mb-3d
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 06:42:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9noE-0006gD-6q; Wed, 10 Feb 2021 06:37:26 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:48159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9noA-0005if-Nf; Wed, 10 Feb 2021 06:37:26 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id D4CFBD47;
 Wed, 10 Feb 2021 06:37:17 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 10 Feb 2021 06:37:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=qFwNz5+K/6/ef7BYIAQVwpN+VcN
 /nLeYxoEkHNG8iFg=; b=mME2dhtAP1ja1091deJ5rtWjn5FbTy0sSxXs+DdA5V0
 qQ1uCwzDw/dzEbckuWTuRhMgVBDJNR2auOHs5yV1AkwRNA+TvPeE6Y7aJ20y5iL0
 jFwRFWe1TfphIsxdfJ5v3jdCpDBUDbN1mNqTYDnul6oi50yJP9dlkagZTizdbfQK
 To5XhSPBuUW9MkuHC5vnJhu9km9v5eZD9aMqli5xYjuSy5ttz+/BMCyGVxGGSyT6
 e59LDcws+KPqZeJ3jOnkA3zJgI6/3bqIquFb2sQpyj5xGhXI66qcwJCqvpA7K344
 NsgOAlEw/gkDV05blktxZ8in5KkHKAzFfnz3YyEV1Tw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=qFwNz5
 +K/6/ef7BYIAQVwpN+VcN/nLeYxoEkHNG8iFg=; b=kHNk+/xbT70fc3ApiyLn5n
 IAWhuCwKxFl6Feg3WsD4Fjqyn1y3lRDl78ZbgY9mNX0xe2d4wp5uCPM5mr31mwz7
 YWX5qfn7Ln5ZoH8X4qImqby1Ut3Tlx0Zr/3Auc5RRXRjbaDXJ3Eiej1BG18cKYM8
 HKy6lXNAnc0Sf65ed3X1YNxDplEs07aNNLhiRECwDH3E+hFE0wjGC4ZVKNS2UeZx
 2r6Pk227u1860cYu2myF2TdXj/NvqVwECy/elIGJYR/o6emEUl7zEBYhBPtA2NuA
 DLB+QR3U5/jgNE+KmUKHkA2lthC08ffQyWMW9HZG4SKxvOduhXQvpBgNkEGdhcCg
 ==
X-ME-Sender: <xms:bMUjYLCuhC-fC3hHfEduihE5UgR3ArGvcwi3xCkFbKJlATIxUazKjQ>
 <xme:bMUjYBidpmIglY6s4lxtH1cQPRxxkvjZqGzWh_cmj8xAlMT7Hi8VUBjXTekahHwi1
 TKUKrtdQzmhiZnrkC8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheejgdeftdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:bMUjYGnLlEvLnG_7TPnS3NxM8DQImJoXu6ut9IfonLOVN1UXKc-dOw>
 <xmx:bMUjYNxdyrTL3wRZ7d7fh38ajMBz--j0oPB_g6MQWliEB5_BvOaFHw>
 <xmx:bMUjYARjkVV-NqPWYceYIXS507e1pUVAH4BFnSFTeFyum-P1PagZPw>
 <xmx:bcUjYPEfO-3FNOV8IMFxIKJyeYyRw17hnBgVbig6ZER7lQ_qmcYHiw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id AF583240062;
 Wed, 10 Feb 2021 06:37:15 -0500 (EST)
Date: Wed, 10 Feb 2021 12:37:13 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/block: nvme: Fix a build error in nvme_process_sq()
Message-ID: <YCPFaUxao63p/PKu@apples.localdomain>
References: <1612950879-49023-1-git-send-email-bmeng.cn@gmail.com>
 <CAEUhbmX5xjqTiOFzPMW0mpHxZHqaipGFb=0=Z1p5k7sEY-kSHg@mail.gmail.com>
 <YCO0Gy6ZKY5qGZgT@apples.localdomain>
 <CAEUhbmWB2PCYbe2Dd2Ui8C-=dE_FDjEMApDf1GkXzJe2LBQkRQ@mail.gmail.com>
 <YCO2BMwhJE/yoNav@apples.localdomain>
 <CAFEAcA-Pn1RPWuUaQ-g=80Zo1UYE=L+hGgQePaCaSsz3XxKvFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KAwkMEDbwfkN5N9O"
Content-Disposition: inline
In-Reply-To: <CAFEAcA-Pn1RPWuUaQ-g=80Zo1UYE=L+hGgQePaCaSsz3XxKvFg@mail.gmail.com>
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--KAwkMEDbwfkN5N9O
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 10 11:01, Peter Maydell wrote:
> On Wed, 10 Feb 2021 at 10:31, Klaus Jensen <its@irrelevant.dk> wrote:
> > On Feb 10 18:24, Bin Meng wrote:
> > > I am using the default GCC 5.4 on a Ubuntu 16.04 host.
> > >
> >
> > Alright. I'm actually not sure why newer compilers does not report this.
> > The warning looks reasonable.
>=20
> It's not actually ever possible for nvme_ns() to return
> NULL in this loop, because nvme_ns() will only return NULL
> if it is passed an nsid value that is 0 or > n->num_namespaces,

NvmeCtrl.namespaces is an array of pointers and some of those will most
likely be NULL (those are unallocated namespaces).

> and the loop conditions mean that we never do that. So
> we can only end up using an uninitialized result if
> n->num_namespaces is zero.
>=20
> Newer compilers tend to do deeper analysis (eg inlining a
> function like nvme_ns() here and analysing on the basis of
> what that function does), so they can identify that
> the "if (!ns) { continue; }" codepath is never taken.
> I haven't actually done the analysis but I'm guessing that
> newer compilers also manage to figure out somehow that it's not
> possible to get here with n->num_namespaces being zero.
>=20
> GCC 5.4 is not quite so sophisticated, so it can't tell.
>=20
> There does seem to be a consistent pattern in the code of
>=20
>         for (i =3D 1; i <=3D n->num_namespaces; i++) {
>             ns =3D nvme_ns(n, i);
>             if (!ns) {
>                 continue;
>             }
>             [stuff]
>         }
>=20
> Might be worth considering replacing the "if (!ns) { continue; }"
> with "assert(ns);".
>=20

As mentioned above, ns may very well be NULL (an unallocated namespace).

I know that "it's never the compiler". But in this case, wtf? If there
are no allocated namespaces, then we will actually never hit the
statement that initializes result. I just confirmed this with a
configuration without any namespaces.

The patch is good. I wonder why newer GCCs does NOT detect this. Trying
to use `result` as the first statement in the loop also does not cause a
warning. Only using the variable just before the loop triggers a
warning on this.

I'm more than happy to be schooled by compiler people about why the
compiler might be more clever than me!

--KAwkMEDbwfkN5N9O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAjxWcACgkQTeGvMW1P
DekjUAf+Mz6jXQ0l1dZtcu/lGVj2GvMW3xhHzsnQNvMf7mEkjLHDEK+ZvCTV8+dK
e6mooWIlvNrjUt3LbGFddi3qo/u7VP8F0kCiaLlVGo6XfKZ2nzClw36oDX655VQs
35X9d/2UMDw2hXHy0OH/0CRfc9HQt1JInUqC1K9JstspNsFd2YlGc37QL6nW3aFA
vOSNe5JlxAIX2ZfE0lCl6/OxncFuorMVTvU5+ojl98AFo6Vj1YqgvTwEQgm4/xZn
ROSnMBgR0VC2gP4F2SmdnE6k0kNkUrkS09DDVzn/NY63BZf2ZMBZ6UkGZXNZHIsI
ubcni3oSx9j/8lyqgW1R4pIxndU8KA==
=4jS5
-----END PGP SIGNATURE-----

--KAwkMEDbwfkN5N9O--

