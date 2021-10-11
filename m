Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2082B428675
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 07:51:12 +0200 (CEST)
Received: from localhost ([::1]:36246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZoDP-0005Cr-4N
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 01:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mZnup-0002r3-6Q
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 01:31:59 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:26228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mZnun-0005Wg-5M
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 01:31:58 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19B2iKPd029460; 
 Mon, 11 Oct 2021 05:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=dd8na7IhWc/yX/0zz8Gc6mTz46vVrNbWL5FmNhuZE68=;
 b=H5D5iG7j/BRVVMJLEUIRqp7xuojA7rPprwxffoTAcBOwb3EGTDeAFDNQYEpYtKWizpbh
 B9AB7b8sSXkzUtv+YfNshoGiZeWUR0i6x4MUy1hKbbpP0/iKDpilEEIBDi32VTiNMuq+
 ZyzKgnBwhaqbsM4Gr/xaNVZ73lKWb0njrajePpczCG+Zg4NFRBru+bh7cc+FtphUx+Bf
 rYunQkkPHwdcs1sPmi3KcV5BiltgZLnVoLqr9jSCBrFp7wR1jXJlWPCGugCHpclKdC4u
 TcCFtAfoS//yrJAgUlOXeoJpOhfZ+EFjbXA19Gl3e0DaZ8WEvIk01WLmocgL4zPQ/hg5 qA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bkwxh1v9a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 05:31:52 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19B5V1hi123542;
 Mon, 11 Oct 2021 05:31:51 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2049.outbound.protection.outlook.com [104.47.51.49])
 by userp3020.oracle.com with ESMTP id 3bkyv7ntew-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 05:31:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cRvEhdUF23W+wMh3/gPrYYwZ81hgBmUMzk1SWUDBEmG4FQb8q/6JC/hghw4kO+tEZUkgdViTbUf1kuKThKa2HH2Osevu6WatM2qUMg+rrVUI9dn8Y+FoM/2txDNX/7vPv18V1i3dgrsqvID/vAVJCvQ3JJswABjn/B2vjvJFxFLaKpef1C8X8/quVC4ZS4OpTrcphC6T/UwluIqsk+/ogRRuI9dr4/k1QDTQ83DfndVHhqpf6oDL6/NlJSBO2HfEc9Eg9RCirwYZX4qUBlWomIxPIwBSnPBsD0VmCEE8I4uiXYGr7yPTwExtxcSQugEodMtISakfsBE1vF7Klfo5lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dd8na7IhWc/yX/0zz8Gc6mTz46vVrNbWL5FmNhuZE68=;
 b=XC5L5ZG4Wb+7qGJee05PhZ20Hi9YtwvavfjTObvvh79y5ILvZXoUvMV5IdL8EaPy3jIySGHNIglDJJMSeacEwKRCPDYmZw0L6qEOweGCyW1temuNYgT0qyEMcA+CQjEJqPm/q3ehWhx5ip2agBOo2v0+N77sLqy1l+0AEWfIa2/ZIzw2R/bZhZQS+fy6lGOLbOtLB7nWIdc/g2ePljAokTtxPsdzznUxf9+dnx6XG7esV2XswsAKtQ6Hw1QRapQ2TXZS5kx21jryl7I8AM8xLzNXgZX+SvE9ucByhlxhPd+nY8i+nX8CjLCOR4yrWTODyS6ulYPpaqNfGkuIolanOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dd8na7IhWc/yX/0zz8Gc6mTz46vVrNbWL5FmNhuZE68=;
 b=y7xQS+k16Jm7QIOe46x+s5eke+jVkz1Rp5sCFPBJfR8iZneyU0Oidx2Sr9p1F0YedqNpc5v75nVPj7MOmF+vaIeU2YMR7rk0UEpraPyA+vCzlEKrUCwhuNPwZ8qBWX5PT/Lab4URRNnYGQwdui0kXkSfghEHnnyoX6HFLTJ3Aug=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3775.namprd10.prod.outlook.com (2603:10b6:208:186::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Mon, 11 Oct
 2021 05:31:49 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::48d7:8ff1:200c:89ca]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::48d7:8ff1:200c:89ca%3]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 05:31:49 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/12] vfio-user: handle PCI BAR accesses
