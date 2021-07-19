Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 862F93CCDFD
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 08:34:38 +0200 (CEST)
Received: from localhost ([::1]:46432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5MrN-0001X4-8y
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 02:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1m5MlK-0004Cy-GM
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:28:23 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:34346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1m5MlF-0002Kz-6Y
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:28:22 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16J6GPpo021851; Mon, 19 Jul 2021 06:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=+wkEwY71OjRAzKi+pA16TE5qyBm+GnCCN5j0NoNrIsA=;
 b=quwBINIyZNbBGHBMoBWajmwts3kOaQVe+lEdlbj/dngCzFTI6uDstVfp2Mq92FG6z3tn
 4lEI2t8knyLbKbLMgQXi8vBLPvAUzJ+vpAb2ZqXcp9vPWF/u3zdavkiBDp1Prxp4HEbI
 5Ogd9W6S2k2Hyh6pkDfc4IfZaExD91WM/dZwwJe+/LL3y/iGa9iBL9UZoOGBEqP+tzcj
 tULrNG0DuJyBR++hXT9hBdjjv/qqOWXG4Ah/LQs0SRyg4Bu+PKISQOSuPzJyGskvdlU1
 9os7esBhwpLaBwHESZJx2EfPjSQkJg7xsS1HszkT4L3FVf/xCnFD5QADGnmvpXJ24dih 0A== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=+wkEwY71OjRAzKi+pA16TE5qyBm+GnCCN5j0NoNrIsA=;
 b=VwD0YExCZW8HXPNvX4V9zO5W5S92oswZMORCUvu9p7UiyDsko5+4NuC7BEhNGemNzwvB
 jnw8WBEhEIwOXpZJLVJyO3x5FnaQBHNyJP6b+W05WSWdxNyf9rV2Go0EB7c778dUaxkD
 AC+Fw+3MwtcJMhjxKJxBcJkGDwSr7pFwbPVw8eVlFngOeXT85hZfKXPIb3JYtt1IBgxd
 RQXNDYI8hYD6awkPk/BNuySm1W5a0GEPuPcEBVBvltCbtsnKq90UnUbclDUKiInygBRq
 Mn6lZB6/XwLJgLirzyo/lRioFaFkaxMIR78BLTPTZ3j9mshVLQKzFqTBj+LVZKeXL+4y Gw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 39uptrt6c5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:28:15 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16J6GMKQ099799;
 Mon, 19 Jul 2021 06:28:14 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by userp3030.oracle.com with ESMTP id 39umawam46-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:28:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XnxrqJfW6DEajl0SWTDfWe85DZwB2qcqZL2jdB6VPoZ5sYnKSZWMo2qvdBBbk2nsR+XFWubS8WzAyJXHUOWT9qsjhpGFca7ZRUl0rwr3uk2XPu/IShqymrhndIhoCcgvTZhYOxtUpIA7NlUAqHrs4iWu1QtO4EY0dMC6Www6E+OxAnr7u6n7h7pQFjuzw+ZQQmf+7wicgRhJ6PvjuHLAzCa8XBgWmapheQwfwdAf+vKsVEMcgv7TXIf2BqJoELNhnw3NTytYGJoeACTZWuafgmLzNRT8LDIGIBrjUp2IRyRF53kvdvYYzen1jBSblBYaoT1Vxv8TwAm1Q1x4WJrrMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wkEwY71OjRAzKi+pA16TE5qyBm+GnCCN5j0NoNrIsA=;
 b=T1QH51TznEdzVy5x8AaWYzEiA17WlP1YygDEztwJJ8g7iQODpomJvsZMyE+1C0iC4jNFA5t5y4TavrXZrYVP0p/bFYI+CSvpwBtw3ec69tOiZZ6A/Y6Ll6ToadgnJ5aXhT8AE+Nz4VsHHgd/g4VwMfYZM8jFmsx1eZ78y/7aSgVu+LozyqLaoxBWbvKuVwZYiZ2HLLNzETVdYrhIGe7oZWawefwXXszr+Elk4zOEwEBjlyIE9oUtSJsCcht8BWZvL7FSYxfExdxB2RbacjP3ED8RC93vxZ6yMUHlFYD5aLmDENgmZ1SM9mY+GgryuyFnyYrsFKKl1blkOHHGh3PjNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wkEwY71OjRAzKi+pA16TE5qyBm+GnCCN5j0NoNrIsA=;
 b=LTXFnXKP1zldcOegW2hCH+68thhh2LGSVOb5SbD5gtYbZmLfihRV5k95A+8PmA3CwEiZ7G8rpkRi7Gv2UcVADY6xg0BVZ6mFv99y1ZxiiXT0N8E2x7pG5ei+gsGkJP92chfKVwtomHeVZcSQoVHLNfnu/1FG6Rvzmr8/F61jNM0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by SJ0PR10MB4814.namprd10.prod.outlook.com (2603:10b6:a03:2d5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Mon, 19 Jul
 2021 06:28:12 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539%7]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 06:28:12 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 15/19] vfio-user: vfio user device realize
