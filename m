Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA684B9AD6
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 09:26:14 +0100 (CET)
Received: from localhost ([::1]:40972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKc7B-0000Az-C7
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 03:26:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKbYA-00045h-Ch
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:50:02 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:20684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKbY6-0004TL-Jv
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:50:02 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21H5WxbK009086; 
 Thu, 17 Feb 2022 07:49:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=Ejh5N0EBlhL381SvOD1+mgeuuRLMXQaPGZO1ZMI7bh0=;
 b=T4nKtKbnYqLf/vLmuGQmghjflemE/mWJp1h5NCciYey5CcxKrbOmeWDnzfXte94ohaXj
 Y3xTgEIjcTOXYBwAGkayDu25KRle3IIm9m4iJV8aKt4Pa2maI8oBH945jyYakcMXZVmP
 HRDp24wyrV+WH9BeS+SQjKqCf5vvy0iALUxroqGgEdc8tgeZUbBa8Ghk983KBXMl7MZX
 0yw/59DigsEekym7Hj5DIr8UEHiTzbmV4crOkGK3pM0gQqV83DsLn9TbpsV7kHKw18LV
 JJIepIR7F5jSq+wB1jsVnu4HM/c0oSHYs8HbQhf/tTRgNbdHP5MfhNqT8vWWBvDDfQwq uQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e8nb3mhrq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 07:49:46 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21H7gatl136179;
 Thu, 17 Feb 2022 07:49:45 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by userp3020.oracle.com with ESMTP id 3e8n4vje3t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 07:49:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BRZyUYrkosmoKfya3/AO8O8R+8CPOpYk2CHFQKg2J0QqXdGZxVkpvaQVjX7ZziR/wCC4grEFtkVkJaCJ89/pE0p3WJ/4OOaMg1auxKrBPypX8LOcO5VBYZamLNKMOvyzdH6zEVxtCXG1Hth57fbVlq5vsul0yJZmT9QGcxfP6mGGE/EjylC1iFeCDanPmtSYXiD6CmM0IpYFm1+jUm5yGn8Id3Vzt6MaaiE+Z52xox3MlPDg4q4FKgVcqoiUzgJ9Jl3P6xueJNXKeVWP/N7ZLwZ4Bw+frInRoI9nMvPzV0BR9d0h2dgSZT6e9Hcj7LVOM2gWUzVz+ThM4Sa8HsI8KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ejh5N0EBlhL381SvOD1+mgeuuRLMXQaPGZO1ZMI7bh0=;
 b=Qo2ysYOQ6h/De+5Ax7vs08p7wIE1iuxgTZmWfmmZZetTID2xd2t1ClfxJUP4T3Chhj3AfvdZsL0HzGVtuZz3vhs23d1kqpR/HJwWjRB0Zj77Xn8gb9Gal3A7uDGGiwLSVB/IvsmLwS23d28Kndzgy+07E367Nt7Qv7gRXVQmej38eg5p5ze54e9msk7dvLcZv0JWBKyAXjMRXTMrrzE9tG13I14phm5ItvVgYMXcPgMKysAVNGKPUkg4lHmOdteoBVE/KGkZuvpTJw/eAjaZcN+UW00T+4pwFig2Hsx0R6CsLV3zdiagT7s6O8GeH4zkq9sjgwR1wz6QCDsRZWi3FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ejh5N0EBlhL381SvOD1+mgeuuRLMXQaPGZO1ZMI7bh0=;
 b=TA99OUTEg/Kl91DRUiexZ0aOHO2TqIotMWKJeemf9ewOs6/nXfKlXc4Us3t0Ir1K2NtkA9e2Bixp83BYtwGqYX2K+lGIi7UgQ4nmEYZKAZq9ZrDuUTVy4OquxLA0dBpAlstyBr4vsuQlgJ5dhYi8NqpXIOMYGlKOt/S4AXRf2Po=
Received: from CH2PR10MB4008.namprd10.prod.outlook.com (2603:10b6:610:c::22)
 by DM6PR10MB3211.namprd10.prod.outlook.com (2603:10b6:5:1a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Thu, 17 Feb
 2022 07:49:42 +0000
Received: from CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe]) by CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe%6]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 07:49:42 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 14/19] vfio-user: handle PCI BAR accesses
Date: Thu, 17 Feb 2022 02:49:01 -0500
Message-Id: <711d01b9e52be0260f26a72feb286f6b32cbe332.1645079934.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1645079934.git.jag.raman@oracle.com>
References: <cover.1645079934.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR10CA0002.namprd10.prod.outlook.com
 (2603:10b6:806:a7::7) To CH2PR10MB4008.namprd10.prod.outlook.com
 (2603:10b6:610:c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c7322c3-23ed-45ec-3592-08d9f1ea0ed6
X-MS-TrafficTypeDiagnostic: DM6PR10MB3211:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB3211F9DD491D0CB679CE1FE390369@DM6PR10MB3211.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:356;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AnwsHnBwxgc59QiCkTPdCKoTbdJ9R9iRTg203IyUfnPw6UNGtTdb0gvuynIyp8DZnpxdlbSMRCsHRihRjVQ3i5SbNDLonABPY+UJe/JO/y5uVZkO/rCdfUAO1UllaG8H9suPHQPjm9Vvc5/OPmx6BJ+s9Lz9MW+IX/S+/5Q+QEybZPCct7gp4vKdYVt1rUPXsOJh+ldGHqmx2DMMK2HdqV3//sfK0qvSt48Y/NT6OmUfJV+ZJO+9n3r1ChlEo2AfprCZHfxs6N0RerjxQDShsiw4eI1L9FDXYHKdxl+C0LcPcsBoWSpcF82w9UgKbctJ5HcbIXnc34lNFGMgSnIufenrePAL1S3i6xQSaCRMxIm+rhJh4VKgfb1mE1a8atpT2IpGnT4YFgdDh1isyhwLzta/q4l1K+TerlpAFTN0n0JD8RjHgS88PSzifj2hBevAIuBF46uFO89+i8IczyJm70dBCWCfITmC87om98XK/BpPpVb8BKdMLmcf6Y8UMoXy2BLwYJR2hzqf+Lt4bAN+v5j5yIZF4TpO5IW5xDtVPKa6LK4bbUuEXeym3k1f8PUN967xC9TBEctPQGZIqjdgj9Jlra29jwBJq/PDxv6g53warI22muQNedsNAB+AoSFAGoOs+cxr/m6RujnNMwHMN37bwhf7N+xOtu2Sy6DiRvZzWbe4ayYwivbtFKbquORuZSY40M/lfTeKWtE65D9Usg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR10MB4008.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(186003)(66946007)(38350700002)(7416002)(4326008)(107886003)(26005)(66556008)(6916009)(8676002)(5660300002)(2616005)(8936002)(86362001)(38100700002)(66476007)(36756003)(316002)(508600001)(52116002)(6512007)(6506007)(2906002)(6666004)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C3CPHcHNRhzxSAUicH2LHba0A7FFwfa8/js38tkuVlWjpZY9guqPMdC0TG/T?=
 =?us-ascii?Q?G+zxOKnBzjUyHMxogR0tWIsEXvXZTVgYepV+CxS3pq+Ak31b8uCbYdTh0TOL?=
 =?us-ascii?Q?00TfXIt2b/orRKzUOzkI0mhaDGoxxBn7obn/AzXtsqjolm7l528aARnFF5+R?=
 =?us-ascii?Q?axW9ma7icw2zvGrG9KuMd/9tWNAyJPd5Niw2t124IC78u562QlxDNnnjHnBp?=
 =?us-ascii?Q?82gAPSZ6bv7K+1wBIPHM990H9vKCcz2l3dGvaMoDrKU+UHhm3HwSf7osMfkx?=
 =?us-ascii?Q?1fsWTG/6PyhgbyzdAvcWT89ec8e0dUy2+b1LIiw364z5QQtNVJkNViCX6gNo?=
 =?us-ascii?Q?AOTy3GQu+4mPQpv6pEMg1UgGIE4tznoqHnoE7L0RMtcgKcCpr/l6fCIDlw/a?=
 =?us-ascii?Q?/Q05Rtt7bqLgSXnJTeAmcYmw2tJV23tvwHpDw/wu15YtvMD7j0QOxsk2H66i?=
 =?us-ascii?Q?nbq7rIOpdhDtu6BIj627beRRoTbPR7OWBFKaESsdjTO4KBtP/UslHEF8P8AE?=
 =?us-ascii?Q?hvug72Yt1rsMqHtE4puuE7NPrxqmQlymZV0QlOdITYnwkd9y1axDfD5Aq9KB?=
 =?us-ascii?Q?KxAbiN0o063S3dyC4+vRdDZQzNG8ooiRJzcOl28+bPcmxE3iT/UUwtsqfnzx?=
 =?us-ascii?Q?M3gIoONrlgnp1GstOUykllvbXje5J7Ze6wpDpt+ywKjLU6sTUQNkl/g6WBpb?=
 =?us-ascii?Q?NQtTkGog1xOCTKNQsNbwZCOLjaaLLXwG9ioEB7okpP+IK4VLpl040FByfa1B?=
 =?us-ascii?Q?/PSipuvAnalz8lcJNcVWiNzbT2CJLUFAbSWFZh74N8AG0upVnBkjbWbzIzux?=
 =?us-ascii?Q?xcFKdV9TdPDOogbIi52Mr3RJVszCSISVvD4Vq3vwjO7nAxXache3lSWHjFVb?=
 =?us-ascii?Q?3stHwlNpR8wM4hnW0UJEa5fA004SqzhlKyofjqkiUvXorEuse3NckMnRurtI?=
 =?us-ascii?Q?jErOU3wXaeNyoTaxyo76O8FWfiPJG18AQKk+GASQ4JJv3a9c7XYIpZRSnTUL?=
 =?us-ascii?Q?a5ULYwv8wdCq7RFsEc3irblIZuED5Q9wuxWdJiAqKKkxytxyRcP64cCHrrmp?=
 =?us-ascii?Q?ipeAGJaqqa/k5yvQObpx+M+TbXSU1xEUdARNjfHwxAFux+JmKzNSx9bTgQ+G?=
 =?us-ascii?Q?uIUbAXs5VWmSfpO31Sje37QSxFflCc9f4NIstO/l35sBgpfOGZYtO7c9AlE1?=
 =?us-ascii?Q?dDYGOgHfIvcG7dGe9vz7jTFADm/n4V0ghq+T6CcDYzd1snP1vaWVJ7uhtrmq?=
 =?us-ascii?Q?fvB2OaSj2l28leFyTNUfoeXh80SeMX4ZwdGsZEC7neEl/jKdvx5/ezRwno40?=
 =?us-ascii?Q?pfNcG9+o/ilGATkXVuEmHB4NfqqYGveckhGbp4ShHjQPOSxHB5maHlt7OaU2?=
 =?us-ascii?Q?fHLjVP8Fbth98qNfxJrbszGo74rkVCMdVbHbUZMdvoMkPbLS4qQxXJZ4F/er?=
 =?us-ascii?Q?RVgHAtcLIimqCZ5nfTb6LESXRQMah1syXckSBKqPH9cmrYE9gmcSs3yTk67a?=
 =?us-ascii?Q?o16wFS8Vk/WwLXg/TLbGnMS8NqyOtSnyNqnrozoyKr9R5YWoQ60Pc8ZN7jUj?=
 =?us-ascii?Q?O0MXfbHcPH7VenY2cjoPLE5KSz0Zq+bqwRfxxMi4lsOj6ZsiZtk4e5j1Hdrk?=
 =?us-ascii?Q?7rT+0xsxrH9c9b42EW21Q/Q=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c7322c3-23ed-45ec-3592-08d9f1ea0ed6
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4008.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 07:49:42.4446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7vBPghomhOcJT7PdKnjqOkepvYJny15ED0os5epY0ldOm/V+eyJHVhlnTGaf/2QJYKVDlPLFualurEiT1nV6jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3211
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10260
 signatures=675971
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202170034
X-Proofpoint-GUID: WfOUqO30bAbb6wMklBEIYweuZirRxQvu
X-Proofpoint-ORIG-GUID: WfOUqO30bAbb6wMklBEIYweuZirRxQvu
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org,
 alex.williamson@redhat.com, kanth.ghatraju@oracle.com, stefanha@redhat.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, jag.raman@oracle.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Determine the BARs used by the PCI device and register handlers to
manage the access to the same.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 include/exec/memory.h           |   3 +
 hw/remote/vfio-user-obj.c       | 166 ++++++++++++++++++++++++++++++++
 softmmu/physmem.c               |   4 +-
 tests/qtest/fuzz/generic_fuzz.c |   9 +-
 hw/remote/trace-events          |   3 +
 5 files changed, 179 insertions(+), 6 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 4d5997e6bb..4b061e62d5 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2810,6 +2810,9 @@ MemTxResult address_space_write_cached_slow(MemoryRegionCache *cache,
                                             hwaddr addr, const void *buf,
                                             hwaddr len);
 
+int memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr);
+bool prepare_mmio_access(MemoryRegion *mr);
+
 static inline bool memory_access_is_direct(MemoryRegion *mr, bool is_write)
 {
     if (is_write) {
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 971f6ca28e..2feabd06a4 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -53,6 +53,7 @@
 #include "hw/qdev-core.h"
 #include "hw/pci/pci.h"
 #include "qemu/timer.h"
+#include "exec/memory.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -299,6 +300,169 @@ static void dma_unregister(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
     trace_vfu_dma_unregister((uint64_t)info->iova.iov_base);
 }
 
+static size_t vfu_object_bar_rw(PCIDevice *pci_dev, int pci_bar,
+                                hwaddr offset, char * const buf,
+                                hwaddr len, const bool is_write)
+{
+    uint8_t *ptr = (uint8_t *)buf;
+    uint8_t *ram_ptr = NULL;
+    bool release_lock = false;
+    MemoryRegionSection section = { 0 };
+    MemoryRegion *mr = NULL;
+    int access_size;
+    hwaddr size = 0;
+    MemTxResult result;
+    uint64_t val;
+
+    section = memory_region_find(pci_dev->io_regions[pci_bar].memory,
+                                 offset, len);
+
+    if (!section.mr) {
+        return 0;
+    }
+
+    mr = section.mr;
+
+    if (is_write && mr->readonly) {
+        warn_report("vfu: attempting to write to readonly region in "
+                    "bar %d - [0x%"PRIx64" - 0x%"PRIx64"]",
+                    pci_bar, offset, (offset + len));
+        return 0;
+    }
+
+    if (memory_access_is_direct(mr, is_write)) {
+        /**
+         * Some devices expose a PCI expansion ROM, which could be buffer
+         * based as compared to other regions which are primarily based on
+         * MemoryRegionOps. memory_region_find() would already check
+         * for buffer overflow, we don't need to repeat it here.
+         */
+        ram_ptr = memory_region_get_ram_ptr(mr);
+
+        size = len;
+
+        if (is_write) {
+            memcpy(ram_ptr, buf, size);
+        } else {
+            memcpy(buf, ram_ptr, size);
+        }
+
+        goto exit;
+    }
+
+    while (len > 0) {
+        /**
+         * The read/write logic used below is similar to the ones in
+         * flatview_read/write_continue()
+         */
+        release_lock = prepare_mmio_access(mr);
+
+        access_size = memory_access_size(mr, len, offset);
+
+        if (is_write) {
+            val = ldn_he_p(ptr, access_size);
+
+            result = memory_region_dispatch_write(mr, offset, val,
+                                                  size_memop(access_size),
+                                                  MEMTXATTRS_UNSPECIFIED);
+        } else {
+            result = memory_region_dispatch_read(mr, offset, &val,
+                                                 size_memop(access_size),
+                                                 MEMTXATTRS_UNSPECIFIED);
+
+            stn_he_p(ptr, access_size, val);
+        }
+
+        if (release_lock) {
+            qemu_mutex_unlock_iothread();
+            release_lock = false;
+        }
+
+        if (result != MEMTX_OK) {
+            warn_report("vfu: failed to %s 0x%"PRIx64"",
+                        is_write ? "write to" : "read from",
+                        (offset - size));
+
+            goto exit;
+        }
+
+        len -= access_size;
+        size += access_size;
+        ptr += access_size;
+        offset += access_size;
+    }
+
+exit:
+    memory_region_unref(mr);
+
+    return size;
+}
+
+/**
+ * VFU_OBJECT_BAR_HANDLER - macro for defining handlers for PCI BARs.
+ *
+ * To create handler for BAR number 2, VFU_OBJECT_BAR_HANDLER(2) would
+ * define vfu_object_bar2_handler
+ */
+#define VFU_OBJECT_BAR_HANDLER(BAR_NO)                                         \
+    static ssize_t vfu_object_bar##BAR_NO##_handler(vfu_ctx_t *vfu_ctx,        \
+                                        char * const buf, size_t count,        \
+                                        loff_t offset, const bool is_write)    \
+    {                                                                          \
+        VfuObject *o = vfu_get_private(vfu_ctx);                               \
+        PCIDevice *pci_dev = o->pci_dev;                                       \
+                                                                               \
+        return vfu_object_bar_rw(pci_dev, BAR_NO, offset,                      \
+                                 buf, count, is_write);                        \
+    }                                                                          \
+
+VFU_OBJECT_BAR_HANDLER(0)
+VFU_OBJECT_BAR_HANDLER(1)
+VFU_OBJECT_BAR_HANDLER(2)
+VFU_OBJECT_BAR_HANDLER(3)
+VFU_OBJECT_BAR_HANDLER(4)
+VFU_OBJECT_BAR_HANDLER(5)
+VFU_OBJECT_BAR_HANDLER(6)
+
+static vfu_region_access_cb_t *vfu_object_bar_handlers[PCI_NUM_REGIONS] = {
+    &vfu_object_bar0_handler,
+    &vfu_object_bar1_handler,
+    &vfu_object_bar2_handler,
+    &vfu_object_bar3_handler,
+    &vfu_object_bar4_handler,
+    &vfu_object_bar5_handler,
+    &vfu_object_bar6_handler,
+};
+
+/**
+ * vfu_object_register_bars - Identify active BAR regions of pdev and setup
+ *                            callbacks to handle read/write accesses
+ */
+static void vfu_object_register_bars(vfu_ctx_t *vfu_ctx, PCIDevice *pdev)
+{
+    int flags = VFU_REGION_FLAG_RW;
+    int i;
+
+    for (i = 0; i < PCI_NUM_REGIONS; i++) {
+        if (!pdev->io_regions[i].size) {
+            continue;
+        }
+
+        if ((i == VFU_PCI_DEV_ROM_REGION_IDX) ||
+            pdev->io_regions[i].memory->readonly) {
+            flags &= ~VFU_REGION_FLAG_WRITE;
+        }
+
+        vfu_setup_region(vfu_ctx, VFU_PCI_DEV_BAR0_REGION_IDX + i,
+                         (size_t)pdev->io_regions[i].size,
+                         vfu_object_bar_handlers[i],
+                         flags, NULL, 0, -1, 0);
+
+        trace_vfu_bar_register(i, pdev->io_regions[i].addr,
+                               pdev->io_regions[i].size);
+    }
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -393,6 +557,8 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         goto fail;
     }
 
