Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC623BD174
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 13:38:16 +0200 (CEST)
Received: from localhost ([::1]:54244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0jP5-0004U3-Oe
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 07:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m0jGU-0005ig-RU; Tue, 06 Jul 2021 07:29:24 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:35967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m0jGR-0003fI-1m; Tue, 06 Jul 2021 07:29:22 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id B2E7C32003AC;
 Tue,  6 Jul 2021 07:29:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 06 Jul 2021 07:29:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=zD+9OUu3kR29a+smUDPofYDrqZX
 fvFMU73/eV4RdDls=; b=Zw33pQmuYae5kWV5u8GCPb/APYBBb4VMJx0WFEb3nez
 OhQ/yHSjsHqcQFwaK64rEGEwmCbDHgFZ1BTfz7XtG6t8+lagkF/4rAuteXKRW+7O
 9pr3CyNaj56BPcHPnb6GLsK3VwprNxldZMGfalap292ssV83ESBIjLTiNo/oy9TA
 I82Bd0K+0LXgr1janw/hP+KG1scymBA+ni5NsjC5PVJ/sUg+DEp9Er/tHfwjkKsg
 ge8y0WWOGcomaRad+De1zI4i47QKZxr0zLUMZpnPS9KRfVk6ODzt+SvIJuMQKF6B
 39bUI3/6/JRr36B1nMjUi2XvmZd0+YfG9ribstX3KKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=zD+9OU
 u3kR29a+smUDPofYDrqZXfvFMU73/eV4RdDls=; b=YGAaiDsZJGr/pV1yFdtD5u
 2Qq1ZB40mf1S+/wcnsFvZzMle+LOBe0UeJv2YWcCNS2mbYS29Ed9sHT3sUFKjpua
 IpACurMYFDYWBPGYXlg7fC6soPMUmLWuKp7ex5xezGt/WQrLGnoRlrk/34R7/Qcu
 AAzVHseZ/K/tjDLJlD7mgUqxz20HQgQCYuC6S6lxvuI1DMmRFzgeQWZ1Wmbs49gk
 PvmdMG8DC71+u+WRmNCHoYd3QMqR88aXPLRhTd17A3NgplIhhdNRmoCGbbhD62kj
 JcuFRb29iRVT9kmNTUKBCKoaJEa6j8ohvkputftDyStnnb4so3pYPDbOh5ZNVcBw
 ==
X-ME-Sender: <xms:ij7kYJcmo-f4_g7AkcdJ8g-FmzswDLV-0YMSHNzTxb1QFZRM1WolaA>
 <xme:ij7kYHM0TQL5OiuxZW3FkqWyfIHYL6ESWtMD7ZAOnirX08OKe_ztZ0NJHfjK7hDoj
 Ffw4epp9ji6LIDL0dA>
X-ME-Received: <xmr:ij7kYCj_YmM9apbZVkj7HAHy4JDXk40OPlBtaK3gzRhwhSWKzKR1-GFdoe7BjuYVZXuDIVy64HKFpFwtX8FA47Um7xhyGzVnXP_vqffFcj2nnVPk6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeejiedgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:ij7kYC8AKHA5CHh0ng_8P79mc3EAhdgAmcUa5Db7g4GeVDTND0fdfw>
 <xmx:ij7kYFsSytoiVCKZfJycF3SzXF6KMefURU3IAisSLcpDOOrXWiFuPA>
 <xmx:ij7kYBEvUgsEIUv-fIPgwY_u_glnDcXlvaVCtdSGQCEudAcMnHMGRQ>
 <xmx:iz7kYG_BiAbVELU3BqsCyCXpF5rsuB1w03fDz8ovvbXDoQDMpTakig>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jul 2021 07:29:12 -0400 (EDT)
Date: Tue, 6 Jul 2021 13:29:10 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Padmakar Kalghatgi <p.kalghatgi@samsung.com>
Subject: Re: [PATCH]: /hw/nvme/ctrl error handling if descriptors are greater
 than 1024
Message-ID: <YOQ+hgOpl3zoBIS7@apples.localdomain>
References: <CGME20210706104308epcas5p4547ee66f254ce8de5d43a375f5a6fd1f@epcas5p4.samsung.com>
 <1c9201d77253$b5708060$20518120$@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="idt48IeWVdyHxMcv"
Content-Disposition: inline
In-Reply-To: <1c9201d77253$b5708060$20518120$@samsung.com>
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


--idt48IeWVdyHxMcv
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Padmakar,

Patch looks good, but it got messed up by your MUA. You've previously=20
contributed correctly formatted patches, so please revert to that method=20
when sending patches in the future ;)

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

