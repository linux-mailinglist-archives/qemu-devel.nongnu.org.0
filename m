Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4266E35BADD
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 09:32:02 +0200 (CEST)
Received: from localhost ([::1]:40926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVr3A-0004s6-LI
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 03:32:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lVqyC-0004A7-05; Mon, 12 Apr 2021 03:26:52 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:35111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lVqy3-0007gf-6f; Mon, 12 Apr 2021 03:26:49 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0F2BE580836;
 Mon, 12 Apr 2021 03:26:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 12 Apr 2021 03:26:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=gtxeQUZnVCoyuhSca60DNdY5Fj8
 ogVNPJXOSdvIFVM4=; b=ZiKG1SitdtLPwgSUqoTNPi5bLecc8RSbMqTLcS/ZptG
 xszUeEZ0iBXyJTgngrPY6tXbg7FhekapFfWAhbj2vot59UDSq34wKaaROAeumsLb
 ugYnVUKE7Xw/kE4XK96n8+zIvLrQbEqzLDIHu4PycW4/PKUTaZkwaTLLchWuJmoH
 tBPZVXxJxxDFT/tN/4iaUo/djiMRiH2zE/RyDGjMdhU/Nl+91POxa/FE63fFaWYJ
 6ZT1eHIDyMcWHyvhOC9r/u6WaK0Xx+jnVs36iUF4nhZe3fDPCqhDsclWE5DY7u4J
 24lImSwrSRx0yCjVwl5rICyFeG0e6seZ2W40Ms3bmTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=gtxeQU
 ZnVCoyuhSca60DNdY5Fj8ogVNPJXOSdvIFVM4=; b=vo1YSpwY5Gh7pKRMyT4GqV
 JL29z5cmJdhPx0dA0rIJ5EM6yYOjYJx2OpefKdgURmBq6sHOtBTGqbD+Z/bDU5vu
 DgbhLK8ra0f8xH9MdGvXnMYLzGo4kbkvGAomxZSQiM4H10sm6gYelzJeWt+lLd4s
 t4LQEHB1iM7ZhEX4Mtwzf8IhwUqUYkeNKXSGt6iVRjDtcmmrMTsddFDWqw/qW4D3
 LOjSBVsQFYLepmTkVywPfB1afQ7cQ9STYfEUZon9bYRuZYLyYoP/angaDzxY7Zdv
 tRnPgzGHnxqMSc8ZdPtpr8LWMmK2smh83zmUb2wV7GYuSClU5pF4gxmpZ4efHoIw
 ==
X-ME-Sender: <xms:MPZzYKOrYogacNGtL-vl7KNS0vWNblztqnddrEzQtk4S84p_cfnd1w>
 <xme:MPZzYI-icZRcID_hjssvJtZnb_NYV5RkIPDkclb8p0Lx7QzDsLAKYzXwJeALSPDKB
 2_tADEsrNSlX9zPDIg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekiedguddukecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhephfefheetfeeffedviefgheelgfehteffuedthfffgeevgeelhfduvdfhveeu
 udevnecuffhomhgrihhnpegsuhhshigsohigrdhnvghtnecukfhppeektddrudeijedrle
 ekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:MPZzYBQJoyG6wiaRYDhPznldzXLdOb-8xOnzQ7wogRu-6nySr4FHQw>
 <xmx:MPZzYKtB5scIQ1u2ovAdTAsWzrKBEyjtTeatVg-cPnUuGekS-ZCwGQ>
 <xmx:MPZzYCdc8Quer1RSKTj-pYTwWIHoLNix-8e5PR2Ro0g5SehY5flsZQ>
 <xmx:MvZzYC4ji4y0RdMuulwXyRSq55qw54XX9TKWO_djsz8MfYJBfivzmA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id C3468240054;
 Mon, 12 Apr 2021 03:26:38 -0400 (EDT)
Date: Mon, 12 Apr 2021 09:26:37 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH for-6.0 v2 6/8] hw/block/nvme: update dmsrl limit on
 namespace detachment
Message-ID: <YHP2LcqxvV7h6HHj@apples.localdomain>
References: <20210405175452.37578-1-its@irrelevant.dk>
 <20210405175452.37578-7-its@irrelevant.dk>
 <fa06244b-b4d9-9edb-0fef-495a477bbe71@redhat.com>
 <YGwMx5n2MzBkG8pQ@apples.localdomain>
 <726df2a1-6e56-145f-9fa5-c5c94ec3b635@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nhYFfg4hEvgC6oru"
