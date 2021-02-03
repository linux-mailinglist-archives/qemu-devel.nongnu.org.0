Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C0E30E2F6
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 20:00:35 +0100 (CET)
Received: from localhost ([::1]:52308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7NOD-00064M-HK
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 14:00:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l7NJi-0004QR-RI; Wed, 03 Feb 2021 13:55:54 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:40709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l7NJg-0007zV-K1; Wed, 03 Feb 2021 13:55:54 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 5852E6AF;
 Wed,  3 Feb 2021 13:55:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 03 Feb 2021 13:55:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=QHwJKqfMfOME1hx5UzhZcJIJt/5
 ZG7DJoPDZECvFchw=; b=OCbwbhl1Bh3mQnP9kMATFexK+b5MBc4G09fOlgfU/UH
 aeRZ3JbTkjTbCku4J7IQ2o9vx3TGi/wpwP5v6yO/Dw/PZvPDqGaZ8vemDXhvDKd/
 XdchF+b599hHCUOBtv8WMtfbzm4yPQDoAGRnzivNkaRgH6BaAx+6r9En9gM/KanV
 WtmVZjlIv2nsRx8OhitadxPxf1gaSXZfIM8Iz/Elw9394waWTo63Zk/SNTMXWeT4
 wUabq/Ry+gJouf0MgAWHPgBxki8Hp+lFleGfYcKNpQbaXwF7O/sSQ/av+C7kq5I2
 hVAG1GpHHtBYzlVsZYoNzP7u2H71lNlyeo/YVvP6vtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=QHwJKq
 fMfOME1hx5UzhZcJIJt/5ZG7DJoPDZECvFchw=; b=OOM2SXhzBXrRIhEP1E2V4U
 n13cvaMsPFHrySmtIOO3hbh066122W3rTmpf798RDeq0xTZEBCMu9cDP/48L3fc/
 4JOfEoxK967MbVahG/ohRY8jeGC8bGa2Fh3f7inDtaAwiycppzb1hR1Fy/LcG8Vq
 CAaLasCwn+h2PEeNZPaEYzpxjINtqY9q0r2lWdcDABfF5lxP8N00N7I663R7MzY6
 oxVs28YSHSEsSQlbzGhKdGALwf+NxBUBjqYfdPvx8Gd/yEq6wv+7ILBAIhQxPiAV
 3c8zuRCT80oicFwl0lfIYeJlFuwgcomCsHn0Z9T8Llu/bdiPcW87UIWP+XSYCSjQ
 ==
X-ME-Sender: <xms:svEaYCG0D2g9-ch59Ym0HMOvOx3j5fnpzE4vqhaD31ZZmF4VP6vHPg>
 <xme:svEaYDV0517PrE7LH5qLAvHgxI6B3h2-8g-b0tmEiySi2nsFSOgoQj3z8b_QFcFMY
 EUzMOvwwo6A1A5KwqI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrgedvgdduudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:svEaYMJwMGlk2UzzOyZ4cxdUQEJk5dnVkTVyP_7zPf1P4BdVeXzw2g>
 <xmx:svEaYMG6qcJU5DfRIIK6wAUva660TQKTNoUb4Ldbi5H78URdodaw9g>
 <xmx:svEaYIWuPSSglm-36_gF3fWMIgiIaQS9dblEHgDsQb24dUDhJ5EF4A>
 <xmx:s_EaYKJjxjVy6kUOjpArZJG6l8ZaHrbIbzux1eEIUbacCOV3U0l6hA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8A7F924005E;
 Wed,  3 Feb 2021 13:55:45 -0500 (EST)
Date: Wed, 3 Feb 2021 19:55:43 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH v5 4/5] nvme: updated shared header for copy command
Message-ID: <YBrxrysIslChqwY2@apples.localdomain>
References: <20210129091541.566330-1-its@irrelevant.dk>
 <20210129091541.566330-5-its@irrelevant.dk>
 <20210203172126.GC2182779@dhcp-10-100-145-180.wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2EYXWOdTfuq1Rgr6"
Content-Disposition: inline
In-Reply-To: <20210203172126.GC2182779@dhcp-10-100-145-180.wdc.com>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--2EYXWOdTfuq1Rgr6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb  3 09:21, Keith Busch wrote:
> On Fri, Jan 29, 2021 at 10:15:40AM +0100, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > Add new data structures and types for the Simple Copy command.
> >=20
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
> > Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  include/block/nvme.h | 45 ++++++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 43 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/include/block/nvme.h b/include/block/nvme.h
> > index e4b918064df9..5977bcf0308a 100644
> > --- a/include/block/nvme.h
> > +++ b/include/block/nvme.h
> > @@ -579,6 +579,7 @@ enum NvmeIoCommands {
> >      NVME_CMD_COMPARE            =3D 0x05,
> >      NVME_CMD_WRITE_ZEROES       =3D 0x08,
> >      NVME_CMD_DSM                =3D 0x09,
> > +    NVME_CMD_COPY               =3D 0x19,
> >      NVME_CMD_ZONE_MGMT_SEND     =3D 0x79,
> >      NVME_CMD_ZONE_MGMT_RECV     =3D 0x7a,
> >      NVME_CMD_ZONE_APPEND        =3D 0x7d,
> > @@ -724,6 +725,35 @@ typedef struct QEMU_PACKED NvmeDsmRange {
> >      uint64_t    slba;
> >  } NvmeDsmRange;
> > =20
> > +enum {
> > +    NVME_COPY_FORMAT_0 =3D 0x0,
> > +};
> > +
> > +typedef struct NvmeCopyCmd {
> > +    uint8_t     opcode;
> > +    uint8_t     flags;
> > +    uint16_t    cid;
> > +    uint32_t    nsid;
> > +    uint32_t    rsvd2[4];
> > +    NvmeCmdDptr dptr;
> > +    uint64_t    sdlba;
> > +    uint32_t    cdw12;
> > +    uint32_t    cdw13;
>=20
> Can we find better names for the fields within cdw's 12 and 13?
> Something like:
>=20
>     uint8_t nr;
>     uint8_t control[3];
>     uint16_t rsvd13;
>     uint16_t dspec;
>=20

Absolutely.

I honestly didn't think about doing an array-3 of those control bytes.

--2EYXWOdTfuq1Rgr6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAa8aoACgkQTeGvMW1P
Dek4VQf/X552+MkkiTuMPHTaUhg+xysfIpdWi0JtUIvqIZWXdSQquuiofNGvyNTH
PoIULtj0U6ba1hEoOeOoE6J9kUui9f9UiySUuGRsbQDBC0dz6GuZjWQbeXcd2IzC
JhTXJJCABQkZSZNpZvgbdV94c5i8XTBvkviUVCL9wXwMbqDt4pa/sm9GFDP+GYWA
ynzRgKBqMJQjEe5XRXFr0QiCl2sR/dhihWqvwxLtIcSj52vhLFryugx2bTs5yTP6
XR/fgpgVWc/WayIbeRNRYhIiqEtFHOawjEIE4yWvgiMllE2simm98SFG47FqK15U
M6nueF9598j1+j09TO99//rIqTW2Aw==
=RrXu
-----END PGP SIGNATURE-----

--2EYXWOdTfuq1Rgr6--

