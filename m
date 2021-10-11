Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2208342863D
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 07:34:13 +0200 (CEST)
Received: from localhost ([::1]:40326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZnwx-0005Rp-Nn
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 01:34:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mZnuj-0002mC-5q
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 01:31:53 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:20142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mZnuh-00058h-3l
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 01:31:52 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19B2iVKD004162; 
 Mon, 11 Oct 2021 05:31:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=kKkh2AYJK6EzLdF3/TGOZT9lXWqxZUlv1hHLwg5om8k=;
 b=cYJEjZDwe4Az4uVBGDRIsmyDSmvamFxMTl4fiOcqluMkVqf3GtRjUuG3G6ItlcjOElIh
 CZtLJVg26MmmEJPpsPLXQfFMJ3RhXEQ40HZXyoHnLRraWf7MMRZhJwVqezQL3huxf5e9
 51PsOaqGVVRsms5UBVIzws37bFHhrw/lbjYNRpGZW4VHmBKLRLoGXxVM9UsNnwX7meZp
 E2kSEL7zp8+mRBa/FkIUbEb0xCNbnc1O6qd91yUWgtOSMI3MOle6V2C2rLenA4xpqFMc
 ecbF/uJjTDKluY4v9ZTCJ/QGwkFL4SFYhXN+AcSvQvCFO1xOrEYH2tN+kdxfESpapqfq Ug== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bkxxa9r6s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 05:31:47 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19B5V1Te123600;
 Mon, 11 Oct 2021 05:31:46 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2040.outbound.protection.outlook.com [104.47.51.40])
 by userp3020.oracle.com with ESMTP id 3bkyv7ntca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 05:31:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BAcGMCbluiaAnMuzbd7cX0TLCG74hDmTxoCfsWHos6iBg7TXXRmYRguqX1aWIv8JtWnC4WbgVvdR4lWxGxHcqA1Fdfut7b4TSIyfLvkBMgV0ZyFgBU3t70zG/fQYDZLKpP21+52bQuBAmUFfRpdERsKSstPpEwHkYLyaorfme86EAik/XhB1wOW3wv5Fld40BVIDbDwmWzxZqiAqVpyIXsPKymgirApnA+NJfaQAGiQN76TOU8/m3w2c46d10GsUO25bTtjqhrQbOJd7mVvdNmzPexci87SAeZnRkmFDRoZH5rtM6PcmuCz/t33zQoN8mgqsStPMne3oKSTjLw3/mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kKkh2AYJK6EzLdF3/TGOZT9lXWqxZUlv1hHLwg5om8k=;
 b=OHg7pfbhYg02YQrcPZFwk6b79AibU8LBsLKrWxt8ru/UGM/Mt/ntUZXS9nWLoNBwFmXMbW3V2tXCqJvAfUY1UruiTOn+xYYsxREWjsIQHpKLRwPdtdgfWLSfIiuzZoYnB7+HABMyJ8F/jMXmAyeRTY89oIJv0TgWUOv+8fjjrY70VkTthyv3klOtUuNv6MfpWbbnT+jWpxQWnwrPn3TPsVrmXxQOQTpZVMhedL7c/AqKnzvuHPyMbnLsLwi1Nod1qP8FDzSg9jtABqzY4D+1q5N/bURJy4jgzY9kChdUNw0iboZi77goLvNXo44A873SlBtyA/N8aUnaX49qW5sXwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kKkh2AYJK6EzLdF3/TGOZT9lXWqxZUlv1hHLwg5om8k=;
 b=Q6M98NW7kRCzjSj3sOVRYHEcUn0IHrmOtJBYgHJ09KA2y8Gby62h1NvloIfXPtUU3s4QEhVtGbRNAqNa3ZW7xNYbaX/vDA1NCp3J9nhEQ/HoP5+KLekNZNSsA9d8Lv1h9zIDSrKyg6ySn8CP7xymopEYSlEL7njyNoS0sJfnnAM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3775.namprd10.prod.outlook.com (2603:10b6:208:186::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Mon, 11 Oct
 2021 05:31:44 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::48d7:8ff1:200c:89ca]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::48d7:8ff1:200c:89ca%3]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 05:31:44 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/12] vfio-user: handle PCI config space accesses
Date: Mon, 11 Oct 2021 01:31:12 -0400
Message-Id: <eb770c1ceab027917cafc235d41f33f42791ebec.1633929457.git.jag.raman@oracle.com>
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
 Transport; Mon, 11 Oct 2021 05:31:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c099d46-efc0-4e25-209f-08d98c786919
