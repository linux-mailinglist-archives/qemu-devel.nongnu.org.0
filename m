Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9B647D801
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 20:51:24 +0100 (CET)
Received: from localhost ([::1]:46888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n07dz-00029r-Nj
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 14:51:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07VI-0004xW-Ca
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:25 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:17168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07VG-0008LI-2z
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:24 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJXwoG028486; 
 Wed, 22 Dec 2021 19:42:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=NJNM7NfZ3AdqmVfamSVJJZ1OhHqgSI7k4O0s/qa3Ohk=;
 b=JPd82KBlEFFYPIb3R26apMrMS7LvYzfkDbg+I5aSw7eQjk2Hp2/U9JbeGeeWlRCBXoUt
 6XQG+wx5Z6OhNirMz+TNisij9Za0XWERGNl2UOmHLUxy8n45nD1cbn4CRK0XXfc/TK28
 6PzY6WpjfTNjkSYfC1emSptQGp558LiyG3A7VuKailb1oyRTZWGOpkhlMBKUY6G7N/e6
 KRj1XQLniso1+2RTrMaQI7QPXK7Ig7C3BxXGmh8jd0sM2e1aMo8wJ1qEZgRxRNaUs0iU
 vYsL2DylfTHnyOPw12djfzQtMzI2LAkidf4PdldHtd0Hutj3c+yjFSamTalbsmi++vuA OQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d410397k1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:06 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJelqG030437;
 Wed, 22 Dec 2021 19:42:05 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2040.outbound.protection.outlook.com [104.47.56.40])
 by userp3020.oracle.com with ESMTP id 3d193qamtk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PVfSbuQLMBnncTg28Pldj8mPmrtEJ2vcp+e/I+EZ8ZemX2zQ+MAz3Z887ZfSsYWdJhdqF+njBB/7BGpWLa/utLBbFtySyLg/6JdrQ8ULa3wpWr7wgiaVcZiJkKATBeM/KofhCoKpLz3OFC0BRlG7IGeJAwd6ZljcEbeudptVBv6v1omSr8Q6/qWwIjA8lBqftbUr3mTyV3CbTEjS9ut9Pf7YNP18uyu5cjwckZFkGamKLOqVXW/HMucMkRTIevgqzseCROpu5h9NRtUQ6aqEpqcMsqETY5gyZYK8Q10HkGEtZvuHG7CURH+M5YThZlFjd57nypnEnnAtkbpmD5qDrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NJNM7NfZ3AdqmVfamSVJJZ1OhHqgSI7k4O0s/qa3Ohk=;
 b=dgZSzlJdKJa8UdS9wbvmsxNEqWT7iX9g+VeyvuAfZbTCzr5qbcMh07x2atVmfZwGpxFxeTGO+WZhzLatpsrPEu0TA+yLVcj5dc7XzT0CmA6Ay5ot2fdjK+bqdjm2cZgFPE2Ke6eRcmq7HDEuC/zS536aIkDtHTiHdu4Mps+8NUIiO8zo12qvZvjhenenR9kAITk+wsBNUkVeLR0GJE7l+NuK3Jn02MkrCCK1K6VNSFEcZrIOCUWWqynDJYZT/S6UL6qvi6TgaLfEhQ1YzIR2zjIWcXW5h+eESkcNytvgW5f/L5LDrfA8+dsvpKtOr6/Vpd0NoDmCIcM6sxtta9ff6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJNM7NfZ3AdqmVfamSVJJZ1OhHqgSI7k4O0s/qa3Ohk=;
 b=OP2t3/AGtMmRLyOakzJD+vb7kRxfkRUODzVunQ83/vzOWCpvOCLLxbH0rem7RS+WEU60saSSTwezCYhtZz7MH0JXA0kPnuz5QiAoTvrEjTn01Hij6gcE9bSidUV15/O0bR1eqqAZ69MBuqGaXjD8aVmKQJhT9ywk+zuFclYctPg=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4242.namprd10.prod.outlook.com (2603:10b6:a03:20d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.16; Wed, 22 Dec
 2021 19:42:03 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623%4]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 19:42:03 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V7 16/29] hostmem-memfd: cpr for memory-backend-memfd
