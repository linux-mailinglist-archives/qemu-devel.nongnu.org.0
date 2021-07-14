Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C873C7AB7
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 02:52:44 +0200 (CEST)
Received: from localhost ([::1]:47738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3T8m-0000iX-0M
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 20:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1m3T4T-0003e9-GB
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 20:48:17 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:37478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1m3T4P-0005Wf-MW
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 20:48:17 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16E0fZG0020511; Wed, 14 Jul 2021 00:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=UIRcz0pvGTUkSkZCcsyk27rw5xMmS/v/s2dXMtmEXco=;
 b=MnsGlmfWwt4s4LZglidZGgYQ04RNj7zsVk/hmN6thtA/tGu7OdkmESDdntfzTei/I8Nx
 kdcu8u1PsgjT/1G6mNVjkD5sYyuwbHjHoNNN9R2/6RALc0nVJ+VUjpOnN/1orIxM/sOQ
 2Y9PV2jIDHBEkVfPS2DJEQGu+F9vrUvdI3orpdV5k6HIMESrg8Ritu8eX9bObHgOLsiV
 hLmNdaB9InY3ZfGMd2i5FJnUPtU/RvbH4f5k/Voe08BSbY8NhjsG35KeYtADJQfML/M9
 p9qgYvDh8HtB2PBK8Ggb1zdO9CF5ucEZoEydy9mznsduwFjgA/qRX55tdx6Vr6e0368s 7w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39rpxrbjvt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jul 2021 00:48:09 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16E0eubm195448;
 Wed, 14 Jul 2021 00:48:08 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2040.outbound.protection.outlook.com [104.47.74.40])
 by userp3020.oracle.com with ESMTP id 39qnb1bb89-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jul 2021 00:48:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=az6OklH7WyAXoquIn5xysW86i49lHK5sTJ+9vwIZAERnddeKPz2+SvAO4vzz9CgF0+B6G38RsOAcQkLMmC1AOtYiVAJ7F0kxD87ApRA1glzY+OdUZjeBn6zqPl4/h+k1uL4fWu9aJoy4oWzw9gEQP1lmvwOkdVJKu2SWdrllogLwRN8HmsnbJwf9fOVG46/ssMJ5kwfjUQj6cgY+NGjK1HZSXeL/4Gz3EgCRXpXzulJ5Bu9GgbLEpsQ1G1ojWUpUOoCOf9YI8sNRlVTAdFK/OPQh5RJz1NqCNd3Ym1Fj8QgIegP4etSwhC30AGn81FIyViQxDWI0RKTGKqHWY91Iiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIRcz0pvGTUkSkZCcsyk27rw5xMmS/v/s2dXMtmEXco=;
 b=FSzk8ysmFrK6QQlA3hXeK2k4zoK8+W/7duIGzlpWdmh2lflvHJYRpbWd1JaSl1paYaMKVexDf+HLqMpgmEID9DzTppQrLYQ+0r35Ci3NylUpW5Rfb0/nPl8ecmU/AfKewtH8bBgC3fQgPdY7+1cN7st+78nWXY/TiNGp7R7smLyEXgBiWL8Kx4TaCLVMHMcv0Xcmxauw9SiNm+leke+D6zDAuT11cjsZwUC0Hph32M8BA6gC8xmp2KezPug1f3IurGGGw+9vPPUl+dj5D3IJc6MSziCOzbYjRo6aZ99jbeuF/LYVtWdDTEmGafzZfIz/ABlE165eppyrVmGYHapjTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIRcz0pvGTUkSkZCcsyk27rw5xMmS/v/s2dXMtmEXco=;
 b=VfUqYKYWbT8drGJ+4CJGqKN91WLyRE1NZHQmcpewlFzoC/zlAG7aQCQwCv0MyzkTFgdNm/+caG7gX3anZYRBHx3j2DZ64VFiIor5Mwp7EZbKW7pU93kX6elYpqGLbEujH7CHgaI4Vz55vwggS5RQjgOvFyxjbKR2+LRRHm2qTGs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by SJ0PR10MB4592.namprd10.prod.outlook.com (2603:10b6:a03:2d8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Wed, 14 Jul
 2021 00:48:06 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::18a:7c1f:bf20:ba6c]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::18a:7c1f:bf20:ba6c%3]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 00:48:06 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] msix/hmp: add interface to dump device specific info
