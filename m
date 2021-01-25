Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4171302C1A
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 20:59:03 +0100 (CET)
Received: from localhost ([::1]:54584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l480s-000742-93
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 14:59:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l47vN-0004B8-9b; Mon, 25 Jan 2021 14:53:21 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:60797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l47vK-0005ay-Br; Mon, 25 Jan 2021 14:53:20 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 8BB91ED1;
 Mon, 25 Jan 2021 14:53:15 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 25 Jan 2021 14:53:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=c3OUXHkPtTfqdaNx/IE9ISnSHOA
 wcejIB1YjMnELVa4=; b=XPf1vpXBjIX+U4OrYx0+h8En+NlzfY+wQNn6p0FyFeT
 4QBHPV/1kLNDIKzXK9C+r0d7IYpdkqNYedlDi9A9i1axfXNp/bjAshKHNyKyA+Yx
 496qoTwuHvY+Rc9Iq+GDgwr7wV6Qx9xNZrHIrkmsAV+N8d7eON8J7IyXPPyqDJqz
 NquHef3wGqB/QqZ6juTP4NdSYGSfDlFMVoBh1dM6zSuAXgnEIiZYG625XGrEV0YN
 N8QLCem6AgWTlBKk3TY/PhSVnFLWb9z6+swb007ootAqW4ra5z5MyuO1AoJqC5h6
 QtvyOV8lz0m7nnd6O0dyfQ3LZnLM1vBHkNPJ97JUBUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=c3OUXH
 kPtTfqdaNx/IE9ISnSHOAwcejIB1YjMnELVa4=; b=n0Dp2PMXYdpG71xqqHySo+
 NZThCRekr0E5dvxany7FY/IBxUXc12Hoc+N7kOAGw+atGgsEYICAZKZiGVTQIVNK
 hFuAbEVf2iIN/ooedXztaV6T7BDffCh/9dnr45R91Y12hpV/OeWaFPl9AYHH+KJC
 U7CAbmgXw/rwt4scDQuWpXgd1UL3wIB1w2LN48ooaV+SpKJThZTunrm5l/qBxqiW
 z+gBa61ZAfQUzFahRnlU5hR8+yqw80avqKuDN6cSLyS+pNnB43EjpXzzEjpjmnGb
 bOkgYmZTXul7A3XZztSMULyViVkM10UKH8/ymPxtKNcAB3Rqn3peDMb+SAyBto3Q
 ==
X-ME-Sender: <xms:qiEPYI7C6Mlp3fHybKJusY5NSGb3vq0HBWygXYncKDv55dfrrPGXsg>
 <xme:qiEPYJ6GxN21wuVP2YfRKlB3SVkMzRiIVR9AD6UpHZoid6R4HSwuVqSAenuEgyUCb
 8lfVOD26228Dcikxbc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdefgdduvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:qiEPYHedpxLiCR37q-zLshBQ4msn4PjHjeT0n94Jm9K3JbYsH-pt2A>
 <xmx:qiEPYNJhbilx5yAwIAV5xoupOx_qZd4AfUsvkue3qysJbUcf-b0fzA>
 <xmx:qiEPYMIWvlW7gJoUkB4oGd1ZwmS-d6BUGPwYHGJhxyONuzo2YNHUfA>
 <xmx:qyEPYBFDEBSt8B9_ZQx2nNnbhK5UfBv8yTedO5TNKbmrFVXfrCfC7A>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9AC181080057;
 Mon, 25 Jan 2021 14:53:13 -0500 (EST)
Date: Mon, 25 Jan 2021 20:53:11 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [PATCH V6 6/6] hw/block/nvme: support for shared namespace in
 subsystem
Message-ID: <YA8hp7keD+G9uE+8@apples.localdomain>
References: <20210124025450.11071-1-minwoo.im.dev@gmail.com>
 <20210124025450.11071-7-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="vQDhIovfcDPvuO0p"
Content-Disposition: inline
In-Reply-To: <20210124025450.11071-7-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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
Cc: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--vQDhIovfcDPvuO0p
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 24 11:54, Minwoo Im wrote:
> nvme-ns device is registered to a nvme controller device during the
> initialization in nvme_register_namespace() in case that 'bus' property
> is given which means it's mapped to a single controller.
>=20
> This patch introduced a new property 'subsys' just like the controller
> device instance did to map a namespace to a NVMe subsystem.
>=20
> If 'subsys' property is given to the nvme-ns device, it will belong to
> the specified subsystem and will be attached to all controllers in that
> subsystem by enabling shared namespace capability in NMIC(Namespace
> Multi-path I/O and Namespace Capabilities) in Identify Namespace.
>=20
> Usage:
>=20
>   -device nvme-subsys,id=3Dsubsys0
>   -device nvme,serial=3Dfoo,id=3Dnvme0,subsys=3Dsubsys0
>   -device nvme,serial=3Dbar,id=3Dnvme1,subsys=3Dsubsys0
>   -device nvme,serial=3Dbaz,id=3Dnvme2,subsys=3Dsubsys0
>   -device nvme-ns,id=3Dns1,drive=3D<drv>,nsid=3D1,subsys=3Dsubsys0  # Sha=
red
>   -device nvme-ns,id=3Dns2,drive=3D<drv>,nsid=3D2,bus=3Dnvme2       # Non=
-shared
>=20
>   In the above example, 'ns1' will be shared to 'nvme0' and 'nvme1' in
>   the same subsystem.  On the other hand, 'ns2' will be attached to the
>   'nvme2' only as a private namespace in that subsystem.
>=20
> All the namespace with 'subsys' parameter will attach all controllers in
> the subsystem to the namespace by default.
>=20
> Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
> ---
>  hw/block/nvme-ns.c     | 23 ++++++++++++++++++-----
>  hw/block/nvme-ns.h     |  7 +++++++
>  hw/block/nvme-subsys.c | 25 +++++++++++++++++++++++++
>  hw/block/nvme-subsys.h |  3 +++
>  hw/block/nvme.c        | 10 +++++++++-
>  5 files changed, 62 insertions(+), 6 deletions(-)
>=20
> diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
> index 62b25cf69bfa..9b493f2ead03 100644
> --- a/hw/block/nvme-ns.c
> +++ b/hw/block/nvme-ns.c
> @@ -63,6 +63,10 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **err=
p)
> =20
>      id_ns->npda =3D id_ns->npdg =3D npdg - 1;
> =20
> +    if (nvme_ns_shared(ns)) {
> +        id_ns->nmic |=3D NVME_NMIC_NS_SHARED;
> +    }
> +
>      return 0;
>  }
> =20
> @@ -365,16 +369,25 @@ static void nvme_ns_realize(DeviceState *dev, Error=
 **errp)
