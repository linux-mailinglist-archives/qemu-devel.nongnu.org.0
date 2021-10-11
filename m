Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71564428640
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 07:37:51 +0200 (CEST)
Received: from localhost ([::1]:48236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZo0U-0002Oq-Hg
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 01:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mZnug-0002lT-NH
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 01:31:51 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:16704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mZnue-0004xf-Ip
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 01:31:50 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19B2iKRA029456; 
 Mon, 11 Oct 2021 05:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=eD2ekZl5jjPFtCy3GYmlWleMdhKmcbLq+SU4rNCMLE0=;
 b=Eoej43TFODPDsVw5dG+yeEd/SFGFP+IsqudxUkbk5hA4w/zHc8lsf4FQqmN+/d0FA8/K
 uKiyHPVkosYQ4co5MmiFZcERm6k+Do/H3SSupTNF7ulC6kWJeNoC5m//Y8O1TXk7M5jc
 536NSm97S8xX3hHa6A01g1QcNrqw9dP0Ge2LApuJDw7WNaNYQrOPZq8/Ll4U3KdC23d3
 Zpt7Zpf1wUAZqTvA4paT6hnqd32n/wa5/1zkAISwoUDXhaaxiqCCCfV4PfRaYpHkJTJJ
 kpRalb544pmdBo4Tt3/g+8OqwUIY5giglTkYqd0zhyFvYrNFEiDctW2ZlmAs8vxYw9ld OA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bkwxh1v8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 05:31:44 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19B5UcR5104800;
 Mon, 11 Oct 2021 05:31:43 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by aserp3020.oracle.com with ESMTP id 3bmadvqgw4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 05:31:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IgicnqEnznp0ngefvMi646F288jDsdfwu/0mDYF968mDyNuvi8wa7PHFbXNBCEkQrggUwzLwD10/MbdodOT+lBoHXN1tuI2ifzTbEuFuC/Eqztqa8dj1+1NAbg7YE5rXYuY69Pz83pa5z3SrSdWhxfxee1mzxVAu9ye6vW6/O1b0GmImFOTzK0pl49uoQHdvOljoUGlh8/Ai0uvMeS7iU8VuiV9TM4r5dJV9HFGI0W2dxQX0FF0HW2pDuIPLvJiwU/l+iyVQjz5t2ycBuLM4hn2pKL16BJYzwsoWkXE+AJ/sK8w1fgWBrY3BwpFdhG7TQMGUq6DoHvRdgv42mETZrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eD2ekZl5jjPFtCy3GYmlWleMdhKmcbLq+SU4rNCMLE0=;
 b=UmI4y0FQKODXB/Gvrg4dcaLDr9c9WAP3pz63WLDM9+U3ep+QGS+Qa1JHWLYicKKLZvHPLZY40cW8NObmRswkeqhasAr7DdN4SS+HQWfstwh45/ocvibloAwCfRn4/Cg9/3zd3z4wPhGSz1/2u6yx4cjjqGQhUlyXJjR5DpV7n3YfOTFN43DIcH8DnFDP+LkQTjMB5m7qJWmoplnMllw+T/Pf+RWF1022by98iHlZ5Qhzg8dkcnL19aiyHHky2m2IY7KRczWjnlPHEUUomfqrIGNV236oNC7QRjizzdON2SzKgp8B3Zdw177urrmzfrF/vThBsQrLbDQSVVUwjcHRSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eD2ekZl5jjPFtCy3GYmlWleMdhKmcbLq+SU4rNCMLE0=;
 b=QDLYfeFx5x2wkEOAHPFpBPy8L+0tsoTTTzfyYpJPmGDpNWS87NkZCZGw3YbTq3UkUrRvh5LdvuALe1ssq9AF/W0ZCUway6eet9yYWKa757hwDGZ4x3UvNweirUwnUMIAkK1x4MKoO61EGO4fqGTATgwHHpSYJKf0KWo42lHO30o=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3902.namprd10.prod.outlook.com (2603:10b6:208:184::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Mon, 11 Oct
 2021 05:31:41 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::48d7:8ff1:200c:89ca]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::48d7:8ff1:200c:89ca%3]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 05:31:41 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/12] vfio-user: run vfio-user context
