Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6500455BF0A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 09:23:52 +0200 (CEST)
Received: from localhost ([::1]:37664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o65Zf-0004SW-Fg
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 03:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o64Dn-000110-RC; Tue, 28 Jun 2022 01:57:11 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:52495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1o64Dl-0008ET-6A; Tue, 28 Jun 2022 01:57:11 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DF5395C0117;
 Tue, 28 Jun 2022 01:57:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 28 Jun 2022 01:57:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656395826; x=1656482226; bh=Zk
 uCo4+VFiwyTuxia6/npxGBsvt95Xa54UCU6yefy8c=; b=TjWHkP2MQXHmJbYbdL
 WFAaCxztvApTgF1exc6hBY0nXh3OH2XsEke+BvxJDgL//HlLj7JTIfIg4gA0itPu
 gbrH18fAthMgiJlvOY7HBZilFhR85TiGl+nswFLglHBUhffNbQQSU88AIfP112PU
 r4g/x0BMdshXCx7dLcEHZauCBDeN9q5cyVuel+pY65w1PWW7ouJ5scxYj6cOS/Rz
 +Qbp+UddzZXHa4o9rUDGTYjNH5hutMY4zZsFq4WOPjUXMg9vg/l3hIgG2aRvit3P
 xRRKF1iH/nLtxT+T5nlPD/ld/aIYz7Bq9FA2VCF0n9Eh+6hjU3jv3i7JGPSNtioB
 wjDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1656395826; x=1656482226; bh=ZkuCo4+VFiwyTuxia6/npxGBsvt9
 5Xa54UCU6yefy8c=; b=xlobArReourPtTvrkGbjlBEYUclJQbvLuLtNkZ76CUA2
 MJoNabRQbVhVdaoKlZchg33ElV6z3gin7aztUYJ3ezA0Qs3lP2xCdAR334gaVnee
 +iR5En1H1Cd0TsbUaAkRxisO67NAswR9TqpTEagETZJ/VXDTpwvh7hUiZocI9eW3
 vHf2Zvs+vWpqVAS36TJMmd+LAXyaIyA/aK/BD8JIRE5ldBRId8Cq9Tns9Qf0sTKV
 x6KwRYthj6Ju31kcfVhRonIw1AjnY5jt/E/DtDocmnVZ/vtbcFTsdxINZtaMUyjJ
 wyRbzd5xfRTzDLvwi5t1kEKyKscJe+qsQGitQCfSOA==
X-ME-Sender: <xms:Mpi6Yniffp42AOukhUUfCwF4iPyZGFe53mxsbAo_rtjtY_h7abuqQg>
 <xme:Mpi6YkDSxZlDexjFnrx2xI0kXsOOKGuOMr8mxdE5QOEM4v1s0nl0tApLlswdQa2lS
 nyOFSDGzwg6R7HawP4>
X-ME-Received: <xmr:Mpi6YnFdgH4UYXCv4rrl_cvNKNMsKZ2MLaIIlvKmT9cCs8Sk-pc-55rvwoBQF9Lt7jI2BeT_kunmCU3srzs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudegiedguddtvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeffuddvhfehjedugfeijeeuieelgeevuddvlefhkefhgfettefftddvkeev
 ieelfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgu
 kh
X-ME-Proxy: <xmx:Mpi6YkS7qpeQL3bphoXPI0xIdun7BMmmqGosmeSxb6D9OFEzz7n2rA>
 <xmx:Mpi6YkyY5M5m8U0U275tbpLuamrD5CWPs8j-fUqlg4bB5_kqHnH4-A>
 <xmx:Mpi6Yq68H0cDk6ZTzHY_T5q3X5EQvQLcI-4VnzlvTWpct9ZYx3Wd-g>
 <xmx:Mpi6YushOIM6tMekhb9VmudQpIIUkLt7I0-jO3_6VlOfX53G8WKkbw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Jun 2022 01:57:05 -0400 (EDT)
Date: Tue, 28 Jun 2022 07:57:03 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Niklas Cassel <niklas.cassel@wdc.com>
Cc: kbusch@kernel.org, damien.lemoal@wdc.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 3/4] hw/nvme: add support for ratified TP4084
Message-ID: <YrqYLx4bwkq00OrJ@apples>
References: <20220627114731.356462-1-niklas.cassel@wdc.com>
 <20220627114731.356462-4-niklas.cassel@wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5nM7hCywMahnFzns"
