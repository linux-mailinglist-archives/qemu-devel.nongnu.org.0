Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB533A146E
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 14:28:46 +0200 (CEST)
Received: from localhost ([::1]:53212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqxK9-0006RN-Io
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 08:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1lqxIG-00055S-Kx; Wed, 09 Jun 2021 08:26:48 -0400
Received: from mout.gmx.net ([212.227.17.20]:43163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xypron.glpk@gmx.de>)
 id 1lqxIE-0006Li-BB; Wed, 09 Jun 2021 08:26:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1623241594;
 bh=vBtaurvay8mIMMkN0T184bUyykIOAxJ4Yowg7QvmC9c=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=XasrrNHKn8UcZDKA5YQhbbDQ54tYJABIHnZjOiLvVgbnO1UVotsypkfsMRVLXySb7
 SwT3HGBa7v7wnbgFprinMuS8KD1TkPgg5u9lGje3mG5BtGvJgaP14q0cT/rfV6n5vR
 wvgpKUesU6oaTnYHiuDxaa9JpvaDulqA4RgxlWfA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.123.35] ([62.143.247.63]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MlNtF-1lTyKd0sWL-00lnB6; Wed, 09
 Jun 2021 14:26:34 +0200
Subject: Re: [PATCH 1/1] hw/nvme: namespace parameter for EUI64
To: qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20210609114657.33301-1-xypron.glpk@gmx.de>
From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Message-ID: <f19240c4-04f2-357d-9fe0-c781ae233587@gmx.de>
Date: Wed, 9 Jun 2021 14:26:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210609114657.33301-1-xypron.glpk@gmx.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5KPgvBIgp6klobP7qi0a2qfTW5z38d1eZEg+Fc3wvgyoaPzkKjI
 Hpg6uskWrJVSogDZ7/Ra2NMc9YAeMIHTpfBo9KdmhPUs1T1+O9PAKISapMuwmBIqrE6iQ0A
 GpZBOKq3wQPffzcrEQZ0ogsqUhZ0tUslJ/iLdp8WA9RZTe3uQusArR6oHpOc7mAAHsSDHGM
 +/xwSbprnqMEKfMViiuhQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NxuUi43nED0=:jDSlGW3sz709RHfM98n3Ju
 0zSp/8JM8VPalEZUWoTxtJ8OuwOl+lPuEgFAQYm3bIy3s3/r21GFrHXS0HhN5qx1atF3tMiLa
 lUe1am94bVqHhouYYhFrn9TtzS5qdT8wvTqQn0/sIjHTJ1HW0bASCdpG4PBtxApnSyoe3rDyE
 /tqzvLmzveb6ZRHmh5AQgJSWo3NwOTcYakFNR3/CRK7x9J1PfyPKcE3ZIkdA3ASWyJ3VPIauz
 CtpTodbS1mi8X+86Pv7elf9woqYB04fhdaV/ndWm6BQF3MnRuZUUx1hrOA93ca4+YV0Y+KIr1
 QJCsbThHXuQnoVUe67ZLib99ypRVdtIKI35goEcX7hXmU0HPrvPm870JSpf84l8Iuv07FLhdc
 vTdKppDxfw7sFVm/pSIRFS/x7rYSlLpPsQBaucNxZh9g62E22Eib3h6IUvFN9P9439DFWFjWu
 ub1IyA/nZQsuUKs6t/1wuQ7HYO/ndZQwu0zTW6OoBm2NZa83cqV065T10Xisq9ufET7ayaJKT
 PLgZq/o1zVon2UbfFgitZygiPfKg+LxVka2/6jSpXQUCG960fBXUXL/fE3ElYtY69uA0fOlpC
 GpWAbvUznIFX44GFY3E1e23ZuVkJTRtZLHoBmw0L9l/qLmX7UNu1uxFmJ7mrKnN/3C6rU4Qig
 FYHb1kmS/Vqn1mqCckhg3wMKo26+OyLOLjRGVT+xCDPd5pyB5PiCiQkVBc9bkelDgzHHoHwXU
 7einqBy+Mn0shWRBxZE20pJNr6qreq/E2ujLgqO5KGhzn7I5rRbXvi4FfZaEUJgz3/20YzhF+
 kSOLdMIMiWZZnNqWJMRi4XVA+1/tFqd/O3931mjh4UZgQ9cGjVvZFPHADYyrEckUIdWivGgBn
 9xukHStgESsRiWQo7C8yi8V1YdoDhiXZC4v8RmptoGlCCpN5yAlQRglLRLq++SAOZtfzMgkBJ
 TmrQd1EZtaviFlHuK9jUhpgnuOd+NmWuOeYuSau4OsmF3jUj1aCV6fJTlA0uK30sHIMbNd0EZ
 1H4piyhNN2AyKXSe3ZS5Ifz2VQ9oXelBXLbjRnw+HKF9sw+3GrRulGbLvK5jYTUU48xvpeirN
 RnAOGGgszqry6/+cpJdNqPrl8NY58kBHE3K
Received-SPF: pass client-ip=212.227.17.20; envelope-from=xypron.glpk@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+cc qemu-block@nongnu.org

On 6/9/21 1:46 PM, Heinrich Schuchardt wrote:
> The EUI64 field is the only identifier for NVMe namespaces in UEFI devic=
e
> paths. Add a new namespace property "eui64", that provides the user the
> option to specify the EUI64.
>
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> ---
>   docs/system/nvme.rst |  4 +++
>   hw/nvme/ctrl.c       | 58 ++++++++++++++++++++++++++------------------
>   hw/nvme/ns.c         |  2 ++
>   hw/nvme/nvme.h       |  1 +
>   4 files changed, 42 insertions(+), 23 deletions(-)
>
> diff --git a/docs/system/nvme.rst b/docs/system/nvme.rst
> index f7f63d6bf6..a6042f942a 100644
> --- a/docs/system/nvme.rst
> +++ b/docs/system/nvme.rst
> @@ -81,6 +81,10 @@ There are a number of parameters available:
>     Set the UUID of the namespace. This will be reported as a "Namespace=
 UUID"
>     descriptor in the Namespace Identification Descriptor List.
>
> +``eui64``
> +  Set the EUI64 of the namespace. This will be reported as a "IEEE Exte=
nded
> +  Unique Identifier" descriptor in the Namespace Identification Descrip=
tor List.
> +
>   ``bus``
>     If there are more ``nvme`` devices defined, this parameter may be us=
ed to
>     attach the namespace to a specific ``nvme`` device (identified by an=
 ``id``
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 0bcaf7192f..21f2d6843b 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -4426,19 +4426,19 @@ static uint16_t nvme_identify_ns_descr_list(Nvme=
Ctrl *n, NvmeRequest *req)
>       NvmeIdentify *c =3D (NvmeIdentify *)&req->cmd;
>       uint32_t nsid =3D le32_to_cpu(c->nsid);
>       uint8_t list[NVME_IDENTIFY_DATA_SIZE] =3D {};
> -
> -    struct data {
> -        struct {
> -            NvmeIdNsDescr hdr;
> -            uint8_t v[NVME_NIDL_UUID];
> -        } uuid;
> -        struct {
> -            NvmeIdNsDescr hdr;
> -            uint8_t v;
> -        } csi;
> -    };
> -
> -    struct data *ns_descrs =3D (struct data *)list;
> +    uint8_t *pos =3D list;
> +    struct {
> +        NvmeIdNsDescr hdr;
> +        uint8_t v[NVME_NIDL_UUID];
> +    } QEMU_PACKED uuid;
> +    struct {
> +        NvmeIdNsDescr hdr;
> +        uint64_t v;
> +    } QEMU_PACKED eui64;
> +    struct {
> +        NvmeIdNsDescr hdr;
> +        uint8_t v;
> +    } QEMU_PACKED csi;
>
>       trace_pci_nvme_identify_ns_descr_list(nsid);
>
> @@ -4452,17 +4452,29 @@ static uint16_t nvme_identify_ns_descr_list(Nvme=
Ctrl *n, NvmeRequest *req)
>       }
>
>       /*
> -     * Because the NGUID and EUI64 fields are 0 in the Identify Namespa=
ce data
> -     * structure, a Namespace UUID (nidt =3D 3h) must be reported in th=
e
> -     * Namespace Identification Descriptor. Add the namespace UUID here=
.
> +     * If the EUI64 field is 0 and the NGUID field is 0, the namespace =
must
> +     * provide a valid Namespace UUID in the Namespace Identification D=
escriptor
> +     * data structure. QEMU does not yet support setting NGUID.
>        */
> -    ns_descrs->uuid.hdr.nidt =3D NVME_NIDT_UUID;
> -    ns_descrs->uuid.hdr.nidl =3D NVME_NIDL_UUID;
> -    memcpy(&ns_descrs->uuid.v, ns->params.uuid.data, NVME_NIDL_UUID);
> -
> -    ns_descrs->csi.hdr.nidt =3D NVME_NIDT_CSI;
> -    ns_descrs->csi.hdr.nidl =3D NVME_NIDL_CSI;
> -    ns_descrs->csi.v =3D ns->csi;
> +    uuid.hdr.nidt =3D NVME_NIDT_UUID;
> +    uuid.hdr.nidl =3D NVME_NIDL_UUID;
> +    memcpy(uuid.v, ns->params.uuid.data, NVME_NIDL_UUID);
> +    memcpy(pos, &uuid, sizeof(uuid));
> +    pos +=3D sizeof(uuid);
> +
> +    if (ns->params.eui64) {
> +        eui64.hdr.nidt =3D NVME_NIDT_EUI64;
> +        eui64.hdr.nidl =3D NVME_NIDL_EUI64;
> +        eui64.v =3D cpu_to_be64(ns->params.eui64);
> +        memcpy(pos, &eui64, sizeof(eui64));
> +        pos +=3D sizeof(eui64);
> +    }
> +
> +    csi.hdr.nidt =3D NVME_NIDT_CSI;
> +    csi.hdr.nidl =3D NVME_NIDL_CSI;
> +    csi.v =3D ns->csi;
> +    memcpy(pos, &csi, sizeof(csi));
> +    pos +=3D sizeof(csi);
>
>       return nvme_c2h(n, list, sizeof(list), req);
>   }
> diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
> index 992e5a13f5..ddf395d60e 100644
> --- a/hw/nvme/ns.c
> +++ b/hw/nvme/ns.c
> @@ -77,6 +77,7 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **err=
p)
>       id_ns->mssrl =3D cpu_to_le16(ns->params.mssrl);
>       id_ns->mcl =3D cpu_to_le32(ns->params.mcl);
>       id_ns->msrc =3D ns->params.msrc;
> +    id_ns->eui64 =3D cpu_to_be64(ns->params.eui64);
>
>       ds =3D 31 - clz32(ns->blkconf.logical_block_size);
>       ms =3D ns->params.ms;
> @@ -518,6 +519,7 @@ static Property nvme_ns_props[] =3D {
>       DEFINE_PROP_BOOL("shared", NvmeNamespace, params.shared, false),
>       DEFINE_PROP_UINT32("nsid", NvmeNamespace, params.nsid, 0),
>       DEFINE_PROP_UUID("uuid", NvmeNamespace, params.uuid),
> +    DEFINE_PROP_UINT64("eui64", NvmeNamespace, params.eui64, 0),
>       DEFINE_PROP_UINT16("ms", NvmeNamespace, params.ms, 0),
>       DEFINE_PROP_UINT8("mset", NvmeNamespace, params.mset, 0),
>       DEFINE_PROP_UINT8("pi", NvmeNamespace, params.pi, 0),
> diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
> index 81a35cda14..abe7fab21c 100644
> --- a/hw/nvme/nvme.h
> +++ b/hw/nvme/nvme.h
> @@ -83,6 +83,7 @@ typedef struct NvmeNamespaceParams {
>       bool     shared;
>       uint32_t nsid;
>       QemuUUID uuid;
> +    uint64_t eui64;
>
>       uint16_t ms;
>       uint8_t  mset;
> --
> 2.30.2
>


