Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 669D03EDB86
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 18:52:27 +0200 (CEST)
Received: from localhost ([::1]:46164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFfqc-0007j0-Ah
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 12:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1mFfhd-0000l1-9E
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 12:43:09 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:47936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1mFfhX-0007x8-U7
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 12:43:09 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17GGbZUE029485; Mon, 16 Aug 2021 16:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=Z+HYnZBTg8/iVO2ADTDXw+BbrtUybeoKYSv9IN97OaE=;
 b=An1LXz2+MAiGckgOlh/4RWEusKrzS3FrQhgkZc87qCen8WRpKdQ5kECu0oJiT8EA+2AR
 1WX/T8IPqEtK+7S5BQufCKI0DlQTOPJjpuzjK56d9VclbFELVRDZ1ueiB56t+A7udLwZ
 GI1wnnEdXRAxoNlOjcK889/wh8KkEzm/mSrbcsoOqAk+rQyB4l08cGmMcXsgQTSmp2ME
 Fy8e3xPqvtvyg6SasGig/JksxfLSyTmKxqcq8BKIXMIhKJb29Ngd/AtubH3Q/DoS766x
 puisixNrgg0jjHtIEZPd/cGCYFzb4ubCTZR86IxKWEvGpSJ+R1znUBLLGTkFGNx2/CqL TQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=Z+HYnZBTg8/iVO2ADTDXw+BbrtUybeoKYSv9IN97OaE=;
 b=KMqLPWRGEGCKd9GkW5uz+/4cNOZZ95bE2SpZXMk9sQXcQ6kEK13sjsIET6cVxFksN9h5
 n6cFdTJiLv4OyUgiR34hT373DV5WMR0AqeU5XMI3B0KmvYXK6I+sRxMNFarDZOsqYsaV
 QENKmuboY6Y690b+xgwniFSw58uPmt5T9GiqbMxsz17KT7/imFzJGg/FzCIuQn5pqUNy
 Djz4oj/YWcujmjPnkYI4MZnzx+eOThQhmRCV7vEx0FYApOmaVu7YyU8Dzt01yrvt1U9Z
 m2MvfN9W9iRYx+TBFZX795VUA3MrZHDKUvjbgdOsCOL4GAS14GSiMGz0spw4UP4Gkgrb hA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3af3kxtg0t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 16:43:02 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17GGeo5t159237;
 Mon, 16 Aug 2021 16:43:01 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by aserp3030.oracle.com with ESMTP id 3ae3ve34y4-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Aug 2021 16:43:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AXz7yXqZ+T3fFrewj3I2eFbsnwuHY1DugQ6iiqCgzIE0fJHmt896QmWxk8TMtsI7e4ijEJPotbczkD/wNJWHpfN5YpMdQq1nfkxgYFFGbVwnFGrH4+Jb0uv1/gCllfNO8ZZBMEgs4J5Wz84iWAXHrWcAfCY+y9ix0nWj0qiT4Ojte3dzNVA3/zGhQ0aQzJSj5da0/wVHxEQ9BN8Phb0mMxy4jq2X2MjXxJK9PuQUxya2ROcxb6Uzm7IWNnutmWYlMq8iBoZNA/dBUNBvY4SlBS0k2gMtQjilQyAaadkrCfs2sKqk14n+5Uxdq/0MeHTdn2Zx2Lwwuopr/fhFYAeYWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+HYnZBTg8/iVO2ADTDXw+BbrtUybeoKYSv9IN97OaE=;
 b=anROrCoSKPhxFnbyxpIfMM2aHxhqbYM1vpH4YEFxeaYbLeraizAKLaDB/6YtgWadPC8u9MWFL9IyPkpd6/mO2wz1NuUMnzZjOcldtOzaPSPe2ums/WThu0evWGNIy84dJGfiiJNLUnPPtVAUcYqUGz3+rq6ptK8dvqlfHEpQICsyG/JnpFm6QkgjPicbC/+nXSePKDPNsR5O+I3hzUfDgcn8XGSfGLZu3T1u57lGp9KGiqqnMEPEEb/lhclms2lPbzeXakYrSoqI/JY87Hf2wRpD5qvtMw06ep0Q5bdQmfq0J7ZFpUuSQ8+nAv7dFlY4G5z8ppXIS8AObfO2ue0wxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+HYnZBTg8/iVO2ADTDXw+BbrtUybeoKYSv9IN97OaE=;
 b=FS1Jr5A1v99ZmEHv2KHmgEa5oQYAKMNCLrsF4Rz/gVjUPoTcqnRW/J5ab9miw5vnOgCmpMQQwKyQNasUiYNKeDaDvQHsQa3hnDvaNZa0dGnh57o2nzBsB9Tc/9//lBm4NTYQpJ5tiskePb5yhICiJycC43eNXSPQt6WOnPLUCUc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by SJ0PR10MB4765.namprd10.prod.outlook.com (2603:10b6:a03:2af::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Mon, 16 Aug
 2021 16:42:59 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539%7]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 16:42:59 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v2 08/16] vfio-user: get region info
