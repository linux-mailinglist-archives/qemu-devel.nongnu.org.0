Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 255133EDBDF
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 18:59:20 +0200 (CEST)
Received: from localhost ([::1]:34630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFfxH-0001tv-7n
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 12:59:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1mFfhi-00011t-N3
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 12:43:14 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:57618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1mFfhd-00081V-5a
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 12:43:14 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17GGbZUF029485; Mon, 16 Aug 2021 16:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=dEIQoWq1svlzZmaE3BBG0U9ChO0Ig3r7lzdRFu1zmXw=;
 b=OKDYLn5jlPLLKJw0oYntG/Vss9HE+NyQ8eODHM9n6tq6/5c6RfZjKvd9xlHhE/Vrwg7E
 Q/bdqrzKAbbHC66RhBNojxR8Z2FZJlCt/98DkRTzt9M8bEoHNQfDueajU6bLnHBD22rY
 iSMqel09Ps1E1xPvUoAf4+tqd0C/ta+m2Vls5NXRT0Fg8dorDAE3lpdWAnT9dnZTYr8C
 gOUiiQIDOfSCfhEhU1N0K+U3J5o/6Dn3eMnZSmjzGXwXt0M71DqdY+1fXzMoN9DR60aL
 mor4UvQlcLWYNtKBhd8LzJN5dmsN+BczaD68YlMlQHnW/mZzOjjUvCPs0P6y2G1oqWEk FA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=dEIQoWq1svlzZmaE3BBG0U9ChO0Ig3r7lzdRFu1zmXw=;
 b=hlG96/HiLKSUUcNKBHlXx2XrOAJu9O3TkzmzdKakGALAdMFpd2yNaifLVh8GxvPK/yRJ
 7lSg6tG5FxGVVWdeTWPh1f8w6Quf4EvOBtRU6aDx7jwD6IdxGTPiwE5+SiA24iZzooMc
 BcZJoe+mxN33VND3LEFXkwZeCj2aHiNI2XVls2xBO37OUQSBjQu3v3Qddkyqb9ksUl5k
 Hn4auw5p5fUpw0crhuWgBGKm/6QIjY8T+oVDu1BHJHat6RIcgEv4+tw1Q3p+mShOJr9H
 yMnMzZ9exTHeTwQm3ptclluUvAMv004JX+D7F+FDVaUDVNCN8jkrCUcU8x4pjyWWU/7j 6w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3af3kxtg13-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 16:43:07 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17GGeiuT113652;
 Mon, 16 Aug 2021 16:43:06 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by aserp3020.oracle.com with ESMTP id 3ae5n609mu-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 16:43:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WNQyAwaxvOwS0hknTBmwjhzYQwwIBuQPe0EDuCD+fdRdsDf36gPUD2Xz6EndfLAwknpkrbKbjevyjNSmdnjUf4PUv1Axb1dvkvUsIaoV5P5ZdAcBBRJI+W8MTuBdoey1gRICveSjl4q4nKAxouDV3hxBAiH+F16VnTz/kxpWGmr59OCGKeX57pCppDQg+1Ez5my9qLCWiENlurZfAD7e+VTAKnKfVapZ6uroSJQLZiMg3crC7Ib57urr/qZ0OiWwUDdtuxo0Z5y8lKm5PqPTh0GhuiFsWcC6MY807vMK6WvXL1nX9e8AaJvKPmmCwwvVFWpN79Xwz8R5UE+jUoA21A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEIQoWq1svlzZmaE3BBG0U9ChO0Ig3r7lzdRFu1zmXw=;
 b=aAp/X6AX+V2iTJsxQbG1xLOwOv2xAzg/r7FKfwmqBHJnmieQc2v79TmQbvFKCu2Hz7uu4DDyczglgpOA0jip7nxiSEu7UKWfRRXRseaTDroIzfbDrpNVRiVdXZPEbIioT6Belk5CXbXR4wA/+QLqoCH6JKE1YvXKp0P9OpAr6z9qxop0ET6YsePNmtsYYK/2rlhSPoPmz3372HTiMMtc6i5ftx3S23rAxaeyKWrj0+5KomPB2CvGo0S/sleq60m++wUrMQUIToUJDaymO42oZVxuIPLucDsQnHiMzkOJTUYquENN7Khh1CZvi90m/tOjzCwaNH5GvcNyVLHKmO1FeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEIQoWq1svlzZmaE3BBG0U9ChO0Ig3r7lzdRFu1zmXw=;
 b=aNTr/5y7I/m6XzXRDp2sZ65wzHZICmZLmc8uH9XtR/ehwOlyfPe9ZWzeSBN6aSjz3alzVeCTugKPWHXfW7bSL+gOaJdx04SDu+WzSQeth6mRWzdeZ6t5K9+PpmmqTZ3vl0cdKsGkohiGby0UcKFQYMMHChIgN5Wo4uH75F4Kd7g=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by SJ0PR10MB4765.namprd10.prod.outlook.com (2603:10b6:a03:2af::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Mon, 16 Aug
 2021 16:43:04 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539%7]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 16:43:04 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 16/16] vfio-user: migration support
