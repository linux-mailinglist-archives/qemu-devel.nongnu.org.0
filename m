Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00825549F81
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 22:38:05 +0200 (CEST)
Received: from localhost ([::1]:58772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0qp1-0005vh-RP
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 16:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1o0qfZ-0008Mt-Qi
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 16:28:18 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:32754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1o0qfX-0001uU-Ij
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 16:28:17 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25DJXYlU025660;
 Mon, 13 Jun 2022 20:28:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=gvk5wPP/GPdxf1Y112oPgycOePUd1nl9QNDGaClKGfg=;
 b=gCu0BSbI2LMc5WgOIWfEAGit7QePEvlRoO4IKzuNgxacvOLjsBggixcDh1lmvvyIXDkk
 NZwF9ybMca6TzCbXvTrekLn5DErxTAsdsG0BonS63tQAzdkPGR8zI6YkN9CL1rSzmLEC
 dSJq+bUezmPBGbJY1xg6sokJ0rnsTHuIWd66frKq4+r0rXZcpSrkqoLFve5yqt6nzu0k
 5Vy2dHTGiPuBu51Nox1Aun63v6xF+ZcVphocbWvCUx5CFSxDMGDsg/ez6aA6bur5LHvK
 SEEd/f3jykxpFz+VPTnb4G2fw0swiiAJJxDC1K4HIotC/caoE2yI0rTkIOH8+tIB5iwG 6g== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmjx9c1ya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 20:28:03 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25DKG5SS007030; Mon, 13 Jun 2022 20:28:02 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gpc4d09aj-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 20:28:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CetYI68PEBpQh3eh+SbOAtSm73fRELF98yB0j+Xjn6OHLSG09yKOSnafSQPHBoaLPmtr0KQDRqNJ1stJ0NipgrbW3FWgjFY7YLRwegBAtj9qxsvp6SwncdmctU6xesGtrz7x/mBI4dfQLl5FMM4ugi234MVHt6t2+oDrXgRylrRIGaBwg0wQVXfw+74loOG16GJ+9HfRkxzwVLjIKqvZpuqA1iHnHwb0VxfUJ69kJ9I7Jg6+xS5gfZ7u03KPGdXR1VSRKJ3gVVOU/qyjPSIA2Js0BZD2UcFpSDzQaxlSNn5fjijKlyuhWybXuYVd9XTteYbAek80LTL5Dg9Wrm5eQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvk5wPP/GPdxf1Y112oPgycOePUd1nl9QNDGaClKGfg=;
 b=dtUWAMFtKhlT2TxRMMZNksrkcqI8X91l9BLJhMG9Vtavb6KQVc4UcMU6RFI7/MKXxTo88ie5ANIxU5KXzSucExgLPdzn3gPubk7dytxOaQvltzRlwCkxZJ1bkJekT3Xv13+3hVOLaaaCUKnbB5Z6JAVxU0N1MeGf46mdSveVg+L7egjqCNtIUiVZ7P8iEdc22qyyVTRa5D73fhmjbsHfV6hr+pKmN1KhboMtxAxRrWYsFxWdLx6jRngQKgnWfb1kyRcU27vLfDRBGWC5DE0e1NRp1gTppbCQrEg6gDktWpzZ7qUooRZUinUNRa/xP3ExbUkSaSblZxc8/Wk9h0rfRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvk5wPP/GPdxf1Y112oPgycOePUd1nl9QNDGaClKGfg=;
 b=kCI8ETKJG1HWmvQrpSAoLuGDze6Anr1cdbQwJkjrjtMRz7AI7LjH0ckevgb+LpG0RRjIcR2T1de5xSlk7c8+OAnUqJpeqhum8ETOZXYeFLHRws0yR9oDymg5y3GfqYnqGSo+qNS3pOxnfW9/dLG8XKHpnmJbsAFVzdP+szPyY3o=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MWHPR10MB2045.namprd10.prod.outlook.com (2603:10b6:300:109::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.16; Mon, 13 Jun
 2022 20:27:48 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 20:27:48 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, alex.williamson@redhat.com,
 f4bug@amsat.org, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, bleal@redhat.com, berrange@redhat.com,
 peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v12 12/14] vfio-user: handle PCI BAR accesses
Date: Mon, 13 Jun 2022 16:26:32 -0400
Message-Id: <3373e10b5be5f42846f0632d4382466e1698c505.1655151679.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1655151679.git.jag.raman@oracle.com>
References: <cover.1655151679.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::23) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88314628-f741-4d41-53f6-08da4d7b2e2c
X-MS-TrafficTypeDiagnostic: MWHPR10MB2045:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB20455153032560EF46E1715690AB9@MWHPR10MB2045.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rhb8Tws46Wox7SMrpE/J65oi6/EfymVqHO7aoYDAmuqFtIH8E8XRIy1IQhiJPbTx4MXujR5OzdN1g6sbpCrUrcVeSwiRKHwXtfTQzRPTQuXFjdyBem1XsfGPdEyBtwxHa/P4ZzG/VRHxGXTXK693VWmM/4wqqLA6dkBcZ274r33f6i5Ugbzd71EC+EASIoAbSGvzWnuhkcoytzpTWFKfjyaSbSBdCNNnG/awSRXFzqAmV3X/W8nnfX9jY6/je/huY42cQnvkN0RXTYERnE2CAC4OvHjLcQ9nCUeNNFMZpL0iZnBpFKRKj4Rxti3y5wY3uVATYr/Lt0NvQoFyYoKB1xAYliAAL7Ce5xir6xE52H9JBAqgXICJmLH0iSEWlzaTMkJDqpR+8MZ16WpzpCeYQDm7bJqlpPFv3vY3SxxjaEUd6VwjJri9zOHqNbWAVhEKUZSMrquAIQnTNEbgywHDs2VGPKIDFZ/DA7O37j4nXg1fIXFuY2576LFTZwMvflDGExasPpdBXfEEEfHoAERwWThVslqSuahGy/cH8mKjVbepsMMSxOBSFRR6gvIGoJDzYf0spzRXT9RB89xdPSoeYRoowclnyDBGpNHCb2EAIgsY1UpBtq9tOM5Nb8CUb9ShE7Ma1oJZCVffbA8JIxLLUnpgBVezfv2Lm+fOqX5EKzVjmMdDin1pwxW2Hcr+bRfkNtGZ+wkiaArThygF3WQ1vA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(5660300002)(7416002)(508600001)(8936002)(6486002)(66946007)(66556008)(66476007)(26005)(6512007)(2906002)(2616005)(86362001)(6666004)(83380400001)(186003)(6506007)(52116002)(107886003)(38100700002)(36756003)(6916009)(38350700002)(316002)(4326008)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lmwylXoAbns2X36OhOdwRzwFXmx3LVfG7scIPh8hkHNzi21V9+EltiTIQSTC?=
 =?us-ascii?Q?UN6S1OXEpTNyarlPBQfsRnip5XfutnU4ja0di2DxjVYeGU6rEMkrIJjO4fbu?=
 =?us-ascii?Q?rBmdqjLkIii6ccYxvF2BskhLCb138coKfaw2VKkE/KuGVWa9+OwK6gJvcOkt?=
 =?us-ascii?Q?4mtys1ObxENtQishIh5IXgXvRWBX4TAhjMbQpDaQ4XiOPP0gzfpDSThQTSna?=
 =?us-ascii?Q?I4n3SCU15e1ILOHdb2Z4Cx+ak/nJADseU4kCpfs8qAg9St6G8qZNvf9Xvi5w?=
 =?us-ascii?Q?y3M7WRgHAauOnQs8wC+yF41+9ZLe2yMeyvNBTnP8WPL8g8X9kXEUsNsRcLvD?=
 =?us-ascii?Q?E4k72ByXPqLUZZdbanYQ14YEDXkmttTuqMxF5QMzwS4wCenlRcwZa9QF/dFm?=
 =?us-ascii?Q?eYeS6TpHScRpPUDg6NA70Mp5O1W1sz/GEycIrRY+oTvIST31HZ39UA1wtQUz?=
 =?us-ascii?Q?SK8QGdK+s4448z9wQaP+CkzHkf4Xd/gDKxNgirCvh2+KPbm3/+lZM8ZwHAc/?=
 =?us-ascii?Q?hfSVJSczT5Q18o6QozlGDMaNRwdcj3c6Ft8RhR+2ARv8KNXR3DMSUORxjnFR?=
 =?us-ascii?Q?8dnpaLHQgOvCOhi4TLFbCzSUBhCv/GLkHesfox75fgch6EBJCfpRrGOaSxPS?=
 =?us-ascii?Q?3z00DYNhaqKiyQAvjxeJmGviuTdcJXNm7gmOJx+Cm+p67Aa1vmQSG1ft2u6O?=
 =?us-ascii?Q?2TgC2JkXMWll4vb323IQJ237jpPJ+Zpxijk9du2n9N9GcuV1MZhHBty7rh3s?=
 =?us-ascii?Q?s8UWa/9IP/Rc2pbC6GP1PYHEfwt6nYit9p6xBuLp/jFrtdA4TTGN6Zbcwi0a?=
 =?us-ascii?Q?KRGeWRgGxjNXmiDf4MOqhWo5ckf2tDR/U1JsgcPClsExkhlsGOIxboCx9Y4U?=
 =?us-ascii?Q?G+oi5gEHJChjZv4fXQ1WfIyED7HNZBqQ4IF27tI5LH25T3MKe0/icfR12shS?=
 =?us-ascii?Q?VtrmSm16sXQdiZyEKCpdhg/QjgbfSaFgq1H99W2G2L9L9sisMf1T7HU6ghYE?=
 =?us-ascii?Q?+j8vSpMR6x+ON6j5VQeMXB8RNE/ZSfjOM5h5qSi5vUGt1O+o5LUe8bfS3K7A?=
 =?us-ascii?Q?MoLO3oISgG7jdgQIw46cQIdDO2fV74b4XLYNn4P41xV8xEHPmJDa1RjeSe+V?=
 =?us-ascii?Q?U7KJXzThKwPzYlHMMiDQ+relOqLF4iHaFIEgTpjZgqkYqDdGnm8jecDtN2y9?=
 =?us-ascii?Q?1xOOpY0SyRpsyBldr1ZGIevTQL7zToCTXkZgsanzmeUmQlQI621tGjftzVTQ?=
 =?us-ascii?Q?xPjeIXBNSoO3uL4kbR4JZwutqKLG0miGx9bMRX8buJo2PGzHwSbZjWJEHeC0?=
 =?us-ascii?Q?8Bi5cvxae5FZhNEojzTtAuijoJ0Tt9jDJmhr9zVB8WXaeFicaBU2lcLVA8pA?=
 =?us-ascii?Q?1tRdY/H3GULnqT3aaB1sMNx89VdNjSCZmUXTQcob51kulSBKL1rcn08Uz/xq?=
 =?us-ascii?Q?kOaupnVgSg6xh8VTLL1iURfbm6Zx+qcfig75OJKlyd4SD1ANj5OcBzBmy9Zj?=
 =?us-ascii?Q?JCBjEeMpojrWnUJkh++sdP2KK4yIAGOJmnbUmm+HRw+9co+qsS7YrnxGABmv?=
 =?us-ascii?Q?uEvnsoFUKjpDbvlknd6QjfVoXv06tF5CCDAdP3b763Mj+ErCQ9KcHwuzKR+R?=
 =?us-ascii?Q?bdBxAIs8bQEQLC+5TF81WkoRW2WAEp80P9LNuDdocx7Z60htC3RQP+zCXdcE?=
 =?us-ascii?Q?Ck27rF5SWJVXmHyYf6X+7NGfr/B2qhXx+FCNbdVx3EHPk22+731NK07CxI4+?=
 =?us-ascii?Q?EHonU6YF8Q=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88314628-f741-4d41-53f6-08da4d7b2e2c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 20:27:48.7787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rNatQO1dkcNwgRCZaZ5esmP+/PrJXYHCocJrJtlZAHBHbddWWqsg9a4mYUdYLUCmfHt9BqbyAIHk4af8uCWXAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB2045
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-13_08:2022-06-13,
 2022-06-13 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0
 malwarescore=0 spamscore=0 mlxscore=0 adultscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206130082