Date: Mon, 16 Aug 2021 09:42:41 -0700
Message-Id: <d442105953151559982c8b1a753d847fb89da3ba.1629131628.git.elena.ufimtseva@oracle.com>
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
 Transport; Mon, 16 Aug 2021 16:42:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0448f41a-ba4e-4662-170d-08d960d4e846
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4765:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB476555BC13F76766BE8397B58CFD9@SJ0PR10MB4765.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:324;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JEZoHPer/nkBxQJisYyA42A1gmyEN/4ZTZNC9ZlWZXxIKagQjjSnx8EXrq8NPiJyHsAv4LiyHWM72xIVRs/lDkm/stOGOuZpTt9Gg5E9CbKWld4oARZqBZbk+lNTxxFPj1ad4oDfb+wBVxRq7WMk4BKje899SzgqMKDiler80eH8uLayPNysfnW+dSwjCKOsl15Wqkutp/duf5/O0IiXu+bY+UaLOF/yBijNF6AMiZ8HIRQT13B3He3BvuH4I11ywCUAKKrKaWp22k4icMgMOLX2HDzzeHRjo/avmrP73ogvud6gbIGbhqatRk86FEOuOlgVWRpZsGOF9uZpsvMZPurmn4W4xI/vWfWeWDvw+kXldCGKgy/nGZzutDPMxwmCbFN4iImzgCvuJYtiPwOeOda+1sARVX2hmbP2oqvG3sUwDERBM+WJczv1Zg8kHIZOOxyVqvB50x+QG3mT1N5SeZye56mOKtBRjwyGI7ESyODM/FGsvv11Ujuj8SGQV7wWflGAx2c95bOmVkj5eE7Y5+Y51UZ7uYbtKlog6iDLT1x5oPu/tZLWgATMQjboNQ1xc0G4bZhMoXVW1bQbcWnXgnHL/WwuMaeGqm7eJK8ggA+erLNgkXSrVYMMSbr7j47SH14iZVwOgZbvYFKFqLu4HQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(2906002)(86362001)(66556008)(4326008)(38100700002)(8676002)(508600001)(66476007)(6486002)(66946007)(6506007)(5660300002)(44832011)(2616005)(6512007)(6666004)(36756003)(6916009)(316002)(52116002)(83380400001)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ds4ImlLk4inMKv3nEv/3rd9sb777gf54GN8VDzbO9KRJXtFoMXDnIo/OdaL4?=
 =?us-ascii?Q?ko/JwK4lwrl94QZKxgK8zXKSgCDdZjcDLE1dggoAlnh4b/suug2n7kxZj0og?=
 =?us-ascii?Q?ccihSdxjhgc6iZnBmBAULu/4dLJO++53BQfUd46fXNEyTBU4mMSPg0RI47Vw?=
 =?us-ascii?Q?B0a/YMi8yrvbci3zLT43EU2I++df8zeO73UgvD+LBEeJ0BbTmY30gcMXgQ0s?=
 =?us-ascii?Q?3TuJuoE/ncQ4D3BG7bjx41r64ci+dRxYUhlt07bYCjly43w8NBCcYt//knQj?=
 =?us-ascii?Q?c8KlEuQx+BKOy633Ewk7bBV+Cd50RtZoizhD+R5WkKyep1yG3mlGoPE5AhWr?=
 =?us-ascii?Q?o0k9t0p2OLBL6eRWqHIkhInozHxZfbKhXe3/FPkJLd0ho+XHJP+aaLFxoK7G?=
 =?us-ascii?Q?o7p2mL7D/zFHIb1lAKyAGFUnHchNKR0bE2IXyCaEKBC0mQ88CWmmGHEm6eMC?=
 =?us-ascii?Q?X9ny+YL8DUnIh7tVWgRh2F1o5Mub3VdT5+SptYT8g408JHy3P8cKcYwnNUNh?=
 =?us-ascii?Q?NmNtuhpyB08XBm1yBz2Sm6iOwjMBb3/uiWjS0PtkBNhFla9Ec9MEgy4cuxDO?=
 =?us-ascii?Q?UxX1DP9NFKffp7oKK4ITRGE9/7IQO7lFMPAtVryrRyLP8h9OUUCZaQmAbYZw?=
 =?us-ascii?Q?xiUKwFc7TXR/BwssPWOuAh6MxVyY8FKgSjtoo4bUEbkaFn5Yhxxcff0tumTw?=
 =?us-ascii?Q?nI81j31QdCholNjh48lHdd9JxmfLa/yLzDK5VO6hkwBlU4WePAgn4X/LDQct?=
 =?us-ascii?Q?PWeeciAC+Tkrx+9eoBseZv10iI/7LoKnklrSsm+iabBuQ0sW9AN8Au1258F6?=
 =?us-ascii?Q?Im7iIPFKuqpSmPa2qTc7KS/uDZdwFexIQLkUWmfrJa10TrziE1eR20dpTTlq?=
 =?us-ascii?Q?F15iD+Sr1O2WtK2lORbVbisSyzl26nmVLBHg3qr9XN4rs/+bziNK1K8gAO8P?=
 =?us-ascii?Q?T8dEIbslbLo9xY+JUmx9EdmqUvOxw74/dJ9yTmHM227tYD0qpbrEClOnCVhy?=
 =?us-ascii?Q?Ai2E8LJqH103LHwrBDm+Lj7IyC4vaAnciJLKNMr+cE1DAY84RdUQWLxmaLwV?=
 =?us-ascii?Q?lEc/J60slnd8tMsiTWngHaQTeP76QloKqZsTC3DNLo+x6BBzoVveiaGgq6qi?=
 =?us-ascii?Q?7yss6/CUo6cZmfzB1My8Boc6ry+W2uOrPTQFYnTDa5Ls91hOxKT4BYMgr90h?=
 =?us-ascii?Q?4ey5ZolJ8t69FKaKNsC0NmeAFFxfJ24pfH3N5VkoSmscLDK/uhP9QiQ20mhg?=
 =?us-ascii?Q?oKfvIzXZ01bPYLhEDEFZiFK8a+i0PHm+Z2UdddmZyAYvVuwSlBljENs3PgYi?=
 =?us-ascii?Q?jtCjgdvu7mnrIwMR8G/kBBXz8zdnpAaD67drUa1Elkzy0tyz9KskxQ1JGQpM?=
 =?us-ascii?Q?iy/gLKa2Xfh1QzZPRkG++5wAne+F?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0448f41a-ba4e-4662-170d-08d960d4e846
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 16:42:59.7055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PfCVIzAyztpbmOgLjV8helwtS4QD1Xn0IFxDRQPeJo3fDNyiJKTZMcqCr+BH3oUVnT7TnyXY4FY104gz1MC6XxkruzPC8PgvOifmeUyUq64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4765
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10078
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108160105
X-Proofpoint-GUID: wsVNoaoUIxlHJvBjLZHiSh8-jXPNQxFi
X-Proofpoint-ORIG-GUID: wsVNoaoUIxlHJvBjLZHiSh8-jXPNQxFi
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
 hw/vfio/user-protocol.h       | 14 +++++++
 hw/vfio/user.h                |  2 +
 include/hw/vfio/vfio-common.h |  3 ++
 hw/vfio/common.c              | 76 ++++++++++++++++++++++++++++++++++-
 hw/vfio/user.c                | 33 +++++++++++++++
 5 files changed, 126 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
