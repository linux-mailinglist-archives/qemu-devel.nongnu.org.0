Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC0F449FFA
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 01:51:35 +0100 (CET)
Received: from localhost ([::1]:59770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkFMM-0000rJ-4b
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 19:51:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mkFAy-0005xg-Ai
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 19:39:51 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:42580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mkFAY-00047M-Jk
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 19:39:46 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A90Fxis025521
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 00:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=4ZJh38/1+M0iTGTHCLIJD6efxcVs9FIN5gpC8ePC48w=;
 b=BjMEF9ToQULU8OulT8VACmz8g7RB2ebKLxaGj29UfVSVuMAJR3yiO0tjGyDYbRvsAS70
 y/meXGlbR0zfbmj0JFGohCJ2YJTeQ0TI8N0X8Bwf8k5A4lPfzAohZQtOu/lHiWk/YFiB
 y576TVOeYZBgHOmUPvm773rKkuKWnHzy1smy2/4Dlvel79pOEKf8Py5/djfOSX/eo4Pg
 S0AbZAaWUGCAoG0DiDazf+2F6taMLCS2bYiKEl8mufj+rSaeus95GBA1a8zj35fzPR09
 /R+MqwY7QZqbKXGD3J9LmtPcWUw02ZEqyuJtRl+F3REejKE1irki7KLE2t/sK7JE+3N1 cw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c6t7077ja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:39:21 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A90Zxm8132637
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 00:39:20 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
 by aserp3030.oracle.com with ESMTP id 3c5frd6sqb-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:39:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B5bZgqiooZRunElXkdC8Hhs6Cii8ND1H89QSGEEViHsO/ZzocGj2rsBHrxIyi/z8j15PoqRKT0ysQLFjcUverY1Ras3Cn/DAUi/zXQ6nRADxnOhrwieoxDGHdz4ID/KbM2QFvlbk+oO+khtXVI9rS7jHW6Yt6rP1h9YKFqwQc3KOv7oXPsRpLfL2Hnn1Tsgu71FeSXX3YcoZ3UczdGR1b2J67vZAYfL/jcU3Ed+wCtMGmOwWxZB+P6NoHzehrq1BZt3qlboTf4dj2hO2UYt/+p8KDOMXBjtSg3OmMHIQA5Ci18D8kXppleWV0q3F2rwP0IP6VZA34jK5tIYadkc/uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZJh38/1+M0iTGTHCLIJD6efxcVs9FIN5gpC8ePC48w=;
 b=j2LjUzkNzi/tO7BK1HMczAaRUtV65lvEBBl8RLFi0n4Qfc1te/W8oMuq0koYtimrmm4eZ+SnDojwd+XYpULQIXIZXXwQpKfTZBnn/zdE8FVPDlcAgXjwdVdwNf4r3ApgHe9+uy3LrNIioXKxjWlFnMOUNEc/+UwRCpGB+GuF1+ohnoq2xgd3INltIUEZPmpuNodRMscEPZVdo0sb+qpVFn+8FUbIG4rxaDtLRAB4OId1kPOEOh95BcyFVYrvBXkklB0LftXAf4kxTofkWUr5t5T61uQklU5pMgXEQwVIErJtC1F225is07ncMoiDRshTcr+aeWVYiggYBGIZ9XbbrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZJh38/1+M0iTGTHCLIJD6efxcVs9FIN5gpC8ePC48w=;
 b=ZJ4sWUTNNDvS/IW2oHphlRFolM66BSVJMMCqeTdtucRXIA4nOP17QnbmDmng4cpo75wRXVVAmNIQXXD5yTE32pdLT2p7wDPQsVtiogoDG4JLG9ZiUt8E+0u5IIHiiMFsiYsMbe2FPzWJAlK+p2LeN27dFi7LYYvPATfczzTAK3k=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com (2603:10b6:a03:2d7::23)
 by BY5PR10MB4068.namprd10.prod.outlook.com (2603:10b6:a03:1b2::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Tue, 9 Nov
 2021 00:39:17 +0000
Received: from SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::1551:92ba:9eb8:a093]) by SJ0PR10MB4686.namprd10.prod.outlook.com
 ([fe80::1551:92ba:9eb8:a093%7]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 00:39:16 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 16/19] vfio-user: dma map/unmap operations
