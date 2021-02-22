Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E21DC3220ED
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 21:48:24 +0100 (CET)
Received: from localhost ([::1]:56450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEI7z-0005Az-RS
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 15:48:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lEI31-0003l9-Vw; Mon, 22 Feb 2021 15:43:16 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:48069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lEI2z-0004zL-No; Mon, 22 Feb 2021 15:43:15 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 827E75C00F0;
 Mon, 22 Feb 2021 15:43:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 22 Feb 2021 15:43:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=yPOrTrawk71tCMQzs3HobuyOMSW
 UlwTIz11s3Rsw4Zo=; b=JnYzupo0lE+dyMXFn0XarcizFTYz9fPc0jhsqcVUkK7
 4etur7bWSMvbarR+EaX3BvylJlnylo+O1EQzMiAQyfgk8VLAFGSMipdO7hrXav/x
 Jwc2aGnmBDw+5J2saAj9L3Q0ZW8iQgMO+lS5RAAvTd0dozYB2DQEo6uLxOfR2JmV
 0B0f/S64mHf4UPYdOj2E9bboLErtnq/pdBpqCvfXiHwdLqNo1xELd6s3YtdcYctU
 zyht1Gd5rlRVoyi1vL8vWWOSW4acnU9RmZlz0jOHG9n8MQzuACBZ5OriDxlUS4L6
 TASShss7+clIsB0M75BmaxpnueqzRKCgCvhsYys3FCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=yPOrTr
 awk71tCMQzs3HobuyOMSWUlwTIz11s3Rsw4Zo=; b=CFq4VGbWO0uIIiE2RMxzoH
 WdlN+pETjepRxbPm+zH1ImDWfSQFa9iL1eA+1A9E2QughRMACpF7EdIQ91H/783J
 Fm/UMGP5hmuP/HtJn432O1p1YFracHCmfJ8k3z1bzmLReuJGyEI7Am9aFizFK88B
 MywbPxjOHoBt/cZTkKA/841hgrRdZfQgh4IqHxO22aMmFckbNkDUl+S8QiHaz6fX
 EOwQjDqEpnEVcgSAJgBk/voFATEo1HLLrySbUdgRUbJ5mG0U7Q/C66g16sRM652q
 nMyRGT9umVyzjvKDiAwZlLQaIhY7KFbcRNQq9u+gxBgyuH5FrebsdSHmfIRfp9lw
 ==
X-ME-Sender: <xms:YBc0YLLzQS0d7SFEZMvxl6p9-7od9DL01QOhxrcjFlQo1rBoE47MDQ>
 <xme:YBc0YPLKFNKbW-sbG23qx2xtBNHtTdlTFcMsdooZbUOliqoEOWspBGV1h_78N6y6L
 iMMcwOVHTEQbbE1vEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeefgddufeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:YBc0YDstqAvg8JXAVpmrTSpCLeSjDMiSBVPOPfbZhInLuZcFM9nXuQ>
 <xmx:YBc0YEawhTDwS3H6t_nZHQuglpym7cTfQRt7SPbqnUgyFhuBJvdWcQ>
 <xmx:YBc0YCa2FjZRknpjfDcEIFciSMCHUMhcco_dK4lV0IPqERlkKqJ-FA>
 <xmx:YBc0YJUH24QqJH6jLGTWHJsEuU8NCtHEXLgkUAo4mJ2W2YuzChn66g>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0F5A4240064;
 Mon, 22 Feb 2021 15:43:10 -0500 (EST)
Date: Mon, 22 Feb 2021 21:43:09 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH V2 6/7] hw/block/nvme: support namespace attachment command
Message-ID: <YDQXXQU9nswxE/ip@apples.localdomain>
References: <20210210160937.1100-1-minwoo.im.dev@gmail.com>
 <20210210160937.1100-7-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8gxjdZN77zr+t62i"
