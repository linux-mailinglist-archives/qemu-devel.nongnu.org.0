Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA52A327D06
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 12:22:33 +0100 (CET)
Received: from localhost ([::1]:42834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGgdE-0003jY-7B
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 06:22:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lGgWV-0000YK-Aw; Mon, 01 Mar 2021 06:15:35 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:58125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lGgWS-0001Kp-To; Mon, 01 Mar 2021 06:15:35 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 593B45C008C;
 Mon,  1 Mar 2021 06:15:31 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 01 Mar 2021 06:15:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=kTx1rEZ18HLpVXZgQvJGcvdZGJa
 Wj4vip/FYa9Wgd5U=; b=q/tYpcimB3ziJJdv9WXyCsVuf2QcIX5OBCXYGWtakWW
 ebXiJ3313qgu7M1k5ZxN8qg/7CZTMwffWgUbXjyCCna82qBKN8z5Hql+gd6OOMx9
 rH8WHdr+I23TLveNJABR6b9okM51QN2tp6dBLhMPGFpDXh7mnUTmIualRQHH38ZZ
 D/kTbayxU/F6PRoestnp226fKdq39yB/7k51OqLx9f6du4Vg+Jv0e3eb9Ob/F3rb
 OcZr5iQq9ghPH6Y2k4H1BOkmaWbGndHoevaKOXiI97E3nJ3XMAdcVTtUn8P5gb/w
 QMZ2RcaH8VfFhPZ4wHwdFzY07YswkHy4MOldGM4LkJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=kTx1rE
 Z18HLpVXZgQvJGcvdZGJaWj4vip/FYa9Wgd5U=; b=KfgKBaKwZuzpckGctCdG5X
 /JEvCibOYXz2DoX324uZcEw8iFH5pfeTK8fNy1k4TApeVuzE6wtsVnVAfEAy06Ur
 A6KqFzpCz/8OZGLk/h7ifHHeVVeS1XGVobr0ogAcczZB7nCl58giEMb/B4rXICgN
 O8yiG080KhFD8/fRVD/QX+1/vjrRSrvivbb9GTj0vV9wpdAdVNPz6Igd3S1sNewK
 X4xE5jkydWFClmptWXaN4RMfBEEbMBt+9GIyaVET9ah3Og1JnxjkrLO0P8p7nLGA
 8yvf/zX7V67p5WtvVzAn0k9/X5StrjC2A0vsNrqYpOnYOBymLbm/dq+2Usl811CQ
 ==
X-ME-Sender: <xms:0cw8YKIujRWiS2Pn5jnbaWC0I0PXLHS-jXiz8EHG53o-sL8zCfSnJQ>
 <xme:0cw8YCKDUMaGgMZjueSTXc52G2leGPbVHAmzNjE4eO2HlRjdJfbMXEkS8hj03aV7a
 9-zG57mpyT8n7h9mCI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrleekgddvgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:0cw8YKu50BwD2Iz5H1g0ZqsgeVx5uuQS8WOke0kXyHDVsgRbVtLvsQ>
 <xmx:0cw8YPYbNoSwEO_P-NC43RsNxn73WD4ouEjvkijON8XNInub2HFONw>
 <xmx:0cw8YBawND-Dzpgk6Us_GrnqfZAk2-f7RAwcoCTBZX_KI3uoMSvv0g>
 <xmx:08w8YN4ZSRkXnzyyKz2P6xP8j0WHRqtOvxphRvJJnlckj6K1UIqckg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2293A108006A;
 Mon,  1 Mar 2021 06:15:28 -0500 (EST)
Date: Mon, 1 Mar 2021 12:15:26 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH v2 5/5] hw/block/nvme: report non-mdts command size limit
 for dsm
Message-ID: <YDzMznTMIam04v+J@apples.localdomain>
References: <20210222184759.65041-1-its@irrelevant.dk>
 <20210222184759.65041-6-its@irrelevant.dk>
 <20210222205506.GB16253@redsun51.ssa.fujisawa.hgst.com>
 <YDQeNpjTCvYbKhjh@apples.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xZuppcGVQaz18HUO"
Content-Disposition: inline
In-Reply-To: <YDQeNpjTCvYbKhjh@apples.localdomain>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--xZuppcGVQaz18HUO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 22 22:12, Klaus Jensen wrote:
> On Feb 23 05:55, Keith Busch wrote:
> > On Mon, Feb 22, 2021 at 07:47:59PM +0100, Klaus Jensen wrote:
> > > +typedef struct NvmeIdCtrlNvm {
> > > +    uint8_t     vsl;
> > > +    uint8_t     wzsl;
> > > +    uint8_t     wusl;
> > > +    uint8_t     dmrl;
> > > +    uint32_t    dmrsl;
> > > +    uint64_t    dmsl;
> > > +    uint8_t     rsvd16[4080];
> > > +} NvmeIdCtrlNvm;
> >=20
> > TP 4040a still displays these fields with preceding '...' indicating
> > something comes before this. Is that just left-over from the integration
> > for TBD offsets, or is there something that still hasn't been accounted
> > for?
>=20
> Good question.
>=20
> But since the TBDs have been assigned I believe it is just a left-over.
> I must admit that I have not cross checked this with all other TPs, but
> AFAIK this is the only ratified TP that adds something to the
> NVM-specific identify controller data structure.

Are you otherwise OK with this?

--xZuppcGVQaz18HUO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmA8zMwACgkQTeGvMW1P
DenomAgAqA/r30sJjemJG4b6l9nSy6fl7SU401NICKg/TW8+LcCNUgEfO53GsK/V
APezrlIX4Sgw40dhxHtdXNCqYzp9HumMRfCCmqQibLWMh6WOwSi2519KqIxHxKHG
OfQny+cj2BvV5uL42aIBj08UBWDT1FmwpsidkXCy6DhZZ900iYZRgxfLUG4l0ncn
UFLkCyJisJGXnh75TmOZOUFX6/h7e2D7TXmfrduWmkcDfZr96gu4LZa+hiqUslgF
JSezTzXDsi9Dc+tKFO45BOqirGVbNSjHvKhVqVORiw5MX2OdDfnOgzfKUhtBodFp
gAdPI4Xzb6C+RujvtUv+OwXuA4ay+A==
=nJIq
-----END PGP SIGNATURE-----

--xZuppcGVQaz18HUO--

