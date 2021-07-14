Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B583C7AB4
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 02:51:25 +0200 (CEST)
Received: from localhost ([::1]:43404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3T7V-00060R-0w
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 20:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1m3T4U-0003fW-Bi
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 20:48:18 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:38648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1m3T4Q-0005Wo-BJ
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 20:48:18 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16E0fE3U001519; Wed, 14 Jul 2021 00:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=r1n7485cQhaxPzj8emFerG876GfvUQJ2MFub7M84KMs=;
 b=Xykro58G2DjZHuU+THDeu/jqPUvzFGTyzxDVkTO6VVh8TJ4XGdqzB/fTXZlPlmlvinj6
 8DRZE2pxsXAuJhuOYNJNxrbfQzkDDN2ExVziZW0ORp1q/kRc7dF6eBp8qHvVcDXqF65L
 XicfiWvOON129KQ+BsPhvPs/nsjdc5bJWoIkG7ua2Aw4mpr7IgSZdnRaiTDnG9bgGSVY
 SY0vh6q34z2UsCwGuQUnrVcyamioq4SFmSNw83ELLC+/I0lmjBdrNGPsT62aiC71GR42
 6iezofK/5uM3n6J2WBhD5RL1zFBx8L89qf+ibEYv4gE9RqVwliWOVXKYffYM/mivLOmr jQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39rqkb3mt8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jul 2021 00:48:10 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16E0eiYO076431;
 Wed, 14 Jul 2021 00:48:09 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
 by aserp3020.oracle.com with ESMTP id 39q3cdcng2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jul 2021 00:48:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y0Cd9jOGqB93t7s2XML+ENT0cOuQbKPXTH4tLbHUOXii+KejyC9/1bQoFqBPJtSTh9BeIL8vlLx6fysdxoND6J1re9nsjhn9spRvXKfeADeigK3VYwHg2WUkafAQymbDvNsvdGti35i6PGMLRJlP2GkHbzyyZDeA8Lot4ZwmSA3Nm+EtZQE/p+aXrqBg4ZhTiXTVkucvYkUKLU1yNOWi/cOvKOYCHofDV3OGBkHqiCMobyF4yNRyryIVny7/i3GcCWLFmCFTFl+EpHdim7PiMJzm9K4PAWutUFVUbFnhgfhIJ+cwGT44I63RvENkcVPlLdjfXJxqXBrm6jdY+8T+zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1n7485cQhaxPzj8emFerG876GfvUQJ2MFub7M84KMs=;
 b=Xk5dovnfS10VwnWRc4hX5H7O1ne5V/ukcx5aZPUfIDApF1M+Guu/Pi11CCjhiCE5MNhY0VgSADnT66eak/IWih1UR+gc5MQcwtCbUs/KbXY0WvJPEfPjrsfwO2l73tAktJKiS/g9IhoKvHwI2/yt4qT1RgrZ9OXTPWoYAhyNySE4oM1s4exD7OyKY0t4MMONbmOCZKUyXEuueJhLN4q+Xb+cAEdsO2/DqsoLJNef5i8kRLi+l95uNjRWfjZUCXYfV1XU7KmTl1+elvGZlrdpyxKi+5J6ReCAg4BJCbjDfXvdUh+cvp49grHM0YN7WBwejbV0gWj/G/UdddCMWdWrZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1n7485cQhaxPzj8emFerG876GfvUQJ2MFub7M84KMs=;
 b=w5nI+6l71TO3uwkAc44fgXIKt2DRw1H7bfQIUm2ZjrcTbP92QAvdXbmYOkqpQr62GvEltO4s8e2qGE/j6g0ODq5CJGEWGZxcB/d2tkg2IoINFHwVX0MgbtsMwOUVaA6Jt9sFaGFM+62TwgdfPLoyCmpB9RBYsz4D1T9q0YRVwtU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BYAPR10MB3589.namprd10.prod.outlook.com (2603:10b6:a03:129::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Wed, 14 Jul
 2021 00:48:07 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::18a:7c1f:bf20:ba6c]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::18a:7c1f:bf20:ba6c%3]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 00:48:07 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/3] virtio-pci/hmp: implement device specific hmp interface
