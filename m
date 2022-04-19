Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 813B2507BDF
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 23:23:36 +0200 (CEST)
Received: from localhost ([::1]:44580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngvJv-0008I9-5q
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 17:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ngvIl-0007b4-3T
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 17:22:23 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:31414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ngvIh-0000Dv-Eb
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 17:22:22 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23JKc8fd019753; 
 Tue, 19 Apr 2022 20:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=kRf7+WxtOwU3kfUY0jVueoHBR59qT4ytR5JsWs/AK2k=;
 b=gJqFRnn8OB2VhF/YcyU9lSR8w/ioQ5sSVGiXrXARYc7+TkH392LkFcsjzAwuNkyXwqCd
 M3PAaGye4SdN36XjJ4XJX+HmnKSC0A15icwItKPuQPxnqEvKv28hSsSGbOOOqBUdUMCZ
 KhsA0YFVpAozANVFxP2WTSQ+QxddmG/p9fFA+x6lUbHWA9R2FV3cb3awvLMPw3xQMLjw
 EynTtTcaJFAQoYXXv0dJAjB0BOvge8mKGxABhnKiQ8VuJ/6k4Z4R7CGf/7bVtkeujyVK
 4itY33rwe2A7Es5LS0qbrqqu3AGQyT0mZtr970XN3+qetUDrgcZ+uHl/5NZzyy/9RBRc 8A== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ffmd1793n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 20:45:07 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23JKajjP020028; Tue, 19 Apr 2022 20:45:04 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3ffm892mwp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 20:45:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mxwxh3aAdldmws+tqRjhX9TrsE9PfvIFz+VRRZwi2tp7yMJ5OiydC5CCJoj5xUD5ltvuNqtf5UDqOBRtOu8Kot7oxYaZVtmjx9I/Eex13pLuqaK94suldu+CH4cOtAKvAp1HRw9Tc+TlGgagbrkxvNqMqZJlSXH8GbYSAoq60X+0PbWSL++wTC8LUFP+u2ybbueqVU8Kr1gh6t06D9o0bb6VH+ch8lRUn1qL1KLlgxemIARd8QcO+3JTLnMLI1HN0pvLTA+EZJKcrd+3EjlhECTMTR93otw6J+Mt0MbMhXB2zFOhFHLFWgoxl0Cw5RxRI12Im6zkImcS0AZG6lW/7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRf7+WxtOwU3kfUY0jVueoHBR59qT4ytR5JsWs/AK2k=;
 b=nklpDpKr2gZMnMvfbx1TM7qpeON3hPnRj0q+oZeQy1ZlLbsD71/2eheugmW/z3jYg4u7QZbxkygI8w2hF9DztPM/E7CgaeCgcTXyT4oT6JY8TmPPjaBXbEnJMPt9syxMlL+m9NSki6vVQHE5u/DXOSEBzi+68uy8a5f8HwyWWTRFLN53FX4gX4PZ+OKgC3ZcTJGQ+4P1fQTDrtaXGYAOYo//BOSb3ioKZ3wvo6ypYRpyN06QgjMxnkjx/WskQbwdBcpKeAQX5RudjZ28Js+r2XdY+GaWGDNV/AlZFRFI7ZADevFkgV6bhiYQAjUbIr4BRKrQdTxk7EzUWBTf0/+4Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRf7+WxtOwU3kfUY0jVueoHBR59qT4ytR5JsWs/AK2k=;
 b=fwsB68kIma+0dscBaZ1fHA+3X3aY/L+R4gQIWF9LnBWkSjVuXoGtbOdZ//kJTXsNaed9GKRWr5Ye4H6CkGY0GVVW/fLqIwrVykzpYOx7ZdsjVh9ahkADhzOcL0QTpXR6i6fkraUZoztVuwJB3Z+xZyOql9fL5gyynADwkdbqcH8=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by DM6PR10MB3290.namprd10.prod.outlook.com (2603:10b6:5:1aa::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 20:45:02 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e104:96ca:aa5c:2bac]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e104:96ca:aa5c:2bac%4]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 20:45:02 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 08/17] vfio-user: instantiate vfio-user context
Date: Tue, 19 Apr 2022 16:44:13 -0400
Message-Id: <02b9ca4c303149a9bd74df1ba9d93e95e1682f48.1650379269.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1650379269.git.jag.raman@oracle.com>
References: <cover.1650379269.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:a03:40::42) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51eb6ae3-5278-4084-969d-08da224579fc
X-MS-TrafficTypeDiagnostic: DM6PR10MB3290:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB3290B2E6FD19754A8892488E90F29@DM6PR10MB3290.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g/+maU1fB01mXVjwIiWA3ESwmeN2ExoYui/JMWq4Y/LjIIvTlf65EQkwbq72PvrYZ9iCAX/RVskEXWiiJGZ/LRYphyZ0lv/SYKtZEhKGUwYzjZ6wScuuAs7x2VXEzMfH4wZV0KFPD75NRf8eFjld0DBjWClHLt8wTV5X3DkNqnoxIrnYDnBCaq1prD6xupAxsxwOp6408HMXQMz8OXnIi6S5FtAvV+Sr8uYQvZ6bHRV7g0mNkscuCClqif51PDkmlE4hSHaRI5wugB7x3VCHptBqAOmWTzx2CekYVk/aaCPBW1eEwp3ZJPiN2opseBw6+JmMB7y9oZ/Awovu5hLsqxQevXEwaz3J5sGIfgrsI1skuTCd5AeVKYHtdVpsONcjzVby+JqLjds2JCz+IQ4ziicQjN5QKI99AOXhRojsNU79FiMZQ37oteoKXY2igqUKQK0OXKxcDWNnu5Q2DjES4uYA4rzfVr0YoMKNFVz69WtBWTGnpS/Xj3k24mCSFPbJY7i1XVDVucJCJtuNm/8CSsU+Msc2/RCX/tPG09o7JeQklTqDdyvN22WpT3njKb1DDoej9D64q3oxEDzwBXWcs0mHSFZ8U06p8qouxDQzxCcz50Io+MeYBSu6IkjMlhN3T+XkP1Bwi6J5gakKTvu/YCnuZXMyrjNiLsYRU2j/QGFQ3gw0rPwcU+TXf3U6YK0g2ozyn5Qq6cqzR0iCSgDgow==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(8936002)(186003)(83380400001)(38100700002)(7416002)(6916009)(2616005)(107886003)(6486002)(36756003)(66946007)(8676002)(66476007)(66556008)(4326008)(52116002)(6512007)(86362001)(508600001)(38350700002)(5660300002)(26005)(316002)(6666004)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P5L57ixAGrPUgRnZ1njJBvhggtzW07HwzIOCPdB89Z5+uXwwpZmA5WQMKzfw?=
 =?us-ascii?Q?TxEQDlxbdNTpQfLNQ2YZqCGd8nYJhZG8XNs7i3PiwZddVAz5uqQun6QWD7Ag?=
 =?us-ascii?Q?xqGMQd+5RcZA3zpHj7SzSvSjFJQHB+RIufDxWSmz2JPr5a+2d79MPkmPPQY9?=
 =?us-ascii?Q?y2ltxAotGog5FOp+DrdOYKnpHD4aoDp9clikVledJrhkgeG5bVRzXAbaRBEl?=
 =?us-ascii?Q?ZO/pTk0ITRxh+MF4zI237cf9sDZXxgaOfSUtvVDaY4UAhFax2i1dXrtfX9+k?=
 =?us-ascii?Q?Df4+MVKATdIVKIPjX7IItPsuot63GhoVaawlmaBthdW8wCwZW5STQtPBw1zh?=
 =?us-ascii?Q?Y9e3owu1YFbJkF5E33AvBMSN2h8cM93Rvu8SENEZwFA67NceHxlO28cX/6dI?=
 =?us-ascii?Q?605LNWPa1WiKprDR6CMJXFklmBqr1iDTHdoVS5QFfAFIfJqFIJAYx1Y2Cr/B?=
 =?us-ascii?Q?lP3USvRTDPhTB6yiKAKAnAIeuI3B6Wbhf7N9o0CCUm25gmKGnqrs9LpsM862?=
 =?us-ascii?Q?PtPb5ktibodqUlvC7I4G3YaqtI9cby/v8vz6kWIMfTJoKXKYxkoD57v8gLli?=
 =?us-ascii?Q?/TmFR0+hqaR+A6ibT1mFghbRUeKQRjMiAoQScf58YXKzDHITx4XNmshFcG6/?=
 =?us-ascii?Q?t8lsHGEJN+IEZJcAD4Vw//WXb7EMMge+t871caa1zUB444FzdR9PM9ZqxM1H?=
 =?us-ascii?Q?6YjrsPxB0yg4pEEqfr+4tmv3E/MfymLXi1uEqW/S3p76IT1M061oiLGupGXh?=
 =?us-ascii?Q?9bY1bo+575OkC8a76GMcE+HQUHHJiwmhl7rjQd7o3xal/i6iBvyaqzkKlOk+?=
 =?us-ascii?Q?ngMlTMjbn/GndQHgMnxchtzuTfp3Csitw4TVHxwb2ApCLP7OiSHnlc7B1pj3?=
 =?us-ascii?Q?p2zMR92gYNq+aG9T4K1cZbs/+XxoRTl/l0P5xA1MYXXSTRTB76LHzjAwasJ7?=
 =?us-ascii?Q?CQe5mJ2lOwll5zg/HFEPNN7FzcGfNmdwNzTohs8kgp8Pd2HfpGtBl5mkJLVu?=
 =?us-ascii?Q?B7eXKOtT7VB3QIdp7cwvaviCC5p8bF/jOdT9A0+on3+Grta5Mipq2kpWy2aw?=
 =?us-ascii?Q?Br6FLkeLnGxQ7OpIvDaU2ju6OQHb67noXQ+7Iv9vNN/CmqQheBdSBpN2i2r1?=
 =?us-ascii?Q?lF98vIXM1juA7MYjCYdcnVNis7mLosEVIlTbcITfpJpG8DDue8eZeCZbx921?=
 =?us-ascii?Q?pRx97ubPZgYI1xPhXLEvKJykZjR0ZuuehU2633v6u1vRxaJqy8TUM0p9darS?=
 =?us-ascii?Q?BgLceYu9TEzR1c3Af2kKBefSHBjm0aZVnaWTe7OYjGFuzwXrJV9TDsVT1Tq2?=
 =?us-ascii?Q?LgtY2wEZNIsIax8Op/e2PhvtzYYPJs+5gYpqnijRkdZH/mHPOHZFPgUTDtv9?=
 =?us-ascii?Q?xdUEds1TVLRZy6VIg/dbkSqzG7QgLA35OpNDJtqSHQZp53cmjIYM4mS+NFfB?=
 =?us-ascii?Q?g7c3czj1B4QoJdSVyPZFgwPGuJlBkIuo9S99f21xb2N0oiTWA/GPm9jhOYpk?=
 =?us-ascii?Q?g9NBXkkcwuXIo7BYAvFyjMzzyN9PNw6ONqdeyn1NxJ54Jn9tMk+gRz7HGfxN?=
 =?us-ascii?Q?HmQnAHixPalZ+kjyHFbrLpZpXadOFLIpx5c0A30uHHU80zPRL4YWCkgoawkQ?=
 =?us-ascii?Q?9UeY171eFfH/skpdkzboPbpZtSryXlG1cf0X0TI3r+ewc1++vobZOO8MkyJT?=
 =?us-ascii?Q?7vQ7A4iiZ4OgB+R62D/JvWiOd1rfEpVfy1q5GYQYtjpwS9f/fWzaCs4oaF/k?=
 =?us-ascii?Q?z0eLdHdlvQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51eb6ae3-5278-4084-969d-08da224579fc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 20:45:02.5562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: erV2b4Yk/EbXnNAEjexduUHuVDdzH1fySSompVCWysTb/c9knN9dM3JOZZlSF8HUgLxWDzWh/noiqElCzjJ7Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3290
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-19_07:2022-04-15,
 2022-04-19 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0
 suspectscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204190115