Date: Mon, 16 Aug 2021 09:42:49 -0700
Message-Id: <42758d8b56b1036d86cf2252c175071c1094a8b0.1629131628.git.elena.ufimtseva@oracle.com>
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
 Transport; Mon, 16 Aug 2021 16:43:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97624a51-8ec2-42bd-f8ee-08d960d4eaf2
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4765:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4765FE62E226257B9114AB388CFD9@SJ0PR10MB4765.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:31;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pJPeXVDf5qfRZjqVXwEEnVMKvbGmKOn3qwwKkklYYbhOQFJseg3vdiViVA9GIE9f7vwHJKLXCpJdO0D8j0yxZxTDW2JeygDSiZdns6yKKVudlCRCw119dOyHEm+LQbMHsMWX2hP3RsLioq7NZu+fvY1tr3ZXQ9pEzSnwj/oYaJfEscvR+m1zseI+foBjwvu4qatcWDvKmRbttWO1GO+GWZUgXFu75Y5GnooXylyCFsSn4wR7V7UrpIYf6FzyJZ5bE1A5C4ftairpmGeJ2XZqlFb6Eg8ErdENseUp4DjrS+gBuJQ/PdRyGg5e0L1A7egx3TRqnIvzLZMrrJMiZrcQHYIeSG6oD8ieC2XqJM4R+Uzbrv5aN1sPh9L3jy5sah9sFLTNy7Tntj8Pg1ajKk448Ut5kBqlcOETq2aZXdkaR8R8ijIEKJopqVNEub97PcCrJSchJpNBOTpprGvC4F/0W4ZRi/fUK0i9eYOrY7VvqfCwxzLKbR05crp+pGecdsr8vlwW/Uv5lVTZfg239obeQ+N9NcyqizKcZt2aPbCr8Ba46e5HN0rrcUugcvNtWmPoCNyVQArcYT6oM5X/POTSmm6YRhM7SEYL9TmsjOKy0KHdqN0WX1G5ZCVflUoaeCpLG9kwpjbRaekKPNSJVu5qGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(2906002)(86362001)(66556008)(4326008)(38100700002)(8676002)(508600001)(66476007)(6486002)(66946007)(6506007)(5660300002)(44832011)(2616005)(6512007)(6666004)(36756003)(6916009)(316002)(52116002)(83380400001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s+eeu+JresGXjtcgOvyAW6TR9fN/xf7yIhwa67hJM+9FUhjxQfSoeQ02REFZ?=
 =?us-ascii?Q?Vf0XRuBeoR3KlMwtZjOLAB1PScIRTvgQH0XycRjQ5Iw0XqSg1zsRyb/2Jt+K?=
 =?us-ascii?Q?mhcuMHAtjtbuUgbnTJRxXXbNeNWRjX/B9mQSI8zY/VgQQPe7Gq0lhNuxHX9t?=
 =?us-ascii?Q?TShL54XUUyestTUGaHKJcp2q30uJndtBtX+5q8iOx/Baq6/wsPrznRsUwRx1?=
 =?us-ascii?Q?rSteIeOV/xGyF2RmVTk6geCZK+kqWky1TJjKBW3iS+KYoOvHRmihFkPlyCoO?=
 =?us-ascii?Q?1ZNIZ465FqanI9Sv+g7+0MIfxwt4NBNbEuq6gVqG97WTzpu+/yI+qI73BhN+?=
 =?us-ascii?Q?VSwxgFLwhLz/04Iq07zYU/R1sg2gasAErxujzZw6CLqbPzAdYCRnc4BrR6Z+?=
 =?us-ascii?Q?f7HO5sLulITARLNWnSo6Dg6gBn/Xnf/qg8gRZvsrsHNVtPHjaXmTP9k3NQKY?=
 =?us-ascii?Q?vEnlybUQySx32A1PRQAIKvCVmMEhGtwwr8yhx4Vl85hqS0mfjPlRwyuX9OWp?=
 =?us-ascii?Q?pCn3fqy2gYTWqz7/Sn5JmdJ0ehCsepWhHOAqxxfDdB+efTr3XFR5QuLuRO4h?=
 =?us-ascii?Q?b4cH4kZi1agvIRB0Q5md4c20oWiJ94eoTd3x1E07a8XC2PW0gQQGYEmOBaS1?=
 =?us-ascii?Q?tfle6thA78N4J/QVmtgmwjgWrE2nc8PxDyZdcX/EFX7hsq4X2MGjjtzpQLCt?=
 =?us-ascii?Q?Jr0zMuQznh2Qgh450KP85/1JxL0/fqUtcmhLyLA2vU5W9WTGrYMxbGVn28wy?=
 =?us-ascii?Q?zizgbtb830Dp9D3AtjGpNa6W8SV5sdBXDwxOQYyd1riUarLaXKK54LkoZ1HZ?=
 =?us-ascii?Q?kgFabUrWU4hBhDLq9tpZ8ys1xKw30puBg4WFgQGUOzy61+YX5ejUWtqQJaPW?=
 =?us-ascii?Q?rMWcFXCybk636vpCZcgiyNdg3O9qM6+iSXDVSy+NaHTDIs+lyRpezOdJnjr6?=
 =?us-ascii?Q?BQG0jfGH3rt9ZXFluTo81FerLEgRuYjClNNuOkQp3KACXLYq+sHGKbSD4EBn?=
 =?us-ascii?Q?/9ScjbY5S7Ga5plB0UyhSFQshfi+wRP0AYOb0/L/HPU08hkHfACRka1GZOHc?=
 =?us-ascii?Q?Ix0fTiQe7vJ7bhoClJfRMoVnZGQGoO+o6Qu3eRpFz+1n2b+tGc/msM4LYsVB?=
 =?us-ascii?Q?CP67e9SFJdJv8nWWm4c2jaC/xptImVs63HqJxbzZ8zXD86k9LSJM07qLgwXx?=
 =?us-ascii?Q?WMzARGkbrYnOHrO/Gmfoy9S4UD7dCUXncEy2Tzp0HFI2DKlWzdCwZMC8KCYe?=
 =?us-ascii?Q?eOwYkIYMQhIkNXKwRB3ccz2f72Yi4jv+nMz7x1TunRArtHMA5n2+VMgEbruW?=
 =?us-ascii?Q?zXClBJSkEAO3/L15Ft0soPNk7OlQPBVY88e6bDFVUExRaBTTv+eh2dpQV7FW?=
 =?us-ascii?Q?kCdROrKtnNmDONc3ETmlTNne3WZo?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97624a51-8ec2-42bd-f8ee-08d960d4eaf2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 16:43:04.2320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: efrAWQHbgL6kA5Zpf9yvfTfYVcoat4IHOpvd5HXIsOj22enzWU4ILHi7LAIdaYBDGRW9bwEH/etUbPWwoy43wSf03Ti7Upo7EUua14VTANQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4765
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10078
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108160105
X-Proofpoint-GUID: AHfl2hyeULaEDUMwpNRoxHwtbzZBwaKq
X-Proofpoint-ORIG-GUID: AHfl2hyeULaEDUMwpNRoxHwtbzZBwaKq
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

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user-protocol.h | 18 +++++++++++++++++
 hw/vfio/user.h          |  3 +++
 hw/vfio/common.c        | 23 ++++++++++++++++-----
 hw/vfio/migration.c     | 34 +++++++++++++++++--------------
 hw/vfio/pci.c           | 12 +++++++++++
 hw/vfio/user.c          | 45 +++++++++++++++++++++++++++++++++++++++++
 6 files changed, 115 insertions(+), 20 deletions(-)

diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
index c5d9473f8f..bad067a570 100644
--- a/hw/vfio/user-protocol.h
+++ b/hw/vfio/user-protocol.h
@@ -182,6 +182,10 @@ typedef struct {
     char data[];
 } VFIOUserDMARW;
 
+/*
+ * VFIO_USER_DIRTY_PAGES
+ */
+
 /*imported from struct vfio_bitmap */
 typedef struct {
     uint64_t pgsize;
@@ -189,4 +193,18 @@ typedef struct {
     char data[];
 } VFIOUserBitmap;
 
+/* imported from struct vfio_iommu_type1_dirty_bitmap_get */
+typedef struct {
+    uint64_t iova;
+    uint64_t size;
+    VFIOUserBitmap bitmap;
+} VFIOUserBitmapRange;
+
+/* imported from struct vfio_iommu_type1_dirty_bitmap */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint32_t argsz;
+    uint32_t flags;
+} VFIOUserDirtyPages;
+
 #endif /* VFIO_USER_PROTOCOL_H */
diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index 5d4d0a43ba..905e0ee28d 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -87,6 +87,9 @@ int vfio_user_region_read(VFIODevice *vbasedev, uint32_t index, uint64_t offset,
 int vfio_user_region_write(VFIODevice *vbasedev, uint32_t index,
                            uint64_t offset, uint32_t count, void *data);
 void vfio_user_reset(VFIODevice *vbasedev);
+int vfio_user_dirty_bitmap(VFIOProxy *proxy,
+                           struct vfio_iommu_type1_dirty_bitmap *bitmap,
+                           struct vfio_iommu_type1_dirty_bitmap_get *range);
 void vfio_user_drain_reqs(VFIOProxy *proxy);
 
 #endif /* VFIO_USER_H */
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index a532e52bcf..09d0147df2 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1303,10 +1303,19 @@ static void vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
         dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_STOP;
     }
 
-    ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, &dirty);
-    if (ret) {
-        error_report("Failed to set dirty tracking flag 0x%x errno: %d",
-                     dirty.flags, errno);
+    if (container->proxy != NULL) {
+        ret = vfio_user_dirty_bitmap(container->proxy, &dirty, NULL);
+        if (ret) {
+            error_report("Failed to set dirty tracking flag 0x%x errno: %d",
+                         dirty.flags, -ret);
+        }
+    } else {
+        ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, &dirty);
+        if (ret) {
+            error_report("Failed to set dirty tracking flag 0x%x errno: %d",
+                         dirty.flags, errno);
+            ret = -errno;
+        }
     }
 }
 
