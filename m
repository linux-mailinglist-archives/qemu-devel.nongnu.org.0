Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3C644A0C5
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 02:03:14 +0100 (CET)
Received: from localhost ([::1]:39184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkFXd-0000NR-Ej
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 20:03:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mkFAs-0005rO-4V
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 19:39:42 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:43024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mkFAX-000478-AS
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 19:39:40 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A8NxaFw001213
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 00:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=i3GSV6p9J98AxMxxbvEPwowNtuFf+gWGPvJ/tkjjRNM=;
 b=cp2gwu2Zz4O8Rp1e2IQ+qfuet5QKP+VOEBhgQYlUjyGsYFb8EEVTLhDzxZUYC4/OJjD4
 M24yzsuRGmM7bKPh2/6DwABTp66vfybBG/E14+oAKk9GjScbCmFYQB4pOWfnaK0Nzham
 0/mPI3Za3eW9DrTIhMAjKxAVNwUx20YnlQet/cr00J+lEuaEl8abyL5Tj3t/jvemhzVy
 ALKRJXh1WuOWGzXxOv5StWfaYU9bVVJ7qC5+YjpXg0ZcpkuRmaKmh6j7XLdAN23i65zQ
 xsc25F0drME6/Dyw1072orZ+X2gHk5hSzzwqczu9swa7H1tZ6AKfcKSGMREG4hz/B7d5 MA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c6uh4fnp5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:39:20 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A90Zxm7132637
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 00:39:19 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
 by aserp3030.oracle.com with ESMTP id 3c5frd6sqb-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:39:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EGx+oY61M62yB+ExNf9RQlJMdLa7e/7p8+SmZnHLK83hTg+ob+TRSvuqJw9IyML8HtA6cXDCqXRtjy8Qd7fyFsJMWmYeDwDTpgi2ulom1PVdJLiOK22jGDXHi8g//Yh5pC8SANo8ljb8T8FvTvjhFv77Qqekm+X/syOQ6q1EAZdlDXkpCSyCxRWqKyCykUp7tJsxPzIECC+/RIniUfTQ/RfJGvrFUao2iQDM2IIvTrYXCXvsgjOdoYfCtXaPwGP9N8qmFng9qpCkJPzB173KWfIYvV1V/T+qQjHuaHGieYRfT+JGaIjmdZBOd7wTrkEjmzA1wmjFO8dbFYk+sDUM6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3GSV6p9J98AxMxxbvEPwowNtuFf+gWGPvJ/tkjjRNM=;
 b=ePJlNOYMZhN9s9V6ckNaj/j5RMzVbX3dcgCV1AGPm1D0G5lo4HaMHnheCPxYTeUVN62iVsSEjZksskBierbJ8SPWl99gW18vq4VPBiSZ9H52TbZKt/s8xePyKj/yW5HV0FxNhm2JA8q4Mov4EW/O6NIwMdGj/T7U6KLusEXpfRK7Siyrpru9yhR6kybDSJONBqgUx0I7+RrY5NMeyvV5b4GvWMKmVgJ2WK8GMBl/ZCIaOV3GZZhM0BEZaVqf9gn+6tXuXqZMyjwGmyz3Gs3Scv5lCeUBb3HV1h1C2NMqS8He18X1RQvu3vb7JXwanwgDIA9zJajRqc+ZesedTVkOKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3GSV6p9J98AxMxxbvEPwowNtuFf+gWGPvJ/tkjjRNM=;
 b=gZrFuAu2cyTVEzZbrkaMqnvkPioPi4iwc2V+yXrF1if/zXJn8bicLsDIeXfvlfZpal4JsN1f/VOm+gi96Dulf0P/i2kw9kKivL+Qd1Zc2FZIixpGyVuGW/+9lslti5o4rge6PtY5MAqnGxXfSHzP91R0YIOs0LxIZ+uUfzSdSqs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 by BY5PR10MB4068.namprd10.prod.outlook.com (2603:10b6:a03:1b2::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Tue, 9 Nov
 2021 00:39:16 +0000
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::1551:92ba:9eb8:a093]) by SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::1551:92ba:9eb8:a093%7]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 00:39:16 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 15/19] vfio-user: proxy container connect/disconnect
Date: Mon,  8 Nov 2021 16:46:43 -0800
Message-Id: <b615bddc3a34f1614a80a75626cf7c47566c323b.1636057885.git.john.g.johnson@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7ab118de-914f-4e6d-6e69-08d9a3195a86
X-MS-TrafficTypeDiagnostic: BY5PR10MB4068:
X-Microsoft-Antispam-PRVS: <BY5PR10MB4068AAB63E08B784CEE933BCB6929@BY5PR10MB4068.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bJVQibzRgOzCmgXrR01O12TZ3H5NVvA4CyiRjn1d/jd92paC+NOpDp6MBZTQ7jPUN9vwlt+rOFg0m5OiKiSDri5/OQ7uBTpZo7F4zQYxyWyXBIk7SgVJiz3+ZwuVe93t2CojJVGgWmFpjYv8x8M03MPMCATbsPp2j5XfTGMNi2LUfLQ+Hh+9hz3Op239mQBOSYBRVkwwP5n6Gyqg5JSJeq6blhSlN75zWfwdhbNue+AqbLp28DK5Zsb9A5Vbm689YwWu54UAAIn4PuXHhYGaBT/4ZH1lPiQKyX/YwpRoc7C99TvhX/jCkyK/YNYXUmj6kzS/b502Wze3cyvrLyzaCBhxmFCcRPCYAf3p3N0F3jf3NqZ3WCtk5nwu1NQ/bAHPLAc1IVZdGAbMj+obiTsHmpCQIh2u52Ihw4sU1NHozpYRRImx96HFMyxRMvMVtMZP/cL74dnmyxZsQDGOpXCervsirz/YfC7dE4JRHLkX4WUcjCKfdR4bh+kCDMKK6VXNikSiRxK6KbauRilTAQfvThgAbL27wUK4j+datXbOJocPNVyhHerj41jRJtzUILtt/ZSV2+o/IaxH1Rp+2bayEZpuF/cHse3y2tWaB/PtRw8D62hiZfy1bzOZn+aV2c/IyxobYGGtdTsLAqBlq/MVWgzBfTZvET1cjJAp9yBlo/SB4DlSk8+k4VZjKvFUZsThpe88eyhGj/MFbpgNYjRRxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4686.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(316002)(186003)(66556008)(508600001)(8936002)(8676002)(66946007)(6486002)(26005)(2906002)(6916009)(5660300002)(36756003)(7696005)(52116002)(86362001)(83380400001)(956004)(38100700002)(6666004)(2616005)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l090CUuoU6HbDP4Q5pKVjCwllJ2D33dfV8VPkptwV+BYRAmXx7DcUvT/5vj9?=
 =?us-ascii?Q?r8ZR8dtEiWv7UJ9tRC3Jx1EbtzaUatfz1/se3aowe6s1gxdkLa13mcOq4Lap?=
 =?us-ascii?Q?vXruHnPOt5zjCkJPoJ/c1ryk5/UhSiNbJvZUe7in4VHSwz6pF58a5hP5tajL?=
 =?us-ascii?Q?7f/hLfqkvSmH9KLuPO+p9O8kMJAm6zYpljt0moO20aNrfnkcxeSWk2RKopWb?=
 =?us-ascii?Q?oVegUdLICpWLBITWEthC+vjWWGBqLxVtpyhxHv3fWHg8K9w3YdTPyruWNANZ?=
 =?us-ascii?Q?BAOShkr9QrLn2iO+6tW+wQYAuSuHiJTwnW3hhL7adx/FdTA9JV7CgUZnrgIT?=
 =?us-ascii?Q?kOax9yow8vfsHoGjLZ9j2gozrhBkowcHQEB1v6MnkFLgDvIAaUau/EESsVa3?=
 =?us-ascii?Q?757Z0CNQ+BPvo3dvD6gZG7vFELTCwdys6/Xol6mN3+ohjGij1vlH2O9Dqb5E?=
 =?us-ascii?Q?BPVPOzC5XfVMAzewhuRhc3KdIvHQWKuJKikCqNTPsyeiKi9nEDzQxArYpcXu?=
 =?us-ascii?Q?yja+OB9PT/LSSD0VyKkkwbJIffQnYpXcyBoAzVU2wa08NdKasa6o5dMXpeY2?=
 =?us-ascii?Q?8EKWhHWSACGARp5BYK6pud16bCm67jyS2yPEysuF8RbyFtzcEVA4WHrVJt2d?=
 =?us-ascii?Q?VbEe6AIQRwfWD0XYCkekQGZ2VJzBjyERBQpNJvTTatEO1rSGq4bMWjp/nbZj?=
 =?us-ascii?Q?VeSO9iReQDqvtmmx3y9jkPCIjQlo5Yn2iI0+aGfNOi8yA8FdlzzSJUQ/zUur?=
 =?us-ascii?Q?rTZnoNKOUfhJZh35K1onTCF3pA0I3cZhZ2hJj+Zsks5ZqxPTGrDV61wJAHhC?=
 =?us-ascii?Q?ucU+guFnAIReXYI3pVe06xv+Dni2pKWDKAsZS0wRzP4uMu50NvE6YRn8zPmc?=
 =?us-ascii?Q?aZvBwAN8IU+rEeqcASb4yXxAbEeBhsdar1saIArlmHBeVk++v9XTvnyd+h2X?=
 =?us-ascii?Q?fWkqRWrA0+BCZh/oOcnbhv+OwNOAjXrsB2Kel4sY2CeJ8atbaiqEjsIywMbR?=
 =?us-ascii?Q?uacoiZdcf21/RA+Qh5VPNjuAujEE3N3AVns0D1vsXygCJr7u3cqfKIAFkSsF?=
 =?us-ascii?Q?gXOKi8YmWAAb4ykd8iQDQHoQfFBOwTwhTa85Lo0rIs0TVYMiet6JaoyOl9aw?=
 =?us-ascii?Q?bTNwl358tFFnSO110IAHwbZy4vW1Bg/WeG6pG7FNGXg0dRtoD5+rlZXrl6QR?=
 =?us-ascii?Q?tuaXDn2xKi7RG75Ch7t3+OnP9CNWjb7/irdIYbJEsZQrK/Fu2qKUarJTcn7/?=
 =?us-ascii?Q?lvevmtJ2ATp9yFcQJL3+AVTvv5xdmqJNNjdukD+to9B+16Qey0DEPfHFGuVK?=
 =?us-ascii?Q?Xq3AlxyUpJbGozorzcf4LrJuLguXthOOgDYjfPlMOUkvPqXOqMg4/47dn6m8?=
 =?us-ascii?Q?AhYGkf7twr10JLibhkXJjQhYC5ZdYOxeqF9kpLBWKbcPbMCcL3VnZHnnnoEo?=
 =?us-ascii?Q?1X9NThvuwPAh6VzGW+lhapH1p8YFncjNBzwMYHgowfuSuo8p5RDokx4uQDVx?=
 =?us-ascii?Q?3xgQQzk7wKld2zJolHvUCjPYI1XbO0SydOPTiUlYzlLmRnw53VDUpdpITIk6?=
 =?us-ascii?Q?2Jb8+7M7AWzp3Xh+Z4kFczbmkpuJnyshvFU8QpNzx1/4+aQ+Oy+FXUc7CXOy?=
 =?us-ascii?Q?GzMerZ308tyU4Vh81JI5iwQXHh+cS0q81UQTphXfC4Iy6ekojWhKfb7HXIPe?=
 =?us-ascii?Q?iic8NQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab118de-914f-4e6d-6e69-08d9a3195a86
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4686.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 00:39:13.8841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lju/F2DUd3fqJhmMNeeRAulu40dSX7XQKAYGUMDoB0kjmTyZHHT/qLnoW2jRQQsLhuWtURfza/rENntCYnsJdGJfGhR30d8xfsgxIPfZWb0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4068
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10162
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0
 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111090001
