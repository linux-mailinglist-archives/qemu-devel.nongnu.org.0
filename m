Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 108E636024C
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 08:21:38 +0200 (CEST)
Received: from localhost ([::1]:49352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWvNh-00059l-2G
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 02:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lWvHV-000381-56; Thu, 15 Apr 2021 02:15:13 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:53291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lWvHT-0001md-CK; Thu, 15 Apr 2021 02:15:12 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 14C75167C;
 Thu, 15 Apr 2021 02:15:07 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 15 Apr 2021 02:15:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=r4Mx+3aqZ7zErNzEjGmn5z5d09W
 BmsDbI7/mo6H5On8=; b=vBuArKbcHJybk/sfCa7mywVMCYgf3FG7e8AvmMjbDYN
 Du4mZUJApyn1G1E7vIagcTlQf+y6jf1ZOdVjNd2FWvWIK6qeyG8zhkX72JFXJoj/
 nHzs8/6Xb+0YmfeAPCu+ziwUjO9TmLmjjbNxOerZTulAsTpCY8/XWKXNkVvZ7iZm
 WoX+qDI7HSk5q5kQ39zeGpS5cllnjc5RQ1g5lcn1g3sx2tHiRAahI3NTL1N1pj1T
 u/utN29DmVw2LbKSlvTPK6ke9ZFY8Do0dlK1fGGn5LUXag5HuqX3nUf6yYG/kw9I
 RMJmmvCxgGeBL5CcINOy79dCc2M2baqvbaKHYG7CtKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=r4Mx+3
 aqZ7zErNzEjGmn5z5d09WBmsDbI7/mo6H5On8=; b=LY583bt7xpwzMtV/thuu+r
 ezjO70xFGucEs9zT6dTlIvwHTo4jJ3qWGb2FnN4yx7L5i7unwYCkz1anJz/OexMg
 eNFT3vHeJ+uipQ3iezEqQmdykygoPC8+vfMIwESeW6ifdqvE/mgbjwoUMBjDSGeC
 sfncB13BuqReEyNaWqk2bPNxaLZEIl6VJo3chwd2GvqirW9fOk47dv3WNl9lUg5C
 G9kPKkj2kMUnlv6wpzMKJaB5EtANor4VfwUmm9KTBFzQhYDIbWTWwJZGbqR/TRXe
 04KpIHt180BKBw4GHScP8qD3m6RuXZUZBLzDrcXtjr/5+yqlhrOSBzsqiNu2h/ng
 ==
X-ME-Sender: <xms:6dl3YFKBxnMASzy-1-0cOPAT95YO9DnK__ofQV_ZjKa63-xw_djB3g>
 <xme:6dl3YDInb3NLLmDhB_YCUPz3ODl1c4LWNuDnma0aOFuuS9K_OXkDn0sloL3vTC7wt
 1LMnBodSSQqZsoKNGo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudelvddguddtvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgeduffeuieetkeeileekvdeule
 etveejudeileduffefjeegfffhuddvudffkeenucfkphepkedtrdduieejrdelkedrudel
 tdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:6dl3YHEdGOpCQTXlC8hhnWc2tk4XBVwC9ggkz8Li9t0Z4UeLi3QhBg>
 <xmx:6dl3YIkECRoQmBSHtPTlnZXJnP1Ci9hFQxwRI4zfPhEQ7Esfu_60nQ>
 <xmx:6dl3YELx4O1DaCjIz_cWsEl9iWGRI2nwzBzZ96g8ERrl39D_yxXofg>
 <xmx:6tl3YGUjekJT2c9x4VQ4fmW2GYZ4aLU77N5QmXMkhAWQUBevfNnYUw>
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 132DC240065;
 Thu, 15 Apr 2021 02:15:03 -0400 (EDT)
Date: Thu, 15 Apr 2021 08:15:01 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Subject: Re: [PATCH] hw/block/nvme: remove redundant invalid_lba_range trace
Message-ID: <YHfZ5Up1HtpLL8a8@apples.localdomain>
References: <CGME20210414070803epcas5p32e695f55e3421e0af51ba6adfd157cc6@epcas5p3.samsung.com>
 <20210414070435.3702-1-anaidu.gollu@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5OfbyXHeSgoESwSd"
Content-Disposition: inline
In-Reply-To: <20210414070435.3702-1-anaidu.gollu@samsung.com>
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


--5OfbyXHeSgoESwSd
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline

On Apr 14 12:34, Gollu Appalanaidu wrote:
>Currently pci_nvme_err_invalid_lba_range tace being called indvidually
>at each function, add this in nvme_check_bounds and remove redundant
>usage of it.
>
>Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
>---
> hw/block/nvme.c | 9 +--------
> 1 file changed, 1 insertion(+), 8 deletions(-)
>
>diff --git a/hw/block/nvme.c b/hw/block/nvme.c
>index 6842b01ab5..c67d3315a1 100644
>--- a/hw/block/nvme.c
>+++ b/hw/block/nvme.c
>@@ -1424,6 +1424,7 @@ static inline uint16_t nvme_check_bounds(NvmeNamespace *ns, uint64_t slba,
>     uint64_t nsze = le64_to_cpu(ns->id_ns.nsze);
>
>     if (unlikely(UINT64_MAX - slba < nlb || slba + nlb > nsze)) {
>+        trace_pci_nvme_err_invalid_lba_range(slba, nlb, nsze);
>         return NVME_LBA_RANGE | NVME_DNR;
>     }
>
>@@ -2266,7 +2267,6 @@ static void nvme_copy_in_complete(NvmeRequest *req)
>
>     status = nvme_check_bounds(ns, sdlba, ctx->nlb);
>     if (status) {
>-        trace_pci_nvme_err_invalid_lba_range(sdlba, ctx->nlb, ns->id_ns.nsze);
>         goto invalid;
>     }
>
>@@ -2528,8 +2528,6 @@ static uint16_t nvme_dsm(NvmeCtrl *n, NvmeRequest *req)
>             uint32_t nlb = le32_to_cpu(range[i].nlb);
>
>             if (nvme_check_bounds(ns, slba, nlb)) {
>-                trace_pci_nvme_err_invalid_lba_range(slba, nlb,
>-                                                     ns->id_ns.nsze);
>                 continue;
>             }
>
>@@ -2602,7 +2600,6 @@ static uint16_t nvme_verify(NvmeCtrl *n, NvmeRequest *req)
>
>     status = nvme_check_bounds(ns, slba, nlb);
>     if (status) {
>-        trace_pci_nvme_err_invalid_lba_range(slba, nlb, ns->id_ns.nsze);
>         return status;
>     }
>
>@@ -2687,7 +2684,6 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
>
>         status = nvme_check_bounds(ns, slba, _nlb);
>         if (status) {
>-            trace_pci_nvme_err_invalid_lba_range(slba, _nlb, ns->id_ns.nsze);
>             goto out;
>         }
>
>@@ -2816,7 +2812,6 @@ static uint16_t nvme_compare(NvmeCtrl *n, NvmeRequest *req)
>
>     status = nvme_check_bounds(ns, slba, nlb);
>     if (status) {
>-        trace_pci_nvme_err_invalid_lba_range(slba, nlb, ns->id_ns.nsze);
>         return status;
>     }
>
>@@ -2935,7 +2930,6 @@ static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
>
>     status = nvme_check_bounds(ns, slba, nlb);
>     if (status) {
>-        trace_pci_nvme_err_invalid_lba_range(slba, nlb, ns->id_ns.nsze);
>         goto invalid;
>     }
>
>@@ -3015,7 +3009,6 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
>
>     status = nvme_check_bounds(ns, slba, nlb);
>     if (status) {
>-        trace_pci_nvme_err_invalid_lba_range(slba, nlb, ns->id_ns.nsze);
>         goto invalid;
>     }
>

Thanks. Applied to nvme-next!

--5OfbyXHeSgoESwSd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmB32eQACgkQTeGvMW1P
Del9rgf/fVHFl2GHdjW+aLXyz+nVSKm4CeoYE76jUA/TGKPhtK5SCA7/QalYt/1L
3fF6iJn6ASfW8QYUBwoxo0hpNoiOZouNsTo4UvB4G2kaY9lKi8xhT+QcOlw2Byz+
GhDZ1sVBuKTSfdz6sRyNvJBLrN5IYvWU+RrUf5ULqB1rsn+qkS/DxV+bokuNoszK
cIKWTL0ZvKX/PLW5S/p0/R+3VWbNPQVmFCHDt5xVaumHrkwXFKooYIJCfdkP+Jjj
Xuh9jHFz/AkdTRXohcejH54ofLeLA14uv/Ft+g8w4dwAlHlD6JiNXw62RnpW7tYy
ekX5Zd9drhwYj1ZxDZc5t/Rshbj5xA==
=ewpj
-----END PGP SIGNATURE-----

--5OfbyXHeSgoESwSd--