+    vfu_object_register_bars(o->vfu_ctx, o->pci_dev);
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(errp, "vfu: Failed to realize device %s- %s",
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index dddf70edf5..3188d4e143 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2717,7 +2717,7 @@ void memory_region_flush_rom_device(MemoryRegion *mr, hwaddr addr, hwaddr size)
     invalidate_and_set_dirty(mr, addr, size);
 }
 
-static int memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr)
+int memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr)
 {
     unsigned access_size_max = mr->ops->valid.max_access_size;
 
@@ -2744,7 +2744,7 @@ static int memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr)
     return l;
 }
 
-static bool prepare_mmio_access(MemoryRegion *mr)
+bool prepare_mmio_access(MemoryRegion *mr)
 {
     bool release_lock = false;
 
diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index dd7e25851c..77547fc1d8 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -144,7 +144,7 @@ static void *pattern_alloc(pattern p, size_t len)
     return buf;
 }
 
-static int memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr)
+static int fuzz_memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr)
 {
     unsigned access_size_max = mr->ops->valid.max_access_size;
 
@@ -242,11 +242,12 @@ void fuzz_dma_read_cb(size_t addr, size_t len, MemoryRegion *mr)
 
         /*
          *  If mr1 isn't RAM, address_space_translate doesn't update l. Use
-         *  memory_access_size to identify the number of bytes that it is safe
-         *  to write without accidentally writing to another MemoryRegion.
+         *  fuzz_memory_access_size to identify the number of bytes that it
+         *  is safe to write without accidentally writing to another
+         *  MemoryRegion.
          */
         if (!memory_region_is_ram(mr1)) {
-            l = memory_access_size(mr1, l, addr1);
+            l = fuzz_memory_access_size(mr1, l, addr1);
         }
         if (memory_region_is_ram(mr1) ||
             memory_region_is_romd(mr1) ||
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index f945c7e33b..847d50d88f 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -9,3 +9,6 @@ vfu_cfg_read(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u -> 0x%x"
 vfu_cfg_write(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u <- 0x%x"
 vfu_dma_register(uint64_t gpa, size_t len) "vfu: registering GPA 0x%"PRIx64", %zu bytes"
 vfu_dma_unregister(uint64_t gpa) "vfu: unregistering GPA 0x%"PRIx64""
+vfu_bar_register(int i, uint64_t addr, uint64_t size) "vfu: BAR %d: addr 0x%"PRIx64" size 0x%"PRIx64""
+vfu_bar_rw_enter(const char *op, uint64_t addr) "vfu: %s request for BAR address 0x%"PRIx64""
+vfu_bar_rw_exit(const char *op, uint64_t addr) "vfu: Finished %s of BAR address 0x%"PRIx64""
-- 
2.20.1


