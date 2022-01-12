Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6378648BC28
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 02:07:55 +0100 (CET)
Received: from localhost ([::1]:58852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7S7G-0002EV-G7
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 20:07:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7Re2-0001Hl-Pp
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:42 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:15464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1n7Rdl-0005hS-6z
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 19:37:37 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20BMlEK5019919
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=vSVLMh5EzNGUJ40EJ2Ice/4tnhgiMlgL0VD6CJI/898=;
 b=BNTfit3escZsuvkA2n1u3wHMbs0By3/2LhwKyuwgeCJSI+szuDcJy4xYUn9/IzsI9Eg7
 Zhggxz3eEp2ourLZuTEtc5CG/aWTYY/XYwDK65RyqqPBeGGcJUkFWl1T8g8AGnwxySsi
 ESnAp/CMBzgcUFodp9WAmWKNF5EFxjLXD+NE3OcM0TmYaMhloQyTpA+upwzQgaI487sE
 nkb9MihNz4a5YzhSuBdji/tf1Z6lGYR7uLCkA3Hz7TI9xpRy92PxB3FQU/JyLdfTcZ1Q
 AGdwBMpD+OLWWjhev4OtwriNq0tzQotKtr2XxrKbADVifh7kMS8ZoWqMPL8Ela00i38h 8A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dgkhx4sj4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:13 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20C0KTBM196414
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:12 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by aserp3030.oracle.com with ESMTP id 3df0nervy9-12
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 00:37:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDTCFGl8H+muZR8aCwndRSbuZg0gH+vNY6NcYLgMM7GbbNhnOd3WA/GjHhiEAx1G6gx7LVBQGiMAyrdOnbPO2qa0X/x2Bv75ZrYjWdFi8x9tHzhx6RKCg9oHuBayWBRgaxHdEr1IDMj1zDF6VG4NyvPQd6kNHUKsHl9FqMyoX27nVx14EwHZG8b33dfLkwA4lAh4Ca3rR3YM6JZ2JK1bYcVyEZrReFfqijrPArw8M5mZeQnlWckcEwWRt29FhWGy/ECVsj1wrcAC2SjhCWY+TUx39Xf3QNjB1k0SxVGp9JwsFcu23uHBloU5SkWLxmN1f01eFGggaX3JJ6dnFVNH3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSVLMh5EzNGUJ40EJ2Ice/4tnhgiMlgL0VD6CJI/898=;
 b=I2EYYFTORTo0Hxj6K2FhjRT2gVV91UdMp8rnFz0L3WHDIX/bdKXjSqqlCxN6TBSzALHNwrApKW4Nh+oU9e+QLzvnlHSNjhqcJFkZrynvcsQo5sCtH15n6ckcq2yK6/TuYmAJA6JQ9ehc1v94F/wqhQuG6Qst4tLtM+uz4Tj+O4hCuPUfbC9bf3eGvDcClYszXLaLHHaAIVFAdFZyygexMRjnLleBa1NleyQxRfAmZRBE3XxxTha1Af2xQSTpu2ole05MZn/Legsk+dolpfzvCFO8qpuSqjNCLFMn8cQeDOSuO+3lXo2FambMPUjBRadHhlWRMpDbOPgwG9kfrRpZiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vSVLMh5EzNGUJ40EJ2Ice/4tnhgiMlgL0VD6CJI/898=;
 b=hZyvq5Z68Lt4F0f5pFDl7sL+oMYPr7dRO48Al9jpJUHkKFi+LVaNthYzvypKgZJSSvKU/Dm2BJ7dFEp9h1bYmyqAunuhwSdiPnXX7GqTdmP21fs9mhrSroq1FtCHGLJrG+aiSojIrrgQYNR2FDmS3bJFF62uihjK6T1hcE9yxpM=
Received: from PH0PR10MB4679.namprd10.prod.outlook.com (2603:10b6:510:3c::15)
 by PH0PR10MB4742.namprd10.prod.outlook.com (2603:10b6:510:3f::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Wed, 12 Jan
 2022 00:37:08 +0000
Received: from PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b]) by PH0PR10MB4679.namprd10.prod.outlook.com
 ([fe80::5536:dbc6:5161:ac1b%3]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 00:37:08 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v4 17/21] vfio-user: secure DMA support
