Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8188449FF8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 01:50:29 +0100 (CET)
Received: from localhost ([::1]:55154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkFLJ-0006Ay-1r
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 19:50:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mkFAd-0005fE-QN
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 19:39:28 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:42748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mkFAX-000470-32
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 19:39:27 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A902vrG019145
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 00:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=bupvFZtZ/cj2yBDs8t6z8DuYs4AvzwK42E50vfuCU7s=;
 b=aZCggIRzz4WnKGPVM8bouc1SW7pgufeUu7CY850m9dzkFKn60KPdXXJ13nviUwNDHDzI
 /3b32kOONk6ARKRv5tecxk564tSe4eOUV6I9J3Pz7sZHzgpmeAT5NW1QlvarwbjnnwH2
 j+zpUMBOqLeUUlNL4WOzxp9NkeVcNlTVKIZx1ufVu0O1DktD+1JLpFXRObLI5T0z/b8b
 IINoUKtq8bzdw9SeSmNf9de4RGdxExzjGEn/KGmJww6kgyBOksmQ366lnxQa6C7HThk9
 chkC4gvCByfXGLAJII3jiJck6VnU1tLlNgaxfGBSfaC0486QLt2U4ebYQL5a+jwwyx7e Yg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c6sbk7c8a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:39:20 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A90ZLN5129193
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 00:39:18 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
 by userp3030.oracle.com with ESMTP id 3c5etuvb6n-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:39:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WR4RjEiIOb3cZP/NDZPAQ5mdFvhAk+Fj3H1pdPcP3wLMAblS71kpV1I12gdkzToU81y261Bkz/nNekBgvqZDOOcvDMbdqMn5jQ9btZxT4pny7A8MOdiVelfN4bYK8snriBRFZ1lTK7NCxvjG5V/Fv5Y6X5eydHiTVVDSEs1QR4VIxnc0eR3SL5+Ebg2i7FPIPJFZ+gmw7bgezxeTAbSPR7EoWlgryfcV3WKzic+t5uARe9jmtRjiOz6/W+1W2YMKiLxzP+Cy3BAexFJRlQtY+IUyZJsHshUWa/zJn7tMMq5cDLCXzkXubH6NHR2g2z5XTg5cuEKSRG/b8DjQjLtqhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bupvFZtZ/cj2yBDs8t6z8DuYs4AvzwK42E50vfuCU7s=;
 b=foCXghtOcbTBz66xWF4xkdE3iFRoxPNuYdElfqY7uSsp2TbdYEKCefgeENQ0a1YRPCoWNY4EUyaNNNF4PWCpb35734JjbgrEEEXRKCp4H38+9rAg2y++2n3+VWZOP8/X/Q7MgNvaq8mx958mSEo1P3Yh45XTwlEbl75dTc5ZfSnzzQfi3zVZK9wkJBCGekD6uFP+6aU97Qj7kBEgmskfZiy3OEm0GqVp/HReFGKpzypxneaWzqedFgQE0wBGYMzCwJ7CfvicrGyjzItyj5iMsdnqza7eBQy2+O76SNAhQoF1BLqtY7AFgJUN+BjsGjx9dr2I7blP0LdKa8RQ+CiH9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bupvFZtZ/cj2yBDs8t6z8DuYs4AvzwK42E50vfuCU7s=;
 b=RZ7+xWrfAzmtKk6SYrG/6hqPEca1nB4uiTOeiQ2rJM7Q1HALODDGj4FRTDaqx0Balrl2HCPNQa3+5LcIEIRd17Oe2K1vd/T+P+2GMJMtImC2bC/W6cIG41Q+HexzuluakO/Ed7s5fYVec77qiYSwHhERYytYe+8YgUYyBzoo7Ko=
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
Subject: [RFC v3 10/19] vfio-user: get device info
Date: Mon,  8 Nov 2021 16:46:38 -0800
Message-Id: <30f1093de48b3eb368d6425fa0d3a2505ca70af6.1636057885.git.john.g.johnson@oracle.com>
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
 Transport; Tue, 9 Nov 2021 00:39:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9614b05-803d-4a37-f60a-08d9a31959d6
X-MS-TrafficTypeDiagnostic: BY5PR10MB4068:
X-Microsoft-Antispam-PRVS: <BY5PR10MB40684E387AE035D7D9BFA4FDB6929@BY5PR10MB4068.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IR3AJG6eaEUovrFC9/ZPTTc/3b7+nbZHoPPHDQGTlijoVCJcjAMn9C9k07VFWqIp8IndyAuGwE4CGON5a0Aygw3l6YGfmFD0X7mDCEg4VasKeG9Gb/bFcpLKASpK+heeUlY/0dka0X8w/jcYUtnCxlzxSL9ryxlaKoIqdfCd/YstKXkT4QvI9vdr9nmGWmqiJfIeyZXh4Y2gVpCsH5JupwP7Lu5rEDe3lhwyhWqrkqxvEq7efBmtw9qvWDK3dN0eLvnGy5buZmc82t7dHQ8/y+qX8f+QES448CUWoNrjobb++i9xYbRjMh8GFRRb9rRMlurZi2HNZ1Sp4nxrZmH/4a0aoicTVhuh0paIqcvrqXpgJJIzqEY2S+W0NIUuxF2dsIpB7mM3h0JGvMgfoGR+iSWQGHz3HhZqAxBkwJrI0MENdxZzCHkpoj3KzxUa8H23thnt9hUU8jnVg0d8stdfi/h7WUNpSMyfNmgLBStutUXbX1IQ9MF8X4RePB947VBM7CxRAl4KhKTPFEevG/iF2vsl0GXGRNuO68T3HB98Sn9d5EDgdQy1Zj8KFfu75+7vXb2ijDPHQSShKNDoRwBXe3vU96Cqno5NC7q2zu9EozfT3Cbj/gSWee4hA3jRkTIPjbU8mZAGaRH9qW8UfSjUTwUcBEhuNKHdlqFZk9xGD1glPbbMe6X95BAKEv9UpnHMe9CBKIQU6WwER4WG7loRNA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4686.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(316002)(186003)(66556008)(508600001)(8936002)(8676002)(66946007)(6486002)(26005)(2906002)(6916009)(5660300002)(36756003)(7696005)(52116002)(86362001)(83380400001)(956004)(38100700002)(6666004)(2616005)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LH+wV0nygKwDOIjB6e3EOwjfRUcOxXBxR2Pn3vpjPwbxXxzseb5XUHKKc7zS?=
 =?us-ascii?Q?QYDzWh/wG3P5dZup4EXM9QMK29fTzE45iN/YOEUBbZHwxWcJZvk4mDCuSAB6?=
 =?us-ascii?Q?fQ0jeVFAS2fkQFxK4sv4xqXxMx913P92D9iSC1bP8WOpp3GDCoqgVLJxJ7ty?=
 =?us-ascii?Q?32Z3tVnP+cj8hHvMOWr+EqaKSCbmmyUjju44Chub2FZbPbbPzBbZNJwNdzlj?=
 =?us-ascii?Q?OJNrAF11hOG+enzQOZOtRCVydV28cfOXJ2GSWH6Sjam67Oa48bmY8EMuLCl8?=
 =?us-ascii?Q?MU1niybwjpmK6ru8Uxt4u/cEaCbmI2T/oSFUuEzg8LOKWUK5sAmOJ3l/Kpc6?=
 =?us-ascii?Q?QjukvaGwVWyzx0uqzATXUicboWukEU0hQOo3KBvfQbdRd9nmiuDS6iyGJf+5?=
 =?us-ascii?Q?1x/TJ4Wj+Ww1nuwzmxnny6tXEh3R5Xg3qnUPYXCJ6AQNrTmSB3lKCQDyB2Zz?=
 =?us-ascii?Q?2iBYabNAimqEfskdpI89YiKFOqZoJrsLD+Die8IXy3VIW8hR/FSNLdR+C+Td?=
 =?us-ascii?Q?Y+fpiSbtubRYA62OnRuXo4tofySZe3we/eVH+mEftNKUoBfzNx0fmTCyiMPN?=
 =?us-ascii?Q?YQxxsR8Csw5Iqk18M07R1poDYXYUCNmGUoRDWSiMxfJxcnkvyu3aicVOOxJ3?=
 =?us-ascii?Q?FysvQsB3hBnTtyzeaVoZEzns8uQfj7YBFNIf7qmC/hBvrJbGEGTzXBRIGd4/?=
 =?us-ascii?Q?GZSNbzuzoYi1Qab2rQKf8kOvB/XpBqnsv8ZG2lfOavOlt6HFEO2MOo7xh+DN?=
 =?us-ascii?Q?u5jKY/rID2XDGkoSe9l01wYqtaXVTaY13h+2xy5AMdYbAKiMvc8KSuQ7mXnE?=
 =?us-ascii?Q?ZyaOMCAKQJu15dRMF9qq8Uw4c4QChaywpanOnFvi2ZXvH90/E3Q6vmezXnPb?=
 =?us-ascii?Q?Y9R2zBcNE965Izg0O0ShE64f2DLIn4JiocdxgsNy7N0PbzWnIij3O64hLNKf?=
 =?us-ascii?Q?sNqahxNi1ggTCOl+XUQr+2bPmRcLj5nZKnnEQEg1AUi1dPimWnsgzbU9X6K2?=
 =?us-ascii?Q?I9YRk+9gSEp3WqOywlxNJ9xXUvBSWEzjLcPe+Ohewa4DHXVRLrKCK6SK/T9N?=
 =?us-ascii?Q?0ez4wXR2ZSHaTG6YvDz/xSTcQn0xwW3pAqwlfeCimNa7lugBPGRCzytQi3bk?=
 =?us-ascii?Q?8csBmEyESb7ke6C02yEPZFYDT4DTAf5PgAPRlhkfAyr8/frvUXgYOUHVYcCD?=
 =?us-ascii?Q?LFsnWdMrqCyINwkslVP+AnyF1ZuX+78SNUnj4IPGKfDSaZXuTno5/FgeXYkG?=
 =?us-ascii?Q?W2Hso9afCaODbe2BrVyEYGEyyqR9Zj3+hYNufCZ0t3mvCJDH06F++ldxy/dV?=
 =?us-ascii?Q?3spmO4v9uryqbdHm/dXh/VK5dXVxI9+pMLh9gXStnXZ6vMnAhKA5KM3QR9Ax?=
 =?us-ascii?Q?krjeVnleiWg+JlQnZy6vaJ0y8fwSk0VQcngjA0TRasKQN1zuoR/gR3xNRP6z?=
 =?us-ascii?Q?wORv2gr8tEZKCeLfl7OhS2+4dnKkrI1tLkUC6LJqRMSvfyw0/AZCrUEhh4F6?=
 =?us-ascii?Q?Qk2ORKAsUKdEkqVd8cEdGXLQxZ+FXE93ODJ8//9tUCnHh54aVprFGgZ7um8c?=
 =?us-ascii?Q?OBo8ADklfMVAhz9XjbW0ipWnQkEssIxSmKdD92hbfVgLcfmQrKqour0zcWy+?=
 =?us-ascii?Q?qd4vOG50Y2ej/O9Bb39R5FjGY4xaJhMesxvp/7hJnE7Y75iorPyYrhULnhOp?=
 =?us-ascii?Q?eQ5G9Q=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9614b05-803d-4a37-f60a-08d9a31959d6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4686.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 00:39:12.7341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XizJd0pgCv8z6dhc9LKlsEK9imDy+C/GxSElqYsW0eLlSbOa90q0Ir4vIh+xkRSFlRSpADhOFMm1ucKqYCwereKGWveivFUajWeh26XhCjM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4068
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10162
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111090001
X-Proofpoint-GUID: _td4PvHCKzYWO5GkZv5ENwIfRCXik2yz
X-Proofpoint-ORIG-GUID: _td4PvHCKzYWO5GkZv5ENwIfRCXik2yz
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

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user-protocol.h | 13 +++++++++++++
 hw/vfio/user.h          |  2 ++
 hw/vfio/pci.c           | 19 +++++++++++++++++++
 hw/vfio/user.c          | 40 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 74 insertions(+)

diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
index 14b762d..13e44eb 100644
--- a/hw/vfio/user-protocol.h
+++ b/hw/vfio/user-protocol.h
@@ -82,4 +82,17 @@ typedef struct {
 #define VFIO_USER_MAX_MAX_XFER  (64 * 1024 * 1024)
 
 
+/*
+ * VFIO_USER_DEVICE_GET_INFO
+ * imported from struct_device_info
+ */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint32_t argsz;
+    uint32_t flags;
+    uint32_t num_regions;
+    uint32_t num_irqs;
+    uint32_t cap_offset;
+} VFIOUserDeviceInfo;
+
 #endif /* VFIO_USER_PROTOCOL_H */
diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index 7ef3c95..19edd84 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -83,4 +83,6 @@ void vfio_user_set_handler(VFIODevice *vbasedev,
                            void *reqarg);
 int vfio_user_validate_version(VFIODevice *vbasedev, Error **errp);
 
+extern VFIODevIO vfio_dev_io_sock;
+
 #endif /* VFIO_USER_H */
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 1bd0f6c..40eb9e6 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3484,6 +3484,8 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     VFIODevice *vbasedev = &vdev->vbasedev;
     SocketAddress addr;
     VFIOProxy *proxy;
+    struct vfio_device_info info;
+    int ret;
     Error *err = NULL;
 
     /*
@@ -3524,8 +3526,25 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     vbasedev->type = VFIO_DEVICE_TYPE_PCI;
     vbasedev->no_mmap = false;
     vbasedev->ops = &vfio_user_pci_ops;
+    vbasedev->io_ops = &vfio_dev_io_sock;
     vbasedev->valid_ops = &vfio_pci_valid_ops;
 
+    ret = VDEV_GET_INFO(vbasedev, &info);
+    if (ret) {
+        error_setg_errno(errp, -ret, "get info failure");
+        goto error;
+    }
+    vbasedev->num_irqs = info.num_irqs;
+    vbasedev->num_regions = info.num_regions;
+    vbasedev->flags = info.flags;
+    vbasedev->reset_works = !!(info.flags & VFIO_DEVICE_FLAGS_RESET);
+
+    vfio_populate_device(vdev, &err);
+    if (err) {
+        error_propagate(errp, err);
+        goto error;
+    }
+
     return;
 
 error:
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index edf1816..ed2a4d7 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -905,3 +905,43 @@ int vfio_user_validate_version(VFIODevice *vbasedev, Error **errp)
 
     return 0;
 }
+
+static int vfio_user_get_info(VFIOProxy *proxy, struct vfio_device_info *info)
+{
+    VFIOUserDeviceInfo msg;
+
+    memset(&msg, 0, sizeof(msg));
+    vfio_user_request_msg(&msg.hdr, VFIO_USER_DEVICE_GET_INFO, sizeof(msg), 0);
+    msg.argsz = sizeof(struct vfio_device_info);
+
+    vfio_user_send_wait(proxy, &msg.hdr, NULL, 0, false);
+    if (msg.hdr.flags & VFIO_USER_ERROR) {
+        return -msg.hdr.error_reply;
+    }
+
+    memcpy(info, &msg.argsz, sizeof(*info));
+    return 0;
+}
+
+
+/*
+ * Socket-based io_ops
+ */
+
+static int vfio_user_io_get_info(VFIODevice *vbasedev,
+                                 struct vfio_device_info *info)
+{
+    int ret;
+
+    ret = vfio_user_get_info(vbasedev->proxy, info);
+    if (ret) {
+        return ret;
+    }
+
+    return VDEV_VALID_INFO(vbasedev, info);
+}
+
+VFIODevIO vfio_dev_io_sock = {
+    .get_info = vfio_user_io_get_info,
+};
+
-- 
1.8.3.1


