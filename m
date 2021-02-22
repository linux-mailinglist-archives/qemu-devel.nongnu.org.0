Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA41A3212C1
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 10:10:33 +0100 (CET)
Received: from localhost ([::1]:37864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE7Ee-00043h-VH
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 04:10:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lE7CO-0002GG-D7; Mon, 22 Feb 2021 04:08:12 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:55504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1lE7CF-00007x-90; Mon, 22 Feb 2021 04:08:12 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11M94whW093975;
 Mon, 22 Feb 2021 09:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=VC7nF3KiLB5cOIwb4YyWEnRvo9aA2SkRKNUfweyCJhA=;
 b=J6FK7jGzwDlopHWXbV1qlk+wNEyY45zqJuwLb6PKRWH318CtFuvfyFOHhpWOjnF9v0Rm
 bBdAHdzCSNAdlEV5ezKUNnLKgAXqEXSX0oQGVl9TEN1OWHpcKgt7TRKRzJXKSwAmLr69
 aE64ckJD6zdTB8t85hVGpAcrFaLhVGXzJnwuK5vmfFq1VJXJYMFI6MsjVfcE4dnnQCxL
 P9qiqJ/cUZHFaEAXx4MKRCHD5pSr9p/eEs+XHGZkBCNy/Oj9SwutsKALwXeykyGQ1FXC
 3bF7PfgDHBqusk92nFJoCLYIQdxD1URkiC85qauA8bw81N+bQ+MrpkOGMIof+eSKhzdW Qw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 36tqxbaxu5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Feb 2021 09:07:58 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11M960cQ181046;
 Mon, 22 Feb 2021 09:07:57 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by userp3020.oracle.com with ESMTP id 36uc6q2xgn-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Feb 2021 09:07:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nNpywqHQmsvsw6YJFLQkpftObHotV8B1BNR9sytE2eAegnxbBQQtIwfF47pLjiP62NjAtCRboEbPdhbt97LizY7noYwkwjwam18z4Op4TuuFmE5LESlvq/Xl+QApCgSkkufcN9ujR66RrX3jHv82AapvBWea0E/iJ1Qt8nTOpkiLCjV4gdlZHBT+BkIz+Mqm6sQ0acRRN7hWtGsjrGQuJQKcJIu3SkM/dzNdhAoymiEgn6gRlwROq4MlMi9DhQVBbDn+6B+OSOdqqueLxvxObkpFucADWEkBYybklw+7igUUhQ0ZRpOob/ViztAPO52u9022YXfuQ1NdSiOGLh8euw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VC7nF3KiLB5cOIwb4YyWEnRvo9aA2SkRKNUfweyCJhA=;
 b=L/brdrciTLOsI0bDVE53moClaXks47VxrlJMcd7gbeslfIX2duamVDsvV45+kBCftRATQHahzxyk/Jqa2yg9ldnpDVYooZH2QP25BPVoMJw9kWDkBg3nAp1Crwml2VBpv/T9VLhNp5Uu+qhMXU8hUGxh8aB+9AsGG5f209iPgj1khzikF3l8TkSsSDq60g+lnf/H0Atyf3geMq3Yl/kUcBr3xJQ4jxNJfP4uVMIwEfzWO8J3bNzUOWH+gK9dLAbwwxmvplpHX6mbHUjW8oiC5gRshHI2dOlTaxpSTBGAi4StJSiSrI4Tn6l9ejIKA59PJG5CrxLoQEH4AabphbOTtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VC7nF3KiLB5cOIwb4YyWEnRvo9aA2SkRKNUfweyCJhA=;
 b=Rdjnqhoa6tTOtM/C5P+5TFF38SlVXVSv+/Xlut6BTGA4/91yLp3F9j2d9CevqDpAvOZ1q7O27N0Js4vDlJnpwdVlTgrug+aK2Ja6q5aOnCsmL0ggsOmR/D/8aDHXKPkfeaKmxb3c/1N5BL2OQMJbzwTeBZUqLC4aske8oOwozG4=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3148.namprd10.prod.outlook.com (2603:10b6:5:1a4::21)
 by DM6PR10MB3227.namprd10.prod.outlook.com (2603:10b6:5:1a1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.33; Mon, 22 Feb
 2021 09:07:56 +0000
Received: from DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934]) by DM6PR10MB3148.namprd10.prod.outlook.com
 ([fe80::f871:5965:2081:3934%5]) with mapi id 15.20.3868.033; Mon, 22 Feb 2021
 09:07:56 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 3/3] hw/pflash_cfi01: Allow devices to have a smaller
 backing device