index 13e44ebf1c..104bf4ff31 100644
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
diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index 82044e7e78..f0122539ba 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -72,5 +72,7 @@ void vfio_user_set_reqhandler(VFIODevice *vbasdev,
 void vfio_user_send_reply(VFIOProxy *proxy, char *buf, int ret);
 int vfio_user_validate_version(VFIODevice *vbasedev, Error **errp);
 int vfio_user_get_info(VFIODevice *vbasedev);
+int vfio_user_get_region_info(VFIODevice *vbasedev, int index,
+                              struct vfio_region_info *info, VFIOUserFDs *fds);
 
 #endif /* VFIO_USER_H */
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index f43dc6e5d0..bdd25a546c 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -56,6 +56,7 @@ typedef struct VFIORegion {
     uint32_t nr_mmaps;
     VFIOMmap *mmaps;
     uint8_t nr; /* cache the region number for debug */
+    int remfd; /* fd if exported from remote process */
 } VFIORegion;
 
 typedef struct VFIOMigration {
@@ -145,6 +146,8 @@ typedef struct VFIODevice {
     Error *migration_blocker;
     OnOffAuto pre_copy_dirty_page_tracking;
     VFIOProxy *proxy;
+    struct vfio_region_info **regions;
+    int *regfds;
 } VFIODevice;
 
 struct VFIODeviceOps {
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 8728d4d5c2..7d667b0533 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -40,6 +40,7 @@
 #include "trace.h"
 #include "qapi/error.h"
 #include "migration/migration.h"
+#include "hw/vfio/user.h"
 
 VFIOGroupList vfio_group_list =
     QLIST_HEAD_INITIALIZER(vfio_group_list);
@@ -1514,6 +1515,16 @@ bool vfio_get_info_dma_avail(struct vfio_iommu_type1_info *info,
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
@@ -1567,6 +1578,7 @@ int vfio_region_setup(Object *obj, VFIODevice *vbasedev, VFIORegion *region,
     region->size = info->size;
     region->fd_offset = info->offset;
     region->nr = index;
+    region->remfd = vfio_get_region_info_remfd(vbasedev, index);
 
     if (region->size) {
         region->mem = g_new0(MemoryRegion, 1);
@@ -1610,6 +1622,7 @@ int vfio_region_mmap(VFIORegion *region)
 {
     int i, prot = 0;
     char *name;
+    int fd;
 
     if (!region->mem) {
         return 0;
@@ -1618,9 +1631,11 @@ int vfio_region_mmap(VFIORegion *region)
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
@@ -2397,6 +2412,23 @@ int vfio_get_device(VFIOGroup *group, const char *name,
 
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
@@ -2410,6 +2442,24 @@ int vfio_get_region_info(VFIODevice *vbasedev, int index,
                          struct vfio_region_info **info)
 {
     size_t argsz = sizeof(struct vfio_region_info);
+    int fd = -1;
+    int ret;
+
+    /* create region cache */
+    if (vbasedev->regions == NULL) {
+        vbasedev->regions = g_new0(struct vfio_region_info *,
+                                   vbasedev->num_regions);
+        if (vbasedev->proxy != NULL) {
+            vbasedev->regfds = g_new0(int, vbasedev->num_regions);
+        }
+    }
+    /* check cache */
+    if (vbasedev->regions[index] != NULL) {
+        *info = g_malloc0(vbasedev->regions[index]->argsz);
+        memcpy(*info, vbasedev->regions[index],
+               vbasedev->regions[index]->argsz);
+        return 0;
+    }
 
     *info = g_malloc0(argsz);
 
@@ -2417,7 +2467,17 @@ int vfio_get_region_info(VFIODevice *vbasedev, int index,
 retry:
     (*info)->argsz = argsz;
 
-    if (ioctl(vbasedev->fd, VFIO_DEVICE_GET_REGION_INFO, *info)) {
+    if (vbasedev->proxy != NULL) {
+        VFIOUserFDs fds = { 0, 1, &fd};
+
+        ret = vfio_user_get_region_info(vbasedev, index, *info, &fds);
+    } else {
+        ret = ioctl(vbasedev->fd, VFIO_DEVICE_GET_REGION_INFO, *info);
+        if (ret < 0) {
+            ret = -errno;
+        }
+    }
+    if (ret != 0) {
         g_free(*info);
         *info = NULL;
         return -errno;
@@ -2426,10 +2486,22 @@ retry:
     if ((*info)->argsz > argsz) {
         argsz = (*info)->argsz;
         *info = g_realloc(*info, argsz);
+        if (fd != -1) {
+            close(fd);
+            fd = -1;
+        }
 
         goto retry;
     }
 
+    /* fill cache */
+    vbasedev->regions[index] = g_malloc0(argsz);
+    memcpy(vbasedev->regions[index], *info, argsz);
+    *vbasedev->regions[index] = **info;
+    if (vbasedev->regfds != NULL) {
+        vbasedev->regfds[index] = fd;
+    }
+
     return 0;
 }
 
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index b584b8e0f2..91b51f37df 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -734,3 +734,36 @@ int vfio_user_get_info(VFIODevice *vbasedev)
     vbasedev->reset_works = !!(msg.flags & VFIO_DEVICE_FLAGS_RESET);
     return 0;
 }
+
+int vfio_user_get_region_info(VFIODevice *vbasedev, int index,
+                              struct vfio_region_info *info, VFIOUserFDs *fds)
+{
+    g_autofree VFIOUserRegionInfo *msgp = NULL;
+    int size;
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
+    vfio_user_send_recv(vbasedev->proxy, &msgp->hdr, fds, size, 0);
+    if (msgp->hdr.flags & VFIO_USER_ERROR) {
+        return -msgp->hdr.error_reply;
+    }
+
+    memcpy(info, &msgp->argsz, info->argsz);
+    return 0;
+}
-- 
2.25.1


