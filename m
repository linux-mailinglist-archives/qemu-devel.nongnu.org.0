Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1AF3BDBF9
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 19:09:41 +0200 (CEST)
Received: from localhost ([::1]:54272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0oZo-0002Nk-Un
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 13:09:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oK0-0001du-Bs
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:53:20 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:31536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oJx-00085n-Fm
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:53:20 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 166GpqgK030618; Tue, 6 Jul 2021 16:53:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=c0E/zcDJGjSGN7JHoqA7EjNGE+X5H2Tp4mcfHSW8Qr4=;
 b=hTlwyGWI3w0GvuGgIp/eAxqVCqzs0WJnrDKT7XWeKHjOjblr583s9w2DOlFqFxFvvKmA
 R2Tn9FWMF7xWPKM01jMFZSPtUnCGImUShcq5Q2x7ZLZmc7u7/9eJk03FDr5JRh3TMTSC
 OLCtmAvIm7/OGgUGeBEauX0lOdTfMYVJnyFeVzexVf8I1HOLPL/1GKfIJVmNAKhRTTj8
 TafMDL1zCdoOnI7m8zUdJQo04B7R18xStpgM4exxTPexPtLgqKWWYPODXGW/4MzA2N1Z
 AQSwUNTpLg8HojYBMmyqgstGpWXko7XBTzmNqyC23G9MY38/+7EfzqWSuRsXyAtJrkyz bw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39m2smjabt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:53:15 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 166GoUJG084680;
 Tue, 6 Jul 2021 16:53:14 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
 by userp3020.oracle.com with ESMTP id 39k1nvcqh5-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:53:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmzDzUjQOEpZhuLwcxt+rwbKlvAXG/kCIzRJu2FfXFE9xJypBx2m2MjpZRK11IbeaCmWvve5c0ifbrFaMjfvWpSGln4Nkx8kdYZg2SUToekvvjR5K+i7N1PoTfrWX7uPOa+cvpVxNQEgAsa9c5l64vu7C0IcNwC2Pa0DPHJkcvIYosRLFcU1fKuCR58Zi/VfJy6jCR2q8sDkMlw0fqkySvVNb99GWyRnPQ38JgTXO8tXVxgaKLx5K9Gff9Imo6rshqLdkJetswK+yAAJlAZzsLD6fkjHj9Ff4H+pon2wMDLcmFT0LzpF5erD10Fk6YvSfn+LfskBOSnEOKZjYPrcsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0E/zcDJGjSGN7JHoqA7EjNGE+X5H2Tp4mcfHSW8Qr4=;
 b=Pg9ctZajk3H2sS81xKQSKsdHipldarIMXVERkr5jVMe0FkCDCO5ChFYYuHoUpNkFnaFNZCrpPRfP9ZRtNWGKFIiolo+0+BjE0HIr+kU5zhv4PAOjGVTy8qeXw1kY6uGFdugq4ToFrfHh3sep3bhHrxkssFt09ZoWLw2x0HCjTjIl1anmE2ke7wIiJ6hn31vw1IBzwEc8B1NRKHh+0I6dhyizDnhxX2WQKbwSqxIszR33XAALQ/ijDIYWubtrMS3r1OdUHRTIGsT6uthPJHnxl+VTpl5LzTJ3nesR0YydY3Xa0pJhS9f6QYjZraC0BKMBcn0NvUqeLersWqPnoYQLrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0E/zcDJGjSGN7JHoqA7EjNGE+X5H2Tp4mcfHSW8Qr4=;
 b=A6HF23XF7IllNSk3Itlx/RCrOPDoaHRdHaUA87HwTjCm6N4a9BAJk4/4CyCIxB0R31ysI60p2anZPc2Ji/lS987xFjiRbwKgqO5HhcoK8TMMnlhM8M9VxOIOtcXZYQQOtUeUffPWKwSX7x6b+x3QWd4nfq7kvAyyKq35egiY4qc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2805.namprd10.prod.outlook.com (2603:10b6:a03:8b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Tue, 6 Jul
 2021 16:53:11 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 16:53:11 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V4 19/25] hostmem-memfd: cpr support
Date: Tue,  6 Jul 2021 09:45:50 -0700
Message-Id: <1625589956-81651-20-git-send-email-steven.sistare@oracle.com>
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
 Transport; Tue, 6 Jul 2021 16:53:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db5c3cef-25ac-4993-fe17-08d9409e89ce
X-MS-TrafficTypeDiagnostic: BYAPR10MB2805:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB2805EE6B2C04D7C2426F6CA0F91B9@BYAPR10MB2805.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:404;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 49XgACuDOXtljfcngFUO7WKhuI+SrHYoFMPuABqJvFnXS+h5Z2EsgtP61en5mWhKHmX47ePZd2VSHC5857IwOzboNY4rlvYNTDv7HAyeD1WZzWZm87X94ukKOgrJ40SiAhAGJIKAztzvuaMX57tdoHQQl+osvCyOQY6Om/M7jS83Ev7kKX+sNF2tAr2odek78l0z/+gKJwamMW2XtXshZRabY/inKsmfEbyt+jgOwXZ+kRKbT5tABysjPndM2MvGyBxXVo0QYDvC2Q2oZmXwv0VM4Z9n+Fllh2TatpvC5dY/k82drlqwJCCn4+8+MHgSTHnGK0MYquoksJfp5E9gAlaBqF1n2+/HPYxjuD+jU+aljoiYrmi9fpAqAG0cNyzKITt2rQPwuQk2jrhQLPs+aXosIe0kdiFRLs37rDj9aBudFaVspZKqLvjHR9La1otAX1mLYmumnoTAotpHqoYZvJ0S2K2pxuMkjnCFvR1ot6FqjZE/i4t4uv2Ku5oy3MCyiK9XSerYrGufR5zdu6ocyBPNoD89PUjL7ZIzEaOPOo2j2S6J3Ul+BTvIEADqF6HvOO2byDQzZK47c1oIzmmn6EquR5UgBbRLYSIrORAahcs+8hR5ZOnfKWWR9M3JhIPDbRQRp5vuOzlhbuVkCi2vQQhCQlFf3UiBGaG+AYVn9jLXjj8MMYKJeS1C6D9OrznV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(376002)(346002)(396003)(366004)(4326008)(2616005)(54906003)(26005)(107886003)(5660300002)(83380400001)(6486002)(7696005)(186003)(66946007)(66476007)(66556008)(52116002)(956004)(86362001)(6916009)(7416002)(36756003)(316002)(38100700002)(6666004)(38350700002)(2906002)(8676002)(478600001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IyH3t1eCVZXuM4ObhNR1hPMlrvlBNYWzntoTvNpGxV42nBoCOO46BnhiQUn+?=
 =?us-ascii?Q?6O9bYazAtJOPRUv6d6IEiKS4tssNvMB0KG3OohXG5Mi+LqqD5RiqVwsAhowl?=
 =?us-ascii?Q?CpKzUY4XenZYsCT9XCIQYJYfWE6U/MTVux4wbeHBw9qUdJwsqR7kaZVp6qjd?=
 =?us-ascii?Q?7JS53bYa5LKp0RCewPrZp0PMubRe35zqSVbriMMZAd2D3opqdJ1vqBK7lOIF?=
 =?us-ascii?Q?My1LpySrQt9ENFGL8Ig8VJynvtclYnxE2SDKNRBb8vYAnyE1cOm35fkq5KbJ?=
 =?us-ascii?Q?+FrDKqLibLICsqApae+D8yDRF2dpqTVi9tYcRJ5qAI9OqQJvgOJDg89rWU/H?=
 =?us-ascii?Q?NBqgQ/DhdJqy/zyaQ0IUVml39h3NfesTogVugtdapWKt59PUVeruwDM5Zjn0?=
 =?us-ascii?Q?ncJJ3i8O3eZ+bMmMAVA7AtcFHrfJEmEQrvrzp+7z/V6VWG6G4oluv81LY9kr?=
 =?us-ascii?Q?O5i4t7O5yeCgZOYikXdIP2i92a3Zr2JFmHpdiwM45v7J9BqcLHRtVvSXogX4?=
 =?us-ascii?Q?83YZ/z3Xcl0J6kaKwMN4otObLvPAnyI2bOPTNWkv7hqh8D+vqQ5rqOByQe4Q?=
 =?us-ascii?Q?84M8qPYnKcXzNrs0Bfu9QauqoVYndt4lvdrCOtvuI9d21ZJlIhmPky//me4A?=
 =?us-ascii?Q?tIYblKVSQ3T+mmafl/yG+i04p7Fzh0mlo+lOjW4aGMtwDa/GAvIDaobKDqhU?=
 =?us-ascii?Q?/TlOATtyAJlLA0ziCUKwHHAmf6ve2oqGgf+LhgPZUmB8TzNqGYijVmCUJw/F?=
 =?us-ascii?Q?p0inCtiiNL9+6YsY/pUiJOLtAOKRXqrwNuSgLQjh97T0LYL2ppYUtvMMXTWF?=
 =?us-ascii?Q?2Ppy1iVhoUVyafwAW/RkZZstg1yq661WETZr04/Lg7RJPZUOKL3PtJlxWA0n?=
 =?us-ascii?Q?l9k45qvTWYT1Of/PeEpUrST9Aio9upST59SUUj65vMwo/VyYM86pAr36oFUd?=
 =?us-ascii?Q?8LAUNnyGNwBvveJYWzUJyr1YVKaEyf+mcCEkuevqd7j4KBvIxj5hUsVRLNYn?=
 =?us-ascii?Q?EpPBV+cf2dnsJ5/SfAj9UKgiH0ptMajee8XMml9jNvZSHsvCcjcZBBsYZBNK?=
 =?us-ascii?Q?3dI+DV+9WjinLlkR37psQSw/e01q+S4Gqyd9Mk/WtScCZrikkIgcmFHTbPiu?=
 =?us-ascii?Q?WQAUSAPZo1bRdiJUDrUavH+heQeR3kSjuc0u99mtBaTmMurXayBctIPWe72p?=
 =?us-ascii?Q?TnjgKAZQD047VVGeNwR1F3UGIjXlS8PiFbRtbyosKH8Zoenp/27sc+lzn0h6?=
 =?us-ascii?Q?TEOMkvGKVwhog/P9NqvIbBKqmlDXEyQrMd+Fu8s4bLeYz1M9KXnA1jYN/ctu?=
 =?us-ascii?Q?07U1e9BYUpWHdtP2foChHLRH?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db5c3cef-25ac-4993-fe17-08d9409e89ce
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 16:53:11.1979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KGoiSsKP6WLcsXh4XNqBk7mEbHeofqa48DMFwUNikPggUecTnNCIGRo22m/vbX2DKb09YSZQGMTDJJLUaTjr/R1RRTr3vWXs/a7mNpDI5jo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2805
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107060079
X-Proofpoint-GUID: s5Sn8OvICFPuL9GjzEm6ral_65bsekMP
X-Proofpoint-ORIG-GUID: s5Sn8OvICFPuL9GjzEm6ral_65bsekMP
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
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

Preserve memory-backend-memfd memory objects during cpr.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 backends/hostmem-memfd.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/backends/hostmem-memfd.c b/backends/hostmem-memfd.c
index 69b0ae3..3503c89 100644
--- a/backends/hostmem-memfd.c
+++ b/backends/hostmem-memfd.c
@@ -15,6 +15,7 @@
 #include "sysemu/sysemu.h"
 #include "qom/object_interfaces.h"
 #include "qemu/memfd.h"
+#include "qemu/env.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
 #include "qom/object.h"
@@ -36,23 +37,25 @@ static void
 memfd_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
 {
     HostMemoryBackendMemfd *m = MEMORY_BACKEND_MEMFD(backend);
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
     memory_region_init_ram_from_fd(&backend->mr, OBJECT(backend),
                                    name, backend->size,
                                    backend->share, fd, 0, errp);
-- 
1.8.3.1


