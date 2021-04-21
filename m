Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9630A3678B7
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 06:29:54 +0200 (CEST)
Received: from localhost ([::1]:53936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZQyP-0003uM-MB
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 00:29:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lZQtB-0003BX-J4
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:24:29 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:10243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lZQt1-0001QB-Bx
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:24:29 -0400
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20210422042414epoutp03c12fc77a320a9442f47853c9011be39a~4E3P8JrXy0489004890epoutp03b
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 04:24:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20210422042414epoutp03c12fc77a320a9442f47853c9011be39a~4E3P8JrXy0489004890epoutp03b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1619065454;
 bh=fROmkLgYGL0juDVZgCKTruASlHyWLjHogHvnuUCi49g=;
 h=From:To:Cc:Subject:Date:References:From;
 b=FyThUPaoCil8Vh6OlCw250pe5PUZzJznz5ug8ggj1wsf0RcO7XNvpnGGeYTG0/qHz
 Rfui3c9Mkw3nx3WQqPkb8YZrBnsrKm2SeycPAiN3aympv9PzPeFrP6ZfJchVscC7ws
 g4AznzRhhVNXkWHrae1gydQIaiVv9u/s8T9B5eZ4=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20210422042414epcas5p22459c62489b762a4f1e21faf84bdaa70~4E3PnCf8S1269612696epcas5p2z;
 Thu, 22 Apr 2021 04:24:14 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 9E.25.09835.E6AF0806; Thu, 22 Apr 2021 13:24:14 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20210421130551epcas5p4b62b0625aee2fa4efc07a78f33751aa0~34VYqAkTE0567705677epcas5p4c;
 Wed, 21 Apr 2021 13:05:51 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210421130551epsmtrp16fa21d119929774f7232000960c27f3a~34VYpP4TN0237402374epsmtrp1s;
 Wed, 21 Apr 2021 13:05:51 +0000 (GMT)
X-AuditID: b6c32a4b-7c9ff7000000266b-59-6080fa6e695e
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 B3.D4.08163.F2320806; Wed, 21 Apr 2021 22:05:51 +0900 (KST)
Received: from 2030045822.sa.corp.samsungelectronics.net (unknown
 [107.99.42.33]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210421130549epsmtip2b5b26d3770e8bc2c2c2b2cf380eca2bb~34VXTMzLT1859818598epsmtip2F;
 Wed, 21 Apr 2021 13:05:49 +0000 (GMT)
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw/block/nvme: add id ns metadata cap (mc) enum
Date: Wed, 21 Apr 2021 18:32:29 +0530
Message-Id: <20210421130229.13806-1-anaidu.gollu@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsWy7bCmlm7er4YEgz0TJSxe7zzObHFl/3lG
 i/0Hv7FaTDp0jdFiycVUi3m3lC1mvWtnszjeu4PF4vWk/6wOnB4/zrWzeZzbcZ7dY9OqTjaP
 J9c2M3m833eVzaNvyyrGALYoLpuU1JzMstQifbsErowDa7axFWzjrPh96z5jA+MJ9i5GDg4J
 AROJE4uUuhi5OIQEdjNKbDv4ixnC+cQoceHSIpYuRk4g5zOjxNQXdSA2SEP77pdMEEW7GCWu
 Pl7JAuG0MUkc3/6AFaSKTcBIYvbbN4wgtoiApMTvrtPMIDYzyI5vc3VAbGEBF4k77/eB1bAI
 qErMWNTDBGLzCtgCDf3EBLFNXmL1hgNgJ0kIHGKX+Dt5JitEwkXi9J8nULawxKvjW9ghbCmJ
 l/1tQDY7kF0tcbgIorWDUeLY5Q1sECX2Ev+eTWMEeZ9ZQFNi/S59iLCsxNRT65ggzuST6P39
 BOoEXokd82BsNYkFt75DbZKRmPnnNiskFD0k9jy1gIRVrETL198sExhlZyEsWMDIuIpRMrWg
 ODc9tdi0wDgvtVyvODG3uDQvXS85P3cTIzgdaHnvYHz04IPeIUYmDsZDjBIczEoivGuLGxKE
 eFMSK6tSi/Lji0pzUosPMUpzsCiJ8wo6VycICaQnlqRmp6YWpBbBZJk4OKUamJJeeebctTo9
 fZfcQR6L+t83J+rkX0kzPBs2XYOlZfrZOXs2q+qbrn53csuHnTFz/wpfCGUxnf30dHXlTyPz
 7C0zWn/kPsvnPMKv6/rLZ+/7nqjAyaWrw6qkGzfo2ef0uQWFr3D558p529PlaPaObLWXqeIB
 fNML/RnWXg7ScWk7+GPtiRppsaRsgdceAaxHWLxDum7OFLJ4maF96KD3u/CG9Pv7uFeYfBNU
 e/xNPvlF7vHUxOcdk35N/cCsnms+S6zCtGlZQZJLj96c2RlrWG6fknk0625ueq2y5ZncHm5Z
 ycyUmik9eZt4XmT8fcsSaaUnZhaQbLqhg99tku78Wy4606e9lpmmdEBwcmesEktxRqKhFnNR
 cSIATwhc8HYDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplluLIzCtJLcpLzFFi42LZdlhJXldfuSHBYNJjNovXO48zW1zZf57R
 Yv/Bb6wWkw5dY7RYcjHVYt4tZYtZ79rZLI737mCxeD3pP6sDp8ePc+1sHud2nGf32LSqk83j
 ybXNTB7v911l8+jbsooxgC2KyyYlNSezLLVI3y6BK+PAmm1sBds4K37fus/YwHiCvYuRk0NC
 wESiffdLJhBbSGAHo8Sb3U4QcRmJX6emMkPYwhIr/z0HqucCqmlhkuif3QrWwCZgJDH77RtG
 EFtEQFLid9dpZpAiZoGjjBKX2yezgCSEBVwk7rzfB1bEIqAqMWNRD1gzr4CtxNXHn5ggNshL
 rN5wgHkCI88CRoZVjJKpBcW56bnFhgVGeanlesWJucWleel6yfm5mxjBIaaltYNxz6oPeocY
 mTgYDzFKcDArifDer61JEOJNSaysSi3Kjy8qzUktPsQozcGiJM57oetkvJBAemJJanZqakFq
 EUyWiYNTqoHpiIOM5I5DXIYfZ0/6ffK2ttbjF94/U3z51t/Z9pyB3WeG/mKeZW/3XF8af/T/
 KtFVjw0C1v2N8ZF7eeLo+SLpt5eWp27eYfEjq9Uun/taw8fTW8I753vOdLj9c33xjCsf93F0
 Cu692saptv0TY2rKnJ5JBVF87yNyF/ib7F56Tb6nt37/ayOpekb58Nz4GdNKLrwNzun5+0hm
 j7d9du3FKyHrrqq8t3Erivr872bh1CnRk5pqznxUe8dsk72225VhY7/HNM227X7xFzPeMm7k
 npks8+7G5Oki5c+n5Ezu+R55yvTTubNK2aY7eE+VKxR73T90cF+25U2vCRsNWC4KXHcSCm68
 n2QW8NWI2Z2rS4mlOCPRUIu5qDgRAPBZmKOgAgAA
X-CMS-MailID: 20210421130551epcas5p4b62b0625aee2fa4efc07a78f33751aa0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210421130551epcas5p4b62b0625aee2fa4efc07a78f33751aa0
References: <CGME20210421130551epcas5p4b62b0625aee2fa4efc07a78f33751aa0@epcas5p4.samsung.com>
Received-SPF: pass client-ip=203.254.224.33;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout3.samsung.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, mreitz@redhat.com,
 its@irrelevant.dk, stefanha@redhat.com, kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add Idnetify Namespace Metadata Capablities (MC) enum.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
---
 hw/block/nvme-ns.c   | 2 +-
 include/block/nvme.h | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 9065a7ae99..db75302136 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -85,7 +85,7 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
     ds = 31 - clz32(ns->blkconf.logical_block_size);
     ms = ns->params.ms;
 
-    id_ns->mc = 0x3;
+    id_ns->mc = NVME_ID_NS_MC_EXTENDED | NVME_ID_NS_MC_SEPARATE;
 
     if (ms && ns->params.mset) {
         id_ns->flbas |= NVME_ID_NS_FLBAS_EXTENDEND;
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 1d61030756..a3b610ba86 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1344,6 +1344,11 @@ enum NvmeIdNsFlbas {
     NVME_ID_NS_FLBAS_EXTENDEND  = 1 << 4,
 };
 
+enum NvmeIdNsMc {
+    NVME_ID_NS_MC_EXTENDED      = 1 << 0,
+    NVME_ID_NS_MC_SEPARATE      = 1 << 1,
+};
+
 #define NVME_ID_NS_DPS_TYPE(dps) (dps & NVME_ID_NS_DPS_TYPE_MASK)
 
 typedef struct NvmeDifTuple {
-- 
2.17.1


