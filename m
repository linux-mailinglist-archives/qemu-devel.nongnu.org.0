Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBA964A1E4
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 14:47:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4j8S-00018p-3m; Mon, 12 Dec 2022 08:46:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1p4j82-00013m-Bx
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:46:00 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1p4j80-0001G3-3v
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:45:58 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 854283200564;
 Mon, 12 Dec 2022 08:45:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 12 Dec 2022 08:45:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1670852753; x=1670939153; bh=p5
 F7H+WhYPA2/F3AWx2N0Wrgzy00+zkyZej5kLEpbO8=; b=Z3LLcQm3+pCQOyNekw
 FfviXQFNh0FryueboRVBeio9Dmq1sT6NSCRb7sVnXz2aN5ZvXdBIAZYWRjTySvxd
 CLuUIOkqUAchSSTdpWwFqWE4/SjhWcVlzzpAXRtkVJbbIhL1HbJD+0S7hAIb0IJq
 675V1/uOBZC/cYReA36l6Y5GllgYevTdWH1/SpcAewtcfj1ujMT0RRRKUODXmHyF
 Cy6mC3ewvTZ+xzCsocG1z8yUYE/GYYZnF7g7OGbIf+nQQ6sYmaf5XEpC+QpCNAMQ
 zR03B6m8NDITaUMr16pxDxcaJVHATJ1A5kJeLIQKMpQoOYSfuJwQMw3OkLEVRcbc
 yZsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1670852753; x=1670939153; bh=p5F7H+WhYPA2/F3AWx2N0Wrgzy00
 +zkyZej5kLEpbO8=; b=p9Gnc8Y2s5Vl2jG7LrWHE+oCuhkrg3Y8dKgIABSbe9Ke
 iAav08p0/+2jy3e+so1CdjCDgll3MDQWw1MRLctrxqombFIwrDqD2tKeB2CL3KpG
 bmqvvUVVCYhqyiNxMCCYn2rw4fCKGgB9S6iGQ5BIPOzomEZnWqUs2PvDBSEqKAew
 cgre9+6AtTEMga2dpErlt0B+On29C6iisXPMHF/Y94r9FT49kV2UoA/TDzLT3q0y
 g9rEB5zdzCeEYlgieezlMEZNrXBzJNMVbEkRSqE24sAc8KRoc05L0pB87O6EZ4xg
 oMbbsTsHfH1Isa61okRedAw/CqTo02KwgeVG/Mib+w==
X-ME-Sender: <xms:kDCXYya-f17obyeevBkQ497aw9vP__31EA3YkF_uCyYHJslLq5Su_A>
 <xme:kDCXY1Y2OIjDsI2O_MD-lYxq0gm2l-nYUGJOoIa33b-ulB1A9AjWWxaftO4C4OLs1
 IDN-_6qGyNNVghMjC0>
X-ME-Received: <xmr:kDCXY8--aCOXds3C1p8mMPCepKIIN6yBxU7A_BlLq74_OH2W_iht9jW3Qwc1kVwa74ynfvMlZTAPGyFmviPnhUCOugBPPw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekgdefvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesghdtre
 ertddtjeenucfhrhhomhepmfhlrghushculfgvnhhsvghnuceoihhtshesihhrrhgvlhgv
 vhgrnhhtrdgukheqnecuggftrfgrthhtvghrnhepjefgjeefffdvuefhieefhffggfeule
 ehudekveejvedtuddugeeigeetffffjeevnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:kDCXY0qkvtwwAs5latH6Z68KKvof3O5SOi5TxHfwu3EEppuWbH5mFQ>
 <xmx:kDCXY9ozQiEKO3-kc_XgtYIwpnLRmDR8iWZe1OMJxv8Fcmkqfi3VtQ>
 <xmx:kDCXYySMpP3BuzxwGvlFY8vw_q8_HrB5y_KZgwCQCb2aAvJsJcLf0g>
 <xmx:kTCXY0XSHGgCZFzNeSV_J3u-Ipmluk0s25iz8pPEo1wz5B_BjJQdRQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Dec 2022 08:45:51 -0500 (EST)
Date: Mon, 12 Dec 2022 14:45:49 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jinhao Fan <fanjinhao21s@ict.ac.cn>, qemu-devel@nongnu.org,
 kbusch@kernel.org
Subject: Re: [PATCH v3 1/2] hw/nvme: Implement shadow doorbell buffer support
Message-ID: <Y5cwjfmTN4SVcZdk@cormorant.local>
References: <20220616123408.3306055-1-fanjinhao21s@ict.ac.cn>
 <20220616123408.3306055-2-fanjinhao21s@ict.ac.cn>
 <20221207174918.GA1151796@roeck-us.net>
 <Y5GPRiO0g2mgA3FS@cormorant.local>
 <Y5GbbF68N5ZiYNdv@cormorant.local>
 <20221208184740.GA3380017@roeck-us.net>
 <20221208201353.GA928427@roeck-us.net>
 <20221208203955.GA1367659@roeck-us.net>
 <Y5b7Mdtklu0xA5bJ@cormorant.local>
 <c09eaf86-f6b1-cc74-1732-e3c7576e9d88@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="j/IwTc/6xzAI0XOB"
