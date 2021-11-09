Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C51E44A00B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 01:55:24 +0100 (CET)
Received: from localhost ([::1]:45996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkFQ3-0002I2-ET
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 19:55:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mkFAt-0005tG-Jz
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 19:39:43 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:41572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mkFAX-00047D-Sn
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 19:39:43 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A902oTR005900
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 00:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=yM0bumMFeULVKTRz1r6VSG3f46GjI1cjQNu7OobJYr8=;
 b=m1bYeeEYV45uhHXVeuiDKT1zjZp6V7515s+LerEq181VdS9zq4FJO43tx9jQPFxzAanc
 OL8Nz9j4gEzedj1in/uCftKyGRKLrbVfzfQ3rqAviwE1hZFbW+B51hCoCVJNcg1ba7G0
 gTxDYMrgYagcszqLW70/lPcGNKPM2zKKfVPDfEpb6f4ajOPxSta5YpvM+wPKMNirzJey
 6sCq1g4LvihBPfz0DOUKGNc7ISZfuRf1NJZ2T6KIAKplYVYOrdG9E7mB+fO4c12Vif6z
 cETGM3t57LF9cVrfhaX1FnW9QAuJgn30oOJS6sJUhKNHoglCiUiRSVel3bsi250EgyMp Rg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c6vkr01uk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:39:20 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A90ZLN6129193
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 00:39:19 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by userp3030.oracle.com with ESMTP id 3c5etuvb6n-9
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:39:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vms3fnXYPtgJZe1ZZqzKSDPEHc+NAsLuAL/ZQ8P3PSRsW1kbAw2Ab4XIZ1+SY+eaT18FltffNRREceV0lyjiArscQzIIpe4Iz3ZfLc3PFji3LGV4Ur6bpMd4ty7lJVAoiVaMkeYLN4KI6Rm9sDNbiaXrb7E8+8mFLl2JQxBPOqkcPBnndkyv9lYC6wkp7X5Gpxkddwhc5MvHDpUraLHmXw/DxisWvyLSz5/UoJb6hAsNKNne5ZN/SuZmu8kqksK73CnuIjcJXMwJ2cFmL6PIV5nIEe2+EhBEpfP/J8mlIgVFdk0q9PRotikJHw9inv++i5iMxqXJnAiqM4UZF8Mceg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yM0bumMFeULVKTRz1r6VSG3f46GjI1cjQNu7OobJYr8=;
 b=haA3mhGiqdFexYQ1K7YAW7gULUKA+PYGgN72w36MFiJXEmVsd8ZfpoMQAk3EReNgXaBFtWi9oKw52nrEJo0nWQOmupW8mdmLKYZ1KFvWvG7cbGWtSP1Hzngg90iWClIfa5xMNK8OpIPiG8xvEVqTUSLa0CQb+cw55KulkgeKOMLYfLl6fo4caqma+yuJ/Dy0nSDmig1kXJyrZNHGUUhDzRDK022pGbffNi3eRrYZiFKJH0nBRULxL8wTA3FM7qTeLowY/FGfBa5xRTdS+X5mhRtFdwZGmcMZv5WxwiRGhYX19gfLjhOIzNqkioAk1fTLasQicJ+eYa1u+sKiXJVc1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yM0bumMFeULVKTRz1r6VSG3f46GjI1cjQNu7OobJYr8=;
 b=k7gnjGPQ68exjUghnTT18bqVQN3eTdku9uHIYBgoWKfRsY/Ftl1IlcvQAbUYIpWjnSh89NPzi52KRXIw/AbEjMTKlQAUBTiGn43PRpbE5umBNFEQs2xMwlTqoUL+ELYAYd43sTREZQobt3CfucDdAQW93Q76A4rINAP5PedCU4I=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 by BY5PR10MB4068.namprd10.prod.outlook.com (2603:10b6:a03:1b2::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Tue, 9 Nov
 2021 00:39:15 +0000
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::1551:92ba:9eb8:a093]) by SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::1551:92ba:9eb8:a093%7]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 00:39:15 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 12/19] vfio-user: region read/write
Date: Mon,  8 Nov 2021 16:46:40 -0800
Message-Id: <fec3b2318fe49e39d026a18fdccdb2737226aafc.1636057885.git.john.g.johnson@oracle.com>
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
 Transport; Tue, 9 Nov 2021 00:39:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91c310c0-db8f-499a-4045-08d9a3195a21
