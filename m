Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836E6542093
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 03:04:14 +0200 (CEST)
Received: from localhost ([::1]:41268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyk7J-0001s1-LK
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 21:04:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nyk3i-00083i-QV
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 21:00:30 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:24702
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1nyk3g-0005t4-Qf
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 21:00:30 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2580TwO8024735;
 Wed, 8 Jun 2022 01:00:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=JwmvaW3RRv+3pSMCOYaUTmvpbqMyFXIEL7t2IPOmPeE=;
 b=Oh7hMMyVVDhYHCeyjG8v2Puif5AKrO4f6Fln6DCtD0a7qJePDw05szx1bhGVrSnPYhJW
 f3M3/+KMHWDjabUhqXfvCM9gSpOOcPAEyhEyuRnp3iL2USoLqcw69XEv9XvZCJNDORNg
 QebGTvUQod1ecKRjvV7YS6czFUNihEd9xCcOX6gMW8WAXJ8U+9uek3eYO2DhJLt6YyRD
 RNAr6O4DDquxY9oyhpPge5CZ1+AiEstc5GQzwN5ctpwnxuAhHqWrVXkvsGgsuokFp5o8
 NeJMIXL/BKGLKSyeTNxLCAOP3Nn0g1PrVjnFNnG6ujugwc4CtfVP1x+7EYrygtSJC73E MQ== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gjh748dsu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jun 2022 01:00:25 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2580oalG007652;
 Wed, 8 Jun 2022 01:00:24 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01dal.us.ibm.com with ESMTP id 3gfy1a5qwf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jun 2022 01:00:24 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 25810N9019267976
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Jun 2022 01:00:23 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E860DBE051;
 Wed,  8 Jun 2022 01:00:22 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 91F95BE05A;
 Wed,  8 Jun 2022 01:00:22 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  8 Jun 2022 01:00:22 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Stefan Berger <stefanb@linux.ibm.com>
Subject: [PULL v1 0/2] Merge tpm 2022/06/07 v1
Date: Tue,  7 Jun 2022 21:00:04 -0400
Message-Id: <20220608010006.2122022-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GUJX7MXnxNRI_eS0nGPxPL8bFIOFjwlv
X-Proofpoint-ORIG-GUID: GUJX7MXnxNRI_eS0nGPxPL8bFIOFjwlv
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-07_11,2022-06-07_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 mlxlogscore=665 malwarescore=0
 spamscore=0 adultscore=0 mlxscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206080000
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi!

The patches in this PR resolve several Coverity issues and mark a memory
region with TPM response data as dirty so that it does not get lost during 
migration.

   Stefan

The following changes since commit 7077fcb9b68f058809c9dd9fd1dacae1881e886c:

  Merge tag 'vmbus-maint-20220530' of https://github.com/maciejsszmigiero/qemu into staging (2022-05-30 12:40:36 -0700)

are available in the Git repository at:

  https://github.com/stefanberger/qemu-tpm.git tags/pull-tpm-2022-06-07-1

for you to fetch changes up to e37a0ef4605e5d2041785ff3fc89ca6021faf7a0:

  tpm_crb: mark command buffer as dirty on request completion (2022-06-07 20:37:25 -0400)

Anthony PERARD (1):
      tpm_crb: mark command buffer as dirty on request completion

Peter Maydell (1):
      hw/tpm/tpm_tis_common.c: Assert that locty is in range

 hw/tpm/tpm_crb.c        | 1 +
 hw/tpm/tpm_tis_common.c | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.35.3

