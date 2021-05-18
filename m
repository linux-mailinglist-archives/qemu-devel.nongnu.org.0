Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BD0387EA0
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 19:43:55 +0200 (CEST)
Received: from localhost ([::1]:56400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj3l4-00037i-DU
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 13:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lj3ig-0001Bv-B0
 for qemu-devel@nongnu.org; Tue, 18 May 2021 13:41:26 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:27780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lj3ib-0000BZ-Ic
 for qemu-devel@nongnu.org; Tue, 18 May 2021 13:41:26 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14IHcL4N005918; Tue, 18 May 2021 17:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=N3lnBU0DVMN1a7wUdIt4PKTtvtN1wbFHWZ6T/yjlXfU=;
 b=fFVDiAxbkmLLUoPDQ0ipwxlV042yBXCWnQ3q2aA3W8swtru2E5nysCs/VOHTL3q0G89J
 yqfBAmYyRuVBrHqeiCQlsGS5Pzzg1c0nFfHw94d+BQUCzmTXnX4mqdHc/inxORKCX4IR
 W/DtC6T92ptsrBzvLAVKknqkuDJ2D49TK64b31VlvAVrJeQwpT2HnJv4q8NWVoxBk+Bg
 XLD17VAt1iS1c72Th/RmY8WyxgxjMCTC6NhcB1PS/N6Lfp/pfp4OICE0JsPrlu32phiS
 kqv7T0tsH6w1JKP4uUAnDRC/b6ieZOSDlCM5YSWHGEMCs7+BV7I6bxuaKxwjpMdZb5cF JA== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 38kffu0s8f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 May 2021 17:41:16 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14IHfD5u175976;
 Tue, 18 May 2021 17:41:15 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2040.outbound.protection.outlook.com [104.47.51.40])
 by userp3030.oracle.com with ESMTP id 38megjpmfn-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 May 2021 17:41:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VOLv7U5qBCbzOSze9W6aja3zwosZb0JS/5bnaIc0y0fqduGsrPraB2gPYTNWGju0dEv2ZdZwn6qpo6REgj3BpiuSXmRD8VhvuToXzcXYm2xnb48nFHE/+XB1ijRkMb5eWnPAkY6smLgM3Ng/6Ds7BGt1DDGLBQYBa+OqKnF395FoKKJUnn83mDBCN6czK02QIIPhruq73q+h/Q2oUZyU4LYX01XzUOef6gdaMa2b6Jao/zd8/FPVItF8SSgs6iAxjiVnFQjzrJUbDDFh9ri4Sdy2nmKYHdaCkvm4aeGAyQye0OgBrrqTjOcA5Tt8L5by1kRTGYC7b6hw0Kmjv8ssIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3lnBU0DVMN1a7wUdIt4PKTtvtN1wbFHWZ6T/yjlXfU=;
 b=KiH8X8sUqOmqCBBX/IQzxhmi+qIQYiq6/vFUQLYmcKUrnE9Km7YhIa0TjRepkiDAuvKMgZQyhL52ZRqBzFkBppT/QkfTDkIxM1JnQmY/nILv8XnN5nBNeIRIRkpsyG1hNOSOvonIiSFXCWEPa9Lbbsawi3dNIvuRY2JCUBClVlJIIGOIqe9vz3COFUearXrzXIhI+WNqVNn/6Gdfp9xLJDAVKjTnRB1XjHNzSY372Ywxi605q9rid97fY1F9TALMvNmhOMu2pZlOp9yYlHL2IkjR12TZDHZqLCIvRP6cDKYsF1iJMUM7LfTrFo2IAD0Wo3aIMHug+S4k2f5aQFNArw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3lnBU0DVMN1a7wUdIt4PKTtvtN1wbFHWZ6T/yjlXfU=;
 b=S5sHp2hBLWHpc6eI2qTSGNHwbJ3Y6jEJPM9KiMwkJLHGuli0dtJBAr+XYOg9EUTWtSzxPGe1hEFy4YyTRJujeji/mk4J/BgWxPk4vIYSo/Mui+RJCdw92U3qBCvGPaw9VflL4+JH9YxuCWdlAg0+J35Nw3JcexgxsXd5idRS78I=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BY5PR10MB3812.namprd10.prod.outlook.com (2603:10b6:a03:1f7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 17:41:12 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::18a:7c1f:bf20:ba6c]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::18a:7c1f:bf20:ba6c%3]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 17:41:12 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] msix/hmp: add interface to dump device specific info
