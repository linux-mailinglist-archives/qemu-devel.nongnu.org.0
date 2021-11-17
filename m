Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CFC454E89
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 21:28:36 +0100 (CET)
Received: from localhost ([::1]:48376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnRXn-0005VD-Ec
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 15:28:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1mnRWg-0004Uh-8K; Wed, 17 Nov 2021 15:27:26 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:9456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lagarcia@linux.ibm.com>)
 id 1mnRWd-0005r6-3z; Wed, 17 Nov 2021 15:27:24 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AHKKFQl012530; 
 Wed, 17 Nov 2021 20:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=NIBi4jF1VK6z37od7rVpIijzWUJMjOWXlHgGcODU7Jc=;
 b=cmEwyORKNc3tKQI5SbNaotN0FAtEX56MNXHNBeNRzqzveXx0MUR8c4z61Kza2QGSW/GI
 ouSBSZFzdlLPSrP50YJTEZRNp3y+TtTp77+2oUppufO/F7VBWt41y2JSdnjyL/yjn083
 SbfdpdpbHQcvPhRb6Ge0ke/x02oZ/AfsOBEILutk5buJegzcGv37qHh/JhB1BK3J6OT5
 CvCUo7zUuz6/4m/vpJfVkXtUIsSFSNUllDT9dPK8pCa5QQ9Sl97yMzEQFgxhCsQTJW/z
 rVndBtKpesICio+9ADM3oq6qNKq8nCGLN2qkdeIOHppSBHx0wciqGTR7YDF2gqtlIsbf 5g== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cd8per83r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 20:27:16 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AHKCsml006055;
 Wed, 17 Nov 2021 20:27:15 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04wdc.us.ibm.com with ESMTP id 3ca50bmbrk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 20:27:15 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AHKRE8i32375222
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Nov 2021 20:27:14 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9556D78079;
 Wed, 17 Nov 2021 20:27:14 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A67F7806A;
 Wed, 17 Nov 2021 20:27:13 +0000 (GMT)
Received: from lagarcia.br.ibm.com (unknown [9.160.118.240])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 17 Nov 2021 20:27:13 +0000 (GMT)
From: lagarcia@linux.ibm.com
To: qemu-trivial@nongnu.org
Subject: [PATCH v2] Fix typo in comment.
Date: Wed, 17 Nov 2021 17:26:59 -0300
Message-Id: <c30019abaca0ca1a9f636671a8a2552a0bb17a71.1637180729.git.lagarcia@br.ibm.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: p0c4RmlOabCrbPfVIWxRVgc9T13TSpFq
X-Proofpoint-ORIG-GUID: p0c4RmlOabCrbPfVIWxRVgc9T13TSpFq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-17_07,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 impostorscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111170090
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=lagarcia@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Leonardo Garcia <lagarcia@br.ibm.com>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Leonardo Garcia <lagarcia@br.ibm.com>

Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/virtio/vhost.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 437347ad01..20913cf8fb 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -313,7 +313,7 @@ static int vhost_dev_has_iommu(struct vhost_dev *dev)
      * For vhost, VIRTIO_F_IOMMU_PLATFORM means the backend support
      * incremental memory mapping API via IOTLB API. For platform that
      * does not have IOMMU, there's no need to enable this feature
-     * which may cause unnecessary IOTLB miss/update trnasactions.
+     * which may cause unnecessary IOTLB miss/update transactions.
      */
     return virtio_bus_device_iommu_enabled(vdev) &&
            virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
-- 
2.33.1


