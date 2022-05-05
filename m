Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CB551C667
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 19:43:00 +0200 (CEST)
Received: from localhost ([::1]:49830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmfV9-0004GW-2R
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 13:42:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf0q-00066c-91
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:40 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:16862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1nmf0i-0002CN-NR
 for qemu-devel@nongnu.org; Thu, 05 May 2022 13:11:32 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 245EeRAA026258
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=Jesr9CV9S2p218sXK0m1lCBen6sVEv/udbrNHytm7+I=;
 b=nMB+yUPaVdvznTPwc59K/WPrqSTCz5WqxQQyQETyYkMT4mb15D77o1V51uF672cmXH19
 n/DneVML94x1DyDKmqlUrTPEFnnSwWoTIYCngj+fKJpsWFSu69xvOaLa7ZjwzsT3aCAe
 GqTkKTcaFE6PqDTMgLoNSfBu90yK6vRLgG4ahmR549z3Hub5qWLdLM2zfpsImVM9fLXC
 Qqtexr3saSJLc9fanFZGsNPYnMAEotPwIT84RNVyr84RyaJI74eLufWjY8ExcDKJizw3
 JseZXyStD4LYWi8UABLrkea7SneKD2FBm6h7GWALwyEBK1GvfdBbMHFdlKLfQQ1IMn+5 YA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fruhcbs68-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:26 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 245H1bPJ018925
 for <qemu-devel@nongnu.org>; Thu, 5 May 2022 17:11:26 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fusah2e9b-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 17:11:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aTex0FV/NFFHGgIAuboRoI1tocMl9+mE2Nr22cO7kpGmsVdgbUi3it7ElTEgBQnrsUJUPk7G6s1uBWx9kjzVyHpDhN+wBgQpf6OWLcKLnp1LAvWiFS6B6zaiFKncV97HLBmQQOMA0ogSCOy76dC2XVeEzhrOq+F7VoGU9vSoIPRKIF7ZbwpAOaFqF+50r00IqkPRlA9FoYQZsr7UhUyC6/b6Q3vJZ7VWc1yeRONps2xh2NgD5L4FCzEmVB9nEV9aqy4lfvf0+IBZdB5b+YN0T+3Gk1+WkPY5MMuLi/lO7O4khXiLYr8mfTbJWp4pYwbz4IQNaXUqHpMdivRvkpzwMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jesr9CV9S2p218sXK0m1lCBen6sVEv/udbrNHytm7+I=;
 b=X/gfMEuGRoY4YP7pNK4u3NtLSyT6b7eQnOggAEVqCtvR7bV2TKgnXwYFtwF80w4AA0b4d93jvfU1wHbfiBmnZQpvyRY66Sg/owD2SgvBG+DV6hhzFs+VlSvYFGIHK8/Ij99YAGmH+9G74BNFsfcOaisZwpjQJG2T0GI/yNfZYc1cADzFcYzoscTysZVH58uCptlyV8ZRnYYQBMDsw+MIMJR7O9pXPKHpCa7uVIRFNeufEX0P+bP5xBDX9SkqMt7aPtziRVzjpFoBINNoaP+R9IkNCZsT1ZuejBx0iQCUF/f+E33+6mB3GfQ0OxlfnjXW0aSHMCYREL0nMmlvPtdTug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jesr9CV9S2p218sXK0m1lCBen6sVEv/udbrNHytm7+I=;
 b=MCVAhlWW4Ai4yNO8zFe9NTzJabYbgbF5jQnL1kSDEV6J0AuyU7QaoIvXC7BT025FmG75qd2pbZ0gHGnAhkJCMOWJC4P8Da9LzFMSazdXLkFJR5qMfxgz8B4JGNGl+x0aI1HBCYaqT6Yu6bfxTcBRLAdtQyhL6YDS/FS3frzsz7A=
Received: from BYAPR10MB3255.namprd10.prod.outlook.com (2603:10b6:a03:156::22)
 by DM5PR10MB1867.namprd10.prod.outlook.com (2603:10b6:3:10b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 17:11:20 +0000
Received: from BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05]) by BYAPR10MB3255.namprd10.prod.outlook.com
 ([fe80::cce6:1c15:c6bd:dd05%7]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 17:11:20 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC v5 10/23] vfio-user: get device info
