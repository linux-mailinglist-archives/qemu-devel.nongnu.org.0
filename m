Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E66D96253F3
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 07:42:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otNjb-0004Ky-2o; Fri, 11 Nov 2022 01:41:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1otNjB-0004KK-KC; Fri, 11 Nov 2022 01:41:26 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1otNj8-0006Bm-QE; Fri, 11 Nov 2022 01:41:24 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id C02215C00A8;
 Fri, 11 Nov 2022 01:41:17 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 11 Nov 2022 01:41:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1668148877; x=1668235277; bh=xA
 p8uh+0m6Ra2S2MenSs/WKpjuDAgkQF3Lxvjhjzkuk=; b=galn62aimqfs++6ri6
 JvpJcpyOIiNTluCXlK7MES7iOD4RoevXnz0PyyKWa3thD3xDoUiNUI3HrMD5rBsT
 BMOZQ9bdiwEtSaQ4y+6J4TZ/EWP/cvU9J6STD6Wnjp4JuRA3BrVhJSZybTwyY3AG
 7pzly8vuCba7KTD47BsxRE9aXMWkIbzuLJs64ibgmvopuAn5t73PBegjhDb+V0g6
 FebaS4PWr1mTbqct9/FA2uvWVwTqzuoW8mjFlpGngl99erSky42nw19G44gflRBM
 9FO7Tyc8bR3Lx7s5MDQK9dkqOgNQer9hP4gYqswJl/9AdO88SNo+xj1BlgoheyK+
 zsxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1668148877; x=1668235277; bh=xAp8uh+0m6Ra2S2MenSs/WKpjuDA
 gkQF3Lxvjhjzkuk=; b=T+5li5O9sV1A9qSs/g7/GiP5dEatriVzybwPkPFruI8I
 7eXJe0bKfiewixpLmoHUGen/WZCMnTP3cn9G8HchOFWyYG/4R6M0v3GPLEO160iS
 iiAnFfjN6OCNe0jn2iQ/HuRbKtgrTrhjgLwAYJwERRQzp+QqALAte8bYnm0EvoSc
 ICt20TeuzGMDxZG6Uu/+1BbF002d741tyq5r6buaZ5/gDmdYEu0M+aNrfYl3nl9Y
 +2+xPlTHPzwoqycxXYVOfiiHEVrkd8lT6J9W+WYO2O0zOthzCwoBkSsXbZLd899I
 YQNa9ir9YEmh6aIYRJhI9dITlH2nKvCSq36+nL6VaA==
X-ME-Sender: <xms:jO5tY9BcJK6RKnh6RqGZ9YyogvxX4MP40Sm0nsZrQSrEmgo3SKAEzw>
 <xme:jO5tY7iAlAj05uHcyd4MeGjRZ7vz4wSMHDuz5F1ihRjN-clT34Vhh602wqxTaEJEW
 lA6IBx0BwRRCwCR7Mg>
X-ME-Received: <xmr:jO5tY4l24EMOpMtU12INDO2epoS1yO2HJ4wMHZcCY9JgBPBrRrSsJ65yD0dgmDTQP59uli8AM9yUTh0kqDYpj1idNBlxNg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeehgddutdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhephfejgffggeevkedvueektdelleetueffheeigeduteffudekvdekteekledt
 gfeinecuffhomhgrihhnpehquggvvhdrihgunecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:jO5tY3z6QOpwQanoB1qHjMR0RaQW_5UHhCnoD5otjguItg4SyY8kgQ>
 <xmx:jO5tYyTTSc2ogsXoVjYu-bAAdQVurYfY51rLnRTx3lE49HPzZzdr5g>
 <xmx:jO5tY6baNxrQa6_l7sat7gzVPgHVCYbWcGYlAUJF6dIBQscgYGWLPw>
 <xmx:je5tY_IirIZpPYtq-_Z7MflY-AWKms-IgRrmzEivqUzYTvgLwX9cUQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Nov 2022 01:41:15 -0500 (EST)