Date: Tue, 18 May 2021 10:41:29 -0700
Message-Id: <20210518174130.9381-3-dongli.zhang@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: 022c4d39-8148-48f0-d6df-08d91a2420d2
X-MS-TrafficTypeDiagnostic: BY5PR10MB3812:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB38129A2D38B88BEAB41E8024F02C9@BY5PR10MB3812.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:183;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LZoPWzS9nKjOkDTuLI6NitFChHy/6Z/2CWbipNhWNGQCwuUtul/0T61gXQcB9QwoxW8QHsZSsg9p5sWW9kpacgNZLakbx+ziIL0p2B9h5efx2w0hoz2NUidAe0rQeoPPJx48dxTIFzsmGfiPsbVCG5n6+knjlJHryb/JK1ES8v6nnE558Yr7W5LWnZtwUeQrKUehe/FxernNXPBMAw5NFLKQOkpD8Thbs2cdwokYAjtE3DAMsnxRMvvXRrdyoMKN4K9YsbomVQb1Nmo52ms7CVzcWWQC8fpU7akb+mpSEQb5Lpj3k4a2ntbuo+74odpFHo2msLVtFmvBdJnwmP3LOuPjCi6M7d6Va7aduEXQm7yUuMyrs2RICe+i4DpG7cEf4mCp50QMFg7G10Okc69DuWYTiwj0qTkUUsdBG3Bu1I9Hby3uK0SDyiy7DBsck+OJU2zVe5FCr5FrRlCKkygL7Qj5gMBIvb4TLAME0wHViVMSa9d2tjel+DwJZqbhn1za24xQk6kmKyKIjhwu9UZMObHTqkH2OpUHRhXZrE/cfF4qeb4BxLsRJEsqmdkuuswme5iaZSV8Wu+KrOhw/OBtD20CpOL7wO+tPteuTEzfhRZvWN+6ZhViTq8cNEXIbCZhRuRPZwzixV7BKdRSl3R6B/79nRX+Pfx9UCTvzxgIA+Dbg4/E3OMdUhepXNzIlx73
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(376002)(396003)(39860400002)(136003)(8676002)(5660300002)(6916009)(6512007)(186003)(38350700002)(16526019)(38100700002)(86362001)(6666004)(4326008)(6486002)(6506007)(2906002)(1076003)(107886003)(26005)(66476007)(478600001)(8936002)(52116002)(66946007)(44832011)(36756003)(66556008)(83380400001)(956004)(2616005)(316002)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?qncKxYbhqYXr66ER9tSZzzf3ky1G1RmhAODbFaqp2CbPkI0LZqny7KKF+jCW?=
 =?us-ascii?Q?r46ISh2Aqix3BplWFiwFtfDc41OuCupxVqsoh0tL2/mkvIvkAhPNqgbVUVn7?=
 =?us-ascii?Q?Bq+1MQU5FmHJYnamHKnfrjbuzRBtEZVZR6Nq3D9TEna2c4gCbo3OTKjq8/bJ?=
 =?us-ascii?Q?QpsyFSm2vofDQYVfWQ3ib3HJP6GXnYFFycdRg9lFrqbBtE2nYp0chq75VEVB?=
 =?us-ascii?Q?ImPsY3+Hq1wojkWf4IXkTh91dOxUbw8O9Se1rSNxiY8+ZY/CMn+fWkbPQKY8?=
 =?us-ascii?Q?TPq0pCCjHAebeJ6aCw1KBtxtWzAi04+qSrJ7eDHMdpoCjmjdnHEg7RbeV5IS?=
 =?us-ascii?Q?qiD14ZkIJcB+HTht8W14Phg+o17ezTmWgafrrtOJYThC+TE2OjfaQakDujKq?=
 =?us-ascii?Q?tA9YD0g0FSiOjf+t+Yav5Z1B26UWqA0uYIHbD31aIBDhfpWz8smFN31ttM98?=
 =?us-ascii?Q?VJCwqT/QGru5lgO81H4f+JbWbbxbGumUsVBoFTkBfp31sJy/ngA2G9noU+U9?=
 =?us-ascii?Q?Gg4tmTDgjkL5ahHlrxihxghNcsEz7G65otMCMi1K/ClLK0xODxcV2pdvkoXI?=
 =?us-ascii?Q?Jr7hTVmWgequxv8nqQs1E6hFGNEiF9TJuNTsBzUDTP64Q5yAPsTGRefqOUh4?=
 =?us-ascii?Q?uRbAS1KyhI0D1A/49qRJa2cx1nqKXRvPuUunlljcCfQZ6itHu6HOK4vT6YPm?=
 =?us-ascii?Q?P2HqQPerQG0ujbAmfKPETbEwNgyo+uht5hFFdlCO4uHGNmQwt11TDru24jjI?=
 =?us-ascii?Q?D3tLdZfzTGAKjcp5u2XdLhXZL9/Z5IsCYEkSCbLe96v5KUhq1j3P1TTz6KTi?=
 =?us-ascii?Q?e1Qsoh+tdLYdcyetmMSSo+079X2SbNYNJwsgUDuidk0q0r4ELgc0+zSBtmLK?=
 =?us-ascii?Q?SbbjU1gnR9lH70CLQm1ZK7pjsbAgE32rNQLNmqYd1adP4+InlhXL5pJOtYyN?=
 =?us-ascii?Q?+1FkQrtso9KakpesLB45QbJYuf+qJ2ugGWGrkIVLi0Yyu4Fv+xQpD8nPhhBw?=
 =?us-ascii?Q?stXbF2WG+9jFuxCzU5rT0QQxmrV/exyZiPNGYW6Skc7GYLE18NtCI+ZSoLaS?=
 =?us-ascii?Q?tG3y04KN0XfkXA9aLzKXXPPLEY2LQk6tCgBpyhOZUqi0F6M6ve6wf1SwJ+W8?=
 =?us-ascii?Q?yOg6mzrYHbXfR77E9Is7V9cvgaij0+eN/232+3Rl3usRu7RQXvI5Ub0pAUuW?=
 =?us-ascii?Q?sDAm6fTVuZbu5LnZlok3GZHkAjxeFFM5U5zzhA75/KjEhOuEnEHZccUyde4E?=
 =?us-ascii?Q?4rqm6D/pSaplA5OiHkA7VUjk4BKoypV6Vax32epu2u2ASad909J+3qRZnWuC?=
 =?us-ascii?Q?y0hIPiTOccZ1Skz9nveRbn/f?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 022c4d39-8148-48f0-d6df-08d91a2420d2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 17:41:12.3677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X33E1v6tGnhRXhJAMgNXwRZ+juXJdG+AsE6hS1y5rbYGJ5ABdK0c1QjokgwaTgN2qwjUqc4VET+73fh1drJ+2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3812
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9988
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105180122
X-Proofpoint-ORIG-GUID: 0t7EStsmIdf6A6bgR8AfS7IA0apPFNbN
X-Proofpoint-GUID: 0t7EStsmIdf6A6bgR8AfS7IA0apPFNbN
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
---
 hmp-commands-info.hx   |  7 ++++---
 include/hw/pci/pci.h   |  3 +++
 softmmu/qdev-monitor.c | 11 +++++++++++
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index cbd056442b..df9cdc6c7e 100644
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


