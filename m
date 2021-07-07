Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F13623BED58
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 19:46:35 +0200 (CEST)
Received: from localhost ([::1]:60844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Bd4-00038M-VS
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 13:46:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKb-0000Y8-6D
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:29 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:57790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKW-0006o4-LS
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:28 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 167HCmFa005054; Wed, 7 Jul 2021 17:27:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=GmDaYeOcxz0kSqnxgEbfhgR865HIOFZlsv2d1D6ULWc=;
 b=m6aLgzG4zwcB1aRXYmTGvHyrnNzt+r+1ktxgN6PrgEjyuJeDbOhTEWUTVY4r5UExvQhw
 GOz6YtuPc75CSc7vu7D6mxIewPFXzfSQKkqTxxI0knZWUhpo202hJHmU9gQMa5G9bgp0
 1QwASombaclz+yUhHy1OzsF7en6wtvcazcnMM1ZirTAyVzlY9QhUGkUUYsRC+3VDfLfp
 /WRLm4cGcm/vQGKsjKQQHgCxBqbvGCsGn7EA/razfdnVjOCNk5SNnL+ZyzvRm5HLnNFu
 3hHY3TMQkRIAMXTlYdoGF94DYD8B5RPmlHsN2KjyH8U32FyQVNIM9OriWbNLlQjTtIIe eA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39n7wrs7q6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:22 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 167HAK1Z068884;
 Wed, 7 Jul 2021 17:27:21 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2042.outbound.protection.outlook.com [104.47.56.42])
 by aserp3020.oracle.com with ESMTP id 39jfqayy42-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lHHUS8Ew/xyhYpPQzDTGIizCHU0SWwlHgMslAsR0uFPmUNnx6bRqCzTSYWWvuUMKmBuD2FBPK/REoUvFmhDaHjWU/CjOEArzpfFJfRzLyLq8lY5j4cMGEaEuSIybXMJdt9OIYx7uAeAmds6LUwhCZ1arE3ShVWKM3ZKBNJGSGU60TAajOqYThPNbGMjObdmg4FvyzQbN17+BMfFjEq8FsvowL5+qOVzYNKXqgpb/KAuR2W9YCickspBnkGZeE8LJXvboyhyAa0M0dSbJdFr9u6Mnlt3COlX0L3IHTY2PovO3ElleUHNR/EIzkVfWWqtjTw/z8gKHMxIlu7gtotWc9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GmDaYeOcxz0kSqnxgEbfhgR865HIOFZlsv2d1D6ULWc=;
 b=MOTjH0QFLFwObt2l/fEQPz4x8r71uoSoKR/+UFYDeSp7hKLMO+m8ruGZiEqug5h1Gme3ttG7G9EwbDtgBLhmOacVCzwv5l8MfgxCg3JLzxUZU+G1fENdDEogTjA9/WuWnI2cj8uMZm0hGU3TM8MjZGx2Eccbwr9KUA5FNaRU9cxzTW64J+QM66dcR5ADwkVj1/VFO8D1I2UV48/oohGGIHdFc0Flsw4XbEw7QLgXi0wp3HW6TC0dX721pA3WAlmX4F8nM9hQsbbvPw6Sr0p8mMFHx1I+UmnmMKS/+C05qfEB0OpcE5/WR6hGNSq00gUOkSzUaZci/fXZSXQrY3PrMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GmDaYeOcxz0kSqnxgEbfhgR865HIOFZlsv2d1D6ULWc=;
 b=NazrbplJKLBhezmnWdIW44ANyHeXzMh9nO/XXkS3Gm0HNKfGDuw6Y8o6hsz/p21Eka4LHptntP7aBSxHBRNsbkHZjiPmFG8c30OmVaUMBdRw6+xamEhjjzIvxSKuZO9df3oN29OE1h0+YEyzvK7RThmmTp8MdBHqMKnNKI3/tuQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2677.namprd10.prod.outlook.com (2603:10b6:a02:b7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Wed, 7 Jul
 2021 17:27:19 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 17:27:19 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V5 19/25] hostmem-memfd: cpr support
Date: Wed,  7 Jul 2021 10:20:28 -0700
Message-Id: <1625678434-240960-20-git-send-email-steven.sistare@oracle.com>
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
 Transport; Wed, 7 Jul 2021 17:27:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f1a089e-0ff5-47f4-7010-08d9416c78ee