Date: Tue, 13 Jul 2021 17:47:54 -0700
Message-Id: <20210714004754.22243-4-dongli.zhang@oracle.com>
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
 Transport; Wed, 14 Jul 2021 00:48:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8cebaa24-30da-4357-ed98-08d946610bfa
X-MS-TrafficTypeDiagnostic: BYAPR10MB3589:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB3589C8435191D6D41A03F0A6F0139@BYAPR10MB3589.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:192;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lh8GdffSEbUpSoIqNG3zgsu3e1txjt6ajsnDY+2ExkPPJhHg+OW6+3gLTgQOGQyniPyjQ+QNkb6MuvV0Pk/ULKkX4qLIACYKUOCiXeZpzEBvxjHcz5jLtRQ1+nfY2JQ/3KddWeHZoLLkTXvjUir4NL2oCwAhsMyFmhTQUvRE+4CWMRg8VAMUBUkIGAvG+Fk4TsIQMXLDX0mfqb5iXlPyCFE2IoNFKVEiP/QCcxIXiD4XJKz2fUFQldIv4HpS60UCwdfFNAhn6VNA/P/TWDgIGMHZZiXciTMVVNY2vcQrv0Lv+NfBqrFiwlFk9n/UsdhfqbOsEG6dKm4pqVJ1b6bvMH1eO5ofQjgmNcHt/Uu4T+DSLZSCgIocLznRwocLaHUpsqmDJ1iO/WVKet6eA3biG9SRt4agWAaEAjN087To57pXSSVtCMKODA74Q4i0FwM8+7jzKbRDkh8GPi7HX2EBsd6+eaHzhZrpUOWRbuaTXzRA4WmwARVoqToSczmueLI6yC+OcY1sPD1TSchsWxcbScrf2nI8vFiK4jh9rgBYM+YMUwIgQIjkRvGP8JEPbXtOgOd3PevLZfQTU3C0N63iCqnkLWUjybStnAR7RP2Xl6O7JP+zP4AwQ9k6BuOMTTPk+2KcXL2d62Wi1yQYzbThndHBbxoJZArnbsNpssFbH1Th1x78KX/erPCyIzrqrZPUA9N6LzQIDu/+PsH3ahJNZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(366004)(376002)(136003)(396003)(6666004)(83380400001)(38100700002)(4326008)(6512007)(38350700002)(6916009)(107886003)(6486002)(316002)(8936002)(6506007)(1076003)(86362001)(2906002)(2616005)(5660300002)(36756003)(44832011)(26005)(66476007)(66946007)(186003)(956004)(52116002)(66556008)(478600001)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V8Id4bYyJTY0TnRD6VTxZ1TX7mvvJA6eG/TWG6na1ISmgRO6MsUbETeuh+hT?=
 =?us-ascii?Q?nqkn09mPvsLKJNUZIV2jqsF0Cpt1vDZrF9wL1th6xuEPoPkIEKgDSpU6HF2l?=
 =?us-ascii?Q?3Se8Vqf86BTXOIfXMHW9A2VuxR7SnuyIJ3ZNFUqimsq+Rn98y9JMvgYWhT1P?=
 =?us-ascii?Q?9DVEgO6SAqaiCWRWD1ggqf+IDTH6UTem1Fz0IsZMzBgUc51nd6M3RnttrkgM?=
 =?us-ascii?Q?VqywWbHn6bYxZhYc0vjTp/nj2b9Nfu8OGvUadMRlF3TXLRS3jNDevPvLa+N0?=
 =?us-ascii?Q?wJhoAgOZ/2SgaCT22G8obcdMfPFWYkWAywyHvNBHbqbctFbwelby0QDQmivk?=
 =?us-ascii?Q?ZNV5v4Wqf+pgT6abKiaP3ILlMRRKd2RvTiV7cYSX5WlP02nSU4vQVgHhbm3R?=
 =?us-ascii?Q?IsLCmNQQw0iCWa2kSm+kd+p/ZH+cXStkHU40V/kwXkhgd11jTAHLGrviBjTd?=
 =?us-ascii?Q?efziRZUvu5PyJ4Hy+yVCayufPlptrpCYO+O4m1buYNCcNGqSQ0nFnl1wPz4P?=
 =?us-ascii?Q?zE37sktIXzP47hRoEAfNGqMKf1X3IX9g51NK9z1ZcvJZ26o1g8CRsrVAM8rR?=
 =?us-ascii?Q?gRN1quUZRBCCls6nXs/kkd8WCdE/jwjCVTYWf+LWXksYE8BL0nyR+Vr+5X6+?=
 =?us-ascii?Q?6gyrLrGIeiTWYKelS8w9llM+EjqAn2TkWGqks6I7xN4jJnKZkDcLvdOJgW8V?=
 =?us-ascii?Q?NJci74KMNbJHeB6ZoUUGny9JIaRHw/X7hSOeQFdsPYCYXlao0dPNFq5HvVmU?=
 =?us-ascii?Q?LI8KCJvVp0S3LbpP8dQZ/+H6dEI7Gp0xPxUh54hIKifhZtj5fyHw2frjUujk?=
 =?us-ascii?Q?qyIi6zXyvUlRMnRYBt7JHUIL5NupZ7H9jAJggKuxAoyB/1p8QI4JVrsFrVwW?=
 =?us-ascii?Q?v0Y7/MeoTKaafaq8n9lSOoNAL5NWcsPTGecgNX0Z3v0I1MP01vFnttbYIEC1?=
 =?us-ascii?Q?ua+yZ/BRDn2eCex4SH9uGFKXeg50FmLlcwdi0hFP4SOAP62zz410ZZ0ExXAh?=
 =?us-ascii?Q?0KdaNoBekMzCnhWrDuKBIwIT2doHFGvzv2wM9LF3MOuh16qJGcsS9xeP9PX0?=
 =?us-ascii?Q?XBlX2w+C7ILDajgJriFDQD8jkVgCMAFWGlCCh8HVmCGy49j6LqjtdaT1NLA5?=
 =?us-ascii?Q?srlPILyOGG17NaZ5QZ3UzHZXFa8BJGsUoQnoh13Rnb1vFsGGgOb2qV7fbA5/?=
 =?us-ascii?Q?EpKnHgE3Kljj9wEJ5VZDlKR78XJKUcRV4lzf/FvRkqr1KWY0BWAA1gCKAfyN?=
 =?us-ascii?Q?yEKM+X0aZDSMfELKTtRTBHm1A+WVY4i4fC/WvhmgUBsKqTT529gqWBNcP6D2?=
 =?us-ascii?Q?sA4br2c5kB39DPGBYZ8p5Wae?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cebaa24-30da-4357-ed98-08d946610bfa
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2021 00:48:07.7771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZtjwyRunyGOuWs6AeWkDGubX0gv1LjJSQhh9Drdy8rMJDo5yrg8kBvEJ+G//4YdHrf1ZEX0Db0NRf8WZ0OlFzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3589
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10044
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107140001
X-Proofpoint-ORIG-GUID: O83OrPZeFmJdFL7YP8ep9WZ_Jo0epqi2
X-Proofpoint-GUID: O83OrPZeFmJdFL7YP8ep9WZ_Jo0epqi2
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

