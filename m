Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 530CC3BED45
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 19:41:04 +0200 (CEST)
Received: from localhost ([::1]:46704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1BXj-00025v-D0
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 13:41:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKn-0000to-WC
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:42 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:62594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKk-0006qV-0y
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:41 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 167HCleo005035; Wed, 7 Jul 2021 17:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=2hHfE6MEGogQzthqOH4vqs5xuVFIGzYUunqFpRHnOoY=;
 b=z8pdpVMn2K0Tai1vkDv/+vEIf7K5OwVljKq2AAiDiZLGz4WxQkj67PnFFUsuNEvhLSo5
 MPkMpz+nn0UWphrMvqZaOpsrLjmpcZMRXa3fmxr/hnLihfV02IkthbTExVgZnT4c7f5n
 iCSDIHew5xiAogoycGZQfHJdvoWgQM0FooNItVT8fZJix3Lll3+bvi6S1/WM+4+CRuZ8
 6aJL/BedhY1qfLXsXS5kCDG4KvWGB7umP4mPKTRkFFdoV/KaDLp498McQdCAtZTjTExj
 WOF/Hhuu+dkUJKQ+AsBTWX6p5x17ZuANtyHfUKk7zAZT1u45pagP4CGU4kVEZkMjZVJy rw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39n7wrs7qd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:25 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 167HAY66155401;
 Wed, 7 Jul 2021 17:27:24 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
 by userp3020.oracle.com with ESMTP id 39k1nxjva6-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2dxH5ENMH/tKhjfcEyR9ZOIhaj/cadx4oEp4mWOw003gGgneNl6c2iF+zHvnz7mv+z5LrvTKfUa764O2Zz28m7JUKClF8kAWoe0hGbA2IZrkjeEdpnBljkQRgvpdcL7JD2/Mn1Xitbpszq1w33BzVpu4hR46R0NMRilXLwkmxtQ3dAXr7LHqiT9ey8ZjJZo8iG8W5/6wHUEd1SRVdevVI7Tsd5+Rvdhaky/3RBvh30/GunRedNbEWYdhyM1qCuWeSzY2i51Bm6YjL2WWSQzS6r0z8EDEmo3YH+N2rjv9bceq1zgQqVRfPDYK2K+Czfho6zmRE1zcgi/uIZaZgmC8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hHfE6MEGogQzthqOH4vqs5xuVFIGzYUunqFpRHnOoY=;
 b=aW9kjXlITGABYIbUujdi7RY817/XpdoYu8J7cYzmMgtjfin/vg7sr5vZY4KxbUlZFEMBcwTPDwIw7TlVcAwiZv44L9g1/xpPS3FIbC8obWf4WIgqSCWvo9MpTslqzCTm1/Gh/AZlWFbQG1bi3PtFGKeTts1mmPpfWBLm61BGILuTmxmoTK8xVWnUVkkzqEtiOE496Xil38JrztJMdaB6CqakhuWT31kmEO8T8dZAMsctBo6I7YZS0qvxVONHwNmqi0bfgpblr5EGWA8mmAQLzoZCafj18RzYw130y51dMMPoWWyfFt2zfguUDYaCry9XM0KZkjB24QVCFFU2RjevHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hHfE6MEGogQzthqOH4vqs5xuVFIGzYUunqFpRHnOoY=;
 b=UrCTfEM7fyYEWnhy24Ai1MrFpoK141qNwy2aPtXS3RCe3dpN8KKNzEu6yJAmkpWGQ/4RBoUWTh7+5HiWXaXOqFOTGwmQ865KJo8rw/2b1VdUlMOSb01qFS7TIFr0SWH36Y37jDEbJOcYGKPBZWKP15gdXCXLXI8e+Ej8vFEyOxM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4226.namprd10.prod.outlook.com (2603:10b6:a03:210::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Wed, 7 Jul
 2021 17:27:22 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 17:27:22 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V5 22/25] chardev: cpr for pty
Date: Wed,  7 Jul 2021 10:20:31 -0700
Message-Id: <1625678434-240960-23-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:a03:333::19) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.13) by
 SJ0PR03CA0104.namprd03.prod.outlook.com (2603:10b6:a03:333::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21 via Frontend
 Transport; Wed, 7 Jul 2021 17:27:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2d45795-6cbc-4c04-1b82-08d9416c7a8b
X-MS-TrafficTypeDiagnostic: BY5PR10MB4226:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB4226C8F862E25446BDAB1D2BF91A9@BY5PR10MB4226.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:113;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EI9plYld/yXaoPt9iaEXeOpyB1uwrcahpGsUOoLsV6rlkaIrVoYZwYRUYOE8UYWEHj0X2UUP+EexK03bZDmlLb5LOcCmTeKQFqJQl9mKSlpfFr8qqeU1zkSvrY5OnkFn1FZq136an8hBnoFfVwXQho/8S9RcknBCRp4gNzNS/oLm2pBOmlD6h+bUUldeXsePH64//6/SmwsT400RRyD6dPRQ+XzZyAfHzlh+4LcCgDDfbPkT05C7i6pYj/yEJDYMnMyzt4PIbMbdb2BhA0Rq0tQD+M2ib/+V68/4JyVKPMvPh8jJiiw6ngUbrIq8YZmvlRuLacgaYc3KvHL0/ROYf9SS+dGrMGLwb5mQ+4k0p3CSo49GF6y/FQc9T47JJVjtI1OL7KExVU1OqAlWFPO/iroqU9OdNC9eNkWyNFOGPARaYgZn+wCKZmg6uZ5QV59YZ9h6Di94WoCO08f14h67BqPSu/wdlp4SxGdPlmh7/IxOL4nR9mwA46jw/iivLhQ6fJPFoAEYCX4alj9zPdaF5NJKWqlV/9IoSQA+mpnPhmvVGGtS346O06kkLcJTVU8fEnY/twePIKpo0uu+gE14BVFXxIQBTb88iaPVP+6iW0aAswyc4L0udJj2vgVsCLhmUvy4i/VAZ0WRpeGUI1wAsT+M/7LZCx6zWNYSCJUbWUlp+ciujWG7mEazeM1laTYG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(376002)(39860400002)(396003)(366004)(6666004)(186003)(52116002)(7696005)(8676002)(6916009)(107886003)(8936002)(2906002)(7416002)(4326008)(38350700002)(38100700002)(6486002)(5660300002)(316002)(54906003)(86362001)(2616005)(956004)(36756003)(66476007)(66556008)(83380400001)(26005)(478600001)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RNEZnlSGX+CYnQENYX53c/LdcuV6eu0GsFcIk9mAvqb0wdy/wSFrPgOM4uPn?=
 =?us-ascii?Q?CVsP1NQgVkQIWhdxk8v05dfxn2zHt6KgZnuZ/XiJB1SIp3dVLotPLBycr5oD?=
 =?us-ascii?Q?y0+xgYOK6S8Pf0+f+zfoHRITeFE3swMBfNNR/kuzsgrBggBaBve0OCrfqyS+?=
 =?us-ascii?Q?RA6KHfrgtYJ5cWoGFYbBg8wb5ey6eM/Y53IJq6WvyfoYv5TysM+CMAhVriNK?=
 =?us-ascii?Q?c2Q1l271KPGl3WSkKYbUkeN/4bnCHfVnseL8stFB4Mgv3OttAWLghGlvY30m?=
 =?us-ascii?Q?1Zg0gxS1ovja3SEAW0S0yCK70dR9JxMY+niHKrvwmAcM/RSZBzQmpZzmYvpT?=
 =?us-ascii?Q?ocrkt96Stfwf4U3cVFJ6CORmG6PXRqqV9tNgkd/oEDLUlxj8192rZ8anoDRA?=
 =?us-ascii?Q?pswEmz3Hh13gkhaA7gSa3yu++ZvRv4haPv5JVtFxNpyiSKE0qhQD9zY432Vh?=
 =?us-ascii?Q?JM+tIQmON9JyjhbmL2iCcJGF+ObCstksTY9moavZoUxIGa2Z4DJBXNgEZOc9?=
 =?us-ascii?Q?vbTaO5mspeZz5skv6vNyk9bDJ+6yD6IL/U53ErQMTaQZEBshBgQIh7otRIBW?=
 =?us-ascii?Q?z/GQdQzc9CkraQ/l4wYRAaAxOnaWhHVAAwsTH/s1iAsraYeikROQv5GPQd/t?=
 =?us-ascii?Q?WrMvOh67NtWBw9wqh0HVdddahcb+v7e+tLuXD+YXGyTU4cOxWzWc8jHHwDoM?=
 =?us-ascii?Q?y+DrANvmIzh8SixHa2EEIIfg13lWSEWQV1yITXTGXONe3Rfk00eHRNJRIpMq?=
 =?us-ascii?Q?29d5VWFQAiyg83YeSuX8p4ZYmBtNAxCXPUKhGBuIIJYjuudDtRn06bt8nnGR?=
 =?us-ascii?Q?NwuHO73wBXDdvFY9CsDglREzKJVPvmez1RFKedbzUqTJjID1Fljt4x9JOLEt?=
 =?us-ascii?Q?xqhnj+lOCGpgi+gQNiI0+ptLtWmZPcktXEpVccBV7qEXlsEPC4fmfNDmuTxY?=
 =?us-ascii?Q?Fkkve3hmsyH7ERfKH0UASeTMTJCHPvmrLR2l9gezfUQ6gyKaGp1c8d5jxfcZ?=
 =?us-ascii?Q?LWNev3XrWb56Ns13ukA57lEvPcIjnAYlnQpOYjjR2xvN6pNSQ/fQ5k0foNMl?=
 =?us-ascii?Q?Z8MzkTX69woyMKDfJbb3vukoIzmmnTmMli0Uaa2DRdUb6WFLvyydh2pqPOLn?=
 =?us-ascii?Q?F3/7k4iwnOgjxZHkK5+mAq2O9OUolBWon+CH52rDUAZ+Ox/ezj8jh9gzRIs0?=
 =?us-ascii?Q?bLPOaS6U+2ghpK4yXSR5k8pbFAvmmwX2gVAQZZu2rt7JqQ8FMjLNiAQRVg7a?=
 =?us-ascii?Q?9tRY8FtIIptoFhNkudR9HJzueZoCGJYXUqJBNXX3jLQl3f65upk/XuYxRoji?=
 =?us-ascii?Q?JGKyPHzRhNEFMRfyXXDAM0tP?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2d45795-6cbc-4c04-1b82-08d9416c7a8b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 17:27:21.9565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oa/gEphubH2mqt7JccUUc1W76EDLOLOszADivfHWKeHeF1yYTwm0foy3M7HJwPKyguAMzijTMqxj6Xgoc7Tv6dL6Kq9WvQIRmUVIYp7ZA90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4226
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107070100
X-Proofpoint-ORIG-GUID: dlR_Z1Ek9dLgOedmF0FH9ovDnH20iEC_
X-Proofpoint-GUID: dlR_Z1Ek9dLgOedmF0FH9ovDnH20iEC_
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
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

Save and restore pty descriptors across cprsave and cprload.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 chardev/char-pty.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/chardev/char-pty.c b/chardev/char-pty.c
index a2d1e7c..c91151d 100644
--- a/chardev/char-pty.c
+++ b/chardev/char-pty.c
@@ -30,6 +30,7 @@
 #include "qemu/sockets.h"
 #include "qemu/error-report.h"
 #include "qemu/module.h"
+#include "qemu/env.h"
 #include "qemu/qemu-print.h"
 
 #include "chardev/char-io.h"
@@ -191,6 +192,7 @@ static void char_pty_finalize(Object *obj)
     Chardev *chr = CHARDEV(obj);
     PtyChardev *s = PTY_CHARDEV(obj);
 
+    unsetenv_fd(chr->label);
     pty_chr_state(chr, 0);
     object_unref(OBJECT(s->ioc));
     pty_chr_timer_cancel(s);
@@ -207,19 +209,28 @@ static void char_pty_open(Chardev *chr,
     char pty_name[PATH_MAX];
     char *name;
 
+    master_fd = getenv_fd(chr->label);
+    if (master_fd >= 0) {
+        chr->filename = g_strdup_printf("pty:unknown");
+        goto have_fd;
+    }
+
     master_fd = qemu_openpty_raw(&slave_fd, pty_name);
     if (master_fd < 0) {
         error_setg_errno(errp, errno, "Failed to create PTY");
         return;
     }
-
+    if (!chr->close_on_cpr) {
+        setenv_fd(chr->label, master_fd);
+    }
     close(slave_fd);
     qemu_set_nonblock(master_fd);
-
     chr->filename = g_strdup_printf("pty:%s", pty_name);
     qemu_printf("char device redirected to %s (label %s)\n",
                 pty_name, chr->label);
 
+have_fd:
+    qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
     s = PTY_CHARDEV(chr);
     s->ioc = QIO_CHANNEL(qio_channel_file_new_fd(master_fd));
     name = g_strdup_printf("chardev-pty-%s", chr->label);
-- 
1.8.3.1