>          return;
>      }
> =20
> -    if (nvme_register_namespace(n, ns, errp)) {
> -        error_propagate_prepend(errp, local_err,
> -                                "could not register namespace: ");
> -        return;
> +    if (ns->subsys) {
> +        if (nvme_subsys_register_ns(ns, errp)) {
> +            error_propagate_prepend(errp, local_err,
> +                                    "could not setup namespace to subsys=
: ");
> +            return;
> +        }
> +    } else {
> +        if (nvme_register_namespace(n, ns, errp)) {
> +            error_propagate_prepend(errp, local_err,
> +                                    "could not register namespace: ");
> +            return;
> +        }
>      }
> -
>  }
> =20
>  static Property nvme_ns_props[] =3D {
>      DEFINE_BLOCK_PROPERTIES(NvmeNamespace, blkconf),
> +    DEFINE_PROP_LINK("subsys", NvmeNamespace, subsys, TYPE_NVME_SUBSYS,
> +                     NvmeSubsystem *),
>      DEFINE_PROP_UINT32("nsid", NvmeNamespace, params.nsid, 0),
>      DEFINE_PROP_UUID("uuid", NvmeNamespace, params.uuid),
>      DEFINE_PROP_BOOL("zoned", NvmeNamespace, params.zoned, false),
> diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
> index 293ac990e3f6..929e78861903 100644
> --- a/hw/block/nvme-ns.h
> +++ b/hw/block/nvme-ns.h
> @@ -47,6 +47,8 @@ typedef struct NvmeNamespace {
>      const uint32_t *iocs;
>      uint8_t      csi;
> =20
> +    NvmeSubsystem   *subsys;
> +
>      NvmeIdNsZoned   *id_ns_zoned;
>      NvmeZone        *zone_array;
>      QTAILQ_HEAD(, NvmeZone) exp_open_zones;
> @@ -77,6 +79,11 @@ static inline uint32_t nvme_nsid(NvmeNamespace *ns)
>      return -1;
>  }
> =20
> +static inline bool nvme_ns_shared(NvmeNamespace *ns)
> +{
> +    return !!ns->subsys;
> +}
> +
>  static inline NvmeLBAF *nvme_ns_lbaf(NvmeNamespace *ns)
>  {
>      NvmeIdNs *id_ns =3D &ns->id_ns;
> diff --git a/hw/block/nvme-subsys.c b/hw/block/nvme-subsys.c
> index e9d61c993c90..641de33e99fc 100644
> --- a/hw/block/nvme-subsys.c
> +++ b/hw/block/nvme-subsys.c
> @@ -43,6 +43,31 @@ int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **err=
p)
>      return cntlid;
>  }
> =20
> +int nvme_subsys_register_ns(NvmeNamespace *ns, Error **errp)
> +{
> +    NvmeSubsystem *subsys =3D ns->subsys;
> +    NvmeCtrl *n;
> +    int i;
> +
> +    if (subsys->namespaces[nvme_nsid(ns)]) {
> +        error_setg(errp, "namespace %d already registerd to subsy %s",

Small typo.

"registerEd to subsySTEM"

> +                   nvme_nsid(ns), subsys->parent_obj.id);
> +        return -1;
> +    }
> +
> +    subsys->namespaces[nvme_nsid(ns)] =3D ns;
> +
> +    for (i =3D 0; i < ARRAY_SIZE(subsys->ctrls); i++) {
> +        n =3D subsys->ctrls[i];
> +
> +        if (n && nvme_register_namespace(n, ns, errp)) {
> +            return -1;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
>  static void nvme_subsys_setup(NvmeSubsystem *subsys)
>  {
>      snprintf((char *)subsys->subnqn, sizeof(subsys->subnqn),
> diff --git a/hw/block/nvme-subsys.h b/hw/block/nvme-subsys.h
> index 4eba50d96a1d..ccf6a71398d3 100644
> --- a/hw/block/nvme-subsys.h
> +++ b/hw/block/nvme-subsys.h
> @@ -14,6 +14,7 @@
>      OBJECT_CHECK(NvmeSubsystem, (obj), TYPE_NVME_SUBSYS)
> =20
>  #define NVME_SUBSYS_MAX_CTRLS   32
> +#define NVME_SUBSYS_MAX_NAMESPACES  32
> =20
>  typedef struct NvmeCtrl NvmeCtrl;
>  typedef struct NvmeNamespace NvmeNamespace;
> @@ -22,8 +23,10 @@ typedef struct NvmeSubsystem {
>      uint8_t     subnqn[256];
> =20
>      NvmeCtrl    *ctrls[NVME_SUBSYS_MAX_CTRLS];
> +    NvmeNamespace *namespaces[NVME_SUBSYS_MAX_NAMESPACES];
>  } NvmeSubsystem;
> =20
>  int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp);
> +int nvme_subsys_register_ns(NvmeNamespace *ns, Error **errp);
> =20
>  #endif /* NVME_SUBSYS_H */
> diff --git a/hw/block/nvme.c b/hw/block/nvme.c
> index 7138389be4bd..8259dbf48ec0 100644
> --- a/hw/block/nvme.c
> +++ b/hw/block/nvme.c
> @@ -25,7 +25,8 @@
>   *              mdts=3D<N[optional]>,zoned.append_size_limit=3D<N[option=
al]>, \
>   *              subsys=3D<subsys_id> \
>   *      -device nvme-ns,drive=3D<drive_id>,bus=3D<bus_name>,nsid=3D<nsid=
>,\
> - *              zoned=3D<true|false[optional]>
> + *              zoned=3D<true|false[optional]>, \
> + *              subsys=3D<subsys_id>
>   *      -device nvme-subsys,id=3D<subsys_id>
>   *
>   * Note cmb_size_mb denotes size of CMB in MB. CMB is assumed to be at
> @@ -70,6 +71,13 @@
>   *   data size being in effect. By setting this property to 0, users can=
 make
>   *   ZASL to be equal to MDTS. This property only affects zoned namespac=
es.
>   *
> + * nvme namespace device parameters
> + * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> + * - `subsys`
> + *   NVM Subsystem device.  If given, this namespace will be attached to=
 all
> + *   controllers in the subsystem. Otherwise, `bus` must be given to att=
ach
> + *   this namespace to a specified single controller as a non-shared nam=
espace.
> + *
>   * Setting `zoned` to true selects Zoned Command Set at the namespace.
>   * In this case, the following namespace properties are available to con=
figure
>   * zoned operation:
> --=20
> 2.17.1
>=20

--vQDhIovfcDPvuO0p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAPIaYACgkQTeGvMW1P
DenOJAf/XcFmLZDsbem5wykad+kWZfc7VynE0yi4Z/HvsOQZ3iUX+UJCHxOmDLsq
zP/BFZAdVc2Y/dUMmTZfUM3imtpcLzJzTsZbl3DZPRvjojZoSr7Am/qzGnHGxjzC
fQPmxT6G6x77nejnr4JUx5w7GgeiZzaTgIHXrjZqyGVxrTKbNjNovsGgNCRCSHZ8
PFrGWtA+15IqY7zFK/Cr9UufSO/TI9UVJnHFWhOHWGU3u6Wa6kvHnyFxPUcZjhja
XthjvsUYsW62ZE3w+3mefH/07ygFzeIHbFU3B3+WBUsnbyDulafvRaheJbpL0wG9
TQguK7yQCjtwJV7tM77Py2JHKU27ww==
=IzP+
-----END PGP SIGNATURE-----

--vQDhIovfcDPvuO0p--