X-Proofpoint-ORIG-GUID: WcuqcbJsr6dg_UJcCnG1rzOFFbAt12iU
X-Proofpoint-GUID: WcuqcbJsr6dg_UJcCnG1rzOFFbAt12iU
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
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
 hw/vfio/user.h                |  1 +
 include/hw/vfio/vfio-common.h |  3 ++
 hw/vfio/common.c              | 98 +++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/pci.c                 | 24 +++++++++++
 hw/vfio/user.c                |  3 ++
 5 files changed, 129 insertions(+)

diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index f2098f2..8d03e7c 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -85,5 +85,6 @@ void vfio_user_set_handler(VFIODevice *vbasedev,
 int vfio_user_validate_version(VFIODevice *vbasedev, Error **errp);
 
 extern VFIODevIO vfio_dev_io_sock;
+extern VFIOContIO vfio_cont_io_sock;
 
 #endif /* VFIO_USER_H */
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index b498964..c0e7632 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -94,6 +94,7 @@ typedef struct VFIOContainer {
     uint64_t max_dirty_bitmap_size;
     unsigned long pgsizes;
     unsigned int dma_max_mappings;
+    VFIOProxy *proxy;
     QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
     QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
     QLIST_HEAD(, VFIOGroup) group_list;
@@ -300,6 +301,8 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp);
 void vfio_put_group(VFIOGroup *group);
 int vfio_get_device(VFIOGroup *group, const char *name,
                     VFIODevice *vbasedev, Error **errp);
+void vfio_connect_proxy(VFIOProxy *proxy, VFIOGroup *group, AddressSpace *as);
+void vfio_disconnect_proxy(VFIOGroup *group);
 
 extern const MemoryRegionOps vfio_region_ops;
 typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index e19f321..fdd2702 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include CONFIG_DEVICES
 #include <sys/ioctl.h>
 #ifdef CONFIG_KVM
 #include <linux/kvm.h>
@@ -2204,6 +2205,62 @@ put_space_exit:
     return ret;
 }
 