This patch is to implement the device specific interface to dump the
mapping between virtio queues and vectors.

(qemu) info msix -d /machine/peripheral/vscsi0
Msg L.Addr Msg U.Addr Msg Data   Vect Ctrl
0xfee00000 0x00000000 0x00004041 0x00000000
0xfee00000 0x00000000 0x00004051 0x00000000
0xfee00000 0x00000000 0x00004061 0x00000000
0xfee00000 0x00000000 0x00004071 0x00000000
0xfee01000 0x00000000 0x000040b1 0x00000000
0xfee02000 0x00000000 0x000040c1 0x00000000
0xfee03000 0x00000000 0x000040d1 0x00000000

MSI-X PBA
0 0 0 0 0 0 0

virtio pci vector info:
config: 0
queue 0: 1
queue 1: 2
queue 2: 3
queue 3: 4
queue 4: 5
queue 5: 6

Cc: Jason Wang <jasowang@redhat.com>
Cc: Joe Jin <joe.jin@oracle.com>
Suggested-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/virtio-pci.c     | 22 ++++++++++++++++++++++
 hw/virtio/virtio.c         | 10 ++++++++++
 include/hw/virtio/virtio.h |  2 ++
 3 files changed, 34 insertions(+)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 433060ac02..2971e8049c 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -38,6 +38,7 @@
 #include "hw/virtio/virtio-bus.h"
 #include "qapi/visitor.h"
 #include "sysemu/replay.h"
