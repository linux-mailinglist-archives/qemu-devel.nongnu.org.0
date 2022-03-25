Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0714E7A7A
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 20:35:17 +0100 (CET)
Received: from localhost ([::1]:33532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXpiP-0002iN-0G
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 15:35:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nXpUE-0007ki-GE
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:20:39 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:17120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nXpUC-00038x-89
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:20:38 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22PHjSKn010804; 
 Fri, 25 Mar 2022 19:20:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=Ldf4+ni4bWcNfQL885EGE6ZpQjdRaS0D0GFwl5I4vg4=;
 b=0MNSC/193kyKFokYV3nMI8ydbZvShXcbQTWwSck+F/d5iP6BiDtJmAa66VynIdLRtIF9
 y9HWwg3Hr2CF7j9yuroHIFH9CsDEI+HJdrnKfk4dSAWpn8b4XgZBRN2asRwom/3phePC
 lmryEQ2U9InozyGnL0lNBYtU0jbSgwrC0HbL2790oZUwCNgRUfWK214urf1hhejG57F3
 XdXsjziQI+H5Cdevf22Bq0smo0vnLKRGc9e0m6dPS2wikYAGKULbIR5CwfzltJH21mf/
 YKpiYFs3yQ02MPkGYmHhLzmq6bpBn6d86HLz3kT2j1yb8QAtFOtVm8eJ4vEYfJ6nwHuq WA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ew6ssg46q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:20:34 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22PJGaUV077215;
 Fri, 25 Mar 2022 19:20:33 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
 by aserp3020.oracle.com with ESMTP id 3ew701w9w0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:20:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lEIIOabJI0cDnaAxFjybPzDAANs9uPfmH/vdxHbQEeCuuTeENOIqLwe2QkU6+j9JlWyloldYaMDSX24J7UtoHSBuuE1W9gp8mqcpM5fVrg8nyu7bO3LMVHe0RJlqSKV/n/AInDcW+LLKIKj7J1AZ2vAi4lb1chnoM8I2sxljWadM+yFUZCXnDAUA0mtM4eV3esB0hyE54X/BNkwy0qvX9S4T4jXZXSvMeN4Gj7Qj1qlFb3ylABiZiWXrqR8BjwTtFrCn4zm2mIAD+TwMNjXwyd8yMZUyjTqXTsBYbFW5OyWz80vKjo64XSWf4gJdb7J5VQTA4TCb5FZmQqA/fHDTIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ldf4+ni4bWcNfQL885EGE6ZpQjdRaS0D0GFwl5I4vg4=;
 b=O4wU4bUJ03UaqGmSRFRpQMhwchIrBl9wAnq2MRjJj+CZZvI/PmPJCSS0n3p4KNCQu6hL3odLZ+iAbsAQ+1Ump82ChgF9YN69iWq4HdAQ1QOW+COklLeWbr07DSon/Hk4ckA0MC6KfwdBF3BW6ql91uRv7xQJNcDLfEfwXBL5Fq1x3x86mQ/mGpqPL/OXJJuQCp7a6+yZrUeCQWMxqUF5t0ItCDL2iJbHFQo5Tg3EU4StcpM0Qy3sZnW5g51Rl7q9RqPd3YktssPDWnCHZ8ChtrxA86aAPQTMBNN4IQjB7i481nKs9Mdr/G3Zr/PqngicMjvGfCk4+cZ8mD12izSRtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ldf4+ni4bWcNfQL885EGE6ZpQjdRaS0D0GFwl5I4vg4=;
 b=YybK/08TRvVSl8TIk4szTj8zshac0Q+NEc9oftC6k8P0T526xJK87NCwLub+hHFPUe7m1J/M98G2Sa8akvg6aNC0E7TPzKzxyIwxvyOya1tP65c+CsN3b8xwVnMbaNnlzO0vzqdfAmTx3kTNI9PA67lh+NQfda9K9CtUVBjKj30=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BN8PR10MB3729.namprd10.prod.outlook.com (2603:10b6:408:af::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Fri, 25 Mar
 2022 19:20:31 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a%5]) with mapi id 15.20.5102.019; Fri, 25 Mar 2022
 19:20:31 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 17/17] vfio-user: avocado tests for vfio-user
Date: Fri, 25 Mar 2022 15:19:46 -0400
Message-Id: <d7b8f39202d4ec8f08da8222bc2e0b1ca27bdd30.1648234157.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1648234157.git.jag.raman@oracle.com>
References: <cover.1648234157.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN6PR2101CA0024.namprd21.prod.outlook.com
 (2603:10b6:805:106::34) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3b56383-319a-45c4-0527-08da0e94872e
