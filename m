Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85097327752
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 07:00:25 +0100 (CET)
Received: from localhost ([::1]:55618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGbbU-0000gW-Dg
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 01:00:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lGbXR-0007Fi-Br; Mon, 01 Mar 2021 00:56:13 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:47775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lGbXO-0001xZ-2N; Mon, 01 Mar 2021 00:56:13 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CDBC85C0065;
 Mon,  1 Mar 2021 00:56:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 01 Mar 2021 00:56:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=gwmeWrBbtsZ9Je+MPtIk54g73CU
 TQbWgpYXN7caJai8=; b=hfm13iDgIjZLQmLHldtnhJr8F4Xo8DQhx+RvPjHQQAk
 kSWVtcD57ALAMBuazDjs5qiGHxil+XnBpY6LCT99Ih0d/GkNUL0GSOh68nEqN1A4
 Z67i3e1RU25YwhygyuPv7NLa7pJCf5pimdEH6F8ffOPSK8NpZwSHQYTvzg6Y9GY4
 Ak464TKBeBkrABbJohWkcOf56ws89cHI9f0Cj1OsJ3PhHjhDNqJhI0H360pLf1JO
 QJWJOxNU7PiuZIh5Pmzpx4Kd087ycM3anA0mwcbkyagiYnd2r2dHan2puc2IoA96
 zh+SoDmph9+bwg4qdNSxGE9RzrUWB3k0tSgRM3J/zkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=gwmeWr
 BbtsZ9Je+MPtIk54g73CUTQbWgpYXN7caJai8=; b=qraDeWJ0cnZHrVDujN5dat
 /PdFU84EspKAgNmEQ7Syiae942XfSo5DNdxfyAv/otGnU7Q5hItK4YsbcyPcu7yL
 95ltxPLJmmbY1T8x6+tx7PUcSSJmC2kxTpuhkuFWoboEawHVTV3/JYD5Io1Wlgc1
 Ehx4fjn1/pFrOyErZg4WCH0iGXowStoY+n57407kP1kx2mdD3bJUsuG5MgHFZs3a
 DqIE/0CWogufuZ0bxInfDysnyaTXwZyJI+AN2PTbYHJLn7eziKzY259L86zVhS6J
 NXJXNCfPieULJCwB7C+GHwCEtZe4UcDNvgt4907RsHdh/Bgnq1fs1A/LrXVl09qg
 ==
X-ME-Sender: <xms:9YE8YDrTvX-RGY0Gn50p_J9sMoG1zKPQSJaHMmMQYTW240-EE3Mv1Q>
 <xme:9YE8YNonBz27Qp60IOb7Gb1BgkjcuHQzH0ZxRTschx26vaBNZ210F3454M2H5grv0
 H73uZl3M0yhgK4JDKk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrleejgdeklecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:9YE8YAMsMipPb31pV7LXQRoCAf1S1O7WfyWKtXLE9oSPGJ_l2r7PMA>
 <xmx:9YE8YG7bjnx4N1imTF6831UNh5dcKrA39wZ1AlqNk0_d_OBUrirLPA>
 <xmx:9YE8YC4GpEtrz259eeg6V0LlCeJSnY3eCb2Myltxv96c49_i_5MxoQ>
 <xmx:9oE8YN1LB_gBacuoDGf9E_3G5PcbKkOzQXv6I0gvW7XCFQrVk8jX5g>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id BFB91240057;
 Mon,  1 Mar 2021 00:56:04 -0500 (EST)
Date: Mon, 1 Mar 2021 06:56:02 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH V3 7/8] hw/block/nvme: support changed namespace
 asyncrohous event
Message-ID: <YDyB8m//9Mh3whCI@apples.localdomain>
References: <20210228161100.54015-1-minwoo.im.dev@gmail.com>
 <20210228161100.54015-8-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CLj+IdyZfly1rkO3"