X-MS-TrafficTypeDiagnostic: BYAPR10MB2677:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB267745B143C803596F07EFDFF91A9@BYAPR10MB2677.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:404;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EqTTawAFMUDG7sZBZ2RxKfd8m4lF+rZhmcMybGXaoQCXyDVb09rI4FjYWZ5bBZuow8lgoYF3vJz9uyq5JNL8z3jlKfHGbti+TdOABUh1F2fjw9/eCg/yck40H4frBus98DnmhOIp54XUSVv7GxfaJmHVVyFm5zFB5ibEh3N/Z32W9rjk3McNJWuNmtRnCwtIs2vAWnMdgFij3c3KsULYbffgEKS9x2f9znFYImyrfUyun1gIvntN2XxFsRvgSS9EzQ32MwwXH3VPUReokN+d/8cQPaWA5D6TXtasl3cjgo3ancCULtjE3BSsWGwbE0c71rBFh5+ZORxLfNiYk46ueEKp3s1Jh1tj5jZlcQuTcaHW7wS1FVD5ujHkIRXUlLjTjAfwp4zfhwCt5gwh4eyW0JptXBXwmIGzdtU98E2+Y9Op287K6MfP8k7aIvKS5ExTF7uq7k1Br0ln9YLp32Aj8+6D5DxknSS0nH8m6eguft/KcMVgpBDYHP4yjBuPZjhvwEj8JrPLXT20GH5PD2YNoyyPDIAaxqfDeWwa7Z2Et5cz+b0g17x+flUayJ3rhylorNl/oros8L33UBsITa/SsP5WYlkX4K0vcsN1JOoxG8jlJmtzc3AYEVe3nR9ZJcjQq46HqRZlJ7kYm9SugCnYCnC5udDJSRHsD1cPHbBlEnWAd5WZRAB9FOPGKphSm6/f
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(376002)(39860400002)(366004)(346002)(6916009)(107886003)(38100700002)(66946007)(7416002)(4326008)(6486002)(478600001)(2616005)(7696005)(83380400001)(36756003)(52116002)(956004)(8936002)(2906002)(86362001)(186003)(8676002)(66556008)(6666004)(54906003)(316002)(66476007)(5660300002)(38350700002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gPJEQ8NSAPL084VTRTw/9/DWU2RcdZ18YGWS5V+Bmd4s732LvS+lb2ZYfNTd?=
 =?us-ascii?Q?im1KDp/nS8+zC0K+fOiMYVbQE2ojQ6XT2gali6DPFl2OXw2lFZt0MByrtw4A?=
 =?us-ascii?Q?k4R/tf0W4i5KaBIkinoiKmrFAfT090uEKHqEDe33f1JcqWwMqchqSvYb5qo9?=
 =?us-ascii?Q?dpnlh58UCftLSnTiwY+7TxqzR1PVk8UCteyRNwSEu8EIk0y0dJfOJue6JMsZ?=
 =?us-ascii?Q?cngjMZ630PzeRw8Z+ytIz5DYoRq0V00HbPmHscbgB+E16Jez+GWh/UjUdxVL?=
 =?us-ascii?Q?YqC/7JPHhsPDsLueud0ZHrwEMOCNMA+fdw3zaGGCIYSTYXcteygZFxWNNIgh?=
 =?us-ascii?Q?/YTOkPJJ2xBBHp6FQsbr40jlxgC+A5rwMnMwT2eWgpz+9fJ9IJiK8EXh5jh/?=
 =?us-ascii?Q?GwnyxhPSYOy+k6JjlfN+LEbj37QPumLYQVA03YhyIk6Z2DboWTSVpmTmKV6H?=
 =?us-ascii?Q?YwqY/Io9h9/0KrhDg94QAU7nY3ezaWmhu7KwCBI4aAWPsEgC6OXh8+dgTKF0?=
 =?us-ascii?Q?SPYIkCEzU3OPSTechn5Dy1bKmpyiN+538gSaCjj7xfVO+n0/yPIXo1iZEKrM?=
 =?us-ascii?Q?ittNm/D2tGYyWj7UIrBhWPcueZQT/8+C4u6J7I4KgETGu067iSEQw30c7xKC?=
 =?us-ascii?Q?qz4H7VW52GXwtMwzwtQ2Vo4B7gsVC+lGVoPV4K68AE74q36jeThrMkTaPvZS?=
 =?us-ascii?Q?hOY/AdIn3dNZPnbPMYy1ks8q5B6Bj1MLpaBIRdCu4BKkb+EPSrX0mOfIWfJ7?=
 =?us-ascii?Q?vB6PsA19YsL+UVKOqYsYj1KS30bZuJqdyibbaetG3BPgE0DJjYYPARU3Qbvl?=
 =?us-ascii?Q?5eH+3s064zITiEqsVXmNHB8FzPDuMgJftD8mdtEmYZ96yerv9TM8aN50dhWp?=
 =?us-ascii?Q?XThvZj1iLTvt2x4iaisX2xYV4ClGuoxrLT3ZEaZr6TWCnN/U0XqvHLBxwZAN?=
 =?us-ascii?Q?lS0i3cxSd0/DAV6ThT4BTnb14PymmPaoa0dUbPOXtvyH5YaaUqGK2AcU3+9C?=
 =?us-ascii?Q?NJoKcpcvPd2MDCph/1Ns7UmDstN/Nk7EHdKsS42qgDjwWg3kJDAmISjtA/f+?=
 =?us-ascii?Q?aYW6Xb2rSpq2WTaAbFs0dzcX9Z8QguCfWC208OswknqSoF2021+y2S30Smj9?=
 =?us-ascii?Q?vft1s5XASRfWpveR/YJ3b09DZcbL5o4k5h6N9cdAH+BkH9h2KeOq0b+w6BEm?=
 =?us-ascii?Q?IWx6r3q7nfJ2n7np4zq9POU4uh/OtpwHTzLQ9eOslGI+reSp3ndcbPlIYEfL?=
 =?us-ascii?Q?LhGaEpCdjkxOu2tCgx/DsiJYPw2aTAwXGGn/Sms4wX6+i2wMV2tKtz8e8zpP?=
 =?us-ascii?Q?rKQhAJHKI/b3IJoazRv3gV4A?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f1a089e-0ff5-47f4-7010-08d9416c78ee
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 17:27:19.2460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tht4x0U3NjvA1V15amQ63zjDJcbsKHLWNlm0CbDemy8kcCsvykHCVKEMM1J0j6TV8lqYKwP6LVu/lNz2ZLjEcfMoTpkjAG4GgRRymgB0XoE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2677
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107070100
X-Proofpoint-ORIG-GUID: C7T2GQCwhtZCGAqRv2DMRlLdLzhOaWrx
X-Proofpoint-GUID: C7T2GQCwhtZCGAqRv2DMRlLdLzhOaWrx
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

Preserve memory-backend-memfd memory objects during cpr.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 backends/hostmem-memfd.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/backends/hostmem-memfd.c b/backends/hostmem-memfd.c
index 3fc85c3..f6c193b 100644
--- a/backends/hostmem-memfd.c
+++ b/backends/hostmem-memfd.c
@@ -14,6 +14,7 @@
 #include "sysemu/hostmem.h"
 #include "qom/object_interfaces.h"
 #include "qemu/memfd.h"
+#include "qemu/env.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
 #include "qom/object.h"
@@ -36,23 +37,25 @@ memfd_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
 {
     HostMemoryBackendMemfd *m = MEMORY_BACKEND_MEMFD(backend);
     uint32_t ram_flags;
-    char *name;
-    int fd;
+    char *name = host_memory_backend_get_name(backend);
+    int fd = getenv_fd(name);
 
     if (!backend->size) {
         error_setg(errp, "can't create backend with size 0");
         return;
     }
 
-    fd = qemu_memfd_create(TYPE_MEMORY_BACKEND_MEMFD, backend->size,
-                           m->hugetlb, m->hugetlbsize, m->seal ?
-                           F_SEAL_GROW | F_SEAL_SHRINK | F_SEAL_SEAL : 0,
-                           errp);
-    if (fd == -1) {
-        return;
+    if (fd < 0) {
+        fd = qemu_memfd_create(TYPE_MEMORY_BACKEND_MEMFD, backend->size,
+                               m->hugetlb, m->hugetlbsize, m->seal ?
+                               F_SEAL_GROW | F_SEAL_SHRINK | F_SEAL_SEAL : 0,
+                               errp);
+        if (fd == -1) {
+            return;
+        }
+        setenv_fd(name, fd);
     }
 
-    name = host_memory_backend_get_name(backend);
     ram_flags = backend->share ? RAM_SHARED : 0;
     ram_flags |= backend->reserve ? 0 : RAM_NORESERVE;
     memory_region_init_ram_from_fd(&backend->mr, OBJECT(backend), name,
-- 
1.8.3.1