X-MS-TrafficTypeDiagnostic: BN8PR10MB3729:EE_
X-Microsoft-Antispam-PRVS: <BN8PR10MB372922F5779BDCC7A26FD3FE901A9@BN8PR10MB3729.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DW45cz+/rdt+VHGgRfAVGpK8R2i0L8j7dWfBQNfOO9qAH0UoctvD/O/QTE3+0iPqC3TZL6XqM1BREiZptxoH2746fFunQQ5Qze1J/A1nPdrgBMLxjrlL0Aa8s8oxV4NqnxiUFVweoN7WmbE3FYmae6a3Midyge+AatVEJWeWoejftn3qySe+soYZJrqDPNxpDXCbCDNJGUoGeodmVQLmKblab3ZIEZLhcsZaGwDi9yRzZbZ/CysHZzFTted7QJVw/2zMl4iA5BQh7ILwQ1y1vdboMo0JmtQUYXqeiN77aj6rtY86yafhdIA/YXDnQSk9oGK5fh4eX62V8uJa3O9SZHF/Uo9wATqaa+QDrSns89Lw/gdRrGUUlMkRPTczOIxYwAtVVSWHIzRc7K2uCJ7KW5cnWk7lLtz/0LokXaMDbooGJ6O2tmC2yNNbJJBYgGUthnV0j+ULvIPDjzciy0svwN19hkFuCucE3FeUWsU2uQkQ+HWBNTdr/kNxi1ywfjFbTPDIbKKvo/5AG+0osa5gRw/GR5d36AmFuw+Lqx97xadjmfQBuDTouyMVHBzGMzFJWeVqeTQyX/vSlsmmooIfZH0JJo63Nwk6ocOF7VuWA860qyxAC1+3NhFUEnT4UYRYDlIO7D7rH86i9g2hM0dARsV8RpyT5PFoox4PUjGy5AjD2MAGdu3OyYjL1bjB8urmbMcwszIdDD4AXZUf7D90VFxoUeNw2vHfeyEV0p0A59F7Xo7JcmUVHqod2Km553Q+TR3JJ6mkaQPr6MoxP2ksdvEI+yDKHX8PkRSr+71f73k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(107886003)(6486002)(8936002)(6506007)(2616005)(8676002)(4326008)(508600001)(66476007)(86362001)(6666004)(6512007)(6916009)(66946007)(66556008)(5660300002)(52116002)(2906002)(7416002)(83380400001)(38350700002)(186003)(38100700002)(26005)(36756003)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NfWl+7Tm0OZQ7HrYrEE0145hAiAcK8/DzQFE2oz5BPbSPAN12N0UWVwWE4ht?=
 =?us-ascii?Q?k7xHXy76L8eeCxIqUM0RrYznDKJWoC9SIShwao0qo1b1hXGdLO19zun53VME?=
 =?us-ascii?Q?E+nZYHoikJReyGwpJ4gUcER/uLjoRRXupVZSEklzQ0hDz256rY4kcMvrXOTj?=
 =?us-ascii?Q?72e04ydiKgt+1Cg6b+i/hD6+Ymx6J2dyTTS/QNlHUCq1WQoacmacF+/J2ITf?=
 =?us-ascii?Q?miUHHTvaoBUsKlb7XuRCgweKQc3R1eZ0TIrwf9WXU892gu/m+gU/OEYAO6n5?=
 =?us-ascii?Q?MOj3i+9dZV9mLkfDidMQxJQqx0qqzCakEu+8/ZIqhwFSYj6U/DbzrTjNRGFQ?=
 =?us-ascii?Q?V4x7wzqL5wldo30XJ5NhUgyKt3SbPLkE9JH9cUl8IYoWjdODNGj5vDHf7RbF?=
 =?us-ascii?Q?tRG9t/JWoXHkK04Pi5Ai76tCEiODgTb2ud+b9/geiD8WD7m3XN2FKzhH0L9r?=
 =?us-ascii?Q?ywVTGi1YQwVxF+9CXBfIwIij43IwqcGwJFFYaLhZjesUo9Kj6ckm0BbOfXeW?=
 =?us-ascii?Q?toVwAJh7ExzMterls4B5T+SaeMiW2U0ofh61R/fptFrlzBDhSyVZRQ9WH+Uw?=
 =?us-ascii?Q?NABqxiEVEP+o/IMJC62IS11FJyuxPxoAv35lMIF6zaVBM4z/k8KYjnoGk7nV?=
 =?us-ascii?Q?pX/HWOHoEWrJA5nF5U275nmMbkIHj0+U8SBCc5daiHUEhbWnPCvumiV5Fvb+?=
 =?us-ascii?Q?eccHgMVH7/couT4ygBtkI+6Fsmwgy6bpNZ/vKH0LDMrGBEOiOzz6DJwUJMiX?=
 =?us-ascii?Q?BB1G6fFH5MBst0nByRij+sD5yMzCXuUPZukkm8xv1zSvn1muSoEmLescDBgu?=
 =?us-ascii?Q?I2P+qsR825Pb5KNJKyZYi6LQILobeBXaHgmBnE9O2QJILJrkNFQXgSC0tAEh?=
 =?us-ascii?Q?kIt75hXtagc6+DrX1sAwdIU836vF3WP5KQM1lKdlLqEBz9uiyrgGeHYAAoFJ?=
 =?us-ascii?Q?6yGGLBL6cigqQjF7O4xC34TmZzVRHfIEiHVDdl+je52rL5LHEccpPAAY0ZGZ?=
 =?us-ascii?Q?Vwgy/U7PIii8mtSd0dK+OS5xAfWVyPb8JZQtxWwiirYYHHacegcgH+fo5yPE?=
 =?us-ascii?Q?mqgLO+lsgFhWYKkHSdGlL97Z18NCuI53XYfnE6vHF9hLWwq7VAaDklU+2Kqb?=
 =?us-ascii?Q?ZXh5iVDhvaO7gh9OiRX38lkbt4m8nrWEkMetxEjS/m3okCsl3ZGWscDzV/18?=
 =?us-ascii?Q?utoUti6Yt8i/Pf3irzs3aeq+TNlF0iKQPl021oWTzmUKZ1cezWPYeiLy4+MH?=
 =?us-ascii?Q?fCj+SOntdvu29qvYmy0/pOyv+cFlA76umkZa0pCka4FRm+yGf9Rx9KiJSaoO?=
 =?us-ascii?Q?RNx0P5sdvcHhYrnqc9hGNKJ/eMiVO2YYPxcGhksDVEzl1JAIwXIf88jchSOZ?=
 =?us-ascii?Q?mOpT2fPKnvXYQyIjO1WPUGA0eyp1wonVZFXRGNBoqkz+1O3cly/7jteEYSmx?=
 =?us-ascii?Q?8yuY05vxyfIXTIHxEOuZG4W1ZNCEQIG+ZG/5bb/OKtzaGjscPwYg0jmibqaF?=
 =?us-ascii?Q?JyxEvaVXm42dbSdW0c+BF6btaoePCGCbznIMTAO13JwV+x3FzdI8W/omrfxW?=
 =?us-ascii?Q?G54eOQpv/kckOhX5gdqLwpWVC1LT/8vkXiQVHpxlPz6EPenNgD8d8QRrKq33?=
 =?us-ascii?Q?sAA0/PYLbI01/EdlVV6IUisayD5UB4qQXi7WfNk3YD4KW1n1lobcbXzXmGg2?=
 =?us-ascii?Q?FHh9egjWuwrRJFJKPGs9MObmAGP3YJGN4Ww8sGZYA+jFh5H9tbc8PGqf2dWB?=
 =?us-ascii?Q?/gN4JzdG2A=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3b56383-319a-45c4-0527-08da0e94872e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 19:20:31.4422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MHfRBiHRxvVBlSPInZMahaDT0MSI0X//6PIRQhDr+iuNhd8TU5LPUGyyrYhUCqWSSTnEBC9o3H36WQw5qujM0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3729
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10297
 signatures=694973
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203250106
X-Proofpoint-ORIG-GUID: OJlI_jUFeuQyoMzqRCv3HTZ004tDXHrS
X-Proofpoint-GUID: OJlI_jUFeuQyoMzqRCv3HTZ004tDXHrS
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org,
 alex.williamson@redhat.com, kanth.ghatraju@oracle.com, stefanha@redhat.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, jag.raman@oracle.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avocado tests for libvfio-user in QEMU - tests startup,
