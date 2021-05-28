Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6529D3941BD
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 13:26:47 +0200 (CEST)
Received: from localhost ([::1]:46048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmada-0001T4-CD
	for lists+qemu-devel@lfdr.de; Fri, 28 May 2021 07:26:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lmaZk-0008If-GD; Fri, 28 May 2021 07:22:48 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:34041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lmaZi-0003Sk-0p; Fri, 28 May 2021 07:22:48 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 94D385C01DD;
 Fri, 28 May 2021 07:22:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 28 May 2021 07:22:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=kQNan27/FnmzzqRqUI3lgEnEQkL
 PtH+Nk2gRb4GmQ+g=; b=ku/CW1Fk4Dh8sSN4GEwXeLF7IMw+wUyfdDi+2aOcD//
 eJPqwPIx9r5hnmpWvpFzadrTsOzeuXCbTmQ5VLESHq1QxKOXyz4H5bVRHje2tlkm
 KZmN+q5ufeiCTr1rhtJ7eoOhGqyPmRn2tqO49HQMHNvVHjwcDbcXY+gcBEy3eouI
 YClJvy4ioO+J8r9Zp7nwSF7wzrUymQdkVZalcPOICaL1aUoCd1wLGpJLUUiqzLN2
 Ed4Cf9Oh5fgk17teVtTgO621qWAu7jlP+AsWShvlGy6iqCX5WInrNn+40hsMBiaD
 jSM4352fyntuKoh5NgnIzv4gG0JbyTP2gyz0+U877zA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=kQNan2
 7/FnmzzqRqUI3lgEnEQkLPtH+Nk2gRb4GmQ+g=; b=fbfXZr3VNdqLC3MeEaaCu0
 FbxRxYep5uUMWIjBuJugR9bysOTqLOPIfXQVClhhpEdW2M0OOSzZ5I0mEC/iuEnT
 8BDMmYL2SwN8Wjblp/o8VH8F/IuaJg4ijRbCDt3xKH54yoVvZuXjs5Sotq99m4cO
 kTD5LyBoZ47EE14+QBqKvRSHx21zEafnHY693j9SLvrCdkJO0chD6L3wkOWsWmWG
 /Xz75vngmeWINkzauwGk/S7YujtX8wFbk3fkDOxeSliS7WalW2YIWZaNhB0A+pxT
 HRitMemrpZnXLGW8rRde5IBOfPMcruCuh5gHgJ5XMinEEzWgivsioLqaj4efrDHA
 ==
X-ME-Sender: <xms:gdKwYK5llcN2lJfShah_i3F1jn5k2QtrjONAgduO9RGRlRJwV4qZDA>
 <xme:gdKwYD67VGjrVFYdmK_Bl6BCCGnN1vgY7bvu_QGkp0LpH2XO32rrExEGsnp2xfkPl
 sb721wPJwl2e24EB5o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekjedggedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:gdKwYJfF1eSlm5pKz4rMKr0MkbblEXvQZdzbiWrrACO6W3ODJ_u9Aw>
 <xmx:gdKwYHI3otws59P3JgO6Nwzcp5HqqCq5s13mvUKITGdvWeepsHqYOA>
 <xmx:gdKwYOLLPeSd-hlLmOxJYogRbYmkMJG2iOhl2M_SCPZ2SsYjDBIUWA>
 <xmx:gtKwYFWzDWD9ZZoPPG46u8WR0evxmFsxNLaMkSWT3x7RNLQQOis3Yw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Fri, 28 May 2021 07:22:40 -0400 (EDT)
Date: Fri, 28 May 2021 13:22:38 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Subject: Re: [PATCH] hw/nvme: add param to control auto zone transitioning to
 zone state closed
Message-ID: <YLDSfrUIPaZxk6VD@apples.localdomain>
References: <20210528110459.65387-1-Niklas.Cassel@wdc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="khK7Em7E4qR2hsQl"
Content-Disposition: inline
In-Reply-To: <20210528110459.65387-1-Niklas.Cassel@wdc.com>
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
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
Cc: "kbusch@kernel.org" <kbusch@kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--khK7Em7E4qR2hsQl
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On May 28 11:05, Niklas Cassel wrote:
>From: Niklas Cassel <niklas.cassel@wdc.com>
>
>In the Zoned Namespace Command Set Specification, chapter
>2.5.1 Managing resources
>
>"The controller may transition zones in the ZSIO:Implicitly Opened state
>to the ZSC:Closed state for resource management purposes."
>
>The word may in this sentence means that automatically transitioning
>an implicitly opened zone to closed is completely optional.
>
>Add a new parameter so that the user can control if this automatic
>transitioning should be performed or not.
>
>Being able to control this can help with verifying that e.g. a user-space
>program behaves properly even without this optional ZNS feature.
>
>The default value is set to true, in order to not change the existing
>behavior.
>
>Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
>---
> hw/nvme/ctrl.c | 9 ++++++++-
> hw/nvme/ns.c   | 2 ++
> hw/nvme/nvme.h | 1 +
> 3 files changed, 11 insertions(+), 1 deletion(-)
>
>diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>index 40a7efcea9..d00f0297a5 100644
>--- a/hw/nvme/ctrl.c
>+++ b/hw/nvme/ctrl.c
>@@ -141,6 +141,11 @@
>  *
>  *     zoned.cross_read=3D<enable RAZB, default: false>
>  *         Setting this property to true enables Read Across Zone Boundar=
ies.
>+ *
>+ *     zoned.auto_transition=3D<enable auto resource management, default:=
 true>
>+ *         Indicates if zones in zone state implicitly opened can be
>+ *         automatically transitioned to zone state closed for resource
>+ *         management purposes.
>  */
>
> #include "qemu/osdep.h"
>@@ -1699,7 +1704,9 @@ static uint16_t nvme_zrm_open_flags(NvmeNamespace *n=
s, NvmeZone *zone,
>         /* fallthrough */
>
>     case NVME_ZONE_STATE_CLOSED:
>-        nvme_zrm_auto_transition_zone(ns);
>+        if (ns->params.auto_transition_zones) {
>+            nvme_zrm_auto_transition_zone(ns);
>+        }
>         status =3D nvme_aor_check(ns, act, 1);
>         if (status) {
>             return status;
>diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
>index 3fec9c6273..31dee43d30 100644
>--- a/hw/nvme/ns.c
>+++ b/hw/nvme/ns.c
>@@ -531,6 +531,8 @@ static Property nvme_ns_props[] =3D {
>                        params.max_open_zones, 0),
>     DEFINE_PROP_UINT32("zoned.descr_ext_size", NvmeNamespace,
>                        params.zd_extension_size, 0),
>+    DEFINE_PROP_BOOL("zoned.auto_transition", NvmeNamespace,
>+                     params.auto_transition_zones, true),
>     DEFINE_PROP_END_OF_LIST(),
> };
>
>diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
>index 81a35cda14..bd86054db2 100644
>--- a/hw/nvme/nvme.h
>+++ b/hw/nvme/nvme.h
>@@ -100,6 +100,7 @@ typedef struct NvmeNamespaceParams {
>     uint32_t max_active_zones;
>     uint32_t max_open_zones;
>     uint32_t zd_extension_size;
>+    bool     auto_transition_zones;
> } NvmeNamespaceParams;
>
> typedef struct NvmeNamespace {
>--=20
>2.31.1
>

Looks good Niklas!

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--khK7Em7E4qR2hsQl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmCw0nsACgkQTeGvMW1P
DemfWQf/QL7mErgPDtwzfl+RfdsVpVpvOsHTt8glsbm8ZBhNWezyLe2P53UvpNqK
raFSxCRKPDItZqO2HnUKjunK3Cow5lWvk/AmWxP0Rqj1FwIPcPxEalLfNk2NCY4H
8Yp+zx1bcnvjjI4X4c8hBiDAZWv5Mr1hwyLJI4kWIefSnEMxRxdD8Mku2UtRwQjh
nUWQ/uwFbIEvK1WV9HjVmEeMvJIjvQzBO1oVUahsAwaiyypmyvLOGiV/Y/qiuNFt
r37afKampKhvP1OdG+AbvDjefUi0BO1gwgnXtAzrp9QisCP5kMQWcsHp44u0iqsT
rBYUEl/fLy/RlWn/vNE4C6O8eSReHw==
=duH8
-----END PGP SIGNATURE-----

--khK7Em7E4qR2hsQl--

