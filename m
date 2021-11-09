Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C232449FF9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 01:50:33 +0100 (CET)
Received: from localhost ([::1]:55396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkFLM-0006Kn-BK
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 19:50:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mkFAf-0005fy-0Q
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 19:39:29 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:39184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mkFAX-00046P-0D
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 19:39:28 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A905ino019038
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 00:39:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=loPDDOc9EHDarGRkEIN2UFnuYo2f+u63MeomW6GqtpQ=;
 b=jfAFcX5yHXKpIEOTkuhGpLQlFF4qNRYSS6lDd7kZCxD3SNoz+xvsqOtUuwjdRNiPqxgX
 OVF5nsNnGOFSUpED/kyTgKY9Yd454aFBXdxUjRVCDwmrV6v5bOPm1HD3dGkqcTk6XoJs
 FZVLo40dK85QwVXfyr218z5D4rvHYRrZppbjinV0f/ZSU38zwYJ/x0eSCVwYO1GSasDc
 aLiwbmbvDWCqCixs5/JKo23weOaElTFI1z88CXL8KOV8xOQa3rFn687kl1aTRpTsVogE
 a4X3LJA7HLMGKoAq7RYRnw7YnybDP1VCpOitPYhKFU6JDDCHRdiDpo72rOVggj84BzuN DQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c6sbk7c86-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:39:16 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A90ZLN1129193
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 00:39:16 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by userp3030.oracle.com with ESMTP id 3c5etuvb6n-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:39:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TBl6RKAAY5/ncYdnWFRvIiiS2tHJHwydmpGVL9/Iwl/i43lnDHBuLheV2Jwj1LaKNBv7n1cReuKMT9lD+bW/DcGl8Oq8+A8SgL4rXvmqRp5oOYTu1JwgCggGx99aB2nHVXtJzzPSLBeNcPVs3h3eF5cODj0548fEDjH6/U7wabNBGVb1mNtI6ZFnsKIRlhOOjyPxSUFbLrA4L6/0qNIiP/03bQCDufbDO/PS6rqA6lofgetTzMZcJOH2I4/M0oMsKLQlDeCohZUzJtpM42WZN4NQt042rK79u3gRcASaDo3cK/NtDM1jHXysQe0Ozob8V+va4etQw20yXlpE2atsuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=loPDDOc9EHDarGRkEIN2UFnuYo2f+u63MeomW6GqtpQ=;
 b=lB2IBMZIhxaNR19EtoC/VvUwDD5JKoqnEoNCxNplQpvFj6lOALP36Ir9LEVr258uuEMHKg5l1TnM0Smv58zhJcfcXUI2JDF05SlxKtldJ+xIF4F1PCejNAa+b90w9SMWjtov4PU2Cs77c+Mtaqw4sb6OnXcyYYqZoVwEngWEPTHaAx0fqlZSnhEXNitwvoj7zDlYkLfm0qnlb0Nd1Bx8TGEbPtWoaqKh2pPsWMSdndKZDOGNUEdUONSkPKKcWu4JJfd8XRPhGpjiUZIFUc0fQd7X0W1pJAHEhIvc0R1qC64uvUQY8hE2CttbGz0y9pBy8RJTQf8PzAQyxe2iwOZtXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=loPDDOc9EHDarGRkEIN2UFnuYo2f+u63MeomW6GqtpQ=;
 b=QvryYHS+DP/biThcQ7ScnmP1HteOsDEPlLZLkWCQNWDNGDOBrrWHmaA59s0NeEGNhx+cygzrkIy111hEKDQYbiP5Sf1G9+P+oVQqPnVWSx1W78MCxWw+vlIhx6Vyd2FHPfh16A1um/x7svZwRp/6uJe+c/LmgayaQ+ZMcuBMXbU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 by BY5PR10MB4068.namprd10.prod.outlook.com (2603:10b6:a03:1b2::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Tue, 9 Nov
 2021 00:39:11 +0000
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::1551:92ba:9eb8:a093]) by SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::1551:92ba:9eb8:a093%7]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 00:39:11 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 04/19] Add device IO ops vector
Date: Mon,  8 Nov 2021 16:46:32 -0800
Message-Id: <c8f636ad86d8b89f4610e95089ad49816c70a7a6.1636057885.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1636057885.git.john.g.johnson@oracle.com>
References: <cover.1636057885.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0194.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::19) To SJ0PR10MB4686.namprd10.prod.outlook.com
 (2603:10b6:a03:2d7::23)
