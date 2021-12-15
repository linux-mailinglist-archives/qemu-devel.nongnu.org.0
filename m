Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B22CA475C4F
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 16:54:24 +0100 (CET)
Received: from localhost ([::1]:52008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxWbn-0007k0-Pq
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 10:54:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mxWKF-0005WJ-Lo
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:36:15 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:15518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mxWKD-0008U2-DI
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:36:15 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFERbsh005943; 
 Wed, 15 Dec 2021 15:36:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=ojOIe1ACRQP2iGqwMnpl0nt+/HigPHu+fBoaIJ9Ag94=;
 b=fUrweJOf8K2E+fgKZIKjJXW7b4vRV2B0kWhmTfgfiTZ3K41I9cHu/3x2sA2K7K7iX1y0
 Lv4O51ri8Grs1jGetlmg81o+vn/YBPL/RZbdmMnqEUbUl+yEmVy1W8oUYJWtXhx12EGR
 tyl4r4Xu2J7HH6uWaHm4kotyKmilqOb05pPn2YyhOY125ryLyV37dGL69J1f1aC2FCeP
 zsYEFjWBSiZ/zujtYGC8eq9cCiYcP30DDR7aUu2df5NutfQgozYQcjnB1zfWXGX6JTI4
 ZvcVOXWhQ+/QGZvVTUVw4GwUGnRNJFYKNPbaOBVuLMbiZ2JxniMtbFgS7YkSEInpKUeq wQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cx56u6ufn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:36:09 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BFFU8bw165468;
 Wed, 15 Dec 2021 15:36:08 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
 by aserp3030.oracle.com with ESMTP id 3cyju8gsfw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:36:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RRKGhvMz69ofw4FfZnBbBDO8MTg9EAAa2T12byPjY24Rlkz0xE8W4rjSnggdzw1/b7fetCVqqkWfJL6Ou/bB+h7oLEBOrtKOtxaHceTS621xsdA7g/Kg3YXnCQWuNIVYApHM2BEWg10+BbprfrnY1FnkS7ki9zxHW3EjJHrXTLzNP7P15qr8kiv289kUMMqSWxXlmACJSdqIYWnlgAZGt+gBhu1BO4Yz96EXqwZYe9zrBGW8gQox9ognTRfxpVJfFWZ343/J9rQnu6WFg2fbnU+YB4v7W86NeWEDc4xDv3kocIjSDMTGDMAqt5qYRCeA54keaK174itDYVEVlIyJEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ojOIe1ACRQP2iGqwMnpl0nt+/HigPHu+fBoaIJ9Ag94=;
 b=DSxNCx2IvWRsIzFtSdWQhSmmUUSCEgGrRJdE4jhqdz53NHtiN26b6AxUy3ML20gLYO2coSO+xv7+WBA8s2sk6YRaq/OV3jSgzHalTv781GUsuDpvgzbr8hSFpJw6aoqZrZG6DDnG6/1T4BuuGflafuMGWhNkSjfhJja9GMUPakdLfgr+0izwz3QHmR9qzNPo1DWGCmwuacNzd6H2tuSHLEbrFw5aIm6fIcihLM49v6Ahm1hREUP0F3+o/IqYtfQ3XoTh/4WneQdB60iMvNi3eWsTMZtx4pyh4RsifBaHc0VWE0hTaj/udXUzqCmWPwyxkB26f4voHHmztxB0B2XCsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ojOIe1ACRQP2iGqwMnpl0nt+/HigPHu+fBoaIJ9Ag94=;
 b=zUmR3OqB8Vv2l2ORtLY6D2sUEr5faOXzqczyGI9UiRjW5v8C5jOhMWPxBkP8ATDWeA18k2F6gfekXXPvdov0cVtjvNq5T10+cf6ykBLMbqgaE4tTq6nHdkZ1IwfPnOcnECSrcCL70enCp6ULbtRpiS2rG8CyHumS+Y4iJXAOHEI=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BLAPR10MB5282.namprd10.prod.outlook.com (2603:10b6:208:30e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 15:36:06 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d%5]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 15:36:06 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/14] vfio-user: find and init PCI device
