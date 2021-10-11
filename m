Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E042428643
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 07:37:58 +0200 (CEST)
Received: from localhost ([::1]:48834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZo0b-0002mn-6r
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 01:37:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mZnuj-0002mD-Cf
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 01:31:53 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:31602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mZnuh-00059t-FF
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 01:31:53 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19B2iP40030029; 
 Mon, 11 Oct 2021 05:31:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=bAUutKHE2DkefOKBu7WeoG75kIEOnQLFXmqZHbGUynY=;
 b=or+VS/SShlWcKM4se4ltPojGriKRJDU0arSCfY2eVDz0G8GbDzhje3U0ACfnfVh8rQ+H
 yPkNQv8rc9v8qC99p/Kwusfpom/cP/J2EmK/AoPQp3DCLXEQM5eXZxBLP7ybqm4L8ueY
 V2vcQXXpMwIRghIAxhHFzUNzcyf1p9lo8iAjQpLKzclHRxR3fkX2OQyIMVSdtbsaQ/rl
 yDYLVCSA3TAnP8K5SYfVs7IvdoivXVxpuybJwMzR5W/6mUoJgFA/lmqIxYD7FvEKMu5H
 cKUAPcTM0Ugi3DJGSTc1AdweBe5HhVJYL2kdd5+/ERHhnWxVphYFccYotXfUbB8D4ZoB Zw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bkwyuhw37-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 05:31:49 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19B5UxG2064025;
 Mon, 11 Oct 2021 05:31:48 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2042.outbound.protection.outlook.com [104.47.51.42])
 by userp3030.oracle.com with ESMTP id 3bkyv6eymf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 05:31:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l8/1We2oADMCeD+xcqclwN4X/zKOC3fNOfrKlcpUi7Vh3Gla7mlnH8E49+R66dlusBgn76UZKGxyl8FfBbvS5ROA3ZsMq/0G6/+6b5UFZ8Pre/qo2L2o1go7rxFFJRgN0eUnZBqc7TskRtdsDclHBLXYFpAJ03shyhOd36VEJHP8AbmnQo0FlszpniDttYj59hTQX/tn59jlUIPCI1gqL3Nr6Lacyqbw91gDWRQtcH0FnGX5janae3alwYxZUA4JTzZ1HN0lM48H5VQhhELqUzpyW8Y/yO1UZm0rZB35a4UhcKivx25aQdpIcmBykRahpDhPfaeWUU5YYOkudtgHag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAUutKHE2DkefOKBu7WeoG75kIEOnQLFXmqZHbGUynY=;
 b=ZwWXknXdPeR6xMY8FvnORN0tGMicNtrutfocZplRqJH1AhQn7AxjBI3h9pmIljSApZWzTWPULRCh/7GaJemkYxRpsRPtw+DFiurbmfaCVRTOe80+efJULi8w5ubFNeQAkPPmWJWDWQTud41fdmOPU9nAGYSXXDegcZK0cJ1B5Qe1lCZ6EQ8xMIn3e8N3sCnCgdp+/1+gdr3tZ2pnKA/yMpVUUmaVGJncSvbPRnV6WOsKtZ54QLSxvYF13kGYU+dFMvKitZniZEzaGKHvBaHJgoMAzXIl+PY9JwC9hGKsh1vVc4Txb/o9UwXMmc9A4aORN+vgDOn/54zyYypm0Pm9Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAUutKHE2DkefOKBu7WeoG75kIEOnQLFXmqZHbGUynY=;
 b=isCEXUDRxR9ov1Nwp34KZLLmqknOoRTzMAwhrqOJibol3G4QXiGk0SExq0suhxIfvg43lKLFQNfUpMvwdAJWo3UPaK7sTezRVqpfzAN4RI4I3uoKRXPWHs4lPTTSZs8CQJDuDHfmUQP/fXAAuUpS59Q9olRZY+tBE/B8nqnKSDc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3775.namprd10.prod.outlook.com (2603:10b6:208:186::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Mon, 11 Oct
 2021 05:31:46 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::48d7:8ff1:200c:89ca]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::48d7:8ff1:200c:89ca%3]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 05:31:46 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/12] vfio-user: handle DMA mappings
Date: Mon, 11 Oct 2021 01:31:13 -0400
Message-Id: <dc2e12398a8c5d29a64bcd4101279d0cc0ef989f.1633929457.git.jag.raman@oracle.com>
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
 Transport; Mon, 11 Oct 2021 05:31:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b403503d-a323-4420-95f5-08d98c786ac4
