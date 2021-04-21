Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A94883678A7
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 06:25:40 +0200 (CEST)
Received: from localhost ([::1]:34746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZQuJ-0004Mz-OK
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 00:25:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lZQsO-0002aD-21
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:23:40 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:47613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lZQsK-0000w7-AS
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:23:39 -0400
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20210422042323epoutp04503804667bc68b33b0b05698a1854324~4E2f7-MUt0255102551epoutp04C
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 04:23:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20210422042323epoutp04503804667bc68b33b0b05698a1854324~4E2f7-MUt0255102551epoutp04C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1619065403;
 bh=exHMvKF1rAIy2NEieBkMVqTvC8k/5NeP5xWv09SPAWk=;
 h=From:To:Cc:Subject:Date:References:From;
 b=p0TSwWL4gpRNC/4Crsn6gbSJxLAq+ktLBNjgy277Y0jk3T8EIF/8Z5RfC4SH1YVIA
 tFx10Tg5km2oyMbmZ3TwS6EXyPg0Eyal6KltxDBi9PbwBOHVfR5Der8YtMWFIyNmEz
 hwGrNWStzagKAsFOOU9fZjduAN1cACAsIyi2t+cM=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20210422042322epcas5p3bd1157be3b1c61a63230c2f29772f946~4E2filGRA1148711487epcas5p3e;
 Thu, 22 Apr 2021 04:23:22 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 79.05.09835.A3AF0806; Thu, 22 Apr 2021 13:23:22 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20210421125941epcas5p175aede7ce4b56ac001693172e58dded4~34QAqt9bp1422114221epcas5p1C;
 Wed, 21 Apr 2021 12:59:41 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210421125941epsmtrp1c21745bf478b3e6ab349246ac13beaf9~34QAp8yCC3228832288epsmtrp1L;
 Wed, 21 Apr 2021 12:59:41 +0000 (GMT)
X-AuditID: b6c32a4b-7c9ff7000000266b-d5-6080fa3aa193
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 26.E4.08637.DB120806; Wed, 21 Apr 2021 21:59:41 +0900 (KST)
Received: from 2030045822.sa.corp.samsungelectronics.net (unknown
 [107.99.42.33]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210421125940epsmtip25ddf21f985d148cf94f9fc2910d6bbd0~34P-WHB9j1193711937epsmtip2m;
 Wed, 21 Apr 2021 12:59:40 +0000 (GMT)
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/block/nvme: add id ns flbas enum
Date: Wed, 21 Apr 2021 18:26:46 +0530
Message-Id: <20210421125646.13058-1-anaidu.gollu@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIIsWRmVeSWpSXmKPExsWy7bCmhq7Vr4YEg4OdBhavdx5ntriy/zyj
 xf6D31gtJh26xmix5GKqxbxbyhaz3rWzWRzv3cFi8XrSf1YHTo8f59rZPM7tOM/usWlVJ5vH
 k2ubmTze77vK5tG3ZRVjAFsUl01Kak5mWWqRvl0CV8a+J5fZC64LVPzvO8rWwLiHt4uRk0NC
 wETix7MONhBbSGA3o0TPTKEuRi4g+xOjxNRtmxkhnG+MEudv72TtYuQA61h3WRoivpdRovvh
 HSYIp41J4sOLq8wgo9gEjCRmv33DCGKLCEhK/O46DRZnBlnxba4OiC0sYCHRvvoXWA2LgKrE
 ve8/WEFsXgFbiZtfVrFBnCcvsXrDAWYI+xi7xKJpvhBHuEicOJwHERaWeHV8CzuELSXxsr8N
 yGYHsqslDheBXCYh0MEocezyBqiJ9hL/nk1jBJnCLKApsX6XPkRYVmLqqXVMEEfySfT+fsIE
 EeeV2DEPxlaTWHDrO9QmGYmZf26zQtgeEq1X/rOAjBQSiJWY8aF+AqPsLIQFCxgZVzFKphYU
 56anFpsWGOellusVJ+YWl+al6yXn525iBKcCLe8djI8efNA7xMjEwXiIUYKDWUmEd21xQ4IQ
 b0piZVVqUX58UWlOavEhRmkOFiVxXkHn6gQhgfTEktTs1NSC1CKYLBMHp1QD0wWhdtFTaZNF
 r62MLTLh2r31ye8I5wNK5RfWr+fr7OkOMcrUitly0mj61R9hc4NCkz++0p+tPvVo3qMdd8N1
 nPevYpUpqmffsaBE2Gheyq69ht/Pu15//duhoUzs//eKuEc9c85ufRCqF3s8cJnDm/kV4oH8
 Aq/+Pk08eFCre9vO+WUZ+06891BaLG5/Yv1C13W+PvtPHJW4+Pf5DcEZs3baniteaBjl+WiP
 g+akOylV8l/THG+zfWa+Wtj4ZvO2zZJmJw9qfpu1Pi+xbPpJ1r5pEySK3R+4eR7QmqzMejU4
 nmVNNc/h1NtlT160LvQWnbm9P9oq0FBw6WnXzY+fVbsGXfv2MzNNapHNrdJJ4oeUWIozEg21
 mIuKEwF6UfCjdAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplluLIzCtJLcpLzFFi42LZdlhJXnevYkOCwd/pBhavdx5ntriy/zyj
 xf6D31gtJh26xmix5GKqxbxbyhaz3rWzWRzv3cFi8XrSf1YHTo8f59rZPM7tOM/usWlVJ5vH
 k2ubmTze77vK5tG3ZRVjAFsUl01Kak5mWWqRvl0CV8a+J5fZC64LVPzvO8rWwLiHt4uRg0NC
 wERi3WXpLkYuDiGB3YwS125tYe1i5ASKy0j8OjWVGcIWllj57zk7RFELk8TyNe8ZQRJsAkYS
 s9++AbNFBCQlfnedZgYpYhY4yihxuX0yC0hCWMBCon31L7AiFgFViXvff4Bt4BWwlbj5ZRUb
 xAZ5idUbDjBPYORZwMiwilEytaA4Nz232LDAMC+1XK84Mbe4NC9dLzk/dxMjOMS0NHcwbl/1
 Qe8QIxMH4yFGCQ5mJRHe+7U1CUK8KYmVValF+fFFpTmpxYcYpTlYlMR5L3SdjBcSSE8sSc1O
 TS1ILYLJMnFwSjUw+TgpHOi5sF7nx+6ZWu2hynUuF042Nb47Lh23rPfbvgsyaRqdBlnLU63O
 vfLUiC9JuGIcnPs4p+g8d5jZnq75G1RsGmYV735r8c8x0emms4v+nF6HRmUFSyFPTu0Z8Xvy
 N1huKK7t35enxqX+bMaru/qfwoQ+8PFsymy+tDlv28ndnA8SrjPunzz7bbKuhNlHxaj70lvc
 FnZ+Mot6ldg+JZFPfNsst5CVN27M+XYlZsaT7plNBwJnxK5zn30w8Pp6Lqlz7TePPS41f3X8
 8eQpCdd7drdHVZUGTm77vsojpfxbmu+PvXX7xNqDSir/Vrrwvboovzny/as3ey5ujT1w/NlF
 wa7vV0yFH/s7PPwpo8RSnJFoqMVcVJwIAEgk9QSgAgAA
X-CMS-MailID: 20210421125941epcas5p175aede7ce4b56ac001693172e58dded4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210421125941epcas5p175aede7ce4b56ac001693172e58dded4
References: <CGME20210421125941epcas5p175aede7ce4b56ac001693172e58dded4@epcas5p1.samsung.com>
Received-SPF: pass client-ip=203.254.224.34;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout4.samsung.com
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

Add the Identify Namespace FLBAS related enums and remove
NVME_ID_NS_FLBAS_EXTENDEND macro its being used in only
one place and converted into enum.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
---
 hw/block/nvme-ns.c   | 2 +-
 hw/block/nvme-ns.h   | 2 +-
 include/block/nvme.h | 5 ++++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index ae56142fcd..9065a7ae99 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -88,7 +88,7 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
     id_ns->mc = 0x3;
 
     if (ms && ns->params.mset) {
-        id_ns->flbas |= 0x10;
+        id_ns->flbas |= NVME_ID_NS_FLBAS_EXTENDEND;
     }
 
     id_ns->dpc = 0x1f;
diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index fb0a41f912..5aa36cd1d2 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -134,7 +134,7 @@ static inline size_t nvme_m2b(NvmeNamespace *ns, uint64_t lba)
 
 static inline bool nvme_ns_ext(NvmeNamespace *ns)
 {
-    return !!NVME_ID_NS_FLBAS_EXTENDED(ns->id_ns.flbas);
+    return ns->id_ns.flbas & NVME_ID_NS_FLBAS_EXTENDEND;
 }
 
 /* calculate the number of LBAs that the namespace can accomodate */
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 4ac926fbc6..1d61030756 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1321,7 +1321,6 @@ typedef struct QEMU_PACKED NvmeIdNsZoned {
 
 #define NVME_ID_NS_NSFEAT_THIN(nsfeat)      ((nsfeat & 0x1))
 #define NVME_ID_NS_NSFEAT_DULBE(nsfeat)     ((nsfeat >> 2) & 0x1)
-#define NVME_ID_NS_FLBAS_EXTENDED(flbas)    ((flbas >> 4) & 0x1)
 #define NVME_ID_NS_FLBAS_INDEX(flbas)       ((flbas & 0xf))
 #define NVME_ID_NS_MC_SEPARATE(mc)          ((mc >> 1) & 0x1)
 #define NVME_ID_NS_MC_EXTENDED(mc)          ((mc & 0x1))
@@ -1341,6 +1340,10 @@ enum NvmeIdNsDps {
     NVME_ID_NS_DPS_FIRST_EIGHT = 8,
 };
 
+enum NvmeIdNsFlbas {
+    NVME_ID_NS_FLBAS_EXTENDEND  = 1 << 4,
+};
+
 #define NVME_ID_NS_DPS_TYPE(dps) (dps & NVME_ID_NS_DPS_TYPE_MASK)
 
 typedef struct NvmeDifTuple {
-- 
2.17.1


