Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7195E374F9B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 08:49:17 +0200 (CEST)
Received: from localhost ([::1]:52964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leXoy-0006hC-EE
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 02:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1leXk0-00050X-Al; Thu, 06 May 2021 02:44:08 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:36163)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1leXjW-0004Wm-Sc; Thu, 06 May 2021 02:44:08 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 442355806F0;
 Thu,  6 May 2021 02:43:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 06 May 2021 02:43:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=ISqxhalCJNAhWudMQu7l2nvG14N
 suZFc5y6+PFPdYbU=; b=L/V6Nh4km61ZIKjJCkDh4v03ddVJrCYkGw0N7j8SyQS
 1+CJumKrVfYroOlJeFB27nrGifuEBPlXFDFsF1NanwO2MQJqeAARTgYc2DndQ0Fb
 a1T+GyBL5kmFGQL9R18maam7DsU/W0orGnWSa22XSXyMxTQoubB5tGBf25fZeIIp
 HpSYv3Is7V1OCjRMwrMUaNqG3VRBmQxpxbErYe2aGwA7ncxjzkzRnbmxQeX4DcwX
 sZAKgKUj7q38jZjQXqDV//8JTaGEaaQQzlHRqVDuc9Oon+smO8wgQgs7PyHA+TzQ
 cbDn7j0y2nUt/cacNYbEVlcis3up6a0ohJGR1ys20cQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ISqxha
 lCJNAhWudMQu7l2nvG14NsuZFc5y6+PFPdYbU=; b=je/kpxsWLEoxFisA2woPAg
 3l6mhhwbSR5YNx1cbs797B2A9w0krr8gGEU1dc7zb1F+OPrHJ8fdgAh6B3Yr+YJY
 qQUWRiohFW4GW9F4r5YRpxSgoWMMI9kkaf5L++FcK9eHu/UHfKIS38K13c6rUyg/
 8xXfuTmk6bbfvIRoC/Fo/oK+GddAKAUWIgYiFyauqiuXmg7JkXThM3E5BKsURo+g
 +hdXGwJGcO25Ww6ScgNxk+KJr800xmi3VJA1+Nrr0yoBgXurzBoG9oqkDOQ4EFmk
 RbC2tiBFmJYoak6Z8Sm0bu9McpI+nxP/il6O92w0kCk/xGnd/gLavh9c+2FxOkiA
 ==
X-ME-Sender: <xms:GJCTYN18vmAXMv592xTJFY-PRR-Pe9AVxRmZgzLiEG2rUNlnk5NkeA>
 <xme:GJCTYEHU-161vyau78XM1p-NRq_y-kYQcSt3Nhqrc-VmG3NVEJK9PRd9vPhD5tEdC
 BWSYwaO4RX7ne7eS4o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdefledguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:GJCTYN4dOLOiR_KipZnQK4AeJb0sIiDiKF5JrDd5mZaYmfhi2ytThA>
 <xmx:GJCTYK2XRQtjTsz6zO1XFyVKyRW72iHHA-lE7zDpSSuKihFpRINzyg>
 <xmx:GJCTYAHHpmjl-8Vpgn1xHARiNYAxzfb__1qMJZ5g9ltlxyRgEPOXnA>
 <xmx:GZCTYI8bwfwtxvm-_9oujnfnhYUT28S3kiNr8E5TBpozmO0mRplzwA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu,  6 May 2021 02:43:34 -0400 (EDT)
Date: Thu, 6 May 2021 08:43:32 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 08/23] hw/block/nvme: Avoid dynamic stack allocation
Message-ID: <YJOQFNakgY4wS3AQ@apples.localdomain>
References: <20210505211047.1496765-1-philmd@redhat.com>
 <20210505211047.1496765-9-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SyiZCgzEHxvJk9A2"
Content-Disposition: inline
In-Reply-To: <20210505211047.1496765-9-philmd@redhat.com>
Received-SPF: pass client-ip=66.111.4.224; envelope-from=its@irrelevant.dk;
 helo=new2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Keith Busch <kbusch@kernel.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--SyiZCgzEHxvJk9A2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On May  5 23:10, Philippe Mathieu-Daud=C3=A9 wrote:
