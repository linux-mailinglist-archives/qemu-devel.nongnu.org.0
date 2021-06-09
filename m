Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DDA3A1E17
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 22:27:19 +0200 (CEST)
Received: from localhost ([::1]:42608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr4nG-0003iS-8O
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 16:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lr4j4-0001YX-2S; Wed, 09 Jun 2021 16:22:58 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:37911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lr4j1-0005Yj-Te; Wed, 09 Jun 2021 16:22:57 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id A57855C0126;
 Wed,  9 Jun 2021 16:22:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 09 Jun 2021 16:22:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=m31aN0I1CMWbD92llieJ/giaYxm
 gG89Bw2Fk3aUm4LU=; b=f1s9B1NWIBvm2XgBAp4g8Q9zXR+YHl9FBUFcMMS7rnk
 0ETrOnfSlhTZ27xAUHkGR/PBb5B32gqriKRRXuKTfjgIdA7YXITIrpcJI9rvmW70
 4iR9yGKmo3f73OCS/QAbrI8s3BXgMC5eAm+knSTZm34ywsigbw9zGCeFhUlJQBY+
 2nAoP9lE9EniPfbzRSm46qopUCcEiBdCsyxy+HXFKUyJ6KpmZ1nQOhYnH4aBRYNu
 /t7Nbmr9PMh2FsNnOScw56Teo9cMUr+sjVULsFZGyZaOqUvKHI98bZWgSP0UMbs/
 ymnDYPDTcnj9gS2SGrwKqGaGmro5D1sWLf3gHATj0TQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=m31aN0
 I1CMWbD92llieJ/giaYxmgG89Bw2Fk3aUm4LU=; b=VrBmc8Co6ZIWNClZhnl/Z7
 qm3ajjQnK0FSm65lYahwutzHNsJTfQJiAFwT82SShzkpVsT3rcqZdJ8oVHhjYMwE
 8tdHyrMyHGIAr1sSuS7Df+McEv7sXJAjHzNOnm5wW49eQKjyI9ynJi3/fnBGuzND
 7/1rPIVswr6mvHhRNDQgZlHUR7NTYho1ufuTZbVkFCBrw0bsseF1krwWYMF1+iXZ
 UhMr/PGwXlWNS5ltaUvW5zSDdIbNZrpH0cUuV+PCc3EO6sxyWFAu1GUr1FTl/GGy
 idz5+QHqAcmlQozoGekFk5/3/clNtXhXzx37NezdN9A1s3nXD2xPaxk9yND3AM/g
 ==
X-ME-Sender: <xms:HCPBYIOxQUuGft16kQkba7Pcv7UIUZ-20HsQfSmErWWnC9YPEVy-Fg>
 <xme:HCPBYO9iLpcNtk7UsH1QfDUwlsy-BNPsFNg7p9TM1mlWEYpuAOPdqRcG-Ziyc6EvZ
 ndKeWPBjqMZDp01XEg>
X-ME-Received: <xmr:HCPBYPQxV3k1hKXNDVbAvw9LrhBIcuXv9BXVStpnsL0m_YavPD-twPCjfQtdgtdQaD8AFEYBpD7nTtM8gL5fsvRUC-Q-HF5b85Ml2Lsl6G9gP2yd6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeduuddgudegiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgeduffeuieetkeeileekvdeule
 etveejudeileduffefjeegfffhuddvudffkeenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:HCPBYAvp1OpLUB77wwTSmxB3mIpKb0KhHBMrKpas4caXWgUuVfPb_w>
 <xmx:HCPBYAfgbuKmflJJ8zAjCWzlZaTtIqR2TwRl95gBYYDCJRD230aj2w>
 <xmx:HCPBYE1J1h9OjD3C3F7379rwXbEqmNUbQl1NsJe5oc8rKhhhHydgfA>
 <xmx:HSPBYOuGQiZSyUtG-Yck92yvdpglhEV-IFJrHbwjVBPcfFwl6z_O5A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Jun 2021 16:22:51 -0400 (EDT)
Date: Wed, 9 Jun 2021 22:22:49 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Subject: Re: [PATCH v2 1/2] hw/nvme: fix endianess conversion and add
 controller list
Message-ID: <YMEjGTBNHmsu5RgT@apples.localdomain>
References: <CGME20210601150640epcas5p298805b3669ca8b586d92da31d4742ab0@epcas5p2.samsung.com>
 <20210601150226.5558-1-anaidu.gollu@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="C3Z0Wy4devAPJy0z"
Content-Disposition: inline
In-Reply-To: <20210601150226.5558-1-anaidu.gollu@samsung.com>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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


--C3Z0Wy4devAPJy0z
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline

On Jun  1 20:32, Gollu Appalanaidu wrote:
>Add the controller identifiers list CNS 0x13, available list of ctrls
>in NVM Subsystem that may or may not be attached to namespaces.
>
>In Identify Ctrl List of the CNS 0x12 and 0x13 no endian conversion
>for the nsid field.
>
>Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>
>-v2:
> Fix the review comments from Klaus and squashed 2nd commit into
> 1st commit
>
>---
> hw/nvme/ctrl.c       | 26 ++++++++++++++++----------
> hw/nvme/trace-events |  2 +-
> include/block/nvme.h |  1 +
> 3 files changed, 18 insertions(+), 11 deletions(-)
>
>diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>index 2e7498a73e..813a72c655 100644
>--- a/hw/nvme/ctrl.c
>+++ b/hw/nvme/ctrl.c
>@@ -4251,9 +4251,11 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req, bool active)
>     return NVME_INVALID_CMD_SET | NVME_DNR;
> }
>
>-static uint16_t nvme_identify_ns_attached_list(NvmeCtrl *n, NvmeRequest *req)
>+static uint16_t nvme_identify_ctrl_list(NvmeCtrl *n, NvmeRequest *req,
>+                                        bool attached)
> {
>     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
>+    uint32_t nsid = le32_to_cpu(c->nsid);
>     uint16_t min_id = le16_to_cpu(c->ctrlid);
>     uint16_t list[NVME_CONTROLLER_LIST_SIZE] = {};
>     uint16_t *ids = &list[1];
>@@ -4261,15 +4263,17 @@ static uint16_t nvme_identify_ns_attached_list(NvmeCtrl *n, NvmeRequest *req)
>     NvmeCtrl *ctrl;
>     int cntlid, nr_ids = 0;
>
>-    trace_pci_nvme_identify_ns_attached_list(min_id);
>+    trace_pci_nvme_identify_ctrl_list(c->cns, min_id);
>
>-    if (c->nsid == NVME_NSID_BROADCAST) {
>-        return NVME_INVALID_FIELD | NVME_DNR;
>-    }
>+    if (attached) {
>+        if (nsid == NVME_NSID_BROADCAST) {
>+            return NVME_INVALID_FIELD | NVME_DNR;
>+        }
>
>-    ns = nvme_subsys_ns(n->subsys, c->nsid);
>-    if (!ns) {
>-        return NVME_INVALID_FIELD | NVME_DNR;
>+        ns = nvme_subsys_ns(n->subsys, nsid);
>+        if (!ns) {
>+            return NVME_INVALID_FIELD | NVME_DNR;
>+        }
>     }
>
>     for (cntlid = min_id; cntlid < ARRAY_SIZE(n->subsys->ctrls); cntlid++) {

Assume that `attached` is false and `n->subsys` is NULL.

KABOOOOM :)

--C3Z0Wy4devAPJy0z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDBIxgACgkQTeGvMW1P
DelZBQf/ewYA17a0lrBv2xShtSAOTcrcAjwo99fN2iRYb5veIGVJ3ZsbPBOReKu6
qxOsjCcBM1OSba7ewOGkVwebuSuRFPsQRp6jY2/jMYIdRWIhASm3yPatorL2anRV
p0rJlkCKtrebxmivJctSdd6uwPpEFOpNo/RqOl8ZHct9AkE774LfZrCu5y27E0c3
cKT0/oiFPFkVq9vCUT/sVJLENUZXXSHhd2ZlZOc26Joo/ej4YmHcMb7TRkqvTlBM
t87scaHygEmkODcTDPlzBzJ73atJRqsCx1hK2Xt6bto+GVkmPWrukq6AQ/d/Y/R0
uAodV7MoCBfBdBtnNlFbP9uae23oRw==
=CWMx
-----END PGP SIGNATURE-----

--C3Z0Wy4devAPJy0z--

