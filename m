Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F382B0F33
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 21:49:05 +0100 (CET)
Received: from localhost ([::1]:56750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdJWi-0004Jv-4R
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 15:49:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kdJRg-0002oW-Sx; Thu, 12 Nov 2020 15:43:52 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:34259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kdJRc-0003wY-If; Thu, 12 Nov 2020 15:43:52 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5AEAF5804CC;
 Thu, 12 Nov 2020 15:43:46 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 12 Nov 2020 15:43:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=5gnQyhvVjXWzWNDboVJzyvwCbO5
 7rTSWoGz7jntgvQ0=; b=bMLDmYpHufAGkQ72he4UziXSzMh6tSmJoeVX9b/Jisr
 I+8MhUnmZm2cVnChmp57ZsE9qn6TO4RQexo9QCj5ZUKMVhlYt7l1vVnxCFJvQ3s+
 birdpYVTzut1fqkm/aNqRxPg7NQqg6+WvbPOLP2BcTGcm3mRHMGP8hfGAx34qCi9
 pRGnUuUhpV9MNd+1260YTzoYQ3qtSRI2e0uoy4x3AvR5a7NvEKm1zBXQJqnG7Zol
 o8xtdW0T6dRNQdTRUGq30kKV7u1w0d9RjECHqF/ki2gfLYNeYfqhUwXpjBwx/ywp
 CGyOHJOhX9Y4g5PiAhEojwo6MoQL5fnKPFJx3uMrnXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=5gnQyh
 vVjXWzWNDboVJzyvwCbO57rTSWoGz7jntgvQ0=; b=b5i8cUjp4JMD2ZZAM5xnYV
 2KfVHvPBIkQ/CtybyHtlRnfVuc+S37Cgp4E6maBpfQB5j4usrtNQ3V2kCX7Hr6PI
 8cIy2hMvRzmQFiDFaG/rFqIMgAgFBsFdb/e3rUs2kwsMiD9rf0cqjiUAuJN1Dqb/
 cQemeLlG8XXV1fR+CAWoX6puuJzgqux2cfNaC0HOYOU/Kdchri5CXvEUfp0Ogo6R
 WWYzx1Q0fFtCq4QY1NqogflnkJJJTVMIxoWw3CtKOVHKp7ENW47lTc2CoQ+U86xo
 8Bh9TmLY3h+NtyZxWNf/G4khHO9gBefLcgpa/2LKvnwKxW/uAwNY1XwvXNbJ8YgA
 ==
X-ME-Sender: <xms:f56tX_IhyQKTllukHkrA0oXvABsMjpuv7jExqmDWgzH39fsw3jAp8g>
 <xme:f56tXzL8MFNqSzZF72CqbZx7bIjZ3TXRlpvvLEUVhNqo1IOh6n1bLJx7ulfUFbS9f
 a4PlWjzoZuZa4gNe1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvfedgudduiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:f56tX3ul6D-RlB3bMjVTbx2z4Gv2WkkDyv81RH6nssmW_ujgu0lxwQ>
 <xmx:f56tX4ZjArdADXkfz1uhEomAIu15DxJOLCIQu5E3Uv0Iv2WamDVppQ>
 <xmx:f56tX2aIOkHxEkNp3yKVqs1oZBSKehDqurQQOHL4NSi_qBrRcVpwcQ>
 <xmx:gp6tXyTYtCr9-aWNtCiCZedKFHyuPi9cfVZJP2aToWqtUpheWp8NYw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id F2F6D3280065;
 Thu, 12 Nov 2020 15:43:41 -0500 (EST)
Date: Thu, 12 Nov 2020 21:43:40 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Subject: Re: [PATCH v10 06/12] hw/block/nvme: Support allocated CNS command
 variants
Message-ID: <20201112204340.GA826160@apples.localdomain>
References: <20201106234305.21339-1-dmitry.fomichev@wdc.com>
 <20201106234305.21339-7-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Content-Disposition: inline
In-Reply-To: <20201106234305.21339-7-dmitry.fomichev@wdc.com>
Received-SPF: pass client-ip=66.111.4.229; envelope-from=its@irrelevant.dk;
 helo=new3-smtp.messagingengine.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 14:36:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Damien Le Moal <damien.lemoal@wdc.com>, qemu-block@nongnu.org,
 Niklas Cassel <niklas.cassel@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, Keith Busch <kbusch@kernel.org>,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Matias Bjorling <matias.bjorling@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Nov  7 08:42, Dmitry Fomichev wrote:
> From: Niklas Cassel <niklas.cassel@wdc.com>
>=20
> Many CNS commands have "allocated" command variants. These include
> a namespace as long as it is allocated, that is a namespace is
> included regardless if it is active (attached) or not.
>=20
> While these commands are optional (they are mandatory for controllers
> supporting the namespace attachment command), our QEMU implementation
> is more complete by actually providing support for these CNS values.
>=20
> However, since our QEMU model currently does not support the namespace
> attachment command, these new allocated CNS commands will return the
> same result as the active CNS command variants.
>=20
> In NVMe, a namespace is active if it exists and is attached to the
> controller.
>=20
> Add a new Boolean namespace flag, "attached", to provide the most
> basic namespace attachment support. The default value for this new
> flag is true. Also, implement the logic in the new CNS values to
> include/exclude namespaces based on this new property. The only thing
> missing is hooking up the actual Namespace Attachment command opcode,
> which will allow a user to toggle the "attached" flag per namespace.
>=20
> The reason for not hooking up this command completely is because the
> NVMe specification requires the namespace management command to be
> supported if the namespace attachment command is supported.
>=20
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
> Reviewed-by: Keith Busch <kbusch@kernel.org>
> ---
>  hw/block/nvme-ns.h   |  1 +
>  include/block/nvme.h | 20 +++++++++++--------
>  hw/block/nvme-ns.c   |  1 +
>  hw/block/nvme.c      | 46 +++++++++++++++++++++++++++++++++-----------
>  4 files changed, 49 insertions(+), 19 deletions(-)
>=20
> diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
> index d795e44bab..2d9cd29d07 100644
> --- a/hw/block/nvme-ns.h
> +++ b/hw/block/nvme-ns.h
> @@ -31,6 +31,7 @@ typedef struct NvmeNamespace {
>      int64_t      size;
>      NvmeIdNs     id_ns;
>      const uint32_t *iocs;
> +    bool         attached;

Remove this too?

>      uint8_t      csi;
> =20
>      NvmeNamespaceParams params;
> diff --git a/include/block/nvme.h b/include/block/nvme.h
> index af23514713..394db19022 100644
> --- a/include/block/nvme.h
> +++ b/include/block/nvme.h
> @@ -806,14 +806,18 @@ typedef struct QEMU_PACKED NvmePSD {
>  #define NVME_IDENTIFY_DATA_SIZE 4096
> =20
>  enum NvmeIdCns {
> -    NVME_ID_CNS_NS                =3D 0x00,
> -    NVME_ID_CNS_CTRL              =3D 0x01,
> -    NVME_ID_CNS_NS_ACTIVE_LIST    =3D 0x02,
> -    NVME_ID_CNS_NS_DESCR_LIST     =3D 0x03,
> -    NVME_ID_CNS_CS_NS             =3D 0x05,
> -    NVME_ID_CNS_CS_CTRL           =3D 0x06,
> -    NVME_ID_CNS_CS_NS_ACTIVE_LIST =3D 0x07,
> -    NVME_ID_CNS_IO_COMMAND_SET    =3D 0x1c,
> +    NVME_ID_CNS_NS                    =3D 0x00,
> +    NVME_ID_CNS_CTRL                  =3D 0x01,
> +    NVME_ID_CNS_NS_ACTIVE_LIST        =3D 0x02,
> +    NVME_ID_CNS_NS_DESCR_LIST         =3D 0x03,
> +    NVME_ID_CNS_CS_NS                 =3D 0x05,
> +    NVME_ID_CNS_CS_CTRL               =3D 0x06,
> +    NVME_ID_CNS_CS_NS_ACTIVE_LIST     =3D 0x07,
> +    NVME_ID_CNS_NS_PRESENT_LIST       =3D 0x10,
> +    NVME_ID_CNS_NS_PRESENT            =3D 0x11,
> +    NVME_ID_CNS_CS_NS_PRESENT_LIST    =3D 0x1a,
> +    NVME_ID_CNS_CS_NS_PRESENT         =3D 0x1b,
> +    NVME_ID_CNS_IO_COMMAND_SET        =3D 0x1c,
>  };
> =20
>  typedef struct QEMU_PACKED NvmeIdCtrl {
> diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
> index c0362426cc..e191ef9be0 100644
> --- a/hw/block/nvme-ns.c
> +++ b/hw/block/nvme-ns.c
> @@ -42,6 +42,7 @@ static void nvme_ns_init(NvmeNamespace *ns)
>      id_ns->nsze =3D cpu_to_le64(nvme_ns_nlbas(ns));
> =20
>      ns->csi =3D NVME_CSI_NVM;
> +    ns->attached =3D true;
> =20
>      /* no thin provisioning */
>      id_ns->ncap =3D id_ns->nsze;
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index bb82dd9975..7495cdb5ef 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -1236,6 +1236,7 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_=
t rae, uint32_t buf_len,
>      uint32_t trans_len;
>      NvmeNamespace *ns;
>      time_t current_ms;
> +    int i;

This change is unrelated to the patch.
> =20
>      if (off >=3D sizeof(smart)) {
>          return NVME_INVALID_FIELD | NVME_DNR;
> @@ -1246,10 +1247,7 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, uint8=
_t rae, uint32_t buf_len,
>          if (!ns) {
>              return NVME_INVALID_NSID | NVME_DNR;
>          }
> -        nvme_set_blk_stats(ns, &stats);

Woops, what happend here?

>      } else {
> -        int i;
> -
>          for (i =3D 1; i <=3D n->num_namespaces; i++) {
>              ns =3D nvme_ns(n, i);
>              if (!ns) {
> @@ -1552,7 +1550,8 @@ static uint16_t nvme_identify_ctrl_csi(NvmeCtrl *n,=
 NvmeRequest *req)
>      return NVME_INVALID_FIELD | NVME_DNR;
>  }
> =20
> -static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req)
> +static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req,
> +                                 bool only_active)
>  {
>      NvmeNamespace *ns;
>      NvmeIdentify *c =3D (NvmeIdentify *)&req->cmd;
> @@ -1569,11 +1568,16 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, Nvm=
eRequest *req)
>          return nvme_rpt_empty_id_struct(n, req);
>      }
> =20
> +    if (only_active && !ns->attached) {
> +        return nvme_rpt_empty_id_struct(n, req);
> +    }
> +

The only_active parameter and this condition should be removed. This
goes for the rest of the functions below as well.

>      return nvme_dma(n, (uint8_t *)&ns->id_ns, sizeof(NvmeIdNs),
>                      DMA_DIRECTION_FROM_DEVICE, req);
>  }
> =20
> -static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req)
> +static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req,
> +                                     bool only_active)
>  {
>      NvmeNamespace *ns;
>      NvmeIdentify *c =3D (NvmeIdentify *)&req->cmd;
> @@ -1590,6 +1594,10 @@ static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, =
NvmeRequest *req)
>          return nvme_rpt_empty_id_struct(n, req);
>      }
> =20
> +    if (only_active && !ns->attached) {
> +        return nvme_rpt_empty_id_struct(n, req);
> +    }
> +
>      if (c->csi =3D=3D NVME_CSI_NVM) {
>          return nvme_rpt_empty_id_struct(n, req);
>      }
> @@ -1597,7 +1605,8 @@ static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, N=
vmeRequest *req)
>      return NVME_INVALID_FIELD | NVME_DNR;
>  }
> =20
> -static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req)
> +static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req,
> +                                     bool only_active)
>  {
>      NvmeNamespace *ns;
>      NvmeIdentify *c =3D (NvmeIdentify *)&req->cmd;
> @@ -1627,6 +1636,9 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, N=
vmeRequest *req)
>          if (ns->params.nsid <=3D min_nsid) {
>              continue;
>          }
> +        if (only_active && !ns->attached) {
> +            continue;
> +        }
>          list_ptr[j++] =3D cpu_to_le32(ns->params.nsid);
>          if (j =3D=3D data_len / sizeof(uint32_t)) {
>              break;
> @@ -1636,7 +1648,8 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, N=
vmeRequest *req)
>      return nvme_dma(n, list, data_len, DMA_DIRECTION_FROM_DEVICE, req);
>  }
> =20
> -static uint16_t nvme_identify_nslist_csi(NvmeCtrl *n, NvmeRequest *req)
> +static uint16_t nvme_identify_nslist_csi(NvmeCtrl *n, NvmeRequest *req,
> +                                         bool only_active)
>  {
>      NvmeNamespace *ns;
>      NvmeIdentify *c =3D (NvmeIdentify *)&req->cmd;
> @@ -1667,6 +1680,9 @@ static uint16_t nvme_identify_nslist_csi(NvmeCtrl *=
n, NvmeRequest *req)
>          if (ns->params.nsid <=3D min_nsid) {
>              continue;
>          }
> +        if (only_active && !ns->attached) {
> +            continue;
> +        }
>          list_ptr[j++] =3D cpu_to_le32(ns->params.nsid);
>          if (j =3D=3D data_len / sizeof(uint32_t)) {
>              break;
> @@ -1740,17 +1756,25 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeRe=
quest *req)
> =20
>      switch (le32_to_cpu(c->cns)) {
>      case NVME_ID_CNS_NS:
> -        return nvme_identify_ns(n, req);
> +         /* fall through */
> +    case NVME_ID_CNS_NS_PRESENT:
> +        return nvme_identify_ns(n, req, true);
>      case NVME_ID_CNS_CS_NS:
> -        return nvme_identify_ns_csi(n, req);
> +         /* fall through */
> +    case NVME_ID_CNS_CS_NS_PRESENT:
> +        return nvme_identify_ns_csi(n, req, true);
>      case NVME_ID_CNS_CTRL:
>          return nvme_identify_ctrl(n, req);
>      case NVME_ID_CNS_CS_CTRL:
>          return nvme_identify_ctrl_csi(n, req);
>      case NVME_ID_CNS_NS_ACTIVE_LIST:
> -        return nvme_identify_nslist(n, req);
> +         /* fall through */
> +    case NVME_ID_CNS_NS_PRESENT_LIST:
> +        return nvme_identify_nslist(n, req, true);
>      case NVME_ID_CNS_CS_NS_ACTIVE_LIST:
> -        return nvme_identify_nslist_csi(n, req);
> +         /* fall through */
> +    case NVME_ID_CNS_CS_NS_PRESENT_LIST:
> +        return nvme_identify_nslist_csi(n, req, true);
>      case NVME_ID_CNS_NS_DESCR_LIST:
>          return nvme_identify_ns_descr_list(n, req);
>      case NVME_ID_CNS_IO_COMMAND_SET:
> --=20
> 2.21.0
>=20
>=20

--=20
One of us - No more doubt, silence or taboo about mental illness.

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAl+tnnkACgkQTeGvMW1P
DemLKwf/a/Jyha+DUCpaQPx7zTMuHqv9WViZthi30lfXMvT8R5+/bpu3wjotpKC6
G3WJ46fqiUnQwXIeO9RoWiKpTEKuNYEcVljM6XVRHgaQLV8INDghYjcv1IySumU3
fwsWehetCfhSv4gPfTc9QQZ7P6CK6CzMgtnx/FCU4q7W7DZViSZ5Uzio7twlmYcm
zRuwMYQrEC0TIC/14LwniJI5P/GbjCilJJkCwhZU9cPo890UVRJdhFn1aGCEFFf1
XUHGIFa04JsMpmMNKzpd407Yu/j1mnwHoYIO0mlb3Gm3Tq/j89lgsv4St/lexdGP
oscmQjOhduOuH0fLriysphpYxWd0xA==
=zLDk
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--

