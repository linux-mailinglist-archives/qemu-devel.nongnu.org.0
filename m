Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 355A333915A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 16:33:55 +0100 (CET)
Received: from localhost ([::1]:58840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKjnV-0007xl-S7
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 10:33:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lKjS2-0004rd-4t; Fri, 12 Mar 2021 10:11:42 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:44339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lKjRx-0007cC-9M; Fri, 12 Mar 2021 10:11:41 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id D4939D2E;
 Fri, 12 Mar 2021 10:11:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 12 Mar 2021 10:11:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=o11I/n6/YaU/BE038VmvNfpiNbn
 Uv/dYNuOsbl1uyRI=; b=FDZcKhuhdPzvBfWt20nWHXJGRenlzkzj2IJJ2FIQM9R
 bgIv1zgI16EQTtAcmhrpL3pP4aqZavGAyixR9gfZ5MSqtHZsKW3BuETU1QKExf2y
 lKWzZOO8JpSZu7N7gr7VYsbi/sNmprVpLFQdxanWOo2sYR/vFHMMELMD39ZTY7Jr
 XbBiftDzcQaiQpvd86zqbYfrtcRfuEtr4LghtUwnTQqS9a5iAqnhfYhScxkHTak9
 QD0k2jfSeOamo1lFAcSIIfuifIu2xdFsNQx6QI6cXUDQFwK4hPJ7mKev7JfeliXC
 qBXfDbw7cyuASG0I3Szco01ElR9f7b3XVTJP7JzomlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=o11I/n
 6/YaU/BE038VmvNfpiNbnUv/dYNuOsbl1uyRI=; b=BFWO++X5sp9t/8fay4ZaD7
 GkrQaRN1z9WxYBn/prRiFy/w0G1LyH+z7H37CCaIpv0obvOoo7vgHgPyRfUEMPPd
 QolkPfs7HaT46+Re2YxNvJvj1Al9F1xtNJkR4dDArS1Dhy6xQVhox2fclnUsVL+e
 w8f3WiyDY528/nedRKWhafkavC2jIHHtquV8hVNcO8qo3b51sjbBxUkHDkw0nbOs
 bGzfIUzDUfoltiZpFYZHu+tWwa7IJPrCEcZckCzwt9uAV1VVXkigHC5iADlVzPws
 DszTrTJfwtFQLk/LW6oC7LGDdPWmx708L28jGvy/6AkIasKDJe16tSRioTq9JBgA
 ==
X-ME-Sender: <xms:pIRLYLdOUFZL9cCoSWej-QagP0cV76MDTtCsbbwNJsNzJP7UYUaA6w>
 <xme:pIRLYBJvE5Jut_4YDuEA7fAhqN84iHR41x-9Fk3ZYP9Q_oHrNb2MLO4LXcdPPz9zS
 gOqTJED_amIN26KSZI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddvvddgjeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:pIRLYBZszUkA4zMEgYz7Q26mHY6K-OBFLeaMTNNl0CJabv9FZgDSKA>
 <xmx:pIRLYEu2hXWG_WtFwdl0FTJ-TuiFgOOOBc0WixwDgFLJyIrdIh3vYA>
 <xmx:pIRLYGsJ2VHLAIdmHwEKWRDPdUNG0rwkpgKvOyBdSePI1Maa1FABJw>
 <xmx:poRLYASn6bPAvOiqcAAWgDiVoWdh4XvTL4VEL9Yqx478sMB4TDGS8A>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 755E5240054;
 Fri, 12 Mar 2021 10:11:31 -0500 (EST)
Date: Fri, 12 Mar 2021 16:11:29 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL v2 19/38] hw/block/nvme: align zoned.zasl with mdts
Message-ID: <YEuEoQL0O5fvhESA@apples.localdomain>
References: <20210309114512.536489-1-its@irrelevant.dk>
 <20210309114512.536489-20-its@irrelevant.dk>
 <CAFEAcA_1ro7DRp0BJdv5Lt0ehRH9Vwy9oCvwn0kOprmB8h6vAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MkY1L6j6xEJqTHPr"
