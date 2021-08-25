Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 967E43F77DF
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 16:58:14 +0200 (CEST)
Received: from localhost ([::1]:48478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIuM1-0000bP-2m
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 10:58:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mIuHh-0006ba-AT; Wed, 25 Aug 2021 10:53:45 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:47269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mIuHe-0008Dx-Fz; Wed, 25 Aug 2021 10:53:45 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id E3EFF5C0072;
 Wed, 25 Aug 2021 10:53:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 25 Aug 2021 10:53:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=/pbrjaK/txuzVKtpeFpPZ5klu1k
 GnWFJBrH0np7Ge8U=; b=Mo02h9tfIxHXj1Bhkoyct9a7lecp5gZhFAuf+0+0Azh
 M2o5iiYqzovu6KQmsManmweVwXUTClCQyf69WaL1e29Hdb6TwamcdIHc1kHRWA0b
 +v92wE3W/SzqVWD08YTUPCD+l/O/81JxAXvs+gvPcmkpHSsJ2b+40L7VM6rGqhWp
 IuIJU9xmDoEU5kaEFNBmeOMgqaXdx3V7iX+UuySNOYiTqBonXuh4Q28+IwbW8GsL
 98bf8z2cgn+/DMGDAM4iZD4IIOXPWFbOf6xojCw/jsaCoZH8Mn0bdCNh4eZdMVw/
 ysk+UHijt1L+9HojiamMD+jkwierqoHoiM57+qfNLAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=/pbrja
 K/txuzVKtpeFpPZ5klu1kGnWFJBrH0np7Ge8U=; b=CM2f2rOeqtXgFAqPItECwe
 oC0EoI4Afo+YRRQ2eD2VBkc8+MkrSfI2UKZqBv/b7CKvbHHyAOiixdkHVROylaJm
 lk5n/uK8Y2ALnjVt/R3L0gl0yrGejVQ0EK08ml8cIyndgpqT1qnhbZajUfexsuBL
 UMqDRq+0Rfa30/sHageNkR0SDmi3uRVDOZF1HcVdxaqLBtgYC5e100f/FpVka603
 6pQOK8x/vdhO7ggxT0VvpVLnolEKYigYB5B1JD9XH1rJli3n4WeddIrlfjJ8sR1C
 T5L87VGXTXVwz+ZsYcXcuo7Bc7CWmiNjFZCVIz6+hH3jqyLoVQRWk8/MR13qgUDQ
 ==
X-ME-Sender: <xms:c1kmYWhy9fmeZd8wUmbCqXZdGPv769gmclElRdkxrzB1ubR4ruDHgQ>
 <xme:c1kmYXBCIeLSrHTQQQCN5rqrLIzXxLbKhI0zMN6X082MpJepsJYvErd_dQ71zCb1m
 civQr4dayfPb4Qt2Og>
X-ME-Received: <xmr:c1kmYeFBeoAcjOeeOZrzVe7R-_B_abk0eAP_GQAEZiZO-FrHCtDMeMv1IPRYZpHgtkR_iYnDCJ-CVwYHQADJpRYlihLyxT66rdSbiKRNyEXh2Jm51g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddtledgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpedugeefveegfeduhfeuledugfeufeetheeuhfeuffejgeelgffgtdeffeduvddt
 veenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:c1kmYfSejamVH7AFcbPqjisjXXC23lSpPcXvHhh_nMJAeiPe5Plt6w>
 <xmx:c1kmYTyqT8u0WnKYP-liCCBX4uzpHsQUEwzmZbzxOaLGUqcvrKhutQ>
 <xmx:c1kmYd7_E5zwmEgSKhRDsykMqXGYAbdSsi_oI-G51P3DQ-FOrCQiTg>
 <xmx:dFkmYaxIILpdUKQFvPQEyA13r7-rvxwkzsl_jrdvKESMUMcDcugwGg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Aug 2021 10:53:37 -0400 (EDT)
Date: Wed, 25 Aug 2021 16:53:35 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 7/9] util/vfio-helpers: Have qemu_vfio_dma_map()
 propagate Error
Message-ID: <YSZZb2hbO8KKuNQl@apples.localdomain>
References: <20210824141142.1165291-1-philmd@redhat.com>
 <20210824141142.1165291-8-philmd@redhat.com>
 <YSYqzxZfZbmnVvRo@apples.localdomain>
 <45edae8d-5c41-5159-dbb6-1a15f0164aa4@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6/jIniRrDqFmeW9p"
