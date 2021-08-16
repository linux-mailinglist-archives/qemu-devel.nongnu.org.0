Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AE43EDBD3
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 18:55:46 +0200 (CEST)
Received: from localhost ([::1]:54850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFftp-0004z0-CM
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 12:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1mFfhi-00011D-Db
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 12:43:14 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:46090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1mFfhc-000812-49
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 12:43:14 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17GGaE6T000648; Mon, 16 Aug 2021 16:43:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=R+/8Xn6UCRdNqx3X44X9ogFDXli8hym8wKlPB0YaaRw=;
 b=gZ44t6Zcv54un4jlD4l6Q0u8M07ACkppMosZ9kTN1RCQff7pE75hXfV7+kjd3bWhEEAc
 KshH+ORqoq5oplKvPMJqH6hBWliYgi24ker3Du3Vuq1OBET4Kw0zfJ9D3GPB//kGE8cv
 psstx2E2r5PSYkw7oYrG0G56GVh8FCBUJm2J8grlrUJ6vFmhi7HAj09FL6ZNG5oUBl8C
 rCxJvoVI6NYyjIGkryPMV/XhB6J2CXwRBCTqSgaCRER+/MSXrftjU7+E3vYiGrXczcZY
 O7D4gzzU0G4NZ0BGrChHJUwTAyu2+T7rrwGT5RAHJuaJJu9NVVtXYyWJQC68SZYO/yUM TQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=R+/8Xn6UCRdNqx3X44X9ogFDXli8hym8wKlPB0YaaRw=;
 b=tB0wOVf8T7qqJzsrWEuVuFti6WIUY5xch6Di/suWBEIqyfEh5muQNKCCcHcAp7DYZ7Ps
 MhEXh86rbrDcR2iU3AGRwz4cY0AMU8y1Y7yO6OFoNL5qErSC7QxinUvLDT0L7EEyiWyw
 4MZYQXljcJJCgkHQG4H9zad2PZEiIeZSkFmiHDpsVGRWJFsW2f2Bqz6GD8j5xRTl2zXL
 LW/LmkbxztWOMlbEOkfACP2R/JiRRrPaOhQvHWvB2hWPihjobw0QotHWYL+AQDELtTNc
 cml79GZ9oMQgj+6TqNGKYozlyffWlpljNQHGdnIcZK45fTBRX8w34Zxr6YEYw/AbFQwa Ag== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3af1q9anv2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 16:43:06 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17GGeiuQ113652;
 Mon, 16 Aug 2021 16:43:04 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by aserp3020.oracle.com with ESMTP id 3ae5n609mu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 16:43:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G/tcG7o7XWVKhFctcQj9Wvd57M30H+0aAvfZuTlZ+hBzCLRooFuyF+hN6sS376uC5oBOarVQOg84png0FJSAezlK8pVUXKKcL+kFdrWWN40lKgS7Po86p/hxdJI387DrImuNjOPFPSg8Vun8w02DSwFHn3gb7MXs6EzlWnVnnTQsN0/ncn+Ya3SvkrtaDh9/TVVwoIbiCg4YhKWTZUna5xenY3wsYBxZzsxRI4X2nU/NqwCQ65/k6XzuLJq2SH8/epNKA1+dfmlSF0/IGQT6FeTDRXKMLpG3ucuy8+rBYnQSaOk7xohQ7lgfHIn/XTsIPS7ZohmpukpmXrXsAtii9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+/8Xn6UCRdNqx3X44X9ogFDXli8hym8wKlPB0YaaRw=;
 b=diNz6X+ZzuLQ0vHfFnnX7caKY8hhmCQiej7B8dKJMI175vGZ//b5OtmFd9K5GaRRBOlamOldQPQLWt2DESdRx5i8pyIgGJbqaAsvhPdnLKO0BsCU6++iEvWFR4chHIyTxa2CR4YHixJic02dPM4YqrpCin4lCNJ/CfckD9cT58rUTTWzBRgwCgTDjA4ULXJZe4bJ7F/Vr3b2+VZQMIXGoLXtPXOmapUFrWLsYgbkuMgn92LpFS5KVt1554af9hlXnaB9s10DG0nMjpJZJ3o+oVMPb+J7w8FGIq5A5WMSF3EFiRtAhlfEfmgws5iTQNC1+Zug1oYvQERbT/SIBa3Pkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+/8Xn6UCRdNqx3X44X9ogFDXli8hym8wKlPB0YaaRw=;
 b=cX4418KNxnBWESQOfGaPz7y0fMvy1Wz3s0EYZaab49HGVgOVCdaIUCqj5uxrle/hpA+Pb8N45FGCES41qjGVJIswvaqIsvYH0dXdHyOOmdTKl2V7m2w3272sjXGGTqNXi0ErxdH/SGYEeKv9zkj2Vl6Hykjx3i0nWuu9XADzbjA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by SJ0PR10MB4765.namprd10.prod.outlook.com (2603:10b6:a03:2af::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Mon, 16 Aug
 2021 16:43:02 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539%7]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 16:43:02 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 13/16] vfio-user: dma map/unmap operations
