Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A6C475CC1
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 17:09:16 +0100 (CET)
Received: from localhost ([::1]:58926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxWqC-0006hh-33
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 11:09:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mxWKj-0006mJ-41
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:36:45 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:28434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mxWKg-000081-AB
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:36:44 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFEMpeo023149; 
 Wed, 15 Dec 2021 15:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=/tT6da/bYxsNG8JAdvbdg5Qc+57FS8nthI5B8zzLovw=;
 b=vUXw9H+ZhLbQa9tKu400K4RWC9wSGGzXV6eUOZfSMvOFaOjf4SxvvRFy6Q5vAA0ICmtI
 Iy61YEZXOAJKmNHpnz2StOGhNOG6g9uEEiCDt6ppIYzRq36gg3cggnLbLo9aKPvXi/Hm
 Pe6wun38VPfw8lYtJYd1yhz4I2Wg+5QESXFoTSfGk2RF66jCMsYCaRmClk4VfZRzcmUL
 0detaH64HUIosUELykEtJqq409bwZqGPfZD4S34IPxsVPdOGaSu5wKY6ysxoCxigpZta
 91C0w9lf2XHlrO1SAdro9X3k4f0Is1hLLVt+N044Oar7DvMKxkmpUW6Oq8IdbAu+wCQX GQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cx3py779c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:36:38 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BFFUSaX083829;
 Wed, 15 Dec 2021 15:36:37 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by userp3030.oracle.com with ESMTP id 3cvh40b3du-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:36:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xyip5rC0roq0onT1kWad1zSPSCi7RQiErWh3ra9I+q/1/0EfvFIV11Y0y2g+JBB7PtbhWCL8cu55dQ8CJG0AuiDrfwB8XvhniymAXiOeIqoqxUaLOQsAFJu7L8HGgMZiCM/FTsWfFqcR+TomiyHYr7a1UduGLpaq4H5DPzpClr7CfMwDnKZTQTvvLF3mqZVVpTUUpMJflnRhPWycBK0EH2txEGZssH93pNX0L7J5etQ1jM1hc1ZxX2qXzsqird1/paxGLBamdbHBbzadlQfbpmz5HkLjiKIIbmjNkC30cSmy9KLOJh/KRre7WQ6G+TQfaHeUPVM7zQwZAfeYhwNogg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/tT6da/bYxsNG8JAdvbdg5Qc+57FS8nthI5B8zzLovw=;
 b=AQ35fV4f2NsTHshOXWU7Ug0j0AxRIHCazpmZCAjJDQ99xLuCcgQ9WhZEuC/0zzZ90krphwHoxNMsQ4RN4wUuOq98HgJLQ5zC/uPg0zVkgE/fPpHkl+blzqR+CajABAsBSwX2EMAQQwCHlouwKvLRoJmBb+OMIDl2tfJBKY+g6KE7qEMPAOVXzb6Sk5IARSd1UkV/4W/jxdZgDOiMak1q8w823Dg6Po4ktvwkD6aJbus+n/X8elaT2p5PWFXT65kHiHjnX42MMhYsDCHFz06YX10h95V4FeLp4N2ew7VSC5YXxFB/5NeKaaVvHzCN25dwv8QPkxjxpvITQh5oBMy+3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/tT6da/bYxsNG8JAdvbdg5Qc+57FS8nthI5B8zzLovw=;
 b=uKd9jGApyTR7Md29jcZKk0ZjqZafVr82r4u+nVKQJ7hZYX3augpv6QPQprUJHI6uJnDbg/TfxxrUzMEyJ047eyUm3q8uYmyArxRFm8n/hem2rW0DCx/42BDAyxTpCm3YDxbkiSa/HwZt9fQDntLGgWu5yF8+oS1DKJi+WA+OmO8=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB4048.namprd10.prod.outlook.com (2603:10b6:208:181::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Wed, 15 Dec
 2021 15:36:32 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d%5]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 15:36:32 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 14/14] vfio-user: avocado tests for vfio-user