X-MS-TrafficTypeDiagnostic: MN2PR10MB3775:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR10MB37751CE4990366326EB7D9D590B59@MN2PR10MB3775.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:409;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AetoVzM2q6lS4AUn9uYtCv+DZkSHAReMRTqU3CfQgl+Fg/O/aPWEluy94eYXsnX/AIInp6TI7JFCR1gFGCiR9lC5w0BIp1nrtBvEteC8d4VdYbySexdoQG5H4rzTuJFAcKp9sdEKnXg7qkILMMqto3byfvjEX574RUNFfEFlvMjRQ7wSNp/yl/BsuFPvwrENid9mW7WBzvjusSmKdD7QxQPYCpn/PmvmA0bHFYXvoI1oeDOYAP4/Gq3FfVCYurV8/qG98TP/NF1NbsmKU0v1qYGCbG0gjXbo7edKxWEdtgiqtv/sfPUeTqCgjnzCTCf+PO1vZFYxD+mISJirq6r/W4Lc/mrS6nBeIpbI4N9fJYW2tTu4cGmVsHbO8x9vH3LtikVEDuHYmgZmRnLb7iayUX7YKJK8Aa8u/m9j/8LOhAjys/w24NPJ/L1HD8vnmU9M+BMXyNAGkFsBeLbpsi2OmAmMO9E4Ijv7JZC8WtkRJHv84RfchqUzhk+z63MYqlmS8L3d5MfIlFFB11PJXgxWN+47PaGLsf16E7/1lRRgYBocnCmPyJqnTATLuy48W8PgDKJ/E9Qjc67rokBpa1C+K6O8z6YQvjJ2j+p3V44yPCsB0GZERm0t6XQ3ZsJIqfcrdYA1kOX6IUU+yErcNJN2cJ4KETA6i1W/GIcrMEmifzJ+/gcbo+Pk9u8bQ/EOBwGnGUc7v/mrDnZvGWup3OJfTw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(316002)(8676002)(36756003)(66476007)(956004)(66946007)(6486002)(7416002)(4326008)(2616005)(508600001)(6666004)(5660300002)(8936002)(7696005)(52116002)(6916009)(2906002)(107886003)(186003)(26005)(38100700002)(38350700002)(83380400001)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aKkUNezJa+Ssgav0/BvF1hea2i3engl7cYWg663ut/9M3OoGRXJ5kH5HY53s?=
 =?us-ascii?Q?BfyqJuZza2g8cX3mXc+97Zjt5IfBW7tNk3MinC+Um+kwu4hcvDwa9B9kzwuq?=
 =?us-ascii?Q?CwQ1hI4qi2wpy/ZY7c24IdZPt8D40AMXNFpaRWLNNVhEikZ53r3ri6wzJNRY?=
 =?us-ascii?Q?0OhYfXxgbujOOViEQ0bgflRk5P39+jIBKz6PDc8KpHS+V8h/ExjjEvFpDCtV?=
 =?us-ascii?Q?4ZW7LoXIwhTGMTUKk2aZB7GhdKr61BNLXdaP8NAkeYE8ERmXHU2z6cbNT2w6?=
 =?us-ascii?Q?lCMMcjE1n+DM3mSU8vrO+H0562GJOKmHrkAF6mWFEMpxBP9rD/EAVHR/hrVW?=
 =?us-ascii?Q?EaRZsrCwcAOGM+sZE0fxNkEtnBM9XqeqopTMaijI/Ldxk0q4kI0XdIAvLyPh?=
 =?us-ascii?Q?Nzi0TqLLLS4ns+MlI4pgZRZQ7tkSQPcj8wuHXBv1XdppE8xl0yoDCbFa7UaO?=
 =?us-ascii?Q?uAWGglUfTMhvRdR8uVIszwogZVrl9M/xkJLgTDOKtbi5Y1d7TW2gDMCnatsc?=
 =?us-ascii?Q?FKJIIfN/tWGU1J2G5jnOqEqvzhzR0NqbT7gdKxJnz3q5qr2+PUZA9J6bzTn+?=
 =?us-ascii?Q?NjHHRg7X57MLTG3nIk6N/FYMiDINb0elVRZtbCXqomnjTWgmGQih4NHAyKBZ?=
 =?us-ascii?Q?nk9W+bgvKNFKKP+c/B7n2VuA0eZ0L6Z9uXp/yGdc6Lz3KI+C9Sq90E/tvMKo?=
 =?us-ascii?Q?R5fD/JcV6hL9J8VrBv3PaV9UY/HjkVoxZxcTcyo5XGLUXVbceIRMCGy2p1kU?=
 =?us-ascii?Q?sjOWE7XrHocTZpzcAz+lTPcgsNNkZrbn65fLPyX5i5MncPcfwODdSd4rrhfC?=
 =?us-ascii?Q?C2F5mHk1RFvqd11cIgf8ClH8nZ6pH9uP7rKa+LFYamlaxHqOGEQ6K+yL+2Ku?=
 =?us-ascii?Q?KHVKZNm2uw/7CcEtuECLIs1wXCMTi8OA+ZVrc86nRICJWNBKHsTgbum6Ev7q?=
 =?us-ascii?Q?qJs0L3PwjU9wIN9/UMwjWvQnmPaDIt3JhRCiyMCXyCuEfJ4yh5xzRHL+RXvf?=
 =?us-ascii?Q?JZT5pXU+fip4Dd5qA5PvdxQbmRyqrq1zDGmXUbRvHc5L6qiJF1Q4QY5nS4w5?=
 =?us-ascii?Q?UYZ350wzyULcjcBb+fBeY53HFbttQbm1krH3Sgek54Q+CyavtNZVMjdGHds0?=
 =?us-ascii?Q?56S4aNL5OVb5wX8WWxoh0vV64hD9lfXivrg1mLQmckYiyKY6EKmojN4SqhtJ?=
 =?us-ascii?Q?1EgD2+aKV86PiLrYGpFXSuB1VMb78Fy32ilCAOIJkmgqtsPGTOB8uxqg332x?=
 =?us-ascii?Q?jWm1pglHe9eL9QhNbjkCv80ocuvVhyylVn/mMueRl+Y1OAH+OAzcduQHsjO3?=
 =?us-ascii?Q?rbDEKWMpoM8GV390W5GTGjKC?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c099d46-efc0-4e25-209f-08d98c786919
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 05:31:43.9153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ldsplhJ+PWTw2OWXd7c+hjtGWC/SJ3iLuMMj/eBTXixaj7B+cmAGdI9t9Fpgf31K0xef0W2SrNPBn1k+oFKdQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3775
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10133
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110110032
X-Proofpoint-GUID: f1Mv41L9RpZ2Gf8TQyfbdveI-0uQb4x2
X-Proofpoint-ORIG-GUID: f1Mv41L9RpZ2Gf8TQyfbdveI-0uQb4x2
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

