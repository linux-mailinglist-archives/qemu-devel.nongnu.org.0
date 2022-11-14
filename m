Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE20628E7E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:37:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oujB0-0001Re-H8; Mon, 14 Nov 2022 18:47:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <j.granados@samsung.com>)
 id 1ouifG-00039s-0W
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:14:54 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <j.granados@samsung.com>)
 id 1ouZv1-000826-ST
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 08:54:47 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20221114135429euoutp027dc2b4a5f8006258b32069c4b5d46a63~nd-It66JE0551305513euoutp02Q
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 13:54:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20221114135429euoutp027dc2b4a5f8006258b32069c4b5d46a63~nd-It66JE0551305513euoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1668434069;
 bh=FpL2SdcOPTGCpkLrCwzoyO4Cb+Y+WVVFyQmEBREwVjg=;
 h=From:To:CC:Subject:Date:In-Reply-To:References:From;
 b=CDa81j/It4G435vp4T3eoRMMvoLPApkJwuaaBGAWvSRB+00B6H+k5TfxvoPi3pCiD
 rd01jgffCelEi/EnCU5kVtyUuE/YTrcEFRaszzpNYOTPuD9gCyEoPMoWE1sFErw0g3
 fSoO2yPY7Frj+whlXyQky39E5WBDiS+J+SS8NZ2Y=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20221114135428eucas1p1bb3b0d42a2f653185be196be0177c4eb~nd-ImtZBu2218122181eucas1p1k;
 Mon, 14 Nov 2022 13:54:28 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id EE.28.10112.49842736; Mon, 14
 Nov 2022 13:54:28 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20221114135428eucas1p194fe5bc5c35783e4340ea89ebf4325fb~nd-IUe3WA2219722197eucas1p1z;
 Mon, 14 Nov 2022 13:54:28 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20221114135428eusmtrp23bd2b15f8be18bf3e2bd6cf2bb3b2b58~nd-IT3eQW0116501165eusmtrp2A;
 Mon, 14 Nov 2022 13:54:28 +0000 (GMT)
X-AuditID: cbfec7f4-d09ff70000002780-32-6372489432a9
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id A7.D3.08916.49842736; Mon, 14
 Nov 2022 13:54:28 +0000 (GMT)