MIME-Version: 1.0
Received: from bruckner.us.oracle.com (73.71.20.66) by
 SJ0PR03CA0194.namprd03.prod.outlook.com (2603:10b6:a03:2ef::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Tue, 9 Nov 2021 00:39:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c47c8059-0cf4-41b4-6f04-08d9a31958fb
X-MS-TrafficTypeDiagnostic: BY5PR10MB4068:
X-Microsoft-Antispam-PRVS: <BY5PR10MB406885D260E6C7063F4EB1C1B6929@BY5PR10MB4068.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:119;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jXsSsQ1NzRO7DdAyi5V4bLqjtDitDuvynyva+5hflBDZJxuxO85st6Xtaj4yVfeid9CtRc+8+MXht4ER+qsw2fQ0dYueZVjNgr7lELP/YPsXHVmb1RV9zvze0OWM+bAympcRLOFcZpI3b9FMqMQlWVHxbr2mZotSxbix/sD60Y2nDyBpDZ7lLqjmNQmP6YUdT23wNWuCJuVSGfaUl50OujZL0CPTj4szS+qJYAtZRsmXFTivLLgs4lY4bh0+llK7l8LA4dejbT0nDpxQc8wOi1G7de49fYwxlR3aS5obAG5zQBAoOwFHvrW0/wr+6Prfe1sUxGEUjJjqc0Ex+kMeYaDnDVRTTdvKBGal37rjFfZcBhXh4cRFA/eWAnbzuVxiX/5i6rTYoA0yQ2F9UKaUaVDe/KaRQpoCspQXrhvKKwJuuzpaKWrkOnsLcuXBIGWPFtbah36x+JPO2N9Bn2X/A0RjZ55AtGh+SB/JeT+IcqprDnv2f9EF+3POT6iV650PY2CPipbMgd+uBoHjri6lNg2urWbKQAz6NA2xoQWcj0uKb0qS/k8swjcRYNvdIdNGwpUFnX/b8K9jJcuAEpmor2PS16w4kiJOleNypsVkTZYdqqerFcExvpP3DrB0lPBcZ50ATQgZ2p/Tv+Ok5F50+8BQOr0MiMDw6bJQdxeYg1NZPwfvhcdxWsXMUKVvyJZukqvITpj7nKevBU38C36NAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4686.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(316002)(186003)(66556008)(508600001)(8936002)(8676002)(66946007)(6486002)(26005)(2906002)(6916009)(5660300002)(36756003)(7696005)(52116002)(86362001)(83380400001)(956004)(38100700002)(6666004)(2616005)(30864003)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ur9MMUVDh05J3Jn2AOdcZwiOSB0Ue2iw/RzCRJ6hIVWN7z5APLcZVoc4uITz?=
 =?us-ascii?Q?rqWIxLF6rlfWvHurOgRiq+Ws45nK6wEt+PUnFLcBfb1t3rnuyK4ah7yaCm66?=
 =?us-ascii?Q?e8BcylGPtwDmuOXJIwZNvNoSpJboDaVV3QMFh4uS4jtdW94KvMTHoj2xyV9i?=
 =?us-ascii?Q?L79V12WTK2FFvAdUQdoarD0FE0CYV1r6K7jTEPrffpJyNYcLQyMbCNTK4CN/?=
 =?us-ascii?Q?iofwRWer5mJJMRAqWrYxsv0eqP7ilB+NhH+a+bLABbNtQGBds6gOfqO2ChBT?=
 =?us-ascii?Q?xzSs29+kZHBd9tufCI1n2Nyb7dFlKb6d2iwLmwJE+9wd+bX23yVzCJ+xq3uF?=
 =?us-ascii?Q?Sa9CDBK52pm3ESPXVD3KQIhx27eR3eIhaP+u2w5qK2TeryfSnL0io2yUpuED?=
 =?us-ascii?Q?rTBZg2LBee+RGDZGJ2OLiT8mW8p1OSaWU4WKcF0p/e4KsUyMdn8VQtEE4IKN?=
 =?us-ascii?Q?8/Ql+pMmUtm4keqUmLeHdJu8kkkYL6EnBMNorGOcore4aWRcDdstaosTFiYo?=
 =?us-ascii?Q?hUA/QusyYJaipBAdzJ2kjhDDC4V9V6NtbNBlfVgy7JNFPB5YvtAqv9Jbfskc?=
 =?us-ascii?Q?UsN+FjB7EFlUShDCxvBZK6U0aMUOipwxZeDW4sAvrc2D7KT9M7WUgWKR5uP5?=
 =?us-ascii?Q?++0ZoIYOkW9DciTksIXCpE1/IbA0LmmrPBt+xBtEnKXsJqZGrQYA3qEWjEb8?=
 =?us-ascii?Q?wikxBJ+NW0bHPDY4+Vw4+L2p0orS75TO3qJfYbOIEXWsLhpIIKUwTMOdwOBd?=
 =?us-ascii?Q?WxcAC7+23WnpJMVpxf/c18cmsieXZuByd6OZJPI+6lIEGThUN4t2HnyHvghO?=
 =?us-ascii?Q?7rzokpfbgZFbC+P/x3RGW5FNywfaLJlQ34T/vPR4NXOcN+sU21IFfqgn8pd7?=
 =?us-ascii?Q?S8+PwaJmPm35qNBUBWM19mdCLNRKX2DZYT7X/ZtwfeUkFgq3G8nIryiBMQ2S?=
 =?us-ascii?Q?Iy3eBrW7h+qKTG/g/yyD5aEUN7o6aMpuWmT7o/A0FRgIEcfTPlA2SaUzyK66?=
 =?us-ascii?Q?dLvg7Tq2Zsr4DfTXWD33qDW9x+PJT5DgpoO9J+luUt1ZkVs2eMIr2QAVpB0d?=
 =?us-ascii?Q?cXHxnhYcVWqF6rfhkOdL3B0wT8L/DTubDraqAz0/aBoOhRzcb2Gy7VTQ3+Ns?=
 =?us-ascii?Q?ba1J1ny3IZAvSkUtkgkwD70GYe65fVZ4MxX7TV3v4LdoaTxiYJoGCGAecS1g?=
 =?us-ascii?Q?BQj9qNZe7zIdyxn7r/F0cPibSrj1BjMEIh1hFUpjur0FfGyTibSgNqdttL+h?=
 =?us-ascii?Q?p71bnrd91wUYRpqE13rLRB27BhycvrJCyTGrrkBTUPWxptcKNvY33RN0Cg4W?=
 =?us-ascii?Q?SwXHXXoEXVMznAhgV2/g/g1ZF9Ae5nIi2W8tTaMwJiPkohut7nxzQD79exvR?=
 =?us-ascii?Q?yzrepe6bUlvn9k88YRq4pAPfqp++N/g3HJmlHOasST9DGkWKjVoEuZLfCVox?=
 =?us-ascii?Q?Jd1Tf5iVuHLpkCNYrVI3D3dla4yefEgvJuLRy56zEKrOrLnNrXWT5TwHYcKE?=
 =?us-ascii?Q?oFf2Dt81x+MqvqfhBFK365QzWQ0oUjHtYdKWDlw+0oE4N8YzQAYdw8Snj91q?=
 =?us-ascii?Q?DDJSXd04qi8Gj+cpw6Tqp1gnOPu2OnpNj5YjJLLy7Tr8r0DkZSvO9AIMhPtM?=
 =?us-ascii?Q?7efype57gE+VphBsHNOFIL7/m7UAUYx5kri88EOgD2eAFNBEQkSG7tZXkvBw?=
 =?us-ascii?Q?j8pycA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c47c8059-0cf4-41b4-6f04-08d9a31958fb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4686.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 00:39:11.3253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X0/4LToYQ1SSpDBX/geaSkSuXSZ4SQq/4Pki+DxJs6idwf+S4rguuCQh6tCB8dlpBDx6KFXVYxZN6hQJlBOqZ8NRbLIS5Nwb+4m7EFDlHI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4068
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10162
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111090001
X-Proofpoint-GUID: M-iRq80j1WYQ-o0Bib8ba4VNMKdtPkld
X-Proofpoint-ORIG-GUID: M-iRq80j1WYQ-o0Bib8ba4VNMKdtPkld
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Used for communication with VFIO driver
(prep work for vfio-user, which will communicate over a socket)

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
---
 include/hw/vfio/vfio-common.h |  28 ++++++++
 hw/vfio/common.c              | 159 ++++++++++++++++++++++++++++++++++++++----
 hw/vfio/pci.c                 | 146 ++++++++++++++++++++++++--------------
 3 files changed, 265 insertions(+), 68 deletions(-)

diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 9b3c5e5..43fa948 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -124,6 +124,7 @@ typedef struct VFIOHostDMAWindow {
 } VFIOHostDMAWindow;
 
 typedef struct VFIODeviceOps VFIODeviceOps;
+typedef struct VFIODevIO VFIODevIO;
 
 typedef struct VFIODevice {
     QLIST_ENTRY(VFIODevice) next;
@@ -139,12 +140,14 @@ typedef struct VFIODevice {
     bool ram_block_discard_allowed;
     bool enable_migration;
     VFIODeviceOps *ops;
+    VFIODevIO *io_ops;
     unsigned int num_irqs;
     unsigned int num_regions;
     unsigned int flags;
     VFIOMigration *migration;
     Error *migration_blocker;
     OnOffAuto pre_copy_dirty_page_tracking;
+    struct vfio_region_info **regions;
 } VFIODevice;
 
 struct VFIODeviceOps {
@@ -164,6 +167,30 @@ struct VFIODeviceOps {
  * through ioctl() to the kernel VFIO driver, but vfio-user
  * can use a socket to a remote process.
  */
+struct VFIODevIO {
+    int (*get_info)(VFIODevice *vdev, struct vfio_device_info *info);
+    int (*get_region_info)(VFIODevice *vdev,
+                           struct vfio_region_info *info, int *fd);
+    int (*get_irq_info)(VFIODevice *vdev, struct vfio_irq_info *irq);
+    int (*set_irqs)(VFIODevice *vdev, struct vfio_irq_set *irqs);
+    int (*region_read)(VFIODevice *vdev, uint8_t nr, off_t off, uint32_t size,
+                       void *data);
+    int (*region_write)(VFIODevice *vdev, uint8_t nr, off_t off, uint32_t size,
+                        void *data, bool post);
+};
+
+#define VDEV_GET_INFO(vdev, info) \
+    ((vdev)->io_ops->get_info((vdev), (info)))
+#define VDEV_GET_REGION_INFO(vdev, info, fd) \
+    ((vdev)->io_ops->get_region_info((vdev), (info), (fd)))
+#define VDEV_GET_IRQ_INFO(vdev, irq) \
+    ((vdev)->io_ops->get_irq_info((vdev), (irq)))
+#define VDEV_SET_IRQS(vdev, irqs) \
+    ((vdev)->io_ops->set_irqs((vdev), (irqs)))
+#define VDEV_REGION_READ(vdev, nr, off, size, data) \
+    ((vdev)->io_ops->region_read((vdev), (nr), (off), (size), (data)))
+#define VDEV_REGION_WRITE(vdev, nr, off, size, data, post) \
+    ((vdev)->io_ops->region_write((vdev), (nr), (off), (size), (data), (post)))
 
 struct VFIOContIO {
     int (*dma_map)(VFIOContainer *container,
@@ -184,6 +211,7 @@ struct VFIOContIO {
 #define CONT_DIRTY_BITMAP(cont, bitmap, range) \
     ((cont)->io_ops->dirty_bitmap((cont), (bitmap), (range)))
 
+extern VFIODevIO vfio_dev_io_ioctl;
 extern VFIOContIO vfio_cont_io_ioctl;
 
 #endif /* CONFIG_LINUX */
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 50748be..41fdd78 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -70,7 +70,7 @@ void vfio_disable_irqindex(VFIODevice *vbasedev, int index)
         .count = 0,
     };
 
-    ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
+    VDEV_SET_IRQS(vbasedev, &irq_set);
 }
 
 void vfio_unmask_single_irqindex(VFIODevice *vbasedev, int index)
@@ -83,7 +83,7 @@ void vfio_unmask_single_irqindex(VFIODevice *vbasedev, int index)
         .count = 1,
     };
 
-    ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
+    VDEV_SET_IRQS(vbasedev, &irq_set);
 }
 
 void vfio_mask_single_irqindex(VFIODevice *vbasedev, int index)
@@ -96,7 +96,7 @@ void vfio_mask_single_irqindex(VFIODevice *vbasedev, int index)
         .count = 1,
     };
 
-    ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, &irq_set);
+    VDEV_SET_IRQS(vbasedev, &irq_set);
 }
 
 static inline const char *action_to_str(int action)
