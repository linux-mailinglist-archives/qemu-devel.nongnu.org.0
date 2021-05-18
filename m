Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C5B387E9F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 19:43:50 +0200 (CEST)
Received: from localhost ([::1]:56382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj3kz-00037C-6D
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 13:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lj3ie-00019O-KV
 for qemu-devel@nongnu.org; Tue, 18 May 2021 13:41:24 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:28580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lj3ib-0000CV-IZ
 for qemu-devel@nongnu.org; Tue, 18 May 2021 13:41:24 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14IHbwqg019944; Tue, 18 May 2021 17:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=7HgPvV1EcdFVijHr9PGCA9+eQj1P8PS+4/ITxEpMosA=;
 b=VLwZjrzXKBfGp49gOxzExzcvVk/tedE3BADSJko0w9oqrfQR434MQ8pLkfWTT9SLmZBT
 1nbS7ZledTtHb+giWPodox6nAvVKYx/Tepwptp/UQPnPc0c/oCmDLNu0K32PqkLiN+2X
 3ttJeAM5//KGF+0SMQIa8CJOQlmuM+iu+AbmadRy37vgnbVaHQ6F+WAKJuSNB/aODwp8
 zgV3o+QIykLUS6ALrFVA/L2noZ5flHeB/xt7tIOy7LxoJgo0L0xIoqxM/ELA0oRC3p3m
 PvCAEgrCL3YJqXa9aEqU76xcU+W9lH5Tvj3k+1PKLGCUV/8g0j/XDLCL7Vv6fAqoqpwk oQ== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 38kfhwgsc2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 May 2021 17:41:16 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14IHfD5v175976;
 Tue, 18 May 2021 17:41:15 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2040.outbound.protection.outlook.com [104.47.51.40])
 by userp3030.oracle.com with ESMTP id 38megjpmfn-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 May 2021 17:41:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DmEdj4GhEnJPGOdqzAYzADx84iSy27rKEEsFvAzdNV4WLzU9pwSXhegYrYzOKOzC1O2lOu61fWrQJa/X4pl8lF2MMF7WiyaCKVzKkxzamyrxohjngpjQi1VwO3AT0Lypssz05NT7C9jTjqliNAYsCYSanOr3cp0qZdJrQgTLGsud6Iu28UmoRMVRl6d/iClrQRXPYxr+TePMswI+80Si2nNeEkK3Nim8tK+wDZS2sR289L7jun8JjC93NzPH2z9ZhNmBBHs/iierzpAGysc4q4fsPcIzrUr2blwWhkZre/MIPcOjqXB82GrlNECu7i+dpkzQYvnDoU4oQh95x/BfyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7HgPvV1EcdFVijHr9PGCA9+eQj1P8PS+4/ITxEpMosA=;
 b=djTrggb8ZHEI/liBUOHG+uk4tYHq408MHeVtxhTWSSaaQJ+YBkkDGe6a4EkFCtgexV1cj/eDEquoBSy+iuNlwNVgop8qIUVny1j4a38AFSAWrqyK1duaMHCf/sEr/SR6cEnz5Z+xutrj/qtKa6FsZSXSjJHMggrsoEeuq4FtxNQLXFbTTu9MxQGh6u3q9Cm96FLn5xfPv+0ZcbF2B6WUCl5kTIrznKfZsc7I2tqtixl5Z3Vt11mo9Jy7oVYrdWYlK8QBCRYRuQLg9VkFGKbeYZ7c4HPQHOVOZuivkg8YdP8RmSh/gv38Q5DZA5SD5Mr5GEsJf8/wNq3m6zHxsjJhPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7HgPvV1EcdFVijHr9PGCA9+eQj1P8PS+4/ITxEpMosA=;
 b=z7CDlizirsREuo56z56R6+0UCzSvqeYQd3r0slVoL6P+pLfXppbfHJGiTDWPkFGR6vir/KvtcImzLMKUVa69ggG0w1Xo0itDJlQHVxyo1C9z8B09Jq4C8Dxqwyydde6hICIT3v3aWkMKdv13N2HFeRZoCYn6pi3W4A/DXzDkyeM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BY5PR10MB3812.namprd10.prod.outlook.com (2603:10b6:a03:1f7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 17:41:13 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::18a:7c1f:bf20:ba6c]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::18a:7c1f:bf20:ba6c%3]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 17:41:13 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] virtio-pci/hmp: implement device specific hmp interface
