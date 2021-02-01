Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B4F30B24B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 22:50:07 +0100 (CET)
Received: from localhost ([::1]:48896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6h5C-0001dG-II
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 16:50:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l6h0Y-0000KF-0j; Mon, 01 Feb 2021 16:45:18 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:48843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l6h0V-0003t9-Gy; Mon, 01 Feb 2021 16:45:17 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 59A745C01C4;
 Mon,  1 Feb 2021 16:45:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 01 Feb 2021 16:45:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=7uOQwuwxQKHUxnJBCFR5CKGMz1o
 XXsPqpVy1q+QjULY=; b=zJVQ4b+lCg1GGsiOPpBIsG38q1VsVBMmPq034I4jml/
 43zxFGFSd2iKjLNq3hCskwr2DlLYGEOOB1EzUDEQl9SfctqJftI6XCCbo/uGIfr4
 hHVHoxVg3cVZ2nPErYLBAgje85DwwnK/knaMHtVpIkiIYdp5B+kdwM9uHi4NKPaH
 SIfLIbuY8HqTDiFRKDybOOhV8RFHpRBvLz+YiQlI/LTCoL+7ud3+59EI+nL6SbEu
 Q8rAdE7d3Ls79ewhRMVxTvMbnk9NeOQEhVASJR5hHg8FIFIUJNedAV/0gXwTWB1A
 XkekOTn93vx+5ruR0wb/hwi22+ZXNr5CVK3UBRs1NQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=7uOQwu
 wxQKHUxnJBCFR5CKGMz1oXXsPqpVy1q+QjULY=; b=L2bxYR4NlnXDwaA7l+P+dA
 u7ai3d36JLpPa9qEpAUahKeJVIH3FlU0kIayA4NkPXGyACxxY6Bp3+niXZIPpsJn
 WfHYyyjyDNcA0bcJzjvsrXpuCOFbccUKgoQYx+6EEtxydV/S0YISrg+AIFWyyXfd
 uHsI2KhqbTADh+gnc8YuP+cHSloYybEuYCHQp1cinurHt+Ok9pGsVPh5Dap8ndWz
 Vkp4WMhncshZs9yxxT1PZuzbKWK0THnrtirkJY+aXLYrR26EsPsXTuecgC7gFBOL
 726a6wf2nimLn2xlHSnIm5FmWTytO7A3JH2+bitjX+2wB5E92Tv2VxNd5M3MasZQ
 ==
X-ME-Sender: <xms:ZHYYYBUVT14Rp8oyQwgoRQ2YyaV1K6NUXd52wbcQH-bW8TbfF47itg>
 <xme:ZHYYYBn07iHOUBMUgh7F9tHYL7oX8X6cEweQx20H9u4uhwNKlYQnDtVp6IvC_RxS7
 NmQxRFkLeixouGGAk0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeekgdduhedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeejgeduffeuieetkeeileekvdeuleetveejudeileduffefjeegfffhuddvudff
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:ZHYYYNa8eM7LBMEvdU53ur5KbJ40uHeVmaCMlvs-jAd8QS3oUfQk7A>
 <xmx:ZHYYYEUXPFEKCOSNmijiEPKWmbEDLPIWaE_cbpamAHnLxLGLBJWg1A>
 <xmx:ZHYYYLmqXRmZ-vAxYIZja5tXFy2m-lmDfqqRCz_JX-nA2Ci5xPgg9Q>
 <xmx:ZnYYYJbpL6lSq_CPufVEgw4Ws5ZsuQK8QuMZj15zTciXTcsnsUrvoA>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id B49EF24005C;
 Mon,  1 Feb 2021 16:45:07 -0500 (EST)
Date: Mon, 1 Feb 2021 22:45:05 +0100
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v5 5/5] hw/block/nvme: add simple copy command
Message-ID: <YBh2YSkMwuhGbUUG@apples.localdomain>
References: <20210129091541.566330-1-its@irrelevant.dk>
 <20210129091541.566330-6-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eq3gH16VZjUlboeh"