Define and register handlers for PCI config space accesses

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/remote/vfio-user-obj.c | 45 +++++++++++++++++++++++++++++++++++++++
 hw/remote/trace-events    |  2 ++
 2 files changed, 47 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 05f7fff19c..df5843c388 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -43,6 +43,7 @@
 #include "qapi/qapi-visit-sockets.h"
 #include "qemu/notify.h"
 #include "qemu/thread.h"
+#include "qemu/main-loop.h"
 #include "sysemu/sysemu.h"
 #include "libvfio-user.h"
 #include "hw/qdev-core.h"
@@ -160,6 +161,39 @@ retry_attach:
     qemu_set_fd_handler(o->vfu_poll_fd, vfu_object_ctx_run, NULL, o);
 }
 
+static ssize_t vfu_object_cfg_access(vfu_ctx_t *vfu_ctx, char * const buf,
+                                     size_t count, loff_t offset,
+                                     const bool is_write)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    uint32_t pci_access_width = sizeof(uint32_t);
+    size_t bytes = count;
+    uint32_t val = 0;
+    char *ptr = buf;
+    int len;
+
+    while (bytes > 0) {
+        len = (bytes > pci_access_width) ? pci_access_width : bytes;
+        if (is_write) {
+            memcpy(&val, ptr, len);
+            pci_host_config_write_common(o->pci_dev, offset,
+                                         pci_config_size(o->pci_dev),
+                                         val, len);
+            trace_vfu_cfg_write(offset, val);
+        } else {
+            val = pci_host_config_read_common(o->pci_dev, offset,
+                                              pci_config_size(o->pci_dev), len);
+            memcpy(ptr, &val, len);
+            trace_vfu_cfg_read(offset, val);
+        }
+        offset += len;
+        ptr += len;
+        bytes -= len;
+    }
+
+    return count;
+}
+
 /*
  * vfio-user-server depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -209,6 +243,17 @@ static void vfu_object_machine_done(Notifier *notifier, void *data)
         return;
     }
 
+    ret = vfu_setup_region(o->vfu_ctx, VFU_PCI_DEV_CFG_REGION_IDX,
+                           pci_config_size(o->pci_dev), &vfu_object_cfg_access,
+                           VFU_REGION_FLAG_RW | VFU_REGION_FLAG_ALWAYS_CB,
+                           NULL, 0, -1, 0);
+    if (ret < 0) {
+        error_setg(&error_abort,
+                   "vfu: Failed to setup config space handlers for %s- %s",
+                   o->device, strerror(errno));
+        return;
+    }
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(&error_abort, "vfu: Failed to realize device %s- %s",
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index 7da12f0d96..2ef7884346 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -5,3 +5,5 @@ mpqemu_recv_io_error(int cmd, int size, int nfds) "failed to receive %d size %d,
 
 # vfio-user-obj.c
 vfu_prop(const char *prop, const char *val) "vfu: setting %s as %s"
+vfu_cfg_read(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u -> 0x%x"
+vfu_cfg_write(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u <- 0x%x"
-- 
2.20.1