Date: Mon, 11 Oct 2021 01:31:14 -0400
Message-Id: <346c432d523ac9fdf7e645f8193403385610b5f5.1633929457.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1633929457.git.jag.raman@oracle.com>
References: <cover.1633929457.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0072.namprd17.prod.outlook.com
 (2603:10b6:a03:167::49) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
Received: from jaraman-bur-1.us.oracle.com (209.17.40.40) by
 BY5PR17CA0072.namprd17.prod.outlook.com (2603:10b6:a03:167::49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Mon, 11 Oct 2021 05:31:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4f730aa-5732-403a-18bd-08d98c786c6a
X-MS-TrafficTypeDiagnostic: MN2PR10MB3775:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR10MB37757CBA6B903E598978925E90B59@MN2PR10MB3775.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:390;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kdb3rM3kdRzYePNb7Z8zcpSkhP5P+Js5V3pwhbBUBdR/LPGfq8pm66hSVwFP7XhHYyLTNACXpi/6t00GrVna6suA+PhXtgZiAALDR1RXV+0k0AH1RDEFWodehVzJzdZOXZmC81oE/V3GJxEGiuJBtuvQ01qB0FZTSGdys/RC/6ch1BT/nodPJ298mU1ZCF2lZdYFmNCwpY6DZllKVZKFkrqL8Is6jE9hztTcqsSOCix86uDs3g6tvfJw9jvZOXorJ4zbeq7sLzGWssIbGAbvvVeB7v6nL0oK8YwzYDdAk596zhtTnWEjvgaKBfYX3ynAXDwEqWUK6fgnbFkbWwZWzFOan58M+6lFiRPwuk6WltVmh386BmZ05TXO45i4kIXypzuAY2Cobbf7qVWrktKl8QuIVftppb5rjr8igjBl4o+s5d+ecj6hfxAFe3RMemJ6Nw4F7N6lM2bv/vrM3O8hQ7NN7mLK/bT7oOXeBTgcginKuu0j1nfHefEcgBVoLMZvSrwOqRp49suros+IgYF89nfa5tpmc3zzi1XDvRwuOXHjtM9/Jc3Xh23wRBRF4kPPOQdmoslAg0BxKx6Jru0x46pLj30wYHnV6Xq5NozWpZiVZUOt/TFnohb6Zsks7HKSacfNSrwRBsWVHZGskXADcFdQ5x9yn1VV2d17eDyq5yHYd5pulzSUxk4PMH+kPHiJfP0x6ZKTr9MGlxFXyTQPYg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(316002)(8676002)(36756003)(66476007)(956004)(66946007)(6486002)(7416002)(4326008)(2616005)(508600001)(6666004)(5660300002)(8936002)(7696005)(52116002)(6916009)(2906002)(107886003)(186003)(26005)(38100700002)(38350700002)(83380400001)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZKB0aLNUfPNGK60LKwuNg0jPLascVKgihnj7HtofWBcAOZgG6I4/C4Ajnpa/?=
 =?us-ascii?Q?eLteb+3stqfGSD7iHZtWwe6PKWSdTUZH4rVBzZ6MJ+LDAj2tOe1/5MaA3x62?=
 =?us-ascii?Q?nMaep1mtONSlCBfDkoW9uBfdm6SplwJW/t8ljwLDjbvuiyqVBXOXjPPKBX7S?=
 =?us-ascii?Q?6Q/OyAEPJ+He6vTUhNv9XfVzQgMn0gOlr/5JDyAf0d6w7zeV9VAvDGSEyZC2?=
 =?us-ascii?Q?bNoFsGhPnYsLCrQ8pOed+VQ2lEXa+wVOP+hsshHblgXVmtZttVhbi8PgrhpW?=
 =?us-ascii?Q?4aGIni3xgshrvVzibQwcmc5oV6PFLfL3gKqKfegxjXXDHM3FkWd9ZMrPDg/f?=
 =?us-ascii?Q?ojBV1T1lUSpngzCdGuQ5W/Z98LDrUfaemCXQyboRWBqwEP3rm0wbTia/3AvN?=
 =?us-ascii?Q?lC0dg47uqCrxgVdZrqj7JY60yuljyiB4YvdaiBG7SFjwOu/HlVcrxkHth44f?=
 =?us-ascii?Q?7J5B4LUuckCYu58WdaN2+WOfyO8mbrOMQ9W2EplKiAme1lV/sBgc6FuIsIPw?=
 =?us-ascii?Q?Q4xhEGcb+m1CtvHsv9ZT39by32JhIPqKPqjVFJWs8LwbQ+y4ZG3GEEj/S5g9?=
 =?us-ascii?Q?qiTrEuVzR+a+GxvoYKmoCJcw3ADByOMX2+d5sqSDVqIqwg+BepVh0uZcUDVZ?=
 =?us-ascii?Q?o4O5VgGPmDO9+2Cy+7s0lwjZ8Sv5hf6E5rmQ/rEBPqfjHD6NjF9wnkbGNX1J?=
 =?us-ascii?Q?gUR49KQM73AujM2+SLkcnPZZjFDeqYAfDjaXcpS7vVyNEnRH8m49tgU6JI5m?=
 =?us-ascii?Q?PzrAM4twSX6wKqCRBmEWzwDtDZ1MVy34ITit8atUxQ+CdnkxksGn//YxWSOb?=
 =?us-ascii?Q?pnmkIz1GwVY2bwa7SnFd54XDWE6BlVkdZWNqhDng1wc/5VE75qjfwzmIKAE5?=
 =?us-ascii?Q?RJSzHXqhD1AwGxMUac3JKsVKq1Ksr29V6rhymeMrg2T5crQE832b9PtaNC/J?=
 =?us-ascii?Q?l4aYZSQOdSJJm7T0E/c49PTMv8u0twPgm1nhRMPRuv2iVtUbbL5Xtqy5Pxkk?=
 =?us-ascii?Q?YjQm2sedZj7ksDwy+ChM0y2itUAo6E+47YdgIKWsj4NTFf2H8GGEkJAv27kc?=
 =?us-ascii?Q?PsByproUfTzHYrH1NgHXJo7H8YhjovV3oil0arrWa+DvOcOg3T4rxUA5GUyc?=
 =?us-ascii?Q?Uib0TDH1t3ags4g3jv+L06M26fA+ZdcGmSmUs5p7ff/qLONyKtyFv3Gd8fcb?=
 =?us-ascii?Q?YxUyK4OeIRB+Q81GQ8uVf6b4Ll6LcuvMyR6VH57YXVhkfXxe7JklArX9MEIU?=
 =?us-ascii?Q?4hiOPWJocKM00U7aVk7VnDwjUlt3IdGV8pg+48pD1Ni452VNa0c5tZtXui4s?=
 =?us-ascii?Q?t41al0cRi+5923T84S/4PVWe?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4f730aa-5732-403a-18bd-08d98c786c6a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 05:31:49.4731 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xyGBdN7yef2c0E8omXdT9BwHgcnBCHRrISJU7qQHs0942poPdNh/bhXZZELs/Z+SdkWnIpXrIoS/Kwws/hx+fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3775
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10133
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110110032
X-Proofpoint-ORIG-GUID: savH-VLTPTN2flReK51wDw8VJiHR7Xh5
X-Proofpoint-GUID: savH-VLTPTN2flReK51wDw8VJiHR7Xh5
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 jag.raman@oracle.com, swapnil.ingle@nutanix.com, john.levon@nutanix.com,
 philmd@redhat.com, alex.williamson@redhat.com, marcandre.lureau@gmail.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Determine the BARs used by the PCI device and register handlers to
manage the access to the same.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/remote/vfio-user-obj.c | 90 +++++++++++++++++++++++++++++++++++++++
 hw/remote/trace-events    |  3 ++
 2 files changed, 93 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 7233562540..4c9ed1543c 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -237,6 +237,94 @@ static int dma_unregister(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
     return 0;
 }
 
+static ssize_t vfu_object_bar_rw(PCIDevice *pci_dev, hwaddr addr, size_t count,
+                                 char * const buf, const bool is_write,
+                                 bool is_io)
+{
+    AddressSpace *as = NULL;
+    MemTxResult res;
+
+    if (is_io) {
+        as = &address_space_io;
+    } else {
+        as = pci_device_iommu_address_space(pci_dev);
+    }
+
+    trace_vfu_bar_rw_enter(is_write ? "Write" : "Read", (uint64_t)addr);
+
+    res = address_space_rw(as, addr, MEMTXATTRS_UNSPECIFIED, (void *)buf,
+                           (hwaddr)count, is_write);
+    if (res != MEMTX_OK) {
+        warn_report("vfu: failed to %s 0x%"PRIx64"",
+                    is_write ? "write to" : "read from",
+                    addr);
+        return -1;
+    }
+
+    trace_vfu_bar_rw_exit(is_write ? "Write" : "Read", (uint64_t)addr);
+
+    return count;
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
+        hwaddr addr = (hwaddr)(pci_get_bar_addr(pci_dev, BAR_NO) + offset);    \
+        bool is_io = !!(pci_dev->io_regions[BAR_NO].type &                     \
+                        PCI_BASE_ADDRESS_SPACE);                               \
+                                                                               \
+        return vfu_object_bar_rw(pci_dev, addr, count, buf, is_write, is_io);  \
+    }                                                                          \
+
+VFU_OBJECT_BAR_HANDLER(0)
+VFU_OBJECT_BAR_HANDLER(1)
+VFU_OBJECT_BAR_HANDLER(2)
+VFU_OBJECT_BAR_HANDLER(3)
+VFU_OBJECT_BAR_HANDLER(4)
+VFU_OBJECT_BAR_HANDLER(5)
+
+static vfu_region_access_cb_t *vfu_object_bar_handlers[PCI_NUM_REGIONS] = {
+    &vfu_object_bar0_handler,
+    &vfu_object_bar1_handler,
+    &vfu_object_bar2_handler,
+    &vfu_object_bar3_handler,
+    &vfu_object_bar4_handler,
+    &vfu_object_bar5_handler,
+};
+
+/**
+ * vfu_object_register_bars - Identify active BAR regions of pdev and setup
+ *                            callbacks to handle read/write accesses
+ */
+static void vfu_object_register_bars(vfu_ctx_t *vfu_ctx, PCIDevice *pdev)
+{
+    int i;
+
+    for (i = 0; i < PCI_NUM_REGIONS; i++) {
+        if (!pdev->io_regions[i].size) {
+            continue;
+        }
+
+        vfu_setup_region(vfu_ctx, VFU_PCI_DEV_BAR0_REGION_IDX + i,
+                         (size_t)pdev->io_regions[i].size,
+                         vfu_object_bar_handlers[i],
+                         VFU_REGION_FLAG_RW, NULL, 0, -1, 0);
+
+        trace_vfu_bar_register(i, pdev->io_regions[i].addr,
+                               pdev->io_regions[i].size);
+    }
+}
+
 /*
  * vfio-user-server depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -304,6 +392,8 @@ static void vfu_object_machine_done(Notifier *notifier, void *data)
         return;
     }
 
+    vfu_object_register_bars(o->vfu_ctx, o->pci_dev);
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(&error_abort, "vfu: Failed to realize device %s- %s",
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