X-MS-TrafficTypeDiagnostic: BY5PR10MB4068:
X-Microsoft-Antispam-PRVS: <BY5PR10MB40685368519F2749B9EB07F0B6929@BY5PR10MB4068.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SoISnHz8N069VngRcvvt69e9WNaPLyTbI3abJLiBMwEIoXb04hR5W+ypxrYbuz6PTJyaLf+rCJL+UY9/A9HpjWo1uwJXL//5VlYlYHaY/q7CvrfyCK94XMrBKEWZLHzsQLeYWtJ/vaaXIJIcgIwnSOGlaDI/1Z2EqjP+mM0bYtzgaPx4ozSIUm43DVT64U+us0neSTb/3KhSwEKgpbIcHqF+WLNc59HfwuCUj2Z+tAW5rV1UfqiX7jqvEpkfWM00irsw+jhXGxaoYf/miVdtVHGYjTKcSGxK26OMGRxHPUkINco5+9QKOT4xm0Zk4dNwo22p9ZHNXREu4CB14BwV0UIY8do4HrabnWrZQFtUUfrBVFSvYRlVYIDslPeiBbdsXbj4D/WklMBPKwclXGKvgkNDMCMHtmnPw7+IQaGzH6tj9qyXTTKYBVAgIXHlKE7qWqYwFy/xdOU9J7q4LbPFlCpS4zJoHxqHY5GNGXOnVKezdp/nPzDvKMp9lc7KZvscpxoFkkWPXUZix4KD/A0l95F9tXxIx8hyRv6yU63HPcpBJfsFq5VZwKUTNZJUuzu7sgxln6vMNo6uvzbCbVMvDAZJrMliYho3hx6jyAHAjkzuE2II/AefDYXoOYUiqTJco6+Mp+7ERp7ZF1xC7HEFk1xXJSzDidFV8/Ytd6vL9cO6YZpmMBUlrdNr4/axxTKiY5VTYC9gjUF/9BZbGFfAxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4686.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(316002)(186003)(66556008)(508600001)(8936002)(8676002)(66946007)(6486002)(26005)(2906002)(6916009)(5660300002)(36756003)(7696005)(52116002)(86362001)(83380400001)(956004)(38100700002)(6666004)(2616005)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zGa5m6b7c0Wtx+K+4lgVweEh72nHqN/TJK9nLQdMO1jEEPLaLmMzWUMpNwpG?=
 =?us-ascii?Q?DJ3JIVt/EojPs8icV1c5R0zQh0scum0FKtkk3fQJslvYvCYXfhjIr0IMd1sq?=
 =?us-ascii?Q?kj2pYH7gZutaiTMKSbVWzgfr5jQxNsM783poqYmajwoMqP1paC5QuWVtYAuO?=
 =?us-ascii?Q?/Bt0CDstpgWiS6MODKgaHcgBWB2W8cxjZwQmE9pscQEb91TZW+31qFns2ML3?=
 =?us-ascii?Q?JC/vXPEZ+QfHp/cE2pE5pG2flyi9mj2NWVsFWWkz3gvP+2tmnYKRYYHDI5uY?=
 =?us-ascii?Q?98HTMmdhf4sUSTrAdEcxNsx/8SeZGZt+DYhyFzluQpVZekIrXnF9mpDXuLzA?=
 =?us-ascii?Q?QVf19LidnD7K4CkpkF93cV9YGAFym7zqkHLntlHT/YB5Tz9tlFAtGVQ2LUyJ?=
 =?us-ascii?Q?r9aAwZCnz7ven862DMLszG/vGVqMo/ZTkNt2xP4hV0FYXymDhoS2ap9gdpDJ?=
 =?us-ascii?Q?Bf1U4vDqtSXS5FaK50Pcg/eBxebZ0WWvGkeBWrIXVOBBH0J9WjE4vCYUNWP+?=
 =?us-ascii?Q?iuY/cs61siDjg/NHtUlX+fg4x/V0i5CRYydf1C/wLv7VJ5+ah+wcjwLCaqJ+?=
 =?us-ascii?Q?JEnkuGBJ4WwQRHROyVw9aGPWbLTC5zV8dxFdJ3y/C8s4wm2QjSfijsoAL6cR?=
 =?us-ascii?Q?gpMh1WlOuyRtTSSljRQypsfp/GglJ3mXsEvo1hYSqp6dk+l6W8Hh5Yy5mlt7?=
 =?us-ascii?Q?ilmDBrPU/EwIVvsoCO5Izl0ep7d0X4CcjZ1T/NMc3evmt9UzA7Hs6FPLXNUR?=
 =?us-ascii?Q?3UP88loxmiNervPHdQlE31DAaUPaVcePohWx07ChobgSmy9PZYtFTrma+aIM?=
 =?us-ascii?Q?88Eh0z6xjsk78KPf/EfsiaRTHoDliffg7zOoOTtD0Seu6d/VkYdDqvvOc5Sn?=
 =?us-ascii?Q?3InfqQyTeWYUG3pYuwY5NnUOhiQgkRtAGWXLzCvF/s0cxDHSBlJaGbMs6BA4?=
 =?us-ascii?Q?FoalZxpRWcg+yAck5hL+PVooaNRMgHe/GS/j+p31pUlnv1BEgO99Wu4OEbtz?=
 =?us-ascii?Q?v1v80Rdozjg0LfQQR+a+uhKz2B1aqjlEIa2qmSwZDF8CXbCnAoPZ1j44Yo1q?=
 =?us-ascii?Q?Hrfwg6T53T9CpGLmPGwAiYlaM3/CZvOzftEIO1tIVmKv4z2IVTCW8BalZGJ6?=
 =?us-ascii?Q?uhQQZT4f8fnJEdbFuWO+CXj9ROmznE4ZT8ax/9fZCJT7zjAoNFXNGLrXKEji?=
 =?us-ascii?Q?NJ0SO+UKMmlLapVJr2GPy3ZeBmJVsNlxqt23L9cFCt9vkgC7eB+/HChcm7/6?=
 =?us-ascii?Q?SsWHfMSqo2ZQQSbZk2ZCXj+3a5BE67RI6XB1h17US0Fe8CIYiyyiKvudRaHo?=
 =?us-ascii?Q?AsaIgLZl2VbshfHJCSo+o6V2lxO3o7cJ4tAHJ9ghdQCre72HZdISEO/kTxct?=
 =?us-ascii?Q?UdZjdKz3ZizTTpK+S15/P69v8xZZdvd2Re68MGnVqEjQ2SFA3FBAhQt1O7N1?=
 =?us-ascii?Q?XUUlmOVbWrd7r9EWrOi3YXD9WjdgkU13hiXInvMqTf6fA2PAtN8LeVCyZe0U?=
 =?us-ascii?Q?9NMxJL76FbnrEB11Z8KJwgZx3KNtrMXTC+8CzxZ+tLp5KFQPZmQo3Z2LCTJn?=
 =?us-ascii?Q?nmXculRIZ/YuScGRh/ONDvcDIDvpaO7RwpfQ/WLjVqvOvrv9qxv9Dg8NofRp?=
 =?us-ascii?Q?SyJwnS9fSUkwHVNeHiOVXojNCzr2JqFyeukqqfFfO33wUaqZVRPA9odBVkL1?=
 =?us-ascii?Q?+dZC+g=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c310c0-db8f-499a-4045-08d9a3195a21
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4686.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 00:39:13.2160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /SsFwiNTvGv5wcSObPQZe845V33nOIXzi4G3P94MnrboMpbScwRXO97l0hBFiNCbwcOAZK4MaCA0UspYDlqfWyCzux2BXp7ufuaIRVGD/90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4068
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10162
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111090001
X-Proofpoint-GUID: aXRitgf1VG61bHgH_tSrozx-mXxO9_3J
X-Proofpoint-ORIG-GUID: aXRitgf1VG61bHgH_tSrozx-mXxO9_3J
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, SPF_HELO_NONE=0.001,
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

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/pci.h                 |   1 +
 hw/vfio/user-protocol.h       |  12 +++++
 hw/vfio/user.h                |   1 +
 include/hw/vfio/vfio-common.h |   1 +
 hw/vfio/common.c              |   7 ++-
 hw/vfio/pci.c                 |   7 +++
 hw/vfio/user.c                | 101 ++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 129 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
