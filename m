Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9B13BED41
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 19:40:50 +0200 (CEST)
Received: from localhost ([::1]:46362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1BXV-0001s3-7x
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 13:40:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKc-0000e5-T1
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:31 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:37654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKZ-0006q4-OE
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:30 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 167HCPEl011986; Wed, 7 Jul 2021 17:27:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=Dk4a+4WEUNVhnxOqffn7vWAGVx8wK6B+mqjTQqEBC20=;
 b=OXz1gtHqup7/Dp0zsAqIvtO9L1a4gzPonP+p6YlCpOFHssjbHDRbvgV1bt4qzpiHQCaI
 HSzM2CafuTJLLF+w3FdTPn3VSHwQY0Nqf5kQVyAyNJs0J4XSc7UMMmU4z99ThfjuuXBn
 NFjA9uVO7fQ3xq+4NTAt5hoSBg6WmjML3ZjGgpuyZAEbmA2zeacs92mkJ0ri5GOX80sL
 1RxESUopJFZGF/jhYwU3REf8xa3mhOBnan8d9PyA4EdnfFUHWVVlYpgt+3JU0D4N4vNr
 1MQHJnLm70lMEhG0Ah9u8pGkWZA7mlGA1PMa1FQ9Kbjx/f/XW4r3UCKj2t6Vmf2ABJPk Ww== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39nbsxrqng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:24 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 167HAXXl155319;
 Wed, 7 Jul 2021 17:27:23 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
 by userp3020.oracle.com with ESMTP id 39k1nxjv9e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EcpLzXs2+YAhFW3p3BxcBNL9tx3UTfE0d85/Z7V+mSJdDIyCYAbyNgFjpLaNP89dbcPQ2VtU8BRqZ2ZQXMjoF3FAsPX96nyS/Y9Sr/nx9Ez4sAMqRZLR+MmKLmCZ98sybUOT6nkwauKsZKq+60NdNwrA0AHgplxTPKMlAcklZkwcrqegYrkn2jwex1hTFbB+J3fAfDapH5f0gtFxswupPZOVN/Z+lbFso3Pmp5uQv6Igk97yFMc8etir1eapo9zlHiP4yZtPeBUzIzWAPPn2dbvwF2gA4RfYlzAG5Cskg8Dg19rF1h4cmvZXX9YhPBrh5Ol9F9ff71E0AOD/rlfv1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dk4a+4WEUNVhnxOqffn7vWAGVx8wK6B+mqjTQqEBC20=;
 b=kzxWvH+KJg7aC3uVfOuIpEVf+ATvHsodQfKzmCXe5notuLxRwB57qesRpNewW2gVx7wldSlTT4o9G5b2NyXivE0jUUAwO+VYP2a32kLM0LkvKDq3HaSeHDP0seSHAGvUl8ql4nDL+UhDDOfvdrUTv8UpD6V0cbp/gtahFR6n36tdWtpDIpU2g/YIwAxsQgIrBQh0DsOLJnA276z7ATXjSqGwsw25A4fBlNRO6v/JImu4smJLYGzVwpN/uejDshZfGo1ovusQUlSurvJJNIzm7lXxbQLSJpQxiWY6n+GW6pAwoHKYDjVdjKYivYNpFHX4hbBBYBUqdEGWrozeddzPfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dk4a+4WEUNVhnxOqffn7vWAGVx8wK6B+mqjTQqEBC20=;
 b=J5qF4TLNGWdbc7bb9yIKq/Uj80GwlQBuCasu+UjyUhFSJ8oytxiFVqX1CrXxuesuzmVSJNyfVd3s7qB43wluXSfaWxlN/gl19/eOEay1i/Tj/q6uwnJFbpaYPXVckRe+CMb1yqaixLa6NSfRLsBM8S52xEnaQ+KFkDIcWtZKDdo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4180.namprd10.prod.outlook.com (2603:10b6:a03:211::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Wed, 7 Jul
 2021 17:27:20 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 17:27:20 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V5 20/25] chardev: cpr framework
Date: Wed,  7 Jul 2021 10:20:29 -0700
Message-Id: <1625678434-240960-21-git-send-email-steven.sistare@oracle.com>
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
 Transport; Wed, 7 Jul 2021 17:27:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7224cd97-6bb7-4a01-7b33-08d9416c7949
X-MS-TrafficTypeDiagnostic: BY5PR10MB4180:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB41809FF249B54DF456BF87C0F91A9@BY5PR10MB4180.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:85;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gCM7FicXHD9swsknTNAji7wTnMwUMmMQjL3fWZXG8abSmrJuWJuLidE/P413A5p5myuLn5VqPBq9pVVtR8audqOxmQtgIX5M8TrQ5y3A6EssML9hNdecqUwDRbQvnTZditm045yR6ByUR0q1MVPrSkuU631EUKtcLGygl0UQlxNFA2/nYlFsTpOxZO9PRjsjP6Y/dJlQA0wZrIFRg6sY/d9AfVyTW+Jno6AtLYj/ReZd06KCra3toW1N47WnCsZ125uGDqqnj1RqyFICIiVop90zA4fZP1Yl0IOg1Dx4rBj69Viz6YnbNWc2tjX6FhMln+PlkiAzviZiW1UHYzBjj9t9pJGRCIBE7zkbv8n8iMdZ9S3Pb+d3NkRBDpaSvvonSUuVk/ymykut2v07afMjGtaxjB8nrlpeNFxIZ7nhe7ypuZ4LaMdDPd/xWOAdbR9ADd0xDZP849CxHqquG8h3LoZ1bhjI6gDdO7tiRjo8jAK0pncQHCwjN5Zgzvga7vGLxwl+MpxEwlWaHcbDSTU67jz5fb7IvjaTnTmIf/3EPhFLpCWQ4wg4CfkDqT6TOt/mioaQc3+8czjJ3DLmfqVQ+R1Vgm4501ZdhQNHVjHw3N13WO2ZuFn601t5fhH646CEkqYXQHAWXmMlMgzWVo2ikEBtEmU3B4oh5coTzBN01a5Cijw4uoy9le2FFcXokV7IyvZY2hTfLC+usCfLgOqd9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(396003)(39860400002)(376002)(366004)(52116002)(7696005)(66556008)(2906002)(26005)(478600001)(83380400001)(316002)(107886003)(6486002)(8676002)(86362001)(956004)(2616005)(66476007)(38350700002)(38100700002)(4326008)(54906003)(6916009)(66946007)(8936002)(36756003)(5660300002)(6666004)(186003)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Bt7fJk39VGISHsLOGpMLHuF/uLEXTNcnM/PIxyN9vnL/5M6tvF29MAH3TEa4?=
 =?us-ascii?Q?WTa+7Rx1XTDQfbNusXxa35geomTwzdcEflYQSG1+dw+kxXC/DBn4iOcDANe0?=
 =?us-ascii?Q?koIMOGOr8ZjJINtViHWiQdLA/95Iwx5m84fH5/zaWpW/CpkorR55FHbZ4U83?=
 =?us-ascii?Q?T9plxqn7o9224O0+XPYWiKIRvn0YucYJG0VytBqJXZw6pmHkysOGyq9G3rIm?=
 =?us-ascii?Q?SvKmFl+BJUJVldFQ8xvjy3I6vfBXDlThRVUdZtbnDGkNolS8+U+ic0mQhPlF?=
 =?us-ascii?Q?7fbcJtuWLqMw85Ow2EyL9gHdNZXbnVHWRzP9z9EFq53fQMEc7W7PyuiH/18Q?=
 =?us-ascii?Q?AIEkB8yWdtDI/CPBWcGWR3HH024YPjkB0StgZp2LWaGGb1VMB9pLLc2IPonT?=
 =?us-ascii?Q?WJaw1VsOaJS6RP6vVOh2+HxpOo75PC2SEZTwpFMjb1nop0MZvvSIblHUfITC?=
 =?us-ascii?Q?BP94jVb/WzR/H25t1Eed2rkkXPSTwhfzFslonjPY1zshJSMA3XaHdu3jFhEl?=
 =?us-ascii?Q?YUi4/4CXJSLVvcDDv285Z5XjxUqdDrZBU5QxQTjk6G/zzZ8sZbNlbrJBqCz/?=
 =?us-ascii?Q?ojmRYsYoFvRTRwLp3avxG9tO0jrmk9UsMUTrR/i3uGVhI+l4LWnS0Y0hGSsb?=
 =?us-ascii?Q?4YNeWPw58GMy4CgaoJD0M7JKfNPq8eoi1r5DAtvRJmpgM3u7SqJigijX+jk+?=
 =?us-ascii?Q?4t9Ck/GhEypRZkb0j1Zr7oKHOp7pKr0Wbuor5l2AJF1oDcO1kIABNZCd13Fs?=
 =?us-ascii?Q?h+OEXeS76f0xLPlxcwDM3I50DcWc/9bxuGLAj6UTS9ZSMahQZrFfUkkBONU+?=
 =?us-ascii?Q?C29LBh7h/ik1P41YOBaj1tTX/eo5wCTrdvM2vsGpJ0eOA8+3DgjA29jcEb9s?=
 =?us-ascii?Q?Xb5IAXBX02MZY5rDWrg4uB309RzdU2VlraLadRuvreni8lRRiVzAiKgzA1nP?=
 =?us-ascii?Q?Lb9TvxygTdjV/Koe6UWMoxzpu83e+PeEj34tIq+bfIU7ohC4FTRe2XVe8Hju?=
 =?us-ascii?Q?u5iMS3ysgOdnPAiesoB/qVk5o/W/iKOZWZHfDt/hUKwijrqtdQvgvmgLon1C?=
 =?us-ascii?Q?d7dhIfdIXj79duikh358cHxmbM6adzb4TBFClPwlRKtoeEQcEZKZPmE1Dvv4?=
 =?us-ascii?Q?fkLuIKk0+ht/Hx5caCXvPc8DOq+3jNDQkcFPF504vhduhNY0R3oFSB8S2+Cw?=
 =?us-ascii?Q?BlGCsBOL+Ymbkm2T2u7ITFgbhdz23fEsNkM2Z1z9nI+od8+6nS/kjQhhqeSx?=
 =?us-ascii?Q?ue18IQrlcgJvKN9bmYhweSe+UP81MSIwWdIca6hy8scyHbG51Adk04hppIPu?=
 =?us-ascii?Q?yUE1XJ3vyMYHvhA4OPm8eOq0?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7224cd97-6bb7-4a01-7b33-08d9416c7949
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 17:27:19.9456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wkzVNMnO9Ddw7fEyEE9I4/7aeiyOslORQq4JqEVISQM19+ijB2PHsKBE9drP9JYodiLB9SiZOEGN8Ky09TtuosV7Vn8wzoe/l2ulT2MMMvA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4180
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107070100
X-Proofpoint-ORIG-GUID: VFcXaFaLtgEpxdzFGlBPPXfmTBMAO1eF
X-Proofpoint-GUID: VFcXaFaLtgEpxdzFGlBPPXfmTBMAO1eF
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
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

Add QEMU_CHAR_FEATURE_CPR for devices that support cpr.
Add the chardev close_on_cpr option for devices that can be closed on cpr
and reopened after exec.
cpr is allowed only if either QEMU_CHAR_FEATURE_CPR or close_on_cpr is set
for all chardevs in the configuration.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 chardev/char.c         | 41 ++++++++++++++++++++++++++++++++++++++---
 include/chardev/char.h |  5 +++++
 migration/cpr.c        |  3 +++
 qapi/char.json         |  5 ++++-
 qemu-options.hx        | 26 ++++++++++++++++++++++----
 5 files changed, 72 insertions(+), 8 deletions(-)

diff --git a/chardev/char.c b/chardev/char.c
index d959eec..f10fb94 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -36,6 +36,7 @@
 #include "qemu/help_option.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
+#include "qemu/env.h"
 #include "qemu/id.h"
 #include "qemu/coroutine.h"
 #include "qemu/yank.h"
@@ -239,6 +240,9 @@ static void qemu_char_open(Chardev *chr, ChardevBackend *backend,
     ChardevClass *cc = CHARDEV_GET_CLASS(chr);
     /* Any ChardevCommon member would work */
     ChardevCommon *common = backend ? backend->u.null.data : NULL;
+    char fdname[40];
+
+    chr->close_on_cpr = (common && common->close_on_cpr);
 
     if (common && common->has_logfile) {
         int flags = O_WRONLY | O_CREAT;
@@ -248,7 +252,14 @@ static void qemu_char_open(Chardev *chr, ChardevBackend *backend,
         } else {
             flags |= O_TRUNC;
         }
-        chr->logfd = qemu_open_old(common->logfile, flags, 0666);
+        snprintf(fdname, sizeof(fdname), "%s_log", chr->label);
+        chr->logfd = getenv_fd(fdname);
+        if (chr->logfd < 0) {
+            chr->logfd = qemu_open_old(common->logfile, flags, 0666);
+            if (!chr->close_on_cpr) {
+                setenv_fd(fdname, chr->logfd);
+            }
+        }
         if (chr->logfd < 0) {
             error_setg_errno(errp, errno,
                              "Unable to open logfile %s",
@@ -300,11 +311,12 @@ static void char_finalize(Object *obj)
     if (chr->be) {
         chr->be->chr = NULL;
     }
-    g_free(chr->filename);
-    g_free(chr->label);
     if (chr->logfd != -1) {
         close(chr->logfd);
+        unsetenv_fdv("%s_log", chr->label);
     }
+    g_free(chr->filename);
+    g_free(chr->label);
     qemu_mutex_destroy(&chr->chr_write_lock);
 }
 
@@ -504,6 +516,8 @@ void qemu_chr_parse_common(QemuOpts *opts, ChardevCommon *backend)
 
     backend->has_logappend = true;
     backend->logappend = qemu_opt_get_bool(opts, "logappend", false);
+
+    backend->close_on_cpr = qemu_opt_get_bool(opts, "close-on-cpr", false);
 }
 
 static const ChardevClass *char_get_class(const char *driver, Error **errp)
@@ -945,6 +959,9 @@ QemuOptsList qemu_chardev_opts = {
         },{
             .name = "abstract",
             .type = QEMU_OPT_BOOL,
+        },{
+            .name = "close-on-cpr",
+            .type = QEMU_OPT_BOOL,
 #endif
         },
         { /* end of list */ }
@@ -1212,6 +1229,24 @@ GSource *qemu_chr_timeout_add_ms(Chardev *chr, guint ms,
     return source;
 }
 
+static int chr_cpr_capable(Object *obj, void *opaque)
+{
+    Chardev *chr = (Chardev *)obj;
+    Error **errp = opaque;
+
+    if (qemu_chr_has_feature(chr, QEMU_CHAR_FEATURE_CPR) || chr->close_on_cpr) {
+        return 0;
+    }
+    error_setg(errp, "error: chardev %s -> %s is not capable of cpr",
+               chr->label, chr->filename);
+    return 1;
+}
+
+bool qemu_chr_cpr_capable(Error **errp)
+{
+    return !object_child_foreach(get_chardevs_root(), chr_cpr_capable, errp);
+}
+
 void qemu_chr_cleanup(void)
 {
     object_unparent(get_chardevs_root());
diff --git a/include/chardev/char.h b/include/chardev/char.h
index 7c0444f..e488ad1 100644
--- a/include/chardev/char.h
+++ b/include/chardev/char.h
@@ -50,6 +50,8 @@ typedef enum {
     /* Whether the gcontext can be changed after calling
      * qemu_chr_be_update_read_handlers() */
     QEMU_CHAR_FEATURE_GCONTEXT,
+    /* Whether the device supports cpr */
+    QEMU_CHAR_FEATURE_CPR,
 
     QEMU_CHAR_FEATURE_LAST,
 } ChardevFeature;
@@ -67,6 +69,7 @@ struct Chardev {
     int be_open;
     /* used to coordinate the chardev-change special-case: */
     bool handover_yank_instance;
+    bool close_on_cpr;
     GSource *gsource;
     GMainContext *gcontext;
     DECLARE_BITMAP(features, QEMU_CHAR_FEATURE_LAST);
@@ -291,4 +294,6 @@ void resume_mux_open(void);
 /* console.c */
 void qemu_chr_parse_vc(QemuOpts *opts, ChardevBackend *backend, Error **errp);
 
+bool qemu_chr_cpr_capable(Error **errp);
+
 #endif
diff --git a/migration/cpr.c b/migration/cpr.c
index 6333988..feff97f 100644
--- a/migration/cpr.c
+++ b/migration/cpr.c
@@ -138,6 +138,9 @@ void cprexec(strList *args, Error **errp)
         error_setg(errp, "cprexec requires cprsave with restart mode");
         return;
     }
+    if (!qemu_chr_cpr_capable(errp)) {
+        return;
+    }
     if (vfio_cprsave(errp)) {
         return;
     }
diff --git a/qapi/char.json b/qapi/char.json
index adf2685..5efaf59 100644
--- a/qapi/char.json
+++ b/qapi/char.json
@@ -204,12 +204,15 @@
 # @logfile: The name of a logfile to save output
 # @logappend: true to append instead of truncate
 #             (default to false to truncate)
+# @close-on-cpr: if true, close device's fd on cprsave. defaults to false.
+#                since 6.1.
 #
 # Since: 2.6
 ##
 { 'struct': 'ChardevCommon',
   'data': { '*logfile': 'str',
-            '*logappend': 'bool' } }
+            '*logappend': 'bool',
+            '*close-on-cpr': 'bool' } }
 
 ##
 # @ChardevFile:
diff --git a/qemu-options.hx b/qemu-options.hx
index fa53734..d5ff45f 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3134,43 +3134,57 @@ DEFHEADING(Character device options:)
 
 DEF("chardev", HAS_ARG, QEMU_OPTION_chardev,
     "-chardev help\n"
-    "-chardev null,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "-chardev null,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off][,close-on-cpr=on|off]\n"
     "-chardev socket,id=id[,host=host],port=port[,to=to][,ipv4=on|off][,ipv6=on|off][,nodelay=on|off][,reconnect=seconds]\n"
     "         [,server=on|off][,wait=on|off][,telnet=on|off][,websocket=on|off][,reconnect=seconds][,mux=on|off]\n"
-    "         [,logfile=PATH][,logappend=on|off][,tls-creds=ID][,tls-authz=ID] (tcp)\n"
+    "         [,logfile=PATH][,logappend=on|off][,tls-creds=ID][,tls-authz=ID][,close-on-cpr=on|off] (tcp)\n"
     "-chardev socket,id=id,path=path[,server=on|off][,wait=on|off][,telnet=on|off][,websocket=on|off][,reconnect=seconds]\n"
-    "         [,mux=on|off][,logfile=PATH][,logappend=on|off][,abstract=on|off][,tight=on|off] (unix)\n"
+    "         [,mux=on|off][,logfile=PATH][,logappend=on|off][,abstract=on|off][,tight=on|off][,close-on-cpr=on|off] (unix)\n"
     "-chardev udp,id=id[,host=host],port=port[,localaddr=localaddr]\n"
     "         [,localport=localport][,ipv4=on|off][,ipv6=on|off][,mux=on|off]\n"
-    "         [,logfile=PATH][,logappend=on|off]\n"
+    "         [,logfile=PATH][,logappend=on|off][,close-on-cpr=on|off]\n"
     "-chardev msmouse,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,close-on-cpr=on|off]\n"
     "-chardev vc,id=id[[,width=width][,height=height]][[,cols=cols][,rows=rows]]\n"
     "         [,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,close-on-cpr=on|off]\n"
     "-chardev ringbuf,id=id[,size=size][,logfile=PATH][,logappend=on|off]\n"
+    "         [,close-on-cpr=on|off]\n"
     "-chardev file,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,close-on-cpr=on|off]\n"
     "-chardev pipe,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,close-on-cpr=on|off]\n"
 #ifdef _WIN32
     "-chardev console,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
     "-chardev serial,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
 #else
     "-chardev pty,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,close-on-cpr=on|off]\n"
     "-chardev stdio,id=id[,mux=on|off][,signal=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,close-on-cpr=on|off]\n"
 #endif
 #ifdef CONFIG_BRLAPI
     "-chardev braille,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,close-on-cpr=on|off]\n"
 #endif
 #if defined(__linux__) || defined(__sun__) || defined(__FreeBSD__) \
         || defined(__NetBSD__) || defined(__OpenBSD__) || defined(__DragonFly__)
     "-chardev serial,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,close-on-cpr=on|off]\n"
     "-chardev tty,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,close-on-cpr=on|off]\n"
 #endif
 #if defined(__linux__) || defined(__FreeBSD__) || defined(__DragonFly__)
     "-chardev parallel,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,close-on-cpr=on|off]\n"
     "-chardev parport,id=id,path=path[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
+    "         [,close-on-cpr=on|off]\n"
 #endif
 #if defined(CONFIG_SPICE)
     "-chardev spicevmc,id=id,name=name[,debug=debug][,logfile=PATH][,logappend=on|off]\n"
+    "         [,close-on-cpr=on|off]\n"
     "-chardev spiceport,id=id,name=name[,debug=debug][,logfile=PATH][,logappend=on|off]\n"
+    "         [,close-on-cpr=on|off]\n"
 #endif
     , QEMU_ARCH_ALL
 )
@@ -3245,6 +3259,10 @@ The general form of a character device option is:
     ``logappend`` option controls whether the log file will be truncated
     or appended to when opened.
 
+    Every backend supports the ``close-on-cpr`` option.  If on, the
+    devices's descriptor is closed during cprsave, and reopened after exec.
+    This is useful for devices that do not support cpr.
+
 The available backends are:
 
 ``-chardev null,id=id``
-- 
1.8.3.1


