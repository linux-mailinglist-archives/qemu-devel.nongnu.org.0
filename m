Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CD9449FE9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 01:45:48 +0100 (CET)
Received: from localhost ([::1]:46644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkFGl-0000FJ-15
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 19:45:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mkFAc-0005ep-FX
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 19:39:27 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:41838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1mkFAX-00046j-0R
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 19:39:25 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A905pwd019033
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 00:39:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=GbhJJgQq1l9h/rT9wuSU0d6LWxb5pCoQLwUuoPVShAg=;
 b=GDkV4dUo85nEU/7e1L0Cmll3BXv5WDs4yM3oywi3bcQai2q9Kh0wcE2hMVmFVYTt3z7k
 6FaTCl0wOlLtFJbylc00PRESy4S49aNmC7DIKVUG08gymrOslyLdZuftUOkXx8ouiURs
 EcEUezQQLytpujHaIIlCJb7TtbUKkLKMYogW5GuvyacW3JcAFov6SoVpqMOr/gr0tZjL
 JUaq+tgrwtlNfwC85AkWS3I53ykMH5vbdrCuL8k+WhMl4tm8zt9Pjo4Q61Zn1J56TZCt
 w0wBJDBpusKjFNu1FrJgSlBTaYarGArqJEpUPeiuVSSiEZYGPb95eJdAggbOGEBG5sDE wg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c6sbk7c8b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:39:19 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A90Zxm5132637
 for <qemu-devel@nongnu.org>; Tue, 9 Nov 2021 00:39:18 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
 by aserp3030.oracle.com with ESMTP id 3c5frd6sqb-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:39:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ltqGC4Wqdz8FQNicQ+ojPLbR8ym/U3L+Gr2HzpLk7r69qKgYiK6a8gN+Cj6EF4nWStM4IBHsGg7cCnrGpZdTtjyHVvOORmvl631Y8lhYv1ot7aYPVtkejxA2oV/OHDf3tNS4HTqKbHSjWt24jOoQ3/ouhFioyNXpN5qool/Vli7xWauR0Mmrory62Pw7VDEQ7CKzEdH7tmSs4PIelZf0GMHyA1JRpYHvbeHK21CQSKRop0clG0iwyGGeVXrPulWazUdfHVHiy/wQDKXPZfNKHQeEaheOBCVnJY7oIn0BI5FR/mJ1F/Es4n/tyNeN1+Hsv+saIG4KtxFZeoNamwT43w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GbhJJgQq1l9h/rT9wuSU0d6LWxb5pCoQLwUuoPVShAg=;
 b=VvqHqQ5KlEhvKSdX7BJbIIVwzgD0xl0L3cKRRLi8UBbc5xW2Cr/kHo9X+ZHboQa9Nc/BWfaZ/HL2UT/X2pxoUwRPFZk1nX2eC+jIc35DUVpqdo+i0WB7ZWz+As7XDzOcmZVbKZsCMfRRapWP1iFMolIHPdCZyLc8Vo+EYis1EIqfvILwO8XKhBcE/nvVaywT4qgw13WCWaKFKafqmEi89O8LpomsrxU6Ewq6FiPMcUKLPwPM77KQaw8/y2U5Xs3f9vDnHbdEeYGv7kqJloiiyEZ0d8SMg9fcN+bMuW1Q6fTFbYgXeiJRms+GRKRPEFpQ0xjbP99T60EZbw26/ycCiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbhJJgQq1l9h/rT9wuSU0d6LWxb5pCoQLwUuoPVShAg=;
 b=fOFkKwgqgFKZ4zbLNSwwmqQeKb0e6+w+GTCS2xWDaMx0GMUtXDBA8vDThCpiCoGv1CuV3XcKQph8ywYSOqCasRTVnXB9ehOEc/Fw3LrOk4r1Y1toHqzYTMFogg4VDSJvFxyTB6Fo3r9QTZkfzED0tbEOorpJDpuxuJELNogThIQ=
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
Subject: [RFC v3 11/19] vfio-user: get region info
Date: Mon,  8 Nov 2021 16:46:39 -0800
Message-Id: <32606ff56a2dd3f0d9ceaa91feb6a3c3fa6b98d5.1636057885.git.john.g.johnson@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: f6bb2a5e-7298-4768-4548-08d9a31959fb
X-MS-TrafficTypeDiagnostic: BY5PR10MB4068:
X-Microsoft-Antispam-PRVS: <BY5PR10MB40683C49D25372471C93AE17B6929@BY5PR10MB4068.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:324;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DuqJCgfVfs+QP/wAVsB9mwFtZkwgt1DnVBGvDuIeQEi2GQTTfeMSIJXuONY8M/fDu/r2ZRkO0Y28pfh8FOUzdb5BSXEbWKKVXfVXmWmhxHZUPZqLlJnaxXuX2sb1ir9DpNsa6mNFTWfKVjUBrDADy3cs8jIXlF+EGsDPan7T+TcxjfN5QSetqDN3CF9iE4gzwGn/XK8vtNJI6EHM6gqg4t9WsgxsYlyF453wjVdGiC1fXjZ6RiK7x4+3O7Hl/roY8+CFRjr5YOv54pa3TK8Cjo+IKl8U8TbLqtKTqO6f4Omm7gIvqoEBzjlABDKcNyKQZcMDyer6amCzdDBwuZNsaYHeHjhPIZOn/0uJJFCu6ST62uD9ZHbCY3qmdQ3wbeoYRz6VA3vKvtptc1cSlYu2v409HRwXZ6mamXNterfLFCZrzjT4M6sfM6t4WDnD3NEI9S3tRazupAwHfXjSRqwniW4P5Jz2HhKiu4o9UvQyyQjyQjPsDwof5kT6CMhEiH9qA9gzE6Xv/OAk7Tp7wYhz+HIapPMSXv25ZqvTiA4Qp4guo8xBk32xOFAftPMMuAn3pUzHoTrWZE2fzAe06snzN/nx04yu9K096rucCXV8hwm16L8lhSoQbk15tPJEAT42ydolBqvXnMNOnHmakG4MIQ/Dvj6771g2xhfUJrxNCUfL/pI26v6eNyur1scij50DyXi3+NdgkBVkQlSaZ4iQ/A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4686.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(316002)(186003)(66556008)(508600001)(8936002)(8676002)(66946007)(6486002)(26005)(2906002)(6916009)(5660300002)(36756003)(7696005)(52116002)(86362001)(83380400001)(956004)(38100700002)(6666004)(2616005)(38350700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wIgwEwom8WvI0DhgeYqnVo4U4KNafWtiuwyl7rzF9QiEJFMTtQ7LMSrbJcYd?=
 =?us-ascii?Q?qckDxYI+qycS7pPuolpo2a2lIYlE9qLo8Rm2YYXEP9bg5lnzoKIjJoxHEu/b?=
 =?us-ascii?Q?T9YxwX4xIHwqTE70/TfVBVVzKLOe+VLiKCCeie2dyruHeSIfdm1HQ8O9zZtX?=
 =?us-ascii?Q?X9cZjNVYJLhpmfuM6p4BcoiD2wrHfG3p/+zio/bDHiSquYO5R48DIf8Q9GQX?=
 =?us-ascii?Q?uhPCgUmAOR2fhn9jhD43UDukNtCDi/U7o5D+lHGGss072Fwb4yUdCSg0LV6S?=
 =?us-ascii?Q?nyooa6mvbLJvMLxtTgIW8+5777zfF5FvC/ADqM78yx4R72xJXJB/7CPKk0YL?=
 =?us-ascii?Q?utvjmv7873ytRsvcccpDRkIpwYW244ufpoN3REJc30Tx8ox0jQUj4IelXDKK?=
 =?us-ascii?Q?r4iSrOQR3XoNLi0L+jWzO6HoUu68v5Z7/EVUqs9Pq0cBOwUIKJd9mxWdYrAJ?=
 =?us-ascii?Q?ZYHglPYIOnsWEArZm0fNWvbqbKqc+1pPPXSeU6JcS1ryFYAVHt/MgCaHVbP1?=
 =?us-ascii?Q?8kNxu8OZK79BUXEfTFiU3ieuTf+Vgy0QlCO89BPvZufNJRNhW6daMC7mJ6lV?=
 =?us-ascii?Q?/9RdvvLFjNfiPle7e6IGFtOc4GMI1MFavLk64zsLl+BzSrvMObT/HLsMrJDZ?=
 =?us-ascii?Q?M49LNAD9PAiEA/pZpwav714wdPqnrDQYYXxDTMOLIM1uMA8LRIBpqBuV+MT1?=
 =?us-ascii?Q?koHeWuWtAgwpV8qZaXXdv4ZbI+pTkBfRirB96fAHFxcBgjY1Nx+kasdEeY3a?=
 =?us-ascii?Q?L9wTEG/i1lyjEaIhZ1Uvtr681N+lM+85jW7f0IxSbRHmXbWRhrMF/zZ+JOhy?=
 =?us-ascii?Q?Fn7z8ZJQCMDCNSMBWDqgefD+nPOWad9xYV3iCEWWUkfm+giGP+HlLMNF6KjU?=
 =?us-ascii?Q?0x26XVbVSO2nEtNljyT6BbZhS1IerVGAu5R2bsLPOR5PHNA7JU8YaIwAcWFo?=
 =?us-ascii?Q?Qa2SDaLTNFv2FsRH+ko+DtETdkeXj1o92VQPjt3bBROr8tYhJpRlpXJYhOhB?=
 =?us-ascii?Q?HA0erANNuOwP3WfjZyyYiqAqwegy4COOVzIagJ8lCE7PKijGKxPURdnRy4Z6?=
 =?us-ascii?Q?TtgD2aSWNyRbLAEqQU2OQ1TrmNmUeQwsHskiMw3I/UXerY+zBW8b6aBf1+Am?=
 =?us-ascii?Q?K7A/zQI2RjTHHYrQ3irN5owtc/C7B+7P77paHsu0Hf1FjpaSvoVeyBax87O7?=
 =?us-ascii?Q?ES2kefMjTHxUe8s90IGzYL7rQrox3nkYd2o1iKFpbaTJM2urHnMzUhdbzMY6?=
 =?us-ascii?Q?TLsTWyYYliaXaPZZF84jrFMlAVxR8a+w7BWVYt9sfDIDgsfA41TB8xfYOlMD?=
 =?us-ascii?Q?DimfUN4GdeQA+k+c5E61345BtkGbbZ1TTozuAA6Kdtp6GD5wJE+2fb3iaETP?=
 =?us-ascii?Q?czA6D6xgAXIEcsaRQASgGs15aVH08ux0wvogZeuOileE6uAwL+Oy/epMS94D?=
 =?us-ascii?Q?j09ndH6B4SS883IaJh+ZSugINctQGgXaVT931+BcrD8zUnZup9g35NPnHRqa?=
 =?us-ascii?Q?AjkYZUE8Gju2KovHbaF8OhCfKzrOmtxP05fnIS+KrNp+Ik68VXrgb71FscXX?=
 =?us-ascii?Q?DqkeCZrOjl6/uMe27238yEtKFdXsYO8KOSjE7oQRvFj7kld5JiLxX+gkzfrC?=
 =?us-ascii?Q?7nt5coVucETUba/ATlfixy/6bg49yquFpWIoNyJ2GLUMSinSPoLXDitoCeqR?=
 =?us-ascii?Q?L10TZg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6bb2a5e-7298-4768-4548-08d9a31959fb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4686.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 00:39:12.9810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y+mIciJl5w6/9o09iswA/4i5IUdG0SPsc7YUP0bUq5bjd2ASlqEIe35jtk84F5VSxcXxE5cj6sncMwzmLMG4d+9F7LOKYvpl/m4YUcTUeq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4068
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10162
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0
 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111090001
X-Proofpoint-GUID: -HclBOsxOXB8gQAWLVW0vKPAp5RSqraR
X-Proofpoint-ORIG-GUID: -HclBOsxOXB8gQAWLVW0vKPAp5RSqraR
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
 hw/vfio/user-protocol.h       | 14 ++++++++++++
 include/hw/vfio/vfio-common.h |  4 +++-
 hw/vfio/common.c              | 30 +++++++++++++++++++++++++-
 hw/vfio/user.c                | 50 +++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 96 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
index 13e44eb..104bf4f 100644
--- a/hw/vfio/user-protocol.h
+++ b/hw/vfio/user-protocol.h
@@ -95,4 +95,18 @@ typedef struct {
     uint32_t cap_offset;
 } VFIOUserDeviceInfo;
 
+/*
+ * VFIO_USER_DEVICE_GET_REGION_INFO
+ * imported from struct_vfio_region_info
+ */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint32_t argsz;
+    uint32_t flags;
+    uint32_t index;
+    uint32_t cap_offset;
+    uint64_t size;
+    uint64_t offset;
+} VFIOUserRegionInfo;
+
 #endif /* VFIO_USER_PROTOCOL_H */
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 224dbf8..e2d7ee1 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -56,6 +56,7 @@ typedef struct VFIORegion {
     uint32_t nr_mmaps;
     VFIOMmap *mmaps;
     uint8_t nr; /* cache the region number for debug */
+    int remfd; /* fd if exported from remote process */
 } VFIORegion;
 
 typedef struct VFIOMigration {
@@ -150,8 +151,9 @@ typedef struct VFIODevice {
     VFIOMigration *migration;
     Error *migration_blocker;
     OnOffAuto pre_copy_dirty_page_tracking;
-    struct vfio_region_info **regions;
     VFIOProxy *proxy;
+    struct vfio_region_info **regions;
+    int *regfds;
 } VFIODevice;
 
 struct VFIODeviceOps {
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 41fdd78..47ec28f 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -40,6 +40,7 @@
 #include "trace.h"
 #include "qapi/error.h"
 #include "migration/migration.h"
+#include "hw/vfio/user.h"
 
 VFIOGroupList vfio_group_list =
     QLIST_HEAD_INITIALIZER(vfio_group_list);
@@ -1491,6 +1492,16 @@ bool vfio_get_info_dma_avail(struct vfio_iommu_type1_info *info,
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
@@ -1544,6 +1555,7 @@ int vfio_region_setup(Object *obj, VFIODevice *vbasedev, VFIORegion *region,
     region->size = info->size;
     region->fd_offset = info->offset;
     region->nr = index;
+    region->remfd = vfio_get_region_info_remfd(vbasedev, index);
 
     if (region->size) {
         region->mem = g_new0(MemoryRegion, 1);
@@ -1587,6 +1599,7 @@ int vfio_region_mmap(VFIORegion *region)
 {
     int i, prot = 0;
     char *name;
+    int fd;
 
     if (!region->mem) {
         return 0;
@@ -1595,9 +1608,11 @@ int vfio_region_mmap(VFIORegion *region)
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
@@ -2379,10 +2394,17 @@ void vfio_put_base_device(VFIODevice *vbasedev)
         int i;
 
         for (i = 0; i < vbasedev->num_regions; i++) {
+            if (vbasedev->regfds != NULL && vbasedev->regfds[i] != -1) {
+                close(vbasedev->regfds[i]);
+            }
             g_free(vbasedev->regions[i]);
         }
         g_free(vbasedev->regions);
         vbasedev->regions = NULL;
+        if (vbasedev->regfds != NULL) {
+            g_free(vbasedev->regfds);
+            vbasedev->regfds = NULL;
+        }
     }
 
     if (!vbasedev->group) {
@@ -2405,6 +2427,9 @@ int vfio_get_region_info(VFIODevice *vbasedev, int index,
     if (vbasedev->regions == NULL) {
         vbasedev->regions = g_new0(struct vfio_region_info *,
                                    vbasedev->num_regions);
+        if (vbasedev->proxy != NULL) {
+            vbasedev->regfds = g_new0(int, vbasedev->num_regions);
+        }
     }
     /* check cache */
     if (vbasedev->regions[index] != NULL) {
@@ -2441,6 +2466,9 @@ retry:
     /* fill cache */
     vbasedev->regions[index] = g_malloc0(argsz);
     memcpy(vbasedev->regions[index], *info, argsz);
+    if (vbasedev->regfds != NULL) {
+        vbasedev->regfds[index] = fd;
+    }
 
     return 0;
 }
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index ed2a4d7..b40c4ed 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -923,6 +923,40 @@ static int vfio_user_get_info(VFIOProxy *proxy, struct vfio_device_info *info)
     return 0;
 }
 
+static int vfio_user_get_region_info(VFIOProxy *proxy,
+                                     struct vfio_region_info *info,
+                                     VFIOUserFDs *fds)
+{
+    g_autofree VFIOUserRegionInfo *msgp = NULL;
+    uint32_t size;
+
+    /* data returned can be larger than vfio_region_info */
+    if (info->argsz < sizeof(*info)) {
+        error_printf("vfio_user_get_region_info argsz too small\n");
+        return -EINVAL;
+    }
+    if (fds != NULL && fds->send_fds != 0) {
+        error_printf("vfio_user_get_region_info can't send FDs\n");
+        return -EINVAL;
+    }
+
+    size = info->argsz + sizeof(VFIOUserHdr);
+    msgp = g_malloc0(size);
+
+    vfio_user_request_msg(&msgp->hdr, VFIO_USER_DEVICE_GET_REGION_INFO,
+                          sizeof(*msgp), 0);
+    msgp->argsz = info->argsz;
+    msgp->index = info->index;
+
+    vfio_user_send_wait(proxy, &msgp->hdr, fds, size, false);
+    if (msgp->hdr.flags & VFIO_USER_ERROR) {
+        return -msgp->hdr.error_reply;
+    }
+
+    memcpy(info, &msgp->argsz, info->argsz);
+    return 0;
+}
+
 
 /*
  * Socket-based io_ops
@@ -941,7 +975,23 @@ static int vfio_user_io_get_info(VFIODevice *vbasedev,
     return VDEV_VALID_INFO(vbasedev, info);
 }
 
+static int vfio_user_io_get_region_info(VFIODevice *vbasedev,
+                                        struct vfio_region_info *info,
+                                        int *fd)
+{
+    int ret;
+    VFIOUserFDs fds = { 0, 1, fd};
+
+    ret = vfio_user_get_region_info(vbasedev->proxy, info, &fds);
+    if (ret) {
+        return ret;
+    }
+
+    return VDEV_VALID_REGION_INFO(vbasedev, info, fd);
+}
+
 VFIODevIO vfio_dev_io_sock = {
     .get_info = vfio_user_io_get_info,
+    .get_region_info = vfio_user_io_get_region_info,
 };
 
-- 
1.8.3.1


