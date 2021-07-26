Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A833D5CF6
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 17:28:19 +0200 (CEST)
Received: from localhost ([::1]:37778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m82Wg-0003W5-RA
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 11:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m82RZ-0007Tt-9j; Mon, 26 Jul 2021 11:23:02 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:34191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m82RV-0007Pn-OK; Mon, 26 Jul 2021 11:23:01 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id CC7165803ED;
 Mon, 26 Jul 2021 11:22:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 26 Jul 2021 11:22:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=MYfSMibEqAXc8LQlXzztc6mI0tt
 8hm/Hc8NqWG+hkLk=; b=girj6xuzAVDYegpmR8PGb7lNPTw2XFAuAqxktMvHOH2
 wOPIwATf2D+8gLZ1rLLk6g3Jvc4dQ8K9ylg/mhUnineNX+sIz9YKzti2ooxJvOw6
 W6Ww2VAfNCAMOGiUr9TiSHztlM29MHyISLkq042fDhG/fO3w4tOzjlDm+5ERy9Zm
 NROxMTcOHKoo1EjnaPRKxAVTnwyUsQEu4SmJb8vYktItYVUx8VEVCMkgm3MESKpp
 0AmnjOiOS/OxALNYXKsoJO6P+uZDaR6+nfxfz7BzRgKMv69y6PQMckdVNViOcZTS
 MZ7gzHzJJnw05oI7VKZNfklxv61uBD1XMC8YmBQij5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=MYfSMi
 bEqAXc8LQlXzztc6mI0tt8hm/Hc8NqWG+hkLk=; b=rG75XDbxs9OKbiNlzbWq9A
 wd1I910kg2tBDSLj9p4uDDLKytxahkyTL0fIN57uRkrtOCNCPt3CTZGk5QkZEW2c
 ldr7d25c+2eksp0CpEr9mdEQIWkTTSzz7If29cTXe+VdRmsgSg+N9yO1MqiGoTsT
 0hV5P1Zy3k9/VCHeUZ6VGATdT9CxwOmVOzXsSejs7H7wlhOPqGJbnRl90laxFGq7
 mhLhlBmpMATCGFTV3tD4Qyd41BRpmEU1691azvUNiKQv55/pyidlnYkwlVde7cmT
 tg9mnKfqF5fDj5bhjNEiW+WP1XlnNZt3MvFqdNj/W5UE+/3nIvDAA6jUbgSPao6g
 ==
X-ME-Sender: <xms:TNP-YFWVlYuwGsCucEQcu-LUPiYq1tb8Ff-L-qIRMltrVMI9Q_R3Wg>
 <xme:TNP-YFkPLXuDzUNInAJVYWEM3mDME-GGslqVvLflwxpI50ZnOHfe6K2QCZYbK_YDo
 y-09gtVyh-fHNwF9NI>
X-ME-Received: <xmr:TNP-YBbXZTnNUQFnwWu6oQrnfQK1Zk4DVpAuPJ6KV-IlWtAmvrwfwJLa3CpOYOk0P8ksWWelQwMwDaqay9GEIYqY_sXH7aXCxvoTiLQVTBcSwanwrQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrgeehgdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:TNP-YIXExZCt6YzrAOl_npQInbVHL3-hetigHhwKY5XQMD1A0mvlsw>
 <xmx:TNP-YPnuow8HyJt372qMPQX05uvlPSORPkFtZVzyR3_09i0-YuUj-Q>
 <xmx:TNP-YFcS8619U5xnWQeRFV0KDeWI4wj5CB09qpjh-LYXBIVwZIvsjg>
 <xmx:TdP-YJlGAgSz65fp1pRwbUHwmkrTQvGRa33kM5tWHsb-Hop7Tv3kqQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Jul 2021 11:22:49 -0400 (EDT)
Date: Mon, 26 Jul 2021 17:22:46 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v6 1/5] hw/nvme: split pmrmsc register into upper and lower
Message-ID: <YP7TRselrKJ+ZP5I@apples.localdomain>
References: <20210721074836.110232-1-its@irrelevant.dk>
 <20210721074836.110232-2-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ki6VvaOrigWApPoX"
Content-Disposition: inline
In-Reply-To: <20210721074836.110232-2-its@irrelevant.dk>
Received-SPF: pass client-ip=66.111.4.230; envelope-from=its@irrelevant.dk;
 helo=new4-smtp.messagingengine.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Kevin Wolf <kwolf@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--ki6VvaOrigWApPoX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Keith, Appala, any chance one of you could review this? This really
needs to get to an -rc sooner rather than later :)