X-Proofpoint-ORIG-GUID: 2dJhxoAGVqxMzxRSy8MS4aInDKdud94p
X-Proofpoint-GUID: 2dJhxoAGVqxMzxRSy8MS4aInDKdud94p
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Determine the BARs used by the PCI device and register handlers to
manage the access to the same.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/exec/memory.h           |   3 +
 hw/remote/vfio-user-obj.c       | 190 ++++++++++++++++++++++++++++++++
 softmmu/physmem.c               |   4 +-
 tests/qtest/fuzz/generic_fuzz.c |   9 +-
 hw/remote/trace-events          |   3 +
 5 files changed, 203 insertions(+), 6 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index f1c19451bc..a6a0f4d8ad 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2810,6 +2810,9 @@ MemTxResult address_space_write_cached_slow(MemoryRegionCache *cache,
                                             hwaddr addr, const void *buf,
                                             hwaddr len);
 
+int memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr);
+bool prepare_mmio_access(MemoryRegion *mr);
+
 static inline bool memory_access_is_direct(MemoryRegion *mr, bool is_write)
 {
     if (is_write) {
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 7b21f77052..dd760a99e2 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -52,6 +52,7 @@
 #include "hw/qdev-core.h"
 #include "hw/pci/pci.h"
 #include "qemu/timer.h"
+#include "exec/memory.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -332,6 +333,193 @@ static void dma_unregister(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
     trace_vfu_dma_unregister((uint64_t)info->iova.iov_base);
 }
 
+static int vfu_object_mr_rw(MemoryRegion *mr, uint8_t *buf, hwaddr offset,
+                            hwaddr size, const bool is_write)
+{
+    uint8_t *ptr = buf;
+    bool release_lock = false;
+    uint8_t *ram_ptr = NULL;
+    MemTxResult result;
+    int access_size;
+    uint64_t val;
+
+    if (memory_access_is_direct(mr, is_write)) {
+        /**
+         * Some devices expose a PCI expansion ROM, which could be buffer
+         * based as compared to other regions which are primarily based on
+         * MemoryRegionOps. memory_region_find() would already check
+         * for buffer overflow, we don't need to repeat it here.
+         */
+        ram_ptr = memory_region_get_ram_ptr(mr);
+
+        if (is_write) {
+            memcpy((ram_ptr + offset), buf, size);
+        } else {
+            memcpy(buf, (ram_ptr + offset), size);
+        }
+
+        return 0;
+    }
+
+    while (size) {
+        /**
+         * The read/write logic used below is similar to the ones in
+         * flatview_read/write_continue()
+         */
+        release_lock = prepare_mmio_access(mr);
+
+        access_size = memory_access_size(mr, size, offset);
+
+        if (is_write) {
+            val = ldn_he_p(ptr, access_size);
+
+            result = memory_region_dispatch_write(mr, offset, val,
+                                                  size_memop(access_size),
+                                                  MEMTXATTRS_UNSPECIFIED);
+        } else {
+            result = memory_region_dispatch_read(mr, offset, &val,
+                                                 size_memop(access_size),
+                                                 MEMTXATTRS_UNSPECIFIED);
+
+            stn_he_p(ptr, access_size, val);
+        }
+
+        if (release_lock) {
+            qemu_mutex_unlock_iothread();
+            release_lock = false;
+        }
+
+        if (result != MEMTX_OK) {
+            return -1;
+        }
+
+        size -= access_size;
+        ptr += access_size;
+        offset += access_size;
+    }
+
+    return 0;
+}
+
+static size_t vfu_object_bar_rw(PCIDevice *pci_dev, int pci_bar,
+                                hwaddr bar_offset, char * const buf,
+                                hwaddr len, const bool is_write)
+{
+    MemoryRegionSection section = { 0 };
+    uint8_t *ptr = (uint8_t *)buf;
+    MemoryRegion *section_mr = NULL;
+    uint64_t section_size;
+    hwaddr section_offset;
+    hwaddr size = 0;
+
+    while (len) {
+        section = memory_region_find(pci_dev->io_regions[pci_bar].memory,
+                                     bar_offset, len);
+
+        if (!section.mr) {
+            warn_report("vfu: invalid address 0x%"PRIx64"", bar_offset);
+            return size;
+        }
+
+        section_mr = section.mr;
+        section_offset = section.offset_within_region;
+        section_size = int128_get64(section.size);
+
+        if (is_write && section_mr->readonly) {
+            warn_report("vfu: attempting to write to readonly region in "
+                        "bar %d - [0x%"PRIx64" - 0x%"PRIx64"]",
+                        pci_bar, bar_offset,
+                        (bar_offset + section_size));
+            memory_region_unref(section_mr);
+            return size;
+        }
+
+        if (vfu_object_mr_rw(section_mr, ptr, section_offset,
+                             section_size, is_write)) {
+            warn_report("vfu: failed to %s "
+                        "[0x%"PRIx64" - 0x%"PRIx64"] in bar %d",
+                        is_write ? "write to" : "read from", bar_offset,
+                        (bar_offset + section_size), pci_bar);
+            memory_region_unref(section_mr);
+            return size;
+        }
+
+        size += section_size;
+        bar_offset += section_size;
+        ptr += section_size;
+        len -= section_size;
+
+        memory_region_unref(section_mr);
+    }
+
+    return size;
+}
+
+/**
+ * VFU_OBJECT_BAR_HANDLER - macro for defining handlers for PCI BARs.
+ *
+ * To create handler for BAR number 2, VFU_OBJECT_BAR_HANDLER(2) would
+ * define vfu_object_bar2_handler
+ */
+#define VFU_OBJECT_BAR_HANDLER(BAR_NO)                                         \
+    static ssize_t vfu_object_bar##BAR_NO##_handler(vfu_ctx_t *vfu_ctx,        \
+                                        char * const buf, size_t count,        \
+                                        loff_t offset, const bool is_write)    \
+    {                                                                          \
+        VfuObject *o = vfu_get_private(vfu_ctx);                               \
+        PCIDevice *pci_dev = o->pci_dev;                                       \
+                                                                               \
+        return vfu_object_bar_rw(pci_dev, BAR_NO, offset,                      \
+                                 buf, count, is_write);                        \
+    }                                                                          \
+
+VFU_OBJECT_BAR_HANDLER(0)
+VFU_OBJECT_BAR_HANDLER(1)
+VFU_OBJECT_BAR_HANDLER(2)
+VFU_OBJECT_BAR_HANDLER(3)
+VFU_OBJECT_BAR_HANDLER(4)
+VFU_OBJECT_BAR_HANDLER(5)
+VFU_OBJECT_BAR_HANDLER(6)
+
+static vfu_region_access_cb_t *vfu_object_bar_handlers[PCI_NUM_REGIONS] = {
+    &vfu_object_bar0_handler,
+    &vfu_object_bar1_handler,
+    &vfu_object_bar2_handler,
+    &vfu_object_bar3_handler,
+    &vfu_object_bar4_handler,
+    &vfu_object_bar5_handler,
+    &vfu_object_bar6_handler,
+};
+
+/**
+ * vfu_object_register_bars - Identify active BAR regions of pdev and setup
+ *                            callbacks to handle read/write accesses
+ */
+static void vfu_object_register_bars(vfu_ctx_t *vfu_ctx, PCIDevice *pdev)
+{
+    int flags = VFU_REGION_FLAG_RW;
+    int i;
+
+    for (i = 0; i < PCI_NUM_REGIONS; i++) {
+        if (!pdev->io_regions[i].size) {
+            continue;
+        }
+
+        if ((i == VFU_PCI_DEV_ROM_REGION_IDX) ||
+            pdev->io_regions[i].memory->readonly) {
+            flags &= ~VFU_REGION_FLAG_WRITE;
+        }
+
+        vfu_setup_region(vfu_ctx, VFU_PCI_DEV_BAR0_REGION_IDX + i,
+                         (size_t)pdev->io_regions[i].size,
+                         vfu_object_bar_handlers[i],
+                         flags, NULL, 0, -1, 0);
+
+        trace_vfu_bar_register(i, pdev->io_regions[i].addr,
+                               pdev->io_regions[i].size);
+    }
+}
+
 /*
  * TYPE_VFU_OBJECT depends on the availability of the 'socket' and 'device'
  * properties. It also depends on devices instantiated in QEMU. These
@@ -442,6 +630,8 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         goto fail;
     }
 
+    vfu_object_register_bars(o->vfu_ctx, o->pci_dev);
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(errp, "vfu: Failed to realize device %s- %s",
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 657841eed0..fb16be57a6 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2719,7 +2719,7 @@ void memory_region_flush_rom_device(MemoryRegion *mr, hwaddr addr, hwaddr size)
     invalidate_and_set_dirty(mr, addr, size);
 }
 
-static int memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr)
+int memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr)
 {
     unsigned access_size_max = mr->ops->valid.max_access_size;
 
@@ -2746,7 +2746,7 @@ static int memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr)
     return l;
 }
 
-static bool prepare_mmio_access(MemoryRegion *mr)
+bool prepare_mmio_access(MemoryRegion *mr)
 {
     bool release_lock = false;
 
diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index 25df19fd5a..447ffe8178 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -144,7 +144,7 @@ static void *pattern_alloc(pattern p, size_t len)
     return buf;
 }
 
-static int memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr)
+static int fuzz_memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr)
 {
     unsigned access_size_max = mr->ops->valid.max_access_size;
 
@@ -242,11 +242,12 @@ void fuzz_dma_read_cb(size_t addr, size_t len, MemoryRegion *mr)
 
         /*
          *  If mr1 isn't RAM, address_space_translate doesn't update l. Use
-         *  memory_access_size to identify the number of bytes that it is safe
-         *  to write without accidentally writing to another MemoryRegion.
+         *  fuzz_memory_access_size to identify the number of bytes that it
+         *  is safe to write without accidentally writing to another
+         *  MemoryRegion.
          */
         if (!memory_region_is_ram(mr1)) {
-            l = memory_access_size(mr1, l, addr1);
+            l = fuzz_memory_access_size(mr1, l, addr1);
         }
         if (memory_region_is_ram(mr1) ||
             memory_region_is_romd(mr1) ||
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index f945c7e33b..847d50d88f 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -9,3 +9,6 @@ vfu_cfg_read(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u -> 0x%x"
 vfu_cfg_write(uint32_t offset, uint32_t val) "vfu: cfg: 0x%u <- 0x%x"
 vfu_dma_register(uint64_t gpa, size_t len) "vfu: registering GPA 0x%"PRIx64", %zu bytes"
 vfu_dma_unregister(uint64_t gpa) "vfu: unregistering GPA 0x%"PRIx64""
+vfu_bar_register(int i, uint64_t addr, uint64_t size) "vfu: BAR %d: addr 0x%"PRIx64" size 0x%"PRIx64""
+vfu_bar_rw_enter(const char *op, uint64_t addr) "vfu: %s request for BAR address 0x%"PRIx64""
+vfu_bar_rw_exit(const char *op, uint64_t addr) "vfu: Finished %s of BAR address 0x%"PRIx64""
-- 
2.20.1