Date: Tue, 18 May 2021 10:41:30 -0700
Message-Id: <20210518174130.9381-4-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210518174130.9381-1-dongli.zhang@oracle.com>
References: <20210518174130.9381-1-dongli.zhang@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.200.16]
X-ClientProxiedBy: BYAPR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:a03:74::23) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (138.3.200.16) by
 BYAPR05CA0046.namprd05.prod.outlook.com (2603:10b6:a03:74::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.11 via Frontend Transport; Tue, 18 May 2021 17:41:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e418753-301b-4d3d-9d50-08d91a242120
X-MS-TrafficTypeDiagnostic: BY5PR10MB3812:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB3812570481E6A78996ED5A77F02C9@BY5PR10MB3812.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:192;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WstJAGdFA3olYNITHCxNuuJdDDpDcp4FiqPjexWye0k8uJMvwvPDpXu/hrLBsTh+n/H8/6JdnqeKMDtc4s7jRUeSGgpEjxy1CVMoLZsqX1605Igjc05vGWoYZRtPlogHCgtLWnnQn5gv9MPGFFxJQTx9Xi8Rs67LFodcp/7nyTvguEDStygQ7WF4GLyXCyRQ0jnekdq1KVbZaWAK1epQb0zpqEBDdTXWzzM5605EJGvG2KnHfpEgYxkjF1FCBWULTfLwQlw31WOF8CfsJzAft4ueuJt12VapyM6D8DiaRAoNp8B7gdMKAYv0RufngM5olqVnHMxUSmjiQ8pnwdzCV/EjmWAL7mQYK5x7Y7uz7C+UPqSfli0jmbiGA4rJDRw7rrnpD4htfn4gVFGO8IMuO+QOXoThcJRHct1eoegGhVIdgyN04POKkxSSIY8kmxfxKKbhxGt76tT/K646hv/RSAKh/QV7Dgn2+phMf9pI0ywbodG23ymYkb7iReaa36rBvxs9Q5rX1s6ALY9wQ7mj/jPJAFEOS57jXCpZ03qkka7MKKAogU2yFCNLvXwsbV3HtoxNjQc6UGwvRdWHE903D3p/9DwyRv2IkTGNSL/znNLpDgwWWR3sX8M6TeoMhKJ5bDiQOZcHHqjz9LZRMrFQbcdnjooaJp5reojGaRJtq5JrIGNxxTGU0K/nBSEvO+aC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(376002)(396003)(39860400002)(136003)(8676002)(5660300002)(6916009)(6512007)(186003)(38350700002)(16526019)(38100700002)(86362001)(6666004)(4326008)(6486002)(6506007)(2906002)(1076003)(107886003)(26005)(66476007)(478600001)(8936002)(52116002)(66946007)(44832011)(36756003)(66556008)(83380400001)(956004)(2616005)(316002)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Win+k7iQLMmi40J5F/emnezDf+hXxg4lOHsmJ0AAgbavLkbf4gGcWyUxAI5Q?=
 =?us-ascii?Q?SO5YyeP4h07GBwNc3JrtlrDwPNQ7QBO6+p5YtxCip97BL8HmX32cbx8sL5HA?=
 =?us-ascii?Q?gYEyNKzJJKczr7QdeCbOroIz6N5o/sdxTnp2+8op/YQ+IAmyKLimqaj0KxWW?=
 =?us-ascii?Q?PD64RtQ9gMCkQ0XKPNGvF2Wm5PO6UMotyGX3OM3FMPvKma3vzrPjX0jMMwsX?=
 =?us-ascii?Q?zQUCj3l0xkr6fXWz05xJHNaEzQkuGcDFcOFmEn883mCuJ5Sl/WSYEl1x8qaW?=
 =?us-ascii?Q?KoQuJQe622xL70L9421zNaiQmUKmipLFzWNVJFa5jNry6QQYiEVg83AJ7LKx?=
 =?us-ascii?Q?VH/RCwXWgIz6uPHUCmsvgVA3ecrrW1EsEXsvvXb9RYT7jjXFaw4EkW4MSJqp?=
 =?us-ascii?Q?9l3qpQDC2q/mtknWKNmKIv/uhyJfmPlrTaOMAsAHtquNfKr+NFBf+rBUnFaX?=
 =?us-ascii?Q?yHCC3m1aJeaQOoSEnflD99Q3vuJRFnLs/mYUYLsZdQu/7fTRvIIN/H8SZTOJ?=
 =?us-ascii?Q?p30mLVr8YjZ4exQ4grCu8f4WMqx45rhFYT9/Vi95dcCK9Asjj8fuU06B/v48?=
 =?us-ascii?Q?IRKyI4f8tcf01SgypIrKintujOVdB/9ZRzhxFbwgP7NiKSgLvk1HpkPJvNEZ?=
 =?us-ascii?Q?9Cr5F5QzJQZZd/nvHAOmxSBVizNWdeoAYd259urAaNcTxudhsYLYzr34IaH7?=
 =?us-ascii?Q?x9c4Q0kfhVgyymY0GlaomtSPGXvptBeDCTkv+6wwbiYDEMaMlIqVzee5m3M0?=
 =?us-ascii?Q?P79+L2rU6X0k83BEbpk3sD20Oh6Y4ZcAczYzFSF7g/apIbvJWHVmFyfhQbB0?=
 =?us-ascii?Q?ac+qZWOL2o4vX7wKIuegDmj8zdQA+H3MCDD4PCruZLjeHn5keG4q+UHvH5Vq?=
 =?us-ascii?Q?r3tYfaFFKD4bHD5winZUwhnTLQimKKl+iug21iJ/zFfOZXo/TzMjV9B3Gxo4?=
 =?us-ascii?Q?mSjzhpWXJ6b3sMQKvhsEObrkCgF+NBp/9jkTI/zURfWxBo86SYWz00OjPKQF?=
 =?us-ascii?Q?mzdJYlBJASzHpY0eDMiGfktjKO8U9XLAAOnZ0MVihw5r3Ly6TGkaxZ+++qGk?=
 =?us-ascii?Q?ywQsU7Ombt+OgBjZb3AhgUJP0BllnTPvVpDbOuwbtHZ5FyQ4Zot6AhfFuQha?=
 =?us-ascii?Q?23074/gs2e2ikH7PZUyzD1Xx8tpsGfCFCloqUdNjVNpdurC6sfnn81j6j4UO?=
 =?us-ascii?Q?9wqhEvdOSklqdptMgbCUFvQIS4tNcZRSJPXZd+WORC+ZnnTHCUFVCoE1xdeF?=
 =?us-ascii?Q?T63xOjAT5RMvcv6768nIwQfyO2nOfZey4QjgI7/AdraIQTXfNmlXk6+NjMMD?=
 =?us-ascii?Q?6ARgJS/VTthfoN57Wbp0Q46v?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e418753-301b-4d3d-9d50-08d91a242120
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 17:41:12.9214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ml/Au47o0RWG4qs0aMkMLzw037J1s0NpvI+KkhRxWlC3H8RFEoC8EWMoDbH4CHFZ9Y/QsqO10e/nXpP9A8HetA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3812
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9988
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105180122
X-Proofpoint-GUID: eENkyG8LmQdRf1BwbYdYQLKyFIT1oLbb
X-Proofpoint-ORIG-GUID: eENkyG8LmQdRf1BwbYdYQLKyFIT1oLbb
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0b-00069f02.pphosted.com
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
---
 hw/virtio/virtio-pci.c     | 22 ++++++++++++++++++++++
 hw/virtio/virtio.c         | 10 ++++++++++
 include/hw/virtio/virtio.h |  2 ++
 3 files changed, 34 insertions(+)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index b321604d9b..edc143285b 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -37,6 +37,7 @@
 #include "qemu/range.h"
 #include "hw/virtio/virtio-bus.h"
 #include "qapi/visitor.h"
+#include "monitor/monitor.h"
 
 #define VIRTIO_PCI_REGION_SIZE(dev)     VIRTIO_PCI_CONFIG_OFF(msix_present(dev))
 
@@ -1563,6 +1564,26 @@ static void virtio_pci_modern_io_region_unmap(VirtIOPCIProxy *proxy,
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
@@ -1975,6 +1996,7 @@ static void virtio_pci_class_init(ObjectClass *klass, void *data)
     k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
     k->revision = VIRTIO_PCI_ABI_VERSION;
     k->class_id = PCI_CLASS_OTHERS;
+    k->msix_info = virtio_pci_dc_msix_info;
     device_class_set_parent_realize(dc, virtio_pci_dc_realize,
                                     &vpciklass->parent_dc_realize);
     dc->reset = virtio_pci_reset;
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index e02544b2df..fd07d9deac 100644
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