Date: Mon,  8 Nov 2021 16:46:44 -0800
Message-Id: <9317e19ef1b2b73864be268b6715fcf53a0704a4.1636057885.git.john.g.johnson@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: 91910b1f-1ba7-479f-ad5b-08d9a3195aa9
X-MS-TrafficTypeDiagnostic: BY5PR10MB4068:
X-Microsoft-Antispam-PRVS: <BY5PR10MB40688F7D2BD6551F56E35BA4B6929@BY5PR10MB4068.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:272;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TJVk8oyCkzlVlCMEWBwYG/dVpFlyn2zIgCMtqqZSALEnyW0Z6i3qJ+/QZvMSjXScJek+kKFwRmaU799m0H74gv5Ph6p1k2rTpCHdwBYs5idaZyX9LtsBvJ6TctZK9Xz/VPaWX+CoSbPfntJ5G85C0v1V+YGcikgH83uK6T2np2Vv9mNGg6ojl0O2xYiTpO5k3GLbrGsGwhItResrU7/C0I7QYpglEDvpl7p7u6ldKdw2hVXr4hrrSnh4WSTBj+OqEntIz8JMEv6y+kih1F+q5ZlaUnZtEz0nh1KI5T9ef4Wd2lPBgs3VYA35nna5zQvsAetJsLxVe4UMbbDW3lz4HHnHmXOP0yIoDfXTu/BroAWarClguLBESO7bM45ia7vvL7+I6sIuTWqrkU5Bl1JxGRojvo+DGxrNRsgSrvJLm8J/SRDx1TG9KySZHKpT+oDJ7/yDhNADQUAvDBxyaTcaZah6Si27nqH8KsrgsWOBTqcSoJz0btRrM1RBWKLblebrj9e6oNyGzHrMolZC+aDV8+9st9g4TV4qPI9VEnTjHEvXmTpUtwrlOtWj6czkANzq2cxp9PsfuR07NxBZDgnfmhjvOhFSeSoutWnkukLYCJ4CZYNZdW5ZEaxNrmeKwW7ilhnUqDZKGNldGByPlOKfYuGhab44xn1CKqTHrljIbC0SZa3VeiTCRtsBDQFBDNK/YuKJQ4MBlH3noK7H+TEsAg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4686.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(316002)(186003)(66556008)(508600001)(8936002)(8676002)(66946007)(6486002)(26005)(2906002)(6916009)(5660300002)(36756003)(7696005)(52116002)(86362001)(83380400001)(956004)(38100700002)(6666004)(2616005)(30864003)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N/Qy8DvIpDpMoe840yd7KukB6rn+Xs8iV/TP4z9bqySODMrbVNPfFM228sIq?=
 =?us-ascii?Q?hHHu3vOVqUL8Czk5UcILQCpOGnDC3CB0Y2z6bjg8ShpHywsYz+6H2JMM2ugv?=
 =?us-ascii?Q?as3L69nhy9lv0L4BL3ZnpuX48nQIdvkNfCmmgsoUZbmPe5MYScPvTspAsjrg?=
 =?us-ascii?Q?P0EAubsLVJqOvVdOuogYYSTC1NfNGnFGG0oKRnE4TZrOPUqMBf+5t/FZ4LuA?=
 =?us-ascii?Q?oj6kyWWvrCCVvX/mfc3vrZt93iJfZwcKnBjyjB+C4BOVTa+HPLzAaM+BXWQ/?=
 =?us-ascii?Q?dLt89KDCO36ZKhcW/qeGa53+akG7p5qnc5JpVEE5FEWfqsMcur5xqxhvxRNc?=
 =?us-ascii?Q?n1IYKMZsWecTF+xJnZRbfOhRYTAe5y7TqZncJoUJ3fHMSINzv1bBI+zfz8He?=
 =?us-ascii?Q?hkfhfp9htBkb/oXGBSRKMPXI0xn/JV9Yb583C++X9OPnjFOvZcgCiCEBauOR?=
 =?us-ascii?Q?FFokCnaVcnNe71jjas/GTpl3vtE+8XA/oLrOZJrfZl23h5aG0SrlEjPfhNjS?=
 =?us-ascii?Q?U+i4RvG5Sv19YEVz0etMahUvhUYfl48Tt812Vqq1BiyawhahHhUJgSmMlryM?=
 =?us-ascii?Q?gZguWdcN3C+BTNTr8/StJsovHZ7Qo8cZJNeGRXS5u9225oRsG4Rzo7VuxLKs?=
 =?us-ascii?Q?Xwwu+Of3kxNzsbPB0ErUBuyia+JswUPNZSAU+zbuGNzsldaL6z4i+pLYMPUm?=
 =?us-ascii?Q?uX8X4wCe+8lXaN/Wd81CC9gkFy79CvXO20rmOExFYEH7SWBQa6lNjkFAlYFZ?=
 =?us-ascii?Q?rtaszJCKP4YKBT+ZbpHDnCIGbqgzXJDVJpgp0H+L1xOgXc/MCJdlZQlCioXO?=
 =?us-ascii?Q?WfWMcwNAAhYq/ww/JXwMGQxG4J3J96ct00GXOyabzrzXDNLpvWajNeNwzNYi?=
 =?us-ascii?Q?yCZjuzBvd1yeFX+zTOQRfeig13HqVym9tApi5CbkJNUk4KGDmzJi9UOuuiyN?=
 =?us-ascii?Q?Pl5rYlt+BCrrMwlvs6YFyhwFL9PDSSeYhJ85U4kvqP1CYINS9iGZuP4Jt3M1?=
 =?us-ascii?Q?Y65r9WXk0STeVXVjBjnsUPEwMDBD8FuVoVa/O+XS7tUQmu1mNd41rUxCTEfk?=
 =?us-ascii?Q?39l1G1MiFUtTt0YRi8GxQFV9Ul3DkailxqQopquTqdL/IIbRlvcmWUh8YiQ2?=
 =?us-ascii?Q?QyNs446DPpJ+CHOOsULP4kVTDFA0qlQ6ZeohL1ry4lVkl0FtdR2fZU2T9Jcv?=
 =?us-ascii?Q?hXWXJrUYN+rKOBbXZtcjPb1K+iK51zxWLefWDwWG3K0QsV29FDiLO6O4wY1x?=
 =?us-ascii?Q?kpyK9bWPC5fveBMG+CBwUQadQuTb2CAAdQjEvT9va7GP+v0hHm/rxvELxEub?=
 =?us-ascii?Q?N6kE3aYZtvcGC24wOsxmpGCtIOBBgX9qUT4GJ9H7yUQ9BeZxlSYhHbTwbaJT?=
 =?us-ascii?Q?8YLMjg8K9GBiV6+8OgB/WA9/5JYPh65rJsn/cHRdLBGiuQ7XGghiE0cFKjfW?=
 =?us-ascii?Q?/4ofSygaG/QHDD8wsnjuIu9MjNJGJ8aILAIqQhUKKWAlyNvkkU9qlFE4y5GP?=
 =?us-ascii?Q?g02d45RFbZJvK4wOuY8dn+xtndYubmuFxj64Tx7VoGauN7M2Q/LcOE+c+VaE?=
 =?us-ascii?Q?+rYGm2hbu4BcPDfomZMhWOO2vxpPwI+o48HnC/wMNpz0emaDa3VcPSn32mLY?=
 =?us-ascii?Q?1PDuvyqR6kvro1DE5vbyrFVdMB2gUsFJiAZGQ6YVbGmqkaj+0PYvfQJ9hiDi?=
 =?us-ascii?Q?tEoNnQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91910b1f-1ba7-479f-ad5b-08d9a3195aa9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4686.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 00:39:14.1121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jlg60HYRh49K+KYHNALGLmlH+rEF9CwQ2kKTM0yeRv7c051DWlde6g0svIdJKz8jk6yeLMMbYlD2CjKicSgR96S6EvoZae2TmS7vSmYDYUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4068
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10162
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0
 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111090001
