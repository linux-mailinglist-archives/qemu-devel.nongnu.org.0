Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 809EF3EDB4D
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 18:51:46 +0200 (CEST)
Received: from localhost ([::1]:44692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFfpx-0006fT-Fc
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 12:51:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1mFfhh-0000yp-JW
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 12:43:13 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:55508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1mFfhc-00080w-As
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 12:43:13 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17GGbX1f029459; Mon, 16 Aug 2021 16:43:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=nmiwh8p0OoAJzqrtdn4jXK/dOs6qH6Bv7KKpzspOa/M=;
 b=PSk1f6/CLsx1HgpvgJAQpYRz59RlcLV4S4f6cltJiJEZgjLt1j93Sb/erPSfQUP4hbcH
 bQFLF7yf5d9GtpYuVTO2EeiwhwxJv8p17Lw+yYKKK5GMbZh+2eKEPFYzh+mKuQCx3z0t
 jSu33eZEA28S+akFDXwASGB3xLXfI9NoMySMScHQJzXVlJbYnFn6owkxiAOwu90NR/kX
 jOSGkCzfRv5S1hzxchKSpHdv1GSiZajrbL4gLUAQG3Kx2OB/jQA303CrfO8+Jw6T6EKB
 UYSz2SJ2BS54oNFYRUvle9XcY5iEhXwbQHzEXX29S16XzFC4IRrcLqiU4le7sv2iaU98 XQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=nmiwh8p0OoAJzqrtdn4jXK/dOs6qH6Bv7KKpzspOa/M=;
 b=GCWaF3au+n/ojY+lKyDmwJtODOhRRh5FxzRLPSwqYgXPIL46hddQYDW10CDHmyIotx78
 FNKppfnONxJbGAXsVO0BDiEBpYe1Db4zRFw3svQg94OTla+B3T/4XYcYeyGTsP0r9KtH
 LPR2rX6juNAIHJ3BuA/LRMs+j2MNmvPgvObAvxdhxmOWktVwy+xdDcRpf9ohyGdS9kqA
 1rIH3OEcfg4T6Le0V/GcWoTZfCYj2o5KLQYKxA4Dz1qCTavLlTP764fVDQT3oUrsC9Hp
 3zD/BvZYZt/Mb8w1KIh/Te9F7FNJiHTepK1tIUSd6KGkE2Sey/r8D1mWEkSwFhGNtiAO 0A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3af3kxtg10-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 16:43:06 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17GGeiuR113652;
 Mon, 16 Aug 2021 16:43:05 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by aserp3020.oracle.com with ESMTP id 3ae5n609mu-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 16:43:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mONJUyB1nRBK/X7KQnfKF8Bp1vrTfbu9wmBeJCDFcds8QfUZbfOJQXcy/BWu36D/SBxWO816wh7Jkw6bYfdS1ax59FUJLHrLYNQXLIuk4XoUHK3dfIav9Fxd9O9d9JAGd1OWI4HACDX7UZcXBThBRyLZ9iiP9rZabIDsR0MWlCMKGpr/2kaACnAPiDm2EkfyQCupMXHKCFn4n4bbWPBmhw3mW/h8RwhGdHm9m5kJjliR8125NQgcmz97wwbzBQ/SHtuVSC26Ys1JrMDnHScI1Y9Q0cUSMkcS4ktfd3wGEl6mmuXX8zrflxFHabgpY35JIuWJ9ntCf37oWfzPHKUhzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmiwh8p0OoAJzqrtdn4jXK/dOs6qH6Bv7KKpzspOa/M=;
 b=Xbwpnuu549emb2MxaDOIUCjn7w4MLXPorQmvM/X7kM72DdHJIONSh/2oFelKmodcaioIEOkmZzaD1ECDbjGA+2L68B7tdb+wLa7vfhBxNHE/W6OzbRZKrQ/DNGcEwTtU/+o5416cSbtSwLAsfzUWmtfqTGSKJfnXwVlDeOvOs7uvWRlQwiVFG50sFSggER3bUv3zbagoWdy9ZiblluR/JZc4rApkWrPb8ANGMj0Fq0VoFvnkSjcqHicWea0xZwBOOwaxpsNBqZ3rVOD7DDofu8zjsroW5JVTZSerMeOgiNzdcjdhpCXlV4vhejNbEdUQ3mhDWoCkunPiBVPLCYQG9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmiwh8p0OoAJzqrtdn4jXK/dOs6qH6Bv7KKpzspOa/M=;
 b=u8NKmG1RC66ISucnQRrWWq4/ShTwdbiLW+9Z5VNTt1RnXNWCSwC5SHl74R3+wDE3Xkx+w10qLgMiZHHtbGq2OABHZRd8tKTYHRhffSAScirJ8lPUv4I72peK2V2J5H7CqPRxSm4hu5xgLBEH+1hlekkn3eXW2UAUcVX+SoHOf4g=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by SJ0PR10MB4765.namprd10.prod.outlook.com (2603:10b6:a03:2af::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Mon, 16 Aug
 2021 16:43:03 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539%7]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 16:43:03 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 14/16] vfio-user: dma read/write operations