Date: Wed, 22 Dec 2021 11:05:21 -0800
Message-Id: <1640199934-455149-17-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a3fac8e-c880-4748-8c74-08d9c58320b8
X-MS-TrafficTypeDiagnostic: BY5PR10MB4242:EE_
X-Microsoft-Antispam-PRVS: <BY5PR10MB42427DE8A7677EC6C53B7774F97D9@BY5PR10MB4242.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:404;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cn/0TWF5MBGN1Q2u8VrFgu5XXrSe2sNw7C8l6XygkJdKxPG73gLlsGGLjkp4MI4RhHzAqNuEsihqIhwwU9ivAF1oDH7tLNeniHd9Xf84OG8cWzLwDO18gu0EMj0J/pL2+dNSLGlMpacJaN8qPJxPKkLqraE1G0qHeZqc/0AZxKDo0VuKh/ZY4jamHRkp/f7dooY/bkx2KnSwVO3BETvItOzbEfejlWM/hNvlV/9JdZ2htgpGrem6oBuAqF/JqdHytXqx3MVIygC2SQnIHhO8VA7B/MyLs87BS1C77+mbjyr9GbH9TVYfX91PpF0m1RrzjAC/IhZAdiadf+hzp9CovEf8g9y9a6Y7hN3Eskc+gtKiGg1LawpqIg/6Jkj8R3wKLtPsaLTODiAcBtBXYfeUN6EV7fQW2CnnIqIZPDoUYXhPua4ctuSaj2aw2oP0np4X8CFibmRERsPwMztyg+4HyNGirA7nV6IvaKjIwjR/GDW+1RSEj9E7GOgbu/8lX3y0i+BJ/PK3Z7oqCtMkHsUlVLtQP+V81EsZKmhRCCEQan1uX9qabyTcAqDVyjbEB5QrE4DcNWEdDl0/Ixv4F1lTB6SA8v+EGMN7ZPEraovxbBTCJzXHVNYtfgUO6C60+oXD2md2bQi7JjlI5fGGjA2PzPkjZba/W3YRzTmYlRyw9aa9nGIXGJsTKr9vyhi2woq3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(83380400001)(316002)(6916009)(38350700002)(52116002)(54906003)(8676002)(7416002)(38100700002)(8936002)(508600001)(5660300002)(66556008)(6512007)(66476007)(6486002)(36756003)(4326008)(2616005)(6666004)(107886003)(66946007)(2906002)(26005)(86362001)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yPvjXOQn6ZnY8PVLrEmzHWbRhaYRHWdDQd0n8mRG4u0Dp8LNn0CxPPuEpmMV?=
 =?us-ascii?Q?xFtrpWGpvu7XMOre0HiWUwYtHAx4D+eJPyk1t5N2uLJBttZRqzmcE36629kd?=
 =?us-ascii?Q?vwKs7X3xOnYaMsS5GEf2zWkVLsciLzRQ+HtfHp4apoL2fILYxqxa/WjJLAT8?=
 =?us-ascii?Q?HG8KzhP12Y1Rv8mZQLtFxgYX8wFXdzpZCyVC43wO5Us6QHmVYU169YUO20Q6?=
 =?us-ascii?Q?8X7WTAwxzNY0QT/+V17ka+OPCUlCURH9o+Em8M4xGbiyr9mZMFCGaRfjEugI?=
 =?us-ascii?Q?jgsZ6/hDF7o+zlaeAKALcsysi4Uy3mtEoCs/2hgFbcHaOcFIDSTqtis6mPJL?=
 =?us-ascii?Q?5JjDcgY7ut7WDwL6W+Y9N/s5wlPqj+4wCHZzDywLPLSVg0oAFFiC3RCMKf9R?=
 =?us-ascii?Q?MMsL0KfN0YUntqEllQh8tffutnv59FdE3PzEGgq2mhyyhl3dsLQG4E5mmzWa?=
 =?us-ascii?Q?dCXZqLPK0n7JEJfy1Sh9/TpLKg2m6Dyk8VlA5hXZ43Vdb/6FM19UY9W7isa+?=
 =?us-ascii?Q?6E+4Ov9NwpjmBDInrX5zXmfQ07VOtNKvlHzeMHShnka6CTYRSATPQibTXY2O?=
 =?us-ascii?Q?ScaDJeuqnCI5ponqbPW15A1PhK3KUu+Fdiq1FPa4+UzMCbD/OAdg31TfVExp?=
 =?us-ascii?Q?dfrdTZLhFhLD7yNkE22SSauD8dfCcYWOQr36X6DsR7R9iT3TzKeg+fhbvt7R?=
 =?us-ascii?Q?2zwtE9wu4Hkn/XRZAcNdLgzNKaN5PO5nQIMuQMjyofAhtZq0Hpwdl7IJkJcR?=
 =?us-ascii?Q?ekqqWIf2zD2Tdf0TLMXahEjAb3LoBJqRQvkQkYepEg3BwNYoQdfO78JKBGkd?=
 =?us-ascii?Q?8I9hqYftlbMcRPp8zwHesHX1/DL/gmWKP072it204nB/9M0G41q2BU6v605Y?=
 =?us-ascii?Q?GcN+7LpP42sKucBEjXlCLUkyGijLKUQmNYLNZNc5YMidBuqrPPXYftUPIlHz?=
 =?us-ascii?Q?uKu2Qvi4F36GQf9vsFuxF5uJXTQC94UAdHk0b8YigYsRc5WsmEfhktwMegA2?=
 =?us-ascii?Q?YlAZSEtavHFjVaDyDZZaLcpXbHzrw+clCfB+2P+jSSh9kSr/YrnpZjvC/via?=
 =?us-ascii?Q?iFMRQtf1EHZ9y68FaxEXb1FeLMBolZgqA7K5T3MnT6eIzIK5HXg6Pn1vO8CD?=
 =?us-ascii?Q?iQY2BfDoaunfeHnmhxwiFkVsgbR3Ix/3Kug5bKAiOIg2oZnckkCIbxsyAxOV?=
 =?us-ascii?Q?tvcUAl8rKkfzXOmWXWfh+XhzoERpbYEniuc0JBohfFtZ1EF4HnE6dbpMoRqM?=
 =?us-ascii?Q?y0svW4cJ70zy+r8Aancu/C/cD7aqrHMayCRVj+2OOU//eMjPq6587BETBHJ1?=
 =?us-ascii?Q?JJBEcbGWKVrqeob87AS3araZsI3Vtj6GAm7lfAfWoBqOR3xqVQiNILnjI3GN?=
 =?us-ascii?Q?flBXZsXa+ZkH6DW91g6flyaq8GtL0fiPd3aHCxsS6gt/YZ72NFn94RZ6ipw3?=
 =?us-ascii?Q?LUpwTesX+Lm/PKhS11UUoza/zZvbdn6Lmo9pLIV73f5kxGY5pxIdTQfnY63d?=
 =?us-ascii?Q?wXftt0maUJVqfG/uV48JYTaPfrD3QkWJsw9MH0uYJsRAJed/LdnnHuN4K75U?=
 =?us-ascii?Q?nZ2TQXWI12OoplRPRQS3Cc7zi2lt1a+zVGioc/G1EIYEUhnJQ5iQpFNvaUV+?=
 =?us-ascii?Q?ccIXBHJm/6eWgLJSQ2HK90SweO1x4Shphcvjz4iHz8nwGX3ILqMeNKA9UJvk?=
 =?us-ascii?Q?uYOgCw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a3fac8e-c880-4748-8c74-08d9c58320b8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 19:42:03.1551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N0Syp8R6RE9LeVQHPjW2Hr20Pu/VxDjPoZzdJk8vSfLAH4HcHqHIo3aWR1/7IQl+yJFz9+byaaqX75OCVGNT5WjMoz5VR35ZwtqM4PdRi08=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4242
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10206
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220107
X-Proofpoint-ORIG-GUID: MbCrca_5g3n6TdbxWM0tG5hH1p9TKZoL
X-Proofpoint-GUID: MbCrca_5g3n6TdbxWM0tG5hH1p9TKZoL
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
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
index 3fc85c3..5097a05 100644
--- a/backends/hostmem-memfd.c
+++ b/backends/hostmem-memfd.c
@@ -14,6 +14,7 @@
 #include "sysemu/hostmem.h"
 #include "qom/object_interfaces.h"
 #include "qemu/memfd.h"
+#include "migration/cpr.h"
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
+    int fd = cpr_find_fd(name, 0);
 
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
+        cpr_save_fd(name, 0, fd);
     }
 
-    name = host_memory_backend_get_name(backend);
     ram_flags = backend->share ? RAM_SHARED : 0;
     ram_flags |= backend->reserve ? 0 : RAM_NORESERVE;
     memory_region_init_ram_from_fd(&backend->mr, OBJECT(backend), name,
-- 
1.8.3.1