>Use autofree heap allocation instead of variable-length
>array on the stack.
>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>---
> hw/block/nvme.c | 15 ++++++++-------
> 1 file changed, 8 insertions(+), 7 deletions(-)
>
>diff --git a/hw/block/nvme.c b/hw/block/nvme.c
>index 2f6d4925826..905c4bb57af 100644
>--- a/hw/block/nvme.c
>+++ b/hw/block/nvme.c
>@@ -652,7 +652,7 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, NvmeSg *sg, =
uint64_t prp1,
>     len -=3D trans_len;
>     if (len) {
>         if (len > n->page_size) {
>-            uint64_t prp_list[n->max_prp_ents];
>+            g_autofree uint64_t *prp_list =3D NULL;
>             uint32_t nents, prp_trans;
>             int i =3D 0;
>
>@@ -662,8 +662,10 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, NvmeSg *sg,=
 uint64_t prp1,
>              * that offset.
>              */
>             nents =3D (n->page_size - (prp2 & (n->page_size - 1))) >> 3;
>-            prp_trans =3D MIN(n->max_prp_ents, nents) * sizeof(uint64_t);
>-            ret =3D nvme_addr_read(n, prp2, (void *)prp_list, prp_trans);
>+            prp_trans =3D MIN(n->max_prp_ents, nents);
>+            prp_list =3D g_new(uint64_t, prp_trans);
>+            ret =3D nvme_addr_read(n, prp2, (void *)prp_list,
>+                                 prp_trans * sizeof(uint64_t));

prp_trans determines how much we must transfer, not the size of the=20
prp_list. Subsequent PRP lists may contain more than nents PRPs, so this=20
may now go out of bounds.

Just do the allocation when prp_list is declared:

     g_autofree uint64_t *prp_list =3D g_new(uint64_t, n->max_prp_ents);

>             if (ret) {
>                 trace_pci_nvme_err_addr_read(prp2);
>                 status =3D NVME_DATA_TRAS_ERROR;
>@@ -682,9 +684,8 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, NvmeSg *sg, =
uint64_t prp1,
>                     i =3D 0;
>                     nents =3D (len + n->page_size - 1) >> n->page_bits;
>                     nents =3D MIN(nents, n->max_prp_ents);
>-                    prp_trans =3D nents * sizeof(uint64_t);
>                     ret =3D nvme_addr_read(n, prp_ent, (void *)prp_list,
>-                                         prp_trans);
>+                                         nents * sizeof(uint64_t));
>                     if (ret) {
>                         trace_pci_nvme_err_addr_read(prp_ent);
>                         status =3D NVME_DATA_TRAS_ERROR;
>@@ -2510,10 +2511,10 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest =
*req)
>     if (attr & NVME_DSMGMT_AD) {
>         int64_t offset;
>         size_t len;
>-        NvmeDsmRange range[nr];
>+        g_autofree NvmeDsmRange *range =3D g_new(NvmeDsmRange, nr);
>         uintptr_t *discards =3D (uintptr_t *)&req->opaque;
>
>-        status =3D nvme_h2c(n, (uint8_t *)range, sizeof(range), req);
>+        status =3D nvme_h2c(n, (uint8_t *)range, sizeof(*range) * nr, req=
);
>         if (status) {
>             return status;
>         }

DSM change LGTM.

--SyiZCgzEHxvJk9A2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmCTkBMACgkQTeGvMW1P
DenT4AgAmxgTSqbZLJWT4WxdDQiIPwdybEWilSJR489FWgCowcIkZNsjYmbXUyo5
jIJxaJ1RziR/mp6xbbEtFtIpm/aFb0B2EbwQUEAAFeYV5WoD/LFwqliXyaWRNYEI
Q/gVpWu7OEiV+LWAhundPq0cz/jHK7aa97XJZAUGUO2K5/62i23jVjYG2pVgfTxZ
vefT453OD/wg9KjRm6NRXVSGTK1wwIGIcLyMBjjnYDe6VGgsZyWLfcTJ9rJk7ExN
USqi7tfLDRat6UWrkxqu0DJRW29ZHzgK2YDmOTOtANnkX+Yu2WISRqESNBHVhWMU
gCyON9GR+S7gMMdZFzOzS4i6GNCBww==
=sAYK
-----END PGP SIGNATURE-----

--SyiZCgzEHxvJk9A2--

