Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 309A33D4656
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Jul 2021 10:39:05 +0200 (CEST)
Received: from localhost ([::1]:33492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7DBX-0008RB-Ed
	for lists+qemu-devel@lfdr.de; Sat, 24 Jul 2021 04:39:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m7D7M-0007UP-Ct; Sat, 24 Jul 2021 04:34:44 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:44469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m7D7K-0002j1-9m; Sat, 24 Jul 2021 04:34:44 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 126B158165F;
 Sat, 24 Jul 2021 04:34:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Sat, 24 Jul 2021 04:34:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=PiF8QmSO3HgEIvm8pivHAG6L1EK
 t68sKUyLG7nvtd7k=; b=AlD1Q0CoQYMX0PVnEWE2invWWa2Tbrp7U8MDUJQ0jrB
 3FgMbnRDBj2Oe5XHYhnEmDgfNKn/Lv0vwrrv8LU9UqWWFv3zldQc9cqoW+C+sMZ0
 I8veaLhwRPF+gSlGcHX4jnknudlq9BuvdNhhtWoI7yg+dacfPswcs/sGsW5sil51
 eVmG0eWI9TnXYoR0jtBmCPr/HtNsCFPkwNDusIEInLVNVEbT9WYlmT2heb5Qd5BR
 CYAb+0sKDDyYsQ05eoIrIyUbyHvYJODDDXSyTjY5iTAMVKUTxYUhS+kGduwEAGNw
 8zvEShL3fOi+By1COI1oWo0WJTuloUXbcvd7j3OwslQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=PiF8Qm
 SO3HgEIvm8pivHAG6L1EKt68sKUyLG7nvtd7k=; b=NWZxHTMbESlKZz9FaMeb1E
 /vvFeHjNInOKyeSwyFoqB5R2I2lknfvDelz53zArYX61oQIJzJhRYHGL/vBgbwwI
 Soa6kSZvrXJ1MehrEg2UoN5ySL4hoS5zHTqCfB8kie7cxf5iFentZK55yWIKQi0/
 DhE2bhLxAkPAIJWLgNW5usRV8wlclJFfTmS6MmL+gjTFhLNXjFFDdtrxG5uFj9Fd
 dxHfcGdwfdtCuv6QHtS2ugiWTwOe2v0ANtvDXHvBXgcCX/CJmGbncLMTtUPi4q24
 m3BZNfUItncUo0UHmBCc2GxGHJZmrKc2ljO3WR3VT3apm69nJPMuTbs7KwcmQ62w
 ==
X-ME-Sender: <xms:ndD7YFnoufpqXQ1HLUSH9B7KIUKgJkwIKD2WwtbsgXt5QsmLPx8dRw>
 <xme:ndD7YA0A6m-K41TlnwTP7xNUsMNSC88XlEtZwM4zJG_4umfXxmjQOK2qCvIu66g7i
 RUS3aAr1eXChypME7M>
X-ME-Received: <xmr:ndD7YLoLCiz3Z49RjnwCJSdz9v0COpnncSMouUwGwJ1OAtXUSgP3UcI3IjJoGcnjXidA2DJKi2AjA_0MK3QDzO5cQrPaO1qnFvvdtM2yvhB8fuK8FQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgedtgddtgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:ndD7YFmGKycGva64X-VIC8w-2ifRGfsZ236lBy3zy1LXlMmRMNsNcQ>
 <xmx:ndD7YD3uiwxfBIS47Qcj-xOlMi3P21ZiB5Hiz9lpekhdvLFtyozgyQ>
 <xmx:ndD7YEvawRb21ZmO8yrhSfk3RxnOkR3UaYUnbGOdxUcIU9bOxeIT6g>
 <xmx:n9D7YK2-KmxEQSidvh0h7zEksMLd6-JtSOEtHry5RXX1wO6QecKzJQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 24 Jul 2021 04:34:35 -0400 (EDT)
Date: Sat, 24 Jul 2021 10:34:32 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v5 1/5] hw/nvme: split pmrmsc register into upper and lower
Message-ID: <YPvQmEJI85eIwMKf@apples.localdomain>
References: <20210719224647.68559-1-its@irrelevant.dk>
 <20210719224647.68559-2-its@irrelevant.dk>
 <CAFEAcA_i5NZ9=EcuT++7BzFGi-y-V9N_q-4pydmzrrSRfgoW3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cPeM/AvExqgv5hJL"
Content-Disposition: inline
In-Reply-To: <CAFEAcA_i5NZ9=EcuT++7BzFGi-y-V9N_q-4pydmzrrSRfgoW3A@mail.gmail.com>
Received-SPF: pass client-ip=66.111.4.224; envelope-from=its@irrelevant.dk;
 helo=new2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
 Thomas Huth <thuth@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Laurent Vivier <lvivier@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--cPeM/AvExqgv5hJL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 20 14:40, Peter Maydell wrote:
> On Mon, 19 Jul 2021 at 23:46, Klaus Jensen <its@irrelevant.dk> wrote:
> >
> > From: Klaus Jensen <k.jensen@samsung.com>
> >
> > The specification uses a set of 32 bit PMRMSCL and PMRMSCU registers to
> > make up the 64 bit logical PMRMSC register.
> >
> > Make it so.
> >
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>=20
> > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> > index 2f0524e12a36..28299c6f3764 100644
> > --- a/hw/nvme/ctrl.c
> > +++ b/hw/nvme/ctrl.c
> > @@ -5916,11 +5916,12 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr =
offset, uint64_t data,
> >              return;
> >          }
> >
> > -        n->bar.pmrmsc =3D (n->bar.pmrmsc & ~0xffffffff) | (data & 0xff=
ffffff);
> > +        n->bar.pmrmscl =3D data & 0xffffffff;
>=20
> This mask is unnecessary because pmrmscl is uint32_t.
>=20
> >          n->pmr.cmse =3D false;
> >
> > -        if (NVME_PMRMSC_CMSE(n->bar.pmrmsc)) {
> > -            hwaddr cba =3D NVME_PMRMSC_CBA(n->bar.pmrmsc) << PMRMSC_CB=
A_SHIFT;
> > +        if (NVME_PMRMSCL_CMSE(n->bar.pmrmscl)) {
> > +            hwaddr cba =3D n->bar.pmrmscu |
>=20
> pmrmscu still needs to be shifted left by 32 here.
>=20

Hi Peter,

Patch 4 fixed this, but I have added the fix as well in this patch in
v6.

I believe the series is ready now, it just needs an R-b.

Thanks for your reviews on this!

--cPeM/AvExqgv5hJL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmD70JQACgkQTeGvMW1P
DenUeAgAn0yAnzINwBfqdY0XjRfBjPpqNlRcrVRvHGMbBJokHDHcR5cWCeQSXPOm
b8Y/UP/WpR26jYiccsHDqJzLPirCJxt6iIPk5iUbLSxwet9Nvb3TRPIStnCLUTtn
yvskx6moaLEno/1wslNvUSciM3uJNqlFBy3Mm6jnfEgbXXZ/27trMTzpSYwHyVdi
78P4MSU3ORrVRp84TOpE44HEJ9NqmDukdhOPIfnlx6rX4KFgoJ4Z22aLQ9zCMDOe
ji9jZakjNhRD4bVVQ3VIEm7z+vt/mBuxr6ZsvlEfyao3x7oSM5Qbq/MiI4nrP5oT
oXiTxLjK6jnnkhghBh09OJhNMWdhjQ==
=MnqC
-----END PGP SIGNATURE-----

--cPeM/AvExqgv5hJL--