Date: Wed, 15 Dec 2021 10:35:30 -0500
Message-Id: <06d8cd0be786fb6786d42c9251b37094bff813a0.1639549843.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1639549843.git.jag.raman@oracle.com>
References: <cover.1639549843.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0105.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::46) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9e651fe-2cea-48e2-0af9-08d9bfe09be3
X-MS-TrafficTypeDiagnostic: BLAPR10MB5282:EE_
X-Microsoft-Antispam-PRVS: <BLAPR10MB52823BD7D7664A5087B6F4C890769@BLAPR10MB5282.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:119;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 84iDTfi1l5i8+XZ9xlhMbozs8KF5Op6MI8Pj0UQP5Pku8QPN2D1YqBKmwf1OJTSb9GF0nDGarvDqusFRIPbc8YelmF/XUl9n9xCU22Aow4xKb/Z4IWUxOsOHOY3diMhQ3rKwDA973JNV+1xrfNBdlx8jKdiUfz7yYBronULm3NUCkZC8m1gruGm5njae1iKWFbgQnC1mc+qmOfQw7Rd8yr4HhBAQWbjboCThVCVXsxnFXgl0gUCH7VGMM/j0bkhbmKLohE7guRirM2W1DUtWwaAITLbypBZYlggk5+0EomnlF/6A39vUkVog9HtLpZIcKcBurtGUJshg9BpwssYrFdZDWcC15k5G6Ik1f9Csfyu9axXy6sspRa0AJnfj84GUQr5BtEksXnAVliZVknLyLhSz1ia4/Q2LNMwU+9zeZWCfBpkHwKLtE4cpP7SyGb3niEqUUSMPulqi7fMqkpWh91Q23KaF1HPZMYDyv56pWViAj9fYPfwuwMBfqfutwDJwKlUyksUOVvaMjEcOH5b1xJz9qRrsUDbMIBsyfcwKcghtLfEbI2/7fyNwMp9EJjinNMiYbBZ5MCEIm97FhJt6Ns33r6pOBwnVClOGukpdB38+AmvvAJBpBLNHNF9uqP/TPDo/qDuQ2tzYle56v2y1L98a1TyuDUZ4w2F7C6n2SUuIcG17jBiie8MoLXkJXXd+6VZE4J9uWgeJ5qPRVsKH6A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(86362001)(36756003)(316002)(52116002)(6512007)(508600001)(2616005)(6506007)(4326008)(6666004)(6916009)(6486002)(7416002)(107886003)(83380400001)(8676002)(26005)(8936002)(38100700002)(38350700002)(66946007)(5660300002)(66556008)(66476007)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/ndbK3BlbG0EtWgTTTQbzkaUcrPSJgbUoYjVVTCM6PTM9QimYpqIVUq9/VN9?=
 =?us-ascii?Q?F7h5Mh34IEnoCQ9oQ8e+rBfoX8JKndvMm0czbIHL/eoJk6epkZnQHrQa3F7H?=
 =?us-ascii?Q?5H8NtbTkA/Ksqs5lgYnoZU6jIilJSueK4rKuCv9sm010qmtt40LSxlTyQlHR?=
 =?us-ascii?Q?VBtVwHKSXn0gfpEuh+u6tp52SzdeQ1AEY0kGclc1GcK+R5nuC7v6vJkX5V8y?=
 =?us-ascii?Q?qaCBMYrWPeqPuYBSbwQ+fNfHJIym22ehGZsoCedbrFQdnyC6EF7awgA+qLv4?=
 =?us-ascii?Q?DHkDBWe7aFgZ2WaqfepAJ9vNZGqarSkBIBlpK83thZlMAXPSUXyNJrv9zEwS?=
 =?us-ascii?Q?OZBsRt423x7dgPjhGVvc7PZq1iEoXTgIfBHhlr6IE5XR66xH/OsTnM15x8m4?=
 =?us-ascii?Q?EKQfRevxMHEvjzf86GzH4Md/hqMMmaabem0XDtvUmTsDc3ai1fdXBAUma4TL?=
 =?us-ascii?Q?noNWj1aL1xmyiWc53hBcUi/jtzWpxbbieqVORzAFn0jmghSfNBkjJEo0Yu29?=
 =?us-ascii?Q?4mVt65H/AnDN3I17NMO2fP1NNkKwyosmNParCFUxkW9vn6h7NUvK3ez8X2gv?=
 =?us-ascii?Q?bbQPtgXGzm7Mt8yAXnP9+wVsDuwvvfK1FGEkfebF4j6GmhCjNEql8aOOMVAG?=
 =?us-ascii?Q?muGeUgfVqrWNoZaDYs3UojVsZ65y4G8Mc4l1+6WGS34FnbPKtPZbblcJ8tg0?=
 =?us-ascii?Q?CeUXlzDNww+9AftWnaI2Th9efid75jvSYiKXrFPkQ+Mr4GEVucP5Y1M6zEmg?=
 =?us-ascii?Q?dZtTYu/sbZxPg3Rz1/CZArRifVbsS8nWVH+d+3mY9n2vX9gnqAL9YPWXEVdK?=
 =?us-ascii?Q?NEW68IfsT9De842Jx+fVke3dZvb/mPhlAFdfZCJ/GW1tg45joSicRT7cSJkG?=
 =?us-ascii?Q?V8r++8c4JfznVmGRw7uU/SEX75/l5zO3scSmx+y+ZRVlZJbSWFFf0RaJpLt/?=
 =?us-ascii?Q?mmoUnk8SJ/pFjO1zK+83rSR+srwTcBk7b5bATVh5grn0DP8K9BF+kZUUOZIN?=
 =?us-ascii?Q?Hvxb0SwjDHnvExmkpQ3HMTlQgXYBcfl4cwylabrQJAYYL4RQY3OgpGObjvcc?=
 =?us-ascii?Q?UeEMUTI/Q2/wPglQTguUq3HKr2tRaoPgcbUsdpdzP0awgyVXltg23TNRnQQy?=
 =?us-ascii?Q?XfV2NyhaPw221P7rXSPifvvsKBoPlL9GVNdBoA4zXiPNkqJCAAaV/jdckMMT?=
 =?us-ascii?Q?63P7ojXES/AnV5r5QPbMekeHOkz0NRbGPsLTqq853giGMAWhlcCnjFcX667T?=
 =?us-ascii?Q?+rFXwlWLk5R8gSyH73An9ak5V2ijppTy5kXP1wI7eQ7I4eJkTVlAYcqkr3He?=
 =?us-ascii?Q?SsIYPeaFYiwzA1cBpZlPIA8bGZZkOY+euGkBc3Q/mKL8lTGVZwAhWsJarMNI?=
 =?us-ascii?Q?WUCKxTM7ixrqyutRcI0Ez0C8RuI7TtViJKRKe75q5IiX9RurRhhLPJCmInbK?=
 =?us-ascii?Q?4ym/DXgnJwlQI9HQsDxTVlk/xXuz7hlqsMLPdnRnFT/xqA2r7Xy8YJkqAv8h?=
 =?us-ascii?Q?40WMALrRPdj/iR7HhUNcKIMSsjys1SCH511sDV4cp//fI6p44F3wr0/MgPVq?=
 =?us-ascii?Q?DBw8tBaWtQ8ox0vfiUV6rbLkqppyqiIHW+Z2EGuMWAiDxBIEIY7eu/nkJVDZ?=
 =?us-ascii?Q?xX2+rBnKEOXi6F1be0iWFyE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e651fe-2cea-48e2-0af9-08d9bfe09be3
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 15:36:06.0125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Ab3IWb1iZeGviz282XG4Bl4lJmAWVU2fGYUps2hyejwC4SRQQKVdewcTGQ14fwMxlmh+6nmlAm/Hd0ljGwgFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5282
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10198
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 spamscore=0 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150088
X-Proofpoint-ORIG-GUID: 7b_Cc1-4Gwle-140qYnu213__DXteqc9
X-Proofpoint-GUID: 7b_Cc1-4Gwle-140qYnu213__DXteqc9
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 jag.raman@oracle.com, bleal@redhat.com, swapnil.ingle@nutanix.com,
 john.levon@nutanix.com, philmd@redhat.com, wainersm@redhat.com,
 alex.williamson@redhat.com, thanos.makatos@nutanix.com,
 marcandre.lureau@gmail.com, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Find the PCI device with specified id. Initialize the device context
