Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5D0625452
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 08:11:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOAZ-0008VE-7y; Fri, 11 Nov 2022 02:09:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1otOAW-0008SB-8E; Fri, 11 Nov 2022 02:09:40 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1otOAU-00020P-7U; Fri, 11 Nov 2022 02:09:39 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 6AD525C02D8;
 Fri, 11 Nov 2022 02:09:36 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 11 Nov 2022 02:09:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1668150576; x=1668236976; bh=Ji
 CdXLk+tDYcnHwmAYLx+ypwPsQ9VjTOckSiyx/omR0=; b=l846ZXAn3c/MJU5bLw
 +RHluWO3H2TDIDHf5c3tg25IAJ08n+z181N/I89BQW3B1SVgPkhQ/UDI5nvjJJ8d
 V24TGx5sULbi6OyOCzkRAnCwb1dwUru+86uFRQMYFSr1/bxhkiai9ZSBOpjXRu2J
 eusZKIxb4rOgIp1Uz0EAqd4eKCjZTvbOa0S/D0LHivtqGON1iCOeORVkNKkRZ1Eo
 ZNzyIs5U9t5Hta4tx3Th7F6LdjcCUQUJRCCdiopG/un8NVw+e0n3n1cdpLqpmpMI
 WBHyVtP1NxkeoOWgJOxvny80NaSrlCxdcHJmPXnVgeDXOZDQii09812kdc/M7osM
 pXUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1668150576; x=1668236976; bh=JiCdXLk+tDYcnHwmAYLx+ypwPsQ9
 VjTOckSiyx/omR0=; b=jPTONaTlocWvoC2d87qTDN/ep7nNbc116sgcWZ4wC/Hl
 BJWwbaf0M4cHEj9V8oBmPlc4HuKTh9Ds3DTzvd+JJzdP9tv97Gt04GzJjRS/CS+I
 I7z+uTVF4NZAqUoLUpH37nr9AdVFeYg8yzVF/1g23JafbSUwkKB+TCEFvcefr3mK
 YLUr7QSZVM2QmaEho6lR5EqDnBdXkhcZv6S3tZHJOQMzHMRsUPe+v1R5tSx+TZxb
 8202B8xcvaerXe6RxG70QZeYAInzmntTOqCx94SHSAWGBh2u/TDQFnJgCUWhLYUd
 u7Rzz/qrV0yU1tqEBNJxElYzfYCSVy48VmuhrMznjg==
X-ME-Sender: <xms:L_VtY-JQfpssYWNDjZgHpR5NaihXE7ddsemsOCCGbMA3kltttkOGZQ>
 <xme:L_VtY2KYwYWMFDoP1Ng5AqoAnvr-r6sROOmsjxsKONATwaMLCJK5m9TuB8lGCL_wr
 eRy9qeJ6WlK8fz7isM>
X-ME-Received: <xmr:L_VtY-tFDlAvRCrwTYiJXMg6jnxbbA9eY64LxsF_Z8CECDCtW-E2V-PTadB2Hz7m6520SmQR4ZcthZ4_8ebnApcflvnEqg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeehgddutdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhephfejgffggeevkedvueektdelleetueffheeigeduteffudekvdekteekledt
 gfeinecuffhomhgrihhnpehquggvvhdrihgunecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:L_VtYzZTbGzYWGtf6J7fKfhprz24ycu22d75jlzlYKRFJB09ilwlqw>
 <xmx:L_VtY1a27UKpZZOj38CO76ZBDFWMU_yZxAFXNWj4zY1Uc9dXUy3SoQ>
 <xmx:L_VtY_CCNj1N_llbcm1YQxgJkuzxK0MCwrDk__AcIM006bAtKW2_Jg>
 <xmx:MPVtY4w-v8Exn5ljCxiwh5h2uwDZnBtgGLfkNCjytillhZDzYmQgPQ>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Nov 2022 02:09:33 -0500 (EST)
Date: Fri, 11 Nov 2022 08:09:30 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v3 1/2] hw/nvme: fix incorrect use of errp/local_err
Message-ID: <Y231KjtTIFwNYFTK@cormorant.local>
References: <20221110220805.26816-1-its@irrelevant.dk>
 <20221110220805.26816-2-its@irrelevant.dk>
 <87iljmdmlk.fsf@pond.sub.org> <Y23uiV5Ue2YKaIS7@cormorant.local>
 <874jv6dlpf.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eJjrNFHD2/d8qhY0"
Content-Disposition: inline
In-Reply-To: <874jv6dlpf.fsf@pond.sub.org>
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


