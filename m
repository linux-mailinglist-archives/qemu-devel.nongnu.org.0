Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07052508682
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 13:01:19 +0200 (CEST)
Received: from localhost ([::1]:38426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh85F-0007nT-LC
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 07:01:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nh7ho-0003bJ-Gr; Wed, 20 Apr 2022 06:37:04 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:50095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nh7hl-0007XO-SF; Wed, 20 Apr 2022 06:37:04 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 52733320201D;
 Wed, 20 Apr 2022 06:36:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 20 Apr 2022 06:36:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1650451017; x=1650537417; bh=LN
 xTOOap4MWcrYnVLDA76PUx7yGZafiU5V2I9kN1BQk=; b=iWbF8aIBLxzjGJJEtY
 7HszjwScGo4eWdrSWwegHPnS/ZancCK3GoS7rMoRfhHrzi6A/7tQFsBEYbzUJjnR
 T1NYYuKHcoyVf0SNmcBE6IOwK7vXGbz+lLqB5BZ9Gs8b12Lk343stZnwTwKgCY1d
 +410MOkPE47Kdttdy+5JRXHW6/y6x22Cfh9xI35bDOhjhDCqm3gQABbsVctMFDjN
 YtEZcBlMkwptV1ONUnOUxVNyJevZTM33vqWBgrYzfSXQSoIfrW43f8qWzdzqbF1v
 X8Zr0Bh5BRXhTJqvmRaqxiujAg6tcDGYcxta8bdbhBROCHSgP5N1Ke/A7taZ+1W0
 eOMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650451017; x=
 1650537417; bh=LNxTOOap4MWcrYnVLDA76PUx7yGZafiU5V2I9kN1BQk=; b=k
 VKVg6dUhfwoXcvyOKh8d1pTIPKATCEZAjOL7kJBRE3dD68bypUMlkg3fXxdrMQzD
 jUOe2Nl/7CmCX0tEloKxfeUoD+1gDuAHBHwumJkXMTsmXOGSgciQLXr2qRDI9Rjk
 Q7lb2kyyjwP6O/wjXBcGFskUJeaZ+ndnIneTxYWn0nXpE971dw5I/it3AuPI7i8J
 I03r0Bog+9HTHlCrvIa0fcnQtYG46g+BhruHeoSVtxfaNwCAsRpy19bBWyuzFbK4
 rtsRHnLQmbmND7T7CG/lByYie9A1YMnupsdtV3OajCqtLQvVjFcZ5CrQy7orqYkl
 UFUGuuj0DP+qpLGrzgivQ==
X-ME-Sender: <xms:SeJfYlt0NoBpe0xjN5DOrCP_SuV9gibQqBJ8CeywX9BmP5it_CI5-Q>
 <xme:SeJfYudok_n7KumSvjvIbIuMD_q48CtrD59kBp9_n4nxz8zhYb2CaneMl-HBvX0Iz
 gFOTnE870kefvGiR8o>
X-ME-Received: <xmr:SeJfYoyMV7ISy5NUgXi0NDYm9TN_ksQ-jKPxYaLe7aus6KrkdfKFN-HavVAWbkfajTGrRAxOh0ONbGeYsiA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtddtgddtgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesghdtre
 ertddtjeenucfhrhhomhepmfhlrghushculfgvnhhsvghnuceoihhtshesihhrrhgvlhgv
 vhgrnhhtrdgukheqnecuggftrfgrthhtvghrnhepjefgjeefffdvuefhieefhffggfeule
 ehudekveejvedtuddugeeigeetffffjeevnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:SeJfYsMLgNUCCg_rjfPm4L4spQwmN1S85nLlLtl9NgFvZvHtTy1MIw>
 <xmx:SeJfYl_4HSCH6I0bJaYpoH4v3ji-_z970Z9ZK-Id1pHuaDKA--W-iA>
 <xmx:SeJfYsW2YnSNXZ4OcZzFtYbDm-nLTxBKL3j7IXmsrSGcrHlC1Ighxg>
 <xmx:SeJfYokhUBtTNKErK3KRyjTJBy4mGlXoIa2GRkhrpVP6BQepQaoiRA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Apr 2022 06:36:56 -0400 (EDT)
Date: Wed, 20 Apr 2022 12:36:54 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Dmitry Tikhov <d.tihov@yadro.com>
Subject: Re: [PATCH] hw/nvme: add new command abort case
Message-ID: <Yl/iRnvEj+tDycUI@apples>
References: <20220420082044.n6orslk2aukj2jai@localhost.localdomain>
 <Yl/csehng+W0gfQD@apples>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="t42nHk+PG8M3TNWd"
Content-Disposition: inline
In-Reply-To: <Yl/csehng+W0gfQD@apples>
Received-SPF: pass client-ip=64.147.123.19; envelope-from=its@irrelevant.dk;
 helo=wout3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: kbusch@kernel.org, ddtikhov@gmail.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, linux@yadro.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--t42nHk+PG8M3TNWd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 20 12:13, Klaus Jensen wrote:
> On Apr 20 11:20, Dmitry Tikhov wrote:
> > NVMe command set specification for end-to-end data protection formatted
> > namespace states:
> >=20
> >     o If the Reference Tag Check bit of the PRCHK field is set to =E2=
=80=981=E2=80=99 and
> >       the namespace is formatted for Type 3 protection, then the
> >       controller:
> >           =E2=96=AA should not compare the protection Information Refer=
ence Tag
> >             field to the computed reference tag; and
> >           =E2=96=AA may ignore the ILBRT and EILBRT fields. If a comman=
d is
> >             aborted as a result of the Reference Tag Check bit of the
> >             PRCHK field being set to =E2=80=981=E2=80=99, then that com=
mand should be
> >             aborted with a status code of Invalid Protection Informatio=
n,
> >             but may be aborted with a status code of Invalid Field in
> >             Command.
> >=20
> > Currently qemu compares reftag in the nvme_dif_prchk function whenever
> > Reference Tag Check bit is set in the command. For type 3 namespaces
> > however, caller of nvme_dif_prchk - nvme_dif_check does not increment
> > reftag for each subsequent logical block. That way commands incorporati=
ng
> > more than one logical block for type 3 formatted namespaces with reftag
> > check bit set, always fail with End-to-end Reference Tag Check Error.
> > Comply with spec by handling case of set Reference Tag Check
> > bit in the type 3 formatted namespace.
> >=20
>=20
> Note the "should" and "may" in your quote. What QEMU does right now is
> compliant with v1.4. That is, the reftag must NOT be incremented
> - it is the same for the first and all subsequent logical blocks.
>=20
> I'm a bit hesitant to follow v2.0 here, since we do not report v2.0
> compliance yet. I'm honestly also a bit perplexed as to how the NVMe TWG
> ended up considering this backwards compatible. As far as I can tell
> this breaks current hosts that do set the reference tag check bit,
> provides a valid ILBRT/EILBRT and expects it to succeed.

Ok, so reading the spec more closely...

The Invalid Protection Information should not be set just because the
reference tag check bit is set. It should be set *if* the controller
chooses to check it and it fails. However, in v2.0, the controller is
allowed to ignore it and not perform the check.

So, just because the host sets the bit, that does not mean we fail the
command. However, a difference is that a v2.0 compliant controller
should return Invalid Protection Information or Invalid Field in Command
instead of End-to-end Reference Tag Check Error if the check fails.

--t42nHk+PG8M3TNWd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmJf4kQACgkQTeGvMW1P
Dek0bAgAkQIpInZ93CLlKCjynEl3x5/Nib1wPsAarJoPbw+HAc4fjZ1/beKt9StN
KQocZDuvfYQa2t6nFii2cHuoeoLe/J/NVtUJlmQZipPOQgiNYjY8K9lk2UQu/fOO
43VsUy5a9uW0cW2zzWJ1k7pNeZat8on4PatzX+bH0VtM9SH15TMr9cWMnFxl8+pa
vTue1zsC2fwuULbcSt27jet72W7EaZH3ChtDk24ZKqmYsfllHkrdSDLtqwT+UihB
j88eHg57KhPQVfTgSIRK6jZbV/ShAy9TLh+8XDIafVSFRUr0Vci/Z/uyM1Ad0z44
US5V1bt7pXW37zWwlw73J7ZbfIyxzw==
=I2qy
-----END PGP SIGNATURE-----

--t42nHk+PG8M3TNWd--