index ec9f345..643ff75 100644
--- a/hw/vfio/pci.h
+++ b/hw/vfio/pci.h
@@ -194,6 +194,7 @@ struct VFIOUserPCIDevice {
     VFIOPCIDevice device;
     char *sock_name;
     bool send_queued;   /* all sends are queued */
+    bool no_post;       /* all regions write are sync */
 };
 
 /* Use uin32_t for vendor & device so PCI_ANY_ID expands and cannot match hw */
diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
index 104bf4f..56904cf 100644
--- a/hw/vfio/user-protocol.h
+++ b/hw/vfio/user-protocol.h
@@ -109,4 +109,16 @@ typedef struct {
     uint64_t offset;
 } VFIOUserRegionInfo;
 
+/*
+ * VFIO_USER_REGION_READ
+ * VFIO_USER_REGION_WRITE
+ */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint64_t offset;
+    uint32_t region;
+    uint32_t count;
+    char data[];
+} VFIOUserRegionRW;
+
 #endif /* VFIO_USER_PROTOCOL_H */
diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index 19edd84..f2098f2 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -75,6 +75,7 @@ typedef struct VFIOProxy {
 /* VFIOProxy flags */
 #define VFIO_PROXY_CLIENT        0x1
 #define VFIO_PROXY_FORCE_QUEUED  0x4
+#define VFIO_PROXY_NO_POST       0x8
 
 VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp);
 void vfio_user_disconnect(VFIOProxy *proxy);
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index e2d7ee1..b498964 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -56,6 +56,7 @@ typedef struct VFIORegion {
     uint32_t nr_mmaps;
     VFIOMmap *mmaps;
     uint8_t nr; /* cache the region number for debug */
+    bool post_wr; /* writes can be posted */
     int remfd; /* fd if exported from remote process */
 } VFIORegion;
 
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 47ec28f..e19f321 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -213,6 +213,7 @@ void vfio_region_write(void *opaque, hwaddr addr,
         uint32_t dword;
         uint64_t qword;
     } buf;