Date: Wed, 15 Dec 2021 10:35:38 -0500
Message-Id: <0ca430dd43d35ff2ae4667247f6d669a84e5ce99.1639549843.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1639549843.git.jag.raman@oracle.com>
References: <cover.1639549843.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0105.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::46) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 600b8c18-1c7f-4dad-5075-08d9bfe0abcd
X-MS-TrafficTypeDiagnostic: MN2PR10MB4048:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB4048A5218E246BF85BF47D7690769@MN2PR10MB4048.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8FYOGJSg0WfqO/FapQMWremauBvpuKKXq+J4yrHf3JGSBPh3zB/oVYMbFfzfk1rre4s6Yiz8onApHf1n/6cb5khR/+moB/ShziY5HW3csOXr4V3Zkn/ohWiUPACJ0GPdhuAV94ZJR3p6PmD92naAoXUuIm1CWiKgkk2JDhCBWurshMSpSW0b/AU9pDmLbtzLyKE9lEVb0vgWmZgI8Vfm5jCyfhXIcWnIPbeqaFAMXZzZhGp+3owxt3P/N1SQg/bsOnABi2lZbUoPu7/GiMNobVBo6U1RoRmK1b6TNZyRyzbM5xb4J97QMfY27IUWduFSgDNCoKMPCiuJU/Wj/fUHclQzGtf4KzWkFjXWUVMhIa2+dk824Mfaq1mjymuSkrY2d0QELCZ3g01gpvZpVehipUk5lqjL7kfp4GYwp9SnP9u1913aW+YCOR2rshAnGR4dlg+CwJRcrjrHHrolqVT15atjqHeOBFtKQbSd4cTTqSC6RViMQdQk35dkryeLg9/ic0hMqVb6ULdaRB6HtSKD66cCrn9a/sQ/WtF2d0CQ3BXuS2AjquFQsqgNojiCQFXBKWrXw8zp5rJAfGlpUL3GhyncohKZDwyK2cgx/BUJ49SycOuOdkWs2D5pPAwKkM+v+EKGTgc0NzjVe5FpfybtFrZAQIGJ6TGLATrDDtkiwKL3hjR/HKPZ6q/D9IFXU4gO68BVGsJC3huMEhi87Ogboe5FK9CbhKa+RolJiPyP9iWSY5bHVic1xSRwXWbna0lSIg2sX2GBqsMQwT9lwwnudbKgPAQAfbDg040R5tdiPb0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(508600001)(8936002)(5660300002)(7416002)(6506007)(6486002)(26005)(66476007)(4326008)(2906002)(66946007)(66556008)(107886003)(36756003)(186003)(2616005)(6916009)(38350700002)(6512007)(38100700002)(86362001)(316002)(8676002)(83380400001)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v9VmGW4rGRnOUFyCHNZIwIpNQ5rRVk6UkT4YsV6bd2reHTUp8y4vn+atwBRz?=
 =?us-ascii?Q?zwHPnIuiKbK4ko4SXevAUZzi8g7J32jszLYDwVdNZOay4ZhOv1Gt+cfVnLpP?=
 =?us-ascii?Q?9kONAdKyGGqkP1+4wb2+7aAbiqoLb9W2lofzTckiYLE2cvO7q8oo7jkxqIkC?=
 =?us-ascii?Q?cZKw+9TTw4bVfz4HA0DGtFS64VAekGxFMIvIxmqV/dpEb/cM0M5vXdybtMl/?=
 =?us-ascii?Q?a0skYxJwN5pVmgQAvLK45elME2BA4bz7sdvi6VgWihNu+Ov1t672L4xKEJIT?=
 =?us-ascii?Q?MmzoJh8hDpeZGQJ6Wn5GidZ30O1WHyku/9V5pAWpUENxAq3mc1zrhec+22WV?=
 =?us-ascii?Q?IIg7H9wCCkDrQQr3hcbsTTYLm2Rm/4aCb+7cve09GAO9jqlSefW/RtVGZYEr?=
 =?us-ascii?Q?bPCbQ6eKZTwVf9Ka4M4MKRH/TvUpt1FQWSyuvWPoNZaQwctWJxcocHUo9ldg?=
 =?us-ascii?Q?PU9qhb7C3z/A+9kegukXSJ72cGvm5HU9V0ycFUDh1xkJ1Xcm3zMmvdzpfdxy?=
 =?us-ascii?Q?Q+61JJN3pLrdT/c+c3Dqv8ajB3e2YCQhnS2E6aVw/KVIsg9ChWQaUnGuJvMZ?=
 =?us-ascii?Q?Xsdfv00dG3Hh5rxdWXVa5l1Vm2A0rudhxvjb2RhSpexpQ0kugq7eKYk9qasR?=
 =?us-ascii?Q?UuK2PzMwjJFufAb4HXropHMBTL8yry5amqikKa+YAv3RJxGMWEJCrgJ8YQkA?=
 =?us-ascii?Q?SaQtxCoar9LLCV8Pyjt20aMVyWIw1tje/rmh5tBXtjpWeUm+N3sLm6C2Om2h?=
 =?us-ascii?Q?pm+cgY2oSpsPQWLo2T1/iT95agqc/yJnwk5FQIIqGW0u5FvTEIQxldwxMM/L?=
 =?us-ascii?Q?oj9jgf5qIVHAkc9vl7YKgPLzF0wTTwCzYw7o39lV6b6a7ak7VnoVMUVdc2BZ?=
 =?us-ascii?Q?J3zmyIAnqXVAJp20XBsBHIUoCfbS9xDsKRqh1kQj9Yp8VuBz/20CiYdiwckq?=
 =?us-ascii?Q?/RNt1IADUQBTbyuD2oTWc1nSnY1jmISH5E5lQbdzN0+mIzw6MRj35VVAnjnd?=
 =?us-ascii?Q?PBMtYshlVvkfOFXFNqZK59N+fZa2N+rsmcqwtn2Y+MbHQtP6jna030N7SyNf?=
 =?us-ascii?Q?AhjW3xRI+yKLHqckNLIRj4//xn87cCKmuUrNodfduPdX4CRFUAR9tGuCK3o0?=
 =?us-ascii?Q?TjGETUVBV5zQudJY69Szb1A6uXhOqKB3nYK8tvS1+7OFiz2pFZGwvxBQP2hy?=
 =?us-ascii?Q?zlsj+rpYe2rZGSRp4byTjFrAKjswWPKsJWvsDsiWw4frVx2GurqbmeiV1JVS?=
 =?us-ascii?Q?LbES6W5mkGSMxLPLzuCw9XVJPX5qlpdUsduIdFUSaLtZSn3R7xC2bQTDAOUc?=
 =?us-ascii?Q?tHPaVRFqBg5MQ18/NDKG1ZxqYOBUvaDOBSRK/e4RZOGrInW7fcMZGRCCW1Uh?=
 =?us-ascii?Q?kdpwii2Ta3yG70kanYHlpShW0/jJ6iNkF9oIdQlrciQyXHXj12wXLJNvQ6cM?=
 =?us-ascii?Q?5+5d+aXm8uQKnfjmMpT/rcRb/yJ7WgFxlGgzF14EkJJsLX576qMLFZCFpAa8?=
 =?us-ascii?Q?8d0zj4S7jMY1BH9oSVZuzCZn+THC/GXmGLZUtQFXtEOuxcjeppKLZvmrfVMQ?=
 =?us-ascii?Q?Zu2L6CGj70wF07+svwmorVKm5RuuV3Ff60zx3azePX+2y4xK+sopsjGCcw6/?=
 =?us-ascii?Q?G7YxVGXGQsopxGnlBPv39WQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 600b8c18-1c7f-4dad-5075-08d9bfe0abcd
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 15:36:32.8387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N28bQGNSBDYulS6RPdTWFxrUHkteOicKfujHLilK6rLwObFEY1nr9DH+6bjtF5h+8D8yHxkOMlQlT4dRQMZ7RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4048
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10198
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112150088
X-Proofpoint-ORIG-GUID: 1ZNUKBAGaDIlmn6Q7LssKIM3sLat6vC5
X-Proofpoint-GUID: 1ZNUKBAGaDIlmn6Q7LssKIM3sLat6vC5
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 jag.raman@oracle.com, bleal@redhat.com, swapnil.ingle@nutanix.com,
 john.levon@nutanix.com, philmd@redhat.com, wainersm@redhat.com,
 alex.williamson@redhat.com, thanos.makatos@nutanix.com,
 marcandre.lureau@gmail.com, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avocado tests for libvfio-user in QEMU - tests startup,
