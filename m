Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0C0356385
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 07:55:28 +0200 (CEST)
Received: from localhost ([::1]:49844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU19z-0006Ve-4a
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 01:55:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lU11a-00028f-Lc; Wed, 07 Apr 2021 01:46:46 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:59643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lU11Y-00051P-7a; Wed, 07 Apr 2021 01:46:46 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 74C905C00F3;
 Wed,  7 Apr 2021 01:46:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 07 Apr 2021 01:46:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=Crc5lY8+8kAgy
 fg0VFPjqfXIPSIUBFx9BFUoUUZKTVo=; b=Jk0fa0zBANtWbQf+9CxAIZHFDPJmQ
 qYhuUFcEKikNWb1p+DwzxG5bSmtjZ720osjNKfmYFmp1nEcUp1SHzquiHqNfcQy4
 ctofaOZPjN8fsMBOfg4MCSlUychW8Bszy5fcRB0e8gQRwXE6hdSAnC5xfWBTumEx
 DO2t6EnU4cWPt6thO6r295tlwlG1LfpMQeul2+55INFHXz4X1JKDajAvVELl1b/h
 yyJr/UJy1KPSarh3P+HRxPceugNj0TJbIx27W3oFf/iQkgAf3WENMCAXi2+v1MU0
 kI/Usyl1B4+Hdob7GqNcndwVWbPkN15fmQrCL7RbTUf1wqWJDIoGEGPsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Crc5lY8+8kAgyfg0VFPjqfXIPSIUBFx9BFUoUUZKTVo=; b=P2/D8Nw4
 FmL16sKU5bpgrBkQ84i4Ln8lMYxK/EcYBUnfEu24JTkN8GEbY8/Dnk0YzbmGyX/B
 9WGKp9CHQcbRYRoA7g+MK9FtNSy/31FTJjL2fVP7GAc7+BVG3ao6422MBUxiahqs
 tDpeaNt6STiV+DkvU+U0L/n6+NconcLnT0kqHLu+QSdsUsX3prsDeIA9X370uK26
 n0rBzQmz8v0pSlj7U8N8P+1pO60lCuJzUMmFlVvktiICB96BZqp8SQ9SdnTVN1a9
 IyXdFa2c6FoXvL+icWRUBrBKR0w8cwR2PcQxDX51E/TDKdkd0/fBOpYv44yVl162
 sCpxHqU9bSstoQ==
X-ME-Sender: <xms:Q0dtYKt8jaxyqwlOssSVhq6zhIcLtdzlXMGdC1x-coFZuFO_vmBC-Q>
 <xme:Q0dtYI7sJHuVmuKYe1aAY3e-XcHJ7yVQU8qRojle4I_Rk1lhGS0tHYYM7dyVuwOI9
 yj7ha8ML5acYIPnhuo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejiedguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepvd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:Q0dtYFWaviABFxJrKQbh8JXt527DlXVw1EWLDa1JDtCDyjtgoEPb1w>
 <xmx:Q0dtYK8nF7TML4PII9u0AK-95I7hyGBFKm25QOmuNHOO8vA7o_cL4A>
 <xmx:Q0dtYBkGBO6X3tzotjV74F-XLl-KZyh0bLIVw1DUsx1BRXMWytk97g>
 <xmx:Q0dtYII5Ncj1mhKlj1CBE_nCEek0yqwU1TOSuzMqo-SYm8eqk5h_lg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2650D108005F;
 Wed,  7 Apr 2021 01:46:42 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PULL for-6.0 v2 03/10] hw/block/nvme: fix the nsid 'invalid' value
Date: Wed,  7 Apr 2021 07:46:28 +0200
Message-Id: <20210407054635.189440-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210407054635.189440-1-its@irrelevant.dk>
References: <20210407054635.189440-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The `nvme_nsid()` function returns '-1' (FFFFFFFFh) when the given
namespace is NULL. Since FFFFFFFFh is actually a valid namespace
identifier (the "broadcast" value), change this to be '0' since that
actually *is* the invalid value.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme-ns.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index 9ab7894fc83e..82340c4b2574 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -96,7 +96,7 @@ static inline uint32_t nvme_nsid(NvmeNamespace *ns)
         return ns->params.nsid;
     }
 
-    return -1;
+    return 0;
 }
 
 static inline bool nvme_ns_shared(NvmeNamespace *ns)
-- 
2.31.1


