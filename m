Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FC7396927
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 22:57:50 +0200 (CEST)
Received: from localhost ([::1]:54516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnoyr-0001ZQ-HS
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 16:57:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lnouw-0006zA-Cm; Mon, 31 May 2021 16:53:48 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:56765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lnouu-0003aD-Nz; Mon, 31 May 2021 16:53:46 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 4DB9519BA;
 Mon, 31 May 2021 16:53:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 31 May 2021 16:53:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=T8UUI5k1zWC+31XT8cTH8Dl5Dvu
 DIx8kC3BVvGk6ZbA=; b=X/ype5wB7W1KgMlgyN+5zOVdRa1lJjEkI1Y2/1yR3mx
 4GDyhPLXq1ezJJH8Sm33JTSjFO8RjgJy5xwTgse8VO2fIL4TH8+RI1fw67jT6Waf
 PQz25Rrj+2AaAXSt9tIv99NynBGaskdzEXjT+UWktmFAR5HbF1XyQO009pASByHB
 eDke7v6wx/GsHA8cmT7mcQ8q8IxPxAV3Vtcc81y9yL/Nq0EwTdWSpwoC9sI4inmj
 9fAG1jQZJcK4mobmB2W8Rkm8vAAeDjcLvhBi3/v7cBBFlGAxMBmzyJ0OtfhdalcO
 bSo5FCdg5uo/e1fyscAJK5qx0DSU5RSLWsCnCj5c6lg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=T8UUI5
 k1zWC+31XT8cTH8Dl5DvuDIx8kC3BVvGk6ZbA=; b=PSXYm3EJeGS2ymvH1iTA8Q
 6Na4kYy0HDWzWgG6hOxz4HTNl1nufctOVwpz1ux7LsBsj0ObXD554dWrnLxy4U1l
 f1FcxVwsaqBX5q00E1wog7hTU2Ae9WtkBe8TSg/qF6z479BA1doPIirvvU6np4d/
 i4shLZS6nGosz15SRq+hJ5+PxunfUlvEAq89g9T9xD43BcROAizsa05BONsOzBJp
 6nb3KgNUNE+hUcLn5+XYUlXR3qWh+PdCa3l2h4jp6AABwZvPqDW/y4IBCAblj/xa
 b0CtpRB0oRGHKyd7tTrSWzmTLog6K8JEh/1NMJP9aV19aob6wKdA3Kx2AjTIy5nA
 ==
X-ME-Sender: <xms:1Uy1YCRvX3-6AilbX6LZcbwrcCcbJ-bBeFM7VEdUSlQODwj7wJwLjg>
 <xme:1Uy1YHzGou5phGD3G3GseBOQ0kkqHUN_rN2qhybNRFLIEIDOTBte3IoLQgLSOp0DI
 AeDEytj5XJsG6JYyl0>
X-ME-Received: <xmr:1Uy1YP1CUlOvYoKypCwPb9pskKfPBYyZKvranObGIIhXuVdB_Qk9A00bMnTKs06oVVnzutGoIodi1UbecbZqoiIEH7_1s1S2uFPCpSizhhZJHJNxJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelfedgudehhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgeduffeuieetkeeileekvdeule
 etveejudeileduffefjeegfffhuddvudffkeenucevlhhushhtvghrufhiiigvpedunecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:1Uy1YOA_Vc4X8h2PVC1fN8-zb9Mg8oPsWbvxkVyI3W4DOw8hIzFiOA>
 <xmx:1Uy1YLg2c9AqUZxrM9iGxsyohDRRtYo0oSbY-Ag9UIw-CLSn9Mk7-g>
 <xmx:1Uy1YKo4vsbQ0DlKHhVMw0VUGTkSembvx7VUoS3hUk8NdVf1vi0-Hg>
 <xmx:1Uy1YLjnej-b_Igay7wCh68QQ8Zr-7OG27a__WxFE9L4pQOKSIxdjQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 May 2021 16:53:40 -0400 (EDT)
Date: Mon, 31 May 2021 22:53:39 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Subject: Re: [PATCH 2/3] hw/nvme/ctrl: fix endian conversion for nsid in ctrl
 list
Message-ID: <YLVM0wzZvZpaL7OK@apples.localdomain>
References: <20210517100736.17063-1-anaidu.gollu@samsung.com>
 <CGME20210517101212epcas5p356060d787b2a70309436bf3ecdf1e17c@epcas5p3.samsung.com>
 <20210517100736.17063-3-anaidu.gollu@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xajDCdTSxhVpSwQ8"
Content-Disposition: inline
In-Reply-To: <20210517100736.17063-3-anaidu.gollu@samsung.com>
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


--xajDCdTSxhVpSwQ8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On May 17 15:37, Gollu Appalanaidu wrote:
>In Identify Ctrl List of the CNS 0x12 and 0x13 no endian conversion
>for the nsid field.
>
>Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>---
> hw/nvme/ctrl.c | 7 ++++---
> 1 file changed, 4 insertions(+), 3 deletions(-)
>
>diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>index d08a3350e2..813a72c655 100644
>--- a/hw/nvme/ctrl.c
>+++ b/hw/nvme/ctrl.c
>@@ -4255,6 +4255,7 @@ static uint16_t nvme_identify_ctrl_list(NvmeCtrl *n,=
 NvmeRequest *req,
>                                         bool attached)
> {
>     NvmeIdentify *c =3D (NvmeIdentify *)&req->cmd;
>+    uint32_t nsid =3D le32_to_cpu(c->nsid);
>     uint16_t min_id =3D le16_to_cpu(c->ctrlid);
>     uint16_t list[NVME_CONTROLLER_LIST_SIZE] =3D {};
>     uint16_t *ids =3D &list[1];
>@@ -4265,11 +4266,11 @@ static uint16_t nvme_identify_ctrl_list(NvmeCtrl *=
n, NvmeRequest *req,
>     trace_pci_nvme_identify_ctrl_list(c->cns, min_id);
>
>     if (attached) {
>-        if (c->nsid =3D=3D NVME_NSID_BROADCAST) {
>+        if (nsid =3D=3D NVME_NSID_BROADCAST) {
>             return NVME_INVALID_FIELD | NVME_DNR;
>         }
>
>-        ns =3D nvme_subsys_ns(n->subsys, c->nsid);
>+        ns =3D nvme_subsys_ns(n->subsys, nsid);
>         if (!ns) {
>             return NVME_INVALID_FIELD | NVME_DNR;
>         }
>@@ -4281,7 +4282,7 @@ static uint16_t nvme_identify_ctrl_list(NvmeCtrl *n,=
 NvmeRequest *req,
>             continue;
>         }
>
>-        if (attached && !nvme_ns(ctrl, c->nsid)) {
>+        if (attached && !nvme_ns(ctrl, nsid)) {
>             continue;
>         }
>
>--=20
>2.17.1
>

I know that the endianness conversion was missing before your patch, but=20
please squash this up into patch 1.

--xajDCdTSxhVpSwQ8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmC1TNEACgkQTeGvMW1P
DemobQgAw5gkjbiJxkaTlnRrCcKeelbh3ZJFfJ/JtU9czVRoUaHt5oBO6QsBkhvo
Yo+9i5XhOJBNFMac7ivHA/+pWDDkBEfkE2Gm58Mi3pp1dqLLPrIrJO7oc0C3D8ng
zLUeOJUE5dzZzWYf0+3fpE/+hM+w30EYC2KoeGxzXSgZyakaxVijAZNn6lauY3cM
Y2h0jsnJmZP0Denxa2+WusepnbCSQetHfA1JH+yEpSBjPnJOALN/xKwJiJjuRE+C
Cu7ucqa6PepaGwG6qJIkri9ri8IoIqGY79KWLUne/jc4ckrepCE0K5YMFlspD0b/
MjGFDG0id8FA904kG5Xa9buEx6qFqA==
=Cki1
-----END PGP SIGNATURE-----

--xajDCdTSxhVpSwQ8--

