Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4033163D6
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 11:30:22 +0100 (CET)
Received: from localhost ([::1]:50188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9mlI-0006M9-SU
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 05:30:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9mek-0002kF-Oc; Wed, 10 Feb 2021 05:23:34 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:36951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9mei-0008As-Et; Wed, 10 Feb 2021 05:23:34 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 40A0ACC5;
 Wed, 10 Feb 2021 05:23:28 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 10 Feb 2021 05:23:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=wj2k6v/sQwdJj49j7yRw1MJtrQC
 5UyYtHmw7KI/JESU=; b=U+Ucws5cpd/x+VIvfn4MkS+L8Ls7y8m4j5MMf9jVba0
 uMtBLXTKulHKi1ut5HLVjrn3FMBv/NBoWcTnTyLFHTCiJgipBB7pPARZD52oXEhp
 M6zyTDthxubK9HO8i0GLcoocnDE7gGJpScRMKO3uxhoQek38Kl+85hfD3LEZRz7B
 ZBCSGm0bn8ABrV2rkC5z6PLZPfYJznb+T6YgVvi0zJIH7mn4MN0X5PuScIP0lCDm
 uJzh450RBsVgUvvT8AEgWOTns1xiYVNFQ9pCaFsdZezkSgt07UJWcdh7vnkemRym
 CoTXFxyV5X81eIG6N90cNdwmapsZwJPRp8ZonoeBvKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=wj2k6v
 /sQwdJj49j7yRw1MJtrQC5UyYtHmw7KI/JESU=; b=I32du8mES85CC3oMObZXw+
 RjWHaP6in/25sZPZG2zLsIy8hSSVWEEiiCni0Rkx7OLrmEdC8pIygfy4kwkAaFBo
 vCmmshREHGNLj7WXA8zAaIxZ9jI0o6Alse6J0Qj/8gXpiydAJz4n7esatfOYhuLu
 l4Frzf2Dq8gt/HrSAX1/Fdti5L4ANjWqkUdlQUeXfy0+h8EQvnm3TlB+tlKYNuGG
 yhsyG+MinD6YyTUZkQhSQvAEyeeh1LM7ngeaBP8OTXjOd8zwZ+hbVWv0FrvGfvrQ
 SRJXba9mGJtiALD2ygiVDPYYpJgKE8x5AW/26bLfPyd/N/O0K0jL3kGoorgZp15A
 ==
X-ME-Sender: <xms:HrQjYNWfgTa0CpvZe5_FbLIVZWy3BNyzs9WqUHNFW-hHthBFe3QANg>
 <xme:HrQjYNmHHAGRizsmIJb8vUwMkHfcMknKDkwx0Z9ktm2DQ8a7YLH9nJKqBEJK__HEx
 VlaeHe21xe7tsXQy_4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheejgddugecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:HrQjYJYln3zg3XTbrJWZe1IU6f1ipEQGrfRAuOYS6RwtOP3V9O5XbA>
 <xmx:HrQjYAUxswp6CKQRr2fNYnQUwwiRnfNCZOsZxoyr3MjGZHv7x8AdRg>
 <xmx:HrQjYHkhNk9Q3AaSAI05g0C3e7fii4JsrpNv8kI-au786C8EOgzW-w>
 <xmx:H7QjYFakGtKT17bHPQgWFiqjYEueJty-finZzfzMfQ7fI6EEGbvk4A>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 371ED240057;
 Wed, 10 Feb 2021 05:23:25 -0500 (EST)
Date: Wed, 10 Feb 2021 11:23:23 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH] hw/block: nvme: Fix a build error in nvme_process_sq()
Message-ID: <YCO0Gy6ZKY5qGZgT@apples.localdomain>
References: <1612950879-49023-1-git-send-email-bmeng.cn@gmail.com>
 <CAEUhbmX5xjqTiOFzPMW0mpHxZHqaipGFb=0=Z1p5k7sEY-kSHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="a/l9yR/Dq/s8RHDe"
Content-Disposition: inline
In-Reply-To: <CAEUhbmX5xjqTiOFzPMW0mpHxZHqaipGFb=0=Z1p5k7sEY-kSHg@mail.gmail.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--a/l9yR/Dq/s8RHDe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 10 18:15, Bin Meng wrote:
> On Wed, Feb 10, 2021 at 5:54 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > Current QEMU HEAD nvme.c does not compile:
> >
> >   hw/block/nvme.c: In function =E2=80=98nvme_process_sq=E2=80=99:
>=20
> Not sure why compiler reports this error happens in nvme_process_sq()?
>=20

Yeah that is kinda wierd. Also, this went through the full CI suite.
What compiler is this?

> But it should be in nvme_get_feature(). I will update the commit message =
in v2.
>=20
> >   hw/block/nvme.c:3242:9: error: =E2=80=98result=E2=80=99 may be used u=
ninitialized in this function [-Werror=3Dmaybe-uninitialized]
> >          trace_pci_nvme_getfeat_vwcache(result ? "enabled" : "disabled"=
);
> >          ^
> >   hw/block/nvme.c:3150:14: note: =E2=80=98result=E2=80=99 was declared =
here
> >      uint32_t result;
> >               ^
> >
> > Explicitly initialize the result to fix it.
> >
> > Fixes: aa5e55e3b07e ("hw/block/nvme: open code for volatile write cache=
")
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >  hw/block/nvme.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
>=20
> Regards,
> Bin
>=20

--a/l9yR/Dq/s8RHDe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAjtBkACgkQTeGvMW1P
DekjgQgAuzwzIUAkwrjmEOaLF85w+dZSosEgo5oyFleOMlsasht7Yf/ePu3TM36q
RsqvqDoKaJGuxGSxzRW5m+kBF6Dd/e/u71b0pA//tRgn/rUpdaQtClsHsTK1p7Hg
Zzo5c+/Eb+4dqlFzvOgNE6S2Imq8wTs58Gw1zAcHJhMIEdPyaNTGKsW0LNQGVgh/
VqsVSXPmYninK96oQI8YVZQJAA+2Aqzs1c8VhOGOoJgjzPzbDHT4YPgHFNHVuItn
mbflgWVqNGIjLyba3to4i7ZMEXU1H6JiZJArHwKiqxkMVpM5LGlR+C5nNedSSc6n
OENxRkZbDnDw6/1wDSLph/hC4L86oQ==
=SXm/
-----END PGP SIGNATURE-----

--a/l9yR/Dq/s8RHDe--