Date: Mon, 16 Aug 2021 09:42:46 -0700
Message-Id: <8960370c1ce02089099702878ed6fb6c3d42ad06.1629131628.git.elena.ufimtseva@oracle.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1629131628.git.elena.ufimtseva@oracle.com>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::31) To BYAPR10MB2869.namprd10.prod.outlook.com
 (2603:10b6:a03:85::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from nuker.hsd1.ca.comcast.net
 (2601:642:4000:a09:154a:3cd:532c:f36d) by
 BY3PR03CA0026.namprd03.prod.outlook.com (2603:10b6:a03:39a::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Mon, 16 Aug 2021 16:43:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17d240b4-106a-4a5b-bc4f-08d960d4e9f6
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4765:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB476539631B596A22F55AB5A28CFD9@SJ0PR10MB4765.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ec2VJpIvPTbMvh7QaHJ3h1S57cAHAqtd7ZxGFECqlLKzJtTpQq0sJXCkAr2cyRDzEkZmrrFPuz1i40khqBU7td3m6vwE08Dzx5oB0/M0do84f5D4oFN+PubMdA1TCfagK2H5zz7c8DztNl3CNEG54qS3tPia/s9miIRwiUpIWmb1ZLtE2IjBF1OYrhuecTDgFpGH5zTf8z98BZ7aF3svhiv+kH77aboTCbXPjy2FER+RGHyIwTj81xtWHTE0NWoqgzvGJjuieHIe1TIC/FOGeD8AbNCY1CHMnqU/PpHP7e7eS8j4zl5dDnXD7DpJI40oKcNu89mp3IoDKBIWhACyxsNxlrx83lgXmBTvF630wxgOyegkVWHdq9w9Z10T/v1ueboYxD14Lgi8y1+peV8USWAkFWlfwBNn3OStoT6leph7Hz8Izw35NO9WZsuc3GM8CY5xct9/RTOJgB7jp9AfPlPg2MK/7C9rbe1vWGuCFhu+ii8dps5mM1ShftT4aZSV+kYUojA34KQWmY0k8eqVAK5225bKEpMAQMwA7TlSEBXci+7Fsu9Ci1xKTl9/BsjbrB4AvatXGjBloIhukFBKNfKo4aamiSAfZAHqkqlOO7gbaWlF+hqgscUSf4GWJWFwYy+45BBMwjkPwgOzjYgA1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(2906002)(86362001)(30864003)(66556008)(4326008)(38100700002)(8676002)(508600001)(66476007)(6486002)(66946007)(6506007)(5660300002)(44832011)(2616005)(6512007)(6666004)(36756003)(6916009)(316002)(52116002)(83380400001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AWnQHpEXy6OCoe91mOoAvAnL1GYu9qG914LZSb+cc8ZuEnF3J5W4ULm5HZ3j?=
 =?us-ascii?Q?AW0MwSNWtMjalw3/8cuJtyyu2tTrorbFkVpRTVmF2VlaVgW6L9xhIkD3LjPr?=
 =?us-ascii?Q?W2YJyqRqQREbTjdiOQkAZDuwbaj8+kqWQN/aS5em/W8fzrmIDaDl832z2N7g?=
 =?us-ascii?Q?TyfmGkVd9E06N53mdhzZ5TbypYa9hH3MczMsLPbbtEcj1/hrl9FclzQMpvCI?=
 =?us-ascii?Q?AgUWNysdgEP8LxKVQvbpGIGNsQunel8XapDec7naPbJ0kM5700q/5EiSFuVy?=
 =?us-ascii?Q?D9NriCbx3Aax8DUSY2w/UOCM76hsZb3WWU2d2v3/14PX3mjLui6lInp7Clfb?=
 =?us-ascii?Q?SNAH0pP44wO+7hFgXIn7i0ZnBmQSE4VhKTVIFsmzSgf8Rw9FGLyKozj9CKOJ?=
 =?us-ascii?Q?/QO7kdNoIyeyQuPuZ4n4FMfEC5u6voQo45QRKq8/trSkKsAEQasE9yby+uW3?=
 =?us-ascii?Q?GQBkf8gHIPY6v9c1X2DaCK6zH3k/BxH0Iyww/HeWM/DpdBnqxD5O8T7LX8Mu?=
 =?us-ascii?Q?g5XqSGVYAzAGlAfWyiBZYgZok2LCwcldmVrzDWhC5X+TmyTbiI88v3iSP/yt?=
 =?us-ascii?Q?scnrzYyNUoLDpm3oHBiXT2DHzne/elEVldmlmrp+qbX7P8d/y1ayQfGjJScE?=
 =?us-ascii?Q?FqvVfC+abI4dTLwA/mBDSOp6sabl2J/1gxlrAHscqMZokvSWm0omxHC0BDKY?=
 =?us-ascii?Q?+WwKjTON0pUutpa/wjbEbFjNK0vdFPyvi5bNR1kNvrpRQEJ+qLX2zD/AoRIH?=
 =?us-ascii?Q?jiPs/cX76Em2RBSXo4d6ricrN1W4XMKIxuUMq41U8YQMMWR5oIR+ZFECpVTg?=
 =?us-ascii?Q?Hk/iQhV9ri3pYYiZHmtt1Nl2FgBsdjndL1LsNd7uVhmHhy7WucmlW7vTwWFX?=
 =?us-ascii?Q?G66qP+tgK8g1lXJjetU5XzHrxN7sEeQ9zhdu9AFcSmovQ3l8NM5X7K1VVvLx?=
 =?us-ascii?Q?ctlj9CnVDVCvgOIL10ymIcKwN3N7HmmFf5Baf04EPrgEj3ENPiI9TrmnkitN?=
 =?us-ascii?Q?jfFMgDyl5PuNmk/zAgQmdw7FduTSZDpG9LwubqW9qtnb645QZL7ndNCV0RZX?=
 =?us-ascii?Q?IK0uRP+DTvGVl5jkdfRkb/+Dx0z/sJ8Gi0A282cCqqdkjfAR7532cd1SkAG2?=
 =?us-ascii?Q?JNkm7cVhIjEDtauVwfhcnI82e98DqPv2rRSFjX63/6wtYggGIeqVljQPeP3b?=
 =?us-ascii?Q?rDr8V7s+M7F1OlVZJa8dyhMZApY3hGEbwrqKlQbSDlOm63uqCz4NAh5dpWte?=
 =?us-ascii?Q?N/aT22OO1ERTftxYp1MDw66lsH1ahQoAOs1G8ULS78xTnJU1vMwmoENJWRVJ?=
 =?us-ascii?Q?spjt4fZFr/Y5iRQMzPuYbLp4ttJyqOuqIyEA6sdi/1vw+qZgNh2UDvwc5zvy?=
 =?us-ascii?Q?cTjjR0SrqvzjRzcmNr0lXkNmK+5q?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d240b4-106a-4a5b-bc4f-08d960d4e9f6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 16:43:02.5579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SSTYhRKcRw3t2m8Zn/ZsgERbSczrkxIWFX/c5kVeRAku/QSZpkqrao6t0C/zC7eExQ3ghYz54mb78uj1Fm4b20xX9pKVA1K7LXWcOSk3EFQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4765
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10078
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108160105
X-Proofpoint-GUID: AXjR6khvQVIOmDGrzgaIG8VVwaQ_L6pt
X-Proofpoint-ORIG-GUID: AXjR6khvQVIOmDGrzgaIG8VVwaQ_L6pt
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, jag.raman@oracle.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, alex.williamson@redhat.com,
 stefanha@redhat.com, thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Johnson <john.g.johnson@oracle.com>

Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
---
 hw/vfio/user-protocol.h       |  32 +++++++++
 hw/vfio/user.h                |   6 ++
 include/hw/vfio/vfio-common.h |   1 +
 hw/vfio/common.c              |  71 ++++++++++++++++---
 hw/vfio/user.c                | 124 ++++++++++++++++++++++++++++++++++
 5 files changed, 226 insertions(+), 8 deletions(-)

diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
index 5614efa0a4..ca53fce5f4 100644
--- a/hw/vfio/user-protocol.h
+++ b/hw/vfio/user-protocol.h
@@ -82,6 +82,31 @@ typedef struct {
 #define VFIO_USER_MAX_MAX_XFER  (64 * 1024 * 1024)
 
 
+/*
+ * VFIO_USER_DMA_MAP
+ * imported from struct vfio_iommu_type1_dma_map
+ */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint32_t argsz;
+    uint32_t flags;
+    uint64_t offset;    /* FD offset */
+    uint64_t iova;
+    uint64_t size;
+} VFIOUserDMAMap;
+
+/*
+ * VFIO_USER_DMA_UNMAP
+ * imported from struct vfio_iommu_type1_dma_unmap
+ */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint32_t argsz;
+    uint32_t flags;
+    uint64_t iova;
+    uint64_t size;
+} VFIOUserDMAUnmap;
+
 /*
  * VFIO_USER_DEVICE_GET_INFO
  * imported from struct_device_info
@@ -146,4 +171,11 @@ typedef struct {
     char data[];
 } VFIOUserRegionRW;
 
+/*imported from struct vfio_bitmap */
+typedef struct {
+    uint64_t pgsize;
+    uint64_t size;
+    char data[];
+} VFIOUserBitmap;
+
 #endif /* VFIO_USER_PROTOCOL_H */
diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index 248ad80943..7786ab57c5 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -71,6 +71,11 @@ void vfio_user_set_reqhandler(VFIODevice *vbasdev,
                                              void *reqarg);
 void vfio_user_send_reply(VFIOProxy *proxy, char *buf, int ret);
 int vfio_user_validate_version(VFIODevice *vbasedev, Error **errp);
+int vfio_user_dma_map(VFIOProxy *proxy, struct vfio_iommu_type1_dma_map *map,
+                      VFIOUserFDs *fds, bool will_commit);
+int vfio_user_dma_unmap(VFIOProxy *proxy,
+                        struct vfio_iommu_type1_dma_unmap *unmap,
+                        struct vfio_bitmap *bitmap, bool will_commit);
 int vfio_user_get_info(VFIODevice *vbasedev);
 int vfio_user_get_region_info(VFIODevice *vbasedev, int index,
                               struct vfio_region_info *info, VFIOUserFDs *fds);
@@ -80,5 +85,6 @@ int vfio_user_region_read(VFIODevice *vbasedev, uint32_t index, uint64_t offset,
                           uint32_t count, void *data);
 int vfio_user_region_write(VFIODevice *vbasedev, uint32_t index,
                            uint64_t offset, uint32_t count, void *data);
+void vfio_user_drain_reqs(VFIOProxy *proxy);
 
 #endif /* VFIO_USER_H */
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 688660c28d..13d1d14c3b 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -87,6 +87,7 @@ typedef struct VFIOContainer {
     Error *error;
     bool initialized;
     bool dirty_pages_supported;
+    bool will_commit;
     uint64_t dirty_pgsizes;
     uint64_t max_dirty_bitmap_size;
     unsigned long pgsizes;
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 57b9e111e6..a532e52bcf 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -427,6 +427,7 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
     struct vfio_iommu_type1_dma_unmap *unmap;
     struct vfio_bitmap *bitmap;
     uint64_t pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size;
+    bool will_commit = container->will_commit;
     int ret;
 
     unmap = g_malloc0(sizeof(*unmap) + sizeof(*bitmap));
@@ -460,7 +461,11 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
         goto unmap_exit;
     }
 
-    ret = ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, unmap);
+    if (container->proxy != NULL) {
+        ret = vfio_user_dma_unmap(container->proxy, unmap, bitmap, will_commit);
+    } else {
+        ret = ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, unmap);
+    }
     if (!ret) {
         cpu_physical_memory_set_dirty_lebitmap((unsigned long *)bitmap->data,
                 iotlb->translated_addr, pages);
@@ -487,12 +492,17 @@ static int vfio_dma_unmap(VFIOContainer *container,
         .iova = iova,
         .size = size,
     };
+    bool will_commit = container->will_commit;
 
     if (iotlb && container->dirty_pages_supported &&
         vfio_devices_all_running_and_saving(container)) {
         return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
     }
 
+    if (container->proxy != NULL) {
+        return vfio_user_dma_unmap(container->proxy, &unmap, NULL, will_commit);
+    }
+
     while (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
         /*
          * The type1 backend has an off-by-one bug in the kernel (71a7d3d78e3c
@@ -519,7 +529,7 @@ static int vfio_dma_unmap(VFIOContainer *container,
     return 0;
 }
 
-static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
+static int vfio_dma_map(VFIOContainer *container, MemoryRegion *mr, hwaddr iova,
                         ram_addr_t size, void *vaddr, bool readonly)
 {
     struct vfio_iommu_type1_dma_map map = {
@@ -529,11 +539,30 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
         .iova = iova,
         .size = size,
     };
+    bool will_commit = container->will_commit;
 
     if (!readonly) {
         map.flags |= VFIO_DMA_MAP_FLAG_WRITE;
     }
 
+    if (container->proxy != NULL) {
+        VFIOUserFDs fds;
+        int fd;
+
+        fd = memory_region_get_fd(mr);
+        if (fd != -1 && !(container->proxy->flags & VFIO_PROXY_SECURE)) {
+            fds.send_fds = 1;
+            fds.recv_fds = 0;
+            fds.fds = &fd;
+            map.vaddr = qemu_ram_block_host_offset(mr->ram_block, vaddr);
+
+            return vfio_user_dma_map(container->proxy, &map, &fds, will_commit);
+        } else {
+            map.vaddr = 0;
+            return vfio_user_dma_map(container->proxy, &map, NULL, will_commit);
+        }
+    }
+
     /*
      * Try the mapping, if it fails with EBUSY, unmap the region and try
      * again.  This shouldn't be necessary, but we sometimes see it in
@@ -602,7 +631,8 @@ static bool vfio_listener_skipped_section(MemoryRegionSection *section)
 
 /* Called with rcu_read_lock held.  */
 static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
-                               ram_addr_t *ram_addr, bool *read_only)
+                               ram_addr_t *ram_addr, bool *read_only,
+                               MemoryRegion **mrp)
 {
     MemoryRegion *mr;
     hwaddr xlat;
@@ -683,6 +713,10 @@ static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
         *read_only = !writable || mr->readonly;
     }
 
