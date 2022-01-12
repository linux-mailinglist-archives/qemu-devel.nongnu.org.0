Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9A148BC45
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 02:16:21 +0100 (CET)
Received: from localhost ([::1]:37876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7SFQ-0007PC-0B
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 20:16:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7Re2-0001Hm-Po
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:42 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:14818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7Rdk-0005hM-Lc
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:38 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20BMrG6a019928
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=VSbxY+PJS0sCwuPidf/ZYvYLFwN2ZplnJ3Ctj7O2rLM=;
 b=I7lj0r8gYCZBdoUEncyuEBKKRRX9nQswFcPdC2U38X3Fmxfqkm5EahmofUNwed+8dHdR
 2BnYiF9zjMdusvy+JNLOoWvq01ptvZafFdEf6AFK0jmGTvTeyBmmZH716jFr+zUDzcsB
 GwjxoYpRKTt4+9UqaDbqWGPv8jNLIKccjathWTNJPH7S/+iJk3JINYcN3IKhqlcMEvyt
 mnWstttzvJpXSSo5k/M5dhgg1QvvBqKOvKBHb6Z7WgekCuZnXUFuIAY9hubD17xW5Qp2
 zlTCdIinoBRfbct4c3NLraUt77q94fLupZcuXbTtUytNO2aPU9WSWSJoOCku/3hs06yy 4w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dgkhx4sj1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:12 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20C0KTBK196414
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:11 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by aserp3030.oracle.com with ESMTP id 3df0nervy9-11
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=am7rLrFNiwUobY0GU/qzbDNkF+0uwtejYuhHmCXHDSJtiOyaXKzzZyHX2q9dY37wIN9a1jD00eU7a8aC6qB4MivEO3TuYsHtFDHuIBZJmKJ1irO2ZicB5PWNs/mSaTDHhzKfrORlA6WfrJ/Ppy7PsPLg0bqC0us+wgITPGOLlukFZnccilUxm7j6ndo4UU4khl1q8uyftT3Y+2+bTu9JzaMyC4ggjCkUsbEvl1t7ZHQXm59NcIqFGGpsGFZp8HHeML5oDrwaTWTl2VbXvbokKd9fdD8+RO5QFQ01Ko8cGUf41FPNFtmqMSf1VlbzDg6pDyS3O/ziEVQOp9BLbbaYaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSbxY+PJS0sCwuPidf/ZYvYLFwN2ZplnJ3Ctj7O2rLM=;
 b=QQZkXnl/BVxK0QY5JOHorOjKAmzdnpBqR9hz7+VvZeZAC3dCCljMf2oZBlliOp3kJ8s0TrQdQVg8K/Fja0g3pHptKaxp8HZ//7AtLY2BXnJ1dw61FGP7lQxvJvDZ07xZgdoflz2AVMEXlOqrVdoJgsKfZ4ufMIoGr6a8vNfEf1Wtz37Q54skNP6RXobdtdYjoFwI+9Xv6imU/3WUUSGsXpdM8kjzVwmc2WBW+ot4mAVUI456qLkf6YW2JKd/b2riReQFK/D+igt0EWBgTBu+tT6/s20Cqocg5hVaAEFcZHKKz4RaNUr5EnCbyAkKJiaR8OfgNe0woyvpjkMclb7uOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VSbxY+PJS0sCwuPidf/ZYvYLFwN2ZplnJ3Ctj7O2rLM=;
 b=v5quaO/RFJwqNgSs/nznaUOqNdmslKi+49Z2GzorO21e5p0r02Dy+59QvdR3dnVSEOl8EJF0skKP0HPsDM7Ge2540Dqvl3G7//3EbYPrnU/MVA5/SxGxej7QjdN0hs2cEkXE3jut4bpXAHrlEKkcT30d/BXrWFyZpKu8IiknWvo=
Received: from PH0PR10MB4679.namprd10.prod.outlook.com (2603:10b6:510:3c::15)
 by PH0PR10MB4742.namprd10.prod.outlook.com (2603:10b6:510:3f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Wed, 12 Jan
 2022 00:37:07 +0000
Received: from PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b]) by PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b%3]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 00:37:07 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v4 15/21] vfio-user: proxy container connect/disconnect
Date: Tue, 11 Jan 2022 16:43:51 -0800
Message-Id: <2601edd1529d80dc1224f7916513c725b092f7b7.1641584317.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1641584316.git.john.g.johnson@oracle.com>
References: <cover.1641584316.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::16) To PH0PR10MB4679.namprd10.prod.outlook.com
 (2603:10b6:510:3c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26f36cc3-fe22-4c56-aeed-08d9d563a9c6
X-MS-TrafficTypeDiagnostic: PH0PR10MB4742:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB4742FFBDE3136B0C2DC6B6EEB6529@PH0PR10MB4742.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oKdCUUnNu+A689Jfi79cN7jp9s66msVC7/YEZjAQyMve1Nh2qYMU8Lq6i9jETa45s7eUl14jig55CFXR98bIvRUqXwvoqpmyriha0EPSj6tFIhQBNF2AZUpBPA0DsySqcpTJlolBf+0FvpRofCAieSA3c/DklZUCJJEXVb/yiQBbmuCsasoWXT/5RsGIcbO7mAuY6nUpLdk0fv96uvjFEU25SdjgYloctMZNuS96VHgM6qdcRPfVkH/iTLwJBhG2o+z2j2aGCWTEBqG/cUBo8XKgea6U6L7Fdb8a7J/KMG/nuLTOlAdtuin5Ie4xtmqD8kqi5+HJ28tr3VkSn7y2qXrzwKQ19YGIDJgwWOVgVOP8m1pT4rjRdJv+pYPrdifomTxUUfyP6WX3qIw2k3a2vl9T0MUgd/CRTXNFCfteV8VfjGddsmGgbHvd+MTBpjGpXIry+AjbvRCmatTGpst8dLkCnj5qOuSa0CKcPmAHSqt5JDMNxmtyUe//IoPQlYA37JCyqj+EvIPUAqvVrm+whQGMcw4fKSAWWdEQl6LuStramKlvJ1yu9vsBoCmYTLuqscfvEHHoIGz546ER7FghQAec9L1XcgJpiHZ0BohtM1jBQXhZ1RiePbTstgaqb5JHk75pk0jdUkUM4lFHHk98yqd+zNCqFhQHdl2c19PVNaRsYO++f1aaIn+naDlx5213ubwYY49fKN5uTo/kNTBT5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4679.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(66556008)(36756003)(508600001)(6486002)(6916009)(66476007)(52116002)(186003)(8676002)(2616005)(316002)(8936002)(6666004)(83380400001)(6512007)(5660300002)(38350700002)(86362001)(6506007)(2906002)(38100700002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TMpRjkXo/fIasi+tLFDjZgmK9gQ87tWc1ob790DiCXBqYdnFws6kTToJQNEB?=
 =?us-ascii?Q?PXfCl6e5Abq8z0cWDtgSuKrU2Lw1XXLtu+DC49Lc3018CzFDa0UxxmM3cNX3?=
 =?us-ascii?Q?WA3JLOk8YL8O0SxJPFbWmBCj1vo8m1rosIysM6oyS1SiDGmK3oDSacbUOtWX?=
 =?us-ascii?Q?IuBHunWwpYRdOF7aIByJTJrHHNO/SlEL+lUNS/IsB8dfVUuIoHDr2rkHzI8r?=
 =?us-ascii?Q?eGZW2Hs9aphsGoHaQmILm4r+JC/5+PevBllHerItjFQG6MAECExK8mIJGGQM?=
 =?us-ascii?Q?REelVnEiL5k+ciToJnD/cT2YgcJVPAjrCVlTVMrZxKOuh2dk3poEejGheLBu?=
 =?us-ascii?Q?+QfQ21VFyyVhPbJajhxi8Rm/dew0y+FfPaDc/W9fhU4JN7auG5ZSfcF4IqqK?=
 =?us-ascii?Q?IlrhX///8ag+8qvH+7qWY+Z1p4Nye1pu7yKFmv4sTVUmuI7/ISOqaikeLKKB?=
 =?us-ascii?Q?xJhPA4r614Dhv8RbFrPzRnXrqr4dr17rpRiDPGIOJCuZchSTXKXTqLPcQvOg?=
 =?us-ascii?Q?Fos/tE0BzAwpsvlvn2p/6yOUoVlJqpkiod820laf/ejFlMQF+XNcFGA6dmVk?=
 =?us-ascii?Q?c61w5HsB3BzXZIJpVsob39EFz4YBTJf9pIAinLHl3Xb2znT+8WQSGUuvEaLZ?=
 =?us-ascii?Q?//Dami9IBFBx/UJspQr/ToIDmkhoZzgTYEg62/2RZtIUsfrMYLHeogT2qxHB?=
 =?us-ascii?Q?v/MCbexq9zR0TiXMYhRQlFRD4KsVCNbpq0lu8nG7g/6V33REMaLP1Xk7nPDO?=
 =?us-ascii?Q?F+46ygc+EFrDUCcQa7MOYwreZsWsvz2iY0kCxG2AdOZaWJD02/jmlNbnKrC/?=
 =?us-ascii?Q?DVE3azbfoVzX7pI3Sms6NgWhE32HsiMyZxNfupVELm0H+QoHl4xBO9g1zcWb?=
 =?us-ascii?Q?J0wl7SPnyFcOgeti5oZKKNOP5hAhGop+71eWyazJuXfldW2MA2I1K8pDipOw?=
 =?us-ascii?Q?s79UxC2KpdZO2xVQE/4N8Bp1uzI18v+FyvsGA5K8cJuDnmhoBmAb/PBH/DS8?=
 =?us-ascii?Q?to8+SEpYI/k9DOPkEDNAZt67uyZUaqGYtpNDYWURbThvW6UAPSb0jWBKgs42?=
 =?us-ascii?Q?AYxLCm5X+12Q43fUHhxvYt3CJibtYeMQWYaxIJKUXRZz22pZpv7fK5PRizZo?=
 =?us-ascii?Q?PT6xdk9M+Gsvi0qjherL9g702NhJchIVuXxpAOz2RNtM/pwyvgF4Bq08Ez/M?=
 =?us-ascii?Q?A2iBqJ3w4zDwdkqTqMFLJpZGQLBliNEt2uOhJjSsYoXPSYHsZ/nSFqpM8Og3?=
 =?us-ascii?Q?tlREvJPtrgu/memb/k0Rup/71RF2Mdbv5o22a3K230A8xF7g5IoM4Wp7syZL?=
 =?us-ascii?Q?+F2KPCvNkRTLdENcJyWfRaZ2WI/2x+Yg+vNBwmqUGFfFfhPXDibJ1qgy+CNg?=
 =?us-ascii?Q?noNoUUO9Btsz4oEHNYllF7gZ95Z7yiCngJl7XVSuQ07ka3cztEkHxQUeLJfV?=
 =?us-ascii?Q?6uVLwgakHdZ2vBlNejWeEZ0WwQdXhsYsxsibuVxWeAE6Y41hXtXmXQwpvjFM?=
 =?us-ascii?Q?fUnMYHKVLu/6Nhi9iDu6pUx7r2PQA2SMUBzEJETmEEIfLz3OsSCnGOym483/?=
 =?us-ascii?Q?Cz877oCDWDu74EGQtYeFpnMt4inRLHiaFdMv2XwYJNkpVzZirQOghEpxy8FA?=
 =?us-ascii?Q?8tfic78U6G1KJetcI6CZLmVjnrS60kOS+iFBI4Qi0rJVU4Dn5AFztIV+/IC5?=
 =?us-ascii?Q?BbuowQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26f36cc3-fe22-4c56-aeed-08d9d563a9c6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4679.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 00:37:07.7578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YhfjpD9CvjYigkMsQ8W/y6oIMhHq/CbkspJFZP8ImEvwo66CQOgfay+90Yd7mYegcTZlhIqH7zlJu8bwDzKl8itbIu54j5WEs9dII2Oy/BU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4742
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10224
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201120000
X-Proofpoint-GUID: rwpSsFj3IMq8cDPrc6113GkJyMGHxJ1k
X-Proofpoint-ORIG-GUID: rwpSsFj3IMq8cDPrc6113GkJyMGHxJ1k
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user.h                |   1 +
 include/hw/vfio/vfio-common.h |   3 ++
 hw/vfio/common.c              | 105 ++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/pci.c                 |  25 ++++++++++
 hw/vfio/user.c                |   3 ++
 5 files changed, 137 insertions(+)

diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index f2098f2..8d03e7c 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -85,5 +85,6 @@ void vfio_user_set_handler(VFIODevice *vbasedev,
 int vfio_user_validate_version(VFIODevice *vbasedev, Error **errp);
 
 extern VFIODevIO vfio_dev_io_sock;
+extern VFIOContIO vfio_cont_io_sock;
 
 #endif /* VFIO_USER_H */
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 4118b8a..59a8299 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -94,6 +94,7 @@ typedef struct VFIOContainer {
     uint64_t max_dirty_bitmap_size;
     unsigned long pgsizes;
     unsigned int dma_max_mappings;
+    VFIOProxy *proxy;
     QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
     QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
     QLIST_HEAD(, VFIOGroup) group_list;
@@ -278,6 +279,8 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp);
 void vfio_put_group(VFIOGroup *group);
 int vfio_get_device(VFIOGroup *group, const char *name,
                     VFIODevice *vbasedev, Error **errp);
+void vfio_connect_proxy(VFIOProxy *proxy, VFIOGroup *group, AddressSpace *as);
+void vfio_disconnect_proxy(VFIOGroup *group);
 
 extern const MemoryRegionOps vfio_region_ops;
 typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 83cc5ec..9a67934 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include CONFIG_DEVICES
 #include <sys/ioctl.h>
 #ifdef CONFIG_KVM
 #include <linux/kvm.h>
@@ -2209,6 +2210,62 @@ put_space_exit:
     return ret;
 }
 
+
+#ifdef CONFIG_VFIO_USER
+
+void vfio_connect_proxy(VFIOProxy *proxy, VFIOGroup *group, AddressSpace *as)
+{
+    VFIOAddressSpace *space;
+    VFIOContainer *container;
+
+    if (QLIST_EMPTY(&vfio_group_list)) {
+        qemu_register_reset(vfio_reset_handler, NULL);
+    }
+
+    QLIST_INSERT_HEAD(&vfio_group_list, group, next);
+
+    /*
+     * try to mirror vfio_connect_container()
+     * as much as possible
+     */
+
+    space = vfio_get_address_space(as);
+
+    container = g_malloc0(sizeof(*container));
+    container->space = space;
+    container->fd = -1;
+    container->io_ops = &vfio_cont_io_sock;
+    QLIST_INIT(&container->giommu_list);
+    QLIST_INIT(&container->hostwin_list);
+    container->proxy = proxy;
+
+    /*
+     * The proxy uses a SW IOMMU in lieu of the HW one
+     * used in the ioctl() version.  Use TYPE1 with the
+     * target's page size for maximum capatibility
+     */
+    container->iommu_type = VFIO_TYPE1_IOMMU;
+    vfio_host_win_add(container, 0, (hwaddr)-1, TARGET_PAGE_SIZE);
+    container->pgsizes = TARGET_PAGE_SIZE;
+
+    container->dirty_pages_supported = true;
+    container->max_dirty_bitmap_size = VFIO_USER_DEF_MAX_XFER;
+    container->dirty_pgsizes = TARGET_PAGE_SIZE;
+
+    QLIST_INIT(&container->group_list);
+    QLIST_INSERT_HEAD(&space->containers, container, next);
+
+    group->container = container;
+    QLIST_INSERT_HEAD(&container->group_list, group, container_next);
+
+    container->listener = vfio_memory_listener;
+    memory_listener_register(&container->listener, container->space->as);
+    container->initialized = true;
+}
+
+#endif /* CONFIG_VFIO_USER */
+
+
 static void vfio_disconnect_container(VFIOGroup *group)
 {
     VFIOContainer *container = group->container;
@@ -2258,6 +2315,54 @@ static void vfio_disconnect_container(VFIOGroup *group)
     }
 }
 
