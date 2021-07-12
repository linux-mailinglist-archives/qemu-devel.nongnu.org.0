Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B703C674D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 02:01:33 +0200 (CEST)
Received: from localhost ([::1]:56936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m35rf-0007CV-Ov
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 20:01:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1m35ow-0004Rn-6y
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 19:58:42 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:47610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1m35on-00031h-D4
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 19:58:41 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16CNkXuv027063; Mon, 12 Jul 2021 23:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=pOUOkrLDxwy08vEw86GdZvYTKurgDcLSp5cbw46jsJ8=;
 b=mQ0qKKEmyNVxNyshxYmWzz/G7GPSogy3BwNLYBsyzH9F7aCVpFwRlbSEMpYQfEPI2+XO
 ytGQPiZLKHXuAD2HgxyOsz+HejqCTMSZKBljm1ctUwe9nvOErMDt3gQ3208vkLMCd7yI
 SXAnIsP48lrvZilOhmU2fC+8KRBJ2VwV626/1PF7jsnBKDcGsKrvWOQpGNUQqZ0NJB5d
 ciDJWzNWxWMxaWnf4um2E4K/2tGWINcpwEFhikXGOJKcBKlsV6Yd+6RxAixKhPTv5Wm0
 BqP91m8gWwKAYQf0ptjK5ZLRgXhtSRCNgXerO2r04jt6PjSl+zlg60A2G/UmWCFJZGQm jg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39rqm0s499-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 23:58:32 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16CNon9F078762;
 Mon, 12 Jul 2021 23:58:31 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 by aserp3030.oracle.com with ESMTP id 39qycten6x-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 23:58:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GcX8vFEBiXvuNDzAtdPtENg6wu7CFurG+dj/cgsHA1TvEfeQ63XDPu48WL8CGDfOg1+4ytp38AivqZ3Srf8MnTs/CrBK/shq+vH3Xi1X0Jb732dMx16HfHZIq0rjNTIEkNIywZ8BrvomGB9Jy+gKpfxBRs1v2CujzcBC1BkK3ZMiN2wAEtc8OGTvwAf4DTaKIlsUgYKVjv4filvIrHinaHYjPLiNW42yqXVJCUuW2PsmehptHTFAa7OhF0bpkZ/jHFhEXIwN6GouC2d6Zm9e8O8py6v6NaS7oKFi2KZzawz6qCm3KgAEb0yaa76IElPiFw73RYEAWirvL/Kf3dWERQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOUOkrLDxwy08vEw86GdZvYTKurgDcLSp5cbw46jsJ8=;
 b=bidOp8kgZiS1iVyJjdFNx8+sFlfAKBRdiXGPdKFprg1DKHAn/BM0U2OS8U8TgN53ipOC3TaFrSE/ar4hO1n/LPdfpygguOYZvkgt0qWZiUlv5oP7iYF0wOUBQoEv9wxHsExiCO5DwwCWVrPL+Ata/tTG2ZFKa0/SV+BfLX+J60vKNwrVVk64AdN7P1mqwV8/FcfE1y58YE4AJVRV1jHpecPSm4baSB0LXPk0u8ee2M/n7KzovasGG3ZQ7QZnblMAQ7orMZZo8q7J9uXMHyonJlmZKIFR6mqbWDdFIcjupb6BCdqeC4JLQpWgi3WWoJvkxV5UxzSH7VFPCzsqvnPiSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOUOkrLDxwy08vEw86GdZvYTKurgDcLSp5cbw46jsJ8=;
 b=Ne8aWjcKL18mMRXRHlFSeHXceJiZqIuiGMRAsOD7KRhImp1bacjm1W00iyqfYUvyKqM0FvIuTlp51XyAZGkXD9wDrDWZT1q9sxGavdvR9PCHjr1HLdvQ2ijsC4NZHMXastI6Nlvj+oU6Zh/o+QmtUIghplQipNJ9kDZdAiQt8OA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BYAPR10MB2598.namprd10.prod.outlook.com (2603:10b6:a02:b1::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.26; Mon, 12 Jul
 2021 23:58:28 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::18a:7c1f:bf20:ba6c]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::18a:7c1f:bf20:ba6c%3]) with mapi id 15.20.4308.027; Mon, 12 Jul 2021
 23:58:28 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND v2 3/3] virtio-pci/hmp: implement device specific hmp
 interface