+    if (mrp != NULL) {
+        *mrp = mr;
+    }
+
     return true;
 }
 
@@ -690,6 +724,7 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
 {
     VFIOGuestIOMMU *giommu = container_of(n, VFIOGuestIOMMU, n);
     VFIOContainer *container = giommu->container;
+    MemoryRegion *mr;
     hwaddr iova = iotlb->iova + giommu->iommu_offset;
     void *vaddr;
     int ret;
@@ -708,7 +743,7 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
     if ((iotlb->perm & IOMMU_RW) != IOMMU_NONE) {
         bool read_only;
 
-        if (!vfio_get_xlat_addr(iotlb, &vaddr, NULL, &read_only)) {
+        if (!vfio_get_xlat_addr(iotlb, &vaddr, NULL, &read_only, &mr)) {
             goto out;
         }
         /*
@@ -718,7 +753,7 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
          * of vaddr will always be there, even if the memory object is
          * destroyed and its backing memory munmap-ed.
          */
-        ret = vfio_dma_map(container, iova,
+        ret = vfio_dma_map(container, mr, iova,
                            iotlb->addr_mask + 1, vaddr,
                            read_only);
         if (ret) {
@@ -780,7 +815,7 @@ static int vfio_ram_discard_notify_populate(RamDiscardListener *rdl,
                section->offset_within_address_space;
         vaddr = memory_region_get_ram_ptr(section->mr) + start;
 
-        ret = vfio_dma_map(vrdl->container, iova, next - start,
+        ret = vfio_dma_map(vrdl->container, section->mr, iova, next - start,
                            vaddr, section->readonly);
         if (ret) {
             /* Rollback */
@@ -888,6 +923,24 @@ static void vfio_unregister_ram_discard_listener(VFIOContainer *container,
     g_free(vrdl);
 }
 
+static void vfio_listener_begin(MemoryListener *listener)
+{
+    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
+
+    container->will_commit = 1;
+}
+
+static void vfio_listener_commit(MemoryListener *listener)
+{
+    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
+
+    /* wait for any async requests sent during the transaction */
+    if (container->proxy != NULL) {
+        vfio_user_drain_reqs(container->proxy);
+    }
+    container->will_commit = 0;
+}
+
 static void vfio_listener_region_add(MemoryListener *listener,
                                      MemoryRegionSection *section)
 {
@@ -1080,7 +1133,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
         }
     }
 
-    ret = vfio_dma_map(container, iova, int128_get64(llsize),
+    ret = vfio_dma_map(container, section->mr, iova, int128_get64(llsize),
                        vaddr, section->readonly);
     if (ret) {
         error_setg(&err, "vfio_dma_map(%p, 0x%"HWADDR_PRIx", "
@@ -1346,7 +1399,7 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
     }
 
     rcu_read_lock();
-    if (vfio_get_xlat_addr(iotlb, NULL, &translated_addr, NULL)) {
+    if (vfio_get_xlat_addr(iotlb, NULL, &translated_addr, NULL, NULL)) {
         int ret;
 
         ret = vfio_get_dirty_bitmap(container, iova, iotlb->addr_mask + 1,
@@ -1463,6 +1516,8 @@ static void vfio_listener_log_sync(MemoryListener *listener,
 }
 
 static const MemoryListener vfio_memory_listener = {
+    .begin = vfio_listener_begin,
+    .commit = vfio_listener_commit,
     .region_add = vfio_listener_region_add,
     .region_del = vfio_listener_region_del,
     .log_global_start = vfio_listener_log_global_start,
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index b68ca1279d..06bcd46e60 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -408,6 +408,47 @@ static void vfio_user_send_recv(VFIOProxy *proxy, VFIOUserHdr *msg,
     }
 }
 
+void vfio_user_drain_reqs(VFIOProxy *proxy)
+{
+    VFIOUserReply *reply;
+    bool iolock = 0;
+
+    /*
+     * Any DMA map/unmap requests sent in the middle
+     * of a memory region transaction were sent async.
+     * Wait for them here.
+     */
+    QEMU_LOCK_GUARD(&proxy->lock);
+    if (proxy->last_nowait != NULL) {
+        iolock = qemu_mutex_iothread_locked();
+        if (iolock) {
+            qemu_mutex_unlock_iothread();
+        }
+
+        reply = proxy->last_nowait;
+        reply->nowait = 0;
+        while (reply->complete == 0) {
+            if (!qemu_cond_timedwait(&reply->cv, &proxy->lock, wait_time)) {
+                error_printf("vfio_drain_reqs - timed out\n");
+                break;
+            }
+        }
+
+        if (reply->msg->flags & VFIO_USER_ERROR) {
+            error_printf("vfio_user_rcv error reply on async request ");
+            error_printf("command %x error %s\n", reply->msg->command,
+                         strerror(reply->msg->error_reply));
+        }
+        proxy->last_nowait = NULL;
+        g_free(reply->msg);
+        QTAILQ_INSERT_HEAD(&proxy->free, reply, next);
+    }
+
+    if (iolock) {
+        qemu_mutex_lock_iothread();
+    }
+}
+
 static void vfio_user_request_msg(VFIOUserHdr *hdr, uint16_t cmd,
                                   uint32_t size, uint32_t flags)
 {
@@ -715,6 +756,89 @@ int vfio_user_validate_version(VFIODevice *vbasedev, Error **errp)
     return 0;
 }
 
+int vfio_user_dma_map(VFIOProxy *proxy, struct vfio_iommu_type1_dma_map *map,
+                      VFIOUserFDs *fds, bool will_commit)
+{
+    VFIOUserDMAMap *msgp = g_malloc(sizeof(*msgp));
+    int ret, flags;
+
+    /* commit will wait, so send async without dropping BQL */
+    flags = will_commit ? (NOIOLOCK | NOWAIT) : 0;
+
+    vfio_user_request_msg(&msgp->hdr, VFIO_USER_DMA_MAP, sizeof(*msgp), 0);
+    msgp->argsz = map->argsz;
+    msgp->flags = map->flags;
+    msgp->offset = map->vaddr;
+    msgp->iova = map->iova;
+    msgp->size = map->size;
+
+    vfio_user_send_recv(proxy, &msgp->hdr, fds, 0, flags);
+    ret = (msgp->hdr.flags & VFIO_USER_ERROR) ? -msgp->hdr.error_reply : 0;
+
+    if (!(flags & NOWAIT)) {
+        g_free(msgp);
+    }
+    return ret;
+}
+
+int vfio_user_dma_unmap(VFIOProxy *proxy,
+                        struct vfio_iommu_type1_dma_unmap *unmap,
+                        struct vfio_bitmap *bitmap, bool will_commit)
+{
+    struct {
+        VFIOUserDMAUnmap msg;
+        VFIOUserBitmap bitmap;
+    } *msgp = NULL;
+    int msize, rsize, flags;
+
+    if (bitmap == NULL && (unmap->flags &
+                           VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP)) {
+        error_printf("vfio_user_dma_unmap mismatched flags and bitmap\n");
+        return -EINVAL;
+    }
+
+    /* can't drop BQL until commit */
+    flags = will_commit ? NOIOLOCK : 0;
+
+    /*
+     * If a dirty bitmap is returned, allocate extra space for it
+     * otherwise, just send the unmap request
+     */
+    if (bitmap != NULL) {
+        msize = sizeof(*msgp);
+        rsize = msize + bitmap->size;
+        msgp = g_malloc0(rsize);
+        msgp->bitmap.pgsize = bitmap->pgsize;
+        msgp->bitmap.size = bitmap->size;
+    } else {
+        /* can only send async if no bitmap returned */
+        flags |= will_commit ? NOWAIT : 0;
+        msize = rsize = sizeof(VFIOUserDMAUnmap);
+        msgp = g_malloc0(rsize);
+    }
+
+    vfio_user_request_msg(&msgp->msg.hdr, VFIO_USER_DMA_UNMAP, msize, flags);
+    msgp->msg.argsz = unmap->argsz;
+    msgp->msg.flags = unmap->flags;
+    msgp->msg.iova = unmap->iova;
+    msgp->msg.size = unmap->size;
+
+    vfio_user_send_recv(proxy, &msgp->msg.hdr, NULL, rsize, flags);
+    if (msgp->msg.hdr.flags & VFIO_USER_ERROR) {
+        g_free(msgp);
+        return -msgp->msg.hdr.error_reply;
+    }
+
+    if (bitmap != NULL) {
+        memcpy(bitmap->data, &msgp->bitmap.data, bitmap->size);
+    }
+    if (!(flags & NOWAIT)) {
+        g_free(msgp);
+    }
+
+    return 0;
+}
+
 int vfio_user_get_info(VFIODevice *vbasedev)
 {
     VFIOUserDeviceInfo msg;
-- 
2.25.1