Date: Tue, 11 Jan 2022 16:43:53 -0800
Message-Id: <7c1122b4e50214e7d214e57616171a25a3aa2865.1641584317.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1641584316.git.john.g.johnson@oracle.com>
References: <cover.1641584316.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::16) To PH0PR10MB4679.namprd10.prod.outlook.com
 (2603:10b6:510:3c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a59be387-ce9d-4fca-35f2-08d9d563aa26
X-MS-TrafficTypeDiagnostic: PH0PR10MB4742:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB4742EA9444C1C2FE639CE1FAB6529@PH0PR10MB4742.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:983;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4lvlCrWPZzVXWab2rR0zfKi30gJthal4DtclogvYYCHf7+AIMGoUuDPe6LAIbxMMlvMCmGa5XZx6b/n2VsP9SdIwVFBVhNWoNqbMaQGvzPAwSQJqQTqoIN2PMv+/Tg8YYfbRwz51jfxpDvSppaTzZeWa91+UmQVvfFzVSum2r5QKB2HFwWmHmhTt4NOWl2IJ+qgpcC69lVIVJrHv4BYZHfV3DL3NUMsMq4gM5TXv0Js7O8CAyCMNAQq2TKR2+DHl0ZdE47knA1bhZUbbyuclQglwXCBn0AIoXAWzOrlaDgXo0QyfTwV2Jn8CjJmIPMxgEdbaIOirTlHj1YwZpkMSqEwOx9Lz/jfZ+nauUD9ouhpKpnhxqbYs1aMqE5kj89BLRtOCYgj256VeW3fxq7ZQ2ahVCOroQaNShW9WmYmtFB/GoB4C7j/s4y9FvzRHMG0P+Az80VjPiUuB4ei3gKYI0vhIFlbKeT0qWSrHrsm1/lZYLwHGUMPBHXebMmesTixHXyy4NE+U7bzdMJpP+e28qeQUpwQj9iOgJwJ5H5UGJxLA6wQoMyLeylzm/d8x+k/BXbwbq3isB8SUKnJsFqqzaZ+SQDoJ4iNe4MhFN4HXNU9zd8+vYcRV24xH6+e8mM8OXqzquA1X07zVyBnrwoX/CbLGH0pK9GVUcWNJJCy9vkDMBa325H3QrMKX5cn7Lz9wnwIMF7LokAQmDPj3LsK79Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4679.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(66556008)(36756003)(508600001)(6486002)(6916009)(66476007)(52116002)(186003)(8676002)(2616005)(316002)(8936002)(6666004)(83380400001)(6512007)(5660300002)(38350700002)(86362001)(6506007)(2906002)(38100700002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Bcofh6sJgn3LiXCVk5GnNGDWtWyOT7t5BWqA/GMwM6Pf/3Oba1s+OxBViZDZ?=
 =?us-ascii?Q?SZ5bSeZM7xIPVvnGSgljMvNltDDd6oCErF6bRuQQzoK/OFIJAi2ePMsbBieY?=
 =?us-ascii?Q?ytSe7dJPd8AD+hyomKp9LD1YdKN7TH4POjh3egookTsuDqD4biBYS6hshfQR?=
 =?us-ascii?Q?MjmCbWIQb3MLTZEJur1ijY4SZUg5/SnrOK4Wh+Q9wozvvP4+JfYbgM4oehWr?=
 =?us-ascii?Q?8d7Hx65ghI9GcyO7OQoDrBIUBzYRipyEfSDn2DhTc9TsiDTlSGM89YFIWSrh?=
 =?us-ascii?Q?pa+c6LgUcqmpnxbwq1o9eKiDHs/GmrbpcxyxbRq9Uj75XZmJ8ux7zwFiM9gN?=
 =?us-ascii?Q?fVduiHPqoOAPQ57KTnGR6pqGZ2K2kl9pjujap6CcGf8eo81C931+eDILHqxR?=
 =?us-ascii?Q?pKfECYGyiT1s7rRHs7vz16C+96enxBIT3xXD4uZSotZgbllKGIHWs9/86MVQ?=
 =?us-ascii?Q?8FWkMAWt65WrDHBlDu9SNJbEE5SqSd+zz2f7OWpOk/o0kSFsYROOp25LwMzY?=
 =?us-ascii?Q?pFA2jo+xdWt6fo7irdQNjepx5djXwpgr6xuCIsU+G3uvJ9Nb39C7xv2sRcbg?=
 =?us-ascii?Q?dOQZZRxmNUWwWWrYOGVSsunnIOQF3CRFLGAglIKGJMf02jsKaZTiRC4YRl37?=
 =?us-ascii?Q?u1KLemtPqQXyKHbNUo81k16F5xg3TaKAVFbFg65pAzrUSJg2Y7FO5BmpITqG?=
 =?us-ascii?Q?XUOEXue6pTK76YWSCwm8MSX700HioncItY7yH3uXG1mMylEwTyqa3p12tW+u?=
 =?us-ascii?Q?ugGh5TDz0tpH/uVu2sjsu8ygYZkr9jT8ttZ4letEUU8vyh9ViO2s+oKtzo8P?=
 =?us-ascii?Q?3motRl40nF7OyF3zepFmJHw1oqgVSXFVs70e1A3RyVqiyqJ0e1qT42fsyHfv?=
 =?us-ascii?Q?jxN8Ih/bQX9iwKIIbztNfMsK7v9D1/3hFWS/FvQHe9zZnqAmEbFB1dDItIy/?=
 =?us-ascii?Q?NWKiiY80BCQjjisiRSdWp+xL839yfnjjuQgdOoRNM9IH8T7o5gMBnOCoC4w3?=
 =?us-ascii?Q?DHaeSN1dgd0FFTQUstO57Vle5RUlDt/7mmgHaBY6U3S7kj5U0gW4At8MTizR?=
 =?us-ascii?Q?F6aPhsKXFmjmixW35Vmoc2u/06X4Of2wb8s2F0mjxBK7KhHBffjcdsgEOF7B?=
 =?us-ascii?Q?ECBMlmy0leEZf73yC7mmXEFVN5VSy6FtcnKutdsOIEnmAw5QNNRJTPuhPXtl?=
 =?us-ascii?Q?TnJVH2FixqQtUm16fOVUjGwOT0UV4lEmj9KmGMRIDJFLQl4bVwUf6aV17mY5?=
 =?us-ascii?Q?ddWoU6eYUBjYCIfkQJDEUMXb0jvokIYUDST/k0r5uI9WOt14GiPumVgoG0AH?=
 =?us-ascii?Q?75PhhdJHQVBEkeF1wXtHN6Y/N06sBoz9c4FvL8FerCaO+nfpVFTg4Xowwt5x?=
 =?us-ascii?Q?HSlqmX6zrKKD2zz/lFAUq4Jstbof/UQZ3D76cLjLvE1prT60HFp/fMqNfDsN?=
 =?us-ascii?Q?zReWmm3gXnfF5zWxTT3yQwYkib+6hOiEKh7rrOvzrEc9oJfb2x2E5ZlVaLH4?=
 =?us-ascii?Q?tVbhcaGTezIvjNpleh1HEPSc+ZDDjM/pas5oeXIZSeHSkcvo55sjXGYz1X1W?=
 =?us-ascii?Q?VvuR3E4xKGytQ4i+pnaTuF45dg98ZziFP6/ptPpbaSynKjRdFUYZ7aC7cd84?=
 =?us-ascii?Q?1luJCixB3jsOdfVJcEMBISoe0+XTJRPaf2eN/N26ijU85F6SJbUhjXsGAKxh?=
 =?us-ascii?Q?vKvCEA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a59be387-ce9d-4fca-35f2-08d9d563aa26
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4679.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 00:37:08.3682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XOKF0fk4S9pNwDrRkcd0H/RwtlcI8cUKgW3XDj8grd+YqfW3WSJDNoNIzfqdy/heO5vYd6qHpQfqxchMosj8/Q/ajcslhRRnxc6uZzw5HlA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4742
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10224
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201120000
X-Proofpoint-GUID: FeSGM3V9yrU92jV0IPP0yngUNADjx1PD
X-Proofpoint-ORIG-GUID: FeSGM3V9yrU92jV0IPP0yngUNADjx1PD
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Secure DMA forces the remote process to use DMA r/w messages
instead of directly mapping guest memeory.

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/pci.h  | 1 +
 hw/vfio/user.h | 1 +
 hw/vfio/pci.c  | 4 ++++
 hw/vfio/user.c | 2 +-
 4 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index 643ff75..156fee2 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -193,6 +193,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(VFIOUserPCIDevice, VFIO_USER_PCI)
 struct VFIOUserPCIDevice {
     VFIOPCIDevice device;
     char *sock_name;
+    bool secure_dma;    /* disable shared mem for DMA */
     bool send_queued;   /* all sends are queued */
     bool no_post;       /* all regions write are sync */
 };
diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index 8d03e7c..997f748 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -74,6 +74,7 @@ typedef struct VFIOProxy {
 
 /* VFIOProxy flags */
 #define VFIO_PROXY_CLIENT        0x1
+#define VFIO_PROXY_SECURE        0x2
 #define VFIO_PROXY_FORCE_QUEUED  0x4
 #define VFIO_PROXY_NO_POST       0x8
 
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 1fc79ef..b86acd1 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3483,6 +3483,9 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     vbasedev->proxy = proxy;
     vfio_user_set_handler(vbasedev, vfio_user_pci_process_req, vdev);
 
+    if (udev->secure_dma) {
+        proxy->flags |= VFIO_PROXY_SECURE;
+    }
     if (udev->send_queued) {
         proxy->flags |= VFIO_PROXY_FORCE_QUEUED;
     }
@@ -3607,6 +3610,7 @@ static void vfio_user_instance_finalize(Object *obj)
 
 static Property vfio_user_pci_dev_properties[] = {
     DEFINE_PROP_STRING("socket", VFIOUserPCIDevice, sock_name),
+    DEFINE_PROP_BOOL("secure-dma", VFIOUserPCIDevice, secure_dma, false),
     DEFINE_PROP_BOOL("x-send-queued", VFIOUserPCIDevice, send_queued, false),
     DEFINE_PROP_BOOL("x-no-posted-writes", VFIOUserPCIDevice, no_post, false),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 5c27a5e..fb0165d 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -1441,7 +1441,7 @@ static int vfio_user_io_dma_map(VFIOContainer *container, MemoryRegion *mr,
      * map->vaddr enters as a QEMU process address
      * make it either a file offset for mapped areas or 0
      */
-    if (fd != -1) {
+    if (fd != -1 && (container->proxy->flags & VFIO_PROXY_SECURE) == 0) {
         void *addr = (void *)(uintptr_t)map->vaddr;
 
         map->vaddr = qemu_ram_block_host_offset(mr->ram_block, addr);
-- 
1.8.3.1


