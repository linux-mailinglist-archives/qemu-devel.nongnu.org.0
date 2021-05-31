Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E46396926
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 22:57:07 +0200 (CEST)
Received: from localhost ([::1]:53758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnoyA-0000xf-Ch
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 16:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lnou5-0006ZI-R9; Mon, 31 May 2021 16:52:53 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:41727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lnou3-00032O-RA; Mon, 31 May 2021 16:52:53 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 1656919A5;
 Mon, 31 May 2021 16:52:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 31 May 2021 16:52:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=Xsg5BmmCZ47yke2CVFVVlCpeggj
 cDjdh/1VX18joHTY=; b=K69hA9alCb19u47WgpOU+aF6rixCOtJLKdmy/xI9rHG
 +jdWKDd4aErHvoHZ9iDxrEPFe1XDmhGp45Mt8R6A25LOhVnq0JvKCcsQAFwpKNvw
 fgfh9EsiVgk+d9pYPhriZ4qVYXLZ2H98zt2H4+sjLDARR5ozGmZBFXsYueyVyei0
 EGVVqL7035tfoEtimCr+ii+nUVjdCxrmU3VuYEAT/E7Xw1u7P/by0RiCeNdVEjQP
 1iqGrwgeigZLgib78ipMHXwJEBrSusdDAMuY1hFPgSiIpBXGeu/2jbveHVvf7v+g
 s9ukF112ZLjajs0R5daYqh2fvBEslgrc6aZvh2WSkfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Xsg5Bm
 mCZ47yke2CVFVVlCpeggjcDjdh/1VX18joHTY=; b=K4yDFIaan5gBptEUhHmorZ
 XI71+aYhXp2ayLQcATm6lWSJKsWzd/lYcSqkzCXMxdsMRFej+tbjqCLiPwn4ywGr
 u191uPK9ZDscREi0vO6ehTQ47rxZwG3c+lWEsNN/XaulQJdWymAvwK5KW71Bxq75
 6QjhiMFg8n71Hz5OPI6FUEc7/DzoQVz8cUU/J8A59CbhSqk3DOOzyJ3K6VNDfUYt
 AmktsICWvra05+RxXdnfy8AlHkLzMBClf8XssAezfkr7YYyeykr3bOc2U/SrQi1C
 PLFTpp1Zy3g4v3jcbFVI217wOHBuvM+5U9qxgmzTHqEBoJq0cNXdkqNPDdXQJCKw
 ==
X-ME-Sender: <xms:n0y1YF6KcmMRHqO6nTqo5Yk-F9_LDCi87uWGmKJdIu3LImeAzMwCcg>
 <xme:n0y1YC56s5ojeOm23REdy2FhegcGRWL5PjxEfH2opOdS1KTCVSzp0vtgUBE9UTo9X
 _2zEFKgtqHG9E3hgnY>
X-ME-Received: <xmr:n0y1YMex-JutmWOFYYfz2Q2weFUoDDj-XEDaI3xElnk0VaEIAxl7r8A25kCPZKHKJjhJeCYKedr3cJ333V9XzXkoLKcDswOOuhdO_pRutZKMECklbQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelfedgudehhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgeduffeuieetkeeileekvdeule
 etveejudeileduffefjeegfffhuddvudffkeenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:n0y1YOLn85Jea6x4vHfkXp1LlrVzP1aP3fCiVt4EEVRWA-XJ5DBtNg>
 <xmx:n0y1YJKLyrD9PjpYFmms7ICFjkNUdYUZXZCZ33o4J6tgIENoycPJSw>
 <xmx:n0y1YHw1IQd_MxxCjLUOQ7zlIusvUWptUCViCsMoZTl4pSDWai2QAA>
 <xmx:oEy1YOrrxz3T_zF4K_Isdam3L5RWWGahmYNZO4uC7IolugFtn1qM9Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 May 2021 16:52:45 -0400 (EDT)
Date: Mon, 31 May 2021 22:52:44 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Subject: Re: [PATCH 1/3] hw/nvme/ctrl: add controller list cns 0x13
Message-ID: <YLVMnPDpzgr1q4Zs@apples.localdomain>
References: <20210517100736.17063-1-anaidu.gollu@samsung.com>
 <CGME20210517101209epcas5p12d9c0d10a0f34a0f62aaf9ef388d51b8@epcas5p1.samsung.com>
 <20210517100736.17063-2-anaidu.gollu@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mqnSYLs3tjCMsVBP"
Content-Disposition: inline
In-Reply-To: <20210517100736.17063-2-anaidu.gollu@samsung.com>
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


--mqnSYLs3tjCMsVBP
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On May 17 15:37, Gollu Appalanaidu wrote:
>Add the controller identifiers list available in NVM Subsystem
>that may or may not be attached to namespaces.
>
>Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>---
> hw/nvme/ctrl.c       | 25 +++++++++++++++----------
> hw/nvme/trace-events |  2 +-
> include/block/nvme.h |  1 +
> 3 files changed, 17 insertions(+), 11 deletions(-)
>
>diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>index 2e7498a73e..d08a3350e2 100644
>--- a/hw/nvme/ctrl.c
>+++ b/hw/nvme/ctrl.c
>@@ -4251,7 +4251,8 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRe=
quest *req, bool active)
>     return NVME_INVALID_CMD_SET | NVME_DNR;
> }
>
>-static uint16_t nvme_identify_ns_attached_list(NvmeCtrl *n, NvmeRequest *=
req)
>+static uint16_t nvme_identify_ctrl_list(NvmeCtrl *n, NvmeRequest *req,
>+                                        bool attached)
> {
>     NvmeIdentify *c =3D (NvmeIdentify *)&req->cmd;
>     uint16_t min_id =3D le16_to_cpu(c->ctrlid);
>@@ -4261,15 +4262,17 @@ static uint16_t nvme_identify_ns_attached_list(Nvm=
eCtrl *n, NvmeRequest *req)
>     NvmeCtrl *ctrl;
>     int cntlid, nr_ids =3D 0;
>
>-    trace_pci_nvme_identify_ns_attached_list(min_id);
>+    trace_pci_nvme_identify_ctrl_list(c->cns, min_id);
>
>-    if (c->nsid =3D=3D NVME_NSID_BROADCAST) {
>-        return NVME_INVALID_FIELD | NVME_DNR;
>-    }
>+    if (attached) {
>+        if (c->nsid =3D=3D NVME_NSID_BROADCAST) {
>+            return NVME_INVALID_FIELD | NVME_DNR;
>+        }
>
>-    ns =3D nvme_subsys_ns(n->subsys, c->nsid);
>-    if (!ns) {
>-        return NVME_INVALID_FIELD | NVME_DNR;
>+        ns =3D nvme_subsys_ns(n->subsys, c->nsid);
>+        if (!ns) {
>+            return NVME_INVALID_FIELD | NVME_DNR;
>+        }
>     }
>
>     for (cntlid =3D min_id; cntlid < ARRAY_SIZE(n->subsys->ctrls); cntlid=
++) {
>@@ -4278,7 +4281,7 @@ static uint16_t nvme_identify_ns_attached_list(NvmeC=
trl *n, NvmeRequest *req)
>             continue;
>         }
>
>-        if (!nvme_ns(ctrl, c->nsid)) {
>+        if (attached && !nvme_ns(ctrl, c->nsid)) {
>             continue;
>         }
>
>@@ -4493,7 +4496,9 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeReque=
st *req)
>     case NVME_ID_CNS_NS_PRESENT:
>         return nvme_identify_ns(n, req, false);
>     case NVME_ID_CNS_NS_ATTACHED_CTRL_LIST:
>-        return nvme_identify_ns_attached_list(n, req);
>+        return nvme_identify_ctrl_list(n, req, true);
>+    case NVME_ID_CNS_CTRL_LIST:
>+        return nvme_identify_ctrl_list(n, req, false);
>     case NVME_ID_CNS_CS_NS:
>         return nvme_identify_ns_csi(n, req, true);
>     case NVME_ID_CNS_CS_NS_PRESENT:
>diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
>index ea33d0ccc3..7ba3714671 100644
>--- a/hw/nvme/trace-events
>+++ b/hw/nvme/trace-events
>@@ -55,7 +55,7 @@ pci_nvme_identify(uint16_t cid, uint8_t cns, uint16_t ct=
rlid, uint8_t csi) "cid
> pci_nvme_identify_ctrl(void) "identify controller"
> pci_nvme_identify_ctrl_csi(uint8_t csi) "identify controller, csi=3D0x%"P=
RIx8""
> pci_nvme_identify_ns(uint32_t ns) "nsid %"PRIu32""
>-pci_nvme_identify_ns_attached_list(uint16_t cntid) "cntid=3D%"PRIu16""
>+pci_nvme_identify_ctrl_list(uint8_t cns, uint16_t cntid) "cns 0x%"PRIx8" =
cntid=3D%"PRIu16""

Inconsistency here. Please use "field value", not "field=3Dvalue" for=20
cntid.

> pci_nvme_identify_ns_csi(uint32_t ns, uint8_t csi) "nsid=3D%"PRIu32", csi=
=3D0x%"PRIx8""
> pci_nvme_identify_nslist(uint32_t ns) "nsid %"PRIu32""
> pci_nvme_identify_nslist_csi(uint16_t ns, uint8_t csi) "nsid=3D%"PRIu16",=
 csi=3D0x%"PRIx8""
>diff --git a/include/block/nvme.h b/include/block/nvme.h
>index 0ff9ce17a9..188ab460df 100644
>--- a/include/block/nvme.h
>+++ b/include/block/nvme.h
>@@ -980,6 +980,7 @@ enum NvmeIdCns {
>     NVME_ID_CNS_NS_PRESENT_LIST       =3D 0x10,
>     NVME_ID_CNS_NS_PRESENT            =3D 0x11,
>     NVME_ID_CNS_NS_ATTACHED_CTRL_LIST =3D 0x12,
>+    NVME_ID_CNS_CTRL_LIST             =3D 0x13,
>     NVME_ID_CNS_CS_NS_PRESENT_LIST    =3D 0x1a,
>     NVME_ID_CNS_CS_NS_PRESENT         =3D 0x1b,
>     NVME_ID_CNS_IO_COMMAND_SET        =3D 0x1c,
>--=20
>2.17.1
>

--=20
One of us - No more doubt, silence or taboo about mental illness.

--mqnSYLs3tjCMsVBP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmC1TJoACgkQTeGvMW1P
DekYhQf/Tsy5EdGFlbFNRLOJlRTwPkoZD6cWY8rlSxN3to+jPtGfGHOiANlnKZM5
b463ia4onHvz53oAP1tkVJxmlIcLDmMEyVLHl6uvs2M7I78pEUaQ/oBiKrtgiMir
hu7zmrVlaczbsdeuw6igshSMxyhbecHnitaPi75BadM1zkvvtoCLNW0iAwyzbDGK
KGqa/ymp3CEWfyCvthdtUa+siVapo4ZhwnilPAKEqpJ9jKAjWQcaY9iuhY7A5He9
4NW1x9I0KfSD+Jmkp7NG8h+UEmY0QTUr6/Ri2lMQf+SLrcFR7AkRVKLGeulfT1uP
6k2woNiVI5RvYMy2F/svDQRfH3Jx4w==
=XUjh
-----END PGP SIGNATURE-----

--mqnSYLs3tjCMsVBP--