Date: Mon, 11 Oct 2021 01:31:11 -0400
Message-Id: <489671ef49381437a03917a87dc143dd9fc90559.1633929457.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1633929457.git.jag.raman@oracle.com>
References: <cover.1633929457.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0072.namprd17.prod.outlook.com
 (2603:10b6:a03:167::49) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
Received: from jaraman-bur-1.us.oracle.com (209.17.40.40) by
 BY5PR17CA0072.namprd17.prod.outlook.com (2603:10b6:a03:167::49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Mon, 11 Oct 2021 05:31:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbf07450-92b5-4dc6-6dd9-08d98c786777
X-MS-TrafficTypeDiagnostic: MN2PR10MB3902:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR10MB3902D038502C01E0E21D57FA90B59@MN2PR10MB3902.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:428;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l8fVW9P9dH34DZ64Z7Zxo7snL92EG3iANjqxO3MZY3jTcFznvgZJis8KPKzr0qXwtxef3RnbYazztsZmIaa+4M5fBSRP8udreE1edt8O8KOsWS0Lm7g85LfijcijmYzZM2cnVjPcgcHoEGgAPciC3W/3ucYmrt7gUj16Tfp6uDOSz7PcZ3Isse3G8JPoA1Bn+fmzJnPlmZzL8g7iuhQq476Jeo4MQEbjqPIoPb1Kv6jKCV0iRvL4Vm1Tlz6eZ/CrMU62F/8l8m7BlHRm+URAvqPSRv7SU4OsKmoluh1TKUBDpusPHZSEGd1M4jyNWnz9DlDPSwnqXfLnbJPR4nxQJjin3Iig/9HLVoKnb2rEESnZnLHP+0f96L6Gn6Sw/7Bn5mnx3IS8l6qz+aIpLuiLSxQoTlUa8IzDkRwaCTgxdx8i1TypyYtIi4SluRL+679hYi7LlXhgi59e7JOnyvM8QSQKuSN5qWW7Rnb5Vq+ESBKSH9YTkw5tUQEXcTcuHvDLnkBIoo1fDz5tGx8Luapa368Lt0AIXI13asH0hNpa3d5arZ/zsEZc5q9coM9KUpgFL59yKZ3zeDYen3+zOPT9RokFfdX6mDaOVWhDs11tw7NBvW0qaRxjaC8S2etHia1SVLDS4kjc+Y4r4k5+RBvZmISX6/5/QJ6fSKpjRgJXxuonFpLp5aoML4+GviioZZ9GVptqO9Csari7oImV95/yBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(4326008)(6916009)(6486002)(186003)(508600001)(8676002)(7696005)(26005)(2906002)(107886003)(52116002)(316002)(38350700002)(6666004)(38100700002)(5660300002)(8936002)(86362001)(66556008)(66476007)(83380400001)(66946007)(36756003)(7416002)(2616005)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lq9Bf6dXMTr51Fb9vcR6iFQg1JVjLqiNgq1CbdlJME5tzrbPg8CFFdl7+dmX?=
 =?us-ascii?Q?jRUAfeNfoXTaJblEMXmhBY7CWdEESDWEndtIYwIHdosrgQQnSsufH0w64guf?=
 =?us-ascii?Q?SdAF4a5eDUERU5d8AUrwLFUOlfAy7lk+pHI0TnWrdzefuc2JR8r13R1+LKm6?=
 =?us-ascii?Q?h2jJ2rMucrpU3oCbMQkLUujJPHaA32F4qZDSjjxB8Zxjl1ffLkfW2VqOQ8E0?=
 =?us-ascii?Q?1qM/5SfgeubxuNaHtyd2Mk41fisZibQnLwx5rAx7LPTEQkNx7+frtDhuUMZe?=
 =?us-ascii?Q?nTiPk+oGwTBikAr/3xROoNnMHyqEs6mCkwV2Qfj96Q2slG12YUcCkfF6+uCd?=
 =?us-ascii?Q?/vEBvMY6QswBsXWvAuxTn9+Bg1MUgHMir56Ck7ShiFF5T7LK0hgZCZZsSnXO?=
 =?us-ascii?Q?4cEXNHs/RPfFqocwNraUVMDJuGZ6J6sU8nMfJcKpeFOqEuAR/E3P8gsJdurn?=
 =?us-ascii?Q?Bti/qdLG1Kiup56zPpZF1tJTozblqxUuS7LqwS7PutY9XwNQKQdsVMlpN6/U?=
 =?us-ascii?Q?xUGcN9aZCshuX01uCKlM8vYB1jN/mBtDtWY9wLi8eJsW98QfDOaG4yVz5yVF?=
 =?us-ascii?Q?PDeW1/Yi22dmFpAWgaztTpnqpHf82/CY0+ngeq4iKw58E1L+bKNWntzsJIaG?=
 =?us-ascii?Q?gRUgpyVeu9oXPDHQKGmKut4JFaavgqt0mtkV1j5LxarfkPJQx9Ht7f75QsSk?=
 =?us-ascii?Q?kRv8QUzD1cTTKne3xJTJfA/oQE70s1Z0oVARDKWwHXR/e0xkR76GxzcL2uXo?=
 =?us-ascii?Q?8CmTgmY7Uyd69cXFMeRtRyPlcTjSCXKXCprQB7is+l8/byPTo3VipVj7s+Kb?=
 =?us-ascii?Q?ZpYYIjXLVkpDjNHYNQwwAJPCy9hrIby2fypCqz3sR4zBS5O6n+KS7Qi/vqfg?=
 =?us-ascii?Q?oLx2QrqOucxJuD+Cs1Hfd6U33nR4TNfsulh6Mtly4Xmh0faa0+YBuIZd9lYi?=
 =?us-ascii?Q?MGPsEHc0cmgqmZbrqUOV230O9hPpgQEHGHEzYmW87uh4Yk0JDKZ81okrj/uA?=
 =?us-ascii?Q?4lAHQDNqmxbQmalef1WZcfkpG/4Boby5WJF0c73fL2hgj3C637+rJbVE0mjH?=
 =?us-ascii?Q?wPvP6BcjuI9IuFpsX5ekSULaoQvkF5dpWTdPG+zvhmxVNg58iPcEN0eaZ8j+?=
 =?us-ascii?Q?SXvkkwYWuKvlKfYLP/Tagxx0XePghhwAWx/puYHJujj0G2r0U9c1Wc05z3YZ?=
 =?us-ascii?Q?haviBPk11lAcMMsnzLeE5PDm7MDzulDtlMAY7Zt4fcDQLkW0qnIBh79rFTK3?=
 =?us-ascii?Q?x3NBnDb8IdOBwUG+CAtkrJW2G841JHjYSXWXEj3Xp2weouim2euPmH+iVPi+?=
 =?us-ascii?Q?VpGyNzP7eA1ETP+9ocIlXOiz?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf07450-92b5-4dc6-6dd9-08d98c786777
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 05:31:41.0999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pW6yyMZ+jvqeF2eFvkQhFGmZi8wRPEwMPEnKp2HleGKb+gP/koDMaGqTRPPBeVYUUDMflgC8Yq5lM2QeeC5pUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3902
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10133
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110110032
X-Proofpoint-ORIG-GUID: SIOVuzC2WtDD7KdPNfZSaYunYOTYwU9n
X-Proofpoint-GUID: SIOVuzC2WtDD7KdPNfZSaYunYOTYwU9n
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 jag.raman@oracle.com, swapnil.ingle@nutanix.com, john.levon@nutanix.com,
 philmd@redhat.com, alex.williamson@redhat.com, marcandre.lureau@gmail.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Setup a handler to run vfio-user context. The context is driven by
messages to the file descriptor associated with it - get the fd for
the context and hook up the handler with it

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/remote/vfio-user-obj.c | 75 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 74 insertions(+), 1 deletion(-)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 7ce4e5b256..05f7fff19c 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -42,6 +42,7 @@
 #include "qapi/error.h"
 #include "qapi/qapi-visit-sockets.h"
 #include "qemu/notify.h"
+#include "qemu/thread.h"
 #include "sysemu/sysemu.h"
 #include "libvfio-user.h"
 #include "hw/qdev-core.h"
@@ -72,6 +73,8 @@ struct VfuObject {
     vfu_ctx_t *vfu_ctx;
 
     PCIDevice *pci_dev;
+
+    int vfu_poll_fd;
 };
 
 static void vfu_object_set_socket(Object *obj, Visitor *v, const char *name,
@@ -105,6 +108,58 @@ static void vfu_object_set_device(Object *obj, const char *str, Error **errp)
     trace_vfu_prop("device", str);
 }
 
+static void vfu_object_ctx_run(void *opaque)
+{
+    VfuObject *o = opaque;
+    int ret = -1;
+
+    while (ret != 0) {
+        ret = vfu_run_ctx(o->vfu_ctx);
+        if (ret < 0) {
+            if (errno == EINTR) {
+                continue;
+            } else if (errno == ENOTCONN) {
+                qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NULL);
+                o->vfu_poll_fd = -1;
+                object_unparent(OBJECT(o));
+                break;
+            } else {
+                error_setg(&error_abort, "vfu: Failed to run device %s - %s",
+                           o->device, strerror(errno));
+                 break;
+            }
+        }
+    }
+}
+
+static void vfu_object_attach_ctx(void *opaque)
+{
+    VfuObject *o = opaque;
+    int ret;
+
+    qemu_set_fd_handler(o->vfu_poll_fd, NULL, NULL, NULL);
+    o->vfu_poll_fd = -1;
+
+retry_attach:
+    ret = vfu_attach_ctx(o->vfu_ctx);
+    if (ret < 0 && (errno == EAGAIN || errno == EWOULDBLOCK)) {
+        goto retry_attach;
+    } else if (ret < 0) {
+        error_setg(&error_abort,
+                   "vfu: Failed to attach device %s to context - %s",
+                   o->device, strerror(errno));
+        return;
+    }
+
+    o->vfu_poll_fd = vfu_get_poll_fd(o->vfu_ctx);
+    if (o->vfu_poll_fd < 0) {
+        error_setg(&error_abort, "vfu: Failed to get poll fd %s", o->device);
+        return;
+    }
+
+    qemu_set_fd_handler(o->vfu_poll_fd, vfu_object_ctx_run, NULL, o);
+}
+
 /*
  * vfio-user-server depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -120,7 +175,8 @@ static void vfu_object_machine_done(Notifier *notifier, void *data)
     vfu_pci_type_t pci_type = VFU_PCI_TYPE_CONVENTIONAL;
     int ret;
 
-    o->vfu_ctx = vfu_create_ctx(VFU_TRANS_SOCK, o->socket->u.q_unix.path, 0,
+    o->vfu_ctx = vfu_create_ctx(VFU_TRANS_SOCK, o->socket->u.q_unix.path,
+                                LIBVFIO_USER_FLAG_ATTACH_NB,
                                 o, VFU_DEV_TYPE_PCI);
     if (o->vfu_ctx == NULL) {
         error_setg(&error_abort, "vfu: Failed to create context - %s",
@@ -152,6 +208,21 @@ static void vfu_object_machine_done(Notifier *notifier, void *data)
                    o->device, strerror(errno));
         return;
     }
+
+    ret = vfu_realize_ctx(o->vfu_ctx);
+    if (ret < 0) {
+        error_setg(&error_abort, "vfu: Failed to realize device %s- %s",
+                   o->device, strerror(errno));
+        return;
+    }
+
+    o->vfu_poll_fd = vfu_get_poll_fd(o->vfu_ctx);
+    if (o->vfu_poll_fd < 0) {
+        error_setg(&error_abort, "vfu: Failed to get poll fd %s", o->device);
+        return;
+    }
+
+    qemu_set_fd_handler(o->vfu_poll_fd, vfu_object_attach_ctx, NULL, o);
 }
 
 static void vfu_object_init(Object *obj)
@@ -178,6 +249,8 @@ static void vfu_object_init(Object *obj)
 
     o->machine_done.notify = vfu_object_machine_done;
     qemu_add_machine_init_done_notifier(&o->machine_done);
+
+    o->vfu_poll_fd = -1;
 }
 
 static void vfu_object_finalize(Object *obj)
-- 
2.20.1