hotplug and migration of the server object

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 MAINTAINERS                |   1 +
 tests/avocado/vfio-user.py | 225 +++++++++++++++++++++++++++++++++++++
 2 files changed, 226 insertions(+)
 create mode 100644 tests/avocado/vfio-user.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 5dc67d79a1..385a4d8869 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3468,6 +3468,7 @@ F: subprojects/libvfio-user
 F: hw/remote/vfio-user-obj.c
 F: include/hw/remote/iommu.h
 F: hw/remote/iommu.c
+F: tests/avocado/vfio-user.py
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/tests/avocado/vfio-user.py b/tests/avocado/vfio-user.py
new file mode 100644
index 0000000000..376c02c41f
--- /dev/null
+++ b/tests/avocado/vfio-user.py
@@ -0,0 +1,225 @@
+# vfio-user protocol sanity test
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+
+import os
+import socket
+import uuid
+
+from avocado_qemu import QemuSystemTest
+from avocado_qemu import wait_for_console_pattern
+from avocado_qemu import exec_command
+from avocado_qemu import exec_command_and_wait_for_pattern
+
+from avocado.utils import network
+from avocado.utils import wait
+
+class VfioUser(QemuSystemTest):
+    """
+    :avocado: tags=vfiouser
+    """
+    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
+    timeout = 20
+
+    @staticmethod
+    def migration_finished(vm):
+        res = vm.command('query-migrate')
+        if 'status' in res:
+            return res['status'] in ('completed', 'failed')
+        else:
+            return False
+
+    def _get_free_port(self):
+        port = network.find_free_port()
+        if port is None:
+            self.cancel('Failed to find a free port')
+        return port
+
+    def validate_vm_launch(self, vm):
+        wait_for_console_pattern(self, 'as init process',
+                                 'Kernel panic - not syncing', vm=vm)
+        exec_command(self, 'mount -t sysfs sysfs /sys', vm=vm)
+        exec_command_and_wait_for_pattern(self,
+                                          'cat /sys/bus/pci/devices/*/uevent',
+                                          'PCI_ID=1000:0012', vm=vm)
+
+    def launch_server_startup(self, socket, *opts):
+        server_vm = self.get_vm()
+        server_vm.add_args('-machine', 'x-remote')
+        server_vm.add_args('-nodefaults')
+        server_vm.add_args('-device', 'lsi53c895a,id=lsi1')
+        server_vm.add_args('-object', 'x-vfio-user-server,id=vfioobj1,'
+                           'type=unix,path='+socket+',device=lsi1')
+        for opt in opts:
+            server_vm.add_args(opt)
+        server_vm.launch()
+        return server_vm
+
+    def launch_server_hotplug(self, socket):
+        server_vm = self.get_vm()
+        server_vm.add_args('-machine', 'x-remote')
+        server_vm.add_args('-nodefaults')
+        server_vm.add_args('-device', 'lsi53c895a,id=lsi1')
+        server_vm.launch()
+        server_vm.command('human-monitor-command',
+                          command_line='object_add x-vfio-user-server,'
+                                       'id=vfioobj,socket.type=unix,'
+                                       'socket.path='+socket+',device=lsi1')
+        return server_vm
+
+    def launch_client(self, kernel_path, initrd_path, kernel_command_line,
+                      machine_type, socket, *opts):
+        client_vm = self.get_vm()
+        client_vm.set_console()
+        client_vm.add_args('-machine', machine_type)
+        client_vm.add_args('-accel', 'kvm')
+        client_vm.add_args('-cpu', 'host')
+        client_vm.add_args('-object',
+                           'memory-backend-memfd,id=sysmem-file,size=2G')
+        client_vm.add_args('--numa', 'node,memdev=sysmem-file')
+        client_vm.add_args('-m', '2048')
+        client_vm.add_args('-kernel', kernel_path,
+                           '-initrd', initrd_path,
+                           '-append', kernel_command_line)
+        client_vm.add_args('-device',
+                           'vfio-user-pci,x-enable-migration=true,'
+                           'socket='+socket)
+        for opt in opts:
+            client_vm.add_args(opt)
+        client_vm.launch()
+        return client_vm
+
+    def do_test_startup(self, kernel_url, initrd_url, kernel_command_line,
+                machine_type):
+        self.require_accelerator('kvm')
+
+        kernel_path = self.fetch_asset(kernel_url)
+        initrd_path = self.fetch_asset(initrd_url)
+        socket = os.path.join('/tmp', str(uuid.uuid4()))
+        if os.path.exists(socket):
+            os.remove(socket)
+        self.launch_server_startup(socket)
+        client = self.launch_client(kernel_path, initrd_path,
+                                    kernel_command_line, machine_type, socket)
+        self.validate_vm_launch(client)
+
+    def do_test_hotplug(self, kernel_url, initrd_url, kernel_command_line,
+                machine_type):
+        self.require_accelerator('kvm')
+
+        kernel_path = self.fetch_asset(kernel_url)
+        initrd_path = self.fetch_asset(initrd_url)
+        socket = os.path.join('/tmp', str(uuid.uuid4()))
+        if os.path.exists(socket):
+            os.remove(socket)
+        self.launch_server_hotplug(socket)
+        client = self.launch_client(kernel_path, initrd_path,
+                                    kernel_command_line, machine_type, socket)
+        self.validate_vm_launch(client)
+
+    def do_test_migrate(self, kernel_url, initrd_url, kernel_command_line,
+                machine_type):
+        self.require_accelerator('kvm')
+
+        kernel_path = self.fetch_asset(kernel_url)
+        initrd_path = self.fetch_asset(initrd_url)
+        srv_socket = os.path.join('/tmp', str(uuid.uuid4()))
+        if os.path.exists(srv_socket):
+            os.remove(srv_socket)
+        dst_socket = os.path.join('/tmp', str(uuid.uuid4()))
+        if os.path.exists(dst_socket):
+            os.remove(dst_socket)
+        client_uri = 'tcp:localhost:%u' % self._get_free_port()
+        server_uri = 'tcp:localhost:%u' % self._get_free_port()
+
+        """ Launch destination VM """
+        self.launch_server_startup(dst_socket, '-incoming', server_uri)
+        dst_client = self.launch_client(kernel_path, initrd_path,
+                                        kernel_command_line, machine_type,
+                                        dst_socket, '-incoming', client_uri)
+
+        """ Launch source VM """
+        self.launch_server_startup(srv_socket)
+        src_client = self.launch_client(kernel_path, initrd_path,
+                                        kernel_command_line, machine_type,
+                                        srv_socket)
+        self.validate_vm_launch(src_client)
+
+        """ Kick off migration """
+        src_client.qmp('migrate', uri=client_uri)
+
+        wait.wait_for(self.migration_finished,
+                      timeout=self.timeout,
+                      step=0.1,
+                      args=(dst_client,))
+
+    def test_vfio_user_x86_64(self):
+        """
+        :avocado: tags=arch:x86_64
+        :avocado: tags=distro:centos
+        """
+        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/x86_64/os/images'
+                      '/pxeboot/vmlinuz')
+        initrd_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/x86_64/os/images'
+                      '/pxeboot/initrd.img')
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'console=ttyS0 rdinit=/bin/bash')
+        machine_type = 'pc'
+        self.do_test_startup(kernel_url, initrd_url, kernel_command_line,
+                             machine_type)
+
+    def test_vfio_user_aarch64(self):
+        """
+        :avocado: tags=arch:aarch64
+        :avocado: tags=distro:ubuntu
+        """
+        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/aarch64/os/images'
+                      '/pxeboot/vmlinuz')
+        initrd_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/aarch64/os/images'
+                      '/pxeboot/initrd.img')
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'rdinit=/bin/bash console=ttyAMA0')
+        machine_type = 'virt,gic-version=3'
+        self.do_test_startup(kernel_url, initrd_url, kernel_command_line,
+                             machine_type)
+
+    def test_vfio_user_hotplug_x86_64(self):
+        """
+        :avocado: tags=arch:x86_64
+        :avocado: tags=distro:centos
+        """
+        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/x86_64/os/images'
+                      '/pxeboot/vmlinuz')
+        initrd_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/x86_64/os/images'
+                      '/pxeboot/initrd.img')
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'console=ttyS0 rdinit=/bin/bash')
+        machine_type = 'pc'
+        self.do_test_hotplug(kernel_url, initrd_url, kernel_command_line,
+                             machine_type)
+
+    def test_vfio_user_migrate_x86_64(self):
+        """
+        :avocado: tags=arch:x86_64
+        :avocado: tags=distro:centos
+        """
+        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/x86_64/os/images'
+                      '/pxeboot/vmlinuz')
+        initrd_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
+                      '/linux/releases/31/Everything/x86_64/os/images'
+                      '/pxeboot/initrd.img')
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'console=ttyS0 rdinit=/bin/bash')
+        machine_type = 'pc'
+        self.do_test_migrate(kernel_url, initrd_url, kernel_command_line,
+                             machine_type)
+
-- 
2.20.1