X-MS-TrafficTypeDiagnostic: MN2PR10MB3775:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR10MB3775DCD5745069487CCF78A890B59@MN2PR10MB3775.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:483;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ke+ip7pX+nuPZeumrdSZRiZIDCBkJEpIZo/ZDbF1XqT0rfU4Hrr6X9utLm3PN5Ugtpb/jJD3F1ruuD3xylk64dYuh80bNgHgYfD45FdkknuRj+eZQ84NJ8mouFc0BJYooQeQIQ6gcKWY7oXo4nEzZ/LE+xuHZU59U1qbLuVkwTQz8PyKNJCjMuc5xwb7ehys4PUVFfRjUpFGB9yRHNq7pSqJBWl7d0vyatcwLlRj/FquTtHPz4RGeFTvkP7tabrfsvDPU4nGKE8FF9o3tR434W1Cz/SVSD/GTFP6238e7JonZd3aCS/59fTNCSGEDIkhKw4LFIi2YSy+8BW+8hKYn1HkM07Ds0v7+XKv9DNs1N8h2bTeaIRGhLsh8ggHGRpl7vutMuS9xI78eLoEaE3QDyhks09t2h7I51FqXtv2Pd7kTZLPQyBqlQXN9lvLe56cauELTawTj3iZsbPBGwgS1PncnOUTiGoAoX4igyPWZVuJUTCifQP51bBQrxTAkTEbiaXre7raW8Yen0YBCViG3D1SF9ObtK7m92qsmb1RZ4fg92IVuSOe8VjVeQVr1OaHHQPKtEoTSRvQ/pZC4NUrrXP8ADCx5DXOTbb83CPl3d1y7oMJomIEpuQk9BGVi9UE3FVpUT7uekc72VJvD9VGvoxBfLcIpySD2jgLu1s8eF5KooOR9ukx2foVJ7+7J4+AhdyB8nsmwJX4lhE2BnegYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(316002)(8676002)(36756003)(66476007)(956004)(66946007)(6486002)(7416002)(4326008)(2616005)(508600001)(6666004)(5660300002)(8936002)(7696005)(52116002)(6916009)(2906002)(107886003)(186003)(26005)(38100700002)(38350700002)(83380400001)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wNNkchl9ZOpO1OwmGAxsXCYOV9qOc4RDQlQVRo1OTgDgSRCDq3lqNuUsR9gd?=
 =?us-ascii?Q?+BKjyV7VJJ/Zyi3IntCXnoIkhgQZO3ZwJps9ytWeQwSuOWSG4JHtuZzbc8Ku?=
 =?us-ascii?Q?DoeAOAObFNFS5OVkdh7ybAbzTBpnbArlxph3SdDFFnEa6aZm0qVx+ByGc691?=
 =?us-ascii?Q?qY24PLPsOOsoz4k8dEDkiAC1pQHgaUsjZ1i3A1DZib4brp4pWHU0zdMjxI3I?=
 =?us-ascii?Q?7GeA5dZDwhBOpu8WwFUaEImbKQU25KkiCdm9AfNWYKWgMJ0u8IEi/GqM64oP?=
 =?us-ascii?Q?HdXvqPuuiYzGIO2fro0qLnAtrNnZ26z5XzYePTUHmmUwjir0WOL4NmAArLlC?=
 =?us-ascii?Q?AURlig0HEWB1A9pkG45Isgqrpu47KZlU8kDIe7gCuLx/x85tfPdZsfIZYcST?=
 =?us-ascii?Q?ofNRF90WRUD+73UykRvwHwn+Wnv+YWarOaZyokRObkK9ReDhaL1ojZiaFVCF?=
 =?us-ascii?Q?jjozH1c5f8TblQT65r4z4ZsEXab3jtHwxTfzIEy3VEYScuZfB8/exo/IZq+Q?=
 =?us-ascii?Q?OKjFrvcQgVNvo4LFVu1oTNeb9LZxygDkwN6xR/nmPVACfQLLb0CdAHXH9tk0?=
 =?us-ascii?Q?cLrd4kJOUcHsjq1Tjn0xUNXQRIb1yJrShvGmh+61t68JczTskYrk/p42qjK2?=
 =?us-ascii?Q?PRw7k7wbkSQpI0wmmOUKHJZg9mkumQUeCiRY2smoSRe2eNjmxOZR25wntdNF?=
 =?us-ascii?Q?owS6WXMaxkHRYU0sUI+mBmp8vScYFq2CKq2BRZXFE5q1+aGdE/4MaLxGaK7O?=
 =?us-ascii?Q?WJMh8kkcHUifSVpSSnb00sRurCthWOKmdiyj35tB2+QN7sltm5ODVG2oiPST?=
 =?us-ascii?Q?pS47W6Qrchru0y11cjqhHyfEVHy5AeBSZlawrMB3ttSIJVN4khqvP7R1ZVSS?=
 =?us-ascii?Q?gzmN7vxOR3ZuA+V8aaYxPWZkj6y7PgqQd7+QEUBK357/YM73pCc+ZyzLwKbe?=
 =?us-ascii?Q?og/yv1T9GdKRU1Sm9rkV7zJBCgzCDDdC2jwOlYpivH27GNEGXC8q6gmsfR5H?=
 =?us-ascii?Q?n90tarH/6aYdoKV98ussv6LwqIRplq0NDtrfefMFKOSl/Jv/XFMis0edt3nd?=
 =?us-ascii?Q?dHb3PbpbWXl5IjyLYdCoDZqxrqFbhwHjH884eorCRpz3s5HBtcj8toGMMxjt?=
 =?us-ascii?Q?2JEz/gttywkHIE8H18870eUm0peRqXmtbNHm6HZoBm0An4OrbvoAgCEEQtuk?=
 =?us-ascii?Q?+Gs3j8edJRg5dRyNQjIpu3k1PnkqC+m+020RELwFUyFrLX54jz4wB1emyAhL?=
 =?us-ascii?Q?mKEJbuVP+hfYKa3Od2uLk+eg9IYDSAHr2scNv43FwMjS7QrTCCRwIRRrVgnu?=
 =?us-ascii?Q?t2fp4bBwIZIE0mxt/whR1Qhg?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b403503d-a323-4420-95f5-08d98c786ac4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 05:31:46.6847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mjz+clN+A5/+7Cy0CJpDBsiG4C49ECcY6dwd8NuGGmTgd6A5PkmzLpvajUQESkTMKjTA3uuJlokC8EL5C8BHlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3775
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10133
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110110032
X-Proofpoint-ORIG-GUID: JlgYiR7FEEvhiNfTLOkwn1lNsN9cDZOf
X-Proofpoint-GUID: JlgYiR7FEEvhiNfTLOkwn1lNsN9cDZOf
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 jag.raman@oracle.com, swapnil.ingle@nutanix.com, john.levon@nutanix.com,
 philmd@redhat.com, alex.williamson@redhat.com, marcandre.lureau@gmail.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Define and register callbacks to manage the RAM regions used for