+
+#ifdef CONFIG_VFIO_USER
+
+void vfio_connect_proxy(VFIOProxy *proxy, VFIOGroup *group, AddressSpace *as)
+{
+    VFIOAddressSpace *space;
+    VFIOContainer *container;
+
+    if (QLIST_EMPTY(&vfio_group_list)) {
+        qemu_register_reset(vfio_reset_handler, NULL);
+    }
+
+    QLIST_INSERT_HEAD(&vfio_group_list, group, next);
+
+    /*
+     * try to mirror vfio_connect_container()
+     * as much as possible
+     */
+
+    space = vfio_get_address_space(as);
+
+    container = g_malloc0(sizeof(*container));
+    container->space = space;
+    container->fd = -1;
+    container->io_ops = &vfio_cont_io_sock;
+    QLIST_INIT(&container->giommu_list);
+    QLIST_INIT(&container->hostwin_list);
+    container->proxy = proxy;
+
+    /*
+     * The proxy uses a SW IOMMU in lieu of the HW one
+     * used in the ioctl() version.  Use TYPE1 with the
+     * target's page size for maximum capatibility
+     */
+    container->iommu_type = VFIO_TYPE1_IOMMU;
+    vfio_host_win_add(container, 0, (hwaddr)-1, TARGET_PAGE_SIZE);
+    container->pgsizes = TARGET_PAGE_SIZE;
+
+    container->dirty_pages_supported = true;
+    container->max_dirty_bitmap_size = VFIO_USER_DEF_MAX_XFER;
+    container->dirty_pgsizes = TARGET_PAGE_SIZE;
+
+    QLIST_INIT(&container->group_list);
+    QLIST_INSERT_HEAD(&space->containers, container, next);
+
+    group->container = container;
+    QLIST_INSERT_HEAD(&container->group_list, group, container_next);
+
+    container->listener = vfio_memory_listener;
+    memory_listener_register(&container->listener, container->space->as);
+    container->initialized = true;
+}
+
+#endif /* CONFIG_VFIO_USER */
+
+
 static void vfio_disconnect_container(VFIOGroup *group)
 {
     VFIOContainer *container = group->container;
@@ -2246,6 +2303,47 @@ static void vfio_disconnect_container(VFIOGroup *group)
     }
 }
 
