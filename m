Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 808A33C1F3B
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 08:11:43 +0200 (CEST)
Received: from localhost ([::1]:51388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1jji-0006gS-4i
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 02:11:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m1jfF-0003Yc-A3; Fri, 09 Jul 2021 02:07:05 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:46511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m1jfD-0007vk-Ld; Fri, 09 Jul 2021 02:07:05 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 33ACE320082A;
 Fri,  9 Jul 2021 02:07:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 09 Jul 2021 02:07:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=aytb/Xa5UUDKwbrX3Bvp01+b4QO
 KE1I0w+mcTW1C5f0=; b=V5BwEILWA6DzC6ATweyeb4fzyp8992/e6+dIYguaKCS
 7YDSOYyFSdiJgVPnfrJCbPBe2OGRROgu94Ix3WBHweUamipfGqyty3EdIx9QYZEf
 Q+etFQxpMUb1tTzm5fc1Qy21ii8c4gV7rOZODTY6usPmVIUIyNc0Q6RYgOF6y4gp
 o804Ryx83s7XJ5lyqX15Nq8c6ML1F6lYdR+hsZkrkSBSR/FBfFrrdPLoyM53VxM/
 OtP37aauEWNRgWMuDkD+r2EVLN6wjZF8+bXG28cpBtA0I9NvL3VUrHyuVeCcp72D
 DalbYiLMZJD/uoHCYiCpqoRs0UnQb1Ez+2rdYiXsHVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=aytb/X
 a5UUDKwbrX3Bvp01+b4QOKE1I0w+mcTW1C5f0=; b=H4gHksIHn4dSU7DhLnVspx
 iSQdMXkzDiskzIbAQT8yCiF7gSOst/RDa0Gn100jPR+HxZ73IBsHmL4Cbp6+bzxl
 19qbSllSwomFd11PutnOK9UhOUOSCaGOE7fnGq4IgJgsVGOpWIxBseUVYIsuRzag
 BDh9JirBdgWsf9TC8UBjMAQEyOMquaLqEqy2A9SihogdAjyXKsiy2R3jlVPk6PKL
 OIkNMWtB06mmreHLvm6Y11YbQNLEEkpwBDijPoUNHGm/4uf3mx+1QYj18lkX8mOz
 AWFzh75A3KV7Ag21dmPLt0s33oZO5GkJ26w1vPXwfK8lDaPovIMPwfifMO6VBPHg
 ==
X-ME-Sender: <xms:g-fnYF-3yFj9pndeiURxb02D1MEseE_zNCmmjUhWA4uXywAp4LqNHg>
 <xme:g-fnYJuJv9fqmr2No5oDQZlZHD6PZDgBLLCh02LhDdNYe15B7LQRhrTtxcnvaDvoq
 ASJQ180LJ9E-E9FqVI>
X-ME-Received: <xmr:g-fnYDAxcy6KGs0OdytyWdTw31zv-Fo7_dmNxkZ5dSzj1i7a-Y4deuyNsh5TLuj9pJmrcugig_AhbAo_cr6oVi0xx1fSEfchXMepFfzmBgfUO2jSZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdehgdejhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvdduffek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:g-fnYJd9YIJi-k58xYHqCYpf81TbAJniUYnJkmgOee-oyKrWnYYXwg>
 <xmx:g-fnYKPnYikhYQwaQ9yHuKXAOtV7Iht980Za9w1HCO2CrAKyOY3yGA>
 <xmx:g-fnYLmuY-At7BXs10bdukrnUPa2VNdNypTO5JhINXdi34LPlnjDFQ>
 <xmx:hOfnYJewWrP3cVAhpoCCfRv2LO0Sg41w_3ph3ygMni7YaSD_UxIqfw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Jul 2021 02:06:58 -0400 (EDT)
Date: Fri, 9 Jul 2021 08:06:54 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Padmakar Kalghatgi <p.kalghatgi@samsung.com>
Subject: Re: [PATCH]: /hw/nvme/ctrl error handling if descriptors are greater
 than 1024
Message-ID: <YOfnfmyLa2t8DnQC@apples.localdomain>
References: <CGME20210706104308epcas5p4547ee66f254ce8de5d43a375f5a6fd1f@epcas5p4.samsung.com>
 <1c9201d77253$b5708060$20518120$@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ttSpecCLlpqk694z"
Content-Disposition: inline
In-Reply-To: <1c9201d77253$b5708060$20518120$@samsung.com>
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


--ttSpecCLlpqk694z
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

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

Applied to nvme-next, but made the error message more generic (this also=20
applied to PRPs).

--ttSpecCLlpqk694z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDn530ACgkQTeGvMW1P
DekeeQgAiOF4dLbQWZqE2ciIXOYpc3NBgTIm3tpXFlIpHRrhd0YX/Xpo9E2LHWVw
1kmkOBn+z8tW3v4UWFLII7GfbD+LBCki0wSY471cxMjhhqm1vhH769o+sjjHKKpK
+gafJ+FyPFLxEDZTS6MtV88OzUn+nDDWxPOynrNCXNI7n5BY0442NyTRL1Uh7Ykf
kaSu72R0Hc7AyVyRJEk/agrxP0fPBaRGk8aeJVCgfXhejMI/GyUdnuufgWjXU7Zd
vbhUInMc2lcWrCRIkkVCeAjdeVWu3J+/lMWC4KSbpVHL1UZ108WUuyuLrKXZGn+f
IZAPDzc1Zj3t7Kml8SWdMNq6B1Nh4A==
=tP9e
-----END PGP SIGNATURE-----

--ttSpecCLlpqk694z--

