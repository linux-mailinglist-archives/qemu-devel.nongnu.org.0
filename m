Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6577331D6D2
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 10:11:14 +0100 (CET)
Received: from localhost ([::1]:51058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCIrZ-0004Uj-AW
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 04:11:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lCInU-0003Fi-8e; Wed, 17 Feb 2021 04:07:00 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:49667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lCInS-0002U7-JJ; Wed, 17 Feb 2021 04:07:00 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A22D9F4F;
 Wed, 17 Feb 2021 04:06:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 17 Feb 2021 04:06:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=9aBT+tdape2gdOOg9l3Yo7ckGqZ
 c5adde28Ai6wxuKQ=; b=gWrcQowHCBU/M93JZ3KLSWXiVygc545uwIZeJFH+FG9
 DUeNIAKYlBRSjHONBcvSG7N/NDEgTikU4CNVwrsNJW1O2N8dRpNzNSvbYtCTtb4j
 p3okxnKdKwFIVNfTP031KDtCOu8zXBkIctnvhD67TxBiW5vZazAqc157CbBO++KR
 137T0Wb7K2R9+vK8+QGJN9Oi2rVTfaaahlH4ZsJ+sCG7YS+k9Y9NiElsR5VAlHma
 mGLsoXno64wwsWlXAKCJAu9pIy2KIplS68NhJLbIMnVK+OxR2yzMAF/MEVUtFvwg
 koNyWdna9FvSCRgl3VakLBU1Rad1xbDj/pQ4CmEB5dQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=9aBT+t
 dape2gdOOg9l3Yo7ckGqZc5adde28Ai6wxuKQ=; b=KJpEasvfLcvYiJhUI7cA4W
 5UltF5heItVqcVeSUiq2ZqY68aJhRTgptZolPvoSgvlCHw+eDL9FYn2NVwfkBM+h
 GiR7u3MKzKRuCFimSNf1xjtsI2Io/hSkqEfNHS87ZVqUJcpKMlCg4sojEQAvTZkP
 Za/+lvFI9p718wsGXAceKHK5iTiIj3Fut3rzbPf9pGpUBKaUbf9tr0ZYivi2LVlC
 fSAkiSbHfSBaj/tgFX8TABWHD+biprOXj3EAP221gEDfURfmWSu6Cv/5+hG1IydN
 yh57BqpJrnnXAyEAKnC6qNbjpFfHuwj7MQv+tzJXSvcgfnMWQKW+ShdJW5ej6nug
 ==
X-ME-Sender: <xms:rdwsYO6y5ymJ7zBZxkFCYcz4GTz0-d7pd6DkQY5dDTI0m8BQNgdurg>
 <xme:rdwsYH4fx6GHTNH1kMtiI-OfNM7-s1bgEOC77ev0YCiiXAbKj4tUrFkTOXQZ-akcb
 4mc_Q2M1E1fIY9XW94>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjedugdduvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtdorredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuueffiefhgffgteehjeeiveeludfhteffhfehiefgheetjeeitedvtdegvdeh
 tdenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:rdwsYNf0mwtxSoWBg3T69hh-pPABfqjnA62PaboV_1zn_ecHc49lrg>
 <xmx:rdwsYLLVd3yFF79ZU6y8hbv_M8ZMHg6oXTFbpLVtgeLdfB6j3BxJHA>
 <xmx:rdwsYCKtX0GvoXTQTCEIEckWdy95dOUC6W4RYsJXVG5RSGt0ujFtsQ>
 <xmx:r9wsYDqFTxlzwAx3JZl7QVGOtXR-umK2qne4mWUuPZGqvF2yQsiEtg>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id CE620108005C;
 Wed, 17 Feb 2021 04:06:51 -0500 (EST)
Date: Wed, 17 Feb 2021 10:06:49 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH RFC v3 00/12] hw/block/nvme: metadata and end-to-end data
 protection support
Message-ID: <YCzcqaCFgupTgByl@apples.localdomain>
References: <20210214230240.301275-1-its@irrelevant.dk>
 <20210217001950.GH2708768@dhcp-10-100-145-180.wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zGCR8N6xUy5HBlCK"
Content-Disposition: inline
In-Reply-To: <20210217001950.GH2708768@dhcp-10-100-145-180.wdc.com>
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
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--zGCR8N6xUy5HBlCK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 16 16:19, Keith Busch wrote:
> On Mon, Feb 15, 2021 at 12:02:28AM +0100, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > This is RFC v3 of a series that adds support for metadata and end-to-en=
d data
> > protection.
> >=20
> > First, on the subject of metadata, in v1, support was restricted to
> > extended logical blocks, which was pretty trivial to implement, but
> > required special initialization and broke DULBE. In v2, metadata is
> > always stored continuously at the end of the underlying block device.
> > This has the advantage of not breaking DULBE since the data blocks
> > remains aligned and allows bdrv_block_status to be used to determinate
> > allocation status. It comes at the expense of complicating the extended
> > LBA emulation, but on the other hand it also gains support for metadata
> > transfered as a separate buffer.
> >=20
> > The end-to-end data protection support blew up in terms of required
> > changes. This is due to the fact that a bunch of new commands has been
> > added to the device since v1 (zone append, compare, copy), and they all
> > require various special handling for protection information. If
> > potential reviewers would like it split up into multiple patches, each
> > adding pi support to one command, shout out.
> >=20
> > The core of the series (metadata and eedp) is preceeded by a set of
> > patches that refactors mapping (yes, again) and tries to deal with the
> > qsg/iov duality mess (maybe also again?).
> >=20
> > Support fro metadata and end-to-end data protection is all joint work
> > with Gollu Appalanaidu.
>=20
> Patches 1 - 8 look good to me:
>=20
> Reviewed-by: Keith Busch <kbusch@kernel.org>
>=20
> I like the LBA format and protection info support too, but might need
> some minor changes.
>=20

Cool, thanks for the reviews Keith!

> The verify implementation looked fine, but lacking a generic backing for
> it sounds to me the use cases aren't there to justify taking on this
> feature.

Please check my reply on the verify patch - can you elaborate on
"generic backing"? I'm not sure I understand what you have in mind,
API-wise.

--zGCR8N6xUy5HBlCK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAs3KgACgkQTeGvMW1P
DekbPQf+PYFtISmDiyayLnZeil9gARbPcfFnIRRKVTRlRWoANl5TqCwclIsxrqaq
yer+PLDL4CDiU4595G2E3/n3blHBUM42sy5TSkRu/bTanIp1Npt+TX9WVnb7mcG6
H0LOl9WvEodczqvKrcyIOspZmtYAXwxDIPl/TQYbGXZnLAOhxy8ft8r1KH73tL82
8/45l8l1E6WP/PNspQpzKT0pWVsWGu/INGzyNHwZYCvf82IJdpi51W8GYyQzUyVI
LKo68DFLympmE88uc2fWfkpo2xisertH6STsL22izZafie72pgVl5HA/Gzp7mnBH
F0umPfJASoeoLKIFDmZKiPu5/VgDdw==
=3GGb
-----END PGP SIGNATURE-----

--zGCR8N6xUy5HBlCK--