+    bool post = region->post_wr;
     int ret;
 
     switch (size) {
@@ -233,7 +234,11 @@ void vfio_region_write(void *opaque, hwaddr addr,
         break;
     }
 
-    ret = VDEV_REGION_WRITE(vbasedev, region->nr, addr, size, &buf, false);
+    /* read-after-write hazard if guest can directly access region */
+    if (region->nr_mmaps) {
+        post = false;
+    }
+    ret = VDEV_REGION_WRITE(vbasedev, region->nr, addr, size, &buf, post);
     if (ret != size) {
         const char *err = ret < 0 ? strerror(-ret) : "short write";
 
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 40eb9e6..d5f9987 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -1665,6 +1665,9 @@ static void vfio_bar_prepare(VFIOPCIDevice *vdev, int nr)
     bar->type = pci_bar & (bar->ioport ? ~PCI_BASE_ADDRESS_IO_MASK :
                                          ~PCI_BASE_ADDRESS_MEM_MASK);
     bar->size = bar->region.size;
+
+    /* IO regions are sync, memory can be async */
+    bar->region.post_wr = (bar->ioport == 0);
 }
 
 static void vfio_bars_prepare(VFIOPCIDevice *vdev)
@@ -3513,6 +3516,9 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     if (udev->send_queued) {
         proxy->flags |= VFIO_PROXY_FORCE_QUEUED;
     }
+    if (udev->no_post) {
+        proxy->flags |= VFIO_PROXY_NO_POST;
+    }
 
     vfio_user_validate_version(vbasedev, &err);
     if (err != NULL) {
@@ -3565,6 +3571,7 @@ static void vfio_user_instance_finalize(Object *obj)
 static Property vfio_user_pci_dev_properties[] = {
     DEFINE_PROP_STRING("socket", VFIOUserPCIDevice, sock_name),
     DEFINE_PROP_BOOL("x-send-queued", VFIOUserPCIDevice, send_queued, false),
+    DEFINE_PROP_BOOL("x-no-posted-writes", VFIOUserPCIDevice, no_post, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index b40c4ed..781cbfd 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -50,6 +50,8 @@ static void vfio_user_cb(void *opaque);
 
 static void vfio_user_request(void *opaque);
 static int vfio_user_send_queued(VFIOProxy *proxy, VFIOUserMsg *msg);
+static void vfio_user_send_async(VFIOProxy *proxy, VFIOUserHdr *hdr,
+                                 VFIOUserFDs *fds);
 static void vfio_user_send_wait(VFIOProxy *proxy, VFIOUserHdr *hdr,
                                 VFIOUserFDs *fds, int rsize, bool nobql);
 static void vfio_user_request_msg(VFIOUserHdr *hdr, uint16_t cmd,
@@ -533,6 +535,33 @@ static int vfio_user_send_queued(VFIOProxy *proxy, VFIOUserMsg *msg)
     return 0;
 }
 
+/*
+ * async send - msg can be queued, but will be freed when sent
+ */
+static void vfio_user_send_async(VFIOProxy *proxy, VFIOUserHdr *hdr,
+                                 VFIOUserFDs *fds)
+{
+    VFIOUserMsg *msg;
+    int ret;
+
+    if (!(hdr->flags & (VFIO_USER_NO_REPLY|VFIO_USER_REPLY))) {
+        error_printf("vfio_user_send_async on sync message\n");
+        return;
+    }
+
+    QEMU_LOCK_GUARD(&proxy->lock);
+
+    msg = vfio_user_getmsg(proxy, hdr, fds);
+    msg->id = hdr->id;
+    msg->rsize = 0;
+    msg->type = VFIO_MSG_ASYNC;
+
+    ret = vfio_user_send_queued(proxy, msg);
+    if (ret < 0) {
+        vfio_user_recycle(proxy, msg);
+    }
+}
+
 static void vfio_user_send_wait(VFIOProxy *proxy, VFIOUserHdr *hdr,
                                 VFIOUserFDs *fds, int rsize, bool nobql)
 {
@@ -957,6 +986,62 @@ static int vfio_user_get_region_info(VFIOProxy *proxy,
     return 0;
 }
 
+static int vfio_user_region_read(VFIOProxy *proxy, uint8_t index, off_t offset,
+                                 uint32_t count, void *data)
+{
+    g_autofree VFIOUserRegionRW *msgp = NULL;
+    int size = sizeof(*msgp) + count;
+
+    msgp = g_malloc0(size);
+    vfio_user_request_msg(&msgp->hdr, VFIO_USER_REGION_READ, sizeof(*msgp), 0);
+    msgp->offset = offset;
+    msgp->region = index;
+    msgp->count = count;
+
+    vfio_user_send_wait(proxy, &msgp->hdr, NULL, size, false);
+    if (msgp->hdr.flags & VFIO_USER_ERROR) {
+        return -msgp->hdr.error_reply;
+    } else if (msgp->count > count) {
+        return -E2BIG;
+    } else {
+        memcpy(data, &msgp->data, msgp->count);
+    }
+
+    return msgp->count;
+}
+
+static int vfio_user_region_write(VFIOProxy *proxy, uint8_t index, off_t offset,
+                                  uint32_t count, void *data, bool post)
+{
+    VFIOUserRegionRW *msgp = NULL;
+    int flags = post ? VFIO_USER_NO_REPLY : 0;
+    int size = sizeof(*msgp) + count;
+    int ret;
+
+    msgp = g_malloc0(size);
+    vfio_user_request_msg(&msgp->hdr, VFIO_USER_REGION_WRITE, size, flags);
+    msgp->offset = offset;
+    msgp->region = index;
+    msgp->count = count;
+    memcpy(&msgp->data, data, count);
+
+    /* async send will free msg after it's sent */
+    if (post && !(proxy->flags & VFIO_PROXY_NO_POST)) {
+        vfio_user_send_async(proxy, &msgp->hdr, NULL);
+        return count;
+    }
+
+    vfio_user_send_wait(proxy, &msgp->hdr, NULL, 0, false);
+    if (msgp->hdr.flags & VFIO_USER_ERROR) {
+        ret = -msgp->hdr.error_reply;
+    } else {
+        ret = count;
+    }
+
+    g_free(msgp);
+    return ret;
+}
+
 
 /*
  * Socket-based io_ops
@@ -990,8 +1075,24 @@ static int vfio_user_io_get_region_info(VFIODevice *vbasedev,
     return VDEV_VALID_REGION_INFO(vbasedev, info, fd);
 }
 
+static int vfio_user_io_region_read(VFIODevice *vbasedev, uint8_t index,
+                                    off_t off, uint32_t size, void *data)
+{
+    return vfio_user_region_read(vbasedev->proxy, index, off, size, data);
+}
+
+static int vfio_user_io_region_write(VFIODevice *vbasedev, uint8_t index,
+                                     off_t off, unsigned size, void *data,
+                                     bool post)
+{
+    return vfio_user_region_write(vbasedev->proxy, index, off, size, data,
+                                  post);
+}
+
 VFIODevIO vfio_dev_io_sock = {
     .get_info = vfio_user_io_get_info,
     .get_region_info = vfio_user_io_get_region_info,
+    .region_read = vfio_user_io_region_read,
+    .region_write = vfio_user_io_region_write,
 };
 
-- 
1.8.3.1