with the QEMU PCI device

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/remote/vfio-user-obj.c | 41 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index f439b81787..bcbea59bf1 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -44,6 +44,8 @@
 #include "qemu/notify.h"
 #include "sysemu/sysemu.h"
 #include "libvfio-user.h"
+#include "hw/qdev-core.h"
+#include "hw/pci/pci.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -69,6 +71,8 @@ struct VfuObject {
     Notifier machine_done;
 
     vfu_ctx_t *vfu_ctx;
+
+    PCIDevice *pci_dev;
 };
 
 static void vfu_object_init_ctx(VfuObject *o, Error **errp);
@@ -133,6 +137,9 @@ static void vfu_object_machine_done(Notifier *notifier, void *data)
 static void vfu_object_init_ctx(VfuObject *o, Error **errp)
 {
     ERRP_GUARD();
+    DeviceState *dev = NULL;
+    vfu_pci_type_t pci_type = VFU_PCI_TYPE_CONVENTIONAL;
+    int ret;
 
     if (o->vfu_ctx || !o->socket || !o->device ||
             !phase_check(PHASE_MACHINE_READY)) {
@@ -150,6 +157,38 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         error_setg(errp, "vfu: Failed to create context - %s", strerror(errno));
         return;
     }
+
+    dev = qdev_find_recursive(sysbus_get_default(), o->device);
+    if (dev == NULL) {
+        error_setg(errp, "vfu: Device %s not found", o->device);
+        goto fail;
+    }
+
+    if (!object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        error_setg(errp, "vfu: %s not a PCI device", o->device);
+        goto fail;
+    }
+
+    o->pci_dev = PCI_DEVICE(dev);
+
+    if (pci_is_express(o->pci_dev)) {
+        pci_type = VFU_PCI_TYPE_EXPRESS;
+    }
+
+    ret = vfu_pci_init(o->vfu_ctx, pci_type, PCI_HEADER_TYPE_NORMAL, 0);
+    if (ret < 0) {
+        error_setg(errp,
+                   "vfu: Failed to attach PCI device %s to context - %s",
+                   o->device, strerror(errno));
+        goto fail;
+    }
+
+    return;
+
+fail:
+    vfu_destroy_ctx(o->vfu_ctx);
+    o->vfu_ctx = NULL;
+    o->pci_dev = NULL;
 }
 
 static void vfu_object_init(Object *obj)
@@ -190,6 +229,8 @@ static void vfu_object_finalize(Object *obj)
 
     o->device = NULL;
 
+    o->pci_dev = NULL;
+
     if (!k->nr_devs && !k->daemon) {
         qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
     }
-- 
2.20.1


