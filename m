Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCA63BED21
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 19:33:50 +0200 (CEST)
Received: from localhost ([::1]:56178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1BQj-0006TH-C5
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 13:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKa-0000XG-NW
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:28 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:33448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m1BKW-0006nx-KW
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:27:28 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 167HCHnN010589; Wed, 7 Jul 2021 17:27:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=MzVpx/83Az0SaSqZ+XvT0Su9WlhJCCV1+yFN9rzVNmM=;
 b=QinJt182u89LFj+r93V7klmS+9EeevRr/YyVPcV0u4by4ENEhKbfJFZri4SYODYt+cVI
 e2mvh3bogxyKPX2/P3uzEJBopRZbaKGGmcku1dG/wxQ8f6/CkMAtdGAxhPJZOfjIo5RE
 ZvLItnrw3nJdhdgDddb9+I989Et/UfNb0qClXLfQw/eZhqcQITq43DO5EvNp6d7ofBrA
 GSOveJ9xrx4wMPUZuzxzqX5BuW3LPPN8iy4OjrkS85nsVG+TXw/jeqOOmQA3XEaN41e5
 B2iuNTNrnuYoaKDJF9SRzrLEA8lxMqW8hwTy7EnbMf6KmizAS32wA3gNezVNDpwwHUl2 eg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39m3mhcnh5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:21 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 167HAY3w155372;
 Wed, 7 Jul 2021 17:27:20 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by userp3020.oracle.com with ESMTP id 39k1nxjv80-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Jul 2021 17:27:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CnjA0ZlWQkqjXHGx55jmob/FK+Qczxvrcm1E6jgCzgEOCcCy5fOB2YcCv4LdLkQEIGMWfa4/zKbHVGSIN63oHSW7jg5dNUQsKVXw+yGmcztD/FePZGuUZrWRrLfnjWvYz0wfzw4LGKqs9qsFXWSOreIcx8m1ygFjba5j3XoYC+WkA99eJsehom+GZI7KvtFd0wfI0TyYG8wf2uz7EJHUsBRPx8bZ/olJO5DNjdU7oddoYdCa7lP2MPU7iJPt6RBTOJUGPuL7tQzaDGpICa5dSB6pxGkOIgfAMDQlhak0ogyBATdj7mwmfTIC2FfMShkytx6XGkBi31uHwzQj/c37LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MzVpx/83Az0SaSqZ+XvT0Su9WlhJCCV1+yFN9rzVNmM=;
 b=Nd9sjU30G4Fn8RKU+HGhnXRWk7mjXWl6DKRZ4RDoWMXkxkBEEw2QLzg7h1ulx/pDghrzP0Y+bLmzf0+zUrQ/Xn1/5crj1NUPXM3pyMKV5jJLnvYu3h+VAuxO1eji5G3uCqIkuYJUmOVWrE/YpD5uAIBdIW601lxsa0eSPlNrw5vjtRb852vjpLOwPSQ2rdD/9qeb2d6I3NhS8s8VuxrLmJW7LaGlZXncKNz3laYf3fsYsD4HIzfvkkcP7JLqpyWROfLX6mBvv3ra9r5rLCUfch4BDRYPsJGFWlgI0v7Spi/emF8ZjfRAuMqnwl/8arhO8EitunMAtrCf5aSSJxx5FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MzVpx/83Az0SaSqZ+XvT0Su9WlhJCCV1+yFN9rzVNmM=;
 b=dfo2Yva8O5YGnSTdARGWTgsz1YqbymAxxEFWXbFOS2FHOUoYkCslwh8xuDpslHMb4Bp8Yz+JRZrUneyxArQKdyWT9Ja4iG4xN+NerNNnCkkYPitK9qAyiUpXxO4Z+a9ruA4aA3eUNIFQKHRl+hoFfnplRwIlM7QRdD/fGgbwXXE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2534.namprd10.prod.outlook.com (2603:10b6:a02:b1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.29; Wed, 7 Jul
 2021 17:27:17 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 17:27:17 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V5 15/25] vfio-pci: refactor for cpr
Date: Wed,  7 Jul 2021 10:20:24 -0700
Message-Id: <1625678434-240960-16-git-send-email-steven.sistare@oracle.com>
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
 Transport; Wed, 7 Jul 2021 17:27:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce7749d7-8901-426c-0d24-08d9416c77a3
X-MS-TrafficTypeDiagnostic: BYAPR10MB2534:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB2534121C1D451CDE2E675E42F91A9@BYAPR10MB2534.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:168;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4thP4HHTWYvLR5L4th4dP0WfqyZ/3lHRGJDJCKQDct7mKXvE5iq821JoB0d4ouh8OFrD2jrOqGMN1+mEpGmJUL/MRaj8amPqObdMXECLanqehuU3fASBlZDRf/vsu+ktQHslp4GstdWIZBYX1SWdklwPWi+R5TELPUxQP1kF+4w9+EvY5PYLmPni4w4A+6GxzQ04VlcG2gV23nooEOAHmQSKHHObP+9oHbE2AJCEkukiMWWD0z734gXl/2VSF99wa2QOPwqEE0uJGtluJ7lfhhFMKeAr5bZ/ex5lArR4tPhi64+yWKc6GMujBjugDDEvBza0QHSzBIFkG/ApbbWVdpK42TZ1iTLjEDWX0HEIyfLW063TS4Mi1tlm3R0wrMEDIcAEYinGCt/f2JKu5xvC69lQsWTI8txoT+PkBzo8UfNCbsXdPIes0d3flC9Fh2qzjgMuHYeQou0hbfajzDt/Mj45O2iZrq6hpVkIY41UkhHcR20NJ0Qa83/+R4cpkwrlg6p9jO04PXBKox+D/XThB5KE66qTZfLFZ1pBSDMryFwxRRecZ9qKTR4+lwQzSaDgGuUrS38/fZeetDVi4J3aPTMPWepuTOGNW0APw8pOnrenm44hJuSdoH5zONbdXWL89IgPxu4GDsgbLjS9CRJvaKlFpdfcIAXu0LEElRWcAQJsFqew1k3TP+NySa+E6dQCNEwvG6SmrG4fsktg0BPIAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(136003)(366004)(39860400002)(396003)(66556008)(4326008)(66946007)(186003)(36756003)(5660300002)(956004)(2616005)(38100700002)(83380400001)(38350700002)(8676002)(26005)(54906003)(6666004)(6916009)(66476007)(478600001)(7416002)(8936002)(86362001)(52116002)(2906002)(316002)(7696005)(6486002)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wcOElh8hKrElWE99DC7tQ5rmWDdhRwi7qdCxu3R6z89jQSfvaFXYyW0C6mEo?=
 =?us-ascii?Q?42lS0UVDoBFA09WwmIzh6qeiKRqGmz8SmppjrGWk6IlUE9uVIYNskJFopKHv?=
 =?us-ascii?Q?eWzSBFBs5XtpScVNQdzmB3suf+M7Us/95pRTqKrvizTU+oQcp34rZ0ZR3pEg?=
 =?us-ascii?Q?M+CzLlSuKckSPgci7s7Y4bEtGgyS1NFTGbFf/vSbg2WqUCtxhUfwESdqZjLP?=
 =?us-ascii?Q?zOe9Q5g3f/Wi9yuax/VcfVVtq7DozGv1R9QQOOAe/Y8OkS7sLgdyuo/6Ly/R?=
 =?us-ascii?Q?jycJGEIUFgcU7HmyhW6YeCHKPwQ6cPH+SXKx2kyy6xpTo0YWjzMNKYczRj3q?=
 =?us-ascii?Q?yxPnkGFncMurHOQH7r/KpV9CE79XjvjncmWB68aCGCuj7+7Bw7vNPVfQf8/x?=
 =?us-ascii?Q?EiLefik91A5GiSLF83gHXflkOWPmgBxkU5IBXWQswN9tKRKa0ZthrqwKpZMW?=
 =?us-ascii?Q?LKNp89YOqEzZrV/uLX3OBppX9yFRz5abu3Eax/zDqwAUxcWgo7c86PRTqq6F?=
 =?us-ascii?Q?bvSn8WwGB5ZklUMQwxUnq9lFuJ/LWNtrwEmGF/KcFVBsXY26uqWlTi2iHOBV?=
 =?us-ascii?Q?2yqIN6PU58GYjCUSldDFMWMVxkhvPA0vF2gaDwhWLb49XoBqdIu/iLuCCljD?=
 =?us-ascii?Q?T5YX+Aq6UfCu9kmfHNKfRkDhDoqFhAlS4LN4ItsgvQ7MYW4t3FdGRqmUdVJK?=
 =?us-ascii?Q?BHcE5eGxSNKu6hwQGz6oT+H0LtMI6H0tgK7wY52oN8XkOEjdpFfflBSf4QDZ?=
 =?us-ascii?Q?pJa/q3nG+kVsRDM5MVz5A09HB+7r8yd6qOJj0T+meTL43Bn+ZTFLJK4kwQp/?=
 =?us-ascii?Q?wDByRh7V3gfmU42hsJAg2NcX22t+gtaOXk+D4pMrssgZWFvvnyXfDT6EEAZv?=
 =?us-ascii?Q?8jFFJFWNvTP+O4x7WGMDy9IPzlQr5SBlv30PDWwJGMRc8O6L0qby+pKWiiNW?=
 =?us-ascii?Q?v1P5nVnYMQr6TsiyrwuPE2fvCIMlfT0PjDY4JS9a9A+Q/wouUWHCpgDL158I?=
 =?us-ascii?Q?REseZoX3EjHSdqQTugRRft0XvhIi4kAz7LBXhwp2HxTcPwJeacQVxD68LcnI?=
 =?us-ascii?Q?J3Z8GmZ5MKvvYFIE9tlUAo49AEgmjDzScLnh1KsqtPD86bExDYWaZz4fbfbT?=
 =?us-ascii?Q?a36UFD//1p4vrSyPKWSclaz9I9PzOkv4YDy8V/+aqE7+NqieMH3ORq7mOV/e?=
 =?us-ascii?Q?b2fBsPC/E0aq/gNtr8GGRKUR49PTVW+J1JRuqQ+Xv2lOxYw9tgQ5gVc5vlwA?=
 =?us-ascii?Q?JJzlz5GtM16ZEhmQobfGKc39qqoNs5ipoFUINk9dpmKJGuXYD0fM23dAAK2R?=
 =?us-ascii?Q?09v5+5QX3hYpAk7hJ4TqXMkh?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce7749d7-8901-426c-0d24-08d9416c77a3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 17:27:17.0692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9X+IhQZql6Wx+ss0h37lEX+ToCyA3M+QMj4Har3ZgBRnm5DF7LkqtnTC/RlpXNwFaud/qkQ57V7IRB0EuEFJX7FPeAOmF+pDr6QUmm9HKAY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2534
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107070100
X-Proofpoint-GUID: uR-nZ_8-BO9iwzNzP3BiegPw1wz_-ROq
X-Proofpoint-ORIG-GUID: uR-nZ_8-BO9iwzNzP3BiegPw1wz_-ROq
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

Export vfio_address_spaces and vfio_listener_skipped_section.
Add optional eventfd arg to vfio_add_kvm_msi_virq.
Refactor vector use into a helper vfio_vector_init.
All for use by cpr in a subsequent patch.  No functional change.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/vfio/common.c              |  4 ++--
 hw/vfio/pci.c                 | 41 ++++++++++++++++++++++++++++++-----------
 include/hw/vfio/vfio-common.h |  3 +++
 3 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index ae5654f..9220e64 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -42,7 +42,7 @@
 
 VFIOGroupList vfio_group_list =
     QLIST_HEAD_INITIALIZER(vfio_group_list);
-static QLIST_HEAD(, VFIOAddressSpace) vfio_address_spaces =
+VFIOAddressSpaceList vfio_address_spaces =
     QLIST_HEAD_INITIALIZER(vfio_address_spaces);
 
 #ifdef CONFIG_KVM
@@ -534,7 +534,7 @@ static int vfio_host_win_del(VFIOContainer *container, hwaddr min_iova,
     return -1;
 }
 
-static bool vfio_listener_skipped_section(MemoryRegionSection *section)
+bool vfio_listener_skipped_section(MemoryRegionSection *section)
 {
     return (!memory_region_is_ram(section->mr) &&
             !memory_region_is_iommu(section->mr)) ||
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index ab4077a..9fc12bc 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -409,8 +409,19 @@ static int vfio_enable_vectors(VFIOPCIDevice *vdev, bool msix)
     return ret;
 }
 
+/* Create new or reuse existing eventfd */
+static int vfio_event_notifier_init(EventNotifier *e, int eventfd)
+{
+    if (eventfd < 0) {
+        return event_notifier_init(e, 0);
+    }
+
+    event_notifier_init_fd(e, eventfd);
+    return 0;
+}
+
 static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
-                                  int vector_n, bool msix)
+                                  int vector_n, bool msix, int eventfd)
 {
     int virq;
 
@@ -418,7 +429,7 @@ static void vfio_add_kvm_msi_virq(VFIOPCIDevice *vdev, VFIOMSIVector *vector,
         return;
     }
 
-    if (event_notifier_init(&vector->kvm_interrupt, 0)) {
+    if (vfio_event_notifier_init(&vector->kvm_interrupt, eventfd)) {
         return;
     }
 
@@ -454,6 +465,20 @@ static void vfio_update_kvm_msi_virq(VFIOMSIVector *vector, MSIMessage msg,
     kvm_irqchip_commit_routes(kvm_state);
 }
 
+static void vfio_vector_init(VFIOPCIDevice *vdev, int nr, int eventfd)
+{
+    VFIOMSIVector *vector = &vdev->msi_vectors[nr];
+    PCIDevice *pdev = &vdev->pdev;
+
+    vector->vdev = vdev;
+    vector->virq = -1;
+    if (vfio_event_notifier_init(&vector->interrupt, eventfd)) {
+        error_report("vfio: Error: event_notifier_init failed");
+    }
+    vector->use = true;
+    msix_vector_use(pdev, nr);
+}
+
 static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
                                    MSIMessage *msg, IOHandler *handler)
 {
@@ -466,13 +491,7 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
     vector = &vdev->msi_vectors[nr];
 
     if (!vector->use) {
-        vector->vdev = vdev;
-        vector->virq = -1;
-        if (event_notifier_init(&vector->interrupt, 0)) {
-            error_report("vfio: Error: event_notifier_init failed");
-        }
-        vector->use = true;
-        msix_vector_use(pdev, nr);
+        vfio_vector_init(vdev, nr, -1);
     }
 
     qemu_set_fd_handler(event_notifier_get_fd(&vector->interrupt),
@@ -490,7 +509,7 @@ static int vfio_msix_vector_do_use(PCIDevice *pdev, unsigned int nr,
         }
     } else {
         if (msg) {
-            vfio_add_kvm_msi_virq(vdev, vector, nr, true);
+            vfio_add_kvm_msi_virq(vdev, vector, nr, true, -1);
         }
     }
 
@@ -640,7 +659,7 @@ retry:
          * Attempt to enable route through KVM irqchip,
          * default to userspace handling if unavailable.
          */
-        vfio_add_kvm_msi_virq(vdev, vector, i, false);
+        vfio_add_kvm_msi_virq(vdev, vector, i, false, -1);
     }
 
     /* Set interrupt type prior to possible interrupts */
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 6141162..00acb85 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -204,6 +204,8 @@ int vfio_get_device(VFIOGroup *group, const char *name,
 extern const MemoryRegionOps vfio_region_ops;
 typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
 extern VFIOGroupList vfio_group_list;
+typedef QLIST_HEAD(, VFIOAddressSpace) VFIOAddressSpaceList;
+extern VFIOAddressSpaceList vfio_address_spaces;
 
 bool vfio_mig_active(void);
 int64_t vfio_mig_bytes_transferred(void);
@@ -222,6 +224,7 @@ struct vfio_info_cap_header *
 vfio_get_device_info_cap(struct vfio_device_info *info, uint16_t id);
 #endif
 extern const MemoryListener vfio_prereg_listener;
+bool vfio_listener_skipped_section(MemoryRegionSection *section);
 
 int vfio_spapr_create_window(VFIOContainer *container,
                              MemoryRegionSection *section,
-- 
1.8.3.1


