Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D676F3CCDF6
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 08:32:51 +0200 (CEST)
Received: from localhost ([::1]:37814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Mpe-0004Ca-Pb
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 02:32:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1m5MlI-0004Ch-A7
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:28:23 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:12022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1m5MlC-0002Hv-Ek
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:28:20 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16J6FxMW017887; Mon, 19 Jul 2021 06:28:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=JoSRHchFLZc7vB7+cNiCPubvaI91cmiZGXjF6WeqNpM=;
 b=vYKtnHkRaupj6zSdGCVTdstc4F6O+W0Wd0G+S2qpG0QqKagNG9yxE6Nlz95dYfeB6OsI
 Cd+Mx2ob1ATxtvLeOHzTW0eIOm0v8zipwAxMjNCRurNxk+n5UTJHkR7RIPM8Ot78wSIW
 wlorP9Ff7CLjEEshdQJ/Zzg3cJ1yyCC8poYkQBpe4P/fJ1wYxqj2SiTw0HWRSO7Hocs6
 rQF5NjVkGgVSLNmfxnO7zYN8YRT6oF7O2voLF/ii6dHV0/eaeG1mZyq7YyxbimWIkNh7
 BU3MHUX7rJaKzwyjs7a8hZk6/pxUPOE9N7S4zk1v81vOhBDTCHksCYzHfWQZY+W8zw9x Ow== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=JoSRHchFLZc7vB7+cNiCPubvaI91cmiZGXjF6WeqNpM=;
 b=X+V/ZOVZ1uExfzuBaNIdp3QsZLe9KSn26C2slvqjhgw3KyjHigXkRelCLvZ7PGHICvb/
 dz0gs+GGIj3J7GlFWGHk0RDvCsUrB8nzlLxFCdMhKpV6noUQViRBO4elAWoQBnxFPi7C
 IT0jdmqWSwA7k+235sLPEd9QsBP8XqqNxjOZx0cJxF1eBV/Rzhz7PqydTVjZtZHuAZ9C
 UvTO/Kc6/gA7BFltTt+30wPLDhljszD4x/TacD+8IR67FtNGLN/kwJsZOAxOsk5+3AdH
 MrNOjNqMq/JcRmcN/O/YLORaPJ5IdSDdNnNokfH92qDKzNkvSD3gsyFwur2+ylOQdaHt oA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39uqrtj615-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:28:12 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16J6G9T9086873;
 Mon, 19 Jul 2021 06:28:11 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by userp3020.oracle.com with ESMTP id 39v8ys1vt5-11
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:28:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QDy4/T8D/l49jYtgjn2/URET6iEmgC6WT0mxdsZfr0UkZVMqtFXVyveCznP/k7Q77czYqDNVBhYbUo9vVXDRCpgbdjhkblfTKEualVJOBbD6RyGGJKZEYnDjFQO/6u9etMUnGp+0HXgoaDCIK0NHD4+3IIuy3bAZl4WBCKEnW9MeHjApbzbDfR8agIE9iXtChnh67o7uUY6+sxQ9E6Yg/P4KCl707vstCDoicyxwbsOSnhQxwyVqs4bKD7w0bYXfGsBDIEMO3KlViWhWFWC2HTELcyfdhABwSIontu1DkEKhRlW6NuK3cMbHVPc5HkeEA2kEuNy8Ogq+qItFyXTBNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JoSRHchFLZc7vB7+cNiCPubvaI91cmiZGXjF6WeqNpM=;
 b=RpI7RSXqyH99XVyBuuITQE6JeSYuxO0X9E2ZSef4vmf4J/vxI0mkrsnYo0H/Sx/2zZ+oQ9xrSfwExH+TJ+cRl/GaSrbpiAq+HY2zDQzNWNljjHWtSQfJoH3ZKL+DBOSWX9epnOQjxJQZi04RXp99RdpMgJz/Un9ZoVdC8JSzzV4k9vYOIgiwO6Bq/rt5d1asJ2OSK7wwYDKLpCqH/UBbCIU+7VM4NLd4B3Zznk/asK3srI/ck2zroCBB90DlFKG9+Nqg+Mdkcvmhl9mZ+Ag4fW5iT85IFIAzyWsj2KXjYXVhixtrGJBmhBsKLDx109Sj9phItV+1bpPVNa26fleqzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JoSRHchFLZc7vB7+cNiCPubvaI91cmiZGXjF6WeqNpM=;
 b=TfeWNWpNBVAEQUFKaZ15NzSPNtcUAA5SRYSC4NXVU0maaxxi5dOd4MjcI58TPyRSiMzckAaCo1yF/IgTB5P/szAuKW/+AIg7iueSp2GPwnaD/UoHH4U2KJjw4B6KhPv/RDJ+Cw0vu7xgPD7yJgh//R+d8PAdtzvNNLC3DAlu7ak=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2869.namprd10.prod.outlook.com (2603:10b6:a03:85::17)
 by SJ0PR10MB4814.namprd10.prod.outlook.com (2603:10b6:a03:2d5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Mon, 19 Jul
 2021 06:28:09 +0000
Received: from BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539]) by BYAPR10MB2869.namprd10.prod.outlook.com
 ([fe80::5891:a7dc:5c2b:5539%7]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 06:28:09 +0000
From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 10/19] vfio-user: device region read/write
Date: Sun, 18 Jul 2021 23:27:49 -0700
Message-Id: <d7e6dabf09b687af0e006468001cafd54d652c0b.1626675354.git.elena.ufimtseva@oracle.com>
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
 Transport; Mon, 19 Jul 2021 06:28:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae1bbe3a-1805-47b9-cedf-08d94a7e6045
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4814:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB481402E53C6433F6309E730C8CE19@SJ0PR10MB4814.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:96;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YQBqyiKm44m3cArzIDgM6a+xpEvWv+oerjE0uQrG9DR9/Kk4IiAnekZK7ZTrNWAaNrDSuysoRnygN7f7VDB3rNtEfZrfYtJPwJPgtiDYhn0AuFPwqHoOeIl+RhVPr2AwP/Dzm+4DE26mF0Pf1jXyd3Us+L8LMko8ef3hF7mYxKuZXaGuIg2D2epI1/I91yXAheF9akwVOcs1veAsBrmfYvrb8wbzHQxM2BENRjetZKr7axqiZeAQ1IpRenq74WRFBlGnDcRZaONo2Y1sPCUuhVEp08heFxvZtl+fLla955TG/4R5r7dn8dAmWJ0jLp85p5yUv0j9zxx1Fxxu5LdzuN5I/zT4QIWnTWRkXFE0jdnYlz+fZ2FO26FQ1wOqQfOmRa2pMIEO3SzcUANGtpBe5exzGmGNXYd8kPdaqQWJQ9Ki14JyOCQryQMgzuAX0LHck6SotLeaOUkKv7m2K1kBqfRPuvMvUtvG0BfMDun+q0JgNqCn+U0BeU3hFkp6aL5ZK6bZR31Ar+KBVMgexy1HfTjGiFn/JzHtJVJ+Y5WM6ZEQtvQgHTwUIMuYw0ChQTQhdL8NEOddZaxirgtXUlXD9IaLUIlZzVEvS+7YMVg8Ou85piCiBuxIIlM79oaWusFZZkAHFOKhviqmZuWSPcwptw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(366004)(376002)(346002)(136003)(2906002)(6486002)(5660300002)(316002)(6512007)(186003)(66476007)(44832011)(66556008)(2616005)(6506007)(38100700002)(6916009)(52116002)(6666004)(8936002)(86362001)(107886003)(8676002)(83380400001)(66946007)(478600001)(36756003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b2i/G4Kgvjwb8Ay1CkXisetF2k8jV6KuuyIeb5T3SxWn4DRQ0XAP0pNhZURF?=
 =?us-ascii?Q?IilkNkCPLkMkQq4hW1tpR66cdPIHBKhRNTKhuhX2PkY/ShCcOCC3gYWDkoxz?=
 =?us-ascii?Q?k64KH6KN4ta7TJh99V0WRLizv8MUYATnYviLqu2QaqnR9Ve6cO2ZQ/AAxnPx?=
 =?us-ascii?Q?+k0r8EMPQXG8QQARLVVyA0SAzdm3/FMI2sgkVKIJEehazj8icQ8UTRBSpEEq?=
 =?us-ascii?Q?NdrT9pkvtj/7HoBid1cRDFzHBabc2TuD4GybOLWvV0ROmRKLlw3gK+2xZy/L?=
 =?us-ascii?Q?2u9yrz6PnFqmEkBG/JS2d4hQWnbTJwjhigUZZmyLcATVKMfe/L/4sk3LTaKG?=
 =?us-ascii?Q?lnLn1N/cqE8HycITC4Ay5Ew7yx2cfP5ZErhgJjql3V++Gabwg0WRvtJaQxNh?=
 =?us-ascii?Q?NUKlQC/sM/oNGH9YJa2PFnwqNpH2sWCwxJSjAFr7j4TqxIIBXNqo7s8NVabZ?=
 =?us-ascii?Q?67+Vn6hnc4VnHKIZ3XjehjIaDfumVy4a0CF2dO/h01WJJN2uYg5KjL+ejIfF?=
 =?us-ascii?Q?GVySZhJOUvKD4sPMAM792YsghnHMgafFztID3n411Kut6XsTmuPu7rcJfPhY?=
 =?us-ascii?Q?EPVCq/xAWym8UMgVQfIqOVywD05G794yMoopEECn7ZVZgE0GLrV8V1r0DtLa?=
 =?us-ascii?Q?pqmm4uJdHmQxNQovdnQUJ/8ZrWq8b0O6Q3G6XwFjZCamiSuYz34H9smiNbz6?=
 =?us-ascii?Q?LV5OcHL0rWpUgbLiBNZffC71tXVWQUx0ZWWzteWZ3lBrEzEfs8YnwdDY9pV9?=
 =?us-ascii?Q?YO+CkoUPYi2OfRusXPkuDX+YcZesjJajhWaAjV49SioRwWVEvTMk6iSr6CgA?=
 =?us-ascii?Q?O5hbx4Auh1f17UcYDns/YxdRyBW47zu5GJwOk9BB8ORUKKeLZufennINYBYa?=
 =?us-ascii?Q?WBbEwdZV335if1JOFcyFNTliFsn5ghwzBvQP9FJbvxxwy2YFiF/QSWy8QKNB?=
 =?us-ascii?Q?deQrNaUYPFXo2GVBhV5UV3FJVOaexP8SSVduPiy2m7Cr73uL+LYtZECjEOzT?=
 =?us-ascii?Q?iBsPDi0B68hOfUKW5e4zNIOwlNBVNbR96LobqIjS2OTWC/30nT0XaqJ+VsDC?=
 =?us-ascii?Q?lC442K62+pYpAcdG3rRSGvdpD642KYSP7fVVq+80HI+k4rdaSnLLmbhJz9p8?=
 =?us-ascii?Q?5VI7RMhlsLSPFhcff4Yqw/+II8aOa4LPtY0zxOYNCJyh23FFCkcxo2ZBPOC5?=
 =?us-ascii?Q?SH+K+yuJ8yaF5mD0KKq7ykK4b94E8v59PG6XrKtGdU4v811WXXW7Dx57sz4i?=
 =?us-ascii?Q?pxiNBpXY1wHJLYgM932wvBRxWOw5m5QFEKLVmrTTc+HVtBfpaBzBgB8b2qeW?=
 =?us-ascii?Q?n4TxRsswErBzmy6HLZ4eeXB7/0fHXIXYiKyeLOSD9QQdh3w4Ds/73S3v32Ia?=
 =?us-ascii?Q?f/bTLtWP1L5cgEu06Rr3AbWcj94d?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae1bbe3a-1805-47b9-cedf-08d94a7e6045
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 06:28:09.2197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gJgzJTdwhbJOTNTlMrpYLqxEJelhB62Zz2AL2UB5TYXzBgRnuhejHvPDOvXXl7QC83l8dESRw0oxEZ5Y85Iv12akO+Uc6FqLoxd28NCQGNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4814
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10049
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107190035
X-Proofpoint-ORIG-GUID: W6RYi4LwDH4wuLOSH-Ic-GFJohrU_RvW
X-Proofpoint-GUID: W6RYi4LwDH4wuLOSH-Ic-GFJohrU_RvW
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=elena.ufimtseva@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Send VFIO_REGION_READ and VFIO_REGION_WRITE commands.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user.h   | 16 ++++++++++++++++
 hw/vfio/common.c | 17 +++++++++++++++--
 hw/vfio/pci.c    | 13 +++++++++++++
 hw/vfio/user.c   | 45 +++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 89 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index 9f51e14c7c..17c4d90ef1 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -147,6 +147,18 @@ struct vfio_user_irq_info {
     uint32_t count;
 };
 
+/*
+ * VFIO_USER_REGION_READ
+ * VFIO_USER_REGION_WRITE
+ */
+struct vfio_user_region_rw {
+    vfio_user_hdr_t hdr;
+    uint64_t offset;
+    uint32_t region;
+    uint32_t count;
+    char data[];
+};
+
 void vfio_user_recv(void *opaque);
 void vfio_user_send_reply(VFIOProxy *proxy, char *buf, int ret);
 VFIOProxy *vfio_user_connect_dev(char *sockname, Error **errp);
@@ -154,4 +166,8 @@ void vfio_user_disconnect(VFIOProxy *proxy);
 int vfio_user_validate_version(VFIODevice *vbasedev, Error **errp);
 int vfio_user_get_info(VFIODevice *vbasedev);
 int vfio_user_get_irq_info(VFIODevice *vbasedev, struct vfio_irq_info *info);
+int vfio_user_region_read(VFIODevice *vbasedev, uint32_t index, uint64_t offset,
+                          uint32_t count, void *data);
+int vfio_user_region_write(VFIODevice *vbasedev, uint32_t index,
+                           uint64_t offset, uint32_t count, void *data);
 #endif /* VFIO_USER_H */
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 45acdeeb46..74041cc438 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -40,6 +40,7 @@
 #include "trace.h"
 #include "qapi/error.h"
 #include "migration/migration.h"
+#include "hw/vfio/user.h"
 
 VFIOGroupList vfio_group_list =
     QLIST_HEAD_INITIALIZER(vfio_group_list);
@@ -214,6 +215,7 @@ void vfio_region_write(void *opaque, hwaddr addr,
         uint32_t dword;
         uint64_t qword;
     } buf;
+    int ret;
 
     switch (size) {
     case 1:
@@ -233,7 +235,12 @@ void vfio_region_write(void *opaque, hwaddr addr,
         break;
     }
 
-    if (pwrite(vbasedev->fd, &buf, size, region->fd_offset + addr) != size) {
+    if (vbasedev->proxy != NULL) {
+        ret = vfio_user_region_write(vbasedev, region->nr, addr, size, &data);
+    } else {
+        ret = pwrite(vbasedev->fd, &buf, size, region->fd_offset + addr);
+    }
+    if (ret != size) {
         error_report("%s(%s:region%d+0x%"HWADDR_PRIx", 0x%"PRIx64
                      ",%d) failed: %m",
                      __func__, vbasedev->name, region->nr,
@@ -265,8 +272,14 @@ uint64_t vfio_region_read(void *opaque,
         uint64_t qword;
     } buf;
     uint64_t data = 0;
+    int ret;
 
-    if (pread(vbasedev->fd, &buf, size, region->fd_offset + addr) != size) {
+    if (vbasedev->proxy != NULL) {
+        ret = vfio_user_region_read(vbasedev, region->nr, addr, size, &buf);
+    } else {
+        ret = pread(vbasedev->fd, &buf, size, region->fd_offset + addr);
+    }
+    if (ret != size) {
         error_report("%s(%s:region%d+0x%"HWADDR_PRIx", %d) failed: %m",
                      __func__, vbasedev->name, region->nr,
                      addr, size);
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 029a191bcb..1054978e5e 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3424,6 +3424,19 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
         error_propagate(errp, err);
         goto error;
     }
+    /* Get a copy of config space */
+    ret = vfio_user_region_read(vbasedev, VFIO_PCI_CONFIG_REGION_INDEX, 0,
+                                MIN(pci_config_size(pdev), vdev->config_size),
+                                pdev->config);
+    if (ret < 0) {
+        goto error;
+    }
+
+    /* vfio emulates a lot for us, but some bits need extra love */
+    vdev->emulated_config_bits = g_malloc0(vdev->config_size);
+
+    /* QEMU can also add or extend BARs */
+    memset(vdev->emulated_config_bits + PCI_BASE_ADDRESS_0, 0xff, 6 * 4);
 
     return;
 
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index a282b7b7b8..2bb6f8650e 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -634,3 +634,48 @@ int vfio_user_get_irq_info(VFIODevice *vbasedev, struct vfio_irq_info *info)
     memcpy(info, &msg.argsz, sizeof(*info));
     return 0;
 }
+
+int vfio_user_region_read(VFIODevice *vbasedev, uint32_t index, uint64_t offset,
+                                 uint32_t count, void *data)
+{
+    g_autofree struct vfio_user_region_rw *msgp = NULL;
+    int size = sizeof(*msgp) + count;
+
+    /* most reads are just registers, only allocate for larger ones */
+    msgp = g_malloc0(size);
+    vfio_user_request_msg(&msgp->hdr, VFIO_USER_REGION_READ, sizeof(*msgp), 0);
+    msgp->offset = offset;
+    msgp->region = index;
+    msgp->count = count;
+
+    vfio_user_send_recv(vbasedev->proxy, &msgp->hdr, NULL, size);
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
+int vfio_user_region_write(VFIODevice *vbasedev, uint32_t index,
+                           uint64_t offset, uint32_t count, void *data)
+{
+    g_autofree struct vfio_user_region_rw *msgp = NULL;
+    int size = sizeof(*msgp) + count;
+
+    /* most writes are just registers, only allocate for larger ones */
+    msgp = g_malloc0(size);
+    vfio_user_request_msg(&msgp->hdr, VFIO_USER_REGION_WRITE, size,
+                          VFIO_USER_NO_REPLY);
+    msgp->offset = offset;
+    msgp->region = index;
+    msgp->count = count;
+    memcpy(&msgp->data, data, count);
+
+    vfio_user_send(vbasedev->proxy, &msgp->hdr, NULL);
+
+    return count;
+}
-- 
2.25.1


