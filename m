Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C832B47D833
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 21:14:41 +0100 (CET)
Received: from localhost ([::1]:46824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n080W-0006cS-2R
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 15:14:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07VP-00053L-8h
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:31 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:29066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n07VN-0008OZ-3U
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:42:30 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJXwoM028486; 
 Wed, 22 Dec 2021 19:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=O1zvOkHtw2VovC7NTTfDUOwga8ADZKRv7dvwBwYKSjU=;
 b=k5eLY2uLQbYNVKu8gKNNuRxXEEE3pC4NUM/LiLAYSuJ/GsvNE0yUmnAz09q3zLfNaRwR
 hDCE3i7ktc4hsk0dSWGuQnl5+RNUTKc9t1Euj6OCFSXSU4w83kGV8RM5NolY7sg9QbxO
 zVaKgIUdjzLQj90w6yU/HoHYj3M15hbYIW9kp+fBY57ZZDvTNOJLN/8yQM3nxOxWM7X1
 GxFOKNdnAin2FHp2ZnFclsg4NDxfGTrx7k58DITubSk5FTwOYLjszN/ArG2h82CvmglA
 6hlPMjSNt4vuZTwm7zXf3ml0TjZtjMKX+jeafOTAHwzKxJkB1JJYl1YSv44QZgSnHbm0 rw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3d410397kh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:13 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BMJelTj030497;
 Wed, 22 Dec 2021 19:42:12 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2049.outbound.protection.outlook.com [104.47.56.49])
 by userp3020.oracle.com with ESMTP id 3d193qamws-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Dec 2021 19:42:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WAMZVbg9fcmOVUYC2crODMPGbSrTIGZcTwKFwgxjsFsOBjGfxUOUuE6ndlrd+I/q6Q/vU/ZLWIHbbf2Qcj4hlvWXFFNRFM66LlKcjbxVzobaofh83S0MpCDUkA111BxG2WIgvQGs6lUZrCZSeRL57WAPjvAWSNYt3BVS2xdkNRHV4TWugItJydriKZVDldn5kMRc1JTycvsuuor8JdBAhr5a4sEY9hOe/VfrQ435jVr+LqTGamtnxZVZ403BX9esu80ehPsq7ZxO7uLuHH4DYt+w44GrB6z0bv1t7pMsz3lX/47La7SuLUQR4IGfNc2Qew3XiVJzFfgmcHzIzi2zRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O1zvOkHtw2VovC7NTTfDUOwga8ADZKRv7dvwBwYKSjU=;
 b=ZOcm5NOIeHpoPYxQVchIe5dZvHlJc7VHDDeL3iJbmfA8cD7PlPdzCr7IqK2Ot+WnWIIBP3jZogtK5FOpHUJbvba7J2NG560Oqfhz0cEy9whp2ZSR9pcZXLE22udVuowseeyZaX8VpvjqKHfxYrgx4+dUWrTe2d8HsXEPZYl7TDSPLI5ktko++g1L6uHEsRrjKgxPYc7X2QKMBHVVnaeiA3cL2QAh6iF7iQjC/YdvL/orV6649Bc3aTwEg90ZADGG/F0nfXLXFj/MRXzMmRUIryP5mTko+wd6XIrjgT0sFcm42MYnl09jpXYlrHIRclIHfAg6+SYclkTlVrztvb1qaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O1zvOkHtw2VovC7NTTfDUOwga8ADZKRv7dvwBwYKSjU=;
 b=zoLzQYMq968CNhhXNjhHvG+pBuTQsgvNRQe59NnMzj1WocmsqSBO55H8VYTA2mDpFS+yzW4uBnHAF2JPWDvTzffbVMEuSnCsEydmZvMoZErjh30V23EpVqbnpSCssxRoups4iQXjPy02Q+DKo44ge+u4DoVVOjdlmgKHQe/ksBg=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB4242.namprd10.prod.outlook.com (2603:10b6:a03:20d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.16; Wed, 22 Dec
 2021 19:42:07 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623%4]) with mapi id 15.20.4801.020; Wed, 22 Dec 2021
 19:42:07 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V7 26/29] chardev: cpr for simple devices