X-Proofpoint-ORIG-GUID: hcqtsGP2qzBly-zqpfmku7fEjD5p8akH
X-Proofpoint-GUID: hcqtsGP2qzBly-zqpfmku7fEjD5p8akH
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, thuth@redhat.com,
 john.g.johnson@oracle.com, berrange@redhat.com, bleal@redhat.com,
 john.levon@nutanix.com, mst@redhat.com, armbru@redhat.com, quintela@redhat.com,
 f4bug@amsat.org, thanos.makatos@nutanix.com, kanth.ghatraju@oracle.com,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 jag.raman@oracle.com, eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

create a context with the vfio-user library to run a PCI device

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/remote/vfio-user-obj.c | 82 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index c4d59b4d9d..d46acd5b63 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -41,6 +41,9 @@
 #include "hw/remote/machine.h"
 #include "qapi/error.h"
 #include "qapi/qapi-visit-sockets.h"
+#include "qemu/notify.h"
+#include "sysemu/sysemu.h"
+#include "libvfio-user.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -74,8 +77,14 @@ struct VfuObject {
     char *device;
 
     Error *err;
+
+    Notifier machine_done;
+
+    vfu_ctx_t *vfu_ctx;
 };
 
+static void vfu_object_init_ctx(VfuObject *o, Error **errp);
+
 static bool vfu_object_auto_shutdown(void)
 {
     bool auto_shutdown = true;
@@ -108,6 +117,11 @@ static void vfu_object_set_socket(Object *obj, Visitor *v, const char *name,
 {
     VfuObject *o = VFU_OBJECT(obj);
 
+    if (o->vfu_ctx) {
+        error_setg(errp, "vfu: Unable to set socket property - server busy");
+        return;
+    }
+
     qapi_free_SocketAddress(o->socket);
 
     o->socket = NULL;
@@ -123,17 +137,69 @@ static void vfu_object_set_socket(Object *obj, Visitor *v, const char *name,
     }
 
     trace_vfu_prop("socket", o->socket->u.q_unix.path);
+
+    vfu_object_init_ctx(o, errp);
 }
 
 static void vfu_object_set_device(Object *obj, const char *str, Error **errp)
 {
     VfuObject *o = VFU_OBJECT(obj);
 
+    if (o->vfu_ctx) {
+        error_setg(errp, "vfu: Unable to set device property - server busy");
+        return;
+    }
+
     g_free(o->device);
 
     o->device = g_strdup(str);
 
     trace_vfu_prop("device", str);
+
+    vfu_object_init_ctx(o, errp);
+}
+
+/*
+ * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
+ * properties. It also depends on devices instantiated in QEMU. These
+ * dependencies are not available during the instance_init phase of this
+ * object's life-cycle. As such, the server is initialized after the
+ * machine is setup. machine_init_done_notifier notifies TYPE_VFU_OBJECT
+ * when the machine is setup, and the dependencies are available.
+ */
+static void vfu_object_machine_done(Notifier *notifier, void *data)
+{
+    VfuObject *o = container_of(notifier, VfuObject, machine_done);
+    Error *err = NULL;
+
+    vfu_object_init_ctx(o, &err);
+
+    if (err) {
+        error_propagate(&error_abort, err);
+    }
+}
+
+static void vfu_object_init_ctx(VfuObject *o, Error **errp)
+{
+    ERRP_GUARD();
+
+    if (o->vfu_ctx || !o->socket || !o->device ||
+            !phase_check(PHASE_MACHINE_READY)) {
+        return;
+    }
+
+    if (o->err) {
+        error_propagate(errp, o->err);
+        o->err = NULL;
+        return;
+    }
+
+    o->vfu_ctx = vfu_create_ctx(VFU_TRANS_SOCK, o->socket->u.q_unix.path, 0,
+                                o, VFU_DEV_TYPE_PCI);
+    if (o->vfu_ctx == NULL) {
+        error_setg(errp, "vfu: Failed to create context - %s", strerror(errno));
+        return;
+    }
 }
 
 static void vfu_object_init(Object *obj)
@@ -148,6 +214,12 @@ static void vfu_object_init(Object *obj)
                    TYPE_VFU_OBJECT, TYPE_REMOTE_MACHINE);
         return;
     }
+
+    if (!phase_check(PHASE_MACHINE_READY)) {
+        o->machine_done.notify = vfu_object_machine_done;
+        qemu_add_machine_init_done_notifier(&o->machine_done);
+    }
+
 }
 
 static void vfu_object_finalize(Object *obj)
@@ -161,6 +233,11 @@ static void vfu_object_finalize(Object *obj)
 
     o->socket = NULL;
 
+    if (o->vfu_ctx) {
+        vfu_destroy_ctx(o->vfu_ctx);
+        o->vfu_ctx = NULL;
+    }
+
     g_free(o->device);
 
     o->device = NULL;
@@ -168,6 +245,11 @@ static void vfu_object_finalize(Object *obj)
     if (!k->nr_devs && vfu_object_auto_shutdown()) {
         qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
     }
+
+    if (o->machine_done.notify) {
+        qemu_remove_machine_init_done_notifier(&o->machine_done);
+        o->machine_done.notify = NULL;
+    }
 }
 
 static void vfu_object_class_init(ObjectClass *klass, void *data)
-- 
2.20.1


