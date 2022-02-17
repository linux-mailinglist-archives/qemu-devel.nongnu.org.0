Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B004B9A34
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 08:56:27 +0100 (CET)
Received: from localhost ([::1]:35662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKbeM-0001Zp-Es
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 02:56:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKbY2-0003uV-I9
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:49:54 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:11876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nKbXz-0004SQ-Ql
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:49:54 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21H7nRVt010825; 
 Thu, 17 Feb 2022 07:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=GvB/wwbHwU2lA+N0AQaiAAjf0fveEzuEUDH7LtZic7Q=;
 b=Zq94gPRfZGcrEyZ6JfL1f6Ml2LkX5ujR9MT9oSdW0y8SEkvkX6XfqdXUsKJ6mM0dgYWU
 0sZC8WzfTFrYbXnGD0n0lwlQ5iclvb0KofrVCLzaYD1XETC0/PWqfEVNf0J3E/XsmI0v
 Va9vA8jIIM25VyGcKm0lSFKbkNHRHnGIarmaMirukGx+h/0ILAZL7uENtTX/DlJ3tzGD
 EET4dS0O8mHmfUSCM0gLxU6YJawiEzv5rH/pOd+I/nK/AEt3cJMAbWx6JNd6lDhLUu1M
 cE49H2G7RJcgMH7PTKE4jKuyI9fy2fkghfEZAIIC9CSd+T5/I1phMRhTlmM+a1YQA+Im sg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e8nkdmt3a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 07:49:38 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21H7gD7J030254;
 Thu, 17 Feb 2022 07:49:38 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by aserp3020.oracle.com with ESMTP id 3e8nvtf6c9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 07:49:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jDkWA4wsHyWdCJf8KJRaMmbfy/Um7RIjUH0k1R0F9bT20b9BWGT4ptr6HpddJwiT1jpqC6OFu5tyQzjgwzwosLFVEwfj7DtC9Dqx+3ja1y3Gp9N16cD00fG3NC2aYvH3th+ab5T1oAR0gHb+wfMoFggZ9953FKflUJhoQkoTrRoPpQHRIJAWVUuP2MGSOyBR66FczHXUyiRIup0gei9mW0QD4na7V5p+plemIM4XVfIrjJg8YL6C9/bb/UZgPKC+/deK2G3mqCMScRQTArDQ2FzQIjrFa1q73rH2H2Ply4sls2L8SeJwmNrF13yhcuc8jQ6+h5mRroQ3kJyMGcmSCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvB/wwbHwU2lA+N0AQaiAAjf0fveEzuEUDH7LtZic7Q=;
 b=IUP3bG61rE1Eo+TUecV1iVXy90NBN7hFou4zpUr89YhibxbAaHCH0OHLdgG2plyerUiXxpPFUyYUHwOcUeMhIqUbQuWlCokgCi0XsKjdhoky8kGc8ce71cZgiFGnHuw7C0f7vSiykD+fIN0fgtJ+HcNbqCx39G/rkLkAiOxfxs53Kbck2QktgGRii2d8kFVHYs6SaPJYV0bcekv++64gfkMe3z04Miby90Tj9GDVBWFVli/xupxKfNcqd8lpL+HmvZJJ8XM9c/Tvg19x2obV6A6wLMsTwtzLPKqdDL9mnXizP+bFPEjsojpcbXNJ2xLqtzIqnfe+fKMYbFPCxNhjIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvB/wwbHwU2lA+N0AQaiAAjf0fveEzuEUDH7LtZic7Q=;
 b=SbPXzbD6MBiRFQiHWM68AaYQ8TlPxYIhaq2kspvi00GhUTSa4Q3zzUYZmyyyPjpeRTwrbdkcUUZQVfvUlfAB9u/2KFoyopnfFRMZilwtQJuLY7q8AdaSVSVVLhC3bG/TJhvEy8MaIOVkVTcjZQxKcfr+34b+9SA26pwK1L7OfXY=
Received: from CH2PR10MB4008.namprd10.prod.outlook.com (2603:10b6:610:c::22)
 by DM6PR10MB3211.namprd10.prod.outlook.com (2603:10b6:5:1a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.17; Thu, 17 Feb
 2022 07:49:36 +0000
Received: from CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe]) by CH2PR10MB4008.namprd10.prod.outlook.com
 ([fe80::8062:cb07:e437:1bfe%6]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 07:49:36 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 11/19] vfio-user: handle PCI config space accesses