X-Proofpoint-GUID: GslTr3ClqdxN6G-jUHEoquw1P7VqauLo
X-Proofpoint-ORIG-GUID: GslTr3ClqdxN6G-jUHEoquw1P7VqauLo
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

Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
---
 hw/vfio/pci.h                 |   1 +
 hw/vfio/user-protocol.h       |  32 +++++++
 hw/vfio/user.h                |   1 +
 include/hw/vfio/vfio-common.h |   4 +
 hw/vfio/common.c              |  76 +++++++++++++---
 hw/vfio/pci.c                 |   4 +
 hw/vfio/user.c                | 206 ++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 309 insertions(+), 15 deletions(-)

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
diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
index 5614efa..ca53fce 100644
--- a/hw/vfio/user-protocol.h
+++ b/hw/vfio/user-protocol.h
@@ -83,6 +83,31 @@ typedef struct {
 
 
 /*
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
+/*
  * VFIO_USER_DEVICE_GET_INFO
  * imported from struct_device_info
  */
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
index 8d03e7c..997f748 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -74,6 +74,7 @@ typedef struct VFIOProxy {
 
 /* VFIOProxy flags */
 #define VFIO_PROXY_CLIENT        0x1
+#define VFIO_PROXY_SECURE        0x2
 #define VFIO_PROXY_FORCE_QUEUED  0x4
 #define VFIO_PROXY_NO_POST       0x8
 
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index c0e7632..dcfae2c 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -90,6 +90,8 @@ typedef struct VFIOContainer {
     VFIOContIO *io_ops;
     bool initialized;
     bool dirty_pages_supported;
+    bool will_commit;
+    bool need_map_fd;
     uint64_t dirty_pgsizes;
     uint64_t max_dirty_bitmap_size;
     unsigned long pgsizes;
@@ -210,6 +212,7 @@ struct VFIOContIO {
     int (*dirty_bitmap)(VFIOContainer *container,
                         struct vfio_iommu_type1_dirty_bitmap *bitmap,
                         struct vfio_iommu_type1_dirty_bitmap_get *range);
+    void (*wait_commit)(VFIOContainer *container);
 };
 
 #define CONT_DMA_MAP(cont, map, fd, will_commit) \
@@ -218,6 +221,7 @@ struct VFIOContIO {
     ((cont)->io_ops->dma_unmap((cont), (unmap), (bitmap), (will_commit)))
 #define CONT_DIRTY_BITMAP(cont, bitmap, range) \
     ((cont)->io_ops->dirty_bitmap((cont), (bitmap), (range)))
+#define CONT_WAIT_COMMIT(cont) ((cont)->io_ops->wait_commit(cont))
 
 extern VFIODevIO vfio_dev_io_ioctl;
 extern VFIOContIO vfio_cont_io_ioctl;
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index fdd2702..0840c8f 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -411,6 +411,7 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
     struct vfio_iommu_type1_dma_unmap *unmap;
     struct vfio_bitmap *bitmap;
     uint64_t pages = REAL_HOST_PAGE_ALIGN(size) / qemu_real_host_page_size;
+    bool will_commit = container->will_commit;
     int ret;
 
     unmap = g_malloc0(sizeof(*unmap) + sizeof(*bitmap));
@@ -444,7 +445,7 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
         goto unmap_exit;
     }
 
-    ret = CONT_DMA_UNMAP(container, unmap, bitmap, false);
+    ret = CONT_DMA_UNMAP(container, unmap, bitmap, will_commit);
     if (!ret) {
         cpu_physical_memory_set_dirty_lebitmap((unsigned long *)bitmap->data,
                 iotlb->translated_addr, pages);
@@ -471,16 +472,17 @@ static int vfio_dma_unmap(VFIOContainer *container,
         .iova = iova,
         .size = size,
     };
+    bool will_commit = container->will_commit;
 
     if (iotlb && container->dirty_pages_supported &&
         vfio_devices_all_running_and_saving(container)) {
         return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
     }
 
-    return CONT_DMA_UNMAP(container, &unmap, NULL, false);
+    return CONT_DMA_UNMAP(container, &unmap, NULL, will_commit);
 }
 
-static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
+static int vfio_dma_map(VFIOContainer *container, MemoryRegion *mr, hwaddr iova,
                         ram_addr_t size, void *vaddr, bool readonly)
 {
     struct vfio_iommu_type1_dma_map map = {
@@ -490,13 +492,23 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
         .iova = iova,
         .size = size,
     };
-    int ret;
+    int fd, ret;
+    bool will_commit = container->will_commit;
 
     if (!readonly) {
         map.flags |= VFIO_DMA_MAP_FLAG_WRITE;
     }
 
-    ret = CONT_DMA_MAP(container, &map, -1, false);
+    if (container->need_map_fd) {
+        fd = memory_region_get_fd(mr);
+        if (fd != -1) {
+            map.vaddr = qemu_ram_block_host_offset(mr->ram_block, vaddr);
+        }
+    } else {
+        fd = -1;
+    }
+
+    ret = CONT_DMA_MAP(container, &map, fd, will_commit);
 
     if (ret < 0) {
         error_report("VFIO_MAP_DMA failed: %s", strerror(-ret));
@@ -557,7 +569,8 @@ static bool vfio_listener_skipped_section(MemoryRegionSection *section)
 
 /* Called with rcu_read_lock held.  */
 static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
-                               ram_addr_t *ram_addr, bool *read_only)
+                               ram_addr_t *ram_addr, bool *read_only,
+                               MemoryRegion **mrp)
 {
     MemoryRegion *mr;
     hwaddr xlat;
@@ -638,6 +651,10 @@ static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
         *read_only = !writable || mr->readonly;
     }
 
+    if (mrp != NULL) {
+        *mrp = mr;
+    }
+
     return true;
 }
 
@@ -645,6 +662,7 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
 {
     VFIOGuestIOMMU *giommu = container_of(n, VFIOGuestIOMMU, n);
     VFIOContainer *container = giommu->container;
+    MemoryRegion *mr;
     hwaddr iova = iotlb->iova + giommu->iommu_offset;
     void *vaddr;
     int ret;
@@ -663,7 +681,7 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
     if ((iotlb->perm & IOMMU_RW) != IOMMU_NONE) {
         bool read_only;
 
-        if (!vfio_get_xlat_addr(iotlb, &vaddr, NULL, &read_only)) {
+        if (!vfio_get_xlat_addr(iotlb, &vaddr, NULL, &read_only, &mr)) {
             goto out;
         }
         /*
@@ -673,14 +691,14 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
          * of vaddr will always be there, even if the memory object is
          * destroyed and its backing memory munmap-ed.
          */
-        ret = vfio_dma_map(container, iova,
+        ret = vfio_dma_map(container, mr, iova,
                            iotlb->addr_mask + 1, vaddr,
                            read_only);
         if (ret) {
             error_report("vfio_dma_map(%p, 0x%"HWADDR_PRIx", "
-                         "0x%"HWADDR_PRIx", %p) = %d (%m)",
+                         "0x%"HWADDR_PRIx", %p)",
                          container, iova,
-                         iotlb->addr_mask + 1, vaddr, ret);
+                         iotlb->addr_mask + 1, vaddr);
         }
     } else {
         ret = vfio_dma_unmap(container, iova, iotlb->addr_mask + 1, iotlb);
@@ -735,7 +753,7 @@ static int vfio_ram_discard_notify_populate(RamDiscardListener *rdl,
                section->offset_within_address_space;
         vaddr = memory_region_get_ram_ptr(section->mr) + start;
 
-        ret = vfio_dma_map(vrdl->container, iova, next - start,
+        ret = vfio_dma_map(vrdl->container, section->mr, iova, next - start,
                            vaddr, section->readonly);
         if (ret) {
             /* Rollback */
@@ -843,6 +861,23 @@ static void vfio_unregister_ram_discard_listener(VFIOContainer *container,
     g_free(vrdl);
 }
 
+static void vfio_listener_begin(MemoryListener *listener)
+{
+    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
+
+    /* cannot drop BQL during the transaction, send maps/demaps async */
+    container->will_commit = true;
+}
+
+static void vfio_listener_commit(MemoryListener *listener)
+{
+    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
+
+    /* wait for any async requests sent during the transaction */
+    CONT_WAIT_COMMIT(container);
+    container->will_commit = false;
+}
+
 static void vfio_listener_region_add(MemoryListener *listener,
                                      MemoryRegionSection *section)
 {
@@ -1035,12 +1070,12 @@ static void vfio_listener_region_add(MemoryListener *listener,
         }
     }
 
-    ret = vfio_dma_map(container, iova, int128_get64(llsize),
+    ret = vfio_dma_map(container, section->mr, iova, int128_get64(llsize),
                        vaddr, section->readonly);
     if (ret) {
         error_setg(&err, "vfio_dma_map(%p, 0x%"HWADDR_PRIx", "
-                   "0x%"HWADDR_PRIx", %p) = %d (%m)",
-                   container, iova, int128_get64(llsize), vaddr, ret);
+                   "0x%"HWADDR_PRIx", %p)",
+                   container, iova, int128_get64(llsize), vaddr);
         if (memory_region_is_ram_device(section->mr)) {
             /* Allow unexpected mappings not to be fatal for RAM devices */
             error_report_err(err);
@@ -1301,7 +1336,7 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
     }
 
     rcu_read_lock();
-    if (vfio_get_xlat_addr(iotlb, NULL, &translated_addr, NULL)) {
+    if (vfio_get_xlat_addr(iotlb, NULL, &translated_addr, NULL, NULL)) {
         int ret;
 
         ret = vfio_get_dirty_bitmap(container, iova, iotlb->addr_mask + 1,
@@ -1418,6 +1453,8 @@ static void vfio_listener_log_sync(MemoryListener *listener,
 }
 
 static const MemoryListener vfio_memory_listener = {
+    .begin = vfio_listener_begin,
+    .commit = vfio_listener_commit,
     .region_add = vfio_listener_region_add,
     .region_del = vfio_listener_region_del,
     .log_global_start = vfio_listener_log_global_start,
@@ -1561,6 +1598,7 @@ int vfio_region_setup(Object *obj, VFIODevice *vbasedev, VFIORegion *region,
     region->size = info->size;
     region->fd_offset = info->offset;
     region->nr = index;
+    region->post_wr = false;
     region->remfd = vfio_get_region_info_remfd(vbasedev, index);
 
     if (region->size) {
@@ -2047,6 +2085,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     container->dirty_pages_supported = false;
     container->dma_max_mappings = 0;
     container->io_ops = &vfio_cont_io_ioctl;
+    container->need_map_fd = false;
     QLIST_INIT(&container->giommu_list);
     QLIST_INIT(&container->hostwin_list);
     QLIST_INIT(&container->vrdl_list);
@@ -2230,6 +2269,7 @@ void vfio_connect_proxy(VFIOProxy *proxy, VFIOGroup *group, AddressSpace *as)
     container->space = space;
     container->fd = -1;
     container->io_ops = &vfio_cont_io_sock;
+    container->need_map_fd = (proxy->flags & VFIO_PROXY_SECURE) == 0;
     QLIST_INIT(&container->giommu_list);
     QLIST_INIT(&container->hostwin_list);
     container->proxy = proxy;
@@ -2879,8 +2919,14 @@ static int vfio_io_dirty_bitmap(VFIOContainer *container,
     return ret;
 }
 
+static void vfio_io_wait_commit(VFIOContainer *container)
+{
+    /* ioctl()s are synchronous */
+}
+
 VFIOContIO vfio_cont_io_ioctl = {
     .dma_map = vfio_io_dma_map,
     .dma_unmap = vfio_io_dma_unmap,
     .dirty_bitmap = vfio_io_dirty_bitmap,
+    .wait_commit = vfio_io_wait_commit,
 };
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index d657b01..ca821da 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3516,6 +3516,9 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     vbasedev->proxy = proxy;
     vfio_user_set_handler(vbasedev, vfio_user_pci_process_req, vdev);
 
+    if (udev->secure_dma) {
+        proxy->flags |= VFIO_PROXY_SECURE;
+    }
     if (udev->send_queued) {
         proxy->flags |= VFIO_PROXY_FORCE_QUEUED;
     }
@@ -3686,6 +3689,7 @@ static void vfio_user_instance_finalize(Object *obj)
 
 static Property vfio_user_pci_dev_properties[] = {
     DEFINE_PROP_STRING("socket", VFIOUserPCIDevice, sock_name),
+    DEFINE_PROP_BOOL("secure-dma", VFIOUserPCIDevice, secure_dma, false),
     DEFINE_PROP_BOOL("x-send-queued", VFIOUserPCIDevice, send_queued, false),
     DEFINE_PROP_BOOL("x-no-posted-writes", VFIOUserPCIDevice, no_post, false),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 70fe7a6..cee08b6 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -52,8 +52,11 @@ static void vfio_user_request(void *opaque);
 static int vfio_user_send_queued(VFIOProxy *proxy, VFIOUserMsg *msg);
 static void vfio_user_send_async(VFIOProxy *proxy, VFIOUserHdr *hdr,
                                  VFIOUserFDs *fds);
+static void vfio_user_send_nowait(VFIOProxy *proxy, VFIOUserHdr *hdr,
+                                  VFIOUserFDs *fds, int rsize);
 static void vfio_user_send_wait(VFIOProxy *proxy, VFIOUserHdr *hdr,
                                 VFIOUserFDs *fds, int rsize, bool nobql);
+static void vfio_user_wait_reqs(VFIOProxy *proxy);
 static void vfio_user_request_msg(VFIOUserHdr *hdr, uint16_t cmd,
                                   uint32_t size, uint32_t flags);
 
@@ -562,6 +565,36 @@ static void vfio_user_send_async(VFIOProxy *proxy, VFIOUserHdr *hdr,
     }
 }
 
+/*
+ * nowait send - vfio_wait_reqs() can wait for it later
+ */
+static void vfio_user_send_nowait(VFIOProxy *proxy, VFIOUserHdr *hdr,
+                                  VFIOUserFDs *fds, int rsize)
+{
+    VFIOUserMsg *msg;
+    int ret;
+
+    if (hdr->flags & VFIO_USER_NO_REPLY) {
+        error_printf("vfio_user_send_nowait on async message\n");
+        return;
+    }
+
+    QEMU_LOCK_GUARD(&proxy->lock);
+
+    msg = vfio_user_getmsg(proxy, hdr, fds);
+    msg->id = hdr->id;
+    msg->rsize = rsize ? rsize : hdr->size;
+    msg->type = VFIO_MSG_NOWAIT;
+
+    ret = vfio_user_send_queued(proxy, msg);
+    if (ret < 0) {
+        vfio_user_recycle(proxy, msg);
+        return;
+    }
+
+    proxy->last_nowait = msg;
+}
+
 static void vfio_user_send_wait(VFIOProxy *proxy, VFIOUserHdr *hdr,
                                 VFIOUserFDs *fds, int rsize, bool nobql)
 {
@@ -610,6 +643,56 @@ static void vfio_user_send_wait(VFIOProxy *proxy, VFIOUserHdr *hdr,
     }
 }
 
+static void vfio_user_wait_reqs(VFIOProxy *proxy)
+{
+    VFIOUserMsg *msg;
+    bool iolock = false;
+
+    /*
+     * Any DMA map/unmap requests sent in the middle
+     * of a memory region transaction were sent nowait.
+     * Wait for them here.
+     */
+    qemu_mutex_lock(&proxy->lock);
+    if (proxy->last_nowait != NULL) {
+        iolock = qemu_mutex_iothread_locked();
+        if (iolock) {
+            qemu_mutex_unlock_iothread();
+        }
+
+        /*
+         * Change type to WAIT to wait for reply
+         */
+        msg = proxy->last_nowait;
+        msg->type = VFIO_MSG_WAIT;
+        while (!msg->complete) {
+            if (!qemu_cond_timedwait(&msg->cv, &proxy->lock, wait_time)) {
+                error_printf("vfio_wait_reqs - timed out\n");
+                break;
+            }
+        }
+
+        if (msg->hdr->flags & VFIO_USER_ERROR) {
+            error_printf("vfio_user_wait_reqs - error reply on async request ");
+            error_printf("command %x error %s\n", msg->hdr->command,
+                         strerror(msg->hdr->error_reply));
+        }
+
+        proxy->last_nowait = NULL;
+        /*
+         * Change type back to NOWAIT to free
+         */
+        msg->type = VFIO_MSG_NOWAIT;
+        vfio_user_recycle(proxy, msg);
+    }
+
+    /* lock order is BQL->proxy - don't hold proxy when getting BQL */
+    qemu_mutex_unlock(&proxy->lock);
+    if (iolock) {
+        qemu_mutex_lock_iothread();
+    }
+}
+
 static QLIST_HEAD(, VFIOProxy) vfio_user_sockets =
     QLIST_HEAD_INITIALIZER(vfio_user_sockets);
 
@@ -935,6 +1018,102 @@ int vfio_user_validate_version(VFIODevice *vbasedev, Error **errp)
     return 0;
 }
 
+static int vfio_user_dma_map(VFIOProxy *proxy,
+                             struct vfio_iommu_type1_dma_map *map,
+                             int fd, bool will_commit)
+{
+    VFIOUserFDs *fds = NULL;
+    VFIOUserDMAMap *msgp = g_malloc0(sizeof(*msgp));
+    int ret;
+
+    vfio_user_request_msg(&msgp->hdr, VFIO_USER_DMA_MAP, sizeof(*msgp), 0);
+    msgp->argsz = map->argsz;
+    msgp->flags = map->flags;
+    msgp->offset = map->vaddr;
+    msgp->iova = map->iova;
+    msgp->size = map->size;
+
+    /*
+     * The will_commit case sends without blocking or dropping BQL.
+     * They're later waited for in vfio_send_wait_reqs.
+     */
+    if (will_commit) {
+        /* can't use auto variable since we don't block */
+        if (fd != -1) {
+            fds = vfio_user_getfds(1);
+            fds->send_fds = 1;
+            fds->fds[0] = fd;
+        }
+        vfio_user_send_nowait(proxy, &msgp->hdr, fds, 0);
+        ret = 0;
+    } else {
+        VFIOUserFDs local_fds = { 1, 0, &fd };
+
+        fds = fd != -1 ? &local_fds : NULL;
+        vfio_user_send_wait(proxy, &msgp->hdr, fds, 0, will_commit);
+        ret = (msgp->hdr.flags & VFIO_USER_ERROR) ? -msgp->hdr.error_reply : 0;
+        g_free(msgp);
+    }
+
+    return ret;
+}
+
+static int vfio_user_dma_unmap(VFIOProxy *proxy,
+                               struct vfio_iommu_type1_dma_unmap *unmap,
+                               struct vfio_bitmap *bitmap, bool will_commit)
+{
+    struct {
+        VFIOUserDMAUnmap msg;
+        VFIOUserBitmap bitmap;
+    } *msgp = NULL;
+    int msize, rsize;
+    bool blocking = !will_commit;
+
+    if (bitmap == NULL &&
+        (unmap->flags & VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP)) {
+        error_printf("vfio_user_dma_unmap mismatched flags and bitmap\n");
+        return -EINVAL;
+    }
+
+    /*
+     * If a dirty bitmap is returned, allocate extra space for it
+     * and block for reply even in the will_commit case.
+     * Otherwise, can send the unmap request without waiting.
+     */
+    if (bitmap != NULL) {
+        blocking = true;
+        msize = sizeof(*msgp);
+        rsize = msize + bitmap->size;
+        msgp = g_malloc0(rsize);
+        msgp->bitmap.pgsize = bitmap->pgsize;
+        msgp->bitmap.size = bitmap->size;
+    } else {
+        msize = rsize = sizeof(VFIOUserDMAUnmap);
+        msgp = g_malloc0(rsize);
+    }
+
+    vfio_user_request_msg(&msgp->msg.hdr, VFIO_USER_DMA_UNMAP, msize, 0);
+    msgp->msg.argsz = unmap->argsz;
+    msgp->msg.flags = unmap->flags;
+    msgp->msg.iova = unmap->iova;
+    msgp->msg.size = unmap->size;
+
+    if (blocking) {
+        vfio_user_send_wait(proxy, &msgp->msg.hdr, NULL, rsize, will_commit);
+        if (msgp->msg.hdr.flags & VFIO_USER_ERROR) {
+            return -msgp->msg.hdr.error_reply;
+        }
+        if (bitmap != NULL) {
+            memcpy(bitmap->data, &msgp->bitmap.data, bitmap->size);
+        }
+        g_free(msgp);
+    } else {
+        vfio_user_send_nowait(proxy, &msgp->msg.hdr, NULL, rsize);
+    }
+
+    return 0;
+}
+
 static int vfio_user_get_info(VFIOProxy *proxy, struct vfio_device_info *info)
 {
     VFIOUserDeviceInfo msg;
@@ -1225,5 +1404,32 @@ VFIODevIO vfio_dev_io_sock = {
 };
 
 
+static int vfio_user_io_dma_map(VFIOContainer *container,
+                                struct vfio_iommu_type1_dma_map *map,
+                                int fd, bool will_commit)
+{
+    if (fd != -1) {
+        return vfio_user_dma_map(container->proxy, map, fd, will_commit);
+    } else {
+        map->vaddr = 0;
+        return vfio_user_dma_map(container->proxy, map, -1, will_commit);
+    }
+}
+
+static int vfio_user_io_dma_unmap(VFIOContainer *container,
+                                  struct vfio_iommu_type1_dma_unmap *unmap,
+                                  struct vfio_bitmap *bitmap, bool will_commit)
+{
+    return vfio_user_dma_unmap(container->proxy, unmap, bitmap, will_commit);
+}
+
+static void vfio_user_io_wait_commit(VFIOContainer *container)
+{
+    vfio_user_wait_reqs(container->proxy);
+}
+
 VFIOContIO vfio_cont_io_sock = {
+    .dma_map = vfio_user_io_dma_map,
+    .dma_unmap = vfio_user_io_dma_unmap,
+    .wait_commit = vfio_user_io_wait_commit,
 };
-- 
1.8.3.1


