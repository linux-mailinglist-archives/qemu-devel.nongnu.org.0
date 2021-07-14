Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BB63C7DF6
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 07:36:09 +0200 (CEST)
Received: from localhost ([::1]:53570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3XZ2-0005b2-BV
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 01:36:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m3XVF-0004Yo-6U; Wed, 14 Jul 2021 01:32:13 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:35209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m3XVC-00068d-VP; Wed, 14 Jul 2021 01:32:12 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 8E0D8580725;
 Wed, 14 Jul 2021 01:32:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 14 Jul 2021 01:32:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=13XWgOB+M/SZNgUxFDRMbt2Q2ut
 QUIOhipX2axzLlPA=; b=Qb69h0vYJLeqhLWIuOsmKfb7vM2tQ64o6IFS5WwxX3z
 lCZ8nS83tCHCgAM7uVySURU4Ozz13EJQMlQtYpUv+gohptjU6hPJ0zWQomO+ydLM
 3qXNYN2Vd9rYCbH982yECBjGY3/FG1h+2/VKUThG9uys0hcDfGZLZuH9V71EYmCn
 qgXl2OWZxPv53BNXNmRTQhajyZk0ZL4eyO4KtUUC6rpmE2IGbWI30JieOguPP5W1
 aXR1+PkqnVXS/4ftondYy5+zhf9h1Lh6gGVtelb2kRKnVq5sgpmmyA80z1UHYT8i
 ORjGabdUkcUDL35ZUGwXOaOJOOYMpiIkKci+c9yWwLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=13XWgO
 B+M/SZNgUxFDRMbt2Q2utQUIOhipX2axzLlPA=; b=bsgW7xyvfRzN39PQoECAJW
 0+DsKdlVOi+aWyGt7ZSVBhF7Y1NzU1Cg6rUQApYcpvJWGTlVtfwJ2bf/7CElS/MB
 pqLkZpPvrjq72gXRrQ0N9Rg9X74NqYlA02CkvIwVgmSK84Cc7KGqvAP/itFp6+D8
 8eLw/24b2OgaqyGNX4Fx3GwHVJT/bANxoRUJFoGo8GqXpU0H3/tF/Wst+Os41XMZ
 +xJVbJbMIU6nUvYDUGhzzkgveWB0oBEvWyV7U8ULpdJ8k8DoskMeKBTh5/+Rz3iV
 05OLC4pWExTHhnemBLl4cN2Tqa5tb2xoSu0NtWEwTO+fGQrS6e9Ved89B/wCpxjw
 ==
X-ME-Sender: <xms:13buYGzBbw868e77-VXL3yvqQNCdrehJ6YMDa9aBdxohRDhXthDvNQ>
 <xme:13buYCR_4jkCQtBgwAEyk8EAUU-MTRKpP2cgBFpsCHTl9FxM7UL9fjVMGSem9U0Nr
 h9UCnnkIMPFKRSwZp8>
X-ME-Received: <xmr:13buYIXSOoj2iQTNXf7_86ej8-Wt72heSv6nTDbLJwwXuAIwAPwL6GtO9feoESRrgsPPF-MkLL0vMdES6yanm4gzO46MJ6fRoAia3r-kWW9XTg_-pA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejgdekkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:13buYMiMrocdWLcCjhCGcWyEEM5sJhSJTGsAlYDXukF561wlcf_mBQ>
 <xmx:13buYIBlcQzE0Ie788AibiL9cuWrOclUvCjOCNkRIhWU_yPUJdGyqw>
 <xmx:13buYNLTX0CWDkY6buaES-kaMx1HeZidembg4o5NQk1isgtBmPudZQ>
 <xmx:2HbuYMyyRev_hUjPK2o_Oe7fNprl3fVC9k23otoSgdQis4p4dYcocg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Jul 2021 01:32:05 -0400 (EDT)
Date: Wed, 14 Jul 2021 07:32:03 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 2/5] hw/nvme: use symbolic names for registers
Message-ID: <YO520wgSs3wwG4uH@apples.localdomain>
References: <20210713192428.950160-1-its@irrelevant.dk>
 <20210713192428.950160-3-its@irrelevant.dk>
 <306b8373-079f-5000-e70c-041ab18c320f@redhat.com>
 <4864a63f-f829-91ae-3f48-428af05d2152@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ya8y7KJa6GX40GzV"
Content-Disposition: inline
In-Reply-To: <4864a63f-f829-91ae-3f48-428af05d2152@redhat.com>
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