hotplug and migration of the server object

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 MAINTAINERS                |   1 +
 tests/avocado/vfio-user.py | 164 +++++++++++++++++++++++++++++++++++++
 2 files changed, 165 insertions(+)
 create mode 100644 tests/avocado/vfio-user.py

diff --git a/MAINTAINERS b/MAINTAINERS
index d07f2a0985..f165281796 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3602,6 +3602,7 @@ F: hw/remote/vfio-user-obj.c
 F: include/hw/remote/vfio-user-obj.h
 F: hw/remote/iommu.c
 F: include/hw/remote/iommu.h
+F: tests/avocado/vfio-user.py
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/tests/avocado/vfio-user.py b/tests/avocado/vfio-user.py
new file mode 100644
index 0000000000..ced304d770
--- /dev/null
+++ b/tests/avocado/vfio-user.py
@@ -0,0 +1,164 @@
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
+                                          'PCI_ID=1000:0060', vm=vm)
+
+    def launch_server_startup(self, socket, *opts):
+        server_vm = self.get_vm()
+        server_vm.add_args('-machine', 'x-remote,vfio-user=on')
+        server_vm.add_args('-nodefaults')
+        server_vm.add_args('-device', 'megasas,id=sas1')
+        server_vm.add_args('-object', 'x-vfio-user-server,id=vfioobj1,'
+                           'type=unix,path='+socket+',device=sas1')
+        for opt in opts:
+            server_vm.add_args(opt)
+        server_vm.launch()
+        return server_vm
+
+    def launch_server_hotplug(self, socket):
+        server_vm = self.get_vm()
+        server_vm.add_args('-machine', 'x-remote,vfio-user=on')
+        server_vm.add_args('-nodefaults')
+        server_vm.launch()
+        server_vm.qmp('device_add', args_dict=None, conv_keys=None,
+                      driver='megasas', id='sas1')
+        obj_add_opts = {'qom-type': 'x-vfio-user-server',
+                        'id': 'vfioobj', 'device': 'sas1',
+                        'socket': {'type': 'unix', 'path': socket}}
+        server_vm.qmp('object-add', args_dict=obj_add_opts)
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
+                           'vfio-user-pci,socket='+socket)
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
-- 
2.20.1