On Jul 21 09:48, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> The specification uses a set of 32 bit PMRMSCL and PMRMSCU registers to
> make up the 64 bit logical PMRMSC register.
>=20
> Make it so.
>=20
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  include/block/nvme.h | 31 ++++++++++++++++---------------
>  hw/nvme/ctrl.c       | 10 ++++++----
>  2 files changed, 22 insertions(+), 19 deletions(-)
>=20
> diff --git a/include/block/nvme.h b/include/block/nvme.h
> index 527105fafc0b..84053b68b987 100644
> --- a/include/block/nvme.h
> +++ b/include/block/nvme.h
> @@ -26,7 +26,8 @@ typedef struct QEMU_PACKED NvmeBar {
>      uint32_t    pmrsts;
>      uint32_t    pmrebs;
>      uint32_t    pmrswtp;
> -    uint64_t    pmrmsc;
> +    uint32_t    pmrmscl;
> +    uint32_t    pmrmscu;
>      uint8_t     css[484];
>  } NvmeBar;
> =20
> @@ -475,25 +476,25 @@ enum NvmePmrswtpMask {
>  #define NVME_PMRSWTP_SET_PMRSWTV(pmrswtp, val)   \
>      (pmrswtp |=3D (uint64_t)(val & PMRSWTP_PMRSWTV_MASK) << PMRSWTP_PMRS=
WTV_SHIFT)
> =20
> -enum NvmePmrmscShift {
> -    PMRMSC_CMSE_SHIFT   =3D 1,
> -    PMRMSC_CBA_SHIFT    =3D 12,
> +enum NvmePmrmsclShift {
> +    PMRMSCL_CMSE_SHIFT   =3D 1,
> +    PMRMSCL_CBA_SHIFT    =3D 12,
>  };
> =20
> -enum NvmePmrmscMask {
> -    PMRMSC_CMSE_MASK   =3D 0x1,
> -    PMRMSC_CBA_MASK    =3D 0xfffffffffffff,
> +enum NvmePmrmsclMask {
> +    PMRMSCL_CMSE_MASK   =3D 0x1,
> +    PMRMSCL_CBA_MASK    =3D 0xfffff,
>  };
> =20
> -#define NVME_PMRMSC_CMSE(pmrmsc)    \
> -    ((pmrmsc >> PMRMSC_CMSE_SHIFT)   & PMRMSC_CMSE_MASK)
> -#define NVME_PMRMSC_CBA(pmrmsc)     \
> -    ((pmrmsc >> PMRMSC_CBA_SHIFT)   & PMRMSC_CBA_MASK)
> +#define NVME_PMRMSCL_CMSE(pmrmscl)    \
> +    ((pmrmscl >> PMRMSCL_CMSE_SHIFT)   & PMRMSCL_CMSE_MASK)
> +#define NVME_PMRMSCL_CBA(pmrmscl)     \
> +    ((pmrmscl >> PMRMSCL_CBA_SHIFT)   & PMRMSCL_CBA_MASK)
> =20
> -#define NVME_PMRMSC_SET_CMSE(pmrmsc, val)   \
> -    (pmrmsc |=3D (uint64_t)(val & PMRMSC_CMSE_MASK) << PMRMSC_CMSE_SHIFT)
> -#define NVME_PMRMSC_SET_CBA(pmrmsc, val)   \
> -    (pmrmsc |=3D (uint64_t)(val & PMRMSC_CBA_MASK) << PMRMSC_CBA_SHIFT)
> +#define NVME_PMRMSCL_SET_CMSE(pmrmscl, val)   \
> +    (pmrmscl |=3D (uint32_t)(val & PMRMSCL_CMSE_MASK) << PMRMSCL_CMSE_SH=
IFT)
> +#define NVME_PMRMSCL_SET_CBA(pmrmscl, val)   \
> +    (pmrmscl |=3D (uint32_t)(val & PMRMSCL_CBA_MASK) << PMRMSCL_CBA_SHIF=
T)
> =20
>  enum NvmeSglDescriptorType {
>      NVME_SGL_DESCR_TYPE_DATA_BLOCK          =3D 0x0,
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 2f0524e12a36..070d9f6a962d 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -5916,11 +5916,13 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr of=
fset, uint64_t data,
>              return;
>          }
> =20
> -        n->bar.pmrmsc =3D (n->bar.pmrmsc & ~0xffffffff) | (data & 0xffff=
ffff);
> +        n->bar.pmrmscl =3D data;
>          n->pmr.cmse =3D false;
> =20
> -        if (NVME_PMRMSC_CMSE(n->bar.pmrmsc)) {
> -            hwaddr cba =3D NVME_PMRMSC_CBA(n->bar.pmrmsc) << PMRMSC_CBA_=
SHIFT;
> +        if (NVME_PMRMSCL_CMSE(n->bar.pmrmscl)) {
> +            uint64_t pmrmscu =3D n->bar.pmrmscu;
> +            hwaddr cba =3D (pmrmscu << 32) |
> +                (NVME_PMRMSCL_CBA(n->bar.pmrmscl) << PMRMSCL_CBA_SHIFT);
>              if (cba + int128_get64(n->pmr.dev->mr.size) < cba) {
>                  NVME_PMRSTS_SET_CBAI(n->bar.pmrsts, 1);
>                  return;
> @@ -5936,7 +5938,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offs=
et, uint64_t data,
>              return;
>          }
> =20
> -        n->bar.pmrmsc =3D (n->bar.pmrmsc & 0xffffffff) | (data << 32);
> +        n->bar.pmrmscu =3D data;
>          return;
>      default:
>          NVME_GUEST_ERR(pci_nvme_ub_mmiowr_invalid,
> --=20
> 2.32.0
>=20

--=20
One of us - No more doubt, silence or taboo about mental illness.

--ki6VvaOrigWApPoX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmD+0zoACgkQTeGvMW1P
DemMYQgAnkVNfVnUs9M+XwMHMVmIekJ6R/AhltjJsqvzB3KZFKM0dn8N5talbrMv
yruzoO+U+IGFNgADoYsRCGQR4jD6tBDQIhUlwPHYfhACBcfSufNc3EZOj7yW9IoB
aeGE+T8Mpe60tUaq+B3EULJoNyFPXp6CDriKw2I2EyhWbxUgpZQKNjYQsJKJaHRG
8rt1nv1l2yCZ3uGwUq1yuI/k3gJdH55IW1braHGx+5G6AxktKI39ElEOzfLeAJGA
AgU490fpquRUQE3DTvCDdBwTvlCggwuc1b7QQWJvuF6T7NOMdJHgF96mI/wlKJtB
m+pOEhSa20A+m0Wa+CWniXB4oGMfuw==
=5hes
-----END PGP SIGNATURE-----

--ki6VvaOrigWApPoX--