Content-Disposition: inline
In-Reply-To: <20210228161100.54015-8-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
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
Cc: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--CLj+IdyZfly1rkO3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mar  1 01:10, Minwoo Im wrote:
> If namespace inventory is changed due to some reasons (e.g., namespace
> attachment/detachment), controller can send out event notifier to the
> host to manage namespaces.
>=20
> This patch sends out the AEN to the host after either attach or detach
> namespaces from controllers.  To support clear of the event from the
> controller, this patch also implemented Get Log Page command for Changed
> Namespace List log type.  To return namespace id list through the
> command, when namespace inventory is updated, id is added to the
> per-controller list (changed_ns_list).
>=20
> To indicate the support of this async event, this patch set
> OAES(Optional Asynchronous Events Supported) in Identify Controller data
> structure.
>=20
> Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
> ---
>  hw/block/nvme.c      | 44 ++++++++++++++++++++++++++++++++++++++++++++
>  hw/block/nvme.h      |  7 +++++++
>  include/block/nvme.h |  7 +++++++
>  3 files changed, 58 insertions(+)
>=20
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 68c2e63d9412..fc06f806e58e 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -2980,6 +2980,32 @@ static uint16_t nvme_error_info(NvmeCtrl *n, uint8=
_t rae, uint32_t buf_len,
>                      DMA_DIRECTION_FROM_DEVICE, req);
>  }
> =20
> +static uint16_t nvme_changed_nslist(NvmeCtrl *n, uint8_t rae, uint32_t b=
uf_len,
> +                                    uint64_t off, NvmeRequest *req)
> +{
> +    uint32_t nslist[1024];
> +    uint32_t trans_len;
> +    NvmeChangedNs *ns, *next;
> +    int i =3D 0;
> +
> +    memset(nslist, 0x0, sizeof(nslist));
> +    trans_len =3D MIN(sizeof(nslist) - off, buf_len);
> +
> +    QTAILQ_FOREACH_SAFE(ns, &n->changed_ns_list, entry, next) {
> +        nslist[i++] =3D ns->nsid;
> +
> +        QTAILQ_REMOVE(&n->changed_ns_list, ns, entry);
> +        g_free(ns);
> +    }
> +
> +    if (!rae) {
> +        nvme_clear_events(n, NVME_AER_TYPE_NOTICE);
> +    }
> +
> +    return nvme_dma(n, ((uint8_t *)nslist) + off, trans_len,
> +                    DMA_DIRECTION_FROM_DEVICE, req);
> +}
> +
>  static uint16_t nvme_cmd_effects(NvmeCtrl *n, uint8_t csi, uint32_t buf_=
len,
>                                   uint64_t off, NvmeRequest *req)
>  {
> @@ -3064,6 +3090,8 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeReque=
st *req)
>          return nvme_smart_info(n, rae, len, off, req);
>      case NVME_LOG_FW_SLOT_INFO:
>          return nvme_fw_log_info(n, len, off, req);
> +    case NVME_LOG_CHANGED_NSLIST:
> +        return nvme_changed_nslist(n, rae, len, off, req);
>      case NVME_LOG_CMD_EFFECTS:
>          return nvme_cmd_effects(n, csi, len, off, req);
>      default:
> @@ -3882,6 +3910,7 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, Nvm=
eRequest *req)
>      uint16_t *ids =3D &list[1];
>      uint16_t ret;
>      int i;
> +    NvmeChangedNs *changed_nsid;
> =20
>      trace_pci_nvme_ns_attachment(nvme_cid(req), dw10 & 0xf);
> =20
> @@ -3920,6 +3949,18 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, Nv=
meRequest *req)
> =20
>              nvme_ns_detach(ctrl, ns);
>          }
> +
> +        /*
> +         * Add namespace id to the changed namespace id list for event c=
learing
> +         * via Get Log Page command.
> +         */
> +        changed_nsid =3D g_new(NvmeChangedNs, 1);
> +        changed_nsid->nsid =3D nsid;
> +        QTAILQ_INSERT_TAIL(&ctrl->changed_ns_list, changed_nsid, entry);
> +
> +        nvme_enqueue_event(ctrl, NVME_AER_TYPE_NOTICE,
> +                           NVME_AER_INFO_NOTICE_NS_ATTR_CHANGED,
> +                           NVME_LOG_CHANGED_NSLIST);
>      }

If one just keeps attaching/detaching we end up with more than 1024
entries here and go out of bounds in nvme_changed_nslist.

How about having the QTAILQ_ENTRY directly on the NvmeNamespace struct
and use QTAILQ_IN_USE to check if the namespace is already in the list?

