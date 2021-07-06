Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA643BDBFE
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 19:12:00 +0200 (CEST)
Received: from localhost ([::1]:58604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0oc4-0005IB-0H
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 13:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oK4-0001vp-SP
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:53:24 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:50990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oK3-000876-0m
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:53:24 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 166GqBZE003703; Tue, 6 Jul 2021 16:53:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=2hHfE6MEGogQzthqOH4vqs5xuVFIGzYUunqFpRHnOoY=;
 b=cTSIcpSS1HI5QgeJdiQFUErtLrLAcFr3drmN50t2Pe18GhQE5D2wNkAly6PVCzru9ALL
 oPA6mDvxEhvb4bE1Olr5z/vwZlgRlK0xfMg29n1+N0uPyGgsiyRJtDFPWSNCWPAxn704
 fueuLzmIl+AbxOp8rjPjoher+js3ELzI+d9eKWu3pr6BGFLhgXs26raVHyfXtL8Wi/FF
 dt8EUh1bEwDeCmd+URStdQ+tVNpoJ7Rtun92Hujt2b2bnoClLWx49D5Wpi5mRHj/s562
 i/ROXVSBD7aa2+U81SXt9DSU4/QjDWSA7SoE8RZYSSEgjIXXOJM961U2jTkqApUfR10i Dg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39m27hac6m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:53:20 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 166GoIJc012592;
 Tue, 6 Jul 2021 16:53:18 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by aserp3020.oracle.com with ESMTP id 39jfq8vjsu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:53:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E15qcLGUps2p7Rj7qgLoEB4Y2sIF4FpMmfqrPJH54XhND9wmjpBvZbVQwPyxFLxEzbbgsrkfOUIKJ+X4zy2Rmvv9qf17sT9X3cp/P+FeQrxgPRuYXcdUx2QbX3YDFrh3/R9+RIBpMhqj/k05oqb7PaQy2DFYcJPqZr2so/46pa1JFYFyG8EHAoNoMvNRKy1f6bHFUxKmpoxetnawaCpyvF+oisd5wldoO5B9/HqGrK4oWpqG+M7dfh9tdDekhVdOKXLi1wTTK1ck/8lkAo9mHWCp6XquwjlM567Xm0a81FjzOy0SVuHY6RfA8PX/1te+atROZmilD8IVkK1H7eOL8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hHfE6MEGogQzthqOH4vqs5xuVFIGzYUunqFpRHnOoY=;
 b=Z3hyujudAIk84Ab3we3kEslHip2kMt4nSlpx4BmLAUGxzfUMK/VQoJalfv3UyH7C/btRNIvijbaF1p8MJm9Tue1Kk1bafAnX6Zqfo7JryRpyt7+Zgu9/UpoPsOYNHmX6eSv4sTP5+vomVC/CoudarQILuL8dTvj64VsgLMaisFBjJXRSJCGCbSX+OrOZAch57OeG1vOUgqxprLKo+dIMEsUmhcRTUVDXUUQEXST7yqHMr90ky0Nmxi8MsFghStxPyRMvadwJCB73SMG2QlzN1TwDV4J2/KNbEXR0kb7xsQ8o/fkSWQrmEx2cwtEHMERzFsbBpZnqyipZ/ssd4QBI+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2hHfE6MEGogQzthqOH4vqs5xuVFIGzYUunqFpRHnOoY=;
 b=zeZn+Czz4hmk04VOrmksz7Gh1g1F3GhPluFd6vnN7mjoY3EE+/8VcqYDKXUStz2AX7J0t0wwFMlOlIIWsufsjnXFYt52iR7f4Sz9Y9Tt3dm6PxfWxAfZ5N6uR4cctyRWhQH8lp5xhTHjxJi0b80VQ8jmYGBk2AQ/X+b9PLqanFs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB3841.namprd10.prod.outlook.com (2603:10b6:a03:1f8::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.23; Tue, 6 Jul
 2021 16:53:16 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 16:53:16 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V4 22/25] chardev: cpr for pty
Date: Tue,  6 Jul 2021 09:45:53 -0700
Message-Id: <1625589956-81651-23-git-send-email-steven.sistare@oracle.com>
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
 Transport; Tue, 6 Jul 2021 16:53:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4625c0e4-ad78-4237-3ebb-08d9409e8d12
X-MS-TrafficTypeDiagnostic: BY5PR10MB3841:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB3841FBAD65BEEF69330D8772F91B9@BY5PR10MB3841.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:113;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bg0LHX0gUUOSLkWVGVfrkbsDQ7y0JegK0zdu9gYcFgbGivvrUfjWTII6IFZx+ln+qgYZX4LATRumaD4ZKkCHiZoIoXK1EkphEyP9DZMqR7ER2x0664qY1Hyl198Go42R57u9nGSWhjEWMKbXULT54BkUL6tSqn3TsiXD5kAB8/MeVxGuF9Z6EFA+EdEgu8BjKz6FxfobxW5eqiDIresfPWJYqI8Z9OkNJZ/U+21uBIpi9Wbb1FY/cUCFFwG25fw2fN2NgjdGElrp1tNmvQWG+okteLdG7lzYqnlEwr6PcdhAUudrCwoTrcmWMnbdeirEv3Ldb+zdzVjLQjQJdLbMw8PfAy/o0ecdnfZ+MectCYLAT7o1ec8M+6HlWbVA0Y468l7aAiaV5SSE1t4XU4igOuFyORElif5pgx0yGDVRupGcNxNm5bR5yazPXix3GtJLGbVRyOPPddoilEjBcHEq004JdrSSf9EJmklOHO66sDVIyQvKp+gLhSwms6KhlU0DV6jC6sgQ8K8azBIih6DtG+i+32qA6rIiJgg96eMT01uMr3D8jJf56bgZitsJPPnjgTZZ2T65T0bsuoQEBy0lv/mpdiOBHfQh+GisnVG93ylCCMVgF8Af4pYUiX9hLrxobhw1c32vbq7U0TQixeLb6ydtp36Q6B75Aqae6LvJy3cdlbvB2jt6l7acIIg5pVnr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(376002)(396003)(136003)(346002)(186003)(478600001)(7696005)(66476007)(8676002)(38350700002)(66946007)(38100700002)(52116002)(36756003)(5660300002)(66556008)(4326008)(6486002)(26005)(2906002)(8936002)(86362001)(54906003)(107886003)(6916009)(83380400001)(6666004)(2616005)(956004)(316002)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iaLHj6KPYh8tHP9NebXIrWgsugFpiog5AvTIWa8rpTznp5jgpFmwHuIJ/obW?=
 =?us-ascii?Q?NXC71IW5LA8qFbsmuuoWtLLW6N5QrwI26i6U5PtC4/8a8upwW6EwqbS6WXw/?=
 =?us-ascii?Q?D8XZic8gFO1+d6WxrE3FEfJl/wsCySOVsvob861Xy3cLJYNtowm9lRNwsBw3?=
 =?us-ascii?Q?SLP+Mf3Hgyn4QbKhO614j8TgaeXBtadFcTnGuGCcqewLhuKsYX1LCtJ+XWUP?=
 =?us-ascii?Q?w6XxStJo7AxQLGolvkbZwtneSI65hEGlVTSQDy8YeoYOoJ1xvr+I1XDzELr2?=
 =?us-ascii?Q?cyw690BF5V0jf893VPT/CRh4/I2tJtwpwmXIMThvKhtbX7Z6+ioQibCvsjUq?=
 =?us-ascii?Q?gjvKbs7ovRksrsDuCRcxJP7mvfK03ZkkblEaZjGyQRyU9a3Tsk4kgKqqZyNg?=
 =?us-ascii?Q?FDjNchhAjDj/cCZxq7t05h9jD3kN0l8ClOBlTtsc5VAoxx0BM1RNq54yNpg+?=
 =?us-ascii?Q?f5fv4I4WFee/cAGBBzRGklZjh/3BYUJFgYjwc0gwE3jynYHSCLs3eeO/1kwG?=
 =?us-ascii?Q?4eNfZLS9LDCHRGbbfVFUsBaYgudCvV15RHR2g31P73oP+zFj/mmIZ0jdU3Uo?=
 =?us-ascii?Q?nVSDfv8hBEKp4t3vvZy2YCb5ZbRoJq6w1VZZ6CZXiJscmzdXG/IqZIx2rrDe?=
 =?us-ascii?Q?OQhS80+NzAM1WTyunIOfY+nPYisyxgiv6Db9QYRGY9/hOXd9hCdDf0m4b5V6?=
 =?us-ascii?Q?UKXeb7EoC9ncsbqMcgCd9vnyYg2hHuAP7I+tLcw6BYQt1P6av1iImICrtVLu?=
 =?us-ascii?Q?+MP6i8Geim66pMvxaUrQNaJWgSDFG1EYDqOYA1WUN0rzS9W3aWfCS+K3QpGt?=
 =?us-ascii?Q?g8qWJl8OfoEV4AUi++gmVnsqF2GFk/zRVQ3dfXaQ38s6h0byEsmpj553n4ob?=
 =?us-ascii?Q?hRpZ0BVRwg2aah9FNTQZ/KYVL1efFXiGvYuobWbJ1H6w82cy24un8JzNzxf3?=
 =?us-ascii?Q?flhDUfZH5ppa7OGSMKdvtgqVG6+VkQYTZQEB+YPVc9GRX3pJ43zRmmccpVaI?=
 =?us-ascii?Q?tMaSSZDaxmG4fk9gkuayOz6z/uI+w7EvwhGo2aAvVZqHZIDpY0iDizW7mJcw?=
 =?us-ascii?Q?Iho8MPbSP6LaOm8c/eFIpJAo9EKsTIck2tvVPb0sXlwjz14WsA1Eva1oPzNB?=
 =?us-ascii?Q?/v2aSJhAigV3hHQCH652Ds329EMgy6PsWmaXNMu6Xwb+DSAoettuOERRu8v4?=
 =?us-ascii?Q?sQC1rd55l81wJZAZMAyQcjsA7BcO71M2NopqWsoprIUXv7bfLw77YZsg88av?=
 =?us-ascii?Q?y0bcqHXMXXwGCRSZtPjgFCsNYv2cLLNygMuEiv4VDYOhWDInaNPncPBEdaiy?=
 =?us-ascii?Q?6EmGcl9WqpHPubtJvDCmnsuf?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4625c0e4-ad78-4237-3ebb-08d9409e8d12
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 16:53:16.6958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5xOmmkJUGx5GgM5hF/6dZxmeXSQ1ytrO7GuyFc+YTG8BKV3qIgfAm5oOBuO8EuJoxxxPMBqdrUTlYvXto6dQ6uIkUe7e1Aa1rYr+uN/MlDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3841
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107060079
X-Proofpoint-ORIG-GUID: DNrouV3MIz3Il2K_PeUAbSB2NziuEyZI
X-Proofpoint-GUID: DNrouV3MIz3Il2K_PeUAbSB2NziuEyZI
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
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


