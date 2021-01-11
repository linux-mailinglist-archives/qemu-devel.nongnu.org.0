Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D5E2F110F
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 12:21:22 +0100 (CET)
Received: from localhost ([::1]:33746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyvGD-0005af-Ee
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 06:21:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kyvB0-0003Yq-Ow; Mon, 11 Jan 2021 06:15:59 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:36341)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kyvAy-0007g2-2g; Mon, 11 Jan 2021 06:15:58 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 0DF9329AE;
 Mon, 11 Jan 2021 06:15:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 11 Jan 2021 06:15:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=zI351ZUevprHxmE6ihWlIGteUlO
 xLOTW28Aj6moLpO0=; b=anJwFE1NPo09Wx4foifyCavItqpo4hq+oowCauPi41b
 nu7vuYE9t6y8KmUypoGSu7j4i8hzaIbcSQFXn29/ND3FKUzUa2Kl7EigWf+US6nb
 Yf4fVdsQbrgO448MiUcPaD1JYVAlPTiauU3ccH7kjUd9zcwx2VZHo5lkXd/+H3Wd
 GVMeRLj6JjAiF/lL8l6MFQ6Rw+TxL6OsLvUzSzTMx3UGmi1PGrpsPu5o9j/OTy5E
 oaXUvyyh5OMXXwjzdtiBH/kyrlvTX7q8UdaFHDA0jd4iMBRyv+ut4sa2XxeEZU7C
 +5wqM8wSYFCgp7a5DB+ftrwp1ieR6xCYC1OfzCM7DSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=zI351Z
 UevprHxmE6ihWlIGteUlOxLOTW28Aj6moLpO0=; b=Nam47y9UyIqRbvSOk7BLv6
 lsusmDDE/Ixf2Kqdw5Cu1zoG6KWlgpqlCYxzA8ZSfQgSBRB6+UfK1/B3cFF+tthg
 xwIEWwfaZ5QmYd0NOFChpLSQieNtfYgMBQ0nCybU+406tuvCVluQUW3drN/Iu7tX
 lBEVXai3am6H6rRmz58ZfriqObpltIpN+EkLxCplU8ObjU4BuYDT2WKADZXe17da
 WxTFPeGAQ3FxtUdvvDWmbxKSo4ES2qMLbuYA5laq6k0TB8/arY7Z5X+wtJ/nvKA6
 5Kr3n+fLVW2WyuWilMi5pftAC1X5QCFbF3GgeJvetZoxbTe8m6YSr0sTJchNhqoQ
 ==
X-ME-Sender: <xms:ZzP8X6OB7MgUdjzJwabFsjvYUd1Iz2C4FwtpicBNNuMVT1XjOA1RXA>
 <xme:ZzP8X4_AZS1hM6PW8Nf-ZoxJDGpwS_CkERwR1-b7HXQRBNu0aZ8TCBOZQvuxFUjqb
 wqY7i0O3cjnLFSZjnM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehuddgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:ZzP8XxTPhzw4CJtTyk1dGSC35vofF09XCM913610h5cTGS0t7KFeMA>
 <xmx:ZzP8X6uPMk2oigt4LcigrLiDOmF6vuL8F3crOydzGCUxKueSTji4Yg>
 <xmx:ZzP8XyeSgkP2rPSs_6O2xS7z8AAMf7idCTKhZz4LnEjwXV3ky1E_Qw>
 <xmx:aDP8Xx5SoXJ7NjfG1rTvGhMwGx9_Ne1-8ttiWnI6a6MuqDiPVRhWKQ>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 38B6C108005F;
 Mon, 11 Jan 2021 06:15:50 -0500 (EST)
Date: Mon, 11 Jan 2021 12:15:48 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: zhenwei pi <pizhenwei@bytedance.com>
Subject: Re: [External] Re: [PATCH] hw/block/nvme: add smart_critical_warning
 property
Message-ID: <X/wzZK06bDdkuqRX@apples.localdomain>
References: <20210111075003.151764-1-pizhenwei@bytedance.com>
 <3ebda26a-2734-242b-c553-2092ba7f4b35@redhat.com>
 <X/wYhMjr03odt+eq@apples.localdomain>
 <85e2b54b-7fb0-26b1-8bd5-73d470d3b386@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="S0620OU5xz5IQYBP"
