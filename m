Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 269E6328673
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 18:11:50 +0100 (CET)
Received: from localhost ([::1]:46944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGm5E-0003XR-UP
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 12:11:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lGlwj-0006ob-Gl; Mon, 01 Mar 2021 12:03:01 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:38293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lGlwf-0002vm-Su; Mon, 01 Mar 2021 12:03:01 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 67B0158051D;
 Mon,  1 Mar 2021 12:02:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 01 Mar 2021 12:02:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=1Uhvaqqg3TT+fnNQyb2LMD01sen
 7DOGYFlT4cAV6/ts=; b=G/tNSAS4elWjNqZbFp4N3/ztjwKcckO3+en0Jb7xrcx
 G+ufov01vfg+NIOvachNNQOABHZo/F74DZiA4qf+XM254/OyuFSciY0WsO7g/iNC
 OD/8gJs/RQfUTYG4+umvDUqgAdccIAPmaT2XylE/JpLAW9OzkB/Oai52Xbi9pL6y
 opWRADsw0hp3tEd/Yozoqh+cjLW90TbVJug6MHi7vyA36GnJPjJ/ck0sMnxuhAwT
 NqxM9gcSi+coxb8URw3DUF75GQrrBCmHhU6TpJ19Ct0bJLUodnmEvv/SqaYboJrV
 TRrQruDHT9/1FvcvZgXE/oDGPf0k1Sj2ENJicKwFi5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=1Uhvaq
 qg3TT+fnNQyb2LMD01sen7DOGYFlT4cAV6/ts=; b=S9QWGO5CYFVGSWKwjCS9RI
 jgxP4zdzTLnCxLoPL/Ym1mBlW3mlkokklOTuiohNsoxtyvBhP5Ge/oTS2JD8fLeP
 dtlkYeTnlB81NQPq2AEouh2Key3YuTcHtLaj6WkhvbYDWdRprad1SIQM3h3uHyrv
 371Mkomq88LRj1mmwVZUJo8RWfKXa//Jqsf0pNoec1SBie+Qbj/Qu6he6OiB3ACh
 dhqKtD2IJdgxNb4Wc2w20fzQw+YIkIX+bIwTihleF3xWsSb84gkWJlNUcuT7kBHM
 JTf/T8B9a3gGiN1iXEvRd22RBarakyl45jAUCLWWn0gAKs01dCgsPz7WV08CepSg
 ==
X-ME-Sender: <xms:Ph49YKZWPPt-HKouRHYnEfcKeGyt6d24HqBnxhFlC49enr9SuO6rFw>
 <xme:Ph49YNWJB2yBT6wJnKxMdJHdAaqLa-5zUVQ4XyCdpQBSW_u4xERqmKvYrKNmbnmB7
 IT_9ffauypyr2iLSA4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrleekgdelhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:Ph49YB0DjCxbkkAKY7-oy9-NtjJWk_-O2hhdSVhu_qa-DE5U-o3hEA>
 <xmx:Ph49YEZO0IhOC3mheBEpwh_kkpjkeSk7DFYweogeeeZNYp1e4AW5eQ>
 <xmx:Ph49YEpBi1L6JcAJnZ8eHSmtPGOjk0by62CPSXOw71gHrn89haRxZA>
 <xmx:QB49YEwp4oLU5goBWf7ykqFl5cLGfyWpHL4Tm16gK1OZKlaaGW9o0Q>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 220D424005B;
 Mon,  1 Mar 2021 12:02:53 -0500 (EST)
Date: Mon, 1 Mar 2021 18:02:51 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH RFC v3 12/12] hw/block/nvme: add support for the format
 nvm command
Message-ID: <YD0eO1uoDxjbvbaN@apples.localdomain>
References: <20210214230240.301275-1-its@irrelevant.dk>
 <20210214230240.301275-13-its@irrelevant.dk>
 <20210216231632.GG2708768@dhcp-10-100-145-180.wdc.com>
 <YCzTPdmLgQywAtf0@apples.localdomain>
 <20210301160940.GC17228@redsun51.ssa.fujisawa.hgst.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Jh3Ju3ze/fLSiLM9"
Content-Disposition: inline
In-Reply-To: <20210301160940.GC17228@redsun51.ssa.fujisawa.hgst.com>
Received-SPF: pass client-ip=66.111.4.229; envelope-from=its@irrelevant.dk;
 helo=new3-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Minwoo Im <minwoo.im@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Jh3Ju3ze/fLSiLM9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar  2 01:09, Keith Busch wrote:
> On Wed, Feb 17, 2021 at 09:26:37AM +0100, Klaus Jensen wrote:
> > On Feb 16 15:16, Keith Busch wrote:
> > > On Mon, Feb 15, 2021 at 12:02:40AM +0100, Klaus Jensen wrote:
> > > > From: Minwoo Im <minwoo.im@samsung.com>
> > > >=20
> > > > Format NVM admin command can make a namespace or namespaces to be
> > > > with different LBA size and metadata size with protection informati=
on
> > > > types.
> > > >=20
> > > > This patch introduces Format NVM command with LBA format, Metadata,=
 and
> > > > Protection Information for the device. The secure erase operation t=
hings
> > > > are yet to be added.
> > > >=20
> > > > The parameter checks inside of this patch has been referred from
> > > > Keith's old branch.
> > >=20
> > > Oh, and here's the format command now, so my previous comment on patch
> > > 11 doesn't matter.
> > >=20
> > > > +struct nvme_aio_format_ctx {
> > > > +    NvmeRequest   *req;
> > > > +    NvmeNamespace *ns;
> > > > +
> > > > +    /* number of outstanding write zeroes for this namespace */
> > > > +    int *count;
> > >=20
> > > Shouldn't this count be the NvmeRequest's opaque value?
> >=20
> > That is already occupied by `num_formats` which tracks formats of
> > individual namespaces. `count` is for outstanding write zeroes on one
> > particular namespace.
>=20
> But why are they tracked separately? It looks like we only care about
> the number of outstanding zero-out commands. It doesn't matter how that
> number is spread across multiple namespaces.

It is to allow the Format In Progress status code to be returned
individually on the namespaces. When `count` is zero we set ns->status
back to 0x0.

--Jh3Ju3ze/fLSiLM9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmA9HjkACgkQTeGvMW1P
Den95AgAp5x9lufPrI5tv2Sju0VeWR0uZl+yzcxRFq/KZxo8ViTxtv5q/D1rjLKV
69tUTcJ7ZbXiCkpohdkyMeelVfpkQKqtjQSdU3xx3baRC+FJJIBGzKXhEEJFDPhk
4+DGbuZFeVzD9JGqdMG6wXHDiMgmOCNcFf6+WHdaBUb/LQzmIPkk82lA4TADotPW
L15dCHzLSace8kCbn7+ia2RCD33OzAM+DGaZolyVhk5UkcJo5nGC8sT706EJtB2k
GXXBnu8tu4u/99hkNVIHLY+Xo0RsU/GP6wrZq0i+zTciUzodJofAmkF4E7WVCEqV
5W6OwX16xtVRWYMjcftc5POUcd9VfA==
=OT5K
-----END PGP SIGNATURE-----

--Jh3Ju3ze/fLSiLM9--