+#include "monitor/monitor.h"
 
 #define VIRTIO_PCI_REGION_SIZE(dev)     VIRTIO_PCI_CONFIG_OFF(msix_present(dev))
 
@@ -1587,6 +1588,26 @@ static void virtio_pci_modern_io_region_unmap(VirtIOPCIProxy *proxy,
                                 &region->mr);
 }
 
+static void virtio_pci_dc_msix_info(Monitor *mon, PCIDevice *dev,
+                                    Error **errp)
+{
+    DeviceState *qdev = DEVICE(dev);
+    VirtIOPCIProxy *proxy = to_virtio_pci_proxy_fast(qdev);
+    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
+    int num = virtio_get_num_queues(vdev);
+    int i;
+
+    monitor_printf(mon, "virtio pci vector info:\n");
+
+    monitor_printf(mon, "config: %d\n", virtio_get_config_vector(vdev));
+
+    for (i = 0; i < num; i++)
+        monitor_printf(mon, "queue %d: %u\n",
+                       i, virtio_get_vector(vdev, i));
+
+    monitor_printf(mon, "\n");
+}
+
 static void virtio_pci_pre_plugged(DeviceState *d, Error **errp)
 {
     VirtIOPCIProxy *proxy = VIRTIO_PCI(d);
@@ -2004,6 +2025,7 @@ static void virtio_pci_class_init(ObjectClass *klass, void *data)
     k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
     k->revision = VIRTIO_PCI_ABI_VERSION;
     k->class_id = PCI_CLASS_OTHERS;
+    k->msix_info = virtio_pci_dc_msix_info;
     device_class_set_parent_realize(dc, virtio_pci_dc_realize,
                                     &vpciklass->parent_dc_realize);
     dc->reset = virtio_pci_reset;
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 874377f37a..ea54939e98 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2581,6 +2581,16 @@ void virtio_notify_config(VirtIODevice *vdev)
     virtio_notify_vector(vdev, vdev->config_vector);
 }
 
+uint16_t virtio_get_vector(VirtIODevice *vdev, int n)
+{
+    return vdev->vq[n].vector;
+}
+
+uint16_t virtio_get_config_vector(VirtIODevice *vdev)
+{
+    return vdev->config_vector;
+}
+
 static bool virtio_device_endian_needed(void *opaque)
 {
     VirtIODevice *vdev = opaque;
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 8bab9cfb75..6746227f73 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -268,6 +268,8 @@ int virtio_set_status(VirtIODevice *vdev, uint8_t val);
 void virtio_reset(void *opaque);
 void virtio_update_irq(VirtIODevice *vdev);
 int virtio_set_features(VirtIODevice *vdev, uint64_t val);
+uint16_t virtio_get_vector(VirtIODevice *vdev, int n);
+uint16_t virtio_get_config_vector(VirtIODevice *vdev);
 
 /* Base devices.  */
 typedef struct VirtIOBlkConf VirtIOBlkConf;
-- 
2.17.1


