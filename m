Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 402783CCE0F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 08:43:47 +0200 (CEST)
Received: from localhost ([::1]:39914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5N0E-0007jG-7C
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 02:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1m5MlR-0004Pv-SV
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:28:30 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:34690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1m5MlP-0002LH-PK
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:28:29 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16J6GHnA029063; Mon, 19 Jul 2021 06:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=DxoLnpKSJiheY0iFOgokE79+y4SVd9S5Gz8SOvfqQJg=;
 b=CATkaWCuUupXbGEvCouc7XgS3otZV1sZsg5akRQYQX4DVoupp1vS3jK9pHAJ0fS0w88A
 gorerFgnXmyhQ+nvEOYpALFE0yQ7+gNya+7moT2w0HhUKc5DFMCbm12MVhfuyu9iaT8E
 o1TxxKKiDRjkNfcqY1aVyBZ5yA8qNk4BJ67X3C9wg/UOcHgnouDkc3kX/TYgApvkkZLw
 29umidayqGPFeKhOsMuj8gn5wnmgcpmO5RwKGbjjn4mileOQyJylEnU7mX8Ge1hyajXF
 lsbbLOxDBu0PIdTEUQ+K3VLxbOtyAmDXX49/bKO0lkcf9hY3UqLsjRRS7r7XHVH+5SzI AA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=DxoLnpKSJiheY0iFOgokE79+y4SVd9S5Gz8SOvfqQJg=;
 b=aMEP6LRJ4O3Gm8att6cVGm9HFy+rofFPu+zn9WE3nT7nsO50mvxRKzqQ8kjc0AV9lW+n
 rJ8NVTssN0r4NCTNnkZLrwcvomBAqhAKeLuGOEm229u+iYUDPBUMnwZSzV6BusnDo96l
 KEtYUdtV0C0UGMlsfOZhoMdBbiRMnB3CV9Ck7tBC7qdf7U9Os9V3jgu45/zXp+zNRSer
 RGmsaq7wu7X9KQJLQe2/yZlQyPtLa1RLFe6cB/2CqfBRJp6XPrnhUr1LTah/KOyGb0be
 1TLuCAHE/Kf70CcWhzQNqBICI8PvWSqwsMQ+SL/vk7BogiLJRX+9KPtuWuxscXmOM4u8 5g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 39vpkwrnjn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:28:16 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16J6GMKR099799;
 Mon, 19 Jul 2021 06:28:15 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by userp3030.oracle.com with ESMTP id 39umawam46-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:28:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KKmw+ta4VzwLaqPgBjwjXKq++8y68E7H3qDS0bozYr1Dr6zwfXM8UTD8Tdy55t5Wi74DD/Ct+ZbewNTJ500iQqh4e525cGAH6ZI9X9/cv+lmiZRt3HJRIQvzl/lGJQ0VTbyjduvi0UflYoYC7kfo9z5rjrR/prBI5FG1/KRc5XImpnOyc4RNxMGqMpSeYr/cTEEaMbfzxulm18gkqHTu/SCZCIpS/jVHzY4kvnL5vMvlZRgKTdL/SI6pgzverxfLO44upNy93aex0rkZmPxWEBGqmaY+EVvAhK2NnkturwROySuiZXqFz/peFh7JCJA/6RrMT/uvl5p9REqXytgsCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxoLnpKSJiheY0iFOgokE79+y4SVd9S5Gz8SOvfqQJg=;
 b=gVc/e8BhoTGsmIASyOYZraYM5o4grypE8nEx4Iv9Er17WR5EvPWGfZnnK6CnmyFxSdiaTG/eVpUyJl18Rs/5k9srSDWzupnGQHjKTypvPHVWEoY3E2u8XqbVmuzS0InPYx0J/g62h5nO/6lskfDVcrbiuWR++VdDjKJXVhA/bzVgp7yzhcMYNV3rxXX3mOOOUokJD2fbVpNkwEfW6oyjAhEJI9drL5jq/3tTyuxa+cTV0YeFDV035WrCEjAAvUi6SrRc5YnS7VayDLqneMLCiKyu/wUydm1UBogFOZKtDB55wMYj8MBj76Yfb+MbFuB+shI2xHBNC45+oxJdt2y2IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxoLnpKSJiheY0iFOgokE79+y4SVd9S5Gz8SOvfqQJg=;
 b=bG/Oiy8NPN6ouOsm/aezztSAJkPhAS1/Zi5n1YE7eW8irj9ub/DFRI6lH3ZQFdTUGrPxJpq5BDItii/HryHkc3OfsG7ceCXoVDuHez2WWKoWB9Y8sIBtogQLYI6Ra4DWhSED5Rds006GFghbVeNunHSXzYo1ts1V5sctVFs33QA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by SJ0PR10MB4814.namprd10.prod.outlook.com (2603:10b6:a03:2d5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Mon, 19 Jul
 2021 06:28:10 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539%7]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 06:28:10 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 13/19] vfio-user: respond to remote DMA read/write requests