Date: Fri, 11 Nov 2022 07:41:13 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v3 1/2] hw/nvme: fix incorrect use of errp/local_err
Message-ID: <Y23uiV5Ue2YKaIS7@cormorant.local>
References: <20221110220805.26816-1-its@irrelevant.dk>
 <20221110220805.26816-2-its@irrelevant.dk>
 <87iljmdmlk.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="KxnK6zK5RO2q0ABR"
Content-Disposition: inline
In-Reply-To: <87iljmdmlk.fsf@pond.sub.org>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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


--KxnK6zK5RO2q0ABR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 11 07:36, Markus Armbruster wrote:
> Klaus Jensen <its@irrelevant.dk> writes:
>=20
> > From: Klaus Jensen <k.jensen@samsung.com>
> >
> > Remove an unnecessary local Error value in nvme_realize(). In the
> > process, change nvme_check_constraints() into returning a bool.
> >
> > Finally, removing the local Error value also fixes a bug where an error
> > returned from nvme_init_subsys() would be lost.
>=20
> Would it be lost?  It's the hunk below:
>=20
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >  hw/nvme/ctrl.c | 48 +++++++++++++++++++++++-------------------------
> >  1 file changed, 23 insertions(+), 25 deletions(-)
> >
> > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> > index ac3885ce5079..a5c0a5fa6ce2 100644
> > --- a/hw/nvme/ctrl.c
> > +++ b/hw/nvme/ctrl.c
>=20
> [...]
>=20
> > @@ -7586,7 +7585,6 @@ static void nvme_realize(PCIDevice *pci_dev, Erro=
r **errp)
>    static void nvme_realize(PCIDevice *pci_dev, Error **errp)
>    {
>        NvmeCtrl *n =3D NVME(pci_dev);
>        NvmeNamespace *ns;
>        Error *local_err =3D NULL;
>=20
> @local_err is null.
>=20
>        NvmeCtrl *pn =3D NVME(pcie_sriov_get_pf(pci_dev));
>=20
>        if (pci_is_vf(pci_dev)) {
>            /*
>             * VFs derive settings from the parent. PF's lifespan exceeds
>             * that of VF's, so it's safe to share params.serial.
>             */
>            memcpy(&n->params, &pn->params, sizeof(NvmeParams));
>            n->subsys =3D pn->subsys;
>        }
>=20
>        nvme_check_constraints(n, &local_err);
>        if (local_err) {
>            error_propagate(errp, local_err);
>            return;
>        }
>=20
> @local_err still is null.
>=20
>        qbus_init(&n->bus, sizeof(NvmeBus), TYPE_NVME_BUS,
> >                &pci_dev->qdev, n->parent_obj.qdev.id);
> > =20
> >      if (nvme_init_subsys(n, errp)) {
> > -        error_propagate(errp, local_err);
>=20
> Since @local_err is null, this error_propagate() does nothing.  The
> error from nvme_init_subsys() remains in @errp.
>=20

Oh, right. Thanks.

I misread the function documentation, getting the impression that it
would overwrite dst_errp regardless of the value of local_err.

--KxnK6zK5RO2q0ABR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmNt7ogACgkQTeGvMW1P
DemTUAf+OhA6hv1zZz8sn3/cfPUccJmm8O1oEB3+2VOOQJAuZi0Z9AybdA2dQbSW
hwGxU47xmg674oxJUm08cF7EAaPUr/GLdCnaq7B9Nt+6G63ueXTp7mqaBvWjxioP
FYJipj3NmBNF886kEQFaf9XKYtducIclM52mYSVercyy63/N4yX5H6TgsDjhPk2k
Fw64r2dA4/ksFMMarvaZJRfm9hbRznFhYN9i8FsH06iKofN040eyR8/MaPmqzZNk
HSiUrlWyqCPafy5ii9rGkZear6KPlq9amreMDpOw5cDCDY3X9RCRC88TFqgvkI+7
mc9S1rKUw/UDbGILNQPemZQ9xIkeqQ==
=X0Nx
-----END PGP SIGNATURE-----

--KxnK6zK5RO2q0ABR--