Content-Disposition: inline
In-Reply-To: <45edae8d-5c41-5159-dbb6-1a15f0164aa4@redhat.com>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Auger Eric <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--6/jIniRrDqFmeW9p
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 25 15:08, Philippe Mathieu-Daud=C3=A9 wrote:
> On 8/25/21 1:34 PM, Klaus Jensen wrote:
> > On Aug 24 16:11, Philippe Mathieu-Daud=C3=A9 wrote:
> >> Now that all qemu_vfio_dma_map() callers provide an Error* argument,
> >> fill it with relevant / more descriptive message. Reduce 'ret'
> >> (returned value) scope by returning errno directly to simplify
> >> (removing the goto / 'out' label).
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> ---
> >>  block/nvme.c        |  1 +
> >>  util/vfio-helpers.c | 31 ++++++++++++++-----------------
> >>  2 files changed, 15 insertions(+), 17 deletions(-)
> >>
> >> diff --git a/block/nvme.c b/block/nvme.c
> >> index 663e5d918fa..80546b0babd 100644
> >> --- a/block/nvme.c
> >> +++ b/block/nvme.c
> >> @@ -240,6 +240,7 @@ static NVMeQueuePair *nvme_create_queue_pair(BDRVN=
VMeState *s,
> >>      r =3D qemu_vfio_dma_map(s->vfio, q->prp_list_pages, bytes,
> >>                            false, &prp_list_iova, errp);
> >>      if (r) {
> >> +        error_prepend(errp, "Cannot map buffer for DMA: ");
> >=20
> > Ah. Here is the missing error message that I noticed in patch 2 ;)
>=20
> So I should use error_setg() in patch 2 and replace it with
> error_prepend() here? I'm trying to address Eric's comments
> from:
>=20
> https://lore.kernel.org/qemu-devel/2cbd5471-4611-ae6b-d79f-db6ff19db5bf@r=
edhat.com/
> https://lore.kernel.org/qemu-devel/bd1cc1c9-3553-d252-3ca9-a23bc1035170@r=
edhat.com/
>=20

It's not like its breaking anything that it is missing from patch 2, so
I'm fine with it not being there. I agree that it feels weird to add it,
then replace it a few patches further down ;)

> >=20
> >>          goto fail;
> >>      }
> >>      q->free_req_head =3D -1;
> >> diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
> >> index 3e1a49bea15..f4c16e1dae5 100644
> >> --- a/util/vfio-helpers.c
> >> +++ b/util/vfio-helpers.c
> >> @@ -729,7 +729,6 @@ qemu_vfio_find_temp_iova(QEMUVFIOState *s, size_t =
size, uint64_t *iova)
> >>  int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
> >>                        bool temporary, uint64_t *iova, Error **errp)
> >>  {
> >> -    int ret =3D 0;
> >>      int index;
> >>      IOVAMapping *mapping;
> >>      uint64_t iova0;
> >> @@ -742,32 +741,34 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *ho=
st, size_t size,
> >>      if (mapping) {
> >>          iova0 =3D mapping->iova + ((uint8_t *)host - (uint8_t *)mappi=
ng->host);
> >>      } else {
> >> +        int ret;
> >> +
> >>          if (s->high_water_mark - s->low_water_mark + 1 < size) {
> >> -            ret =3D -ENOMEM;
> >> -            goto out;
> >> +            error_setg(errp, "iova exhausted (water mark reached)");
> >> +            return -ENOMEM;
> >>          }
> >>          if (!temporary) {
> >> -            if (qemu_vfio_find_fixed_iova(s, size, &iova0)) {
> >> -                ret =3D -ENOMEM;
> >> -                goto out;
> >> +            if (qemu_vfio_find_fixed_iova(s, size, &iova0) < 0) {
> >> +                error_setg(errp, "iova range not found");
> >> +                return -ENOMEM;
> >=20
> > Just curious.
> >=20
> > Previously this did error_setg_errno in out. Why don't we want to do th=
at here?
>=20
> I didn't thought about it but indeed you are right.
>=20
> Thanks for the review!
>=20
> Phil.
>=20
>=20

--=20
One of us - No more doubt, silence or taboo about mental illness.

--6/jIniRrDqFmeW9p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmEmWW0ACgkQTeGvMW1P
DenULAf/e9TsQXzKZptYItyVeR/eELtTiGjzIKjVc1tZCmonWzFmqiGxtPzksjA1
hNn4P6mZ5fKSHZ6wXEi5rqC86s0kZJjtv8GBy++kIS6CPYzfrwV/qM+1m8CHd9Bv
KCr/W9k9Y4QEwdCF3MW+08mfWKVER3SAi2mgnt0OchojD3BIED1RBeRr8i8SnOch
DT7VmDMMUzjmbY0Npbvgi/nRXM/Ax0r0S1DiKZqNHDGjYSHzbMStcDrFAQouBSQr
SqjS+GW7LAlla6B/0KSM9E/7o7IeyOMy0pFvzMfF9ahq9LLZVt09lYkDCt3WBkBl
j7uTrvIy30tK5XmAeBBOeIDq0D7kOA==
=/vfN
-----END PGP SIGNATURE-----

--6/jIniRrDqFmeW9p--