--eJjrNFHD2/d8qhY0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov 11 07:55, Markus Armbruster wrote:
> Klaus Jensen <its@irrelevant.dk> writes:
>=20
> > On Nov 11 07:36, Markus Armbruster wrote:
> >> Klaus Jensen <its@irrelevant.dk> writes:
> >>=20
> >> > From: Klaus Jensen <k.jensen@samsung.com>
> >> >
> >> > Remove an unnecessary local Error value in nvme_realize(). In the
> >> > process, change nvme_check_constraints() into returning a bool.
> >> >
> >> > Finally, removing the local Error value also fixes a bug where an er=
ror
> >> > returned from nvme_init_subsys() would be lost.
> >>=20
> >> Would it be lost?  It's the hunk below:
> >>=20
> >> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> >> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> >> > ---
> >> >  hw/nvme/ctrl.c | 48 +++++++++++++++++++++++-------------------------
> >> >  1 file changed, 23 insertions(+), 25 deletions(-)
> >> >
> >> > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> >> > index ac3885ce5079..a5c0a5fa6ce2 100644
> >> > --- a/hw/nvme/ctrl.c
> >> > +++ b/hw/nvme/ctrl.c
> >>=20
> >> [...]
> >>=20
> >> > @@ -7586,7 +7585,6 @@ static void nvme_realize(PCIDevice *pci_dev, E=
rror **errp)
> >>    static void nvme_realize(PCIDevice *pci_dev, Error **errp)
> >>    {
> >>        NvmeCtrl *n =3D NVME(pci_dev);
> >>        NvmeNamespace *ns;
> >>        Error *local_err =3D NULL;
> >>=20
> >> @local_err is null.
> >>=20
> >>        NvmeCtrl *pn =3D NVME(pcie_sriov_get_pf(pci_dev));
> >>=20
> >>        if (pci_is_vf(pci_dev)) {
> >>            /*
> >>             * VFs derive settings from the parent. PF's lifespan excee=
ds
> >>             * that of VF's, so it's safe to share params.serial.
> >>             */
> >>            memcpy(&n->params, &pn->params, sizeof(NvmeParams));
> >>            n->subsys =3D pn->subsys;
> >>        }
> >>=20
> >>        nvme_check_constraints(n, &local_err);
> >>        if (local_err) {
> >>            error_propagate(errp, local_err);
> >>            return;
> >>        }
> >>=20
> >> @local_err still is null.
> >>=20
> >>        qbus_init(&n->bus, sizeof(NvmeBus), TYPE_NVME_BUS,
> >> >                &pci_dev->qdev, n->parent_obj.qdev.id);
> >> > =20
> >> >      if (nvme_init_subsys(n, errp)) {
> >> > -        error_propagate(errp, local_err);
> >>=20
> >> Since @local_err is null, this error_propagate() does nothing.  The
> >> error from nvme_init_subsys() remains in @errp.
> >>=20
> >
> > Oh, right. Thanks.
> >
> > I misread the function documentation, getting the impression that it
> > would overwrite dst_errp regardless of the value of local_err.
>=20
> Happens :)
>=20
> If you have suggestions on improving the doc, shoot.
>=20
> This commit's message could perhaps be adjusted like
>=20
>     hw/nvme: Clean up confused use of errp/local_err
>=20
>     Remove an unnecessary local Error value in nvme_realize(). In the
>     process, change nvme_check_constraints() to return a bool.
>=20
> What do you think?
>=20

Sounds good ;)

--eJjrNFHD2/d8qhY0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmNt9SoACgkQTeGvMW1P
DembKQf+Ldul26JtCTYd6hZmB+apFzMkOX6FSdDkEnTgYJiL4/Kjwgb8Bnuw5wpD
H0ANn1pjsXYjlKAlXGPHCHDb7LqMuY6khir4MoyI+X998/aut9sp3uxvkQPxYCAz
F4TQqHyilcSYrJll5QdfMkUhbrX2DkDXRNcTyLKMweMaAhmzY0zQRBJxosxtglKO
CzPzzZ76IA7AnUPEYGJrthUAlfGSytFfz5tTIS6h8uxddoLMCMkXG7TlL361LHzf
kvIgUJSA5dyQYFz3Ip/k6D9ZlKdboYWAOzRuJ8Tgm7tQ60Z0VqK+ic7/w+HDabyt
toss3QxXSOStsP5Lyc7DATv6WHxKkw==
=BtFa
-----END PGP SIGNATURE-----

--eJjrNFHD2/d8qhY0--

