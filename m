Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F38C38BFDE
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 08:43:49 +0200 (CEST)
Received: from localhost ([::1]:50928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljyst-00008N-To
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 02:43:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1ljyqS-0006GG-Qv
 for qemu-devel@nongnu.org; Fri, 21 May 2021 02:41:17 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:18773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1ljyqP-00047c-Nn
 for qemu-devel@nongnu.org; Fri, 21 May 2021 02:41:16 -0400
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20210521063119epoutp02ed5e299a2bce6dcc7dcefd17f929786b~BATeRj-kN0500505005epoutp02H
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 06:31:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20210521063119epoutp02ed5e299a2bce6dcc7dcefd17f929786b~BATeRj-kN0500505005epoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1621578679;
 bh=PXH/WaCezExRXXU00LdlkX3R6kXqu6iB3Hh+DfhBcnU=;
 h=From:To:Cc:Subject:Date:References:From;
 b=HjVnai1L1S+XBGv15Op6W7K/KBjnV6HXkyLGjDQoOXr1XIoiapD9Ju/T1kzKOwVHA
 86jj9x7G6XX7nG1rwX4Qvv4H3UyCbdcFUOpOlJakhM/wdr9AlxP2plfzT3QS5KaQBl
 mRzFO8nHsVmRHzvqq17pPSktA+OK276WvnQ+XCcA=
Received: from epsmges5p2new.samsung.com (unknown [182.195.42.74]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20210521063116epcas5p264bed2bd28ad59d116fcbcb9ac1e5f64~BATcEcQ110737607376epcas5p2c;
 Fri, 21 May 2021 06:31:16 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 AA.24.09697.4B357A06; Fri, 21 May 2021 15:31:16 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20210521061352epcas5p145b3a19453f7ff9d625bb9ae447b649c~BAEP43ouZ2203522035epcas5p11;
 Fri, 21 May 2021 06:13:52 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210521061352epsmtrp2c89046abb4e5083ea4b8602c4b0d921f~BAEP3p8d70190301903epsmtrp24;
 Fri, 21 May 2021 06:13:52 +0000 (GMT)
X-AuditID: b6c32a4a-64fff700000025e1-63-60a753b476c4
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 35.5D.08637.0AF47A06; Fri, 21 May 2021 15:13:52 +0900 (KST)
Received: from 2030045822.sa.corp.samsungelectronics.net (unknown
 [107.108.221.178]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210521061351epsmtip1dc6f76d6104d46c5fa5735b2b3a324f4~BAEOh1Z8N0673406734epsmtip1p;
 Fri, 21 May 2021 06:13:51 +0000 (GMT)
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/nvme/ctrl: fix functions style
Date: Fri, 21 May 2021 11:38:42 +0530
Message-Id: <20210521060842.25516-1-anaidu.gollu@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRmVeSWpSXmKPExsWy7bCmuu6W4OUJBmeeK1u83nmc2eLK/vOM
 FvsPfmO1mHToGqPFkoupFvNuKVvMetfOZnG8dweLxetJ/1kdOD1+nGtn8zi34zy7x6ZVnWwe
 T65tZvJ4v+8qm0ffllWMAWxRXDYpqTmZZalF+nYJXBnbT0xkL1jDVTF/1km2BsbT7F2MnBwS
 AiYS98/sZ+xi5OIQEtjNKLF3/komCOcTo0TD3r/MEM43RokbDzYCORxgLY/PeELE9zJK/N+6
 jQlklJBAJ5PE7DsBIDabgJHE7LdvGEFsEQFJid9dp5lBbGaQFd/m6oDYwkA15/rvgNWwCKhK
 fH/+HewkXgFbielvD7BBnCcvsXrDAbAjJASOsUscfDuRBSLhIvHz8E9WCFtY4tXxLVD/SEl8
 frcXqJkdyK6WOFwE0drBKHHs8gaomfYS/55NYwT5hVlAU2L9Ln2IsKzE1FPrmCDO5JPo/f2E
 CSLOK7FjHoytJrHg1neoTTISM//chrrAQ+L9g1VskGCIlVi48AnrBEbZWQgbFjAyrmKUTC0o
 zk1PLTYtMMpLLdcrTswtLs1L10vOz93ECE4IWl47GB8++KB3iJGJg/EQowQHs5IIL7fj8gQh
 3pTEyqrUovz4otKc1OJDjNIcLErivCseTk4QEkhPLEnNTk0tSC2CyTJxcEo1MPH3fAzS6BaS
 CVnulf/XXotVp3nG8RO/yji3qCj/Dq2Utpl2+J+P31leibLKE2/KtrmkrtnF+WzRoesX6nd1
 iLNYJ/39OX3/kUIxRZdinxIbG7XUDeeWPhW8MDs8pZTFZ81KxS0uspLqonsuyKyevmjmA6Yw
 zaVeSpKTw23kHd2TNcqLj6RMLV9rvXFXWcRW6+1dL3/2sP3PfxBiIXN4rqTTwcnRoldXnH42
 /VuQc1iyTkafd+/nZ79+95f/vR5qf6S28Yh87JdnJTE/Nu37/qxjUdgd75wtAuf277x4/TMH
 Y+bRC59nyeoot5bfU27WNzmXbpmdt2G5zZPvMf+PS4WKCD5mzFwWvnYD46EeRyWW4oxEQy3m
 ouJEAPgSx4h3AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplluLIzCtJLcpLzFFi42LZdlhJTneB//IEg3lX1S1e7zzObHFl/3lG
 i/0Hv7FaTDp0jdFiycVUi3m3lC1mvWtnszjeu4PF4vWk/6wOnB4/zrWzeZzbcZ7dY9OqTjaP
 J9c2M3m833eVzaNvyyrGALYoLpuU1JzMstQifbsEroztJyayF6zhqpg/6yRbA+Np9i5GDg4J
 AROJx2c8uxi5OIQEdjNKrP5/iqWLkRMoLiPx69RUZghbWGLlv+fsEEXtTBLz329kBEmwCRhJ
 zH77BswWEZCU+N11mhmkiFngKKPE5fbJYJOEgYrO9d8BK2IRUJX4/vw7O4jNK2ArMf3tATaI
 DfISqzccYJ7AyLOAkWEVo2RqQXFuem6xYYFhXmq5XnFibnFpXrpecn7uJkZwiGlp7mDcvuqD
 3iFGJg7GQ4wSHMxKIrzcjssThHhTEiurUovy44tKc1KLDzFKc7AoifNe6DoZLySQnliSmp2a
 WpBaBJNl4uCUamASlBZYHOKjlKQny334SsKtyjNm7zfNPPtZd+ZrpuKrBzWmTxZ/o3e+o3v/
 1QlvcuObutmr2FN43q3d7vB1Hv/H/ngHj83/c6v8jGc/8VB/ZFP01SZUmJ3p67R/i+9EHde9
 8OGq8o1Ypa8Jnod//vE8VnSkv1h0OvdOtosHu0qEAtb7bWP5GMy7a9Z64enxd5g4brMoyH1c
 EcerGBpYNHU135z4acs+ep+8M3m5w4kJL9Z+7t7bUxfrcp5vTofl1h/eJbIeM5kSv/msYZKX
 Wjg5xHMT79PHOhxXOr4ssZga7sEkFzvV3e7K+RO7Fu5adfllHv/xdo7DJQxfpNfVhzGHVD1R
 yA2a1NoYmhg29+UCJZbijERDLeai4kQAK2E6KKACAAA=
X-CMS-MailID: 20210521061352epcas5p145b3a19453f7ff9d625bb9ae447b649c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210521061352epcas5p145b3a19453f7ff9d625bb9ae447b649c
References: <CGME20210521061352epcas5p145b3a19453f7ff9d625bb9ae447b649c@epcas5p1.samsung.com>
Received-SPF: pass client-ip=203.254.224.25;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout2.samsung.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Identify command related functions style fix.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
---
 hw/nvme/ctrl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 0bcaf7192f..40a7efcea9 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4291,7 +4291,7 @@ static uint16_t nvme_identify_ns_attached_list(NvmeCtrl *n, NvmeRequest *req)
 }
 
 static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req,
-        bool active)
+                                     bool active)
 {
     NvmeNamespace *ns;
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
@@ -4326,7 +4326,7 @@ static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req,
 }
 
 static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req,
-        bool active)
+                                     bool active)
 {
     NvmeNamespace *ns;
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
@@ -4373,7 +4373,7 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req,
 }
 
 static uint16_t nvme_identify_nslist_csi(NvmeCtrl *n, NvmeRequest *req,
-        bool active)
+                                         bool active)
 {
     NvmeNamespace *ns;
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
-- 
2.17.1


