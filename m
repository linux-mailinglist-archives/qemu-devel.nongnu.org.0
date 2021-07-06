Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9198E3BDBB2
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 18:54:26 +0200 (CEST)
Received: from localhost ([::1]:60572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0oL3-0002rF-Jh
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 12:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oJW-0008WE-1y
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:52:50 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:45854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m0oJS-000829-Nh
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 12:52:49 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 166GpqJh030622; Tue, 6 Jul 2021 16:52:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=3v7mR0c/TZn+nw4f84C0Hsrw2waiTd9GFtctahFgwHI=;
 b=WvsaWIJidu2Byvpqs3a1ImKahaKUxEIQDCzNuF95s1LKV6tT2bVnCJ1MhEu8WQA6ciB8
 o67n7pST3cQBZK0l9baXcKh5bp9NJ6yAot2m/fcnkb1Up16OqSBkBM7PzCoKDyEjrNBt
 UP4RzVeSNAQAPBz7bwCdYvy/e8f7j2SyShz3PSjV2EA7aWh0dE9zbkABO/dnJ1mRKZWo
 RB0JkV7gxvJWe+ZnPPemzb33Ts+wEbwfJhp+gRUygKZ0EpE8MgTL07YxHdG1zt3je7kx
 iRBL0quf8ZeaqkCarxCVQN23tNQvMz/qZI54OzsvMwRotqptpp29kBWfpnIEaj5A1eYv pA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39m2smjaas-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:52:41 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 166GoUNU084689;
 Tue, 6 Jul 2021 16:52:40 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2040.outbound.protection.outlook.com [104.47.73.40])
 by userp3020.oracle.com with ESMTP id 39k1nvcpph-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 16:52:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tyc32LtrNN++BmEv9dParFbemAjKgo8aqj+Y0fGmkrQeQTIMCPrFNnCb3EFAJobUnMY2z2MNFTYHtlwlUS9WowbyFtN5TX7m0w+yZG6b46wFBascngVMrN9cDDByPxz51sTAsZEAXL7YeaFJ5tZFMR599rF31vnkHhyxiaO+93uM+Hiff/PeeK2TVGqTYAUuD+QoSzy+b7WUi76/4DBONMKs7Ikggz1v2tyD646m1KX8qEYvJgFsRnUeRg4IJbsToF4S4zpzjdBj3i24KM18GYFoihjacrakgkmi+YcAvzve/vwsVpL8Gz6BvHlucoAYyzx5X4POuLFuG1Ld1W6l2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3v7mR0c/TZn+nw4f84C0Hsrw2waiTd9GFtctahFgwHI=;
 b=cklHtorDLgTottQ7wxG9KyYBPhduC+VJQPpK8MZkaF1nvpYyDDWcUujQ/ZIP5wlNeXW9z/4iC1AHcb1nNZ8+3yjmvV66BmnAkav2+2Bd0yrtNFXvGjNZ9Cl14MMeLACP1GjMndcA0KED3wujSd0/uIwf8hWqScPdhRwMX5VmtpzH0CJkpPC4YHH+eKwz8HTdTuFZLJB7MGF6dH3ji1m+AXmziu1x0h/b09dvQLOFwgEBzlS5cVTwL2DKvRIzUiwblhv04eCt/P9y+t2+bq0kDj1uKW4/PfBA8DHj8bfg1faCbI5YQcvWaGtQUZH0maKFh6g05OZ5rHzOBTVv4MQw6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3v7mR0c/TZn+nw4f84C0Hsrw2waiTd9GFtctahFgwHI=;
 b=JaQSg2p2LU+XIgJY5UT2u1Io7vixAgFUi+mnIdu0NqO0NfRPSxazf7rCQrYpF2tx9ikqYrpOGNWcLvFbM7Ti2YWn3jO15kGnJbeOAOQPjgoF5D9jHhvUrr19MgrJ+vPWFJV+wB1jg1F9+ZQu5epDNhgM70H//89vSeM726yTFSU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2982.namprd10.prod.outlook.com (2603:10b6:a03:8a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19; Tue, 6 Jul
 2021 16:52:38 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::59e7:5c8c:71fb:a6ba%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 16:52:38 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V4 01/25] qemu_ram_volatile