Content-Disposition: inline
In-Reply-To: <CAFEAcA_1ro7DRp0BJdv5Lt0ehRH9Vwy9oCvwn0kOprmB8h6vAw@mail.gmail.com>
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Klaus Jensen <k.jensen@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--MkY1L6j6xEJqTHPr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar 12 13:07, Peter Maydell wrote:
> On Tue, 9 Mar 2021 at 11:45, Klaus Jensen <its@irrelevant.dk> wrote:
> >
> > From: Klaus Jensen <k.jensen@samsung.com>
> >
> > ZASL (Zone Append Size Limit) is defined exactly like MDTS (Maximum Data
> > Transfer Size), that is, it is a value in units of the minimum memory
> > page size (CAP.MPSMIN) and is reported as a power of two.
> >
> > The 'mdts' nvme device parameter is specified as in the spec, but the
> > 'zoned.append_size_limit' parameter is specified in bytes. This is
> > suboptimal for a number of reasons:
> >
> >   1. It is just plain confusing wrt. the definition of mdts.
> >   2. There is a lot of complexity involved in validating the value; it
> >      must be a power of two, it should be larger than 4k, if it is zero
> >      we set it internally to mdts, but still report it as zero.
> >   3. While "hw/block/nvme: improve invalid zasl value reporting"
> >      slightly improved the handling of the parameter, the validation is
> >      still wrong; it does not depend on CC.MPS, it depends on
> >      CAP.MPSMIN. And we are not even checking that it is actually less
> >      than or equal to MDTS, which is kinda the *one* condition it must
> >      satisfy.
> >
> > Fix this by defining zasl exactly like mdts and checking the one thing
> > that it must satisfy (that it is less than or equal to mdts). Also,
> > change the default value from 128KiB to 0 (aka, whatever mdts is).
>=20
> > @@ -2144,10 +2142,9 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeR=
equest *req, bool append,
> >                  goto invalid;
> >              }
> >
> > -            if (nvme_l2b(ns, nlb) > (n->page_size << n->zasl)) {
> > -                trace_pci_nvme_err_append_too_large(slba, nlb, n->zasl=
);
> > -                status =3D NVME_INVALID_FIELD;
> > -                goto invalid;
> > +            if (n->params.zasl && data_size > n->page_size << n->param=
s.zasl) {
> > +                trace_pci_nvme_err_zasl(data_size);
> > +                return NVME_INVALID_FIELD | NVME_DNR;
> >              }
> >
> >              slba =3D zone->w_ptr;
>=20
> Hi; Coverity points out a possible overflow here (CID 1450756):
> n->page_size is a uint32_t, and n->params.zasl is a uint8_t, so
> the "n->page_size << n->params.zasl" will be done as 32-bit arithmetic;
> but it is then compared against a uint64_t data_size.
>=20
> Is this an overflow that can never happen (ie a false positive), or
> should the RHS of the comparison be done as 64-bit arithmetic by
> adding a cast ?
>=20

Thanks!

I think a cast is in order. I will get a fix out.

--MkY1L6j6xEJqTHPr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBLhKAACgkQTeGvMW1P
DenHXgf/XRLZI4Nk21/RV+kpcTTQZjGEkEBF46n4WdIoBDWXlODu/IqNZNY0l6La
72hTQ3QVF54WhK15gOo3hXcbiHyjLfXH5FYa++mTIsr+aCMGpXvXCIVSjTbn73aP
FNREnXPe/jcmxKz1n6FObMlBfA/jJFIiLfA1Qe9oGf9EnXzt4hi2pbjR+ylyrAh5
hvVpR5nbnAg84ywB4bH61+QC4SACvuW2tzxVGWYMf1kQBMsxckbm4PnU7wlvbyIf
KyrLwg/0bBtBVKc4cDJeuNazd4zjCKCpt2e4Le1huFEd330y6UaLX3BwTccu3siM
j12hfSU5xFws9lnV5R/paB05CpNFkQ==
=8hmM
-----END PGP SIGNATURE-----

--MkY1L6j6xEJqTHPr--