Content-Disposition: inline
In-Reply-To: <20220627114731.356462-4-niklas.cassel@wdc.com>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--5nM7hCywMahnFzns
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 27 13:47, Niklas Cassel wrote:
> TP4084 adds a new mode, CC.CRIME, that can be used to mark a namespace
> as ready independently from the controller.
>=20
> When CC.CRIME is 0 (default), things behave as before, all namespaces
> are ready when CSTS.RDY gets set to 1.
>=20
> When CC.CRIME is 1, the controller will become ready when CSTS.RDY gets
> set to 1, but commands accessing a namespace are allowed to return
> "Namespace Not Ready" or "Admin Command Media Not Ready".
> After CRTO.CRWMT amount of time, if the namespace has not yet been
> marked ready, the status codes also need to have the DNR bit set.
>=20
> Add a new "ready_delay" namespace device parameter, in order to emulate
> different ready latencies for namespaces.
>=20
> Once a namespace is ready, it will set the NRDY bit in the I/O Command
> Set Independent Identify Namespace Data Structure, and then send out a
> Namespace Attribute Changed event.
>=20
> This new "ready_delay" is supported on controllers not part of a NVMe
> subsystem. The reasons are many. One problem is that multiple controllers
> can have different CC.CRIME modes running. Another problem is the extra
> locking needed. The third problem is when to actually clear NRDY. If we
> assume that a namespace clears NRDY when it no longer has any controller
> online for that namespace. The problem then is that Linux will reset the
> controllers one by one during probe time. The reset goes so fast so that
> there is no time when all controllers are in reset at the same time, so
> NRDY will never get cleared. (The controllers are enabled by SeaBIOS by
> default.) We could introduce a reset_time param, but this would only
> increase the chances that all controllers are in reset at the same time.
>=20
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> ---
>  hw/nvme/ctrl.c       | 123 +++++++++++++++++++++++++++++++++++++++++--
>  hw/nvme/ns.c         |  18 +++++++
>  hw/nvme/nvme.h       |   6 +++
>  hw/nvme/trace-events |   1 +
>  include/block/nvme.h |  60 ++++++++++++++++++++-
>  5 files changed, 204 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 8ca824ea14..5404f67480 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -88,6 +88,12 @@
>   *   completion when there are no outstanding AERs. When the maximum num=
ber of
>   *   enqueued events are reached, subsequent events will be dropped.
>   *
> + * - `crwmt`
> + *   This is the Controller Ready With Media Timeout (CRWMT) field that =
is
> + *   defined in the CRTO register. This specifies the worst-case time th=
at host
> + *   software should wait for the controller and all attached namespaces=
 to
> + *   become ready. The value is in units of 500 milliseconds.
> + *
>   * - `mdts`
>   *   Indicates the maximum data transfer size for a command that transfe=
rs data
>   *   between host-accessible memory and the controller. The value is spe=
cified
> @@ -157,6 +163,11 @@
>   *   namespace will be available in the subsystem but not attached to any
>   *   controllers.
>   *
> + * - `ready_delay`
> + *   This parameter specifies the amount of time that the namespace shou=
ld wait
> + *   before being marked ready. Only applicable if CC.CRIME is set by th=
e user.
> + *   The value is in units of 500 milliseconds (to be consistent with `c=
rwmt`).
> + *
>   * Setting `zoned` to true selects Zoned Command Set at the namespace.
>   * In this case, the following namespace properties are available to con=
figure
>   * zoned operation:
> @@ -216,6 +227,8 @@
>  #define NVME_VF_RES_GRANULARITY 1
>  #define NVME_VF_OFFSET 0x1
>  #define NVME_VF_STRIDE 1
> +#define NVME_DEFAULT_CRIMT 0xa
> +#define NVME_DEFAULT_CRWMT 0xf
> =20
>  #define NVME_GUEST_ERR(trace, fmt, ...) \
>      do { \
> @@ -4188,6 +4201,10 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeReque=
st *req)
>          return NVME_INVALID_OPCODE | NVME_DNR;
>      }
> =20
> +    if (!(ns->id_indep_ns.nstat & NVME_NSTAT_NRDY)) {
> +        return NVME_NS_NOT_READY;
> +    }
> +

I'd add a ns->ready bool instead. See below for my previously posted
patch.

>      if (ns->status) {
>          return ns->status;
>      }
> @@ -4791,6 +4808,27 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, Nvme=
Request *req, bool active)
>      return NVME_INVALID_CMD_SET | NVME_DNR;
>  }
> =20
> +static uint16_t nvme_identify_cs_indep_ns(NvmeCtrl *n, NvmeRequest *req)
> +{
> +    NvmeNamespace *ns;
> +    NvmeIdentify *c =3D (NvmeIdentify *)&req->cmd;
> +    uint32_t nsid =3D le32_to_cpu(c->nsid);
> +
> +    trace_pci_nvme_identify_cs_indep_ns(nsid);
> +
> +    if (!nvme_nsid_valid(n, nsid) || nsid =3D=3D NVME_NSID_BROADCAST) {
> +        return NVME_INVALID_NSID | NVME_DNR;
> +    }
> +
> +    ns =3D nvme_ns(n, nsid);
> +    if (unlikely(!ns)) {
> +            return nvme_rpt_empty_id_struct(n, req);
> +    }
> +
> +    return nvme_c2h(n, (uint8_t *)&ns->id_indep_ns, sizeof(NvmeIdNsCsInd=
ep),
> +                    req);
> +}
> +

