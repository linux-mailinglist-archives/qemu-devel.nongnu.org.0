Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8599B3C7E08
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 07:44:17 +0200 (CEST)
Received: from localhost ([::1]:55832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Xgu-0007TA-Ed
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 01:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m3XVm-0004s0-9k; Wed, 14 Jul 2021 01:32:46 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:51229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m3XVk-0006Uj-PK; Wed, 14 Jul 2021 01:32:46 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id D6636580725;
 Wed, 14 Jul 2021 01:32:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 14 Jul 2021 01:32:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=D0v4ORfFR645MTcvldK27itc74e
 CtNwzdXGQ+aCd+NI=; b=ThT8ppTNqsvHxKwJaPjV6GgWRQEMoRQFIjlzFkev298
 wRUbgpQvd7nJwkU50haYPfeRoOiV6EP6VRg7UpmwLFQqjrARv3u4lK837Okotykb
 d/OGDsBYZrqlWGM7Hyrd8rccoFFwrZumF1YfhfDrm+t+jhc+a9+dolkmANdFUrp1
 UMlCRpFSnpHeaV0n+IXiFmPlhy0x7QC5yS8dCaxhVbHUdfb01Rb+MM3aZds3KjD0
 a5agIxIsK5Mo1yyqZGx0R+qWacWiuxyxt2o5sn+cYa6kzs+avwups5o5VvFHZI2a
 SKFLMW+hU92LaShOdY9bgx1eZDWnqmImMynb0cZ3V5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=D0v4OR
 fFR645MTcvldK27itc74eCtNwzdXGQ+aCd+NI=; b=pEwNpCJUMvdxqj0D2Obd/n
 vWA4WrBP0EoJvcY/hxZOFUoyQaOwcjqVlo7IuBVCvPETxsPqj3MhGN9PYMgA17mE
 Do6sQpH8YjULnjEqEQ4MHx6dzT9pHb2MQJY0nFC74QjxBQrnU6neWg1+M7CgCrUd
 pdL2ivsbCiDqO5s1kkM3pNqhq/krVEdtHqsRIHeTb/HoiSW+Q+c7snYtmRJoQO1Y
 GHw8r4CYOo3YQKi8VWmYZ7xFZvGAY9Pa3rSzqoIhMRw/7a3DVyhcdGjxU4qp7H9U
 TPncpdEOuh4PjNzwZQXDz2hDWEt5SEazWgycYFIg+WECH+4bpgcV2t30Vpc7682A
 ==
X-ME-Sender: <xms:-nbuYAs_9_zvOIhbPALfaep8ShJcFomLwrmGGl-l0gO0dlExmm8iyA>
 <xme:-nbuYNfVA8h6KmTP3D8l-DjmegB61IClfyD5r9kkXxyMbDtjGjm2wlimrWY8bmoiz
 Y2Gott5VTrzhhiYvUw>
X-ME-Received: <xmr:-nbuYLyOVSfMlMEAQdE3Ud8fzWNMwPjYAtqzdckwSzxs40dXtqicVYVw78PQczM80ljI6SasBiAlBw483xCCG5aKDrpSRNV-UeB9oDJDV1c4m_584A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejgdeklecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:-nbuYDMa3n9hpOFnJCgpQBGUZoQ1qLi862w9pw0_i4awEfy0CFHj2Q>
 <xmx:-nbuYA--YpqpmIGMGWYcKDd3jQM3iMiXuW7f42RpsPlNrIZFZu5u6w>
 <xmx:-nbuYLUChyvJYi1e5_NW3RySJ6Z1uegJX79Cfp35Iff5r3WFZ8tzjQ>
 <xmx:-3buYKdIgaff4y0rE_naIJV1dYYgzspsGoFu24e2wXAKN63Oui7pVQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Jul 2021 01:32:41 -0400 (EDT)
Date: Wed, 14 Jul 2021 07:32:38 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 4/5] hw/nvme: fix mmio read
Message-ID: <YO529iO/VEnxTEWV@apples.localdomain>
References: <20210713192428.950160-1-its@irrelevant.dk>
 <20210713192428.950160-5-its@irrelevant.dk>
 <30506100-68db-1fa2-ab32-f9f446c7193a@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hVw7jC7zJGhlwpuM"
Content-Disposition: inline
In-Reply-To: <30506100-68db-1fa2-ab32-f9f446c7193a@redhat.com>
Received-SPF: pass client-ip=66.111.4.221; envelope-from=its@irrelevant.dk;
 helo=new1-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier <lvivier@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--hVw7jC7zJGhlwpuM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 14 00:18, Philippe Mathieu-Daud=C3=A9 wrote:
> On 7/13/21 9:24 PM, Klaus Jensen wrote:
> > From: Klaus Jensen <k.jensen@samsung.com>
> >=20
> > The new PMR test unearthed a long-standing issue with MMIO reads on
> > big-endian hosts.
> >=20
> > Fix this by unconditionally storing all controller registers in little
> > endian.
> >=20
> > Cc: Gollu Appalanaidu <anaidu.gollu@samsung.com>
> > Reported-by: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> > ---
> >  hw/nvme/ctrl.c | 304 ++++++++++++++++++++++++++++---------------------
> >  1 file changed, 174 insertions(+), 130 deletions(-)
> >=20
> > diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> > index 0449cc4dee9b..ddac9344a74e 100644
> > --- a/hw/nvme/ctrl.c
> > +++ b/hw/nvme/ctrl.c
> > @@ -439,10 +439,12 @@ static uint8_t nvme_sq_empty(NvmeSQueue *sq)
> > =20
> >  static void nvme_irq_check(NvmeCtrl *n)
> >  {
> > +    uint32_t intms =3D le32_to_cpu(n->bar.intms);
> > +
> >      if (msix_enabled(&(n->parent_obj))) {
> >          return;
> >      }
> > -    if (~n->bar.intms & n->irq_status) {
> > +    if (~intms & n->irq_status) {
> >          pci_irq_assert(&n->parent_obj);
> >      } else {
> >          pci_irq_deassert(&n->parent_obj);
> > @@ -1289,7 +1291,7 @@ static void nvme_post_cqes(void *opaque)
> >          if (ret) {
> >              trace_pci_nvme_err_addr_write(addr);
> >              trace_pci_nvme_err_cfs();
> > -            n->bar.csts =3D NVME_CSTS_FAILED;
> > +            n->bar.csts =3D cpu_to_le64(NVME_CSTS_FAILED);
>=20
> The load/store API is safer than the cpu_to_X() one because
> it removes alignment problems. Here it becomes:
>=20
>                stq_le_p(&n->bar.csts, NVME_CSTS_FAILED);
>=20
> >              break;
> >          }
> >          QTAILQ_REMOVE(&cq->req_list, req, entry);
> > @@ -4022,7 +4024,7 @@ static uint16_t nvme_create_sq(NvmeCtrl *n, NvmeR=
equest *req)
> >          trace_pci_nvme_err_invalid_create_sq_sqid(sqid);
> >          return NVME_INVALID_QID | NVME_DNR;
> >      }
> > -    if (unlikely(!qsize || qsize > NVME_CAP_MQES(n->bar.cap))) {
> > +    if (unlikely(!qsize || qsize > NVME_CAP_MQES(le64_to_cpu(n->bar.ca=
p)))) {
>=20
> And here:
>=20
>  if (unlikely(!qsize || qsize > NVME_CAP_MQES(ldq_le_p(&n->bar.cap)))) {
>=20
> >          trace_pci_nvme_err_invalid_create_sq_size(qsize);
> >          return NVME_MAX_QSIZE_EXCEEDED | NVME_DNR;
> >      }
>=20
> However for the BAR is likely aligned, so using the cpu_to() API
> shouldn't be a problem until we try to deprecate/remove it.
>=20
>=20

Right. It makes sense to use that API for new code - I will amend it :)

--hVw7jC7zJGhlwpuM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDudvUACgkQTeGvMW1P
DekSQwf/WuyVt5PvvJrU/ry3pdhMwgXIQxhH0rJLfmPP9t81PA//qBrmeVaAxrhD
pJEaOX5Dm3udwKroQY6RgTburjXKaQ0m6pSniR3WllCFMdac01Rhfv4WsJE/bdSz
ZSBWa6MzQTq9uqy4vfq3vQnEf/PZuq3PRRMn7X4b59zMPzPsuIwh4C7r0IudLYAU
48xUJDGJhZv3jH94+dZne9LQ8Y39aXB+9T089MTJFjSk3zxaJ1YWZNrQ862JAvVQ
LDMMGIVhJT86mBmLI8iAiplcowgp5XCw8ntpZYFzfLQIPTaG/ezQIYFGpsCI3+qE
Cji6QBf7wMioix4cbqmoJknSXpGxwg==
=p0iD
-----END PGP SIGNATURE-----

--hVw7jC7zJGhlwpuM--