Content-Disposition: inline
In-Reply-To: <85e2b54b-7fb0-26b1-8bd5-73d470d3b386@bytedance.com>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: kbusch@kernel.org, kwolf@redhat.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--S0620OU5xz5IQYBP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 11 17:49, zhenwei pi wrote:
> On 1/11/21 5:21 PM, Klaus Jensen wrote:
> > On Jan 11 10:14, Philippe Mathieu-Daud=C3=A9 wrote:
> > > On 1/11/21 8:50 AM, zhenwei pi wrote:
> > > > There is a very low probability that hitting physical NVMe disk
> > > > hardware critical warning case, it's hard to write & test a monitor
> > > > agent service.
> > > >=20
> > > > For debugging purposes, add a new 'smart_critical_warning' property
> > > > to emulate this situation.
> > > >=20
> > > > Test with this patch:
> > > > 1, append 'smart_critical_warning=3D16' for nvme parameters.
> > > > 2, run smartctl in guest
> > > >   #smartctl -H -l error /dev/nvme0n1
> > > >=20
> > > >    =3D=3D=3D START OF SMART DATA SECTION =3D=3D=3D
> > > >    SMART overall-health self-assessment test result: FAILED!
> > > >    - volatile memory backup device has failed
> > > >=20
> > > > Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> > > > ---
> > > >   hw/block/nvme.c | 4 ++++
> > > >   hw/block/nvme.h | 1 +
> > > >   2 files changed, 5 insertions(+)
> > > >=20
> > > > diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> > > > index 27d2c72716..2f0bcac91c 100644
> > > > --- a/hw/block/nvme.c
> > > > +++ b/hw/block/nvme.c
> > > > @@ -1215,6 +1215,8 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, =
uint8_t rae, uint32_t buf_len,
> > > >       trans_len =3D MIN(sizeof(smart) - off, buf_len);
> > > > +    smart.critical_warning =3D n->params.smart_critical_warning;
> > > > +
> > > >       smart.data_units_read[0] =3D cpu_to_le64(DIV_ROUND_UP(stats.u=
nits_read,
> > > >                                                           1000));
> > > >       smart.data_units_written[0] =3D cpu_to_le64(DIV_ROUND_UP(stat=
s.units_written,
> > > > @@ -2824,6 +2826,8 @@ static Property nvme_props[] =3D {
> > > >       DEFINE_PROP_UINT32("aer_max_queued", NvmeCtrl, params.aer_max=
_queued, 64),
> > > >       DEFINE_PROP_UINT8("mdts", NvmeCtrl, params.mdts, 7),
> > > >       DEFINE_PROP_BOOL("use-intel-id", NvmeCtrl, params.use_intel_i=
d, false),
> > > > +    DEFINE_PROP_UINT8("smart_critical_warning", NvmeCtrl,
> > > > +                      params.smart_critical_warning, 0),
> > > >       DEFINE_PROP_END_OF_LIST(),
> > > >   };
> > > > diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> > > > index e080a2318a..76684f5ac0 100644
> > > > --- a/hw/block/nvme.h
> > > > +++ b/hw/block/nvme.h
> > > > @@ -16,6 +16,7 @@ typedef struct NvmeParams {
> > > >       uint32_t aer_max_queued;
> > > >       uint8_t  mdts;
> > > >       bool     use_intel_id;
> > > > +    uint8_t  smart_critical_warning;
> > > >   } NvmeParams;
> > > >   typedef struct NvmeAsyncEvent {
> > > >=20
> > >=20
> > > This is an easy way to achieve your goal.
> > >=20
> > > However a better way is to add a QMP command to
> > > change NvmeCtrl->temperature.
> > >=20
> > > See for example tmp105_initfn() in hw/misc/tmp105.c
> > > and qmp_tmp105_set_temperature() in tests/qtest/tmp105-test.c.
> > >=20
> >=20
> > Nice.
> >=20
> > +1 for this approach.
> >=20
>=20
> Using QMP command to change NvmeCtrl->temperature only triggers
> NVME_SMART_TEMPERATURE warning, it's OK to test the work flow of uplayer
> software, but it's not enough to test all the cases of each warning.
>=20
> From NVMe version 1.3 to 1.4, a new bit definition has been added(bit 5,
> Persistent Memory Region has become read-only or unreliable). Before we
> really hit this warning on a physical disk, we can use QEMU to test this
> feature(maybe another new feature in the future).
>=20
> I don't disagree "add a QMP command" solution, but I think QEMU should be
> able to emulate all of the warnings(not only temperature).
>=20

I think Philippe just made an example. It can be a QMP command that sets
the critical warning field.

--S0620OU5xz5IQYBP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAl/8M2MACgkQTeGvMW1P
DekcVggArqRC+WFHixjoRYh7ruEuRTIPHjN4iNfXPKAMFLWOi0zLLNRaTJ3TRkI8
/PeDxwRuWv537Wj9B8wDQSM9B1XjEqfNKmDpKm8vFPJWkSzCwPA3SWMGY8XIxvE2
1TksVFsxfK3QqQj8XYj/WXwtC4ewvJYHs5bHI7fcP2omCO2Z7EejzgnjHEwpEUY7
FNeNQbFWwmKAKiQhoetUo/gQRzokjdwjyIvASBJWrQXdbVaF017deSGGCQQAn9Tp
w/Es7BO+95CgQqsUp6cYpqrSWcoT6volX1HjTuWciYAf+/m0tcqYxFA5Rz6QMqMC
52Zak4l50lhYitl+GvXHjQwxBLNZ3Q==
=tt1L
-----END PGP SIGNATURE-----

--S0620OU5xz5IQYBP--