Date: Thu, 17 Feb 2022 02:48:58 -0500
Message-Id: <435dad76ebf552f1b155c8ebb2becdefdb9edd10.1645079934.git.jag.raman@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0003f3ce-8e6f-4ff5-c2d1-08d9f1ea0b04
X-MS-TrafficTypeDiagnostic: DM6PR10MB3211:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB321162FC8AA5BF6DF1B0108B90369@DM6PR10MB3211.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:409;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ECwZTuGBJy/D9pCvI9Ojw6W+wDPZM2UdhVHn3T1ILcGV30AIgv6DtGw3Id3gws6P93BXz1EuF5zsLLc6ay18QgiALBTH82Kjvok4pDsJzMY4axms8TQS3lpmzgL5ueVs3juAqhlFVCYaNklbNNiE0/RNfU8oilp6/ydqcutripDZxlvZMDixMBD52eBl0RF0IAriS/aJk0odrAogbSmUZo5R682Hjm4WGI49Y8CErUx2/v9CI5YUaRVo4l8zemRtQPDXx3q+4r8weggzzP9AHi6+tM0zIfykBEztXEYo8tUAcLNnxk+p/6nfuaewNc/OW3UYpczM5Hqy6FaUkzKUdo0gLdCpUwRBgBe4o+0KSG59jgqYGdYwObRLxIplaGl6MU0rHWLHIZzOYyLVLpycEK01l6n25u2qcOJqnDz0MWdPwAvc0RflUeCDGzHmgoVXynW6D3DL5WXgQhQYjaiu5vHgLxI6u8JyIorEHaINeQ66D4vd/lpvfMZ8nsaa9plJe9AauFC89e3CXaK5/+MEA9Wu4Ltr3KXwe9I+Dj/ab7fpq9cYzKUYthHiyt3v3EjSypt0LseEWITSuc4vq/93g2rKVqyF/nB8BOfN7zCdMuaXY2hbBAvmuAmPL0wFUYm1mP7ll1JNrvC/nMOOGx58Mkjy/Bdf3vUpPWGb4o2RmZlIh7YpDUb/7IHrv6U+8V/wkO+7fIw6ksEZj8mhEEEZ1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR10MB4008.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(186003)(66946007)(38350700002)(7416002)(4326008)(107886003)(26005)(66556008)(6916009)(8676002)(5660300002)(2616005)(8936002)(86362001)(38100700002)(66476007)(36756003)(316002)(508600001)(52116002)(6512007)(6506007)(2906002)(6666004)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PQYfq51VvN2XAqfI2ImztdyddXt0o0mlQczWnwYx3NN9TAfiQx50JKHCMreo?=
 =?us-ascii?Q?/EgyVavucsph0zGYGXBKwJdzau+5MP1qq2xPi0vbsaS4JnzCKhgLR+cd0VU8?=
 =?us-ascii?Q?EbMPQvG5b/pQYeRujqzj0Gq1SbFIWQoBxIVdVG1SB91iWe3W+vfMSe2iUdId?=
 =?us-ascii?Q?/eJlZXI4AWdZf7JMpxkeepiDH6lxDi5rYxQ1i822Mbr4tsFu9QRrlcaecLv0?=
 =?us-ascii?Q?oMjTvUBf5uB+cKLvTd2Es7jsz6CzQJi93EDTPuW3l2tukgk6ZJm8jcbheg3h?=
 =?us-ascii?Q?dVjk++dOOzOfQSv8v6PwnSRZ8nHinb8Am5lDhmO49E2TxtebsQsFgeSACTg+?=
 =?us-ascii?Q?Rp41HKC9i5q7FoA17yPH4B42DGiFn6qAO8shZAlAPUBG/lVyx4S8RI9+ZtiK?=
 =?us-ascii?Q?hZLyqsRjAOp/3XK0gbtKSeq00cG4LKNW0IEs41v7Y9E7MgrHCYgtwSaCBwqx?=
 =?us-ascii?Q?lkJQbiX79yzIzdKgiKVf7z6Osl4R/psXph6+pLy4Dp123xQI/9EUnHQiA55X?=
 =?us-ascii?Q?kSEAg5phOByQOnkRKi3qUnBUFWkYh+LskYm2XoMJq2f8e0fpCcxnPndCwp49?=
 =?us-ascii?Q?eBYEZvmgRdcwWY+lzvV0c88lnj5Fftq/C2HMEczz7ryLAY+09GrXMxPwlJVs?=
 =?us-ascii?Q?E1JUWGvTH0YB4K9na8j3ItsC47ilGZ87hfPCsyHIbRgNveTV29zJFYhCqyJn?=
 =?us-ascii?Q?S55jNONeFQjMUSOyRSWBgZjQB7kFamNYED+JUsr3vSsUJolqakpM1giEdM5L?=
 =?us-ascii?Q?EtElVCoBI03XbPwDARmCbutyn+OSgD9g6mpakDe4To8+5jnhTnC415cezpn0?=
 =?us-ascii?Q?N1R+yxBR/7eVLOIBQ4z+TUsAekPJr/xU17gCYyQmtncKxzm0EpFIiC2U15Y+?=
 =?us-ascii?Q?V75mjq1wRpUSLDMhtkIV2cR/Q1L771A26r08jiaeWsbleMZxp3lvsnVYQx39?=
 =?us-ascii?Q?1qwRzZpTy3fuCDsWOxtt8Q1aKpr+q4ODL9Dn/Zhfrwl5gKK+cL/86yZKuaRk?=
 =?us-ascii?Q?RCNpVgWDrn1Q3FpC0/8t3dTYy4Sw/z7jN4rYzWjqR8ptJhxT3ARqTswGZYwL?=
 =?us-ascii?Q?J4ijS6AYkLUYQry/vrj36oFjvjRgNnkfeuNnVUukB53xRdWLQjzz31pqGEON?=
 =?us-ascii?Q?2P0s9mn2YbLd25ixzkl/7ua2Kigi4+RxMDn9WpKQ8auwuAtq5pAPkDnsKDnE?=
 =?us-ascii?Q?yUGRd7IgtJIjGsxrYSQDlriCTaGdqv+6F0xRxNBt5IyB1lgOjs9ACJOAI2YU?=
 =?us-ascii?Q?KwtK7ZhlY3YfasildpPYY3grRzKWZ0hIwzK/8L67YqIsxpzE5AOsX5F5uCi4?=
 =?us-ascii?Q?4srBxChL2J/mU8E9vXEoqZPNJPtFPKfpEIYxOYCSQVpqkjLlW5u5K2k7gGpN?=
 =?us-ascii?Q?9RdZ4bWPJPTBFMxC57z/Daex7EdWi5g1mkBy7t8qQVLCuye+gHC7ySc9+mm1?=
 =?us-ascii?Q?8NvQ0szu/jMZX1ZrtysocRuWaL6qSAJN8WEA+bnkFPD1zPTqJ63sTPOj/bFU?=
 =?us-ascii?Q?4j2hrDoCfPiuZjUPMLuDJIh7blLtQhubHUzdjIRpB5elcVF4pmehrLrTEJnq?=
 =?us-ascii?Q?qa4j1+W7e7lNgcAMKJ5ZghFYsH8c6Vx/HB3+lssBTXmQFNlDnLNLilKxyGmh?=
 =?us-ascii?Q?jrJ1+XVE9PcRjBFRC+6bwRQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0003f3ce-8e6f-4ff5-c2d1-08d9f1ea0b04
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4008.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 07:49:36.0544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J6UFvl/zXKSbif09dUn9Hx6xRpGuZRr9H/bo5TyUtRoGdmHjiH7VY+YGQcKHITY+BSfsRLM/PuJ4IyjDg2y2qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3211
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10260
 signatures=675971
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202170034
X-Proofpoint-ORIG-GUID: IWdVSy-MCxmNeVsgpsc6xUibAc6MG2lz
X-Proofpoint-GUID: IWdVSy-MCxmNeVsgpsc6xUibAc6MG2lz
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

