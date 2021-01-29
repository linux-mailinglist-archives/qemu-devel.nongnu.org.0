Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C256308A8E
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 17:53:00 +0100 (CET)
Received: from localhost ([::1]:36102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5X10-0000bu-S4
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 11:52:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5Wv8-00078B-Pl
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:46:54 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:59422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1l5Wv5-0005eP-V9
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 11:46:54 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGP02W121853;
 Fri, 29 Jan 2021 16:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=MaZxWgXDoih/y2ecLBQvs4A0JFM2Wx1argO8nMCreSM=;
 b=rZLUwZv8r7k3kUYsAntgvhhl+E0SAnC+ocZchEL+g4GSHXFvd0RNpmmqSYw7SMbAvFjl
 RlKt+pttR+ny8F5rz8+xLKNi3IKz5+QoSpKZHoGRB8UNi66YTT0ddMR0SlK4JRZo3Mb8
 dU+6xsDPWFQSkWoW75fv6AvlrrzR3KPUHxoXVR2ZQIiuYDPp2hXo6H9Qjmh0sZ8H+nOx
 7YMo1fe7SX4aYOpLRIV/ocCLLQyTde6f6rHmZUwDzwFjrk2rfmm3cWyZDLOn+hiQS7Zq
 2EFWqPZBlSFujdGAtByA7uHl+lu0PG2IIcqcLgyjwEg8M2rOdReMNBuIKxv5lPpZGigI Kw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 36cmf88j19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:46:35 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10TGOh1U083792;
 Fri, 29 Jan 2021 16:46:35 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
 by aserp3020.oracle.com with ESMTP id 36ceug423v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 16:46:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l5wfQSUaeDWwiRRUdKIWgIbUVQ980XNZSvIYmlUPEok+ZtCmxBiBLGPdJphow1y0JM5elGG+TsG2NyuPR/c4Myr65fPTo3noi2GUioh//TLRQPtokw9LBxQpPH6IcYrfEQXfOoefMhzrzWBrWuhjiy3SdKUG4W9rjfXSNbJwoBf0gGnl7lAwCSzrUV1CGCgHBwZWpbc/PQkamua5QBDfL1KsxJc0w2F5OuemST09VQiMW1UhrIGfSgCz2wFNOtujxsy+woVpj4PGQcIkGhBEyh9UI2s0c/TgsHDrl6ZHFcv3vIDRBmn/3G1nHctKePL0hJuQVbfdo/VfFu9swR8FYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MaZxWgXDoih/y2ecLBQvs4A0JFM2Wx1argO8nMCreSM=;
 b=LsXJKpw3VY36kDt8HWVYMs4kSHvXBbzk/6xHgdszwf7JOXouctvDlQ+F4KYlSJzlwGzsTgSU/+DKIPQCDGvloN385WwGMTBHQqbH8ruO+2JJHKIsV6ae0hCef2HlKw+oAtuSUg6NCOz9CLrr+0Um4KH9IpsY8lgG3bocV6ToIUyslGfzFUCGxs3IYiSDIDg7qfj9hAPoEopfSpvV2tFRtAxwQkCHowU08mqsk9fVwKS+BdiLYPh0NfWKbjCcntj7e5HjMnkbtSdrnilW7JLoMLOblW6DXyxcotxplNxEGYxxarkfoOKXvkCV3UKYDdE6FgFwsgTyyGapZ4hZKinI8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MaZxWgXDoih/y2ecLBQvs4A0JFM2Wx1argO8nMCreSM=;
 b=GNBPBoQYKPqZ+crui4eM1FgcOAdOVfeXO9N50Zwy02I32STd0l4icw8LpMShUyZK69lP61oPhQbhtO7NXL3GPfA2DyCedp8iD7s+S6bRe84FvgOG4nauhXW3j76FpDR+viuE8ZMggPDtT6uaT1VRZ/xca3sIKGCw5td6l2I+NlY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2744.namprd10.prod.outlook.com (2603:10b6:a02:ae::18)
 by SJ0PR10MB4671.namprd10.prod.outlook.com (2603:10b6:a03:2d5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Fri, 29 Jan
 2021 16:46:32 +0000
Received: from BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d]) by BYAPR10MB2744.namprd10.prod.outlook.com
 ([fe80::74a8:e88d:b89e:bf2d%4]) with mapi id 15.20.3805.020; Fri, 29 Jan 2021
 16:46:32 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v21 02/20] multi-process: add configure and usage information