+
+#ifdef CONFIG_VFIO_USER
+
+void vfio_disconnect_proxy(VFIOGroup *group)
+{
+    VFIOContainer *container = group->container;
+    VFIOAddressSpace *space = container->space;
+    VFIOGuestIOMMU *giommu, *tmp;
+
+    /*
+     * try to mirror vfio_disconnect_container()
+     * as much as possible, knowing each device
+     * is in one group and one container
+     */
+
+    QLIST_REMOVE(group, container_next);
+    group->container = NULL;
+
+    /*
+     * Explicitly release the listener first before unset container,
+     * since unset may destroy the backend container if it's the last
+     * group.
+     */
+    memory_listener_unregister(&container->listener);
+
+    QLIST_REMOVE(container, next);
+
+    QLIST_FOREACH_SAFE(giommu, &container->giommu_list, giommu_next, tmp) {
+        memory_region_unregister_iommu_notifier(
+            MEMORY_REGION(giommu->iommu), &giommu->n);
+        QLIST_REMOVE(giommu, giommu_next);
+        g_free(giommu);
+    }
+
+    g_free(container);
+    vfio_put_address_space(space);
+}
+
+#endif /* CONFIG_VFIO_USER */
+
+
 VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
 {
     VFIOGroup *group;
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 6f2d2fd..d657b01 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3489,6 +3489,7 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     VFIODevice *vbasedev = &vdev->vbasedev;
     SocketAddress addr;
     VFIOProxy *proxy;
+    VFIOGroup *group = NULL;
     struct vfio_device_info info;
     int ret;
     Error *err = NULL;
@@ -3537,6 +3538,19 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     vbasedev->io_ops = &vfio_dev_io_sock;
     vbasedev->valid_ops = &vfio_pci_valid_ops;
 
+    /*
+     * each device gets its own group and container
+     * make them unrelated to any host IOMMU groupings
+     */
+    group = g_malloc0(sizeof(*group));
+    group->fd = -1;
+    group->groupid = -1;
+    QLIST_INIT(&group->device_list);
+    QLIST_INSERT_HEAD(&group->device_list, vbasedev, next);
+    vbasedev->group = group;
+
+    vfio_connect_proxy(proxy, group, pci_device_iommu_address_space(pdev));
+
     ret = VDEV_GET_INFO(vbasedev, &info);
     if (ret) {
         error_setg_errno(errp, -ret, "get info failure");
@@ -3644,6 +3658,9 @@ out_teardown:
     vfio_teardown_msi(vdev);
     vfio_bars_exit(vdev);
 error:
+    if (group != NULL) {
+        vfio_disconnect_proxy(group);
+    }
     vfio_user_disconnect(proxy);
     error_prepend(errp, VFIO_MSG_PREFIX, vdev->vbasedev.name);
 }
@@ -3652,6 +3669,13 @@ static void vfio_user_instance_finalize(Object *obj)
 {
     VFIOPCIDevice *vdev = VFIO_PCI_BASE(obj);
     VFIODevice *vbasedev = &vdev->vbasedev;
+    VFIOGroup *group = vbasedev->group;
+
+    if (group != NULL) {
+        vfio_disconnect_proxy(group);
+        g_free(group);
+        vbasedev->group = NULL;
+    }
 
     vfio_put_device(vdev);
 
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 1e220b9..70fe7a6 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -1224,3 +1224,6 @@ VFIODevIO vfio_dev_io_sock = {
     .region_write = vfio_user_io_region_write,
 };
 
+
+VFIOContIO vfio_cont_io_sock = {
+};
-- 
1.8.3.1


