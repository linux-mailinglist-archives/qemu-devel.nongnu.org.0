Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A08B8495750
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 01:25:40 +0100 (CET)
Received: from localhost ([::1]:59578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAhkI-0005VK-Kl
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 19:25:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nAdoB-0008Mc-1J; Thu, 20 Jan 2022 15:13:23 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:56773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nAdo5-0005j1-67; Thu, 20 Jan 2022 15:13:19 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id CC3F65C01E9;
 Thu, 20 Jan 2022 15:13:14 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 20 Jan 2022 15:13:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=/Dp7q5P9Ycwkd58/+GHTA4UdTeAnvt
 BnNLmQxk0/I6U=; b=iGXsXK87+XW7XnDFPl7Z/KsKxG+EZUlwo0oOcm05hRyA/I
 eT7YV+IeiKxXc6FA7IfBJ4wBVPy9X5UPGCPCMjV0qAO3r03XBTzdz1cG2ferDL5e
 AJGDSvTFC3e2QjYtXew5y3IqloNpo3tFUXimxRDnUcfRcfGnY60lqfMehpjTK1Bl
 OLgYR6VapvcYNvyYyquSCHAp8CG6806AppD2/qx3RkyZt2QH4iBS+ImRhxBp0VbI
 ofQPtCH1yCBnGxydzS/4oZGZVXi+azGx1/8jxR61wUEf2j7LUHJwYakeisUtKzLz
 NeVTeLatqebqiwVI6h+SOinewSjPzCNaVSFpLhkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=/Dp7q5P9Ycwkd58/+
 GHTA4UdTeAnvtBnNLmQxk0/I6U=; b=SgMckwBAakIgpS2NqXQk9wpgM4PEyq7Fy
 5zjiV1Pex8fk1D5qlU3RiHkyb4lCA8FQ+fRjaLigRHNa5e43g0FN30YhbllE4QE3
 0VjjWh5hdFAHnpfkM5OUgho4RPj+DoLYv5WKGivXaJbZlAOwlSJ7H3hwRPYJUOQp
 teK4Q3RwJMGq5ydrmF3b2Y+0YxTeR3mZP2M4jgeV32A3wdIp5HPYyqBITfKE1ptB
 8xdWkZKTpMePNnEApZLDp2TxW8Bjfx2lZu22ggNspK7US+5lEytGI4Ryf2Uwetg/
 /qLesZqDguC6V59RmhEpKQj14zXtSzXZZ4tXSCz9wTuFAaVsFiTfA==
X-ME-Sender: <xms:WsLpYRZJEfnu6yTOEW29Nk5oVRfxBv3ieOPeN3jG5nAgpkw97eHi9Q>
 <xme:WsLpYYb-Q1Bw7ySascEafTTj5j7WRFFOPoUY0TfXIreI0sB1NQmT838xYW5TQgYI7
 iDrf4j0UwNicTYcOng>
X-ME-Received: <xmr:WsLpYT8biBLI_VAOb4n65soy92D0_fHzhUnthWekwNaWNEB62dNSkRYCdIMjZQmV0cbqGosTAS_YzR6O7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekgddufedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:WsLpYfqfZTEASJUM4gfyXcKjIU0fL5Gkjgc0pJRUQLTaFTrCXZI1pA>
 <xmx:WsLpYcp9u9jCWzeYt5nWglghcUOPHoAESSbcIX9wErpPUoEUAa62eA>
 <xmx:WsLpYVSn9l06Iz4Dtbnln3LURML7klyUORmjx--wXCV-Rp2Gv2ueCQ>
 <xmx:WsLpYRAwtq6XZ53WbhVTxzObPlisSoN7erXXKgDOe0DUPHcBPYNDiw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jan 2022 15:13:13 -0500 (EST)
Date: Thu, 20 Jan 2022 21:13:11 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH] hw/nvme: fix CVE-2021-3929
Message-ID: <YenCV0EU3xQ7NgRu@apples>
References: <20220120080155.227246-1-its@irrelevant.dk>
 <20220120151008.GA383746@dhcp-10-100-145-180.wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="w/YD2hGQruzbIN2U"
Content-Disposition: inline
In-Reply-To: <20220120151008.GA383746@dhcp-10-100-145-180.wdc.com>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Klaus Jensen <k.jensen@samsung.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Qiuhao Li <Qiuhao.Li@outlook.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--w/YD2hGQruzbIN2U
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 20 07:10, Keith Busch wrote:
> On Thu, Jan 20, 2022 at 09:01:55AM +0100, Klaus Jensen wrote:
> > +static inline bool nvme_addr_is_iomem(NvmeCtrl *n, hwaddr addr)
> > +{
> > +    hwaddr hi, lo;
> > +
> > +    lo =3D n->bar0.addr;
> > +    hi =3D lo + int128_get64(n->bar0.size);
> > +
> > +    return addr >=3D lo && addr < hi;
>=20
> Looks fine considering this implementation always puts CMB in an
> exclusive BAR. From a spec consideration though, you can put a CMB at a
> BAR0 offset. I don't think that's going to happen anytime soon here, but
> may be worth a comment to notify this function needs to be updated if
> that assumption ever changes.
>=20
> Reviewed-by: Keith Busch <kbusch@kernel.org>

Nice catch Keith. A comment would be wise!

--w/YD2hGQruzbIN2U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmHpwlIACgkQTeGvMW1P
DemVDQf/ePbwxqvvngbDpM4CmUxyG3SOmzYU3i9oh2VKQmcUl7c0PdFgNRvFDiDr
Q2mlRCec6VbZLzKWRLujjkR5vMfnrLWIFJwRhi60QF/aEohhORUWI03MsRN6g1pi
XLK/Dykl/C1RW7desv+WdjGq0XkBdKZMbxvoHoprXmDnD4uu0ALVNJsTYmBbs1zd
53F90qs71DMidwZtB0OiCITX737lv3ZQ7vYFp0oWPv20GIgLiX+iEA+fkB+IsUa7
gxqTQbyoCdVfpYXMtQqTGONuBFlO+ZH+Ht/QGEll5N2eymQbeh5J23VnQGbvJH4m
/Vp0AWVbNGlhCP7FWyFLhgcL62F+TQ==
=XwZd
-----END PGP SIGNATURE-----

--w/YD2hGQruzbIN2U--