> =20
>      return NVME_SUCCESS;
> @@ -4714,6 +4755,7 @@ static void nvme_init_state(NvmeCtrl *n)
>      n->features.temp_thresh_hi =3D NVME_TEMPERATURE_WARNING;
>      n->starttime_ms =3D qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
>      n->aer_reqs =3D g_new0(NvmeRequest *, n->params.aerl + 1);
> +    QTAILQ_INIT(&n->changed_ns_list);
>  }
> =20
>  static int nvme_attach_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error *=
*errp)
> @@ -4910,6 +4952,8 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *=
pci_dev)
> =20
>      id->cntlid =3D cpu_to_le16(n->cntlid);
> =20
> +    id->oaes =3D cpu_to_le32(NVME_OAES_NS_ATTR);
> +
>      id->rab =3D 6;
> =20
>      if (n->params.use_intel_id) {
> diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> index 74a00ab21a55..d5eaea003ea5 100644
> --- a/hw/block/nvme.h
> +++ b/hw/block/nvme.h
> @@ -132,6 +132,11 @@ typedef struct NvmeFeatureVal {
>      uint32_t    async_config;
>  } NvmeFeatureVal;
> =20
> +typedef struct NvmeChangedNs {
> +    uint32_t nsid;
> +    QTAILQ_ENTRY(NvmeChangedNs) entry;
> +} NvmeChangedNs;
> +
>  typedef struct NvmeCtrl {
>      PCIDevice    parent_obj;
>      MemoryRegion bar0;
> @@ -177,6 +182,8 @@ typedef struct NvmeCtrl {
>      QTAILQ_HEAD(, NvmeAsyncEvent) aer_queue;
>      int         aer_queued;
> =20
> +    QTAILQ_HEAD(, NvmeChangedNs) changed_ns_list;   /* Changed NS list l=
og */
> +
>      NvmeSubsystem   *subsys;
> =20
>      NvmeNamespace   namespace;
> diff --git a/include/block/nvme.h b/include/block/nvme.h
> index 339784d9c23a..eb0b31e949c2 100644
> --- a/include/block/nvme.h
> +++ b/include/block/nvme.h
> @@ -760,6 +760,7 @@ typedef struct QEMU_PACKED NvmeCopySourceRange {
>  enum NvmeAsyncEventRequest {
>      NVME_AER_TYPE_ERROR                     =3D 0,
>      NVME_AER_TYPE_SMART                     =3D 1,
> +    NVME_AER_TYPE_NOTICE                    =3D 2,
>      NVME_AER_TYPE_IO_SPECIFIC               =3D 6,
>      NVME_AER_TYPE_VENDOR_SPECIFIC           =3D 7,
>      NVME_AER_INFO_ERR_INVALID_DB_REGISTER   =3D 0,
> @@ -771,6 +772,7 @@ enum NvmeAsyncEventRequest {
>      NVME_AER_INFO_SMART_RELIABILITY         =3D 0,
>      NVME_AER_INFO_SMART_TEMP_THRESH         =3D 1,
>      NVME_AER_INFO_SMART_SPARE_THRESH        =3D 2,
> +    NVME_AER_INFO_NOTICE_NS_ATTR_CHANGED    =3D 0,
>  };
> =20
>  typedef struct QEMU_PACKED NvmeAerResult {
> @@ -940,6 +942,7 @@ enum NvmeLogIdentifier {
>      NVME_LOG_ERROR_INFO     =3D 0x01,
>      NVME_LOG_SMART_INFO     =3D 0x02,
>      NVME_LOG_FW_SLOT_INFO   =3D 0x03,
> +    NVME_LOG_CHANGED_NSLIST =3D 0x04,
>      NVME_LOG_CMD_EFFECTS    =3D 0x05,
>  };
> =20
> @@ -1046,6 +1049,10 @@ typedef struct NvmeIdCtrlZoned {
>      uint8_t     rsvd1[4095];
>  } NvmeIdCtrlZoned;
> =20
> +enum NvmeIdCtrlOaes {
> +    NVME_OAES_NS_ATTR   =3D 1 << 8,
> +};
> +
>  enum NvmeIdCtrlOacs {
>      NVME_OACS_SECURITY  =3D 1 << 0,
>      NVME_OACS_FORMAT    =3D 1 << 1,
> --=20
> 2.25.1
>=20

--=20
One of us - No more doubt, silence or taboo about mental illness.

--CLj+IdyZfly1rkO3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmA8ge8ACgkQTeGvMW1P
DenJ9wf/TicQXTbaPgGOY29VDaDgrfnUSSCMSUXk+fHFsT7He3cNg0zSDsldVfH9
7SqOClTjc+kQwSzQMDEhfTQW9xnyYCrQFgxBbGCAOF1VdO/4u9kJBXekO3ykC8tK
aO1SM9ACpsQJO5+Gli4PA3NdXC7GkcSewvFD/HmPJ3/tmwTakjKYd0p0hZB5bVGy
V1hXXvTkV0PhB3FfpD8K4tobJ/waV698BK9PCrFvck+5YyYSJdU+Af0UlzQO9/kC
YZMuYuNH3eb0QWjY2IshuaUFjIroHDXpc+yxECJheL+gh1MUjHPR00CfXX/bEdYq
+MjbkEwHmI0SupEZ9YKxFOhhKIqrPA==
=+be9
-----END PGP SIGNATURE-----

--CLj+IdyZfly1rkO3--