Date: Mon, 12 Jul 2021 16:58:12 -0700
Message-Id: <20210712235812.19725-4-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210712235812.19725-1-dongli.zhang@oracle.com>
References: <20210712235812.19725-1-dongli.zhang@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0019.namprd11.prod.outlook.com
 (2603:10b6:806:d3::24) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (138.3.200.16) by
 SA0PR11CA0019.namprd11.prod.outlook.com (2603:10b6:806:d3::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Mon, 12 Jul 2021 23:58:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e09bea4-791e-4180-e5d6-08d94590f1d7
X-MS-TrafficTypeDiagnostic: BYAPR10MB2598:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB25981B573B50AD5DAA180A61F0159@BYAPR10MB2598.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:192;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kaCSghbBqhRU2YdKJEQ9rhAK3/EQaHRrsF3iIpdalfJI+b1NtykSNPFrkRuYnwT/yePaG0QBBDUY8ya7CXXUy03fcARGHiI1tiNdEeoUfxOCSmWYyIVMEo8adMgyKbetkxsvDx/uRWLSQwPcPXgfuB8idrJV/fDj7HfR+EDYk8xBpXeAeeuzhBC2MoJ/O5kgciclc03ZsR7TsGbwDxt4whCGE4BVJcCi4eZwsNQq8yOW8wz212LR4MszC7UTgsO7e0dH3780zsBb3woCo3r5LeieLaHeaLbnnL+AQWSfZr58fyUy/GMc9k+3vy8lSfbUCF35nm5p+gOeO8B+RhgIgh4TxuydJcLGEOR+6tLnnmoNuprjMWNLWPBCbVpZMqQPzWPOX3EpmlOX3s0/Uvb5r66vpGwu7Wyb5UACdU+wTC3/or9x+OU/Sko4+/Xt8r4zJReMdkrmGPJkigiHTHgKQMjdyqzNqJDW1atcwmQ6NBOjKWhs8fBvi/bg1b5wGo8QBCs8NJYh5N3yzlUodWxJAFTaBziXCyKAV9oj6hTARdc76immJuso4NcI7kmXrxRZ1699ypSZHaQA54OlTY3VIi+u/H4l37uNf01meRyHZGAwcNfg3E4KSFrEjuJ00hLmjbuTH2mA+5pa9YAC69GPOZ8W9NFMyOVRefzrDb3JOTSDqBHgv/gzI9li0jlCBAKWjsiY1vBscARfEejZwjKIsg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(136003)(376002)(396003)(366004)(5660300002)(6666004)(86362001)(38350700002)(38100700002)(52116002)(6506007)(66476007)(44832011)(66556008)(66946007)(6486002)(36756003)(956004)(2906002)(83380400001)(2616005)(8676002)(107886003)(186003)(6512007)(6916009)(4326008)(1076003)(478600001)(8936002)(316002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kJJB+iMiLdYapweZiTcKbG++BIerxDecNsEWwhYf0+xh1P0eHQhs79MfHPov?=
 =?us-ascii?Q?2H6rBZkjxbzD2dza80qP+q+Jizi6MkP2W11qh7zNF1GWsHII6MaMD0VWAdY3?=
 =?us-ascii?Q?2yQ7pgAnA6J7qNq/wnahOwWmHK3E81MQzay77ibzcCgYBcXfzV5iu98cyt0K?=
 =?us-ascii?Q?kOiZl5VlEnVOLGfZ1eWeeWKCoQFuY0hCk7R1PRZ36cHx3NppJZWbl7kB2AJr?=
 =?us-ascii?Q?eaJroOAk1dBSyClO618mboS4TEIl7cRZFBzX+fT1SImfOHnTE9wGsQ8OYes2?=
 =?us-ascii?Q?C4yTvgaMtZxe1YFTaeRr7W4OS9orb3n7aD/Up2JRbvy2rfcA38JkJlV2J/Me?=
 =?us-ascii?Q?ohL0ucBvkU7gBM8rgNcPGiErfgbBPeKZf/b6Ji7ycAjV2gVSsTHEcF1DyAPq?=
 =?us-ascii?Q?fKUpQN3aPTSgqdoucdCW7gXDZgnJoJj+4i3kCVCF6EpPPIdrFPN22QJrtCt8?=
 =?us-ascii?Q?mQbju6h3QeukcJ/lKGnTpyl8IGOK9znIvgxPKioktiJ4lRH8HqgV468kHNk2?=
 =?us-ascii?Q?Md+EV4i0n4ZANyudwZ2GnxDk7wbF2X6l+hb0SmeKkN3qgXanWjCWrsL/xaSl?=
 =?us-ascii?Q?iOH+KAA1ubN3EUJUzzsEi7EZoQ0ryJEVB4wzPfTK+q4hi8F5MrfkHDwIUMOa?=
 =?us-ascii?Q?1fD10IkwIAEKSKcj23gF6bP3XcaClAFREg2CZyuQGqskS8v+XspUIq+0aRoh?=
 =?us-ascii?Q?mdglqEFslS+KhWCPFcxKqOMLDUNYGx1Q6cQ91/7DoYkRTm+hCcg0Ov+ekCgZ?=
 =?us-ascii?Q?A6NNDMyu60gXI8DBuLFQ1pnAD2cot9Mw2Oy5EySsSBQX+aSJT60prHcawISW?=
 =?us-ascii?Q?dpQd1PIbPMZyyFYweikOwovQoBNc4jMjPMJneUBkIgRGEkDKlEuWMh3RCe9C?=
 =?us-ascii?Q?54T3rOWXS3TDwf4pm/wstIdShr8C/xZ1K5IMwnja/yp1+bSjboYCdOWVOL97?=
 =?us-ascii?Q?uSMJEOu7IQswWr2IlWYRrgnR6hChx4DKuyzq+Hrc82l1Ia0jsXVxtP5dHyCG?=
 =?us-ascii?Q?Nni2td8RJY8kaCCJSuLJUhcfI3s/UFoBLerI2h3zcEZHSLND3VTU790raptd?=
 =?us-ascii?Q?iBtkthWdF8tza9F9gblaB+Cb/OyQTQkV8RAZMLS8A0+7somo/nw3VNrC9DmM?=
 =?us-ascii?Q?tvehV6cX5IpcTZh4+jP7c5+oXsc8TwnTKTHNByAwxqUDeALcMFlvIYOoEkr7?=
 =?us-ascii?Q?JEbbYESBUkEFPKy8wP69+FDj8x3rL+ju6Eg6tXDXYAsHr4zKCtblOdp5AQjE?=
 =?us-ascii?Q?qZNeMyqiTbm49iP6wTnkdTdAyMMEub12zajIO6KafgKX67ZNhKvGYqRuqeax?=
 =?us-ascii?Q?bMdRqeuXEyv8888RCJmxFgAI?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e09bea4-791e-4180-e5d6-08d94590f1d7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 23:58:28.5870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sXioWNkqtf48G056hK65v2hp1pVfN4otDpzcieOmtN1SKn2IJkiW6N5TUOmwvulsvYo2SHxv0gZfzB/sEPWm5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2598
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10043
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107120162
X-Proofpoint-GUID: 5ZH8khKnzz_Qeb5fhgkFSkus8Rjxlreg
X-Proofpoint-ORIG-GUID: 5ZH8khKnzz_Qeb5fhgkFSkus8Rjxlreg
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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