device DMA

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/remote/vfio-user-obj.c | 50 +++++++++++++++++++++++++++++++++++++++
 hw/remote/trace-events    |  2 ++
 2 files changed, 52 insertions(+)

diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index df5843c388..7233562540 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -194,6 +194,49 @@ static ssize_t vfu_object_cfg_access(vfu_ctx_t *vfu_ctx, char * const buf,
     return count;
 }
 
+static void dma_register(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
+{
+    MemoryRegion *subregion = NULL;
+    g_autofree char *name = NULL;
+    static unsigned int suffix;
+    struct iovec *iov = &info->iova;
+
+    if (!info->vaddr) {
+        return;
+    }
+
+    name = g_strdup_printf("remote-mem-%u", suffix++);
+
+    subregion = g_new0(MemoryRegion, 1);
+
+    memory_region_init_ram_ptr(subregion, NULL, name,
+                               iov->iov_len, info->vaddr);
+
+    memory_region_add_subregion(get_system_memory(), (hwaddr)iov->iov_base,
+                                subregion);
+
+    trace_vfu_dma_register((uint64_t)iov->iov_base, iov->iov_len);
+}
+
+static int dma_unregister(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
+{
+    MemoryRegion *mr = NULL;
+    ram_addr_t offset;
+
+    mr = memory_region_from_host(info->vaddr, &offset);
+    if (!mr) {
+        return 0;
+    }
+
+    memory_region_del_subregion(get_system_memory(), mr);
+
+    object_unparent((OBJECT(mr)));
+
+    trace_vfu_dma_unregister((uint64_t)info->iova.iov_base);
+
+    return 0;
+}
+
 /*
  * vfio-user-server depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -254,6 +297,13 @@ static void vfu_object_machine_done(Notifier *notifier, void *data)
         return;
     }
 
+    ret = vfu_setup_device_dma(o->vfu_ctx, &dma_register, &dma_unregister);
+    if (ret < 0) {
+        error_setg(&error_abort, "vfu: Failed to setup DMA handlers for %s",
+                   o->device);
+        return;
+    }
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(&error_abort, "vfu: Failed to realize device %s- %s",
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index 2ef7884346..f945c7e33b 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -7,3 +7,5 @@ mpqemu_recv_io_error(int cmd, int size, int nfds) "failed to receive %d size %d,
 vfu_prop(const char *prop, const char *val) "vfu: setting %s as %s"
 vfu_cfg_read(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u -> 0x%x"
 vfu_cfg_write(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u <- 0x%x"
+vfu_dma_register(uint64_t gpa, size_t len) "vfu: registering GPA 0x%"PRIx64", %zu bytes"
+vfu_dma_unregister(uint64_t gpa) "vfu: unregistering GPA 0x%"PRIx64""
-- 
2.20.1