Date: Mon, 16 Aug 2021 09:42:47 -0700
Message-Id: <7b21118256af2cb3d0dfe45b1e4ef9683fabccb5.1629131628.git.elena.ufimtseva@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: 321be7c0-0342-4b19-6423-08d960d4ea49
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4765:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4765132EE739F20DFE9124158CFD9@SJ0PR10MB4765.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ynqDGncm38DR+tjBZEW7cEQtxSzNwsWYRVhG2tktWOKz4hMHMsLOzIXZZysG6cc5IxwD+fdVL/UdvCCQ7SYPl+wQUSR4IGAFLFsPUYbZ6TWFVQF/9qDQqxo9Erx8CHcIM/u+7DWPAxh+hS4UutsMhPWYEfUV3W3m1X4DTYGzLGCCX1WsY0HOfApVfPdRkhY9suFbG+a7IGpimrx9PTab9ZHMDGLQGd9hlCnmrcqibRQDwP6lBYYQWQI0Z1yB6pE5wxAx+3xWq5Dlm0xcYt/Y5eECyfONnXlsIe49ong5KKaoTVWyB1gKgtAummPoBblVHuH5FEAfvXwv3tM+QNBQH9tkaY58MmLs9CB+J3I+6VUNYkz+bahYLF9skmz0ucRPO+uKyjNFRKtS2lV4boJvmSBYqYomHw58ni0U+BEaArO+Jg9bAdoqXocbgTu6f1e2AjApA+7Q99EyETSkWuPx4BiMlPIWa0ysLmZrCZ07HTgWFEwpFhrZnCBGrfuR3iVn9p5w9CpPvxjs5RCEwwq7C+/nEHNsK+cMUbPPVcNXGlx0wI/gavCmci/0BgCGAI1roeC5nuKQA0plMAapwZAcEOHLxxFz5rILq4CTlDkTFfOQ38pSsJSi5VEePFVoUP8x+UHC8bG0+CsjZY807vi3pg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(2906002)(86362001)(66556008)(4326008)(38100700002)(8676002)(508600001)(66476007)(6486002)(66946007)(6506007)(5660300002)(44832011)(2616005)(6512007)(6666004)(36756003)(6916009)(316002)(52116002)(83380400001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mWCH18PknI++ABn1aurzv0Gj0sqzJBftp8akXBsBnmzsEN21HnY66oGRRctv?=
 =?us-ascii?Q?+MRPkt4DQJ168ExueN4TdQdnUD8WTN32FfatwLIOJGKh3s36C7utPbWVGNIt?=
 =?us-ascii?Q?2NfjhRDYl+WKwcA7rzHA8iKX0R08Lab1SI1Jv+eVHvRfPMc/glnE60N2qvgw?=
 =?us-ascii?Q?QnYrQ2HhYosfN6scRGRdUzf2KXHcBDbvy9hxg4MKy5Ppt/pPShv5toD/YXxK?=
 =?us-ascii?Q?hUyBSwK5Slsy0O8aSmW8hbxpsJyKchU8M24aIjecjlsqJa4xgDmBVqfjU532?=
 =?us-ascii?Q?v5iD7ldwe8bk5mViz+zVn8x9ihMdjj78qLTMRaux17P/DVXUMRF5jDJ56Y0O?=
 =?us-ascii?Q?JyItZiLjWGH1FFnvrI+f7K1W0mUPgt8JUxTzgoZgcbbMd1XZUrGUcuuN6m99?=
 =?us-ascii?Q?JNjZWY0nc4bzJzwpV3Wj0XIarwTXhjMdkK77yb+7Hxm8nZqaZrB1+mYKLjly?=
 =?us-ascii?Q?D7qhqOciB+gEFp7n7Uw8aNipqf9tAjYBBICfl4rpzrLaowfhZyQ5Ki7R17+z?=
 =?us-ascii?Q?Rl+4t9IIUcntBhBwLZ27rBFXV/WjdvsKzY1sJLkbntje46R6uX/8tiQvg+8s?=
 =?us-ascii?Q?y7CKeOOvKWnv+D8TzHJtdRR8o+fwHy2v+oIzAmhK3HneuwryTpzn5SD3y2Pb?=
 =?us-ascii?Q?tsReJdK5OESbCeQuTx29fpvk3jV8GOtnMLUupXVcLFN/eOXqGZLVHjqS55Ld?=
 =?us-ascii?Q?Yof1HVwOLmThCrTDJ7VvTp87p+nyB6VZvRCvd9KtfKONFl/Mvq0HPIplPoxq?=
 =?us-ascii?Q?Vzc/ZiFkUBOSWzlB27zYXUaYoMqv0aKJDSm8cVXxSHgbi02ew/y5kWoAgddd?=
 =?us-ascii?Q?lwJtdknXj9VkP+FaFCuu1mofwSAhOY88kQoFSPPDYn8I6lWklPeWEi9s3/NN?=
 =?us-ascii?Q?bV7c+3N0+GlVZhKvHF/pRukac3083dLVvmw3oSyZxEMsm2yugZY3Bezxkqaz?=
 =?us-ascii?Q?CPZFKOFCKK2ldwZf6+5SvcjTHtldTCWUBiZf0gDj1chvPRnc7v4FhfHoREDh?=
 =?us-ascii?Q?FscrW5OxGOTXlLWOBWSMHKZxuz1omvufvjAsNtCaT1A5N483aV+uYvAexCmC?=
 =?us-ascii?Q?vRkOrpM6JDh194W4i6v9JQrVX1B0HDpJmg75LBe16KHz3YAjeNFaySX12h5f?=
 =?us-ascii?Q?XfTCnIm07rgjzvfQDS5MNz10haLJ41xgxGAQBjoioCXYyyjhxMX/MlvSrsfu?=
 =?us-ascii?Q?OBuOwDSZDHWJiKMhThIkGg/RHn+bKRSVn0ax+RyfHBTXj4OGk45YHnwRqSXH?=
 =?us-ascii?Q?5pna/q4xuakVV4uxTT2sCprf6cPdP5D2IHBalEDfsIaC+Qv3RC/2WfLo2RPr?=
 =?us-ascii?Q?zbX+4oZeSdcP+k3ew0feLN5zPdNdd0vo8gByRBHkrMtoEx4im6Z1VLn8QjPE?=
 =?us-ascii?Q?8V/ORLesYU0lw3OriVdvyJcpWcN1?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 321be7c0-0342-4b19-6423-08d960d4ea49
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 16:43:03.0876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3TwkrLXeAn0/D7mhHBsSZ+w6+P29Wch9/zYC9DgMtsFS1CRI7CCxVpAZcivsCntndLbUugFT5tyk7oYPrYNQoNiZ5L6MKhvcTHWwxC6IzfY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4765
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10078
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108160105
X-Proofpoint-GUID: 1BRbLtOUmRBkw1CHLxE7Rjz3WMV4-ent
X-Proofpoint-ORIG-GUID: 1BRbLtOUmRBkw1CHLxE7Rjz3WMV4-ent
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0a-00069f02.pphosted.com
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

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user-protocol.h | 11 +++++++
 hw/vfio/user.h          |  1 +
 hw/vfio/pci.c           | 63 ++++++++++++++++++++++++++++++++++++++++-
 hw/vfio/user.c          |  7 ++++-
 4 files changed, 80 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
index ca53fce5f4..c5d9473f8f 100644
--- a/hw/vfio/user-protocol.h
+++ b/hw/vfio/user-protocol.h
@@ -171,6 +171,17 @@ typedef struct {
     char data[];
 } VFIOUserRegionRW;
 
+/*
+ * VFIO_USER_DMA_READ
+ * VFIO_USER_DMA_WRITE
+ */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint64_t offset;
+    uint32_t count;
+    char data[];
+} VFIOUserDMARW;
+
 /*imported from struct vfio_bitmap */
 typedef struct {
     uint64_t pgsize;
diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index 7786ab57c5..32e8b70d28 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -65,6 +65,7 @@ typedef struct VFIOProxy {
 
 VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp);
 void vfio_user_disconnect(VFIOProxy *proxy);
+uint64_t vfio_user_max_xfer(void);
 void vfio_user_set_reqhandler(VFIODevice *vbasdev,
                               int (*handler)(void *opaque, char *buf,
                                              VFIOUserFDs *fds),
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 2c9fcb2fa9..29a874c066 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3406,11 +3406,72 @@ type_init(register_vfio_pci_dev_type)
  * vfio-user routines.
  */
 
-static int vfio_user_pci_process_req(void *opaque, char *buf, VFIOUserFDs *fds)
+static int vfio_user_dma_read(VFIOPCIDevice *vdev, VFIOUserDMARW *msg)
 {
+    PCIDevice *pdev = &vdev->pdev;
+    char *buf;
+    int size = msg->count + sizeof(VFIOUserDMARW);
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
     return 0;
 }
 
+static int vfio_user_dma_write(VFIOPCIDevice *vdev,
+                               VFIOUserDMARW *msg)
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
+    VFIOUserHdr *hdr = (VFIOUserHdr *)buf;
+    int ret;
+
+    if (fds->recv_fds != 0) {
+        return -EINVAL;
+    }
+    switch (hdr->command) {
+    case VFIO_USER_DMA_READ:
+        ret = vfio_user_dma_read(vdev, (VFIOUserDMARW *)hdr);
+        break;
+    case VFIO_USER_DMA_WRITE:
+        ret = vfio_user_dma_write(vdev, (VFIOUserDMARW *)hdr);
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
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 06bcd46e60..fcc041959c 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -54,6 +54,11 @@ static void vfio_user_send_recv(VFIOProxy *proxy, VFIOUserHdr *msg,
  * Functions called by main, CPU, or iothread threads
  */
 
+uint64_t vfio_user_max_xfer(void)
+{
+    return max_xfer_size;
+}
+
 static void vfio_user_shutdown(VFIOProxy *proxy)
 {
     qio_channel_shutdown(proxy->ioc, QIO_CHANNEL_SHUTDOWN_READ, NULL);
@@ -251,7 +256,7 @@ void vfio_user_recv(void *opaque)
         *reply->msg = msg;
         data = (char *)reply->msg + sizeof(msg);
     } else {
-        if (msg.size > max_xfer_size) {
+        if (msg.size > max_xfer_size + sizeof(VFIOUserDMARW)) {
             error_setg(&local_err, "vfio_user_recv request larger than max");
             goto fatal;
         }
-- 
2.25.1