On Jul  6 16:13, Padmakar Kalghatgi wrote:
>From: padmakar
>
>
>
>if the number of descriptors or pages is more than 1024,
>
>dma writes or reads will result in failure. Hence, we check
>
>if the number of descriptors or pages is more than 1024
>
>in the nvme module and return Internal Device error.
>
>
>
>Signed-off-by: Padmakar Kalghatgi
>
>---
>
>hw/nvme/ctrl.c       | 14 ++++++++++++++
>
>hw/nvme/trace-events |  1 +
>
>2 files changed, 15 insertions(+)
>
>
>
>diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>
>index 40a7efc..082592f 100644
>
>--- a/hw/nvme/ctrl.c
>
>+++ b/hw/nvme/ctrl.c
>
>@@ -602,6 +602,20 @@ static uint16_t nvme_map_addr(NvmeCtrl *n, NvmeSg *sg,
>hwaddr addr, size_t len)
>
>         return NVME_SUCCESS;
>
>     }
>
>+    /*
>
>+     *  The QEMU has an inherent issue where in if the no.
>
>+     *  of descriptors is more than 1024, it will result in
>
>+     *  failure during the dma write or reads. Hence, we need
>
>+     *  to return the error.
>
>+     */
>
>+
>
>+    if (((sg->flags & NVME_SG_DMA) && ((sg->qsg.nsg + 1) > IOV_MAX)) ||
>
>+        ((sg->iov.niov + 1) > IOV_MAX)) {
>
>+            NVME_GUEST_ERR(pci_nvme_ub_sg_desc_toohigh,
>
>+                       "number of descriptors is greater than 1024");
>
>+            return NVME_INTERNAL_DEV_ERROR;
>
>+    }
>
>+
>
>     trace_pci_nvme_map_addr(addr, len);
>
>     if (nvme_addr_is_cmb(n, addr)) {
>
>diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
>
>index ea33d0c..bfe1a3b 100644
>
>--- a/hw/nvme/trace-events
>
>+++ b/hw/nvme/trace-events
>
>@@ -202,3 +202,4 @@ pci_nvme_ub_db_wr_invalid_cqhead(uint32_t qid, uint16_t
>new_head) "completion qu
>
>pci_nvme_ub_db_wr_invalid_sq(uint32_t qid) "submission queue doorbell write
>for nonexistent queue, sqid=3D%"PRIu32", ignoring"
>
>pci_nvme_ub_db_wr_invalid_sqtail(uint32_t qid, uint16_t new_tail)
>"submission queue doorbell write value beyond queue size, sqid=3D%"PRIu32",
>new_head=3D%"PRIu16", ignoring"
>
>pci_nvme_ub_unknown_css_value(void) "unknown value in cc.css field"
>
>+pci_nvme_ub_sg_desc_toohigh(void) "the number of sg descriptors is too
>high"
>
>--=20
>
>2.7.0.windows.1
>
>
>

--idt48IeWVdyHxMcv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDkPoAACgkQTeGvMW1P
DekPzQgAwv/eg+pGjt2Lsru5SeC3zEs/xc40lPQKaehgfXHOSmweVNXwSnzwyqxM
FlWvpndjMXbQ4TTesb6VTf9q7c3IMmyIV10D+mwLOnz579hbu9PWklnW7ASvswYj
balJXvr3uTYPULyROezkjpmQtoie6j5e3YUjsUua/DWoPd1RxB/p1MAQWa+peJ3u
XflonyfH4jgYoLihILbiTGRliWiAzhEkPc/36A9qSpDdPM4Mxd+JbfXDhrQusXbO
pavHOzmi2NuZF70NeYPrqyXLTnSek3c/CWqoY3IO10b/ko2tA89B/f9k2aTXcGEm
BKYcaA8n3RxPNZNWySi2DXCoa+Ot4g==
=0kPO
-----END PGP SIGNATURE-----

--idt48IeWVdyHxMcv--