Date: Sun, 18 Jul 2021 23:27:52 -0700
Message-Id: <d00029bcc252adc0e4de36b1c0cf921691be7351.1626675354.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626675354.git.elena.ufimtseva@oracle.com>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0022.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::35) To BYAPR10MB2869.namprd10.prod.outlook.com
 (2603:10b6:a03:85::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nuker.hsd1.ca.comcast.net
 (2601:642:4000:a09:3c73:d99e:ec8c:2487) by
 BY5PR16CA0022.namprd16.prod.outlook.com (2603:10b6:a03:1a0::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Mon, 19 Jul 2021 06:28:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aac365c5-bd72-43c0-0466-08d94a7e612b
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4814:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4814FDE9BCF2392E46913B7C8CE19@SJ0PR10MB4814.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cv9GnLygtvJKA5k1BgtkQX/0588GMgm1rEvzcZZxjfIC9LC4+Kj/4FbaKsU7HGtNXojL1XxFICmeoD960zhBtVWMM0oYBaClt/tJf9aHtaPnDSBlqsdWuT83jrnrJYrznJdZYMrkETuMZlRXTSEiMpyxJFdN7QpDbsGVB56aNZuyZDTzPLJE7m4KwL85H0LbS8/0l+aGzTCEC41gLoHrIoTUuQXzc0dkIAMkZWSEUoZ5WBNLoPSeTWgAYcagIQWsWxPzqd7BFRFQBbTX5h0J4i0w8yAyq7hkY98qUNtCw59GTdiOV7rl1NkV9ZmRT+Hu2teRH1Yd00VIPIdf2GKFf26jg3p2+GeuGoBZQ37nha4evnKUMoNsiH9MGGCThrhlBrkQcaQK2qem4LP+TR66Q+tmMJvfBo0NzF7/2xXCVFpmPO7BBZcWUtAHghSnBBLOH0PPqLw4sznHPPZpOaB62jDy7Rnczp3Ah8W9OkzafDuwDDqF0iiDoZz7yU4vg/Gy2PNBNghqiuOEKZ4l8x7/m/rFgALuoLdSlbd3DGWybdclO0zsPXN1M6rDkckXj3wKr9EFOmOwB3xB6WUrxzFQgBYfcAJnVcTgtJ0k8fcwECcWpLO6/lju4tNzSbrix4aEKFu85NvTUmnkFVHCEhAWKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(366004)(376002)(346002)(136003)(2906002)(6486002)(5660300002)(316002)(6512007)(186003)(66476007)(44832011)(66556008)(2616005)(6506007)(38100700002)(6916009)(52116002)(6666004)(8936002)(86362001)(107886003)(8676002)(83380400001)(66946007)(478600001)(36756003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Qkfl34IV/xg4YTyOonoIJVu1sOrR54QFMaWvyMki0QiVMqRQw44gz1Sh01zT?=
 =?us-ascii?Q?ArRrop5rQB7LQT486xzq6Lu3F/tkUvCzbTy00wa0v1d/N17lgAPbF0OBsL5v?=
 =?us-ascii?Q?b04YjyvFRyRfcxYGKmQyOgQxYw01R/mX/FBlk7SEKMtFLeWLBggvdRsOT8+H?=
 =?us-ascii?Q?k49Ftr8XrxO6LStwIaIja+9uwAFxJjsZeGlFTCmNYkbc3A1aVnNTK0q3D6+M?=
 =?us-ascii?Q?H921HjcI79B181D19evyYuFSj8Vgm1hIfpxwwcHLb25kQPoYK6PS6huWSHTG?=
 =?us-ascii?Q?dxWCnxMaDj4zKbuLgJBhFl65JEVgqwaKDwoIIQnS5sPlRs6G2g9b5NLk/Mv1?=
 =?us-ascii?Q?GVysr8pnK2IKa5gPUOJ11mmlcV9depIDAK2zY8AfIDxqsL8NqwEHUdCaNKH4?=
 =?us-ascii?Q?x5q33JiK0WfttIAIjBAiGsPp7JOiAW51bWBAakuyn1Kg6u+hg1K5+SWdeT2K?=
 =?us-ascii?Q?iUtyZ+83Sg+GSN+han3kee7wUU5HOLXa3Ht6nrkNZdH7ry8dOcnFXI3lLzn1?=
 =?us-ascii?Q?77GpugxtvbUaE9EJ6Zhdxrk9VqOzZHQVoZBR3DGwn/A0nUrRxZCcVIq+I2B6?=
 =?us-ascii?Q?H5nXJlXg5M1BScjCp4Q1A5P6VwVzPWR+7uz5amMa2S0RBahoQtb2GkSAIeY5?=
 =?us-ascii?Q?bI7mMURuU/8yr4OhElmT3y/kLj+QQtpI2DLso2T/wJh7AorNXXP1k+0BIvX7?=
 =?us-ascii?Q?DG5NXORfMmhSjOzZC3N00XsOmxHDt0ZNZygm/iWqgC+hpO6c2hkVWM9ZbD6b?=
 =?us-ascii?Q?ugB0zyU3FkMwEKfKqpelnGfUK1uHcwsCLVP5Oa5Cin3p2kyFiYR3aysCPg+8?=
 =?us-ascii?Q?x8JGUm563kiNo7DtDC/4bv1B1GxQOUPJdxuzhZFvIxasxmJ/RUl6aRFVJEaB?=
 =?us-ascii?Q?/eADEjZjCuT1cXxwhUamOMIr26CNeEkzlMu3YnoA+6MZJfxE/He/AVTaYjAY?=
 =?us-ascii?Q?3EMTyyPNguuHIACFS+PXo687FD8Xs31LMzcYc05hqHTS7aUrp91rQv7RJ4uj?=
 =?us-ascii?Q?TrB6Qm5gfTDqTVHn8aC5USbnPJvztRolFS4+PZhaQcbGKu7Z5wYCSFYOviZ1?=
 =?us-ascii?Q?TZ9B80+JnpCmv488LcxHXdW9Qa+KuVklb7zc0Hs5Af9FNFgGF1iCUdHmEKnJ?=
 =?us-ascii?Q?PbpfHDrKaXAPJntd20DYjwUqJbz9HLFqlIqA2unBk+IG8n0lYpaqZgN2mV55?=
 =?us-ascii?Q?N1wVqSRyq34cveGJQCLUubrmUIBwVdweoLs8gzuSLuKDK7RjuojPe95e9h7l?=
 =?us-ascii?Q?FGdpM1HKfNzh1kEWaaaXjMXUHnHlCaDIXGPJLiTsMjY+XOASfO58nka9eBHh?=
 =?us-ascii?Q?98aDBvFuhffCA8qaOMEkHv33Gofv16osRqpnNnFjzADgyX308sPpR8l6EQPQ?=
 =?us-ascii?Q?IlIIjHqQGF++73nOzNUvu3LZrC1B?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aac365c5-bd72-43c0-0466-08d94a7e612b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 06:28:10.7099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R3PNrNVhS8HwHag05b5cDB8XzUEP+8aJq2LB6AE6KjiuiD+B+n09Hs64dmN2IPDW3cYBOGJfIkBYHc7vLTjyPdJkhmOAWUNmkR2LiL4KOjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4814
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10049
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 spamscore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107190035
X-Proofpoint-ORIG-GUID: AQVrrLo0kGV9C0jlJnMCOw3y_HDnDmr1
X-Proofpoint-GUID: AQVrrLo0kGV9C0jlJnMCOw3y_HDnDmr1
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.01,
 RCVD_IN_MSPIKE_L3=0.9, SPF_HELO_NONE=0.001,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, jag.raman@oracle.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, alex.williamson@redhat.com,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John G Johnson <john.g.johnson@oracle.com>

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user.h | 16 ++++++++++++
 hw/vfio/pci.c  | 67 ++++++++++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/user.c | 21 +++++++++++++++-
 3 files changed, 103 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index 351fdb3ee1..d08d94ed92 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -206,6 +206,17 @@ struct vfio_user_region_info {
     uint64_t offset;
 };
 
+/*
+ * VFIO_USER_DMA_READ
+ * VFIO_USER_DMA_WRITE
+ */
+struct vfio_user_dma_rw {
+    vfio_user_hdr_t hdr;
+    uint64_t offset;
+    uint32_t count;
+    char data[];
+};
+
 void vfio_user_recv(void *opaque);
 void vfio_user_send_reply(VFIOProxy *proxy, char *buf, int ret);
 VFIOProxy *vfio_user_connect_dev(char *sockname, Error **errp);
@@ -224,4 +235,9 @@ int vfio_user_dma_unmap(VFIOProxy *proxy,
                         struct vfio_bitmap *bitmap);
 int vfio_user_get_region_info(VFIODevice *vbasedev, int index,
                               struct vfio_region_info *info, VFIOUserFDs *fds);
+uint64_t vfio_user_max_xfer(void);
+void vfio_user_set_reqhandler(VFIODevice *vbasdev,
+                              int (*handler)(void *opaque, char *buf,
+                                             VFIOUserFDs *fds),
+                                             void *reqarg);
 #endif /* VFIO_USER_H */
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index a8d2e59470..7042c178dd 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3347,6 +3347,72 @@ static void register_vfio_pci_dev_type(void)
 
 type_init(register_vfio_pci_dev_type)
 
+static int vfio_user_dma_read(VFIOPCIDevice *vdev, struct vfio_user_dma_rw *msg)
+{
+    PCIDevice *pdev = &vdev->pdev;
+    char *buf;
+    int size = msg->count + sizeof(struct vfio_user_dma_rw);
+
+    if (msg->hdr.flags & VFIO_USER_NO_REPLY) {
+        return -EINVAL;
+    }
+    if (msg->count > vfio_user_max_xfer()) {
+        return -E2BIG;
+    }
+
+    buf = g_malloc0(size);
+    memcpy(buf, msg, sizeof(*msg));
+
+    pci_dma_read(pdev, msg->offset, buf + sizeof(*msg), msg->count);
+
+    vfio_user_send_reply(vdev->vbasedev.proxy, buf, size);
+    g_free(buf);
+    return 0;
+}
+
+static int vfio_user_dma_write(VFIOPCIDevice *vdev,
+                               struct vfio_user_dma_rw *msg)
+{
+    PCIDevice *pdev = &vdev->pdev;
+    char *buf = (char *)msg + sizeof(*msg);
+
+    /* make sure transfer count isn't larger than the message data */
+    if (msg->count > msg->hdr.size - sizeof(*msg)) {
+        return -E2BIG;
+    }
+
+    pci_dma_write(pdev, msg->offset, buf, msg->count);
+
+    if ((msg->hdr.flags & VFIO_USER_NO_REPLY) == 0) {
+        vfio_user_send_reply(vdev->vbasedev.proxy, (char *)msg,
+                             sizeof(msg->hdr));
+    }
+    return 0;
+}
+
+static int vfio_user_pci_process_req(void *opaque, char *buf, VFIOUserFDs *fds)
+{
+    VFIOPCIDevice *vdev = opaque;
+    vfio_user_hdr_t *hdr = (vfio_user_hdr_t *)buf;
+    int ret;
+
+    if (fds->recv_fds != 0) {
+        return -EINVAL;
+    }
+    switch (hdr->command) {
+    case VFIO_USER_DMA_READ:
+        ret = vfio_user_dma_read(vdev, (struct vfio_user_dma_rw *)hdr);
+        break;
+    case VFIO_USER_DMA_WRITE:
+        ret = vfio_user_dma_write(vdev, (struct vfio_user_dma_rw *)hdr);
+        break;
+    default:
+        error_printf("vfio_user_process_req unknown cmd %d\n", hdr->command);
+        ret = -ENOSYS;
+    }
+    return ret;
+}
+
 /*
  * Emulated devices don't use host hot reset
  */
@@ -3392,6 +3458,7 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
         return;
     }
     vbasedev->proxy = proxy;
+    vfio_user_set_reqhandler(vbasedev, vfio_user_pci_process_req, vdev);
 
     if (udev->secure) {
         proxy->flags |= VFIO_PROXY_SECURE;
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index eea8b9b402..8bedbc19f3 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -42,6 +42,11 @@ static void vfio_user_request_msg(vfio_user_hdr_t *hdr, uint16_t cmd,
 static void vfio_user_send_recv(VFIOProxy *proxy, vfio_user_hdr_t *msg,
                                 VFIOUserFDs *fds, int rsize);
 
+uint64_t vfio_user_max_xfer(void)
+{
+    return max_xfer_size;
+}
+
 static void vfio_user_shutdown(VFIOProxy *proxy)
 {
     qio_channel_shutdown(proxy->ioc, QIO_CHANNEL_SHUTDOWN_READ, NULL);
@@ -236,7 +241,7 @@ void vfio_user_recv(void *opaque)
         *reply->msg = msg;
         data = (char *)reply->msg + sizeof(msg);
     } else {
-        if (msg.size > max_xfer_size) {
+        if (msg.size > max_xfer_size + sizeof(struct vfio_user_dma_rw)) {
             error_setg(&local_err, "vfio_user_recv request larger than max");
             goto fatal;
         }
@@ -779,3 +784,17 @@ int vfio_user_get_region_info(VFIODevice *vbasedev, int index,
     memcpy(info, &msgp->argsz, info->argsz);
     return 0;
 }
+
+void vfio_user_set_reqhandler(VFIODevice *vbasedev,
+                              int (*handler)(void *opaque, char *buf,
+                                             VFIOUserFDs *fds),
+                              void *reqarg)
+{
+    VFIOProxy *proxy = vbasedev->proxy;
+
+    proxy->request = handler;
+    proxy->reqarg = reqarg;
+    qio_channel_set_aio_fd_handler(proxy->ioc,
+                                   iothread_get_aio_context(vfio_user_iothread),
+                                   vfio_user_recv, NULL, vbasedev);
+}
-- 
2.25.1