Define and register handlers for PCI config space accesses

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/remote/vfio-user-obj.c | 45 +++++++++++++++++++++++++++++++++++++++
 hw/remote/trace-events    |  2 ++
 2 files changed, 47 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 384ec4612d..4c4280d603 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -47,6 +47,7 @@
 #include "qapi/qapi-events-misc.h"
 #include "qemu/notify.h"
 #include "qemu/thread.h"
+#include "qemu/main-loop.h"
 #include "sysemu/sysemu.h"
 #include "libvfio-user.h"
 #include "hw/qdev-core.h"
@@ -217,6 +218,39 @@ retry_attach:
     qemu_set_fd_handler(o->vfu_poll_fd, vfu_object_ctx_run, NULL, o);
 }
 
+static ssize_t vfu_object_cfg_access(vfu_ctx_t *vfu_ctx, char * const buf,
+                                     size_t count, loff_t offset,
+                                     const bool is_write)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    uint32_t pci_access_width = sizeof(uint32_t);
+    size_t bytes = count;
+    uint32_t val = 0;
+    char *ptr = buf;
+    int len;
+
+    while (bytes > 0) {
+        len = (bytes > pci_access_width) ? pci_access_width : bytes;
+        if (is_write) {
+            memcpy(&val, ptr, len);
+            pci_host_config_write_common(o->pci_dev, offset,
+                                         pci_config_size(o->pci_dev),
+                                         val, len);
+            trace_vfu_cfg_write(offset, val);
+        } else {
+            val = pci_host_config_read_common(o->pci_dev, offset,
+                                              pci_config_size(o->pci_dev), len);
+            memcpy(ptr, &val, len);
+            trace_vfu_cfg_read(offset, val);
+        }
+        offset += len;
+        ptr += len;
+        bytes -= len;
+    }
+
+    return count;
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -293,6 +327,17 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
                TYPE_VFU_OBJECT, o->device);
     qdev_add_unplug_blocker(DEVICE(o->pci_dev), o->unplug_blocker);
 
+    ret = vfu_setup_region(o->vfu_ctx, VFU_PCI_DEV_CFG_REGION_IDX,
+                           pci_config_size(o->pci_dev), &vfu_object_cfg_access,
+                           VFU_REGION_FLAG_RW | VFU_REGION_FLAG_ALWAYS_CB,
+                           NULL, 0, -1, 0);
+    if (ret < 0) {
+        error_setg(errp,
+                   "vfu: Failed to setup config space handlers for %s- %s",
+                   o->device, strerror(errno));
+        goto fail;
+    }
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(errp, "vfu: Failed to realize device %s- %s",
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index 7da12f0d96..2ef7884346 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -5,3 +5,5 @@ mpqemu_recv_io_error(int cmd, int size, int nfds) "failed to receive %d size %d,
 
 # vfio-user-obj.c
 vfu_prop(const char *prop, const char *val) "vfu: setting %s as %s"
+vfu_cfg_read(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u -> 0x%x"
+vfu_cfg_write(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u <- 0x%x"
-- 
2.20.1