Date: Sun, 18 Jul 2021 23:27:54 -0700
Message-Id: <faeac9389156240625643831feb06189645e42f3.1626675354.git.elena.ufimtseva@oracle.com>
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
 Transport; Mon, 19 Jul 2021 06:28:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4afd5445-8057-4264-8dab-08d94a7e61bf
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4814:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB48149AF04EE449433B5543F98CE19@SJ0PR10MB4814.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4LlFwuDV/Tpk6ZCnChvGpINfYB/IcjnxPnRo3jRxYE+NamY5j+EmN63+jT9KIqteSePIbhXXc5eExM7+CCZBdJuBDBHBH3M63/KYpoqRvrLv7c4D3OhPIIz0vdly44SCnLItE0yPCcRsF+D3dEaHF05aoeDqSHWJjrwhvw/nnRHTAAJyc3xuBeOuOOfEo7UcVardMATGBTxUiBuG48Mrec1M/uVERy5KqRg+Qw5VTujlEl4c66iIqf/Ga3WONoZHpqB2zPYG5J26HwrICNMNcmLkwaNLcE6QChHton3w/qCSoHuFcMYk/BEtP7PhcnzSqwReBu4QkkMq1bQcrxIJtrE5OdUC2ewCLRH/Q5iWWiiB3Uyl/5TCvTanu4YFmoDkCgYhcj+SVTzfqDIHi9ndHC5ePsLEvCffkHb6E7CWXlYxF+5OqL6ivOC/k+cjPUkJFmE694cOugUsgMQeqmjVjbo3+uM6k8ITxlCm27pQortjoOOjbPAjIbrYFBnNiZ+L0OWfDs1a+QKsDx5jzSruRg9px6yYQgxTeEE7V3bSIKBFZHueSpif7+vunCRj0pziCVj+qpYjxwTxbOGduFctwUPlBT/po35bEvDima/9izhIbaMJPrWX4cqgZQi9iu0UERS/+5u47czHbTjWqnZT/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(366004)(376002)(346002)(136003)(2906002)(6486002)(5660300002)(316002)(6512007)(186003)(66476007)(44832011)(66556008)(2616005)(6506007)(38100700002)(6916009)(52116002)(6666004)(8936002)(86362001)(107886003)(8676002)(83380400001)(66946007)(478600001)(36756003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q5hpRdy0ufbpH36EtnNYQCWA4/3lR7cdsTNyKyPPfiQ1bnxd8f48h94Fy1vJ?=
 =?us-ascii?Q?S1I9lm3gXfwVCqszthojZWQ+6iaN1BVH3hY0GG+w5nqkYMwGkU81UtiZUt2X?=
 =?us-ascii?Q?heURiSaFBF2bykWlriVRGFYDPwEClTDeYbAUIiPVdkNBxV1oX/2sA37mUFXu?=
 =?us-ascii?Q?yeb6tK8BLLFdr3iCc5fTMC4ps1861wMaZdWJzWhc1bD+eFbFVl8km/g/vR41?=
 =?us-ascii?Q?/F4ZmH1U6pEdopWd7WxSKgy8zq7+DZoUivSxRLwZ7iKSlB53IeTwnideh5m0?=
 =?us-ascii?Q?M5kzxogVVHU6IjbS1ZqXRCYWlh9x001UxoJPTy2GjLYuhTNeihnqAxFIQzw9?=
 =?us-ascii?Q?136unOQSga6DHD/GJCeLTkfq4ZOCaHq8OqWz62xCAKGs7f8Uz69UJalaN6ai?=
 =?us-ascii?Q?EEhTbhbdNJd21oR9/RzxAY1vc9E8aSSuduJhCQDX3XOuOkZSLGc+kfg91IuH?=
 =?us-ascii?Q?qcwEA4My7tBK2bup+IjBmw1CQg4596ADRaUgg2lBaRNjqFp47jpDxw8p+dio?=
 =?us-ascii?Q?wEora0DnOXV6yC5zOQQ4VDIiVyGe6ArPZ2ImzWQ1gHGRWnCrEhjh/g4mNHpc?=
 =?us-ascii?Q?KWxNHiPzLZFCpCJ9OKBukTMvSmQuUIox0xSikWKh59U7vFQbESSG5smi7E2d?=
 =?us-ascii?Q?OKOPrZX6LE0hFJf9n9rS1rVIpsk/zX++D5ucBcQ9WetzizuJf0atjOjLIXY4?=
 =?us-ascii?Q?mEyDRbkPC/1uc1NLb5Rt5AwR35aJ/SyARugLFIkZh3w6la1TPPyQrmhPkPnP?=
 =?us-ascii?Q?iHIICFabgTGz4ABKjnZBEzi47oMuUlrNnm9otzWMUdonMLqCPxIftTNS26li?=
 =?us-ascii?Q?iSpZb02QRbR0ieDP3cUdvsLgqMiT63SoDgF+HlKr+paMFjKIcjEUn2p4LRYh?=
 =?us-ascii?Q?nH7+z6Z1C6zI84GVUe5Mg39UilC/rvCwNwY4ZVTYylX9CCHIe2bJPvbwfwJr?=
 =?us-ascii?Q?+e80Pja1937FGVTeSjJ0pHjO2MCrTEwRGRRCrsAyqsTeGd5j2/yZZ2zBSFEL?=
 =?us-ascii?Q?7k69k9lzawEOiANWsbi+5eT3ASY3a63Uxf9GE/pZC6hgurtq6O0CK9dovaPd?=
 =?us-ascii?Q?pji9SqAtx1Tc4FAM11P8s/8/E33GpCI1xeWJEUcUImdU4pDNkEaHoR8Ivd9x?=
 =?us-ascii?Q?RvJcPdLjD6u7UZmpSBl+51kvqpmGOUu7FOqITINlk5CJJNERcsQcqsucUX8l?=
 =?us-ascii?Q?g+4Zvu+MdrP4wMx0bpRSNxHG5BoxaHl19wUavbqUsUzU3Bb1UVWrAz21CZKu?=
 =?us-ascii?Q?m9fm2EZGc0NttToKiK/B72HIgqdMXIKqoEDoKmk43EAx5MMSuaUWGtTEwG4g?=
 =?us-ascii?Q?tu8/297ZVA7Y3Agg0vvDlu0Lx4zb7gAciyA247e47W8RuWej02k5/Pd4kw/x?=
 =?us-ascii?Q?yuN6hwbsX7g4DhmjhLmVBfricxeg?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4afd5445-8057-4264-8dab-08d94a7e61bf
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 06:28:11.7163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /DtQBzcLSlTJlvo8fXHoORhkzC/1UFQq6M89AD6Q1fAnCAegtkDmBin+CHe0ZXNmeTL898gfU+BiqR7+P/ha1hs70uAQ8h+i3OAM1gKsYj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4814
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10049
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 spamscore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107190035
X-Proofpoint-ORIG-GUID: N8B1VijTO6yk1AHp7H8z0UNSLJ6t3ctd
X-Proofpoint-GUID: N8B1VijTO6yk1AHp7H8z0UNSLJ6t3ctd
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

Setup INTx interrupts and a device region info
cache for remote device info.

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
---
 include/hw/vfio/vfio-common.h |  1 +
 hw/vfio/common.c              | 33 ++++++++++++++++++-
 hw/vfio/pci.c                 | 61 ++++++++++++++++++++++++++++++++---
 hw/vfio/user.c                | 20 ++++++++++++
 4 files changed, 109 insertions(+), 6 deletions(-)

diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index d7b717594b..688660c28d 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -56,6 +56,7 @@ typedef struct VFIORegion {
     uint32_t nr_mmaps;
     VFIOMmap *mmaps;
     uint8_t nr; /* cache the region number for debug */
+    int remfd; /* fd if exported from remote process */
 } VFIORegion;
 
 typedef struct VFIOMigration {
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 9b68416599..953d9e7b55 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1571,6 +1571,16 @@ bool vfio_get_info_dma_avail(struct vfio_iommu_type1_info *info,
     return true;
 }
 
+static int vfio_get_region_info_remfd(VFIODevice *vbasedev, int index)
+{
+    struct vfio_region_info *info;
+
+    if (vbasedev->regions == NULL || vbasedev->regions[index] == NULL) {
+        vfio_get_region_info(vbasedev, index, &info);
+    }
+    return vbasedev->regfds != NULL ? vbasedev->regfds[index] : -1;
+}
+
 static int vfio_setup_region_sparse_mmaps(VFIORegion *region,
                                           struct vfio_region_info *info)
 {
@@ -1624,6 +1634,7 @@ int vfio_region_setup(Object *obj, VFIODevice *vbasedev, VFIORegion *region,
     region->size = info->size;
     region->fd_offset = info->offset;
     region->nr = index;
+    region->remfd = vfio_get_region_info_remfd(vbasedev, index);
 
     if (region->size) {
         region->mem = g_new0(MemoryRegion, 1);
@@ -1667,6 +1678,7 @@ int vfio_region_mmap(VFIORegion *region)
 {
     int i, prot = 0;
     char *name;
+    int fd;
 
     if (!region->mem) {
         return 0;
@@ -1675,9 +1687,11 @@ int vfio_region_mmap(VFIORegion *region)
     prot |= region->flags & VFIO_REGION_INFO_FLAG_READ ? PROT_READ : 0;
     prot |= region->flags & VFIO_REGION_INFO_FLAG_WRITE ? PROT_WRITE : 0;
 
+    fd = region->remfd != -1 ? region->remfd : region->vbasedev->fd;
+
     for (i = 0; i < region->nr_mmaps; i++) {
         region->mmaps[i].mmap = mmap(NULL, region->mmaps[i].size, prot,
-                                     MAP_SHARED, region->vbasedev->fd,
+                                     MAP_SHARED, fd,
                                      region->fd_offset +
                                      region->mmaps[i].offset);
         if (region->mmaps[i].mmap == MAP_FAILED) {
@@ -2524,6 +2538,23 @@ int vfio_get_device(VFIOGroup *group, const char *name,
 
 void vfio_put_base_device(VFIODevice *vbasedev)
 {
+    if (vbasedev->regions != NULL) {
+        int i;
+
+        for (i = 0; i < vbasedev->num_regions; i++) {
+            if (vbasedev->regfds != NULL && vbasedev->regfds[i] != -1) {
+                close(vbasedev->regfds[i]);
+            }
+            g_free(vbasedev->regions[i]);
+        }
+        g_free(vbasedev->regions);
+        vbasedev->regions = NULL;
+        if (vbasedev->regfds != NULL) {
+            g_free(vbasedev->regfds);
+            vbasedev->regfds = NULL;
+        }
+    }
+
     if (!vbasedev->group) {
         return;
     }
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 3362e8f3f5..52af5a1061 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -256,11 +256,16 @@ static void vfio_irqchip_change(Notifier *notify, void *data)
 
 static int vfio_intx_enable(VFIOPCIDevice *vdev, Error **errp)
 {
-    uint8_t pin = vfio_pci_read_config(&vdev->pdev, PCI_INTERRUPT_PIN, 1);
+    uint8_t pin;
     Error *err = NULL;
     int32_t fd;
     int ret;
 
+    if (vdev->vbasedev.proxy != NULL) {
+        pin = vdev->pdev.config[PCI_INTERRUPT_PIN];
+    } else {
+        pin = vfio_pci_read_config(&vdev->pdev, PCI_INTERRUPT_PIN, 1);
+    }
 
     if (!pin) {
         return 0;
@@ -1258,10 +1263,15 @@ static int vfio_msi_setup(VFIOPCIDevice *vdev, int pos, Error **errp)
     int ret, entries;
     Error *err = NULL;
 
-    if (pread(vdev->vbasedev.fd, &ctrl, sizeof(ctrl),
-              vdev->config_offset + pos + PCI_CAP_FLAGS) != sizeof(ctrl)) {
-        error_setg_errno(errp, errno, "failed reading MSI PCI_CAP_FLAGS");
-        return -errno;
+    if (vdev->vbasedev.proxy != NULL) {
+        /* during setup, config space was initialized from remote */
+        memcpy(&ctrl, vdev->pdev.config + pos + PCI_CAP_FLAGS, sizeof(ctrl));
+    } else {
+        if (pread(vdev->vbasedev.fd, &ctrl, sizeof(ctrl),
+                  vdev->config_offset + pos + PCI_CAP_FLAGS) != sizeof(ctrl)) {
+            error_setg_errno(errp, errno, "failed reading MSI PCI_CAP_FLAGS");
+            return -errno;
+        }
     }
     ctrl = le16_to_cpu(ctrl);
 
@@ -3562,9 +3572,50 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
         goto error;
     }
 
+    vfio_bars_register(vdev);
+
+    ret = vfio_add_capabilities(vdev, errp);
+    if (ret) {
+        goto out_teardown;
+    }
+
+    /* QEMU emulates all of MSI & MSIX */
+    if (pdev->cap_present & QEMU_PCI_CAP_MSIX) {
+        memset(vdev->emulated_config_bits + pdev->msix_cap, 0xff,
+               MSIX_CAP_LENGTH);
+    }
+
+    if (pdev->cap_present & QEMU_PCI_CAP_MSI) {
+        memset(vdev->emulated_config_bits + pdev->msi_cap, 0xff,
+               vdev->msi_cap_size);
+    }
+
+    if (vdev->pdev.config[PCI_INTERRUPT_PIN] != 0) {
+        vdev->intx.mmap_timer = timer_new_ms(QEMU_CLOCK_VIRTUAL,
+                                             vfio_intx_mmap_enable, vdev);
+        pci_device_set_intx_routing_notifier(&vdev->pdev,
+                                             vfio_intx_routing_notifier);
+        vdev->irqchip_change_notifier.notify = vfio_irqchip_change;
+        kvm_irqchip_add_change_notifier(&vdev->irqchip_change_notifier);
+        ret = vfio_intx_enable(vdev, errp);
+        if (ret) {
+            goto out_deregister;
+        }
+    }
+
+    vfio_register_err_notifier(vdev);
+    vfio_register_req_notifier(vdev);
+
     return;
 
+out_deregister:
+    pci_device_set_intx_routing_notifier(&vdev->pdev, NULL);
+    kvm_irqchip_remove_change_notifier(&vdev->irqchip_change_notifier);
+out_teardown:
+    vfio_teardown_msi(vdev);
+    vfio_bars_exit(vdev);
  error:
+    vfio_user_disconnect(proxy);
     error_prepend(errp, VFIO_MSG_PREFIX, vdev->vbasedev.name);
 }
 
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 6afbde8ba8..0fd7e01986 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -574,6 +574,16 @@ VFIOProxy *vfio_user_connect_dev(char *sockname, Error **errp)
     return proxy;
 }
 
+static void vfio_user_cb(void *opaque)
+{
+    VFIOProxy *proxy = opaque;
+
+    qemu_mutex_lock(&proxy->lock);
+    proxy->state = CLOSED;
+    qemu_mutex_unlock(&proxy->lock);
+    qemu_cond_signal(&proxy->close_cv);
+}
+
 void vfio_user_disconnect(VFIOProxy *proxy)
 {
     VFIOUserReply *r1, *r2;
@@ -601,6 +611,16 @@ void vfio_user_disconnect(VFIOProxy *proxy)
         g_free(r1);
     }
 
+    /*
+     * Make sure the iothread isn't blocking anywhere
+     * with a ref to this proxy by waiting for a BH
+     * handler to run after the proxy fd handlers were
+     * deleted above.
+     */
+    proxy->close_wait = 1;
+    aio_bh_schedule_oneshot(iothread_get_aio_context(vfio_user_iothread),
+                            vfio_user_cb, proxy);
+
     /* drop locks so the iothread can make progress */
     qemu_mutex_unlock_iothread();
     qemu_cond_wait(&proxy->close_cv, &proxy->lock);
-- 
2.25.1