Date: Wed, 22 Dec 2021 11:05:31 -0800
Message-Id: <1640199934-455149-27-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d0d30a8-fa0b-4df6-9bb0-08d9c583237c
X-MS-TrafficTypeDiagnostic: BY5PR10MB4242:EE_
X-Microsoft-Antispam-PRVS: <BY5PR10MB424249EA6199CBAACBAAE987F97D9@BY5PR10MB4242.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:281;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BRYwsFwTLy+q+f4QXmW8k04SXxqX69+DsVLJmN/F5asDXND3+m1QQHUEprp783h98lMVcR9X/TBD6dLZKyuNqg2cPFoX0ZN6ig9D0kGNKICydOcoBZygiMj8on1npz8QpXgvqZ8KSJHABfKlNbhFTKCuNL0x2aeu7uwu9cre1MquWqf7YwJkxaX4Euc+Dv72anTp90ck5+BYk70Q/XgqeOl3mI89uzkHvIj5EQL77G/bB23EO54FuNxlJ6Lv9wYgDc2qNMwEiNHHIR5BdSZbjeuG7QOj0Zyt2sxVloLAez0b+9pAEi3hDcHW+wlxkm/S/J+3d32ZGUpGlEQGfrif4wD5RXPiOBtycEutyeBY8uykss7HHd11kPVx3i2GCooxT2OudI0jI+/U5dCi3mwp1Y7JAW9KI7WmOIxR7GQQg30PXPjZBCOLYBKAEcTG1wgoAUPEFoykXy4BUW3clKggMotclt3PqlFF2pMjOuH+ZuUdClhoDgMF7g593Q+klVjkigNZTbzdkDgLGEw2vNy3JqERfQMfHXFeghQmNDvkKn+r1RwDRAUaQ99bFeWTObf+kzWDiVxVlszh+pod+Q1q8c7MUgoOCBr9JZO4LcznrfWf3YWR/71YOByqJ+d9aaT1vpr1xyf7hSAv4bt0QxTKH99r2znl+DWw21Y6rl9Bc0684ou7xiIbElbSMCiUBM89TxyRxfAqJpKBCM9D819g4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(83380400001)(316002)(6916009)(38350700002)(52116002)(54906003)(8676002)(7416002)(38100700002)(8936002)(508600001)(5660300002)(66556008)(6512007)(66476007)(6486002)(36756003)(4326008)(2616005)(6666004)(107886003)(66946007)(2906002)(26005)(86362001)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O9tPM6IpW51i/EWypinjpQen89Ay4OxI8jPzKlJq8WUo4HnYLhQTP/AJGLf6?=
 =?us-ascii?Q?JfBDBYW+uyr0UNvlRMTPaKXkqkVwkMUh7e8T28vGgyfbigtrCzmYsjjqo5GY?=
 =?us-ascii?Q?MROEel6gQIxAPKNGXCrOxz35RSNi1M93SMfN2JifnraKdOf2zi8oztIlD3tH?=
 =?us-ascii?Q?vsuGq3WCbIriZ8i/xZpL4DZCou3P+DIaaJR3RvMwqimQP8JiF/4HpBvN+Hfc?=
 =?us-ascii?Q?Tgd7hQR9GV34ObdAKsUlT7H8gd40YcSwd3b/1iEAx04NYn6903sS41j3GqSu?=
 =?us-ascii?Q?QvoqeqtepIvu/WdrHrfIxaQndntrQrU87BQQjCRklxM3BxasSKL9qX8m5EZz?=
 =?us-ascii?Q?5hE2xS72jTNPqXNM+oF+iWMMrvVTMG11RbWCXX4jramto9FAu6+exHczRpy3?=
 =?us-ascii?Q?Dtz4dUjK/zjLWrNlapLBY3X9Mz3v4pwB/UqG4zEOnkwPz1QlA7YR3e7Bz7ch?=
 =?us-ascii?Q?n8WRXlraD6qjtiXjVhbyj2Z8fxXOPAQLqx4SXTzTlhaYWC2Y1hHcjcrK8Xe2?=
 =?us-ascii?Q?wMmfjlwMCBHAthP54Cx3oJ2t7IzsptuK6/WuqkW7aIxdbS/lT+YFpRX84ELQ?=
 =?us-ascii?Q?WLAxlJWoRc9TIZDgPzyGqA6Ssps+dzDAUCRWLu3nSk7ndYcV7tpUpUNUkJ13?=
 =?us-ascii?Q?mADhTwMZ7UhBTMi+DuAaclZrQb0nSI3xrQhp0tKnF8JxvV2dV7iNRrag1CHs?=
 =?us-ascii?Q?ZSPayyAMXVlZrZKCFE1itsU2nFa0zjABf83wQxTnZBbHtl091Slui+TbOjcQ?=
 =?us-ascii?Q?2R/bAqhl8oaZGV3fXqxUHhkAYBYZJ+yE0Ym6IFFYV7AnlpxbaQBXxUOqM7kk?=
 =?us-ascii?Q?XbEqokS0jadIrJ04VxUmQc47x+CrvsfP/bvnbjB/ko+ITyxD8BezTEVCTrME?=
 =?us-ascii?Q?Ld1G2gRqyONa7dMO87Pnk6p/365PvQWA3Je7r6qBOmAx/AtywL/ZmjFVzm5R?=
 =?us-ascii?Q?yR67XGERYviPqlbpH1FiLD9bvGSoh8aGhGsafL9DIOnc9VdQCjq0OfQQpgXt?=
 =?us-ascii?Q?FYNsejSkaD6UOa3NfmKmpKpDSnCGoNaJigGL8Te0KsTqcX2taMipKcbkWAkc?=
 =?us-ascii?Q?spy41qy6dZabBQvBQnsreqTTd5cLD2t+22GNBTb83XrY5ok1xYg5/ltyyxGf?=
 =?us-ascii?Q?WnyNuZSw/bBUpakS/KoUSvy0rLiBc+tX2PLl/McRM3WqrhPXjmc4C3cygJ7O?=
 =?us-ascii?Q?Vo1NQhVlg+W/IOWf/c0pyqE8XAHnRRti4OOpkCQIh5zHIPkWimQ3TvzfMeGQ?=
 =?us-ascii?Q?052UgdHFtCi3tXLeidJO3ygj6684ry++SnjWQRJbdQANR0K+Gm+pMbTnKJa4?=
 =?us-ascii?Q?KRr4AOuj+Z7WH1Q8dlVykZ9Rc9ZgEe4iGaEqZHAx/2WRIdRZp48SAJt07MF7?=
 =?us-ascii?Q?DVvnGp9k9GEAyORP7Bo3JEPlNiuDqdSy62mI7kG9wgpVUS7m3pitJAj5h3TU?=
 =?us-ascii?Q?rhXubHe2YZWBP6ufsOBdO3a0n5HRb0JMyy6V+Wn5X3PKggbSKeM0D+LQInx3?=
 =?us-ascii?Q?eTp7lBJPbNCFtQDD2DKDPy9jf02V2vxoaEe5TqtBILeA6C38wu7pkrec5mlb?=
 =?us-ascii?Q?HsYpcpNsI51a9apTOi5Xl12164n+75vyf3TimikrQ4/unjZMLAiLq+MDQNDS?=
 =?us-ascii?Q?AW8zHRzH9xrI2OQ3xF08MlvOoWOHgdZo5xA0WjESKt6bynHMPCZVdoN0lD/f?=
 =?us-ascii?Q?so204A=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d0d30a8-fa0b-4df6-9bb0-08d9c583237c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 19:42:07.8267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A6PokcSBoMH8J4LQZp78FDv8pSQ6Vh900rfUUoW1fa5eQB2mTxKcC/1YUxkJA6knIEs84Y6StPbEeyukzuZ3Te8owI+HosqbyKyeoYKKNhc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4242
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10206
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220107
X-Proofpoint-ORIG-GUID: dXAfZyB25FjaYzW8xCnh0Iv6lP0iWEj1
X-Proofpoint-GUID: dXAfZyB25FjaYzW8xCnh0Iv6lP0iWEj1
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Set QEMU_CHAR_FEATURE_CPR for devices that trivially support cpr.
char-stdio is slightly less trivial.  Allow the gdb server by
closing it on exec.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 chardev/char-mux.c     | 1 +
 chardev/char-null.c    | 1 +
 chardev/char-serial.c  | 1 +
 chardev/char-stdio.c   | 8 ++++++++
 gdbstub.c              | 1 +
 include/chardev/char.h | 1 +
 migration/cpr.c        | 1 +
 7 files changed, 14 insertions(+)

