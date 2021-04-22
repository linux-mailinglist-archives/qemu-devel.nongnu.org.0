Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13724367A39
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 08:53:53 +0200 (CEST)
Received: from localhost ([::1]:43740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZTDj-0002fy-O4
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 02:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lZT9Q-0001lX-QO; Thu, 22 Apr 2021 02:49:24 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:47699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lZT9L-0004W3-Fr; Thu, 22 Apr 2021 02:49:24 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 3529710D7;
 Thu, 22 Apr 2021 02:49:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 22 Apr 2021 02:49:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=RlmafCB58llJXZllxQJO/2F3d0s
 CYL+G+A2yVhVo0s0=; b=jjVJRRvuX6XqR/L5Epuh2dpUpAMAUQIzdKdeKjiu+TK
 060q3Jcjk3u/cwGIe/gK9KXKt4MNBZzr/uFP6rMVGfRoFXFh9jlLCHfeUXsT2+Rg
 cooURvGL668Zsn2p/57Ah5Xa3JGOk68D5KfYzlMf6F4BAvfJKU7hvEouYHMVaV0p
 Y+A6LCweN4s+Ep/mKXEjgB8ngVXMg6FRXUQsBoD7TE0ideb8TegJZySmC/ktOk4L
 6Af1GWsgHp2DSI5JJhVtgm00nLYnOMkpNGouc/pfYmrTqdMsWr3bJfJAaAf3N6vL
 GzNsOjIbnKvKBt+4W27sL0RmlR9mKJ/R8JVMC0uwP7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=RlmafC
 B58llJXZllxQJO/2F3d0sCYL+G+A2yVhVo0s0=; b=k67VkklA2Tk1N0yO39RL1j
 FScOa6NZvVqvlqy3PCk2n7OewA/43/Uq0oQiVhk/uBAdDlLB7QrKeVGxaaMtF81c
 sa6aMY7MFdFK/7fAoWvahO7As78mX9ZnlqlzJh6qqhYHihgyLB/MU6U03jAgLmTk
 UDGUK6RLeSP3GZXDViwVbJAswm+YsyleaE/hNWCDPAXE7y3/pmtrqDxvU2+/abZx
 /kuzbX/rlZgPZe4Jjrc2xe4Uv+IvXMcd4mAhFOyzo9qmCPpqxpkdNoZKSMNEjWjQ
 h5yIK8LJuN/dy1reXjj2cBx1jN1MVfp6NeQY2a2M/4AChE5xeK8ge7lWk7kSImqw
 ==
X-ME-Sender: <xms:aByBYLZmTSwjYZoXlMca4vp2tZqUr72cUBikkhlmk-gZeI7WKWDWzw>
 <xme:aByBYKZb-jKa8tSuwoWBhS2jzXjxAQ7FpC2V9AMUbjDKcGswKHfyC__gvlqkzDniq
 l15nebbo3AevwmfidA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtledgudduudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgeduffeuieetkeeileekvdeule
 etveejudeileduffefjeegfffhuddvudffkeenucfkphepkedtrdduieejrdelkedrudel
 tdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:aByBYN-BWAvY-sT2Fz_AzCM90DcNAWKMCS0EY3s5FerlgkFalSLDOw>
 <xmx:aByBYBoS1bk93yQJxo3Exo2WnhSdHpCtA7uKGcWFSw2jGw9sT40O7w>
 <xmx:aByBYGrVNwbP62xhL9q0gy_o-8WFFJbHtLIT18EkvTAluwp5iKG01w>
 <xmx:aRyBYHflWVDadoZ0SlwYYviJG1rlBmhIEIuQvdR8YquG6PWMMOdVZA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 694C31080067;
 Thu, 22 Apr 2021 02:49:11 -0400 (EDT)
Date: Thu, 22 Apr 2021 08:49:09 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Subject: Re: [PATCH 2/3] hw/block/nvme: add id ns flbas enum
Message-ID: <YIEcZXX5M8MTZwxy@apples.localdomain>
References: <CGME20210421125941epcas5p175aede7ce4b56ac001693172e58dded4@epcas5p1.samsung.com>
 <20210421125646.13058-1-anaidu.gollu@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+4qEaRzUHOncMsgx"
Content-Disposition: inline
In-Reply-To: <20210421125646.13058-1-anaidu.gollu@samsung.com>
Received-SPF: pass client-ip=64.147.123.20; envelope-from=its@irrelevant.dk;
 helo=wout4-smtp.messagingengine.com
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


--+4qEaRzUHOncMsgx
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 21 18:26, Gollu Appalanaidu wrote:
>Add the Identify Namespace FLBAS related enums and remove
>NVME_ID_NS_FLBAS_EXTENDEND macro its being used in only
>one place and converted into enum.
>
>Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>---
> hw/block/nvme-ns.c   | 2 +-
> hw/block/nvme-ns.h   | 2 +-
> include/block/nvme.h | 5 ++++-
> 3 files changed, 6 insertions(+), 3 deletions(-)
>
>diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
>index ae56142fcd..9065a7ae99 100644
>--- a/hw/block/nvme-ns.c
>+++ b/hw/block/nvme-ns.c
>@@ -88,7 +88,7 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
>     id_ns->mc =3D 0x3;
>
>     if (ms && ns->params.mset) {
>-        id_ns->flbas |=3D 0x10;
>+        id_ns->flbas |=3D NVME_ID_NS_FLBAS_EXTENDEND;
>     }
>
>     id_ns->dpc =3D 0x1f;
>diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
>index fb0a41f912..5aa36cd1d2 100644
>--- a/hw/block/nvme-ns.h
>+++ b/hw/block/nvme-ns.h
>@@ -134,7 +134,7 @@ static inline size_t nvme_m2b(NvmeNamespace *ns, uint6=
4_t lba)
>
> static inline bool nvme_ns_ext(NvmeNamespace *ns)
> {
>-    return !!NVME_ID_NS_FLBAS_EXTENDED(ns->id_ns.flbas);
>+    return ns->id_ns.flbas & NVME_ID_NS_FLBAS_EXTENDEND;
> }
>
> /* calculate the number of LBAs that the namespace can accomodate */
>diff --git a/include/block/nvme.h b/include/block/nvme.h
>index 4ac926fbc6..1d61030756 100644
>--- a/include/block/nvme.h
>+++ b/include/block/nvme.h
>@@ -1321,7 +1321,6 @@ typedef struct QEMU_PACKED NvmeIdNsZoned {
>
> #define NVME_ID_NS_NSFEAT_THIN(nsfeat)      ((nsfeat & 0x1))
> #define NVME_ID_NS_NSFEAT_DULBE(nsfeat)     ((nsfeat >> 2) & 0x1)
>-#define NVME_ID_NS_FLBAS_EXTENDED(flbas)    ((flbas >> 4) & 0x1)
> #define NVME_ID_NS_FLBAS_INDEX(flbas)       ((flbas & 0xf))
> #define NVME_ID_NS_MC_SEPARATE(mc)          ((mc >> 1) & 0x1)
> #define NVME_ID_NS_MC_EXTENDED(mc)          ((mc & 0x1))
>@@ -1341,6 +1340,10 @@ enum NvmeIdNsDps {
>     NVME_ID_NS_DPS_FIRST_EIGHT =3D 8,
> };
>
>+enum NvmeIdNsFlbas {
>+    NVME_ID_NS_FLBAS_EXTENDEND  =3D 1 << 4,
>+};
>+
> #define NVME_ID_NS_DPS_TYPE(dps) (dps & NVME_ID_NS_DPS_TYPE_MASK)
>
> typedef struct NvmeDifTuple {
>--=20
>2.17.1
>
>

Apart from the misspelling of EXTENDED (I'll fix it up when applied):

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--+4qEaRzUHOncMsgx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmCBHGMACgkQTeGvMW1P
Den9swf+IaxqmU6gebAmDnth74fSq9pe/X8C/XLR+7E5KA1qXp33BY2g8D02KJ+P
YGK26Q6TUvmNbPjVYbO/8qmyY75xFbKOHX67nGSmXryGgn6JRmhtcol14izBih2z
/mavukbSXLZVPRxWk0/+HB8ZYxt4DtGIyqMo6x/dyptQkSMqyBlv7UNRvgWw1kUU
e0Su4TMZ0E56RpmL0vPXLSKui+6Re/1OoUj3cTXdD6/zFBw8fKAyKzjGqhrShikz
46BunrPsK4p33FCN2PX9X9FxA4OTAfNtw9uUHuFsDWfDPxnurR8mUn8AzVsHRg22
zczwm2WfQCFDJA8iwVpYq0XD6dwUFA==
=t7ym
-----END PGP SIGNATURE-----

--+4qEaRzUHOncMsgx--