Date: Mon, 22 Feb 2021 09:07:47 +0000
Message-Id: <20210222090747.2310104-4-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210222090747.2310104-1-david.edmondson@oracle.com>
References: <20210222090747.2310104-1-david.edmondson@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2001:8b0:bb71:7140:64::1]
X-ClientProxiedBy: LO4P123CA0384.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::11) To DM6PR10MB3148.namprd10.prod.outlook.com
 (2603:10b6:5:1a4::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from disaster-area.hh.sledj.net (2001:8b0:bb71:7140:64::1) by
 LO4P123CA0384.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:18f::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.31 via Frontend Transport; Mon, 22 Feb 2021 09:07:55 +0000
Received: from localhost (disaster-area.hh.sledj.net [local])	by
 disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 0bd868dd;
 Mon, 22 Feb 2021 09:07:48 +0000 (UTC)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1950641e-7855-4e02-f242-08d8d71157cd
X-MS-TrafficTypeDiagnostic: DM6PR10MB3227:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR10MB3227CA531F8EA9672F3D0C2488819@DM6PR10MB3227.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:644;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sg3OLKp1xVwcT0kBq/Pv8LoNC7k/x4iA5EFhyeJrV9zNqOx6Px4yN2eNOmeIuxLJeHwp2D1/Iag22P+VZ1h0/hYaaX9itPpxgqg5niThl3iGfJKG0x0oFcqQsdgO1MbfjVR3Skq0fub/jST2762E768hD8W3l+BTdhcFCw1MrVHW7FiPeiKFxBuk7SrN/FQFYa/e+unqZvFYZEuFDmD83OdgpSa/3aQ4IXAAHjYWttMWAPJQI8hC30fChbSuwe6eMYciCmm3kojpg8MOpnlhALJCanUCBPVitqY+uvbAbBhUCa9jvcJEpOYZfBzbMMjRvkEl9KiVkgspqDsyLg3wFiFPt/qAjQXHPI+bauHsZX1ngB68cQM3gZ5K+SrruKleVlDSVf5CKJda0OdTihH2vEbJjUBkf4o1j+db0IHufRXuYUn3Tpi5tfOzyVognU5gNJcy4rkGry1xcBxoUr2K5K3tS9EbSwlzLX+FTO8s9UvEBSm0zxzyACkRG2UpaBbaj+7lID+eukS2zzptWwFLBw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB3148.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(376002)(396003)(39860400002)(136003)(54906003)(2616005)(52116002)(8676002)(83380400001)(5660300002)(36756003)(316002)(186003)(44832011)(66476007)(107886003)(478600001)(66946007)(66556008)(86362001)(6916009)(1076003)(4326008)(2906002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?eUbXivLI81pzTfxHIiD/pnqiouHxBQR/hNeNTE5FtgVabskw3iA/NA1SdFNk?=
 =?us-ascii?Q?8Ey2SxoJXbr8svgEjy89OfLLK2TY0ElaoS1VpjrBIJ32FlkW4uw6lLQDLxvW?=
 =?us-ascii?Q?sp84jvVpn5en1dtOhuaefPTqIzeQjRFtN/mzE+E89rotlOTFt9YdF9lyQQGD?=
 =?us-ascii?Q?ncHgiYCT9S8AUfcYc/0ibDFj7AJqyioct6/7+YqBtM3xdgRgHIQ4k/StguQY?=
 =?us-ascii?Q?8YN+xqUXR+GHRfMlk63J1tPh8n9LIt8QfEFD3UMlUsThlL63+jWg00mVhNAc?=
 =?us-ascii?Q?i2/x+jM3dwQtHoXVGwWl8itC+cdJtMHSEnlNqrK7Yj+Neye+H2Fa4hlUEH25?=
 =?us-ascii?Q?KMhldd5wuOfGUTOITauAdR/L7VLhdfzE7SnDH87nzbpb1SJun+58maom4LQV?=
 =?us-ascii?Q?INSAnnbsMqyI5uylr+kexmKHQ8c1M23m9jk+us/0csjoaQJgxcFTS23I9/uS?=
 =?us-ascii?Q?Z9NbFLPp4euEW1XOHikL+5O0uIgABCUdkhUE5U21qEvl86nhlS7Ia7Sq6b1e?=
 =?us-ascii?Q?9QJWANV1nLFLxuith+bBdK4GD/kblDhi0TeVrYPx4vccTCaXkordGGp1chOq?=
 =?us-ascii?Q?3Xr7x87BP53MZ8/9ej3jejn8/jR3vtv5wLcpiOny7fyzE9dVj00b5BKCkN7A?=
 =?us-ascii?Q?kI4z6YKdNae3Dv7ixZI0oxmSDSgroQWAxNS/9uIbGvNjKsjHgY881RC14BqK?=
 =?us-ascii?Q?NeUIoVyMxytE6rA0PmqT8PqLF+oq91tIC3W/HWLbuDv5OaDuaonwvpE3VwtZ?=
 =?us-ascii?Q?FiN0DsU7Sdv9E6IEEvYDAIiGHD+80/RMr4E7lTWKSZzzYUxbraIa6X/AyQdf?=
 =?us-ascii?Q?O4uZlUnb6qBO9yZ+zS1cQsioEQ62J7uUdYO+J0K0FYl1TOBRQ+5WDJh1J/OG?=
 =?us-ascii?Q?yCiSnRVe0uB9/ENazTQV+9mnuBPYFvTDI3Gg1UJXQBy7rSj2zYd83APjBkLX?=
 =?us-ascii?Q?Iatu8AOEZPCMKI6cyI+bWZBRgIRpRT6kKzMd9CLIGTUR16FwIQb6cdl2BexC?=
 =?us-ascii?Q?A/cWaQNmeCOwFiTcjUYLTzNAu3SQqhgrvY5O1N82UCHVVnSfwGywH8blbc12?=
 =?us-ascii?Q?ymUFhLDrW5zwCmHv7fimx3BO2JXzvZDrxUSVPJwmbVfKZ3ZdZ769UGN/B7kh?=
 =?us-ascii?Q?/HOXSHqBckjYhj5YEkyL/qGuRErpa6js7Jsh9rRY9cY2hEVxH0bG+2zJfsum?=
 =?us-ascii?Q?E0icciIb7Ht3MJpKZ0H9pb9PoBwH9e5pOWoR5EY7B7WEHX3i6z3RoFD6jvH3?=
 =?us-ascii?Q?y+b2Q+fHOAGpO8DDt69t7FFgrkaIlIx42P5Wv+l/hofLGlBvNjXUqWo7isdT?=
 =?us-ascii?Q?8aqLovZCxYDfxfhovHLCYu1gL45K5JdwCfzw/lo3SaC0dw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1950641e-7855-4e02-f242-08d8d71157cd
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3148.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 09:07:56.1455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TNCE8Vc7KJQl+fXBC3CdlVLAYilSxQ8bWCvjh7j9Q8Fde4QgNP9sPVVaDKeGTLR44tDhDMoldlwflTqrSaJ6qK26FMKqDup832Y2LiAeshE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3227
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9902
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102220081
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9902
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 phishscore=0
 mlxlogscore=999 malwarescore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102220081
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=david.edmondson@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow the backing device to be smaller than the extent of the flash
device by mapping it as a subregion of the flash device region.

Return zeroes for all reads of the flash device beyond the extent of
the backing device.

For writes beyond the extent of the underlying device, fail on
read-only devices and discard them for writable devices.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 hw/block/pflash_cfi01.c | 108 ++++++++++++++++++++++++++++++----------
 hw/block/trace-events   |   3 ++
 2 files changed, 86 insertions(+), 25 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 6b21b4af52..94970816a6 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -83,6 +83,8 @@ struct PFlashCFI01 {
     uint64_t counter;
     unsigned int writeblock_size;
     MemoryRegion mem;
+    MemoryRegion mem_outer;
+    char outer_name[64];
     char *name;
     void *storage;
     VMChangeStateEntry *vmstate;
@@ -425,7 +427,6 @@ static inline void pflash_data_write(PFlashCFI01 *pfl, hwaddr offset,
         }
         break;
     }
-
 }
 
 static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
@@ -646,8 +647,45 @@ static void pflash_write(PFlashCFI01 *pfl, hwaddr offset,
 }
 
 
-static MemTxResult pflash_mem_read_with_attrs(void *opaque, hwaddr addr, uint64_t *value,
-                                              unsigned len, MemTxAttrs attrs)
+static MemTxResult pflash_outer_read_with_attrs(void *opaque, hwaddr addr,
+                                                    uint64_t *value,
+                                                    unsigned len,
+                                                    MemTxAttrs attrs)
+{
+    PFlashCFI01 *pfl = opaque;
+
+    trace_pflash_outer_read(pfl->name, addr, len);
+    *value = 0;
+    return MEMTX_OK;
+}
+
+static MemTxResult pflash_outer_write_with_attrs(void *opaque, hwaddr addr,
+                                                     uint64_t value,
+                                                     unsigned len,
+                                                     MemTxAttrs attrs)
+{
+    PFlashCFI01 *pfl = opaque;
+
+    trace_pflash_outer_write(pfl->name, addr, len);
+    if (pfl->ro) {
+        return MEMTX_ERROR;
+    } else {
+        /* Discard writes. */
+        warn_report_once("%s: attempt to write outside of the backing block device "
+                         "(offset " TARGET_FMT_plx ") ignored", pfl->name, addr);
+        return MEMTX_OK;
+    }
+}
+
+static const MemoryRegionOps pflash_cfi01_outer_ops = {
+    .read_with_attrs = pflash_outer_read_with_attrs,
+    .write_with_attrs = pflash_outer_write_with_attrs,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static MemTxResult pflash_mem_read_with_attrs(void *opaque, hwaddr addr,
+                                              uint64_t *value, unsigned len,
+                                              MemTxAttrs attrs)
 {
     PFlashCFI01 *pfl = opaque;
     bool be = !!(pfl->features & (1 << PFLASH_BE));
@@ -660,8 +698,9 @@ static MemTxResult pflash_mem_read_with_attrs(void *opaque, hwaddr addr, uint64_
     return MEMTX_OK;
 }
 
-static MemTxResult pflash_mem_write_with_attrs(void *opaque, hwaddr addr, uint64_t value,
-                                               unsigned len, MemTxAttrs attrs)
+static MemTxResult pflash_mem_write_with_attrs(void *opaque, hwaddr addr,
+                                               uint64_t value, unsigned len,
+                                               MemTxAttrs attrs)
 {
     PFlashCFI01 *pfl = opaque;
     bool be = !!(pfl->features & (1 << PFLASH_BE));
@@ -684,7 +723,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
 {
     ERRP_GUARD();
     PFlashCFI01 *pfl = PFLASH_CFI01(dev);
-    uint64_t total_len;
+    uint64_t outer_len, inner_len;
     int ret;
     uint64_t blocks_per_device, sector_len_per_device, device_len;
     int num_devices;
@@ -702,7 +741,7 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    total_len = pfl->sector_len * pfl->nb_blocs;
+    outer_len = pfl->sector_len * pfl->nb_blocs;
 
     /* These are only used to expose the parameters of each device
      * in the cfi_table[].
@@ -717,36 +756,55 @@ static void pflash_cfi01_realize(DeviceState *dev, Error **errp)
     }
     device_len = sector_len_per_device * blocks_per_device;
 
-    memory_region_init_rom_device(
-        &pfl->mem, OBJECT(dev),
-        &pflash_cfi01_ops,
-        pfl,
-        pfl->name, total_len, errp);
-    if (*errp) {
-        return;
-    }
-
-    pfl->storage = memory_region_get_ram_ptr(&pfl->mem);
-    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
-
     if (pfl->blk) {
         uint64_t perm;
+
         pfl->ro = !blk_supports_write_perm(pfl->blk);
         perm = BLK_PERM_CONSISTENT_READ | (pfl->ro ? 0 : BLK_PERM_WRITE);
         ret = blk_set_perm(pfl->blk, perm, BLK_PERM_ALL, errp);
         if (ret < 0) {
             return;
         }
+
+        inner_len = blk_getlength(pfl->blk);
+
+        if (inner_len > outer_len) {
+            error_setg(errp,
+                       "block backend provides %" HWADDR_PRIu " bytes, "
+                       "device limited to %" PRIu64 " bytes",
+                       inner_len, outer_len);
+            return;
+        }
     } else {
         pfl->ro = false;
+        inner_len = outer_len;
     }
 
-    if (pfl->blk) {
-        if (!blk_check_size_and_read_all(pfl->blk, pfl->storage, total_len,
-                                         errp)) {
-            vmstate_unregister_ram(&pfl->mem, DEVICE(pfl));
-            return;
-        }
+    trace_pflash_realize(pfl->name, pfl->ro, inner_len, outer_len);
+
+    snprintf(pfl->outer_name, sizeof(pfl->outer_name),
+             "%s container", pfl->name);
+    memory_region_init_io(&pfl->mem_outer, OBJECT(dev),
+                          &pflash_cfi01_outer_ops,
+                          pfl, pfl->outer_name, outer_len);
+
+    memory_region_init_rom_device(&pfl->mem, OBJECT(dev),
+                                  &pflash_cfi01_ops,
+                                  pfl, pfl->name, inner_len, errp);
+    if (*errp) {
+        return;
+    }
+
+    memory_region_add_subregion(&pfl->mem_outer, 0, &pfl->mem);
+
+    pfl->storage = memory_region_get_ram_ptr(&pfl->mem);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem_outer);
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &pfl->mem);
+
+    if (pfl->blk &&
+        !blk_check_size_and_read_all(pfl->blk, pfl->storage, inner_len, errp)) {
+        vmstate_unregister_ram(&pfl->mem, DEVICE(pfl));
+        return;
     }
 
     /* Default to devices being used at their maximum device width. This was
diff --git a/hw/block/trace-events b/hw/block/trace-events
index a715a2e173..85b501e23e 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -17,10 +17,13 @@ pflash_erase_timeout(const char *name, int count) "%s: erase timeout fired; eras
 pflash_io_read(const char *name, uint64_t offset, unsigned int size, uint32_t value, uint8_t cmd, uint8_t wcycle) "%s: offset:0x%04" PRIx64 " size:%u value:0x%04x cmd:0x%02x wcycle:%u"
 pflash_io_write(const char *name, uint64_t offset, unsigned int size, uint32_t value, uint8_t wcycle) "%s: offset:0x%04"PRIx64" size:%u value:0x%04x wcycle:%u"
 pflash_manufacturer_id(const char *name, uint16_t id) "%s: read manufacturer ID: 0x%04x"
+pflash_outer_read(const char *name, uint64_t addr, unsigned int len) "%s: addr:0x%" PRIx64 " len:%d"
+pflash_outer_write(const char *name, uint64_t addr, unsigned int len) "%s: addr:0x%" PRIx64 " len:%d"
 pflash_postload_cb(const char *name)  "%s: updating bdrv"
 pflash_read_done(const char *name, uint64_t offset, uint64_t ret) "%s: ID:0x%" PRIx64 " ret:0x%" PRIx64
 pflash_read_status(const char *name, uint32_t ret) "%s: status:0x%x"
 pflash_read_unknown_state(const char *name, uint8_t cmd) "%s: unknown command state:0x%x"
+pflash_realize(const char *name, bool ro, uint64_t blk_len, uint64_t total_len) "%s: ro:%d blk_len:0x%" PRIx64 " total_len:0x%" PRIx64
 pflash_reset(const char *name) "%s: reset"
 pflash_sector_erase_start(const char *name, int width1, uint64_t start, int width2, uint64_t end) "%s: start sector erase at: 0x%0*" PRIx64 "-0x%0*" PRIx64
 pflash_timer_expired(const char *name, uint8_t cmd) "%s: command 0x%02x done"
-- 
2.30.0