+
+#ifdef CONFIG_VFIO_USER
+
+void vfio_disconnect_proxy(VFIOGroup *group)
+{
+    VFIOContainer *container = group->container;
+    VFIOAddressSpace *space = container->space;
+    VFIOGuestIOMMU *giommu, *tmp;
+    VFIOHostDMAWindow *hostwin, *next;
+
+    /*
+     * try to mirror vfio_disconnect_container()
+     * as much as possible, knowing each device
+     * is in one group and one container
+     */
+
+    QLIST_REMOVE(group, container_next);
+    group->container = NULL;
+
+    /*
+     * Explicitly release the listener first before unset container,
+     * since unset may destroy the backend container if it's the last
+     * group.
+     */
+    memory_listener_unregister(&container->listener);
+
+    QLIST_REMOVE(container, next);
+
+    QLIST_FOREACH_SAFE(giommu, &container->giommu_list, giommu_next, tmp) {
+        memory_region_unregister_iommu_notifier(
+            MEMORY_REGION(giommu->iommu), &giommu->n);
+        QLIST_REMOVE(giommu, giommu_next);
+        g_free(giommu);
+    }
+
+    QLIST_FOREACH_SAFE(hostwin, &container->hostwin_list, hostwin_next,
+                       next) {
+        QLIST_REMOVE(hostwin, hostwin_next);
+        g_free(hostwin);
+    }
+
+    g_free(container);
+    vfio_put_address_space(space);
+}
+
+#endif /* CONFIG_VFIO_USER */
+
+
 VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
 {
     VFIOGroup *group;
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index e918f8d..1fc79ef 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3456,6 +3456,7 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     VFIODevice *vbasedev = &vdev->vbasedev;
     SocketAddress addr;
     VFIOProxy *proxy;
+    VFIOGroup *group = NULL;
     struct vfio_device_info info;
     int ret;
     Error *err = NULL;
@@ -3502,6 +3503,19 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     vbasedev->ops = &vfio_user_pci_ops;
     vbasedev->io_ops = &vfio_dev_io_sock;
 
+    /*
+     * each device gets its own group and container
+     * make them unrelated to any host IOMMU groupings
+     */
+    group = g_malloc0(sizeof(*group));
+    group->fd = -1;
+    group->groupid = -1;
+    QLIST_INIT(&group->device_list);
+    QLIST_INSERT_HEAD(&group->device_list, vbasedev, next);
+    vbasedev->group = group;
+
+    vfio_connect_proxy(proxy, group, pci_device_iommu_address_space(pdev));
+
     ret = VDEV_GET_INFO(vbasedev, &info);
     if (ret) {
         error_setg_errno(errp, -ret, "get info failure");
@@ -3564,6 +3578,10 @@ out_teardown:
     vfio_teardown_msi(vdev);
     vfio_bars_exit(vdev);
 error:
+    if (group != NULL) {
+        vfio_disconnect_proxy(group);
+        g_free(group);
+    }
     vfio_user_disconnect(proxy);
     error_prepend(errp, VFIO_MSG_PREFIX, vdev->vbasedev.name);
 }
@@ -3572,6 +3590,13 @@ static void vfio_user_instance_finalize(Object *obj)
 {
     VFIOPCIDevice *vdev = VFIO_PCI_BASE(obj);
     VFIODevice *vbasedev = &vdev->vbasedev;
+    VFIOGroup *group = vbasedev->group;
+
+    if (group != NULL) {
+        vfio_disconnect_proxy(group);
+        g_free(group);
+        vbasedev->group = NULL;
+    }
 
     vfio_put_device(vdev);
 
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 99425ef..9e71cdb 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -1250,3 +1250,6 @@ VFIODevIO vfio_dev_io_sock = {
     .region_write = vfio_user_io_region_write,
 };
 
+
+VFIOContIO vfio_cont_io_sock = {
+};
-- 
1.8.3.1