Date: Thu,  5 May 2022 10:19:53 -0700
Message-Id: <af7ad673db33e405dd7959640719947e6a0b8675.1651709440.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1651709440.git.john.g.johnson@oracle.com>
References: <cover.1651709440.git.john.g.johnson@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0048.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::25) To BYAPR10MB3255.namprd10.prod.outlook.com
 (2603:10b6:a03:156::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a43ec9f7-1688-46c0-b70d-08da2eba4540
X-MS-TrafficTypeDiagnostic: DM5PR10MB1867:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB18678A299C1B1DCBFB8CEC2AB6C29@DM5PR10MB1867.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yJ4gnbiFBSjbYuDn2lYLGEFkZxg8ldjHKqQcL5i1QlcRGYvtBn4t1fRMD96GvbADxQ3bIdT3rGIOPmN7zmV89k1kFFnqNojHzU+iZVfvUMZu7uN2Zt+Pm0I85h9EbT+qtCeUIpk5u2nJteBVkua+MQOZbw+ruUTw7gXQZ0mKvZHpbYvVNuU9sjT6WisY/Q8rq/+Oio0s8zJguqXXCT8gYL01O4A6bwkRar4IX+IrbPGapON9Km9Wuq69juwZq5qeSeqcDiCDab4tugS8J/OZEAk+C0ZFP2P6IxFTK9PJsXUAimf6uY15BqXQX8yvIOsLO40I2+sifcvgtbrIpHbIwJ2lGGTvxNb/UhpfIZHizEYaje7AGEwU+AOqoThHw1V1+5v3Zqeik+7lXsR5RYNpuNdd35t5XIXl5gSLQ6PKtE02V4V2LIhNG91Xv+Efx+1igpHrArDRWha5ddUJdQq3kgOm1y9PygjLEH9jpgJNDjSsz1MJJGgAnTWVHBdz/XfKfBCaFXTtzRdrSzbZ0Ru2Ii8lgOLTXdXDyqagBR0j1S9XR4+rW7svBmOrHE0/gdN2DCqoDGSQtjQkAqqspO2CHC8eG9BwqU0yob3pQy6W/AQ/7BkzUL8tOfkYMBDgEyfWzW+0zSwwQz+K7tCBILezDNDrbjFkwqzW30KcwbIzJTXK4Mq5pb+Z5knAXCxNY6U58INKlQyBS/dVJviEWY+Lhg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3255.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(52116002)(6666004)(8676002)(66556008)(66946007)(66476007)(8936002)(38100700002)(38350700002)(5660300002)(86362001)(508600001)(6486002)(316002)(6506007)(186003)(83380400001)(36756003)(2616005)(2906002)(26005)(6512007)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IuIaFnHVSl4PKC8Op37SWERlut1jLvn34+w1qQBSCgiWTJlZdDGjFTgFD0LD?=
 =?us-ascii?Q?1Uk0nlu8XjY9jLPXN6y05EyXNoRcLBPE3PEPNw8kQ/NxWn9mHddjaVxl8My/?=
 =?us-ascii?Q?MZzEX3xxa8CRS5c+J6DpW9ctaLuEA5Nj0x+VE+AQhwrc5Iw01XT8srkvvjQL?=
 =?us-ascii?Q?q3ZjdSQ9fYbSP/em6nz8Fo1Fzq82E2iQsPRs1RKl5zs0LWMqY2ttg1ng0zxu?=
 =?us-ascii?Q?o5+ecOQPfG6/EKbES4ght7ceF3dOi9LEHapyjP8vLa+q3mOYGrXDashlqkSZ?=
 =?us-ascii?Q?OujyS3bDtobj7gipW6Hulcy/1NXmhf9oLsF0li+mYRlmMKdpQKp++NaMgNCx?=
 =?us-ascii?Q?Mfx1QX8LXcoaz32UXxmNaoCWaxj4qYwk7AHddcU2qYOZZYhruw7W94teDGan?=
 =?us-ascii?Q?eNfC4t7haS1FxzoDVA/veSCU4gpf/A9hhZvYco+5C/paY7uF9ddvEYzup44Y?=
 =?us-ascii?Q?MWN8IfnmE1rnqXnniqxNBoDC64t+lakScIbWitf5G4d9eJvKJBeM3uJRUAws?=
 =?us-ascii?Q?1j55Z6fuGLJ5+hpTdLeAt5cO4eYI5KUb38MwJV9B2JOIDL/yndyJgWc4oTS3?=
 =?us-ascii?Q?FyUnvaIvI8+BYBCTGEL114zlzetHz/02+2Sw/+jf+T0JkzgUJCOPDlQADPnv?=
 =?us-ascii?Q?paNckIWDt4k0QgXunkoz5m1mcVNZWj2wqOhLWf+oRzgoePgqYuzWnSS2yL14?=
 =?us-ascii?Q?2VCZjdea/p0iB20ataRJDpV8XsttKLQdso7RuTkwDtLxAUtC5ERu9GC5koXi?=
 =?us-ascii?Q?LLELcocH7RjZQcL0ostmnKTceW/TJ0yh75OwBcOg0RFjK1i9lejWtRQBFar4?=
 =?us-ascii?Q?fTMUeMZxAmJCzRHyApD7pNO+SZLpKMCrPqoigGJFTXuwNk8Gy/or+tJ9MovX?=
 =?us-ascii?Q?LkMhU1GZZfOsDXu91s+GKPF880JycmZhdbyaSCSZm+9f1h0t4LYv5RhRSLvG?=
 =?us-ascii?Q?Eo4bMM1uj+6/mFu+cx0UShPm6nqOP5gTbTWm7qwiZuHtaYXDd5xlrD1FG7FX?=
 =?us-ascii?Q?+knK4oSs7NqvouhYOXQ3a5/qCx9yztcJNc08JEUYSfwZHXucYHWD5xD6s1D4?=
 =?us-ascii?Q?yFLl1fGekAKRSwtVt0PFGzWvyaOgzXqf4BKznQ4SKy6g8KgAG1Ndue5bNaDq?=
 =?us-ascii?Q?9zCZvTd/OA6xRtmZoaS47TY6Iv+80AVNr4wNCbevoDLko9ioc5jH4Cp154og?=
 =?us-ascii?Q?1kUKoOg6Vhkpp/dBKAo34Q298u6epEHri0FfOMhpt/A4ar1Lx5245KsvlLS+?=
 =?us-ascii?Q?63oBG8v17UCDi3KSRc/wkdgL6RdEW5J6p7pDESdXLkONe2tWJTUEQV0iTza5?=
 =?us-ascii?Q?3t2RQroe/q1X7TxpMoX8QfNtlqjbGilKbwcct5lDfZdRaiap0B8WN997uXcv?=
 =?us-ascii?Q?Y4N3Zu4mSATIZCXbKmnpkau5veJU+oi8PIgJi/W7EBtv2r5/nWedYmyDx8IH?=
 =?us-ascii?Q?g3WTv20YFJPSwkPruoprBRGsyXFDGzPnIND+To3bRCcTahVsyCjj8xSgPTUh?=
 =?us-ascii?Q?8EqD+Xx2oWR4qQnH73B0K5B1ET0WZgUM099/uDLmDo/agcYPX8FAgAqoC7Rz?=
 =?us-ascii?Q?3mn6QEhwtRdggKRwjP5NQFRq1YzawUTgomNNJEIY5QDI5DMtnBFKAnBzbTVC?=
 =?us-ascii?Q?dhBom32CAhFWwzX2J9f4uUSUqbZw8SV3wKQtuQa7TiWtkV624n932Ki2RR2G?=
 =?us-ascii?Q?yzX5lqz05BIr/yJHmRjtpeJeOroy2z3mead72BN+Cs9LdiP4yBeMcseH9LSE?=
 =?us-ascii?Q?mn/nymKg0DMkeKCHuFSbwXLZjI9rtxM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a43ec9f7-1688-46c0-b70d-08da2eba4540
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3255.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 17:11:18.8572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N1xfvC5h5gu0w20bgH7oFkcFI/zJNIaQZqXeV/ddyT0W4jjne+b/womr3f/Vsn9BNiH6pAb7FoGkNDahv5pHAVRcLWJ22mK5Jy0PymLK9go=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1867
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-05_06:2022-05-05,
 2022-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205050118
X-Proofpoint-GUID: HLQF19FUBZp27k3vsyD5OcTEU-tZUt3R
X-Proofpoint-ORIG-GUID: HLQF19FUBZp27k3vsyD5OcTEU-tZUt3R
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 hw/vfio/user-protocol.h | 14 +++++++++++++
 hw/vfio/user.h          |  2 ++
 hw/vfio/pci.c           | 26 ++++++++++++++++++++++++
 hw/vfio/user.c          | 54 +++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 96 insertions(+)

diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
index a0889f6..4ad8f45 100644
--- a/hw/vfio/user-protocol.h
+++ b/hw/vfio/user-protocol.h
@@ -92,4 +92,18 @@ typedef struct {
 #define VFIO_USER_DEF_MAX_XFER  (1024 * 1024)
 #define VFIO_USER_MAX_MAX_XFER  (64 * 1024 * 1024)
 
+
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
index 00d21bf..633b3ea 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -85,4 +85,6 @@ void vfio_user_set_handler(VFIODevice *vbasedev,
                            void *reqarg);
 int vfio_user_validate_version(VFIODevice *vbasedev, Error **errp);
 
+extern VFIODevIO vfio_dev_io_sock;
+
 #endif /* VFIO_USER_H */
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 7e5b910..68d6f0c 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3416,6 +3416,8 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     VFIODevice *vbasedev = &vdev->vbasedev;
     SocketAddress addr;
     VFIOProxy *proxy;
+    struct vfio_device_info info;
+    int ret;
     Error *err = NULL;
 
     /*
@@ -3455,6 +3457,30 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     vbasedev->fd = -1;
     vbasedev->type = VFIO_DEVICE_TYPE_PCI;
     vbasedev->ops = &vfio_user_pci_ops;
+    vbasedev->io_ops = &vfio_dev_io_sock;
+
+    ret = VDEV_GET_INFO(vbasedev, &info);
+    if (ret) {
+        error_setg_errno(errp, -ret, "get info failure");
+        goto error;
+    }
+    /* must be PCI */
+    if ((info.flags & VFIO_DEVICE_FLAGS_PCI) == 0) {
+        error_setg(errp, "remote device not PCI");
+        goto error;
+    }
+
+    vbasedev->num_irqs = info.num_irqs;
+    vbasedev->num_regions = info.num_regions;
+    vbasedev->flags = info.flags;
+    vbasedev->reset_works = !!(info.flags & VFIO_DEVICE_FLAGS_RESET);
+
+    vfio_get_all_regions(vbasedev);
+    vfio_populate_device(vdev, &err);
+    if (err) {
+        error_propagate(errp, err);
+        goto error;
+    }
 
     return;
 
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index dc3f1a6..51e23dd 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -30,6 +30,13 @@
 #include "qapi/qmp/qnum.h"
 #include "user.h"
 
+/*
+ * These are to defend against a malign server trying
+ * to force us to run out of memory.
+ */
+#define VFIO_USER_MAX_REGIONS   100
+#define VFIO_USER_MAX_IRQS      50
+
 static uint64_t max_xfer_size = VFIO_USER_DEF_MAX_XFER;
 static uint64_t max_send_fds = VFIO_USER_DEF_MAX_FDS;
 static int wait_time = 1000;   /* wait 1 sec for replies */
@@ -984,3 +991,50 @@ int vfio_user_validate_version(VFIODevice *vbasedev, Error **errp)
 
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
+    /* defend against a malicious server */
+    if (info->num_regions > VFIO_USER_MAX_REGIONS ||
+        info->num_irqs > VFIO_USER_MAX_IRQS) {
+        error_printf("vfio_user_get_info: invalid reply\n");
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+VFIODevIO vfio_dev_io_sock = {
+    .get_info = vfio_user_io_get_info,
+};
+
-- 
1.8.3.1