diff --git a/chardev/char-mux.c b/chardev/char-mux.c
index ee2d47b..d47fa31 100644
--- a/chardev/char-mux.c
+++ b/chardev/char-mux.c
@@ -337,6 +337,7 @@ static void qemu_chr_open_mux(Chardev *chr,
      */
     *be_opened = muxes_opened;
     qemu_chr_fe_init(&d->chr, drv, errp);
+    qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
 }
 
 static void qemu_chr_parse_mux(QemuOpts *opts, ChardevBackend *backend,
diff --git a/chardev/char-null.c b/chardev/char-null.c
index 1c6a290..02acaff 100644
--- a/chardev/char-null.c
+++ b/chardev/char-null.c
@@ -32,6 +32,7 @@ static void null_chr_open(Chardev *chr,
                           Error **errp)
 {
     *be_opened = false;
+    qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
 }
 
 static void char_null_class_init(ObjectClass *oc, void *data)
diff --git a/chardev/char-serial.c b/chardev/char-serial.c
index 7c3d84a..b585085 100644
--- a/chardev/char-serial.c
+++ b/chardev/char-serial.c
@@ -274,6 +274,7 @@ static void qmp_chardev_open_serial(Chardev *chr,
     qemu_set_nonblock(fd);
     tty_serial_init(fd, 115200, 'N', 8, 1);
 
+    qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
     qemu_chr_open_fd(chr, fd, fd);
 }
 #endif /* __linux__ || __sun__ */
diff --git a/chardev/char-stdio.c b/chardev/char-stdio.c
index 403da30..9410c16 100644
--- a/chardev/char-stdio.c
+++ b/chardev/char-stdio.c
@@ -114,9 +114,17 @@ static void qemu_chr_open_stdio(Chardev *chr,
 
     stdio_allow_signal = !opts->has_signal || opts->signal;
     qemu_chr_set_echo_stdio(chr, false);
+    qemu_chr_set_feature(chr, QEMU_CHAR_FEATURE_CPR);
 }
 #endif
 
+void qemu_term_exit(void)
+{
+#ifndef _WIN32
+    term_exit();
+#endif
+}
+
 static void qemu_chr_parse_stdio(QemuOpts *opts, ChardevBackend *backend,
                                  Error **errp)
 {
diff --git a/gdbstub.c b/gdbstub.c
index 3c14c6a..137deeb 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -3569,6 +3569,7 @@ int gdbserver_start(const char *device)
         mon_chr = gdbserver_state.mon_chr;
         reset_gdbserver_state();
     }
+    mon_chr->reopen_on_cpr = true;
 
     create_processes(&gdbserver_state);
 
diff --git a/include/chardev/char.h b/include/chardev/char.h
index 299e129..fc24d28 100644
--- a/include/chardev/char.h
+++ b/include/chardev/char.h
@@ -327,5 +327,6 @@ void resume_mux_open(void);
 void qemu_chr_parse_vc(QemuOpts *opts, ChardevBackend *backend, Error **errp);
 
 bool qemu_chr_is_cpr_capable(Error **errp);
+void qemu_term_exit(void);
 
 #endif
diff --git a/migration/cpr.c b/migration/cpr.c
index 3bda83e..eb8ce2a 100644
--- a/migration/cpr.c
+++ b/migration/cpr.c
@@ -112,6 +112,7 @@ void qmp_cpr_exec(strList *args, Error **errp)
         return;
     }
     vhost_dev_reset_all();
+    qemu_term_exit();
     qemu_system_exec_request(args);
 }
 
-- 
1.8.3.1