@@ -177,9 +177,7 @@ int vfio_set_irq_signaling(VFIODevice *vbasedev, int index, int subindex,
     pfd = (int32_t *)&irq_set->data;
     *pfd = fd;
 
-    if (ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, irq_set)) {
-        ret = -errno;
-    }
+    ret = VDEV_SET_IRQS(vbasedev, irq_set);
     g_free(irq_set);
 
     if (!ret) {
@@ -214,6 +212,7 @@ void vfio_region_write(void *opaque, hwaddr addr,
         uint32_t dword;
         uint64_t qword;
     } buf;
+    int ret;
 
     switch (size) {
     case 1:
@@ -233,13 +232,15 @@ void vfio_region_write(void *opaque, hwaddr addr,
         break;
     }
 
-    if (pwrite(vbasedev->fd, &buf, size, region->fd_offset + addr) != size) {
+    ret = VDEV_REGION_WRITE(vbasedev, region->nr, addr, size, &buf, false);
+    if (ret != size) {
+        const char *err = ret < 0 ? strerror(-ret) : "short write";
+
         error_report("%s(%s:region%d+0x%"HWADDR_PRIx", 0x%"PRIx64
-                     ",%d) failed: %m",
+                     ",%d) failed: %s",
                      __func__, vbasedev->name, region->nr,
-                     addr, data, size);
+                     addr, data, size, err);
     }
-
     trace_vfio_region_write(vbasedev->name, region->nr, addr, data, size);
 
     /*
@@ -265,13 +266,18 @@ uint64_t vfio_region_read(void *opaque,
         uint64_t qword;
     } buf;
     uint64_t data = 0;
+    int ret;
 
-    if (pread(vbasedev->fd, &buf, size, region->fd_offset + addr) != size) {
-        error_report("%s(%s:region%d+0x%"HWADDR_PRIx", %d) failed: %m",
+    ret = VDEV_REGION_READ(vbasedev, region->nr, addr, size, &buf);
+    if (ret != size) {
+        const char *err = ret < 0 ? strerror(-ret) : "short read";
+
+        error_report("%s(%s:region%d+0x%"HWADDR_PRIx", %d) failed: %s",
                      __func__, vbasedev->name, region->nr,
-                     addr, size);
+                     addr, size, err);
         return (uint64_t)-1;
     }
+
     switch (size) {
     case 1:
         data = buf.byte;
@@ -2369,6 +2375,16 @@ int vfio_get_device(VFIOGroup *group, const char *name,
 
 void vfio_put_base_device(VFIODevice *vbasedev)
 {
+    if (vbasedev->regions != NULL) {
+        int i;
+
+        for (i = 0; i < vbasedev->num_regions; i++) {
+            g_free(vbasedev->regions[i]);
+        }
+        g_free(vbasedev->regions);
+        vbasedev->regions = NULL;
+    }
+
     if (!vbasedev->group) {
         return;
     }
@@ -2382,6 +2398,21 @@ int vfio_get_region_info(VFIODevice *vbasedev, int index,
                          struct vfio_region_info **info)
 {
     size_t argsz = sizeof(struct vfio_region_info);
+    int fd = -1;
+    int ret;
+
+    /* create region cache */
+    if (vbasedev->regions == NULL) {
+        vbasedev->regions = g_new0(struct vfio_region_info *,
+                                   vbasedev->num_regions);
+    }
+    /* check cache */
+    if (vbasedev->regions[index] != NULL) {
+        *info = g_malloc0(vbasedev->regions[index]->argsz);
+        memcpy(*info, vbasedev->regions[index],
+               vbasedev->regions[index]->argsz);
+        return 0;
+    }
 
     *info = g_malloc0(argsz);
 
@@ -2389,19 +2420,28 @@ int vfio_get_region_info(VFIODevice *vbasedev, int index,
 retry:
     (*info)->argsz = argsz;
 
-    if (ioctl(vbasedev->fd, VFIO_DEVICE_GET_REGION_INFO, *info)) {
+    ret = VDEV_GET_REGION_INFO(vbasedev, *info, &fd);
+    if (ret != 0) {
         g_free(*info);
         *info = NULL;
-        return -errno;
+        return ret;
     }
 
     if ((*info)->argsz > argsz) {
         argsz = (*info)->argsz;
         *info = g_realloc(*info, argsz);
+        if (fd != -1) {
+            close(fd);
+            fd = -1;
+        }
 
         goto retry;
     }
 
+    /* fill cache */
+    vbasedev->regions[index] = g_malloc0(argsz);
+    memcpy(vbasedev->regions[index], *info, argsz);
+
     return 0;
 }
 
@@ -2554,6 +2594,95 @@ int vfio_eeh_as_op(AddressSpace *as, uint32_t op)
  * Traditional ioctl() based io_ops
  */
 
+static int vfio_io_get_info(VFIODevice *vbasedev, struct vfio_device_info *info)
+{
+    int ret;
+
+    ret = ioctl(vbasedev->fd, VFIO_DEVICE_GET_INFO, info);
+    if (ret < 0) {
+        ret = -errno;
+    }
+
+    return ret;
+}
+
+static int vfio_io_get_region_info(VFIODevice *vbasedev,
+                                   struct vfio_region_info *info,
+                                   int *fd)
+{
+    int ret;
+
+    *fd = -1;
+    ret = ioctl(vbasedev->fd, VFIO_DEVICE_GET_REGION_INFO, info);
+    if (ret < 0) {
+        ret = -errno;
+    }
+
+    return ret;
+}
+
+static int vfio_io_get_irq_info(VFIODevice *vbasedev,
+                                struct vfio_irq_info *info)
+{
+    int ret;
+
+    ret = ioctl(vbasedev->fd, VFIO_DEVICE_GET_IRQ_INFO, info);
+    if (ret < 0) {
+        ret = -errno;
+    }
+
+    return ret;
+}
+
+static int vfio_io_set_irqs(VFIODevice *vbasedev, struct vfio_irq_set *irqs)
+{
+    int ret;
+
+    ret = ioctl(vbasedev->fd, VFIO_DEVICE_SET_IRQS, irqs);
+    if (ret < 0) {
+        ret = -errno;
+    }
+
+    return ret;
+}
+
+static int vfio_io_region_read(VFIODevice *vbasedev, uint8_t index, off_t off,
+                               uint32_t size, void *data)
+{
+    struct vfio_region_info *info = vbasedev->regions[index];
+    int ret;
+
+    ret = pread(vbasedev->fd, data, size, info->offset + off);
+    if (ret < 0) {
+        ret = -errno;
+    }
+
+    return ret;
+}
+
+static int vfio_io_region_write(VFIODevice *vbasedev, uint8_t index, off_t off,
+                                uint32_t size, void *data, bool post)
+{
+    struct vfio_region_info *info = vbasedev->regions[index];
+    int ret;
+
+    ret = pwrite(vbasedev->fd, data, size, info->offset + off);
+    if (ret < 0) {
+        ret = -errno;
+    }
+
+    return ret;
+}
+
+VFIODevIO vfio_dev_io_ioctl = {
+    .get_info = vfio_io_get_info,
+    .get_region_info = vfio_io_get_region_info,
+    .get_irq_info = vfio_io_get_irq_info,
+    .set_irqs = vfio_io_set_irqs,
+    .region_read = vfio_io_region_read,
+    .region_write = vfio_io_region_write,
+};
+
 static int vfio_io_dma_map(VFIOContainer *container,
                            struct vfio_iommu_type1_dma_map *map,
                            int fd, bool will_commit)
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 122edf8..28f21f8 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -402,7 +402,7 @@ static int vfio_enable_vectors(VFIOPCIDevice *vdev, bool msix)
         fds[i] = fd;
     }
 
-    ret = ioctl(vdev->vbasedev.fd, VFIO_DEVICE_SET_IRQS, irq_set);
+    ret = VDEV_SET_IRQS(&vdev->vbasedev, irq_set);
 
     g_free(irq_set);
 
@@ -772,14 +772,16 @@ static void vfio_update_msi(VFIOPCIDevice *vdev)
 
 static void vfio_pci_load_rom(VFIOPCIDevice *vdev)
 {
+    VFIODevice *vbasedev = &vdev->vbasedev;
     struct vfio_region_info *reg_info;
     uint64_t size;
     off_t off = 0;
     ssize_t bytes;
+    int ret;
 
-    if (vfio_get_region_info(&vdev->vbasedev,
-                             VFIO_PCI_ROM_REGION_INDEX, &reg_info)) {
-        error_report("vfio: Error getting ROM info: %m");
+    ret = vfio_get_region_info(vbasedev, VFIO_PCI_ROM_REGION_INDEX, &reg_info);
+    if (ret < 0) {
+        error_report("vfio: Error getting ROM info: %s", strerror(-ret));
         return;
     }
 
@@ -806,18 +808,19 @@ static void vfio_pci_load_rom(VFIOPCIDevice *vdev)
     memset(vdev->rom, 0xff, size);
 
     while (size) {
-        bytes = pread(vdev->vbasedev.fd, vdev->rom + off,
-                      size, vdev->rom_offset + off);
+        bytes = VDEV_REGION_READ(vbasedev, VFIO_PCI_ROM_REGION_INDEX, off,
+                                 size, vdev->rom + off);
         if (bytes == 0) {
             break;
         } else if (bytes > 0) {
             off += bytes;
             size -= bytes;
         } else {
-            if (errno == EINTR || errno == EAGAIN) {
+            if (bytes == -EINTR || bytes == -EAGAIN) {
                 continue;
             }
-            error_report("vfio: Error reading device ROM: %m");
+            error_report("vfio: Error reading device ROM: %s",
+                         strerror(-bytes));
             break;
         }
     }
@@ -905,11 +908,10 @@ static const MemoryRegionOps vfio_rom_ops = {
 
 static void vfio_pci_size_rom(VFIOPCIDevice *vdev)
 {
+    VFIODevice *vbasedev = &vdev->vbasedev;
     uint32_t orig, size = cpu_to_le32((uint32_t)PCI_ROM_ADDRESS_MASK);
-    off_t offset = vdev->config_offset + PCI_ROM_ADDRESS;
     DeviceState *dev = DEVICE(vdev);
     char *name;
-    int fd = vdev->vbasedev.fd;
 
     if (vdev->pdev.romfile || !vdev->pdev.rom_bar) {
         /* Since pci handles romfile, just print a message and return */
@@ -926,13 +928,23 @@ static void vfio_pci_size_rom(VFIOPCIDevice *vdev)
      * Use the same size ROM BAR as the physical device.  The contents
      * will get filled in later when the guest tries to read it.
      */
-    if (pread(fd, &orig, 4, offset) != 4 ||
-        pwrite(fd, &size, 4, offset) != 4 ||
-        pread(fd, &size, 4, offset) != 4 ||
-        pwrite(fd, &orig, 4, offset) != 4) {
-        error_report("%s(%s) failed: %m", __func__, vdev->vbasedev.name);
+#define rom_read(var) VDEV_REGION_READ(vbasedev,  \
+                                       VFIO_PCI_CONFIG_REGION_INDEX,  \
+                                       PCI_ROM_ADDRESS, 4, (var))
+#define rom_write(var) VDEV_REGION_WRITE(vbasedev,  \
+                                         VFIO_PCI_CONFIG_REGION_INDEX,  \
+                                         PCI_ROM_ADDRESS, 4, (var), false)
+
+    if (rom_read(&orig) != 4 ||
+        rom_write(&size) != 4 ||
+        rom_read(&size) != 4 ||
+        rom_write(&orig) != 4) {
+
+        error_report("%s(%s) ROM access failed", __func__, vbasedev->name);
         return;
     }
+#undef rom_read
+#undef rom_write
 
     size = ~(le32_to_cpu(size) & PCI_ROM_ADDRESS_MASK) + 1;
 
@@ -1110,6 +1122,7 @@ static void vfio_sub_page_bar_update_mapping(PCIDevice *pdev, int bar)
 uint32_t vfio_pci_read_config(PCIDevice *pdev, uint32_t addr, int len)
 {
     VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
+    VFIODevice *vbasedev = &vdev->vbasedev;
     uint32_t emu_bits = 0, emu_val = 0, phys_val = 0, val;
 
     memcpy(&emu_bits, vdev->emulated_config_bits + addr, len);
@@ -1122,12 +1135,14 @@ uint32_t vfio_pci_read_config(PCIDevice *pdev, uint32_t addr, int len)
     if (~emu_bits & (0xffffffffU >> (32 - len * 8))) {
         ssize_t ret;
 
-        ret = pread(vdev->vbasedev.fd, &phys_val, len,
-                    vdev->config_offset + addr);
+        ret = VDEV_REGION_READ(vbasedev, VFIO_PCI_CONFIG_REGION_INDEX, addr,
+                               len, &phys_val);
         if (ret != len) {
-            error_report("%s(%s, 0x%x, 0x%x) failed: %m",
-                         __func__, vdev->vbasedev.name, addr, len);
-            return -errno;
+            const char *err = ret < 0 ? strerror(-ret) : "short read";
+
+            error_report("%s(%s, 0x%x, 0x%x) failed: %s",
+                         __func__, vbasedev->name, addr, len, err);
+            return -1;
         }
         phys_val = le32_to_cpu(phys_val);
     }
@@ -1143,15 +1158,20 @@ void vfio_pci_write_config(PCIDevice *pdev,
                            uint32_t addr, uint32_t val, int len)
 {
     VFIOPCIDevice *vdev = VFIO_PCI_BASE(pdev);
+    VFIODevice *vbasedev = &vdev->vbasedev;
     uint32_t val_le = cpu_to_le32(val);
+    int ret;
 
     trace_vfio_pci_write_config(vdev->vbasedev.name, addr, val, len);
 
     /* Write everything to VFIO, let it filter out what we can't write */
-    if (pwrite(vdev->vbasedev.fd, &val_le, len, vdev->config_offset + addr)
-                != len) {
-        error_report("%s(%s, 0x%x, 0x%x, 0x%x) failed: %m",
-                     __func__, vdev->vbasedev.name, addr, val, len);
+    ret = VDEV_REGION_WRITE(vbasedev, VFIO_PCI_CONFIG_REGION_INDEX, addr,
+                            len, &val_le, false);
+    if (ret != len) {
+        const char *err = ret < 0 ? strerror(-ret) : "short write";
+
+        error_report("%s(%s, 0x%x, 0x%x, 0x%x) failed: %s",
+                     __func__, vbasedev->name, addr, val, len, err);
     }
 
     /* MSI/MSI-X Enabling/Disabling */
@@ -1239,10 +1259,13 @@ static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
     int ret, entries;
     Error *err = NULL;
 
-    if (pread(vdev->vbasedev.fd, &ctrl, sizeof(ctrl),
-              vdev->config_offset + pos + PCI_CAP_FLAGS) != sizeof(ctrl)) {
-        error_setg_errno(errp, errno, "failed reading MSI PCI_CAP_FLAGS");
-        return -errno;
+    ret = VDEV_REGION_READ(&vdev->vbasedev, VFIO_PCI_CONFIG_REGION_INDEX,
+                           pos + PCI_CAP_FLAGS, sizeof(ctrl), &ctrl);
+    if (ret != sizeof(ctrl)) {
+        const char *err = ret < 0 ? strerror(-ret) : "short read";
+
+        error_setg(errp, "failed reading MSI PCI_CAP_FLAGS %s", err);
+        return ret;
     }
     ctrl = le16_to_cpu(ctrl);
 
@@ -1444,33 +1467,40 @@ static void vfio_pci_relocate_msix(VFIOPCIDevice *vdev, Error **errp)
  */
 static void vfio_msix_early_setup(VFIOPCIDevice *vdev, Error **errp)
 {
+    VFIODevice *vbasedev = &vdev->vbasedev;
     uint8_t pos;
     uint16_t ctrl;
     uint32_t table, pba;
-    int fd = vdev->vbasedev.fd;
     VFIOMSIXInfo *msix;
+    int ret;
 
     pos = pci_find_capability(&vdev->pdev, PCI_CAP_ID_MSIX);
     if (!pos) {
         return;
     }
 
-    if (pread(fd, &ctrl, sizeof(ctrl),
-              vdev->config_offset + pos + PCI_MSIX_FLAGS) != sizeof(ctrl)) {
-        error_setg_errno(errp, errno, "failed to read PCI MSIX FLAGS");
-        return;
+    ret = VDEV_REGION_READ(vbasedev, VFIO_PCI_CONFIG_REGION_INDEX,
+                           pos + PCI_MSIX_FLAGS, sizeof(ctrl), &ctrl);
+    if (ret != sizeof(ctrl)) {
+        const char *err = ret < 0 ? strerror(-ret) : "short read";
+
+        error_setg(errp, "failed to read PCI MSIX FLAGS %s", err);
     }
 
-    if (pread(fd, &table, sizeof(table),
-              vdev->config_offset + pos + PCI_MSIX_TABLE) != sizeof(table)) {
-        error_setg_errno(errp, errno, "failed to read PCI MSIX TABLE");
-        return;
+    ret = VDEV_REGION_READ(vbasedev, VFIO_PCI_CONFIG_REGION_INDEX,
+                           pos + PCI_MSIX_TABLE, sizeof(table), &table);
+    if (ret != sizeof(table)) {
+        const char *err = ret < 0 ? strerror(-ret) : "short read";
+
+        error_setg(errp, "failed to read PCI MSIX TABLE %s", err);
     }
 
-    if (pread(fd, &pba, sizeof(pba),
-              vdev->config_offset + pos + PCI_MSIX_PBA) != sizeof(pba)) {
-        error_setg_errno(errp, errno, "failed to read PCI MSIX PBA");
-        return;
+    ret = VDEV_REGION_READ(vbasedev, VFIO_PCI_CONFIG_REGION_INDEX,
+                           pos + PCI_MSIX_PBA, sizeof(pba), &pba);
+    if (ret != sizeof(pba)) {
+        const char *err = ret < 0 ? strerror(-ret) : "short read";
+
+        error_setg(errp, "failed to read PCI MSIX PBA %s", err);
     }
 
     ctrl = le16_to_cpu(ctrl);
@@ -1608,7 +1638,6 @@ static void vfio_mmap_set_enabled(VFIOPCIDevice *vdev, bool enabled)
 static void vfio_bar_prepare(VFIOPCIDevice *vdev, int nr)
 {
     VFIOBAR *bar = &vdev->bars[nr];
-
     uint32_t pci_bar;
     int ret;
 
@@ -1618,10 +1647,13 @@ static void vfio_bar_prepare(VFIOPCIDevice *vdev, int nr)
     }
 
     /* Determine what type of BAR this is for registration */
-    ret = pread(vdev->vbasedev.fd, &pci_bar, sizeof(pci_bar),
-                vdev->config_offset + PCI_BASE_ADDRESS_0 + (4 * nr));
+    ret = VDEV_REGION_READ(&vdev->vbasedev, VFIO_PCI_CONFIG_REGION_INDEX,
+                           PCI_BASE_ADDRESS_0 + (4 * nr),
+                           sizeof(pci_bar), &pci_bar);
     if (ret != sizeof(pci_bar)) {
-        error_report("vfio: Failed to read BAR %d (%m)", nr);
+        const char *err =  ret < 0 ? strerror(-ret) : "short read";
+
+        error_report("vfio: Failed to read BAR %d (%s)", nr, err);
         return;
     }
 
@@ -2169,8 +2201,9 @@ static void vfio_pci_pre_reset(VFIOPCIDevice *vdev)
 
 static void vfio_pci_post_reset(VFIOPCIDevice *vdev)
 {
+    VFIODevice *vbasedev = &vdev->vbasedev;
     Error *err = NULL;
-    int nr;
+    int ret, nr;
 
     vfio_intx_enable(vdev, &err);
     if (err) {
@@ -2178,13 +2211,17 @@ static void vfio_pci_post_reset(VFIOPCIDevice *vdev)
     }
 
     for (nr = 0; nr < PCI_NUM_REGIONS - 1; ++nr) {
-        off_t addr = vdev->config_offset + PCI_BASE_ADDRESS_0 + (4 * nr);
+        off_t addr = PCI_BASE_ADDRESS_0 + (4 * nr);
         uint32_t val = 0;
         uint32_t len = sizeof(val);
 
-        if (pwrite(vdev->vbasedev.fd, &val, len, addr) != len) {
-            error_report("%s(%s) reset bar %d failed: %m", __func__,
-                         vdev->vbasedev.name, nr);
+        ret = VDEV_REGION_WRITE(vbasedev, VFIO_PCI_CONFIG_REGION_INDEX, addr,
+                                len, &val, false);
+        if (ret != len) {
+            const char *err = ret < 0 ? strerror(-ret) : "short write";
+
+            error_report("%s(%s) reset bar %d failed: %s", __func__,
+                         vbasedev->name, nr, err);
         }
     }
 
@@ -2619,7 +2656,7 @@ static void vfio_populate_device(VFIOPCIDevice *vdev, Error **errp)
 
     irq_info.index = VFIO_PCI_ERR_IRQ_INDEX;
 
-    ret = ioctl(vdev->vbasedev.fd, VFIO_DEVICE_GET_IRQ_INFO, &irq_info);
+    ret = VDEV_GET_IRQ_INFO(vbasedev, &irq_info);
     if (ret) {
         /* This can fail for an old kernel or legacy PCI dev */
         trace_vfio_populate_device_get_irq_info_failure(strerror(errno));
@@ -2738,8 +2775,10 @@ static void vfio_register_req_notifier(VFIOPCIDevice *vdev)
         return;
     }
 
-    if (ioctl(vdev->vbasedev.fd,
-              VFIO_DEVICE_GET_IRQ_INFO, &irq_info) < 0 || irq_info.count < 1) {
+    if (VDEV_GET_IRQ_INFO(&vdev->vbasedev, &irq_info) < 0) {
+        return;
+    }
+    if (irq_info.count < 1) {
         return;
     }
 
@@ -2817,6 +2856,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
     vdev->vbasedev.ops = &vfio_pci_ops;
     vdev->vbasedev.type = VFIO_DEVICE_TYPE_PCI;
     vdev->vbasedev.dev = DEVICE(vdev);
+    vdev->vbasedev.io_ops = &vfio_dev_io_ioctl;
 
     tmp = g_strdup_printf("%s/iommu_group", vdev->vbasedev.sysfsdev);
     len = readlink(tmp, group_path, sizeof(group_path));
-- 
1.8.3.1