Content-Disposition: inline
In-Reply-To: <726df2a1-6e56-145f-9fa5-c5c94ec3b635@redhat.com>
Received-SPF: pass client-ip=66.111.4.221; envelope-from=its@irrelevant.dk;
 helo=new1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--nhYFfg4hEvgC6oru
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Apr  9 19:39, Thomas Huth wrote:
>On 06/04/2021 09.24, Klaus Jensen wrote:
>>On Apr  6 09:10, Philippe Mathieu-Daud=C3=A9 wrote:
>>>On 4/5/21 7:54 PM, Klaus Jensen wrote:
>>>>From: Klaus Jensen <k.jensen@samsung.com>
>>>>
>>>>The Non-MDTS DMSRL limit must be recomputed when namespaces are
>>>>detached.
>>>>
>>>>Fixes: 645ce1a70cb6 ("hw/block/nvme: support namespace attachment comma=
nd")
>>>>Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>>>>Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>>>>---
>>>>  hw/block/nvme.c | 17 +++++++++++++++++
>>>>  1 file changed, 17 insertions(+)
>>>>
>>>>diff --git a/hw/block/nvme.c b/hw/block/nvme.c
>>>>index de0e726dfdd8..3dc51f407671 100644
>>>>--- a/hw/block/nvme.c
>>>>+++ b/hw/block/nvme.c
>>>>@@ -4876,6 +4876,21 @@ static uint16_t nvme_aer(NvmeCtrl *n, NvmeReques=
t *req)
>>>>      return NVME_NO_COMPLETE;
>>>>  }
>>>>+static void __nvme_update_dmrsl(NvmeCtrl *n)
>>>>+{
>>>>+    int nsid;
>>>>+
>>>>+    for (nsid =3D 1; nsid <=3D NVME_MAX_NAMESPACES; nsid++) {
>>>>+        NvmeNamespace *ns =3D nvme_ns(n, nsid);
>>>>+        if (!ns) {
>>>>+            continue;
>>>>+        }
>>>>+
>>>>+        n->dmrsl =3D MIN_NON_ZERO(n->dmrsl,
>>>>+                                BDRV_REQUEST_MAX_BYTES / nvme_l2b(ns, =
1));
>>>>+    }
>>>>+}
>>>>+
>>>>  static void __nvme_select_ns_iocs(NvmeCtrl *n, NvmeNamespace *ns);
>>>>  static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
>>>>  {
>>>>@@ -4925,6 +4940,8 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, N=
vmeRequest *req)
>>>>              }
>>>>              nvme_ns_detach(ctrl, ns);
>>>>+
>>>>+            __nvme_update_dmrsl(ctrl);
>>>>          }
>>>
>>>Why the '__' prefix? It doesn't seem clearer (I'm not sure there is
>>>a convention, it makes me think of a internal macro expansion use
>>>for preprocessor).
>>>
>>>There are very few uses of this prefix:
>>>
>>>hw/9pfs/cofs.c:21:static ssize_t __readlink(V9fsState *s, V9fsPath
>>>*path, V9fsString *buf)
>>>hw/block/nvme.c:1683:static uint16_t __nvme_zrm_open(NvmeNamespace *ns,
>>>NvmeZone *zone,
>>>hw/block/nvme.c:1742:static void __nvme_advance_zone_wp(NvmeNamespace
>>>*ns, NvmeZone *zone,
>>>hw/block/nvme.c:5213:static void __nvme_select_ns_iocs(NvmeCtrl *n,
>>>NvmeNamespace *ns)
>>>hw/i386/amd_iommu.c:1160:static int __amdvi_int_remap_msi(AMDVIState *io=
mmu,
>>>hw/intc/s390_flic_kvm.c:255:static int __get_all_irqs(KVMS390FLICState
>>>*flic,
>>>hw/net/rocker/rocker_desc.c:199:static bool
>>>__desc_ring_post_desc(DescRing *ring, int err)
>>>hw/net/sungem.c:766:static uint16_t __sungem_mii_read(SunGEMState *s,
>>>uint8_t phy_addr,
>>>hw/ppc/ppc.c:867:static void __cpu_ppc_store_decr(PowerPCCPU *cpu,
>>>uint64_t *nextp,
>>>hw/s390x/pv.c:25:static int __s390_pv_cmd(uint32_t cmd, const char
>>>*cmdname, void *data)
>>>pc-bios/s390-ccw/cio.c:315:static int __do_cio(SubChannelId schid,
>>>uint32_t ccw_addr, int fmt, Irb *irb)
>>>target/ppc/mmu-hash64.c:170:static void __helper_slbie(CPUPPCState *env,
>>>target_ulong addr,
>>>
>>>Thomas, Eric, is it worth cleaning these and updating the
>>>'CODESTYLE.rst'?
>>>
>>
>>Yeah ok, I think you are right that there is no clear convention on when
>>to use this or not. I typically just use it for functions that are
>>normally not supposed to be called directly.
>>
>>But I don't even think its consistent in the nvme device. For my sake,
>>we can clean it up, I'll drop it in this case since there is no good
>>reason for it other than my own idea of "style".
>
>IIRC all identifiers that start with two underscores are reserved by=20
>the C standard:
>
> https://busybox.net/~landley/c99-draft.html#7.1.3
>
>Thus you should not use two underscores at the beginning here at all.
>

I'll clean up the remaining double underscores in the next cycle!

--nhYFfg4hEvgC6oru
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmBz9isACgkQTeGvMW1P
Dem7Owf/XMLxXDKLLbHPf3pV1KlnaSXn+8KMXSPOEw6PlptXO8vGbhUAylpjHRZe
iF/PP9i9MkI1zm/84XLwlW8fwcx6e2nFK4ebYJ+FN+3+DSXLmWwpLTdBRTgkOJy0
Ipo+DlmvLUMJFK5QwguJoe+wzRFaNulAPZZvpzmnCNaT3Ybvw/2ZUgBm0Ts1etj0
/CfAkeljaFQX4FuvR5iRHrItk/eak6eVrfHjcUkgbTK7jXAFDauftyFwyihS0M8V
rrn0RpQTDcS2iW5VPPCepOC+sBgVRRy6Br4hVL7LDjxJw6YwjdH/bXOQhW31FfEy
DsIUyMEy4FCfX9eula6nj18DqPQjBg==
=g82R
-----END PGP SIGNATURE-----

--nhYFfg4hEvgC6oru--