Content-Disposition: inline
In-Reply-To: <20210210160937.1100-7-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
Cc: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--8gxjdZN77zr+t62i
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 11 01:09, Minwoo Im wrote:
> This patch supports Namespace Attachment command for the pre-defined
> nvme-ns device nodes.  Of course, attach/detach namespace should only be
> supported in case 'subsys' is given.  This is because if we detach a
> namespace from a controller, somebody needs to manage the detached, but
> allocated namespace in the NVMe subsystem.
>=20
> Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
> ---
>  hw/block/nvme-subsys.h | 10 +++++++
>  hw/block/nvme.c        | 59 ++++++++++++++++++++++++++++++++++++++++++
>  hw/block/nvme.h        |  5 ++++
>  hw/block/trace-events  |  2 ++
>  include/block/nvme.h   |  5 ++++
>  5 files changed, 81 insertions(+)
>=20
> diff --git a/hw/block/nvme-subsys.h b/hw/block/nvme-subsys.h
> index 14627f9ccb41..ef4bec928eae 100644
> --- a/hw/block/nvme-subsys.h
> +++ b/hw/block/nvme-subsys.h
> @@ -30,6 +30,16 @@ typedef struct NvmeSubsystem {
>  int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp);
>  int nvme_subsys_register_ns(NvmeNamespace *ns, Error **errp);
> =20
> +static inline NvmeCtrl *nvme_subsys_ctrl(NvmeSubsystem *subsys,
> +        uint32_t cntlid)
> +{
> +    if (!subsys) {
> +        return NULL;
> +    }
> +
> +    return subsys->ctrls[cntlid];
> +}
> +
>  /*
>   * Return allocated namespace of the specified nsid in the subsystem.
>   */
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 697368a6ae0c..71bcd66f1956 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -183,6 +183,7 @@ static const uint32_t nvme_cse_acs[256] =3D {
>      [NVME_ADM_CMD_SET_FEATURES]     =3D NVME_CMD_EFF_CSUPP,
>      [NVME_ADM_CMD_GET_FEATURES]     =3D NVME_CMD_EFF_CSUPP,
>      [NVME_ADM_CMD_ASYNC_EV_REQ]     =3D NVME_CMD_EFF_CSUPP,
> +    [NVME_ADM_CMD_NS_ATTACHMENT]    =3D NVME_CMD_EFF_CSUPP,
>  };
> =20
>  static const uint32_t nvme_cse_iocs_none[256];
> @@ -3766,6 +3767,62 @@ static uint16_t nvme_aer(NvmeCtrl *n, NvmeRequest =
*req)
>      return NVME_NO_COMPLETE;
>  }
> =20
> +static void __nvme_select_ns_iocs(NvmeCtrl *n, NvmeNamespace *ns);
> +static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
> +{
> +    NvmeNamespace *ns;
> +    NvmeCtrl *ctrl;
> +    uint16_t list[NVME_CONTROLLER_LIST_SIZE] =3D {};
> +    uint32_t nsid =3D le32_to_cpu(req->cmd.nsid);
> +    uint32_t dw10 =3D le32_to_cpu(req->cmd.cdw10);
> +    bool attach =3D !(dw10 & 0xf);
> +    uint16_t *nr_ids =3D &list[0];
> +    uint16_t *ids =3D &list[1];
> +    uint16_t ret;
> +    int i;
> +
> +    trace_pci_nvme_ns_attachment(nvme_cid(req), dw10 & 0xf);
> +
> +    ns =3D nvme_subsys_ns(n->subsys, nsid);
> +    if (!ns) {
> +        return NVME_INVALID_FIELD | NVME_DNR;
> +    }
> +
> +    ret =3D nvme_dma(n, (uint8_t *)list, 4096,
> +                   DMA_DIRECTION_TO_DEVICE, req);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    if (!*nr_ids) {
> +        return NVME_NS_CTRL_LIST_INVALID | NVME_DNR;
> +    }
> +
> +    for (i =3D 0; i < *nr_ids; i++) {
> +        ctrl =3D nvme_subsys_ctrl(n->subsys, ids[i]);
> +        if (!ctrl) {
> +            return NVME_NS_CTRL_LIST_INVALID | NVME_DNR;
> +        }
> +
> +        if (attach) {
> +            if (nvme_ns_is_attached(ctrl, ns)) {
> +                return NVME_NS_ALREADY_ATTACHED | NVME_DNR;
> +            }
> +
> +            nvme_ns_attach(ctrl, ns);
> +            __nvme_select_ns_iocs(ctrl, ns);
> +        } else {
> +            if (!nvme_ns_is_attached(ctrl, ns)) {
> +                return NVME_NS_NOT_ATTACHED | NVME_DNR;
> +            }
> +
> +            nvme_ns_detach(ctrl, ns);
> +        }
> +    }
> +
> +    return NVME_SUCCESS;
> +}
> +
>  static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
>  {
>      trace_pci_nvme_admin_cmd(nvme_cid(req), nvme_sqid(req), req->cmd.opc=
ode,
> @@ -3797,6 +3854,8 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeReq=
uest *req)
>          return nvme_get_feature(n, req);
>      case NVME_ADM_CMD_ASYNC_EV_REQ:
>          return nvme_aer(n, req);
> +    case NVME_ADM_CMD_NS_ATTACHMENT:
> +        return nvme_ns_attachment(n, req);
>      default:
>          assert(false);
>      }
> diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> index 1c7796b20996..5a1ab857d166 100644
> --- a/hw/block/nvme.h
> +++ b/hw/block/nvme.h
> @@ -222,6 +222,11 @@ static inline void nvme_ns_attach(NvmeCtrl *n, NvmeN=
amespace *ns)
>      n->namespaces[nvme_nsid(ns) - 1] =3D ns;
>  }
> =20
> +static inline void nvme_ns_detach(NvmeCtrl *n, NvmeNamespace *ns)
> +{
> +    n->namespaces[nvme_nsid(ns) - 1] =3D NULL;
> +}
> +
>  static inline NvmeCQueue *nvme_cq(NvmeRequest *req)
>  {
>      NvmeSQueue *sq =3D req->sq;
> diff --git a/hw/block/trace-events b/hw/block/trace-events
> index b6e972d733a6..bf67fe7873d2 100644
> --- a/hw/block/trace-events
> +++ b/hw/block/trace-events
> @@ -80,6 +80,8 @@ pci_nvme_aer(uint16_t cid) "cid %"PRIu16""
>  pci_nvme_aer_aerl_exceeded(void) "aerl exceeded"
>  pci_nvme_aer_masked(uint8_t type, uint8_t mask) "type 0x%"PRIx8" mask 0x=
%"PRIx8""
>  pci_nvme_aer_post_cqe(uint8_t typ, uint8_t info, uint8_t log_page) "type=
 0x%"PRIx8" info 0x%"PRIx8" lid 0x%"PRIx8""
> +pci_nvme_ns_attachment(uint16_t cid, uint8_t sel) "cid %"PRIu16", sel=3D=
0x%"PRIx8""
> +pci_nvme_ns_attachment_attach(uint16_t cntlid, uint32_t nsid) "cntlid=3D=
0x%"PRIx16", nsid=3D0x%"PRIx32""
>  pci_nvme_enqueue_event(uint8_t typ, uint8_t info, uint8_t log_page) "typ=
e 0x%"PRIx8" info 0x%"PRIx8" lid 0x%"PRIx8""
>  pci_nvme_enqueue_event_noqueue(int queued) "queued %d"
>  pci_nvme_enqueue_event_masked(uint8_t typ) "type 0x%"PRIx8""
> diff --git a/include/block/nvme.h b/include/block/nvme.h
> index f82b5ffc2c1d..4b016f954fee 100644
> --- a/include/block/nvme.h
> +++ b/include/block/nvme.h
> @@ -566,6 +566,7 @@ enum NvmeAdminCommands {
>      NVME_ADM_CMD_ASYNC_EV_REQ   =3D 0x0c,
>      NVME_ADM_CMD_ACTIVATE_FW    =3D 0x10,
>      NVME_ADM_CMD_DOWNLOAD_FW    =3D 0x11,
> +    NVME_ADM_CMD_NS_ATTACHMENT  =3D 0x15,
>      NVME_ADM_CMD_FORMAT_NVM     =3D 0x80,
>      NVME_ADM_CMD_SECURITY_SEND  =3D 0x81,
>      NVME_ADM_CMD_SECURITY_RECV  =3D 0x82,
> @@ -836,6 +837,9 @@ enum NvmeStatusCodes {
>      NVME_FEAT_NOT_CHANGEABLE    =3D 0x010e,
>      NVME_FEAT_NOT_NS_SPEC       =3D 0x010f,
>      NVME_FW_REQ_SUSYSTEM_RESET  =3D 0x0110,
> +    NVME_NS_ALREADY_ATTACHED    =3D 0x0118,
> +    NVME_NS_NOT_ATTACHED        =3D 0x011A,
> +    NVME_NS_CTRL_LIST_INVALID   =3D 0x011C,
>      NVME_CONFLICTING_ATTRS      =3D 0x0180,
>      NVME_INVALID_PROT_INFO      =3D 0x0181,
>      NVME_WRITE_TO_RO            =3D 0x0182,
> @@ -951,6 +955,7 @@ typedef struct QEMU_PACKED NvmePSD {
>      uint8_t     resv[16];
>  } NvmePSD;
> =20
> +#define NVME_CONTROLLER_LIST_SIZE 2048
>  #define NVME_IDENTIFY_DATA_SIZE 4096
> =20

I know that I'm the one to blame for NVME_IDENTIFY_DATA_SIZE being
there, but it really doesn't belong in the shared header.

This can be fixed up when merged.

>  enum NvmeIdCns {
> --=20
> 2.17.1
>=20
>=20

--8gxjdZN77zr+t62i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmA0F1sACgkQTeGvMW1P
DekbyAf/acfC525zcehgqNxrAYvfugioYSJQ3xZa5Yu1ErOi85us0ZjnVKVu6xdy
4ZsB4WIRTIo0ZQiH8Lqb4uP7zonQVjba9+AfmBWzc3E2vm9F3bOXAh5u3sneZOIb
ZAA4yK7PkypwmNEkiSM3NhJgI1IIJY0X6X9QHi3LTJ+AOmk/fRPUiaZOX8mKKK0z
KhdW5wMg+0U3p+Cv3DSyidpi2CEfg6+7ATjPap+zdBtcnBHc2KOSzuzzRspUTT8S
frsvyEWPc5yOYdqlLQAEBNjwu3+KWehHr1g9wxD9zi7QdSMI3PHo+pGkTvphupd9
3yc9m0CJgM1bvtikoOOtmgqv0TuP+g==
=5RBQ
-----END PGP SIGNATURE-----

--8gxjdZN77zr+t62i--

