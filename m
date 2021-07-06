Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBF53BDBD1
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 19:01:06 +0200 (CEST)
Received: from localhost ([::1]:55424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0oRW-000190-0D
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 13:01:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oK2-0001kK-2n
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:53:22 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:45016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oJz-000862-5R
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:53:21 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 166GqGfq003973; Tue, 6 Jul 2021 16:53:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=K4qwdXCNInXYoSj/bD5RpaC6pHzae8FVRosgaClWmfQ=;
 b=eQ/gkt9/76ykiT4nqr9z/4YsJ2FOdNUpkoO0Or+OAsfudWsFM7FTDmTbkdbI1ytM16SQ
 V6r6Os+y0Trzf4jVlVOJHI7vt3pfwEj5+AcashcqWxraIMcemWNgHPvRirnb3WhGaUoF
 p4NyoJF1M1PlBwwjeRRMiItMfFxtzMtrxHnHeQx0WGAcg2RF7qAKoeZLZkZ67dVsU6jy
 ZE6JGg0dZ5fklO73NVhVuo6ZaNiH47XJFPDtMxqENEiyL6ZlbuCrHyjYrgLTMU3cv0+u
 S9vlZsd5srKV/6Y4nY+k6ckhK0YIafnTsJo+9SJ0DZ8C7nVFK2Fx3LmKoPeCpriB9M6k Nw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39m27hac6f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:53:16 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 166GoUJH084680;
 Tue, 6 Jul 2021 16:53:14 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
 by userp3020.oracle.com with ESMTP id 39k1nvcqh5-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:53:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TFBD7XZw5WBZVvvjsxf2wFzh6uyhqP+vtaniIiCUMn5HR39No9Np0cPub8FlMDCWsOG+rbUQDaKT6IBwt4fPOWUUP5qBw/OJeHoKGNiT7FdXCmJ4E5Ip44TrWOrtynExtOsTZpygbi7SY7A6Xaab3o3A12XEaG45+18PSRyp+AkcyCQOD4wAunNXkNrOjAH/f0suW7SdTkIQiC/WB6JrWxnPjVPkN0sQWCuJnEdXZRosF2Q03+Az3OhP/qWqNiOqCMSLFdxT1Z166XwTKChU1i3ndPSRYI4PFwwwUb4UGOI53xJoRyjMgdnDO51SStAwq/02MX5hSPlOQ02cA+xCyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4qwdXCNInXYoSj/bD5RpaC6pHzae8FVRosgaClWmfQ=;
 b=HHONSElXqY6fdde/UE3g6/unXwvHd/rtW4GU+Mpfj83iwZJE54EcZm61COiaLfOIQTXvTL6QNuoiI9zB98KgbzE3hhg6m7mCw6oRkCXUXRzWwStNhaoVtVIbVWB59neFB3htRdX/6unoiI/aE9G4AZnS6vETL9MA4N3MuYBEY0yNZn0X3kMxbcSaSr4iBFDLvSRWwT19bqt0uEWFz4qNM9pBulENJwWt+2AIF8XMm4Q1w20QtfIwkXyVqcI1VzOtjxFU/OzwTBnSLzmi7TQJU/1LmC1tzysI6YP6nWv4GyVaHy29wUEehMWx1kuM791O94Ou8qKR1cmHGBi7GzFxbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4qwdXCNInXYoSj/bD5RpaC6pHzae8FVRosgaClWmfQ=;
 b=SZZfiJSDMhVM8cbePilCv50MdwWqITRPupkVXu9BlVnRA6Il3tAW9AOQQzT/sYc6EyhuClSnQJWu2QZas7QpXql8LTMkJO/oFfjFuElUVb0RXycBFi6wr/E1PpXas5tA9n76VmfCnN1WPQRA1jbGw5pF4pqJcG73XYVelXBc4JQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2805.namprd10.prod.outlook.com (2603:10b6:a03:8b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Tue, 6 Jul
 2021 16:53:13 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 16:53:13 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V4 20/25] chardev: cpr framework
Date: Tue,  6 Jul 2021 09:45:51 -0700
Message-Id: <1625589956-81651-21-git-send-email-steven.sistare@oracle.com>
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
 Transport; Tue, 6 Jul 2021 16:53:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbec6932-e13a-404c-0042-08d9409e8aee
X-MS-TrafficTypeDiagnostic: BYAPR10MB2805:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB280559C77A393311A39F171FF91B9@BYAPR10MB2805.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:85;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zpTVyG33izUTstwkuQn5bXOHp8e4KMnPFEuJiQoQwTslYviPgwTnBsymLpBaICIDYAVrL66eUM68NpJ28m8bzC1yp9mnlYZFMkiKOJ47zsscuxOBYHeRvDW5C+s9xfZJY6Og0iDfdWZdNpr1Pkyh55B0psfDVyK1OIHdgPZXh0KlMZukkVlrJ9jpM0d5/RqW1WIAQCIbdUjJiF4zRVhm0WZekm92eN2YaWUBrRc+VbpbOsAjPysFp8lcUfutmxevUJ1mrs1A19dKfBhwq3+JorYLiRRz6p5gR8QgZdETCJq3C1IkO8yq/gRg4o24udtAneyZsV5zPWxfYRnFw30FRYZ51kc0lBm2qYZHYyDP4R8ldagmYe+KBCM5F9ONV8n/gC1NMIbPc2RwZ+pC+7V3tX+rAVWy3fcUuetKf9R00ZdXKRsOky9QZONdryzCL+y0Q0OoKvORXXwqeZ5GN0rhM8KukvrEWQPLrfNaH+W72d6c51rxBAAvpaHHLusfK5LrEsBM6JeyCvLTFe/Ub52tjVh6bpjRUNYZWch64qiD9qd+oTAYkQ1QS/qzqwOEisqEuHzWWikdMgwlm6R3340WZAH3cJ/RtMNzWLH1672EsQ1316wtgkRBi9hzOImM4PQbmBBkTGatBh2WTwx0D6g0EmjNATfhYsecyWeQzrYHqGM/XjhqV3V4f6hRB3Mcpq+3VrnQGF+JpwXtcRJemwvolA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(376002)(346002)(396003)(366004)(4326008)(2616005)(54906003)(26005)(107886003)(5660300002)(83380400001)(6486002)(7696005)(186003)(66946007)(66476007)(66556008)(52116002)(956004)(86362001)(6916009)(7416002)(36756003)(316002)(38100700002)(6666004)(38350700002)(2906002)(8676002)(478600001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VsY2Vvxln9wj1DXUC22wZs9PXOATewtlnxvsCG069sVArCs7TRPVVipZ6l21?=
 =?us-ascii?Q?ALvurwhEIRMluRG0EXzTH7Kp4q+GL6zZ7nUVP1UfpL9xCSK4rUIW+Y8NDSZi?=
 =?us-ascii?Q?cNggY8RnZgppWhOp46wiFMwQwfabnRlbFeQlWt4vMIqTMTzb96RkRuS3mGvp?=
 =?us-ascii?Q?ntEoFXih/5//zJIqh6Dv3Vp6TQHS8XFK1BtHk3ZEqQNtTcSmxMNlR2tezc/v?=
 =?us-ascii?Q?nbYWKctvdJi3dg4xFAzvpuUboxQLjNszw+3hI/tcPYlDJJOTj0Qz8WCIzzid?=
 =?us-ascii?Q?mJ89YtAV0XFNug8eU3L2VjscChwpv7BZjr2My08wC+mtc5BPjqofyIqw6qMo?=
 =?us-ascii?Q?UILt6+EWOC0kSspEoLXN6MLTOZanXASMn9lDnnj2RrCaGd3mKJ1ktbhn3rPc?=
 =?us-ascii?Q?f4+ptCiDSezsN7qORlvlRH8arWZz/xRLyHpajwNR3jgnKrUAvNsHGKZQYzqF?=
 =?us-ascii?Q?hHlfshcO1vZ5zQ5eFzqkYJl5gYyEfIBUc5LBaUdjJcNCuHriX/C4YFq1byV7?=
 =?us-ascii?Q?iqe8ew1my1rK7BtBESR4OqJsNYW7CkzYyzKIQXo56SSRRegAeVybUyzHTd5R?=
 =?us-ascii?Q?1L5cA/s7OlU1T2RjofRgGU/6Y+QBHJvJGIE4alBcgMhu+zLg+vW7pZ0AamNU?=
 =?us-ascii?Q?nUW9nV0GzNScwnRq/L0je0AO3veE+dkxnJ/7gIncETNwP1pegfeaDV52VOOy?=
 =?us-ascii?Q?HfcNCY5nG1Kb7EUFKb7BIiZ+lN4rsLeF+4gab9rlzsGBDb6Gw7bd1DhbPYHb?=
 =?us-ascii?Q?nK9sFFpEPKHK0fF248fJgSSbffhHtLiiqypQVXOf3K+NThZ14Dw1BAXnCZmu?=
 =?us-ascii?Q?+LSYKmiw2RNfp5zO2JYneuezSmd+TslQDQe9SzuZ6uQ4X8RF8vWGQ0r0EWzm?=
 =?us-ascii?Q?JGFjZH3zVuEtSAq4T13ZUM2Q7WAItK+QSgCm0JAYBSKnz9snCIRx5XLNqjpQ?=
 =?us-ascii?Q?ceWSKIZsn/+KbP26vAxRTO0Bh+tZ4ahsty7fcZn1875nCQAChPXGm3HDmQM3?=
 =?us-ascii?Q?TmKHJa7ziyDhkK99terWAN0jYdYcaWw7mSeWbjAgP04zm510Qmr/6ps4Gnft?=
 =?us-ascii?Q?g2odUHnnyxsmPbBRnoI29XVT0KqYiZMbhXoVxD3TkwPB1jTbzuA8HbA9YSLW?=
 =?us-ascii?Q?ounP7Owe4a5gnMZI38OmUp8JGHn55fJ0AXA19CP7lNEK6ftj5tDvbE4uNc9v?=
 =?us-ascii?Q?KSIs2aiCtS/i6y1MQwu8nbhmhDFTCcasK54dP948yx5w6n9EkujqBUVnO4BT?=
 =?us-ascii?Q?h/JDBr7LhCMl2MjnzapcdLmraKZRQBb0ypjAYld3DajxsLYjiokJnkiZ+Dvv?=
 =?us-ascii?Q?TT8tpvvJHdOUR7fTlvLKDF7f?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbec6932-e13a-404c-0042-08d9409e8aee
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 16:53:13.0569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TgeZPLPip6bFAqcpKCLdYQwZxq550X6ZMnzijXgHHl6b/Wa2FPHCkviVRcIBlxqZiI9qdfw23MSPEI750w2wSHzKVm6EYCXR9yAgM9OnBU4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2805
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107060079
X-Proofpoint-ORIG-GUID: gGvZAIGCHbRaPRfUENQJYyMplWmLa7nG
X-Proofpoint-GUID: gGvZAIGCHbRaPRfUENQJYyMplWmLa7nG
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
index 398f09d..596d4f9 100644
--- a/chardev/char.c
+++ b/chardev/char.c
@@ -37,6 +37,7 @@
 #include "qemu/help_option.h"
 #include "qemu/module.h"
 #include "qemu/option.h"
+#include "qemu/env.h"
 #include "qemu/id.h"
 #include "qemu/coroutine.h"
 #include "qemu/yank.h"
@@ -240,6 +241,9 @@ static void qemu_char_open(Chardev *chr, ChardevBackend *backend,
     ChardevClass *cc = CHARDEV_GET_CLASS(chr);
     /* Any ChardevCommon member would work */
     ChardevCommon *common = backend ? backend->u.null.data : NULL;
+    char fdname[40];
+
+    chr->close_on_cpr = (common && common->close_on_cpr);
 
     if (common && common->has_logfile) {
         int flags = O_WRONLY | O_CREAT;
@@ -249,7 +253,14 @@ static void qemu_char_open(Chardev *chr, ChardevBackend *backend,
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
@@ -301,11 +312,12 @@ static void char_finalize(Object *obj)
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
 
@@ -505,6 +517,8 @@ void qemu_chr_parse_common(QemuOpts *opts, ChardevCommon *backend)
 
     backend->has_logappend = true;
     backend->logappend = qemu_opt_get_bool(opts, "logappend", false);
+
+    backend->close_on_cpr = qemu_opt_get_bool(opts, "close-on-cpr", false);
 }
 
 static const ChardevClass *char_get_class(const char *driver, Error **errp)
@@ -940,6 +954,9 @@ QemuOptsList qemu_chardev_opts = {
         },{
             .name = "abstract",
             .type = QEMU_OPT_BOOL,
+        },{
+            .name = "close-on-cpr",
+            .type = QEMU_OPT_BOOL,
 #endif
         },
         { /* end of list */ }
@@ -1207,6 +1224,24 @@ GSource *qemu_chr_timeout_add_ms(Chardev *chr, guint ms,
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
index 6413970..194d88c 100644
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
index 3392ac0..ef2d24a 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3071,43 +3071,57 @@ DEFHEADING(Character device options:)
 
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
@@ -3182,6 +3196,10 @@ The general form of a character device option is:
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


