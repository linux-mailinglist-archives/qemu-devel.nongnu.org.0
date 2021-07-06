Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 877123BDBE1
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 19:04:31 +0200 (CEST)
Received: from localhost ([::1]:36566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0oUo-0007MF-In
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 13:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oJq-00012K-GM
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:53:10 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:17350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oJo-000852-Ef
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:53:10 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 166GqJtO028762; Tue, 6 Jul 2021 16:53:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=T4YNtbBFKtOnN5JhWS0xM4UOSmd+qHyZiSfi7Iax8JA=;
 b=JlZ/0C9fJzJYsQRpM5ecq+cp/fzkMZ3n29W1udZdjWX2f4IZPZ7sLridub9h/UGumLrI
 wpZCv/faMo0cx0+kxONL2yoXLz1A/1pnKo4BMJd3QkHHuMRXsVOwS0ydRUZeBE+93ynQ
 x7wIpr1Um2wG272TYnWvyIhAJ3YvSzbQ7P5jSe03OGcsNtu/ETPobJHdQqk10Duw9m84
 V3KmnQVwRmT+8mfvAvQJyYpD2tiXIhF2jRF6ESrwymzh656jR1vCTO4Vu+XHZHWKPNBJ
 vmGSUTUgMW9oD+wvA7lgy72QZ0JPdGWNLrGD6NbtOSQ+Y/yWILc5lwSGmYA/KW3SQ4Rc rQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39m2aaaapj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:53:06 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 166GoVBY084774;
 Tue, 6 Jul 2021 16:53:05 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by userp3020.oracle.com with ESMTP id 39k1nvcqbm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:53:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l60gAXcRgwWjhQ7lGumqxFJRPViJdgBKpvOfRZpoxzffwoj92ymA0lnZLG0r6Et1h85kun58g1E1QrgmK0pS5axddfMdqK3EYAB6dkd1j3P3wTSwRmbuAdwbHSZqZRGlm8jChPSzReKDqyiSBEhbHd5fvupGTU8zwzHl0dOgOQc/PwzThwzCcg45DEWc6io3WEZo5/p+EP8OKNAzgG03N1rl86VrqOrduhnkQCyAGJ4rpGsUzF4UWahhCyfN07Zbm4z2Q/Do3/REr4OGjd5CkQY6CvpCr1uFkvZ+JrF3iksyXkdr+rUkmLikU7qzN8QC+4SS8o9b1Eq3HwJKB/GELw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4YNtbBFKtOnN5JhWS0xM4UOSmd+qHyZiSfi7Iax8JA=;
 b=O+tJ1sO0CMSlG1sjSNH1Jh08uMbXRIg1shds2B033gTFoYXAcawOF2DrM8ldde6wo42ZK3PagGBr2y4j9QnlF4KYEV9PkCM8s2ui7n5bqgnuMgooXsVrioZGV91sbyii0fhE5haMXFlK8nXMJepiiaGE1KGu6W0NgbW49VULLTfnYTTOWWD6PcJtfWOKypbGNfoXmAIt9WGTo4zIYgEi9UUidYoBOlt/Gecd0DH0MUpF+y5dqHgSg2eYgBstZySg0+ll9NnGNcXgJk1/bren2rY/+R+oh9nZpVGeyNS8ICCdXtsyQ8O0QgLATmWFJeyXvsphgi2zDB33TRfcmEtFug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4YNtbBFKtOnN5JhWS0xM4UOSmd+qHyZiSfi7Iax8JA=;
 b=zJyKxgi61QoGAHBy6lrifJ1ARXrfDTEFLo0uh/+gPKhhndSZRHa0XHTNEfygrFGoEAFeGM94ljuy6WP73YEElESB2Y65Z8F3pIOQad0Rpc3yng3HPtRFu1uE6AMYTOeYUnbxN9IuCYJ/kxkwD9Sfz60E2ZNj6xUGPx1/vHRcyNE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2805.namprd10.prod.outlook.com (2603:10b6:a03:8b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Tue, 6 Jul
 2021 16:53:02 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 16:53:02 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V4 14/25] pci: export functions for cpr
Date: Tue,  6 Jul 2021 09:45:45 -0700
Message-Id: <1625589956-81651-15-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1625589956-81651-1-git-send-email-steven.sistare@oracle.com>
References: <1625589956-81651-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0201CA0041.namprd02.prod.outlook.com
 (2603:10b6:803:2e::27) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.4) by
 SN4PR0201CA0041.namprd02.prod.outlook.com (2603:10b6:803:2e::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Tue, 6 Jul 2021 16:53:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 310e8eeb-e0f9-486c-4a91-08d9409e846d
X-MS-TrafficTypeDiagnostic: BYAPR10MB2805:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB280564434387F37430EB7F16F91B9@BYAPR10MB2805.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +32esBfkUqDXFU0lY4sFaWy2FRYWOTEa+ZlMPSITzU57SK1FxCyM31j3c/60BqdO8mmordl/3DBfG5z9PnZwjFc9xJe2Tx2B3djQz3vqR5PJgRf1t65580TwiAMNKxlXGVV6AgaaKufle/IFwz0IZ6S+saZqI0F78yCxPmREPMvb5yD6ktCe1JTgVVjQl6qo6/vrL7XrZyaM5HjQ2qgDYxIORUQ4MeRRKa4eRQ02c/zIybcRg+L9lZU7Et8Enm+DPgIJr33Ktq3nvzVpK8viyXjizv3gn0lI24A2lw8f2X5y9pCUWKQvnFaI/fbzitHX4xtjRtXNQP20jXI6ofsgkP6jYKzS2m1MQc37G554Rp+uOxvoKh92fZDYoi2fSdwwqBMiePqiIyGq3z9EZHBoM6jB7/cRJ+NqAKTxP2llTf3B8F+dIqaoO9P759Uc+Iu7hl8nwDAgrc6FSth2FHzQDMYsSgj22S1vnCbPhtyLqtz/p2Vzo0pf/CijskOuDvqfyEsx+lJkQBD5N6SKtaTtEjKvF21beqwoktYgbglmvLzL9CkK2jekpbO015DVW/OKzP9kCeseK806TzADmn6StDsRkCNmy1duCfkqF/Mvb9kescci5/e5X5FUqoZK6jn3kffctLdzR3fs0K3s69jfODh7euFgQ0Cx3bKB7ewE8B9o1EUDjXtJRvotcpCy/EMhOuPtQzLttuF9MkRI19vwqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(376002)(346002)(396003)(366004)(4326008)(2616005)(54906003)(26005)(107886003)(5660300002)(83380400001)(6486002)(7696005)(186003)(66946007)(66476007)(66556008)(52116002)(956004)(86362001)(6916009)(7416002)(36756003)(316002)(38100700002)(6666004)(38350700002)(2906002)(8676002)(478600001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SALo1D8CBs9osCbNvov+KBEV7RQFnNnsK7zx3QmQY4k5eejpmcgW44LWKQV2?=
 =?us-ascii?Q?kIAP14dzIA0doONB+7qMG5XNR3VSWMZhWa5lB3rIyWtnzS30H5CiYsWgfXi1?=
 =?us-ascii?Q?YXAfZxDSQLTgJoz1qBDTtvZ2+3zTcJblC6LcUN2w2Ut19foqi9CZK5RzrbpF?=
 =?us-ascii?Q?1AZ9MoV6eEmmGH7M3jjlZCT3vQz07anUfdfbg2iYPuDw8zrRQhSh3rVVrMJX?=
 =?us-ascii?Q?XQXxd7Rhpq6dJMnWJGdfXu5hEvP9p6CmxY8ZlrA8aSlOm2YCyeFHaP0mgHti?=
 =?us-ascii?Q?TkPYTStRsCfpxT/mxyOC5NmiryUlNJkGxe+pMsaGsRKCR+6t4jJo8aCESVXD?=
 =?us-ascii?Q?MW+sS+XCakQwSd76y9WZnBMZX9S0JmFAJnUNTftzecj5mMjeI8UhdycZt92y?=
 =?us-ascii?Q?SA7pl94bv3y4bW3bwfq+qPcBMYzTnLO5C/GFbAlcRIvgr7v9CNroLI6BV89S?=
 =?us-ascii?Q?qtQmJoaVZvQV4FSMYuDJxa/1nC0Lh95xb73wQm7brizb4IlcucN/NhhAPDms?=
 =?us-ascii?Q?EIzRRx99w/YlPjNOKqyCeV3wjaiE0GOrqnKgRDF2kbPX5cj+AgRJiTlBFhHQ?=
 =?us-ascii?Q?1AHctW23I13OYqMqf4zeYWYUd8xixjgEiobTbA25HNNlstlsIic51HEthuyo?=
 =?us-ascii?Q?+jYvT6e+05Efs8nFpfgpK8sRQab6+9UjNJ+p5p8RDQnGu/gP8v4oUxeVM1iv?=
 =?us-ascii?Q?LUMAMRwmyR9burjoJtmSJ7LKAc9WIrlW6GrBwtSAK/UflNJPd9krnE8STTtr?=
 =?us-ascii?Q?EwFSUd/kYb5Jd1g5Bz9PjPAQdkgzJoBbZ2QMUTifAm7/nsb1vcVW1khlWLtl?=
 =?us-ascii?Q?ytGpmU1z8Gveqmh4G/UB3gSJ03K8T+CZQllABQl65zxN9lMGZVFWbvSzWn0b?=
 =?us-ascii?Q?oUGzRsI1uUNWSj8vU5a56q2xX38WtY4z3scUiw72MJOuokET6Jn/rz8WTcae?=
 =?us-ascii?Q?Gz4E3vCT0Y1jWnOXAbd/sOBBdh0REL0bDwBae7aDHgNHoHrESrk54zSk9ZFd?=
 =?us-ascii?Q?fLSozVJx8miHOrJej9khDg3gn67bB+9h/fl582XU32JSwKUdClD1sMmE+oEk?=
 =?us-ascii?Q?TS5Krhyn/4bnlYJhwbPnCQT3ybc0pllFmHGMEJz+b4mG5OzNTKkzBMlUDbqp?=
 =?us-ascii?Q?pgpHCyAW5/DYduBkXXIJHG2Q8VNqRbCJlYzBWkKDmBizSsD/p1Hlr/Du8hNP?=
 =?us-ascii?Q?aaiRgWYRC88vn7wIvsxthZQnGf3yNrtCTm2sgx9EOdkKuwdUYjvdXZURJD5C?=
 =?us-ascii?Q?wmvPbI6x7bg5g5ofL0STloCp4kNbrI6QK7mBboKE/ezy6+7W0pAOfHS8xRtw?=
 =?us-ascii?Q?WA9XAjfx+pinOqfCI37CGmm3?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 310e8eeb-e0f9-486c-4a91-08d9409e846d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 16:53:02.1580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eDqob7mKiKyvnqwJ3Nd+2VucrAfKz7Qumnf9sH7d+Y2yy0ypZg8+XHTER0/iM4ioMynn/5cS8T0m8qsUz5a6LoE2IevoppHZSOFCxEN9rYY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2805
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107060079
X-Proofpoint-ORIG-GUID: r6mg3EkUUDf7xZvY_K0pYhKpjkWAfcMZ
X-Proofpoint-GUID: r6mg3EkUUDf7xZvY_K0pYhKpjkWAfcMZ
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Export msix_is_pending, msix_init_vector_notifiers, and pci_update_mappings
for use by cpr.  No functional change.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/pci/msix.c         | 20 ++++++++++++++------
 hw/pci/pci.c          |  3 +--
 include/hw/pci/msix.h |  5 +++++
 include/hw/pci/pci.h  |  1 +
 4 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index ae9331c..73f4259 100644
--- a/hw/pci/msix.c
+++ b/hw/pci/msix.c
@@ -64,7 +64,7 @@ static uint8_t *msix_pending_byte(PCIDevice *dev, int vector)
     return dev->msix_pba + vector / 8;
 }
 
-static int msix_is_pending(PCIDevice *dev, int vector)
+int msix_is_pending(PCIDevice *dev, unsigned int vector)
 {
     return *msix_pending_byte(dev, vector) & msix_pending_mask(vector);
 }
@@ -579,6 +579,17 @@ static void msix_unset_notifier_for_vector(PCIDevice *dev, unsigned int vector)
     dev->msix_vector_release_notifier(dev, vector);
 }
 
