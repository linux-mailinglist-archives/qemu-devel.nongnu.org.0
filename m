Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC771502FD1
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 22:37:12 +0200 (CEST)
Received: from localhost ([::1]:49926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfSgp-0001rN-IU
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 16:37:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nfSXg-0000Tx-9X; Fri, 15 Apr 2022 16:27:44 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:45987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nfSXd-0000nj-6G; Fri, 15 Apr 2022 16:27:43 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 45F1E3200929;
 Fri, 15 Apr 2022 16:27:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 15 Apr 2022 16:27:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1650054457; x=1650140857; bh=gE
 L7PcOwAHR4j/1mIqpXH3dxquGsOjqvcgomBmyVmiw=; b=kUzGNGkzFkqeZYAjYr
 TTKNnXAkXpYWUZIFf70mforht3HWU6DtPu6Yu32lNI7ZFYlyyHz9X77N+sS3wpMd
 9dSBZJTzyw/pl3z7QJL3j9dyauO3eeRTgbF6LhLs8U3/ecYvx+i9rTY9Ru/ICQKq
 WCz+WF4VqaQ20v2OJn5Hwg9B13ZeHD1kVUXszlrIXuSYI33VGm7tHSjD7EusJsM1
 2g25oFInAWfP/0iFhKCzPsG7tmsXF6F+hkShMFdibis1fhGs1u0+b49ml6vT1eBA
 ZNaaVthHdtxmi9r4m/U1I38Mh4kDFO6CmQdvvesvf7kBMxwzG2rYRnJZMF2MrqcJ
 /V1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650054457; x=
 1650140857; bh=gEL7PcOwAHR4j/1mIqpXH3dxquGsOjqvcgomBmyVmiw=; b=d
 1GrcLi/0zQva/tUmsHGyA21xY0E0v3THTIfHE500gFpDl26K8z87NZ2sTsKHcfBy
 Z3Mz6RXj6klBorU+ukCvfpjwuWnllkniu7qRHwYJAa+KNmRQ4quDUHJnLMcuyPdq
 tCZ29Emt+I96aJFwg8ltdxkFNTLkKfKBng/aAX/An0ip8zFo8AmZhKfCOnD9sykg
 mrsv8ft1MRupwmxmTzyIqnUXYwK4TaPoDPVBOq2FrrxUX0xsVmhMurhO1fVbh3t3
 5j6hUMfzZnXnAN1Li8cvye+4tZsgpH9Wz+DtsHO2iEGYWdejkzJRdPMzUdCEuxmb
 clNgtdHF+AnUv4av+nCUA==
X-ME-Sender: <xms:OdVZYt1k7jitY_esP0po4Qn-Tb_X-3cJ5O4mHZhFUDti1yGrhvTskw>
 <xme:OdVZYkGc0VUxNzsf9yPv4U-aB8N1tEa8cr7OsEgziCV_sI6clNjcCGZLrimVo4jDS
 WY2UuGRqo3fiWKphGM>
X-ME-Received: <xmr:OdVZYt5F7j0RNWRB-pqbsjrLOOoDX9vit4T6rt8ej5Nh9QqhS3ax2WTskEWUJHy1tMVXadDCKYc37P_Z4vs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudelhedgudehudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:OdVZYq2fxKITcxNmDKhQK1QdGlagWDWbb6-_kYmUQe7k7U-R__mUiA>
 <xmx:OdVZYgEv7Wr3IHV53aKM0tmWFhzo4rjQJwnFc6U8ssa1jD3k_qLngQ>
 <xmx:OdVZYr-FClMiAl4uxLEVxAG7am6PzGvWVYuYf17JlwirJF8PDfVh7g>
 <xmx:OdVZYlORzqgPvIagNFQaug07jDn_a5DF0umxb2wULFCLQSuf7V3i1A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Apr 2022 16:27:36 -0400 (EDT)
Date: Fri, 15 Apr 2022 22:27:34 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Dmitry Tikhov <d.tihov@yadro.com>
Subject: Re: [PATCH] hw/nvme: fix control flow statement
Message-ID: <YlnVNursxjI7bi9b@apples>
References: <20220415192721.tkbokbl65rrwkbew@localhost.localdomain>
 <YlnI8EONxaX/fnPZ@kbusch-mbp.dhcp.thefacebook.com>
 <YlnKjTc4FRkfsOv9@apples>
 <20220415202343.cwfkilna4lqhcfhd@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hqRDC2xkjribHmd7"
Content-Disposition: inline
In-Reply-To: <20220415202343.cwfkilna4lqhcfhd@localhost.localdomain>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Keith Busch <kbusch@kernel.org>, ddtikhov@gmail.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, linux@yadro.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--hqRDC2xkjribHmd7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 15 23:23, Dmitry Tikhov wrote:
> On Fri, Apr 15, 2022 at 21:42:05, Klaus Jensen wrote:
> > On Apr 15 13:35, Keith Busch wrote:
> > > On Fri, Apr 15, 2022 at 10:27:21PM +0300, Dmitry Tikhov wrote:
> > > > Since there is no else after nvme_dsm_cb invocation, metadata assoc=
iated
> > > > with non-zero block range is currently zeroed. Also this behaviour =
leads
> > > > to segfault since we schedule iocb->bh two times. First when enteri=
ng
> > > > nvme_dsm_cb with iocb->idx =3D=3D iocb->nr and second on call stack=
 unwinding
> > > > by calling blk_aio_pwrite_zeroes and subsequent nvme_dsm_cb callback
> > > > because of missing else statement.
> > > >=20
> > > > Signed-off-by: Dmitry Tikhov <d.tihov@yadro.com>
> > > > ---
> > > >  hw/nvme/ctrl.c | 7 ++++---
> > > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > > >=20
> > > > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> > > > index 03760ddeae..7ebd2aa326 100644
> > > > --- a/hw/nvme/ctrl.c
> > > > +++ b/hw/nvme/ctrl.c
> > > > @@ -2372,11 +2372,12 @@ static void nvme_dsm_md_cb(void *opaque, in=
t ret)
> > > >          }
> > > > =20
> > > >          nvme_dsm_cb(iocb, 0);
> > > > +    } else {
> > > > +        iocb->aiocb =3D blk_aio_pwrite_zeroes(ns->blkconf.blk, nvm=
e_moff(ns, slba),
> > > > +                                            nvme_m2b(ns, nlb), BDR=
V_REQ_MAY_UNMAP,
> > > > +                                            nvme_dsm_cb, iocb);
> > > >      }
> > >=20
> > > Instead of the 'else', just insert an early 'return;' after nvme_dsm_=
cb() like
> > > the earlier condition above here. Otherwise, looks good, and thanks f=
or the
> > > fix.
> >=20
> > Dmitry,
> >=20
> > Agree with Keith - also, please add
> >=20
> >   Fixes: d7d1474fd85d ("hw/nvme: reimplement dsm to allow cancellation")
> >=20
> > Thanks again!
>=20
> Ok, will do. Can i change patch subject text or it should stay
> the same between submissions?

Changing it is ok :)

--hqRDC2xkjribHmd7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmJZ1TQACgkQTeGvMW1P
DekZdQf9FXtFGicvSvw1dmNEtIkfXSxYpslCbpp0BlegOgcZhj3ZerPhYLBihDw0
aJ6Mz5hHuSc7tf073s/BMuS1kYZOUiodM/rt/GQruoIg4Fg6rBxB8XhBfgS+6btS
+/HLbkcdv1bDZNFmX2ReCtWiRA1LZEeHnsJV4Xj25WeASW5p/a/TmIwC7IUkN63M
c3vP8IFEmGmr1dxgABW/AM9h8YS/CMUGE3nVsOwx/UnlLDIblgaHT6P/WMnJMpXk
jXb5hdbc4cCfjzZi4A/tneq46qxrHzGNvWA0iuDnEXxZVWKc8oIu2byH+TLNfFo8
5j9PpNUUkBPldcczX3skeNZ5N6DDtg==
=Mpqk
-----END PGP SIGNATURE-----

--hqRDC2xkjribHmd7--

