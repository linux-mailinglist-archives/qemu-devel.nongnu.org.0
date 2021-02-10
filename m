Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3293E31717B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 21:38:40 +0100 (CET)
Received: from localhost ([::1]:45400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9wFy-0003hi-JX
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 15:38:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9wBW-0002v2-F4; Wed, 10 Feb 2021 15:34:03 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:55999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9wBP-0005oh-Lr; Wed, 10 Feb 2021 15:34:02 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A2ECA5C015C;
 Wed, 10 Feb 2021 15:33:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 10 Feb 2021 15:33:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=rAkesKaXlhjZ029r7K/lWPO73Xx
 L+RYGSlQls/0+ETA=; b=maOfaRnWxk2C0VV7h0sthg2j46N7pvXm/mEDHi4W9w+
 YtdPIofmZO9naSskCeaLQXDkyeOmKA7sXwbAyy3lHWRn1WELE8IeCDBv4nmEqj+m
 8alxcllWH70uxStq5Fp6+RG4FH8tK6pHuk/RFhNGYZVSHB6Zma0nf1orqOGrBAaQ
 E/uek4MdDh1tIq1LAl+UfAs3cE7vbfHXM1RQR8clv7QTg9zc2piZPgsOXbda3maN
 m/j0XvZmxEoKJa5F3LmPa2ZFp8dSWgPXHrcjKLeHqmSuV88wYmlB+u6vItI7UPzs
 F/99yW8PPBayFGECR6r6dOOa8Qxw+PgkTWSaf6kj69w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=rAkesK
 aXlhjZ029r7K/lWPO73XxL+RYGSlQls/0+ETA=; b=bgvA5tgLwyVsq+esY6SWJi
 t7r45iiaedwNc+EDNIDaaPtiGYy4fNpBxO4Gb8BUx3dFDZqETZsPwIlytYr0yNU0
 Y6MD1eE9yumvtrhafWD2aDa73k2obfgnhtEGjzmgWii4f1rAtV+uEiNxw3n5HcHE
 8VkqXm+f3ggaD7LAhQVf7ZKPIYSj7vAna6Aao/yGP9GN1yi6xEahGe+2BRg5fPg7
 vMk0gMuTcHuLIW+14ufCNv+ZzpJQL11q90FuG6O/A/kVEux4JMiOokMLZcWsEruJ
 5jGpYm8miy/Fz9aWw85MFfsfLJSGFcACHsdo4HMWn+L2pb2Rgt0pNYAALqWIGjgw
 ==
X-ME-Sender: <xms:MEMkYO1XZs2TluYE4pgMVCda-XqCkJphVPwWDztruAbReBJY0CiOAA>
 <xme:MEMkYBF6BETOoXdx5zoYTmcKSfk2-aFCb2dt1X6CURU-d2eBepg4fLMOgJw6ZFQxo
 mwpJw6WZWM3OrT4b1c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheejgddufeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:MEMkYG6XnzjslMfarzqlU3SsBJ1OFW-wIOwleEfM10lOElxLmXft9g>
 <xmx:MEMkYP25S8BdBzN11H43bk7tqap5ZB4mUvbpULNS-eTOksxUo5mP7g>
 <xmx:MEMkYBFD1wAsCIRjme5Jus9pHwJSBQeTIrPLk0ZyiHyV8KcIq3R_9Q>
 <xmx:MUMkYKOai1bbJwcAVMz6Ky7mVlmUeqeUzOU2No5hylWUNwCIDBaDoA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id D16D9108005B;
 Wed, 10 Feb 2021 15:33:51 -0500 (EST)
Date: Wed, 10 Feb 2021 21:33:50 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [RFC PATCH 3/3] hw/block/nvme: add nvme_inject_state HMP command
Message-ID: <YCRDLk8e1A4mxbYd@apples.localdomain>
References: <20210210195252.19339-1-minwoo.im.dev@gmail.com>
 <20210210195252.19339-4-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+ZObUs8dwmZ0MpYt"
Content-Disposition: inline
In-Reply-To: <20210210195252.19339-4-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--+ZObUs8dwmZ0MpYt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Feb 11 04:52, Minwoo Im wrote:
> nvme_inject_state command is to give a controller state to be.
> Human Monitor Interface(HMP) supports users to make controller to a
> specified state of:
>=20
> 	normal:			Normal state (no injection)
> 	cmd-interrupted:	Commands will be interrupted internally
>=20
> This patch is just a start to give dynamic command from the HMP to the
> QEMU NVMe device model.  If "cmd-interrupted" state is given, then the
> controller will return all the CQ entries with Command Interrupts status
> code.
>=20
> Usage:
> 	-device nvme,id=3Dnvme0,....
>=20
> 	(qemu) nvme_inject_state nvme0 cmd-interrupted
>=20
> 	<All the commands will be interrupted internally>
>=20
> 	(qemu) nvme_inject_state nvme0 normal
>=20
> This feature is required to test Linux kernel NVMe driver for the
> command retry feature.
>=20

This is super cool and commands like this feel much nicer than the
qom-set approach that the SMART critical warning feature took.

But... looking at the existing commands I don't think we can "bloat" it
up with a device specific command like this, but I don't know the policy
around this.

If an HMP command is out, then we should be able to make do with the
qom-set approach just fine though.

> Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
> ---
>  hmp-commands.hx       | 13 ++++++++++++
>  hw/block/nvme.c       | 49 +++++++++++++++++++++++++++++++++++++++++++
>  hw/block/nvme.h       |  8 +++++++
>  include/monitor/hmp.h |  1 +
>  4 files changed, 71 insertions(+)
>=20
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index d4001f9c5dc6..ef288c567b46 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1307,6 +1307,19 @@ SRST
>    Inject PCIe AER error
>  ERST
> =20
> +    {
> +        .name       =3D "nvme_inject_state",
> +        .args_type  =3D "id:s,state:s",
> +        .params     =3D "id [normal|cmd-interrupted]",
> +        .help       =3D "inject controller/namespace state",
> +        .cmd        =3D hmp_nvme_inject_state,
> +    },
> +
> +SRST
> +``nvme_inject_state``
> +  Inject NVMe controller/namespace state
> +ERST
> +
>      {
>          .name       =3D "netdev_add",
>          .args_type  =3D "netdev:O",
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 6d3c554a0e99..42cf5bd113e6 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -123,6 +123,7 @@
>  #include "sysemu/sysemu.h"
>  #include "qapi/error.h"
>  #include "qapi/visitor.h"
> +#include "qapi/qmp/qdict.h"
>  #include "sysemu/hostmem.h"
>  #include "sysemu/block-backend.h"
>  #include "exec/memory.h"
> @@ -132,6 +133,7 @@
>  #include "trace.h"
>  #include "nvme.h"
>  #include "nvme-ns.h"
> +#include "monitor/monitor.h"
> =20
>  #define NVME_MAX_IOQPAIRS 0xffff
>  #define NVME_DB_SIZE  4
> @@ -966,6 +968,14 @@ static void nvme_enqueue_req_completion(NvmeCQueue *=
cq, NvmeRequest *req)
>  {
>      assert(cq->cqid =3D=3D req->sq->cqid);
> =20
> +    /*
> +     * Override request status field if controller state has been inject=
ed by
> +     * the QMP.
> +     */
> +    if (cq->ctrl->state =3D=3D NVME_STATE_CMD_INTERRUPTED) {
> +        req->status =3D NVME_COMMAND_INTERRUPTED;
> +    }
> +
>      if (req->status !=3D NVME_SUCCESS) {
>          if (cq->ctrl->features.acre && nvme_should_retry(req)) {
>              if (cq->ctrl->params.cmd_retry_delay > 0) {
> @@ -5025,4 +5035,43 @@ static void nvme_register_types(void)
>      type_register_static(&nvme_bus_info);
>  }
> =20
> +static void nvme_inject_state(NvmeCtrl *n, NvmeState state)
> +{
> +    n->state =3D state;
> +}
> +
> +static const char *nvme_states[] =3D {
> +    [NVME_STATE_NORMAL]             =3D "normal",
> +    [NVME_STATE_CMD_INTERRUPTED]    =3D "cmd-interrupted",
> +};
> +
> +void hmp_nvme_inject_state(Monitor *mon, const QDict *qdict)
> +{
> +    const char *id =3D qdict_get_str(qdict, "id");
> +    const char *state =3D qdict_get_str(qdict, "state");
> +    PCIDevice *dev;
> +    NvmeCtrl *n;
> +    int ret, i;
> +
> +    ret =3D pci_qdev_find_device(id, &dev);
> +    if (ret < 0) {
> +        monitor_printf(mon, "invalid device id %s\n", id);
> +        return;
> +    }
> +
> +    n =3D NVME(dev);
> +
> +    for (i =3D 0; i < ARRAY_SIZE(nvme_states); i++) {
> +        if (!strcmp(nvme_states[i], state)) {
> +            nvme_inject_state(n, i);
> +            monitor_printf(mon,
> +                           "-device nvme,id=3D%s: state %s injected\n",
> +                           id, state);
> +            return;
> +        }
> +    }
> +
> +    monitor_printf(mon, "invalid state %s\n", state);
> +}
> +
>  type_init(nvme_register_types)
> diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> index 37940b3ac2d2..1af1e0380d9b 100644
> --- a/hw/block/nvme.h
> +++ b/hw/block/nvme.h
> @@ -128,6 +128,11 @@ typedef struct NvmeFeatureVal {
>      uint8_t     acre;
>  } NvmeFeatureVal;
> =20
> +typedef enum NvmeState {
> +    NVME_STATE_NORMAL,
> +    NVME_STATE_CMD_INTERRUPTED,
> +} NvmeState;
> +
>  typedef struct NvmeCtrl {
>      PCIDevice    parent_obj;
>      MemoryRegion bar0;
> @@ -185,6 +190,8 @@ typedef struct NvmeCtrl {
>      NvmeCQueue      admin_cq;
>      NvmeIdCtrl      id_ctrl;
>      NvmeFeatureVal  features;
> +
> +    NvmeState       state;
>  } NvmeCtrl;
> =20
>  static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, uint32_t nsid)
> @@ -212,4 +219,5 @@ static inline NvmeCtrl *nvme_ctrl(NvmeRequest *req)
> =20
>  int nvme_register_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp=
);
> =20
> +void hmp_nvme_inject_state(Monitor *mon, const QDict *qdict);
>  #endif /* HW_NVME_H */
> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> index ed2913fd18e8..668384ea2e34 100644
> --- a/include/monitor/hmp.h
> +++ b/include/monitor/hmp.h
> @@ -79,6 +79,7 @@ void hmp_migrate(Monitor *mon, const QDict *qdict);
>  void hmp_device_add(Monitor *mon, const QDict *qdict);
>  void hmp_device_del(Monitor *mon, const QDict *qdict);
>  void hmp_dump_guest_memory(Monitor *mon, const QDict *qdict);
> +void hmp_nvme_inject_state(Monitor *mon, const QDict *qdict);
>  void hmp_netdev_add(Monitor *mon, const QDict *qdict);
>  void hmp_netdev_del(Monitor *mon, const QDict *qdict);
>  void hmp_getfd(Monitor *mon, const QDict *qdict);
> --=20
> 2.17.1
>=20

--=20
One of us - No more doubt, silence or taboo about mental illness.

--+ZObUs8dwmZ0MpYt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAkQywACgkQTeGvMW1P
DemkNQgAqVVeWbBfWz2jsnbh7Z+wY1wIJ+uZY2jzd+z6kahELLGkXHiiVgykS8O8
GR13UcnYBuCbc3+eEN9P9WGBxcz9ENrBzRcSRiigH8sPIwkmaAZwSmG+CDV+y9hD
yhb+D3lYubOeG6CN8sTpoBCCBjvWmOgCBmoER+Q6KTd6DFLSuwNZc0uLtjipI1UU
N56I2aL9L/skYi30YUE2lvCzJIFr3DdariYmHVvI83S3t+yvqNLWCTmfd1w9IWTN
ebDBzxobu2iykuBKyazXl5r2UtEIZkPf8pPVBLK7oHiTkp+BVT6WjrtDbm+6S7jz
SQXOBBaWI6JhaynSwMEASQc42JBOqg==
=Pl98
-----END PGP SIGNATURE-----

--+ZObUs8dwmZ0MpYt--