Received: from CAMSVWEXC01.scsc.local (unknown [106.1.227.71]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20221114135428eusmtip129dc322c677928272c09275bfe79ed97~nd-III56D2870628706eusmtip1z;
 Mon, 14 Nov 2022 13:54:28 +0000 (GMT)
Received: from localhost (106.110.32.33) by CAMSVWEXC01.scsc.local
 (2002:6a01:e347::6a01:e347) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 14 Nov 2022 13:54:27 +0000
From: Joel Granados <j.granados@samsung.com>
To: <k.jensen@samsung.com>, <qemu-devel@nongnu.org>, <qemu-block@nongnu.org>
CC: Joel Granados <j.granados@samsung.com>
Subject: [PATCH v2 2/3] nvme: Add ocp to the subsys
Date: Mon, 14 Nov 2022 14:50:42 +0100
Message-ID: <20221114135043.2958100-3-j.granados@samsung.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221114135043.2958100-1-j.granados@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [106.110.32.33]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOIsWRmVeSWpSXmKPExsWy7djP87pTPIqSDbZ/MrKY9a6dzeJ47w4W
 ByaPJ9c2MwUwRnHZpKTmZJalFunbJXBlfNq5mqXgLmfFtxlTWRoYX7N3MXJySAiYSJzsb2Ts
 YuTiEBJYwSjx/fY2NgjnC6PEt75+qMxnRom1F/azwLQ0936HqlrOKHHgwxuEqhXzbkI5mxkl
 jt4CKePkYBPQkTj/5g4ziC0i4COxYvZaJhCbWUBL4sbnI4wgtrCAscT+1k9gNouAqkTbwTtg
 F/IK2EpsubiYFWK1vETb9elgNZwCdhJnf2+BqhGUODnzCQvETHmJ5q2zmSFsCYmDL14wQ/Qq
 SmyZ8x1qTq3E2mNn2EEOlRBYyCHRsOEwE0TCRWLCpj9QtrDEq+NboMEkI/F/53yoeLbEzim7
 oIYWSMw6ORXoSQ4g21qi70wORNhRovNJDzNEmE/ixltBiHP4JCZtmw4V5pXoaBOawKgyC8kD
 s5A8MAvJAwsYmVcxiqeWFuempxYb5aWW6xUn5haX5qXrJefnbmIEpoXT/45/2cG4/NVHvUOM
 TByMhxglOJiVRHjnyeQnC/GmJFZWpRblxxeV5qQWH2KU5mBREudlm6GVLCSQnliSmp2aWpBa
 BJNl4uCUamCK+le9VeylxsGJmy5dqH7tvG9NiWD10SmXFKwOvxZo2Kix7dNLjXtpIUc+1x1V
 Cld5uOi0alen8w8zt5XuAatZWfquLczYbnTk9U0Px1yf9AMvWE4cEXd7w9uWf3DpncYTEamH
 bm79n3zx0870p+adO5bsvBdtuFT/3HeP+oyOeot0jdl6GdUlDS0G1QKh2TdfCyl1njr4iaPa
 ZIJpMtMU2TM+l2Rr9a/6Sd7se1Ic9sn2u1J8XHSl0M+FFkm2MkISJcUvb2qf6a+dPmd1WEf1
 ctb3gS+KZJ+eUey6a6qwTrxmdvvjUwUWyztmq7hHJm3NXOybpOtYzHsxWL6C95b7pPMcgQHT
 C2rbrz9yiFRiKc5INNRiLipOBADQJ+MQegMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIIsWRmVeSWpSXmKPExsVy+t/xu7pTPIqSDZ5OkLWY9a6dzeJ47w4W
 ByaPJ9c2MwUwRunZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJal
 FunbJehlfNq5mqXgLmfFtxlTWRoYX7N3MXJySAiYSDT3fmfrYuTiEBJYyijx4vl3VoiEjMSn
 Kx+hioQl/lzrgir6yCjRvHIvC4SzmVFi9Z5VjCBVbAI6Euff3GEGsUUEfCRWzF7LBGIzC2hJ
 3Ph8BKxGWMBYYn/rJzCbRUBVou3gHbANvAK2ElsuLobaLC/Rdn06WA2ngJ3E2d9bwGqEQGru
 72KGqBeUODnzCQvEfHmJ5q2zmSFsCYmDL14wQ8xRlNgyB+abWolX93czTmAUmYWkfRaS9llI
 2hcwMq9iFEktLc5Nzy021CtOzC0uzUvXS87P3cQIjJttx35u3sE479VHvUOMTByMhxglOJiV
 RHjnyeQnC/GmJFZWpRblxxeV5qQWH2I0BfpzIrOUaHI+MHLzSuINzQxMDU3MLA1MLc2MlcR5
 PQs6EoUE0hNLUrNTUwtSi2D6mDg4pRqY2va9FjnGMu+gdWuwF+9lsf3TWHbMmhOc/u3wgyfy
 n5v67XP2i95WTEm9sVPqjov0Bicb5puGq3tfXcnem5MTwao5cfdCQbPeyX8u+htdE7iVFO1o
 dLr836FZL01mNF3Puh2xe9lvj90/VydlHj771XvpyaOO1mdDL3T/f/rL1n7Rjkvbn3X+cfLS
 6tdu/pD8OCfydtVtQ65NKZV+Urv/8rU0b1RUD+OXZP1/19orhFX2Y3C26eEV2XFder8vrQ3o
 PMQot/Ukb/O5Nh3dNbs5RQVvekqt/3EzXfnyK/Z/9Z3MjIwBFx6uyWKeNCvkbdvvB9n7Eh3n
 KX2V+FnGfttk1YG2iR/rNjp/0Xv1w7C+RImlOCPRUIu5qDgRAKXXHKEkAwAA
X-CMS-MailID: 20221114135428eucas1p194fe5bc5c35783e4340ea89ebf4325fb
X-Msg-Generator: CA
X-RootMTR: 20221114135428eucas1p194fe5bc5c35783e4340ea89ebf4325fb
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221114135428eucas1p194fe5bc5c35783e4340ea89ebf4325fb
References: <20221114135043.2958100-1-j.granados@samsung.com>
 <CGME20221114135428eucas1p194fe5bc5c35783e4340ea89ebf4325fb@eucas1p1.samsung.com>
Received-SPF: pass client-ip=210.118.77.12;
 envelope-from=j.granados@samsung.com; helo=mailout2.w1.samsung.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 14 Nov 2022 18:47:40 -0500
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The Open Compute Project defines a Datacenter NVMe SSD Spec that sits on
top of the NVMe spec. Additional commands and NVMe behaviors specific for
the Datacenter. This is a preparation patch that introduces an argument to
activate OCP in nvme.

Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 hw/nvme/nvme.h   | 1 +
 hw/nvme/subsys.c | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 79f5c281c2..aa99c0c57c 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -56,6 +56,7 @@ typedef struct NvmeSubsystem {
 
     struct {
         char *nqn;
+        bool ocp;
     } params;
 } NvmeSubsystem;
 
diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
index 9d2643678b..ecca28449c 100644
--- a/hw/nvme/subsys.c
+++ b/hw/nvme/subsys.c
@@ -129,8 +129,8 @@ static void nvme_subsys_realize(DeviceState *dev, Error **errp)
 
 static Property nvme_subsystem_props[] = {
     DEFINE_PROP_STRING("nqn", NvmeSubsystem, params.nqn),
-    DEFINE_PROP_END_OF_LIST(),
-};
+    DEFINE_PROP_BOOL("ocp", NvmeSubsystem, params.ocp, false),
+    DEFINE_PROP_END_OF_LIST(), };
 
 static void nvme_subsys_class_init(ObjectClass *oc, void *data)
 {
-- 
2.30.2


