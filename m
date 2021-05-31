Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F061396915
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 22:45:15 +0200 (CEST)
Received: from localhost ([::1]:47358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnomg-0004c1-24
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 16:45:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lnohm-0002am-Ba; Mon, 31 May 2021 16:40:10 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:37313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lnohj-0003Jv-R7; Mon, 31 May 2021 16:40:10 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id E337019A5;
 Mon, 31 May 2021 16:40:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 31 May 2021 16:40:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=DgwQtzdJRZnJdq6NH/tqtgGYH/K
 B62pMVB2tc402eQc=; b=KpBp9bBWR/U2V06K274dLgA+4haM43n6Xdh6MVgkuz3
 17IDG+V7FTa7EuOjdQX47o9vU1fmMhciuesIC9XQHNvlHyJfuto57OHu5kymA81A
 ovpasG+v2pJd+c9yk9ux0oWeyHw9u1KBBGOrP9zSHsqNQaN4V6PynmcCJajEzkfB
 KzR52WI6hBb1H6W8A1ZvHWdq4EVOfNmF6g0DuXLR9OlP3FEWb6wjbRPwCf3Jo/7U
 xY9CZcS1WuDuABtjh8P9GwcVteVzoXUzjHnLS5rdqRK9Sx+5uTWq/g/8aj7H984B
 I1u8jJHEINZdGvymLpa9nSjQpqWIV6uYLQgpCu1VkVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=DgwQtz
 dJRZnJdq6NH/tqtgGYH/KB62pMVB2tc402eQc=; b=AN9qpD9m5k3Wcg2O4rK53d
 1jWdj//V5RYp7emrgLiJmVeVqmAqKOlxIqmz7X2ZLU9Yz/DSKt5U87a+r2YXLoB/
 nml9E2fa5vRWMKweZM82IPS0WBaeMrjtYGwkUwY+wqaZ1hjfxDPbSzmLNNjOvE9W
 XI6M1I/c949OqS01gZybLik+GnHkW8nNWmuF8I4N4b6DEL6Ygj/jumH8eMhc5w74
 vgK587LI7hnEHST7Y/XhHVEfw+6cj2C+Xa4WztJ9XSgu/6o4WyAzGiSjVKGGRSDJ
 TjwdpYGi0gx7LSaulvNIK+osTHILpo/qXZmbf1lMoGTMmdcQNJtppvDcZtsQLDXw
 ==
X-ME-Sender: <xms:okm1YC1SYZCEYdQeSW00kO9qTmbJeGgB2jXgMcbXIpmuUS2W0ehF5A>
 <xme:okm1YFGHtvi2qnixOuVlRwpRKqdE8DaHuGHBiqy489fP35zvoRKwNRBcbGCcJF8d-
 YrG_Ty-trWrYdKQ1QM>
X-ME-Received: <xmr:okm1YK67VtciPcM6AFQYusdNpp7fTnA15BJVGwQottko2hgdXYQJvLfHJ447xWTcbTxBh2ikEh7p_cwyU4efa29okkpYqgjAbXJ4f4VZg9hHlo4FTQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelfedgudehgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgeduffeuieetkeeileekvdeule
 etveejudeileduffefjeegfffhuddvudffkeenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:okm1YD2p18laiuvgjIBPJ_rTGZ4MeJYsPgdZAFSQAiApb2iu-TtnpA>
 <xmx:okm1YFGhX9lsgP1iGQHPZWfATs5QDgfKA1Kjq-zFHSCBVDit1hE7Rw>
 <xmx:okm1YM8ROe79_8m0dpSsaKqs51IS8oFxmimWBXe6cJ3INOcCwQzcxg>
 <xmx:pEm1YM2HhDZg7rzYr8gLWlvZa2wzxQXf1o2GjFS5feOvVPlxQxkARA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 May 2021 16:40:01 -0400 (EDT)
Date: Mon, 31 May 2021 22:39:59 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Subject: Re: [PATCH v2] hw/nvme/ctrl: fix csi field for cns 0x00 and 0x11
Message-ID: <YLVJn0TT6LoKTEHZ@apples.localdomain>
References: <CGME20210427063530epcas5p4c260382227175e68d29da6d10957ad95@epcas5p4.samsung.com>
 <20210427063052.31078-1-anaidu.gollu@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sQRJsANm00jjdLqa"
Content-Disposition: inline
In-Reply-To: <20210427063052.31078-1-anaidu.gollu@samsung.com>
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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


--sQRJsANm00jjdLqa
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr 27 12:00, Gollu Appalanaidu wrote:
>As per the TP 4056d Namespace types CNS 0x00 and CNS 0x11
>CSI field shouldn't use but it is being used for these two
>Identify command CNS values, fix that.
>
>Remove 'nvme_csi_has_nvm_support()' helper as suggested by
>Klaus we can safely assume NVM command set support for all
>namespaces.
>
>Suggested-by: Klaus Jensen <its@irrelevant.dk>
>Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>

LGTM.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

>---
>-v2: add sugggestions from Klaus
>We can Remove 'nvme_csi_has_nvm_support()' helper, we can
>assume NVM command set support for all namespaces.
>
> hw/nvme/ctrl.c | 14 ++------------
> 1 file changed, 2 insertions(+), 12 deletions(-)
>
>diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>index 2e7498a73e..7fcd699235 100644
>--- a/hw/nvme/ctrl.c
>+++ b/hw/nvme/ctrl.c
>@@ -4178,16 +4178,6 @@ static uint16_t nvme_rpt_empty_id_struct(NvmeCtrl *=
n, NvmeRequest *req)
>     return nvme_c2h(n, id, sizeof(id), req);
> }
>
>-static inline bool nvme_csi_has_nvm_support(NvmeNamespace *ns)
>-{
>-    switch (ns->csi) {
>-    case NVME_CSI_NVM:
>-    case NVME_CSI_ZONED:
>-        return true;
>-    }
>-    return false;
>-}
>-
> static uint16_t nvme_identify_ctrl(NvmeCtrl *n, NvmeRequest *req)
> {
>     trace_pci_nvme_identify_ctrl();
>@@ -4244,7 +4234,7 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRe=
quest *req, bool active)
>         }
>     }
>
>-    if (c->csi =3D=3D NVME_CSI_NVM && nvme_csi_has_nvm_support(ns)) {
>+    if (active || ns->csi =3D=3D NVME_CSI_NVM) {
>         return nvme_c2h(n, (uint8_t *)&ns->id_ns, sizeof(NvmeIdNs), req);
>     }
>
>@@ -4315,7 +4305,7 @@ static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, Nv=
meRequest *req,
>         }
>     }
>
>-    if (c->csi =3D=3D NVME_CSI_NVM && nvme_csi_has_nvm_support(ns)) {
>+    if (c->csi =3D=3D NVME_CSI_NVM) {
>         return nvme_rpt_empty_id_struct(n, req);
>     } else if (c->csi =3D=3D NVME_CSI_ZONED && ns->csi =3D=3D NVME_CSI_ZO=
NED) {
>         return nvme_c2h(n, (uint8_t *)ns->id_ns_zoned, sizeof(NvmeIdNsZon=
ed),
>--=20
>2.17.1
>

--sQRJsANm00jjdLqa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmC1SZ0ACgkQTeGvMW1P
DemssAgArPXybAqPEmKNp1u1FVDD7rPWVwn0KOeyKclI4wfP9EzVgW2n61xmwhur
JWN278TvSM+cUHwnSDwH4U2dKy3DTfy4zznYfsvSVTt9heKSrueA/95+NyVgem33
FcmEG0+hwyGtqxodAwsAlkTkRMf049eiPGEJLuGlPHnL0OIl3okvbFDFjnpiiu8N
eQzZFoQKxmCOro0Eu2HajlE0A58CTaSDd30nZqy6kVARQN/NEBw0Huv+0inTsGbX
/Vxhkq4c0TvxxY6PkQxETaNmwV4n98uFqPaUo348dYF8PCZLgRmsV/CoXP1rVjC1
L/ASI6mzLRrgC+d1G1ISEqfN7IQodw==
=uHqB
-----END PGP SIGNATURE-----

--sQRJsANm00jjdLqa--