Date: Tue, 13 Jul 2021 17:47:53 -0700
Message-Id: <20210714004754.22243-3-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210714004754.22243-1-dongli.zhang@oracle.com>
References: <20210714004754.22243-1-dongli.zhang@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0042.namprd04.prod.outlook.com
 (2603:10b6:806:120::17) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (138.3.200.16) by
 SN7PR04CA0042.namprd04.prod.outlook.com (2603:10b6:806:120::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21 via Frontend
 Transport; Wed, 14 Jul 2021 00:48:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c256c37c-534b-4885-6f60-08d946610b47
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4592:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4592F6C239DD6F73E9CC5F83F0139@SJ0PR10MB4592.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:183;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X99H0PJvQnpzA10ZuWI3F+qPkm0O5yuXiWGuL7Txs2JpyM6+W8LJlCK0HGQ5V/i0h/qn7y0VEpJHXYuq1Dhs3g+JPCQkIR8eRdc7kkQtfha8F12nPo6a9KdY1tHRwmnLdkT6HHLKzDQJF8S+eF1NNwsYJoc9MyBNP29ywdhOW57GkJhuO4ipu956w0VdpswhS5aj6lZxPhxjAhmdwfD7Mz80OidP6+4Zl+eh+ihoFC76l9BHIaA3Im6PpyvwAwM9UbYsJsglx6bcSlHFqq/51K8oebTEqWPyIQG9x3CrEHFl+yvH3vAJXvtnIMDdLBZ8/Plmp7iIry6I/p0fsx4J04PrODqQkDZ7U0MglMMXoxY7qKk5LcDA5XZqXcC+NBgkGwbFG+KBcMZOniS1FgnN0qpWjKVyDcOUX+Q3rUOP1Ysnn2eI3sSdGpHGBgVjB5/3Ul+sPdS+G/dE4hAFNzcqTCRtHjNsYrfEA7hZCe73rYuUB1oT9WrM29Z/GLt+y08rRKhsy2nZ+7HrggkY9mprhk4wHI9yaiwXBcJsQI1RtGSv1oEyFGIfQz6j9ihN3xbuXeT/lVFFlxPqXnqhJ71Y8S0tsYmtlaZWzhQ8zrnaI5hrBLHwc886UfDZFestsCArD1y/KQQVOvwfQ51c832gkFIg8lcBPxKQaRHLGdbHXrrt1YVmyTuEmSjbJBcHGEZgiMoH2qbq7CsX3d7va5wgJQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(346002)(396003)(136003)(376002)(4326008)(66556008)(2616005)(6916009)(956004)(44832011)(8676002)(86362001)(52116002)(5660300002)(316002)(66946007)(36756003)(66476007)(186003)(8936002)(6666004)(2906002)(26005)(6506007)(38350700002)(38100700002)(1076003)(6512007)(6486002)(478600001)(83380400001)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cyFcUEkGlTlFWHHUK1171aZYCeHQbuljJPEQ9DJXm/RM08jdzWRb7SSKJ4Hq?=
 =?us-ascii?Q?jBiWJn5evsSS7zIiX+PBcR66hzK1af2J7xbWqAs87As+ZCUOfsxToV7FgDCn?=
 =?us-ascii?Q?WizvFzvfsXUtWk97ULHVzHI1Ze1XxpL7Krzbpm6NBjYGaYN4zT5MKSUgBkBu?=
 =?us-ascii?Q?KIFiB/xijjkut6cT8CTnNcPqT/zFGbDxiqKhkNdNh013F9Gkx/o0VJwjQPWt?=
 =?us-ascii?Q?by0/VpOhyYeOANAPXs4QNnT6nrZ/pHEnb8kej/E3v/R2STqO69QA0WbBXDzS?=
 =?us-ascii?Q?DMKHe44TiKcMDEVSJbJ1YN8zEWoBoU/HyAVnzRuSOqU/H8NzsEMVqJdSICRe?=
 =?us-ascii?Q?dRw9sNjK5zp+0fee33miKDAh693e96nAEWbVNIfHoFFq45mdbuEfycg1HgfM?=
 =?us-ascii?Q?J3WsAL1hkI2wsT7jes/bBAb3XliYqLn2v0UsgPz1unpPByx8AWo1D2LlLrZu?=
 =?us-ascii?Q?cbYwxujnnwfof0lXuCsvo9y7/R6gwdM7VEm8vEOuyU3wta8NC55mdyOASNUZ?=
 =?us-ascii?Q?220bRIFrqInUKSX9uP0TynN0bGYD8vNceND3NaPU4D9mdfhDO4DPg3OowDsD?=
 =?us-ascii?Q?MUTSqTbZCV5uJJ7J1ovvjSYhAuR+12qq+EqiUgWsfu7zdKJwI1ipqAc9mlFa?=
 =?us-ascii?Q?7ydR79g5j9OCPg4GdKPavOufiGNcca37YOsOx09zd/hLn9UBgM0LF+RxxsGw?=
 =?us-ascii?Q?jJBk0z2EKj0YBSl+oeHWRjrfYm5O7SmZOKVBpOo8UO5SCpJ3UhG/yjPlz1/T?=
 =?us-ascii?Q?zl9E28OopTbMNf8TzjYZEinEg5jdJOPiADYMjbjmCkLOSax3aPrXlaEAFiL0?=
 =?us-ascii?Q?1rr9ckAjIHAOqTaPdpS311U6wuLJPBR1gpdR45otbp32Q9j+2fsrnc0DO29U?=
 =?us-ascii?Q?IyxlgNHQ8LFbIyd8dUj+T4n1QQiwz48E6OyydMAsYykQkuNzhf9Vxm6er7vi?=
 =?us-ascii?Q?sXPddxqZ7tobuz8/S9P3Ykxrjt9koQGCu/C6i2N1yqjTqx9zx47GwtfQHl/R?=
 =?us-ascii?Q?Kxr8zzP9iQUmgEEflFgVZ6AAmNtk7zcOVo2CnLmdkDtu2hlp9nHf/ioCsLNw?=
 =?us-ascii?Q?i1JosYZOYy8IiZYKtgnRDEqjD6cGdsY4hH9d0JcA/EQsMl0Z3BzqcKQ3dc4I?=
 =?us-ascii?Q?lpHQ0NJuhMe6P+tN8XuxDiPAgmlFxKqT5VbQx46F85ih/P/mV2ysKyRHUZ/c?=
 =?us-ascii?Q?/+FdMIWnE6oNiGY9NDDf03TXyTvmCIaESve8XQQ6SMEx4s6AdQFUKYVJ0nQY?=
 =?us-ascii?Q?1OACJUUo98CFnSD064KHzG63aZM7S33kUeVnhL99HJXOcTgkT5Xh9wDs1Fn7?=
 =?us-ascii?Q?BHs5eaZ+Rs70XyErRO0N6Trz?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c256c37c-534b-4885-6f60-08d946610b47
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 00:48:06.5858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lw8BfSG2/DJpu2by6Zdoq1p4yFoMVEAd2FUgVEN7DqgnRl2xPEnJB3QzF6wLUy8dV0dmcurGz4s3wMlnHb7gKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4592
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10044
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107140001
X-Proofpoint-GUID: UZThYi-wYsJiJxemcFPxhnzy68zoTepL
X-Proofpoint-ORIG-GUID: UZThYi-wYsJiJxemcFPxhnzy68zoTepL
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 jasowang@redhat.com, joe.jin@oracle.com, dgilbert@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While the previous patch is to dump the MSI-X table, sometimes we may
need to dump device specific data, e.g., to help match the vector with
the specific device queue.

This patch is to add the PCI device specific interface to help dump
those information. Any PCI device class may implement this
PCIDeviceClass->msix_info interface.

Cc: Jason Wang <jasowang@redhat.com>
Cc: Joe Jin <joe.jin@oracle.com>
Suggested-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 hmp-commands-info.hx   |  7 ++++---
 include/hw/pci/pci.h   |  3 +++
 softmmu/qdev-monitor.c | 11 +++++++++++
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index ce5c550d44..4e831d7ae4 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -223,9 +223,10 @@ ERST
 
     {
         .name       = "msix",
-        .args_type  = "dev:s",
-        .params     = "dev",
-        .help       = "dump MSI-X information",
+        .args_type  = "info:-d,dev:s",
+        .params     = "[-d] dev",
+        .help       = "dump MSI-X information; "
+                      "(-d: show device specific info)",
         .cmd        = hmp_info_msix,
     },
 
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 6be4e0c460..4620b9e757 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -129,6 +129,8 @@ typedef void PCIMapIORegionFunc(PCIDevice *pci_dev, int region_num,
                                 pcibus_t addr, pcibus_t size, int type);
 typedef void PCIUnregisterFunc(PCIDevice *pci_dev);
 
+typedef void PCIMSIXInfoFunc(Monitor *mon, PCIDevice *dev, Error **errp);
+
 typedef struct PCIIORegion {
     pcibus_t addr; /* current PCI mapping address. -1 means not mapped */
 #define PCI_BAR_UNMAPPED (~(pcibus_t)0)
@@ -224,6 +226,7 @@ struct PCIDeviceClass {
     PCIUnregisterFunc *exit;
     PCIConfigReadFunc *config_read;
     PCIConfigWriteFunc *config_write;
+    PCIMSIXInfoFunc *msix_info;
 
     uint16_t vendor_id;
     uint16_t device_id;
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 7837a17d0d..7fd3fe0ada 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -1011,7 +1011,9 @@ void hmp_info_msix(Monitor *mon, const QDict *qdict)
 {
     const char *name = qdict_get_str(qdict, "dev");
     DeviceState *dev = find_device_state(name, NULL);
+    bool info = qdict_get_try_bool(qdict, "info", false);
     PCIDevice *pci_dev;
+    PCIDeviceClass *pc;
     Error *err = NULL;
 
     if (!dev) {
@@ -1027,6 +1029,15 @@ void hmp_info_msix(Monitor *mon, const QDict *qdict)
     pci_dev = PCI_DEVICE(dev);
     msix_dump_info(mon, pci_dev, &err);
 
+    if (info) {
+        pc = PCI_DEVICE_GET_CLASS(pci_dev);
+        if (pc->msix_info) {
+            pc->msix_info(mon, pci_dev, &err);
+        } else {
+            error_setg(&err, "Device specific info not supported");
+        }
+    }
+
 exit:
     hmp_handle_error(mon, err);
 }
-- 
2.17.1