+void msix_init_vector_notifiers(PCIDevice *dev,
+                                MSIVectorUseNotifier use_notifier,
+                                MSIVectorReleaseNotifier release_notifier,
+                                MSIVectorPollNotifier poll_notifier)
+{
+    assert(use_notifier && release_notifier);
+    dev->msix_vector_use_notifier = use_notifier;
+    dev->msix_vector_release_notifier = release_notifier;
+    dev->msix_vector_poll_notifier = poll_notifier;
+}
+
 int msix_set_vector_notifiers(PCIDevice *dev,
                               MSIVectorUseNotifier use_notifier,
                               MSIVectorReleaseNotifier release_notifier,
@@ -586,11 +597,8 @@ int msix_set_vector_notifiers(PCIDevice *dev,
 {
     int vector, ret;
 
-    assert(use_notifier && release_notifier);
-
-    dev->msix_vector_use_notifier = use_notifier;
-    dev->msix_vector_release_notifier = release_notifier;
-    dev->msix_vector_poll_notifier = poll_notifier;
+    msix_init_vector_notifiers(dev, use_notifier, release_notifier,
+                               poll_notifier);
 
     if ((dev->config[dev->msix_cap + MSIX_CONTROL_OFFSET] &
         (MSIX_ENABLE_MASK | MSIX_MASKALL_MASK)) == MSIX_ENABLE_MASK) {
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 8f35e13..e08d981 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -226,7 +226,6 @@ static const TypeInfo pcie_bus_info = {
 };
 
 static PCIBus *pci_find_bus_nr(PCIBus *bus, int bus_num);
-static void pci_update_mappings(PCIDevice *d);
 static void pci_irq_handler(void *opaque, int irq_num, int level);
 static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom, Error **);
 static void pci_del_option_rom(PCIDevice *pdev);
@@ -1335,7 +1334,7 @@ static pcibus_t pci_bar_address(PCIDevice *d,
     return new_addr;
 }
 
-static void pci_update_mappings(PCIDevice *d)
+void pci_update_mappings(PCIDevice *d)
 {
     PCIIORegion *r;
     int i;
diff --git a/include/hw/pci/msix.h b/include/hw/pci/msix.h
index 4c4a60c..46606cf 100644
--- a/include/hw/pci/msix.h
+++ b/include/hw/pci/msix.h
@@ -32,6 +32,7 @@ int msix_present(PCIDevice *dev);
 bool msix_is_masked(PCIDevice *dev, unsigned vector);
 void msix_set_pending(PCIDevice *dev, unsigned vector);
 void msix_clr_pending(PCIDevice *dev, int vector);
+int msix_is_pending(PCIDevice *dev, unsigned vector);
 
 int msix_vector_use(PCIDevice *dev, unsigned vector);
 void msix_vector_unuse(PCIDevice *dev, unsigned vector);
@@ -41,6 +42,10 @@ void msix_notify(PCIDevice *dev, unsigned vector);
 
 void msix_reset(PCIDevice *dev);
 
+void msix_init_vector_notifiers(PCIDevice *dev,
+                                MSIVectorUseNotifier use_notifier,
+                                MSIVectorReleaseNotifier release_notifier,
+                                MSIVectorPollNotifier poll_notifier);
 int msix_set_vector_notifiers(PCIDevice *dev,
                               MSIVectorUseNotifier use_notifier,
                               MSIVectorReleaseNotifier release_notifier,
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 6be4e0c..bef3e49 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -902,5 +902,6 @@ extern const VMStateDescription vmstate_pci_device;
 }
 
 MSIMessage pci_get_msi_message(PCIDevice *dev, int vector);
+void pci_update_mappings(PCIDevice *d);
 
 #endif
-- 
1.8.3.1