Content-Disposition: inline
In-Reply-To: <c09eaf86-f6b1-cc74-1732-e3c7576e9d88@roeck-us.net>
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--j/IwTc/6xzAI0XOB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Dec 12 05:39, Guenter Roeck wrote:
> On 12/12/22 01:58, Klaus Jensen wrote:
> > On Dec  8 12:39, Guenter Roeck wrote:
> > > On Thu, Dec 08, 2022 at 12:13:55PM -0800, Guenter Roeck wrote:
> > > > On Thu, Dec 08, 2022 at 10:47:42AM -0800, Guenter Roeck wrote:
> > > > > >=20
> > > > > > A cq head doorbell mmio is skipped... And it is not the fault o=
f the
> > > > > > kernel. The kernel is in it's good right to skip the mmio since=
 the cq
> > > > > > eventidx is not properly updated.
> > > > > >=20
> > > > > > Adding that and it boots properly on riscv. But I'm perplexed a=
s to why
> > > > > > this didnt show up on our regularly tested platforms.
> > > > > >=20
> > > > > > Gonna try to get this in for 7.2!
> > > > >=20
> > > > > I see another problem with sparc64.
> > > > >=20
> > > > > [    5.261508] could not locate request for tag 0x0
> > > > > [    5.261711] nvme nvme0: invalid id 0 completed on queue 1
> > > > >=20
> > > > > That is seen repeatedly until the request times out. I'll test wi=
th
> > > > > your patch to see if it resolves this problem as well, and will b=
isect
> > > > > otherwise.
> > > > >=20
> > > > The second problem is unrelated to the doorbell problem.
> > > > It is first seen in qemu v7.1. I'll try to bisect.
> > > >=20
> > >=20
> > > Unfortunately, the problem observed with sparc64 also bisects to this
> > > patch. Making things worse, "hw/nvme: fix missing cq eventidx update"
> > > does not fix it (which is why I initially thought it was unrelated).
> > >=20
> > > I used the following qemu command line.
> > >=20
> > > qemu-system-sparc64 -M sun4v -cpu "TI UltraSparc IIi" -m 512 -snapsho=
t \
> > >      -device nvme,serial=3Dfoo,drive=3Dd0,bus=3DpciB \
> > >      -drive file=3Drootfs.ext2,if=3Dnone,format=3Draw,id=3Dd0 \
> > >      -kernel arch/sparc/boot/image -no-reboot \
> > >      -append "root=3D/dev/nvme0n1 console=3DttyS0" \
> > >      -nographic -monitor none
> > >=20
> >=20
> > Hi Guenter,
> >=20
> > Thank you very much for the detailed reports and I apologize for the
> > fallout of this.
> >=20
> > I think this is related to missing endian conversions when handling the
> > shadow doorbells. I'm not sure if there is a kernel issue here as well,
> > because as far as I can tell, the shadow doorbells are updated like so:
> >=20
> >    old_value =3D *dbbuf_db;
> >    *dbbuf_db =3D value;
> >=20
> > (where `value` is the new head/tail value depending on if this is an sq
> > or cq).
> >=20
> > Keith, is the kernel doing something magically here I am not aware of,
> > or isn't this missing some cpu_to_le32() / le32_to_cpu() calls as well?
>=20
> Wouldn't that mean that nvme doorbell support would be broken in Linux
> on all big endian systems ? Maybe it is, but it seems a bit unlikely.
>=20

No, not broken in general - only for shadow doorbells. On regular MMIO,
the linux helpers takes care of endianness (and so does the MMIO
callbacks in QEMU). However, for shadow doorbells, the doorbell value is
written to host memory - and Linux (and QEMU) does not handle that
correctly wrt. endianness.

I got it all working with the series I just posted for QEMU (v4) and
fixing endianness conversion for the above in the kernel (patch pending
for linux-nvme).

--j/IwTc/6xzAI0XOB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmOXMIwACgkQTeGvMW1P
Dem4ewf+KWLs4IaHPuK/tk0td9AUs7xcfomk55yrkVe+kr75tsNhQxuUcreQqYwO
/P/FmtxDTGBsQS81LONMjSSgw35l98rRp8fCnUjfL9JiRANOgxv/ws5pDDHGtndH
GI4IqXMi18lMN+/OUKZOF/2NExF+QElMpj0T6hd64vW4wFO/4DxQzrLvmax53uEC
J1rPmSg80N65qWoFrPo7ZVVx9tjgqmcgg7f2e721rjfcO72bj7YuF+r7vf4Ewm4i
ts+1YXAVrrHElEjI5SYU2JNPiqoM17bFsAqU65+a3n4sEQjtrQvI1bgFqsKkYeTD
a/mvKkBLRRD/Yi1H5gqZlUQIJeYxlQ==
=fwi5
-----END PGP SIGNATURE-----

--j/IwTc/6xzAI0XOB--