@@ -1356,7 +1365,11 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
         goto err_out;
     }
 
-    ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, dbitmap);
+    if (container->proxy != NULL) {
+        ret = vfio_user_dirty_bitmap(container->proxy, dbitmap, range);
+    } else {
+        ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, dbitmap);
+    }
     if (ret) {
         error_report("Failed to get dirty bitmap for iova: 0x%"PRIx64
                 " size: 0x%"PRIx64" err: %d", (uint64_t)range->iova,
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 82f654afb6..89926a3b01 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -27,6 +27,7 @@
 #include "pci.h"
 #include "trace.h"
 #include "hw/hw.h"
+#include "user.h"
 
 /*
  * Flags to be used as unique delimiters for VFIO devices in the migration
@@ -49,10 +50,18 @@ static int64_t bytes_transferred;
 static inline int vfio_mig_access(VFIODevice *vbasedev, void *val, int count,
                                   off_t off, bool iswrite)
 {
+    VFIORegion *region = &vbasedev->migration->region;
     int ret;
 
-    ret = iswrite ? pwrite(vbasedev->fd, val, count, off) :
-                    pread(vbasedev->fd, val, count, off);
+    if (vbasedev->proxy != NULL) {
+        ret = iswrite ?
+            vfio_user_region_write(vbasedev, region->nr, off, count, val) :
+            vfio_user_region_read(vbasedev, region->nr, off, count, val);
+    } else {
+        off += region->fd_offset;
+        ret = iswrite ? pwrite(vbasedev->fd, val, count, off) :
+                        pread(vbasedev->fd, val, count, off);
+    }
     if (ret < count) {
         error_report("vfio_mig_%s %d byte %s: failed at offset 0x%"
                      HWADDR_PRIx", err: %s", iswrite ? "write" : "read", count,
@@ -111,9 +120,7 @@ static int vfio_migration_set_state(VFIODevice *vbasedev, uint32_t mask,
                                     uint32_t value)
 {
     VFIOMigration *migration = vbasedev->migration;
-    VFIORegion *region = &migration->region;
-    off_t dev_state_off = region->fd_offset +
-                          VFIO_MIG_STRUCT_OFFSET(device_state);
+    off_t dev_state_off = VFIO_MIG_STRUCT_OFFSET(device_state);
     uint32_t device_state;
     int ret;
 
@@ -201,13 +208,13 @@ static int vfio_save_buffer(QEMUFile *f, VFIODevice *vbasedev, uint64_t *size)
     int ret;
 
     ret = vfio_mig_read(vbasedev, &data_offset, sizeof(data_offset),
-                      region->fd_offset + VFIO_MIG_STRUCT_OFFSET(data_offset));
+                        VFIO_MIG_STRUCT_OFFSET(data_offset));
     if (ret < 0) {
         return ret;
     }
 
     ret = vfio_mig_read(vbasedev, &data_size, sizeof(data_size),
-                        region->fd_offset + VFIO_MIG_STRUCT_OFFSET(data_size));
+                        VFIO_MIG_STRUCT_OFFSET(data_size));
     if (ret < 0) {
         return ret;
     }
@@ -233,8 +240,7 @@ static int vfio_save_buffer(QEMUFile *f, VFIODevice *vbasedev, uint64_t *size)
             }
             buf_allocated = true;
 
-            ret = vfio_mig_read(vbasedev, buf, sec_size,
-                                region->fd_offset + data_offset);
+            ret = vfio_mig_read(vbasedev, buf, sec_size, data_offset);
             if (ret < 0) {
                 g_free(buf);
                 return ret;
@@ -269,7 +275,7 @@ static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
 
     do {
         ret = vfio_mig_read(vbasedev, &data_offset, sizeof(data_offset),
-                      region->fd_offset + VFIO_MIG_STRUCT_OFFSET(data_offset));
+                            VFIO_MIG_STRUCT_OFFSET(data_offset));
         if (ret < 0) {
             return ret;
         }
@@ -309,8 +315,7 @@ static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
             qemu_get_buffer(f, buf, sec_size);
 
             if (buf_alloc) {
-                ret = vfio_mig_write(vbasedev, buf, sec_size,
-                        region->fd_offset + data_offset);
+                ret = vfio_mig_write(vbasedev, buf, sec_size, data_offset);
                 g_free(buf);
 
                 if (ret < 0) {
@@ -322,7 +327,7 @@ static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
         }
 
         ret = vfio_mig_write(vbasedev, &report_size, sizeof(report_size),
-                        region->fd_offset + VFIO_MIG_STRUCT_OFFSET(data_size));
+                             VFIO_MIG_STRUCT_OFFSET(data_size));
         if (ret < 0) {
             return ret;
         }
@@ -334,12 +339,11 @@ static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
 static int vfio_update_pending(VFIODevice *vbasedev)
 {
     VFIOMigration *migration = vbasedev->migration;
-    VFIORegion *region = &migration->region;
     uint64_t pending_bytes = 0;
     int ret;
 
     ret = vfio_mig_read(vbasedev, &pending_bytes, sizeof(pending_bytes),
-                    region->fd_offset + VFIO_MIG_STRUCT_OFFSET(pending_bytes));
+                        VFIO_MIG_STRUCT_OFFSET(pending_bytes));
     if (ret < 0) {
         migration->pending_bytes = 0;
         return ret;
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 4b933ed10f..976fb89786 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3658,6 +3658,13 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
         }
     }
 
+    if (!pdev->failover_pair_id) {
+        ret = vfio_migration_probe(&vdev->vbasedev, errp);
+        if (ret) {
+            error_report("%s: Migration disabled", vdev->vbasedev.name);
+        }
+    }
+
     vfio_register_err_notifier(vdev);
     vfio_register_req_notifier(vdev);
 
@@ -3709,6 +3716,11 @@ static void vfio_user_pci_reset(DeviceState *dev)
 static Property vfio_user_pci_dev_properties[] = {
     DEFINE_PROP_STRING("socket", VFIOUserPCIDevice, sock_name),
     DEFINE_PROP_BOOL("secure-dma", VFIOUserPCIDevice, secure_dma, false),
+    DEFINE_PROP_BOOL("x-enable-migration", VFIOPCIDevice,
+                     vbasedev.enable_migration, false),
+    DEFINE_PROP_ON_OFF_AUTO("x-pre-copy-dirty-page-tracking", VFIOPCIDevice,
+                            vbasedev.pre_copy_dirty_page_tracking,
+                            ON_OFF_AUTO_ON),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 7de2125346..486f7c0fe7 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -1057,3 +1057,48 @@ void vfio_user_reset(VFIODevice *vbasedev)
         error_printf("reset reply error %d\n", msg.error_reply);
     }
 }
+
+int vfio_user_dirty_bitmap(VFIOProxy *proxy,
+                           struct vfio_iommu_type1_dirty_bitmap *cmd,
+                           struct vfio_iommu_type1_dirty_bitmap_get *dbitmap)
+{
+    g_autofree struct {
+        VFIOUserDirtyPages msg;
+        VFIOUserBitmapRange range;
+    } *msgp = NULL;
+    int msize, rsize;
+
+    /*
+     * If just the command is sent, the returned bitmap isn't needed.
+     * The bitmap structs are different from the ioctl() versions,
+     * ioctl() returns the bitmap in a local VA
+     */
+    if (dbitmap != NULL) {
+        msize = sizeof(*msgp);
+        rsize = msize + dbitmap->bitmap.size;
+        msgp = g_malloc0(rsize);
+        msgp->range.iova = dbitmap->iova;
+        msgp->range.size = dbitmap->size;
+        msgp->range.bitmap.pgsize = dbitmap->bitmap.pgsize;
+        msgp->range.bitmap.size = dbitmap->bitmap.size;
+    } else {
+        msize = rsize = sizeof(VFIOUserDirtyPages);
+        msgp = g_malloc0(rsize);
+    }
+
+    vfio_user_request_msg(&msgp->msg.hdr, VFIO_USER_DIRTY_PAGES, msize, 0);
+    msgp->msg.argsz = msize - sizeof(msgp->msg.hdr);
+    msgp->msg.flags = cmd->flags;
+
+    vfio_user_send_recv(proxy, &msgp->msg.hdr, NULL, rsize, 0);
+    if (msgp->msg.hdr.flags & VFIO_USER_ERROR) {
+        return -msgp->msg.hdr.error_reply;
+    }
+
+    if (dbitmap != NULL) {
+        memcpy(dbitmap->bitmap.data, &msgp->range.bitmap.data,
+               dbitmap->bitmap.size);
+    }
+
+    return 0;
+}
-- 
2.25.1