I posted a patch for this some time ago

https://lore.kernel.org/qemu-devel/20220531060342.2556973-1-its@irrelevant.=
dk/

The structure is so simple that we can just "build" it here instead of
adding yet another (mostly empty) 4k member to the NvmeNamespace struct.

>  static uint16_t nvme_identify_ctrl_list(NvmeCtrl *n, NvmeRequest *req,
>                                          bool attached)
>  {
> @@ -5081,6 +5119,8 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequ=
est *req)
>          return nvme_identify_ns(n, req, true);
>      case NVME_ID_CNS_NS_PRESENT:
>          return nvme_identify_ns(n, req, false);
> +    case NVME_ID_CNS_CS_INDEPENDENT_NS:
> +        return nvme_identify_cs_indep_ns(n, req);
>      case NVME_ID_CNS_NS_ATTACHED_CTRL_LIST:
>          return nvme_identify_ctrl_list(n, req, true);
>      case NVME_ID_CNS_CTRL_LIST:
> @@ -5556,6 +5596,44 @@ static void nvme_select_iocs_ns(NvmeCtrl *n, NvmeN=
amespace *ns)
>      }
>  }
> =20
> +void nvme_ns_ready_cb(void *opaque)
> +{
> +    NvmeNamespace *ns =3D opaque;
> +    DeviceState *dev =3D &ns->parent_obj;
> +    BusState *s =3D qdev_get_parent_bus(dev);
> +    NvmeCtrl *n =3D NVME(s->parent);
> +
> +    ns->id_indep_ns.nstat |=3D NVME_NSTAT_NRDY;
> +
> +    if (!test_and_set_bit(ns->params.nsid, n->changed_nsids)) {
> +        nvme_enqueue_event(n, NVME_AER_TYPE_NOTICE,
> +                           NVME_AER_INFO_NOTICE_NS_ATTR_CHANGED,
> +                           NVME_LOG_CHANGED_NSLIST);
> +    }
> +}

Move to hw/nvme/ns.c.

> +
> +static void nvme_set_ready_or_start_timer(NvmeCtrl *n, NvmeNamespace *ns)
> +{
> +    int64_t expire_time;
> +
> +    if (!NVME_CC_CRIME(ldl_le_p(&n->bar.cc)) || ns->params.ready_delay =
=3D=3D 0) {
> +        ns->id_indep_ns.nstat |=3D NVME_NSTAT_NRDY;
> +        return;
> +    }
> +
> +    expire_time =3D qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
> +    expire_time +=3D ns->params.ready_delay * 500;
> +    timer_mod(ns->ready_delay_timer, expire_time);
> +}

This can be made independent of NvmeCtrl by passing the CRIME value (and
then moved to hw/nvme/ns.c).

> +
> +static inline void nvme_ns_clear_ready_and_stop_timer(NvmeNamespace *ns)
> +{
> +    if (!ns->subsys) {
> +        timer_del(ns->ready_delay_timer);
> +        ns->id_indep_ns.nstat &=3D ~NVME_NSTAT_NRDY;
> +    }
> +}
> +

Move to hw/nvme/ns.c.

--5nM7hCywMahnFzns
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmK6mC0ACgkQTeGvMW1P
Del96QgAlxSuqV8SiFIJXKTcrcJBBrI4jp1y1wiTriiXpt31Wjh1mDSGxV0bH8mJ
Z6WhEiz4kQu6a5Vit7v+sJXFPqZMLT9tmYq+P3fbCnninYlhoVp3J0r3+Sa18dob
NbZ7OVJxUQY2h2WfJs7wEG3hIeQy2NsRL7inKYgbqgLoDhKMHL/7ycj/DtNTHkVJ
7C2qTxtPX5fvK9jr63Hclt5XqVCF4egOKn/hlHoTgEAx8AP7pyi5Js179Z6ywc2D
KHmO3vhhExYHGOSBKl0a9tleXfVEYkQXxt7nYKDF8xRWAH//IWlAoYd3diJDCrbt
doNJn/vaCgZlQkeB1pShlnHMP4JHRA==
=hwA+
-----END PGP SIGNATURE-----

--5nM7hCywMahnFzns--

