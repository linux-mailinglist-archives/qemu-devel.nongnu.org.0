Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8ED3887F9
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 09:10:40 +0200 (CEST)
Received: from localhost ([::1]:59574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljGLn-0001Oa-EJ
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 03:10:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ljGGy-00082E-Jz; Wed, 19 May 2021 03:05:40 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:55097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1ljGGw-0005dn-9U; Wed, 19 May 2021 03:05:40 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 27975162E;
 Wed, 19 May 2021 03:05:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 19 May 2021 03:05:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=MRG0Lcr7931zdd9NFcF3u+P0rdW
 C1dwHdM78HCJpSN0=; b=KE3y3jfOMaHj/X5Rr0rrJvMEat58+Mh/fab5msrr+k5
 4O85qKwVOGbthehg2TEYTYHq7+XA9Mt7tpbqZbI1MJVpRbQBam1V5jOifC/L1iU5
 uyZvww8K/PuCB2eUdqXTc+6l0B1T1sD7Jow4JM/l9UiXRArUf4iSgwzIa6R7Rq/a
 qf6KgZQfqDD/9NXY/SAdUyYpbTdiDbuTSdPYDwycp+aNS/Kxt0Vgox5VZ8Gl3IpO
 aymn0ZSo2GxxD/17kcXL4zgk9qxiOpuxW2oZojtLTI5NlJRYla3d/yegRlk3HtEn
 dElqYvRv70zghdCekt2cg4aMowv5NeztAtpgPEAuIXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=MRG0Lc
 r7931zdd9NFcF3u+P0rdWC1dwHdM78HCJpSN0=; b=H+1ZlV4PC1AVCbJh/rMvPp
 mBMPgU1iHivjIFjflDtBA9vCq5kPDW9BsYFus+ZF+hV23u2oLEe+zTisKxyT1Uad
 QCiw/ElXaiBHE2g0/hTsLD2c0WlSTV2PlI0urdDf0O+RlyCAzZq/RQkPbP/m1q8J
 ek4wn9412BXo64Em3hmr545X4IHpC4+Vr/LBRsdy5sTyuGfLU+2Tj8OMwFlZmZP1
 qTna+fHSCaQOYIh7tvA5Z0tW46ORs6gKm/3wWwIFUVYBN4BJqM0SrMRmmaUyuMu3
 DpkI+vrFBWvZK9ErIBf2JjTBY3zRtGM4tdyY+8+5bKDyCaFd1XA1RsGvh5DGrYDQ
 ==
X-ME-Sender: <xms:vLikYKlFS-OPgwIImOjqOWzx9jcVZ18i5J1L8FGQ6GWXUy4HANPIaA>
 <xme:vLikYB2bZHXE8EQuYeVP_GmgNPrrmHDRJF8uetr45ZQR3JQ3QPbYf1KWZV9BpFlp9
 6YuTvMR5bOfcR6GhTw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeikedgudduvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgeduffeuieetkeeileekvdeule
 etveejudeileduffefjeegfffhuddvudffkeenucfkphepkedtrdduieejrdelkedrudel
 tdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:vLikYIpxTnv6ycCU1am5DVAxfjsWzFzBpidjc120uHe-SgXBT7OYWA>
 <xmx:vLikYOm_g5ZOPv0Qj_3eeamyrd9RxOTaJrYW6oY-glRfb4ykYPaq2A>
 <xmx:vLikYI3Qk6nSdv-ViS5lq2456caq9z3sRSPa924fWWrypIUs8PBNSA>
 <xmx:vbikYCpnqejQkhqy6de_iderGQa5vlSOQIcFwFz1PLz9lmJeQ6I7Rw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Wed, 19 May 2021 03:05:31 -0400 (EDT)
Date: Wed, 19 May 2021 09:05:29 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Subject: Re: [PATCH 3/3] hw/block/nvme: add id ns metadata cap (mc) enum
Message-ID: <YKS4uYJPbZwqTsUe@apples.localdomain>
References: <CGME20210421130551epcas5p4b62b0625aee2fa4efc07a78f33751aa0@epcas5p4.samsung.com>
 <20210421130229.13806-1-anaidu.gollu@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="I9NPU8r1kZCcZJzt"
Content-Disposition: inline
In-Reply-To: <20210421130229.13806-1-anaidu.gollu@samsung.com>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com,
 kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--I9NPU8r1kZCcZJzt
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 21 18:32, Gollu Appalanaidu wrote:
>Add Idnetify Namespace Metadata Capablities (MC) enum.
>
>Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>---
> hw/block/nvme-ns.c   | 2 +-
> include/block/nvme.h | 5 +++++
> 2 files changed, 6 insertions(+), 1 deletion(-)
>
>diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
>index 9065a7ae99..db75302136 100644
>--- a/hw/block/nvme-ns.c
>+++ b/hw/block/nvme-ns.c
>@@ -85,7 +85,7 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
>     ds =3D 31 - clz32(ns->blkconf.logical_block_size);
>     ms =3D ns->params.ms;
>
>-    id_ns->mc =3D 0x3;
>+    id_ns->mc =3D NVME_ID_NS_MC_EXTENDED | NVME_ID_NS_MC_SEPARATE;
>
>     if (ms && ns->params.mset) {
>         id_ns->flbas |=3D NVME_ID_NS_FLBAS_EXTENDEND;
>diff --git a/include/block/nvme.h b/include/block/nvme.h
>index 1d61030756..a3b610ba86 100644
>--- a/include/block/nvme.h
>+++ b/include/block/nvme.h
>@@ -1344,6 +1344,11 @@ enum NvmeIdNsFlbas {
>     NVME_ID_NS_FLBAS_EXTENDEND  =3D 1 << 4,
> };
>
>+enum NvmeIdNsMc {
>+    NVME_ID_NS_MC_EXTENDED      =3D 1 << 0,
>+    NVME_ID_NS_MC_SEPARATE      =3D 1 << 1,
>+};
>+
> #define NVME_ID_NS_DPS_TYPE(dps) (dps & NVME_ID_NS_DPS_TYPE_MASK)
>
> typedef struct NvmeDifTuple {
>--=20
>2.17.1
>

So, initially I wondered why the compiler didnt complain about the=20
`NVME_ID_NS_MC_EXTENDED` and `NVME_ID_NS_MC_SEPARATE` "names" being=20
defined twice. A smart colleague was quick to point out that because the
`NVME_ID_NS_MC_EXTENDED(mc)` function-like macro is expanded in the=20
preprocessing step, it doesn't exist when we compile so there really is=20
no potential clash.

I wonder now if it is bad form to keep the function-like macro=20
"accessor" there as well as the enum for the value. Does anyone have any=20
opinion on this? In other words, would it be bad or confusing to do=20
something like this?

    enum NvmeIdNsMc {
      NVME_ID_NS_MC_EXTENDED =3D 1 << 0,
    };

    #define NVME_ID_NS_MC_EXTENDED(mc) ((mc) & NVME_ID_NS_MC_EXTENDED)

--I9NPU8r1kZCcZJzt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmCkuLQACgkQTeGvMW1P
DekTpwf+PoG0JeFWGPxUgZlMIcWDOWNwzK4L6N5OcBiap9q+pVPLdFJanaN5e9Ww
+aC5jGWcmfl8cy2lLUQ9YrjMmRtyWuzYtNAhhZuFSOLKPiiywRPDn5yeApl+/iEF
9FflYqkn/Bk9dM+KyleeK7Bd8sDIazJvFEsDaREU6kZcPjZxJJOrifjlllo8UiB4
yNeWz2qAkJBar7nS61awpILmxI1UmjNMGV6qx8n/BaS2Xa6+krqqarwuHKCzYTOh
1p4eQuO5B4dPHDccmuQOrwfufgRyrX2WnOVfrMHEZlpmiyAQOKVpWnyrocn4rIHl
0ni9Sv1L5o9sIB4K/4aVNKMtrPIXVA==
=aq/U
-----END PGP SIGNATURE-----

--I9NPU8r1kZCcZJzt--