--ya8y7KJa6GX40GzV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul 14 00:21, Philippe Mathieu-Daud=C3=A9 wrote:
> On 7/14/21 12:12 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 7/13/21 9:24 PM, Klaus Jensen wrote:
> >> From: Klaus Jensen <k.jensen@samsung.com>
> >>
> >> Add the NvmeBarRegs enum and use these instead of explicit register
> >> offsets.
> >>
> >> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> >> ---
> >>  include/block/nvme.h | 27 +++++++++++++++++++++++++++
> >>  hw/nvme/ctrl.c       | 44 ++++++++++++++++++++++----------------------
> >>  2 files changed, 49 insertions(+), 22 deletions(-)
> >>
> >> diff --git a/include/block/nvme.h b/include/block/nvme.h
> >> index 84053b68b987..082d4bddbf9f 100644
> >> --- a/include/block/nvme.h
> >> +++ b/include/block/nvme.h
> >> @@ -31,6 +31,33 @@ typedef struct QEMU_PACKED NvmeBar {
> >>      uint8_t     css[484];
> >>  } NvmeBar;
> >> =20
> >> +enum NvmeBarRegs {
> >> +    NVME_REG_CAP     =3D 0x0,
> >> +    NVME_REG_VS      =3D 0x8,
> >> +    NVME_REG_INTMS   =3D 0xc,
> >> +    NVME_REG_INTMC   =3D 0x10,
> >> +    NVME_REG_CC      =3D 0x14,
> >> +    NVME_REG_CSTS    =3D 0x1c,
> >> +    NVME_REG_NSSR    =3D 0x20,
> >> +    NVME_REG_AQA     =3D 0x24,
> >> +    NVME_REG_ASQ     =3D 0x28,
> >> +    NVME_REG_ACQ     =3D 0x30,
> >> +    NVME_REG_CMBLOC  =3D 0x38,
> >> +    NVME_REG_CMBSZ   =3D 0x3c,
> >> +    NVME_REG_BPINFO  =3D 0x40,
> >> +    NVME_REG_BPRSEL  =3D 0x44,
> >> +    NVME_REG_BPMBL   =3D 0x48,
> >> +    NVME_REG_CMBMSC  =3D 0x50,
> >> +    NVME_REG_CMBSTS  =3D 0x58,
> >> +    NVME_REG_PMRCAP  =3D 0xe00,
> >> +    NVME_REG_PMRCTL  =3D 0xe04,
> >> +    NVME_REG_PMRSTS  =3D 0xe08,
> >> +    NVME_REG_PMREBS  =3D 0xe0c,
> >> +    NVME_REG_PMRSWTP =3D 0xe10,
> >> +    NVME_REG_PMRMSCL =3D 0xe14,
> >> +    NVME_REG_PMRMSCU =3D 0xe18,
> >> +};
> >> +
> >>  enum NvmeCapShift {
> >>      CAP_MQES_SHIFT     =3D 0,
> >>      CAP_CQR_SHIFT      =3D 16,
> >> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> >> index 28299c6f3764..8c305315f41c 100644
> >> --- a/hw/nvme/ctrl.c
> >> +++ b/hw/nvme/ctrl.c
> >> @@ -5740,7 +5740,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr o=
ffset, uint64_t data,
> >>      }
> >> =20
> >>      switch (offset) {
> >> -    case 0xc:   /* INTMS */
> >> +    case NVME_REG_INTMS:
> >=20
> > What about using offsetof(NvmeBar, intms) instead?
>=20
> BTW I'm not suggesting this is better, I just wonder how we can avoid
> to duplicate the definitions. Alternative is declaring:
>=20
> enum NvmeBarRegs {
>     NVME_REG_CAP     =3D offsetof(NvmeBar, cap),
>     NVME_REG_VS      =3D offsetof(NvmeBar, vs),
>     ...
>=20

I like this suggestion!

--ya8y7KJa6GX40GzV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDudtEACgkQTeGvMW1P
Delkdwf+Jg7Qh5sd/z5E2SmfX6V9jFfbSz54sDaxu7NzKYfjf3TVK0/i7gHlgDFq
4I7wUT2t8RM/VDT37oJmuysVBoLVSdL7HoClUiYFWOcidAcctEoK4wRZZ7+GfzN7
LAx/32QoYaTGj1I/1qnkuBB+wJe/UtMkbS99PmP7AFs98KVX5Ps7YN6QMDMLIewq
/FNFDEOfLUikQdiZpuIQs1z8Eps4BuOWNawxOpNp7QR9aa6ZPIgXFfBYURop1DqJ
k2CrHNlfkCtPr1rEvZVU6pdh1HlSIKuGHoHyd18V8RgU84jskITopDC1hRJa6M3B
cU5K/+6JT99kvO+CXo+rgtwHtQOSew==
=8sBj
-----END PGP SIGNATURE-----

--ya8y7KJa6GX40GzV--