Content-Disposition: inline
In-Reply-To: <20210129091541.566330-6-its@irrelevant.dk>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--eq3gH16VZjUlboeh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jan 29 10:15, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
>=20
> Add support for TP 4065a ("Simple Copy Command"), v2020.05.04
> ("Ratified").
>=20
> The implementation uses a bounce buffer to first read in the source
> logical blocks, then issue a write of that bounce buffer. The default
> maximum number of source logical blocks is 128, translating to 512 KiB
> for 4k logical blocks which aligns with the default value of MDTS.
>=20
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/block/nvme-ns.h    |   4 +
>  hw/block/nvme.h       |   1 +
>  hw/block/nvme-ns.c    |   8 ++
>  hw/block/nvme.c       | 253 +++++++++++++++++++++++++++++++++++++++++-
>  hw/block/trace-events |   7 ++
>  5 files changed, 272 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/block/trace-events b/hw/block/trace-events
> index c083000b8c1f..b26866ba4338 100644
> --- a/hw/block/trace-events
> +++ b/hw/block/trace-events
> @@ -43,12 +43,18 @@ pci_nvme_admin_cmd(uint16_t cid, uint16_t sqid, uint8=
_t opcode, const char *opna
>  pci_nvme_read(uint16_t cid, uint32_t nsid, uint32_t nlb, uint64_t count,=
 uint64_t lba) "cid %"PRIu16" nsid %"PRIu32" nlb %"PRIu32" count %"PRIu64" =
lba 0x%"PRIx64""
>  pci_nvme_write(uint16_t cid, const char *verb, uint32_t nsid, uint32_t n=
lb, uint64_t count, uint64_t lba) "cid %"PRIu16" opname '%s' nsid %"PRIu32"=
 nlb %"PRIu32" count %"PRIu64" lba 0x%"PRIx64""
>  pci_nvme_rw_cb(uint16_t cid, const char *blkname) "cid %"PRIu16" blk '%s=
'"
> +pci_nvme_copy(uint16_t cid, uint32_t nsid, uint16_t nr, uint8_t format) =
"cid %"PRIu16" nsid %"PRIu32" nr %"PRIu16" format 0x%"PRIx8""
> +pci_nvme_copy_source_range(uint64_t slba, uint32_t nlb) "slba 0x%"PRIx64=
" nlb %"PRIu32""
> +pci_nvme_copy_in_complete(uint16_t cid) "cid %"PRIu16""
> +pci_nvme_copy_cb(uint16_t cid) "cid %"PRIu16""
> +pci_nvme_write_zeroes(uint16_t cid, uint32_t nsid, uint64_t slba, uint32=
_t nlb) "cid %"PRIu16" nsid %"PRIu32" slba %"PRIu64" nlb %"PRIu32""

Woops. An old trace event ended up in there when rebasing.

--eq3gH16VZjUlboeh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmAYdl0ACgkQTeGvMW1P
Denjagf/VZ020d9nB1UJRrAgCbkMotAR/lhwLd4ZRZwQrn2Hq+jowIVCDK4uz8R+
rVBmX675pLQl6S1jZbxOpUDdT8/NOwKoQlYHah0VksDPFDVaQ8YQXxrxeb2fmdUD
Jyyz2bUxhlRdOBOuf2+BK0K9FnWLw1OGNNoGQpW7yOSqX6qjm3GQ4KUkfZZJa6D3
eMSLyk6ICSuKseJCqa8TJRmPDRYZKTJCAfcbXpOfhnQE3Nf1Ddl72/4S/qF8MA5v
HKVZpJ3pZi+wm8Dqz6S+BdnbNoXl2yJ8aEvSUrc9ukivaPkhv2kQ+nLPR+qeI4V8
5WK5FINMhbsuax/Dp1OxDV5AHToyfw==
=OkMe
-----END PGP SIGNATURE-----

--eq3gH16VZjUlboeh--