Date: Fri, 29 Jan 2021 11:46:03 -0500
Message-Id: <49f757a84e5dd6fae14b22544897d1124c5fdbad.1611938319.git.jag.raman@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1611938319.git.jag.raman@oracle.com>
References: <cover.1611938319.git.jag.raman@oracle.com>
Content-Type: text/plain
X-Originating-IP: [209.17.40.45]
X-ClientProxiedBy: BYAPR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:a03:74::30) To BYAPR10MB2744.namprd10.prod.outlook.com
 (2603:10b6:a02:ae::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jaraman-bur-1.us.oracle.com (209.17.40.45) by
 BYAPR05CA0053.namprd05.prod.outlook.com (2603:10b6:a03:74::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.8 via Frontend Transport; Fri, 29 Jan 2021 16:46:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8574fb4-1b3f-4ded-0cb9-08d8c4756ee7
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4671:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB467124CB0D51E41348C0543190B99@SJ0PR10MB4671.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e271fHYcY+YmYQxBMvAelWWKfIXDyG57VuIA0PoFsf71dQVFJDdU+nNjQQVYEr8CHD3onGgmE/PmfR2McfjBeeVQMuGCPkQueh9va0v4V45SiA2Qhdn433dDGrpmueAKDjIKyaggfZkzuuFW4xkUhcCLOjmEEUyZctjLrhwOVS3ybjVNIbNaVOe7bcHnGn9LxjS8YnFZ8GhwXY2j3Xy1EnWAFCiBwGL8Dppp1sVDJPFXNJS3ZPs9HY+x0nSpN5Bdc4shdM6Zabc11ohe20MSAcCJZTpKNkXFy3EgoAOYFKZydk26Nq2sPonTFixZ3cDbjo7SCAEA2oQeLxm3SWL4GiKDYHpB5oPQ5PX6zEW+bJr5FCfo6QlqNJ151qxZ3nf3iDq36/pU/dqMC/H50RSCi6pzEeXB4beIgBW70hT8BDjQeRkHygZznR2OBNqP7qaS41yoz0c+aIjgGiiSQHlvixy4YNv9fSdplPHjXecy7rseepmwwPDh7Yb0kHIrXojdO4nAf7lneAGwwhcsjeShWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2744.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(376002)(39860400002)(396003)(346002)(956004)(2616005)(4326008)(8676002)(6666004)(66556008)(478600001)(86362001)(36756003)(7416002)(107886003)(316002)(6916009)(2906002)(66476007)(16526019)(66946007)(7696005)(52116002)(6486002)(186003)(8936002)(5660300002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?jvE9Hc6lqahegofgevF7Eebb5HnSuyzvAWl/LyGXeRzKS/7dlt2gqvZrzcPe?=
 =?us-ascii?Q?te17UTi9UioaojQgINUAlkK35SXAqhn/ZQPaIpLuxUjhnDoC2cZHFutw5Uqn?=
 =?us-ascii?Q?+N9bDXRjzxDtdMEvZyr9GMKKSns63xsTWl9VYZl6a1vzZrgMQich7NAw/1MB?=
 =?us-ascii?Q?ff2ESeWF3MM6NO8XWpZo9dA7vOLc6PljIHWjLbqwHhoF1N9cMP2i2Ff0hHPl?=
 =?us-ascii?Q?epYj/nskeUfu4GznEzXpcAJsGUwyClvyv2Q4QbkcbvQD1s0rdzjAPTQrlbjt?=
 =?us-ascii?Q?FoDVGFzdW5eYL5ySS8ZoU2bfqTn9L3w3GjAWJE+ZjkEKB0LPFDuDh4IwY1dn?=
 =?us-ascii?Q?FyHpwKkdsRAGpRFh3KUsP2DAXnzfHruYEaWyyGsyesYnxYmrqmcbsdK7H5V7?=
 =?us-ascii?Q?p37EcvfuDBKJ9HYNC4/izsaVRvsn8FtCXwO3xsiMEjY86ljalMotLIvNhDfT?=
 =?us-ascii?Q?qzqVnFVD6wOYGzIBPaD0Ij3vHjRxl3TLH4pi4De/fU9E4JiHUATZ3DQ2zx3Y?=
 =?us-ascii?Q?iEhL3Dwslv/htx9cR2Ik7FNWQyHkOaUWhyvoP/X0ZCjLPljG4lhxkF9KQc8z?=
 =?us-ascii?Q?csdcse6E6HQlf4pKijzrYc2UiyXziLHklIn2Zzcnqw46IWBQtLqm+jtXvt8J?=
 =?us-ascii?Q?As20iz87CSKBbQ+zI4xxqixYGLhIP7cPg2RChI52JVlZwcvJVdXzz4w7Wvcy?=
 =?us-ascii?Q?6Gi308Ed7hFLd4J9M+gzr+N9vgENl1gRzDvwook51bBorEim8O8r9ctjbzGc?=
 =?us-ascii?Q?/Sd3DKmqsUpKwmVOyqIw07DIXOysGLoxIGvB6/sdSMk+92bQKuIlghSOsNvC?=
 =?us-ascii?Q?iN98xEeogSs4wNDZ2/XKj4nclvGpMqRdt5C0/SA0izCWFxsax07m6QGBncNc?=
 =?us-ascii?Q?mWU5JEkZB89H7NoAI+s1eEvh6zfBOsKeAlYc2AFVu0DVCEsXlBL3PvdRp3wd?=
 =?us-ascii?Q?5/lmPm1BnN2o0+PZxmHUBL1EAlXYvKT1ZWqWFpt9VP0GjHTt1ZRi0m0pb3/i?=
 =?us-ascii?Q?EIs1whDmISRYNl3AXIC6IJYeNS7Q6oK+CqsQGgYO0ctv75qv1XFp5NCwcIyR?=
 =?us-ascii?Q?yhjLZ322?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8574fb4-1b3f-4ded-0cb9-08d8c4756ee7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2744.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 16:46:32.6886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K9inQIFTR2VMlvfviooDHVKEHP+e/yWB2dRfCDrHcmbSwRZpXmGhIyMZry/66WNTY5htj9WX19TLl5Ocx6zJkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4671
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9878
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 spamscore=0 malwarescore=0 phishscore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101290081
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9878
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 mlxscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101290081
Received-SPF: pass client-ip=141.146.126.78; envelope-from=jag.raman@oracle.com;
 helo=aserp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, kraxel@redhat.com, jag.raman@oracle.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, stefanha@redhat.com, thanos.makatos@nutanix.com,
 kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Elena Ufimtseva <elena.ufimtseva@oracle.com>

Adds documentation explaining the command-line arguments needed
to use multi-process.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 docs/multi-process.rst | 64 ++++++++++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS            |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 docs/multi-process.rst

diff --git a/docs/multi-process.rst b/docs/multi-process.rst
new file mode 100644
index 0000000..46bb0ca
--- /dev/null
+++ b/docs/multi-process.rst
@@ -0,0 +1,64 @@
+Multi-process QEMU
+==================
+
+This document describes how to configure and use multi-process qemu.
+For the design document refer to docs/devel/qemu-multiprocess.
+
+1) Configuration
+----------------
+
+multi-process is enabled by default for targets that enable KVM
+
+
+2) Usage
+--------
+
+Multi-process QEMU requires an orchestrator to launch.
+
+Following is a description of command-line used to launch mpqemu.
+
+* Orchestrator:
+
+  - The Orchestrator creates a unix socketpair
+
+  - It launches the remote process and passes one of the
+    sockets to it via command-line.
+
+  - It then launches QEMU and specifies the other socket as an option
+    to the Proxy device object
+
+* Remote Process:
+
+  - QEMU can enter remote process mode by using the "remote" machine
+    option.
+
+  - The orchestrator creates a "remote-object" with details about
+    the device and the file descriptor for the device
+
+  - The remaining options are no different from how one launches QEMU with
+    devices.
+
+  - Example command-line for the remote process is as follows:
+
+      /usr/bin/qemu-system-x86_64                                        \
+      -machine x-remote                                                  \
+      -device lsi53c895a,id=lsi0                                         \
+      -drive id=drive_image2,file=/build/ol7-nvme-test-1.qcow2           \
+      -device scsi-hd,id=drive2,drive=drive_image2,bus=lsi0.0,scsi-id=0  \
+      -object x-remote-object,id=robj1,devid=lsi1,fd=4,
+
+* QEMU:
+
+  - Since parts of the RAM are shared between QEMU & remote process, a
+    memory-backend-memfd is required to facilitate this, as follows:
+
+    -object memory-backend-memfd,id=mem,size=2G
+
+  - A "x-pci-proxy-dev" device is created for each of the PCI devices emulated
+    in the remote process. A "socket" sub-option specifies the other end of
+    unix channel created by orchestrator. The "id" sub-option must be specified
+    and should be the same as the "id" specified for the remote PCI device
+
+  - Example commandline for QEMU is as follows:
+
+      -device x-pci-proxy-dev,id=lsi0,socket=3
diff --git a/MAINTAINERS b/MAINTAINERS
index 12e4135..1f84956 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3187,6 +3187,7 @@ M: Jagannathan Raman <jag.raman@oracle.com>
 M: John G Johnson <john.g.johnson@oracle.com>
 S: Maintained
 F: docs/devel/multi-process.rst
+F: docs/multi-process.rst
 
 Build and test automation
 -------------------------
-- 
1.8.3.1


