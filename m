Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3CC33E102
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 23:00:36 +0100 (CET)
Received: from localhost ([::1]:55906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMHju-00086o-T6
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 18:00:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lMHXl-0006q7-GM; Tue, 16 Mar 2021 17:48:02 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:36441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lMHXj-0000tW-Ux; Tue, 16 Mar 2021 17:48:01 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 06B875C00DC;
 Tue, 16 Mar 2021 17:47:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 16 Mar 2021 17:47:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=iAi3qmkcqzM56
 LB69+5lI6StgzEvbzX2I5PvFLGx1IM=; b=riHQgwbsTp2x2FmnEkV80+pa7Z6cG
 GFDV01GjTRtnj81bsUSHbiIQ/e7e/ijZLuvANZL5dCs8W20OvFBIyw39a9PBs41u
 8ukPQa1yPzrHP/O5OztJydqmw7KwXkvP/TYgivznG5qk5uwdXvbkjnYX1fxDAScJ
 EH4GbqsOewMZdKw77zmAsF5nyIefTet3vitLAPqNrys3/0h6Xe4JkaAhW9Vxia3Z
 nRAcTDDKiycpE8Mm0tekQGeIs5qLpgG4p6ecHDDU4mbo9gSBzXhAKYCUmNMF2z/n
 AC84JoFGRFhx+yAmdTl2CfLYH7PYfYCe15pHCEzayszfIZDblotQpcVRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=iAi3qmkcqzM56LB69+5lI6StgzEvbzX2I5PvFLGx1IM=; b=WErqX+CJ
 KuttYkO+zogQSavXoCG3DKBx0XnZ/+UFqhgUStsgDl1SNkUOgR1GFRFAgwRntMiz
 0GJzREgFuKQV4/rq+t7H17QSje3ICD386Ba6a425ZXEg38N3kVxhPavTmtyjzj/z
 wKsn0Gs2/3YOBbs6qFvk7/i6BNXUzcAMhdIpcQGvxn/aUIF7OeK0pMPBsalrIwZm
 zrZ1Mbw6otd0P1kGBRhY9dDtbBrQ/fMYH1a9ItAcStfKwtQ57QlNJsy+W4AmzpL0
 6r8a8258+lIzBcD5Y9gCxo2PQ5buwu+gTDKWJVxgsZA155qeZT33WasW4CAufVdK
 wwr+Eywo9y0Mlg==
X-ME-Sender: <xms:jidRYBqGOx31aTAr5iUWEYmJ7LmyCAl7E5E07Ae_ahthYCRNQsbxZQ>
 <xme:jidRYBeD6_EOyJRAH9QL3_GTTq67LPU09qWVsvoOhmJ-XwRUwMzakVllGZfN1XxIh
 VU1kBZ06j5hs9Pmjew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefvddgudehhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:jidRYIqwghEaWeVqq_t7OLYRrTvFN1czLfUWJ5Y2mAs_tTiDlCDTbA>
 <xmx:jidRYKF0D5nMD-t868K0EYiSvelMjBrZzFlqQb5MALYHw8g48eZMew>
 <xmx:jidRYAtitLgezxZ5DEEjoGYJJjsDfd9JKIbDiZSiw18COOIQDnhoIw>
 <xmx:jydRYFHwUde6HThVDDtqPYGiAS6GPGNvW2Yth4CJXUUEhDtp5zOhUw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1ED831080064;
 Tue, 16 Mar 2021 17:47:57 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 01/11] hw/block/nvme: fix potential overflow
Date: Tue, 16 Mar 2021 22:47:43 +0100
Message-Id: <20210316214753.399389-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210316214753.399389-1-its@irrelevant.dk>
References: <20210316214753.399389-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

page_size is a uint32_t, and zasl is a uint8_t, so the expression
`page_size << zasl` is done using 32-bit arithmetic and might overflow.
Since we then compare this against a 64 bit data_size value, Coverity
complains that we might overflow unintentionally. An MDTS/ZASL value in
excess of 4GiB is probably impractical, but it is not entirely
unrealistic, so add a cast such that we handle that case properly.

Fixes: 578d914b263c ("hw/block/nvme: align zoned.zasl with mdts")
Fixes: CID 1450756
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index d439e44db839..0d9b980151ae 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -2188,7 +2188,8 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
                 goto invalid;
             }
 
-            if (n->params.zasl && data_size > n->page_size << n->params.zasl) {
+            if (n->params.zasl &&
+                data_size > (uint64_t)n->page_size << n->params.zasl) {
                 trace_pci_nvme_err_zasl(data_size);
                 return NVME_INVALID_FIELD | NVME_DNR;
             }
-- 
2.30.1