Date: Tue,  6 Jul 2021 09:45:32 -0700
Message-Id: <1625589956-81651-2-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1625589956-81651-1-git-send-email-steven.sistare@oracle.com>
References: <1625589956-81651-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0201CA0041.namprd02.prod.outlook.com
 (2603:10b6:803:2e::27) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-dev63.us.oracle.com (148.87.23.4) by
 SN4PR0201CA0041.namprd02.prod.outlook.com (2603:10b6:803:2e::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Tue, 6 Jul 2021 16:52:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67a0af2d-5c43-49d9-ceee-08d9409e765b
X-MS-TrafficTypeDiagnostic: BYAPR10MB2982:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB2982F5374C6FC38BD062A4F6F91B9@BYAPR10MB2982.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:328;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e7Qzkov1vspPCYwpMhSs8EBOf+bNe5GhE5J462DBYvLPXzXe5UKwt1Fy5a//3zwQ5eOORLBiTe7sfKmrAROkjMBMTvupoo+CLKhncDNYmDwg1LpCkgm44pqSGFS9+M55bJbQvJQmPU+tU6xRRCkr8pQ2CM5gGq/7Gh/7a8TkydS1JGKbXfIdOzDEZN6PcMhOqZaQ0cKQAmOGLkcdFKCk10qE2d11SPnD87g9RPrxqQwyBLsor2Yx/4GSr8TFCXKR6lf2VqJAwyyZ+CKXEFaTsLkh02bHyS6yCCcNIBBVAQKMkyWk41y/GKzCavKpp1YKQg0+2al52SQKrj6sTj8F/Gvjl7aa2XRF+B1ImZ2td4y7AEBseChKfjh/qWT0osgDYlEZmCP6j436ZYq8zFjPLCYRZNlyk5UUN073/DSJeE1i/UN5M+3oFZiFlKUQPQJ3TavkL0jk9xk24rN1NjxZisSpUPqqGDvkQZDCDWYKWYjritIlkjaHDbqrSk3iE/s0q9kbMfDi0scuqGCO/NEWPtRoFODImojD3z0yG4Ly/JJYW9AwQkcz6F5oHC+DBjtL+S6mpSyzrl1I5eP17td4w6smqZ/A1YipgzoPrzS9ECIrkWxDQqLqDVSbQGqrjTuUHoRggXc3d+1zbr6qU74K/lpPH7HzX3p6AN6EoTDJjqnMtC/i3XNEOvVSEbgbdEkJrsnInOhOBoFD9Y/T87sKIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(366004)(136003)(396003)(376002)(956004)(8936002)(83380400001)(2616005)(7696005)(316002)(52116002)(6666004)(478600001)(26005)(8676002)(38350700002)(38100700002)(186003)(36756003)(86362001)(6486002)(7416002)(66946007)(54906003)(2906002)(107886003)(4326008)(66476007)(6916009)(66556008)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iVcfgg5SOo3ByGNTz6eQvD43PZ+hzeFwevgaHg2O0MAZdZa6Av9fVH+LLSNA?=
 =?us-ascii?Q?z2igS/qNZQHrooHWtet9bQhZ6I64wUxqDh4fmYi69Ih5SICRDrRdMnRV0u1V?=
 =?us-ascii?Q?SDWUBwxq1lk+BtscIps1BgfnxIme22+7WQC5sPanMpzIgkihAL/ETGgOzcm4?=
 =?us-ascii?Q?Ypptk4qGHooyTQQwUDOeg035KeBZYR+LFtprLK99N4K+7jvP7+vJ9VfanaRx?=
 =?us-ascii?Q?aDtUaSBLIo2fARnTjlLeASULYZLvcXh17dzNeFIj3scqEjkGMOfxZK6/cX6B?=
 =?us-ascii?Q?YpsppJZYzV2CdFmA3PhXfVGee+mjRcwqD2c2M7LZZw9TkyPSMCA9i3l8FeoT?=
 =?us-ascii?Q?y7YE8SbRQbb7dxw1uNtzaEIicE0h34UsV0NTZnRRSOqF/SuH5ijDim241Bxd?=
 =?us-ascii?Q?0+mkKRMXhnUeGr82TCVwb0bbsle5qCtl5Iqk6AbY42fjoLCq9K8cavZ72Urb?=
 =?us-ascii?Q?bnOSpq87jqbG48cYIr650u3903pQw+z/pb8Mdkl8Y7eXl4c1WSdWju3pYjXN?=
 =?us-ascii?Q?I0sFnMkpMcZENGoR155FGqED4BaSA4rTVjE2GBfyPrr825uzxRn9CezlIWPQ?=
 =?us-ascii?Q?KeKxSXVWKnlkgfn5Dkq72TGOyG2QvH6NxGxRqcGsH72j/He1Pa+zrKMe6lY0?=
 =?us-ascii?Q?63IYyQJSg5f9DIuTdJSNj81v1lJfHxR5ZKMJ9K0aK0a0GVcMvESbr5Pive3b?=
 =?us-ascii?Q?zBgxNqLnoPsqCr0ZnA47TeZeoSSv/eXgiNrHzDHzEf3akC64XO5PDk0T5dVh?=
 =?us-ascii?Q?hLB6hG4cW7VMtlSSifh7mB0XlQiw6Ohse2pSIvSNOu36n4f/2Xhvjwy92HIB?=
 =?us-ascii?Q?lZr014PNn0gfy5ncCcobGqxpmf3bO4MayvyOFt2wyr26zoT+9EkK1jugD5GG?=
 =?us-ascii?Q?ZbaZEDIV+gQrlH1Ff0M5uIgph6ZjE562w0jc7c03Hpqnswcjtfu2i+tciPRQ?=
 =?us-ascii?Q?zrBwifOT7fFUmiS5fd/wphswzB4ZOOZXpmS6R9AsFLsTtlYTf9ljMKZxkJPL?=
 =?us-ascii?Q?1k/JkFWHOOZyYu2LCiUaA5H3/YuG58YqW7qWe2JZpI/pUAn6X12Z/k71bo1j?=
 =?us-ascii?Q?nZ8kH+E2akEr3cVadambdzZi/zaaooyLboIyAjUavhOg8/67uzV6ViLL+41G?=
 =?us-ascii?Q?RWJlG+47uxJZBS/6CXYJJRXEqBq4YNz3uaF4ITSsxOFCqRAiEroM1NraQP/8?=
 =?us-ascii?Q?xMo/J7tU3kg+O7CclVH3mVGRLzYs/xHfGe24sj+XM3c/snMD/MxQllz5eW2i?=
 =?us-ascii?Q?XIBo+mb18pRd2eEz88Oo0nz/AzJdA1TjriY21Lo2vh5RadqYotATBxTfqGz/?=
 =?us-ascii?Q?nmG4/Pa7QJMcNlBOgI0SCeHz?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67a0af2d-5c43-49d9-ceee-08d9409e765b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 16:52:38.5653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Xq02xSMNKGfSEPFAfEUCT2DGxVn8uochSdwAna6wkaXY6bpkwiuXA6gm5n2/8cHpFBQUl4AVYR/zKVowJh2dhcbaD0kyyMoGv27nTo9I1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2982
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107060079
X-Proofpoint-GUID: 2gNvgA4cKogaL0eSpQkb-M47lxX9o23i
X-Proofpoint-ORIG-GUID: 2gNvgA4cKogaL0eSpQkb-M47lxX9o23i
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a function that returns true if any ram_list block represents
volatile memory.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 include/exec/memory.h |  8 ++++++++
 softmmu/memory.c      | 30 ++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 5728a68..e8b71d8 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2629,6 +2629,14 @@ bool ram_block_discard_is_disabled(void);
  */
 bool ram_block_discard_is_required(void);
 
+/**
+ * qemu_ram_volatile: return true if any memory regions are writable and not
+ * backed by shared memory.
+ *
+ * @errp: returned error message identifying the bad region.
+ */
+bool qemu_ram_volatile(Error **errp);
+
 #endif
 
 #endif
diff --git a/softmmu/memory.c b/softmmu/memory.c
index d4493ef..7197559 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2707,6 +2707,36 @@ void memory_global_dirty_log_stop(void)
     memory_global_dirty_log_do_stop();
 }
 
+/*
+ * Return true if any memory regions are writable and not backed by shared
+ * memory.
+ */
+bool qemu_ram_volatile(Error **errp)
+{
+    RAMBlock *block;
+    MemoryRegion *mr;
+    bool ret = false;
+
+    rcu_read_lock();
+    QLIST_FOREACH_RCU(block, &ram_list.blocks, next) {
+        mr = block->mr;
+        if (mr &&
+            memory_region_is_ram(mr) &&
+            !memory_region_is_ram_device(mr) &&
+            !memory_region_is_rom(mr) &&
+            (block->fd == -1 || !qemu_ram_is_shared(block))) {
+
+            error_setg(errp, "Memory region %s is volatile",
+                       memory_region_name(mr));
+            ret = true;
+            break;
+        }
+    }
+
+    rcu_read_unlock();
+    return ret;
+}
+
 static void listener_add_address_space(MemoryListener *listener,
                                        AddressSpace *as)
 {
-- 
1.8.3.1


