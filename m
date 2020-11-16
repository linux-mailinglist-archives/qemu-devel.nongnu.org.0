Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A152B5016
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 19:45:57 +0100 (CET)
Received: from localhost ([::1]:40030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kejVk-0003nd-5B
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 13:45:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kej4v-0002sX-D4; Mon, 16 Nov 2020 13:18:13 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:41453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kej4q-0001tR-0e; Mon, 16 Nov 2020 13:18:13 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2D7C95C01D9;
 Mon, 16 Nov 2020 13:18:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 16 Nov 2020 13:18:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=twScnY1THTlyRq/xoX7rIDIax02
 Qp5ZPGPiY3awKXNw=; b=uumng26413S1cXys5mDDTo7IUl4uH7MrBlAXGBsBMwB
 xDq2Z21tvXdVpjZ2gEtDBFhaY4BZ2XvMsNxQsl/a324ZSKV4p934B5p/HRXQKv2t
 locjziJ+2pPAU+8RE2O+ZikRpyLXhiQisc3rcoPobbQiZ4w3ni1JBsD5yXjIDedk
 +9Mq/IistBqO0lUUmGR4uCTbAQ27iGvyB4lQvLdhY9RnRl8wc2CIMe99Wbc2rjZL
 9fPv5e0RPMquTv5rr7nZNhezSV2G6x1HvfNxmk3lYwwhq5WGfBJtjqosQnQO/iEF
 mKAf24RFayoyw1ucLNoXPs8h/RdNyU66GST4Zp68mjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=twScnY
 1THTlyRq/xoX7rIDIax02Qp5ZPGPiY3awKXNw=; b=W6zs4rsjzYLGRJYZr+uIBY
 k5KqCzV1TB6RWMnCEuiEyG43gB/Hfm4qEtcGpHe9/5Ap26aQIAqqucEj9itfe4DM
 d1TGhtw1TUb6iSDcW0JcVDzHbk/TvQgz9DJSJ0AYPCyGhXdC+1r0/TfzthU3ZibL
 NHp1FpHGKXTwwvoAD20s4l42gVBMLX/QRbJEOCfSq2LnqZ9HGJUvzZbbNX/Us6yN
 BNg7zsCJfst82wkGSXnYGlQ8FVaM1rBbZTDa7OT7pCRvBvpby9JhN7cdfp6O2udu
 O1auKv6Ng2GwfuZn4871m5R5K0rwsY9zEs6FyXdauvJiuOYDElk+qaR62jf6cMxg
 ==
X-ME-Sender: <xms:XMKyX4-dJqi7823D69gd1C6XmIC6M996VHJNkpTxenrJH3bYtBPieQ>
 <xme:XMKyXwusydMigxH9orNykzbbF6QTAvpT7VP1XfR0DTYFCFC2ehv7mdkAUxEkjR0Ey
 DgaTLv2J3EaLBF0f3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudefuddgudduvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:XMKyX-B69HjXeTWHEEjIKlxKUxbt0Nx1DZh5MbGfwVzYf9zGM7XFHw>
 <xmx:XMKyX4f94PEkKJWYMuav5yN0-QT5Knr3RSPfGJAN-_jAK84Do8WPvg>
 <xmx:XMKyX9MASyd1xSFXVzebAw882BQRFKy8HG5tJJJKDC1-n_KgffVgUg>
 <xmx:XsKyXw2oLRGKaSAnRxdlk4TDES-99qbFMJp6J6uhH0H5usi9frpewQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0EF0B328005A;
 Mon, 16 Nov 2020 13:18:02 -0500 (EST)
Date: Mon, 16 Nov 2020 19:18:01 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH v8 2/5] hw/block/nvme: pull aio error handling
Message-ID: <20201116181801.GD982821@apples.localdomain>
References: <20201112195945.819915-1-its@irrelevant.dk>
 <20201112195945.819915-3-its@irrelevant.dk>
 <20201116175713.GA2715864@dhcp-10-100-145-180.wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7DO5AaGCk89r4vaK"
Content-Disposition: inline
In-Reply-To: <20201116175713.GA2715864@dhcp-10-100-145-180.wdc.com>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 13:18:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--7DO5AaGCk89r4vaK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 16 09:57, Keith Busch wrote:
> On Thu, Nov 12, 2020 at 08:59:42PM +0100, Klaus Jensen wrote:
> > +static void nvme_aio_err(NvmeRequest *req, int ret)
> > +{
> > +    uint16_t status =3D NVME_SUCCESS;
> > +    Error *local_err =3D NULL;
> > +
> > +    switch (req->cmd.opcode) {
> > +    case NVME_CMD_READ:
> > +        status =3D NVME_UNRECOVERED_READ;
> > +        break;
> > +    case NVME_CMD_FLUSH:
> > +    case NVME_CMD_WRITE:
> > +    case NVME_CMD_WRITE_ZEROES:
> > +        status =3D NVME_WRITE_FAULT;
> > +        break;
> > +    default:
> > +        status =3D NVME_INTERNAL_DEV_ERROR;
> > +        break;
> > +    }
>=20
> Just curious, is there potentially a more appropriate way to set an nvme
> status based on the value of 'ret'? What is 'ret' representing anyway?
> Are these errno values?
>=20

Yes, it's errno values from down below.

But looking at this more closely, it actually looks like this is where
we should behave as dictated by the rerror and werror drive options.

I'll do a follow up patch to fix that.

--7DO5AaGCk89r4vaK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAl+ywlYACgkQTeGvMW1P
DemczAf+MmfAozD+VM390RYPLB0vKI8ZutczeVeZx8/ypWN6/+HF/0yTvjnkb0/D
DpQx2fDWAAU7nByJWeSR6CESCME0vTidpd7vBk5Bw1SkD1QGWTm7T4GsATnCq/1k
BPAlyifrsbH8apGUzq8pONyHBdTW9BtmmCJmon1tDtkCjiLxLse/rKmMvhvlsnEZ
4R1vJanlMOPeD/1ZvP/bnAGhi37MwZJLZkxOjruxwt/5JTk0ySFPA1WoxxXaLJ5d
cFZmqPj6cU6lppijHMMeua+HWyUSqadi+8dUIzUENkMuLLLDpMmS/yDmHCma6X5V
QNLyfdMVL6fmcSbHaiIOQc40+6DIMQ==
=v89Y
-----END PGP SIGNATURE-----

--7DO5AaGCk89r4vaK--

