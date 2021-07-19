Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A19EF3CCE0C
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 08:41:44 +0200 (CEST)
Received: from localhost ([::1]:35398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5MyF-0004hJ-JR
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 02:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1m5MlT-0004UW-HT
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:28:31 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:35424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elena.ufimtseva@oracle.com>)
 id 1m5MlQ-0002MA-Fq
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 02:28:30 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16J6GP0N021860; Mon, 19 Jul 2021 06:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=/B8XuM3rPOQeqQvMmQ0k8eBJT7GOVt553ydoCrjoy4I=;
 b=F9rErFyrTifjTpywl8JeAXRrhxA4BVLaYl7/8gwn2HyAo3PpMrb+pAFCvuiHNiocD0DA
 IAbR/LQ8+nqxYT0JrcwKLbu4TKOB9PqrzOkswBAgCs93McjBkRuvTvKtp61rZowVaAfp
 NpQsAx3RzODLefq42bEo2xPeUKisL1B+2o24mayHOwO3vX6H3PZ6glrBKqqwGUwJHJMd
 XAZ9J2b4JWKIWxNhsGSxjcmR0NHV1vG8pcZasLiAEKxWm1B33iITpecsk+sbZkE+e/m5
 Ni73/ZKpqdpDzYo1Z3wxqLGSBoOjpQ7fpDKdKgCGUZAAXKvUn1jskZ6ygn0bKCtu/NpQ 8g== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2020-01-29; bh=/B8XuM3rPOQeqQvMmQ0k8eBJT7GOVt553ydoCrjoy4I=;
 b=tpbVHlZi3XkVgRzTiBD4c3lgPdkT8uE6Jiv6A5C4E0e4kJyNEYjM5YZUt3/RLzQw1rou
 74YQQF+f8KkgJofFvPGWqHgj9RIYKIKQuS1N1Tiv7g3onBCM+zLSzTQ/ShLjWfNyMECo
 YwdC2hXcRRA6rAmVE0AR1a86+Kt81c5AqwRAH1Weghr5nuWutGjUgZwGZUaetdciw6rf
 p7pfPA6nO1gObY5aB4XAbbECBTlySX9ZymRlG8xUVuyqwZUobXPEJC+6hqHKktUJQEBS
 pAs6mzltqxCvgqN034W9on+TTY3AXHu/dIzhSzGpCFA6N7SRSg9cxbeAwZJYluuFchWK Fg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 39uptrt6c8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:28:17 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16J6GMKS099799;
 Mon, 19 Jul 2021 06:28:16 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by userp3030.oracle.com with ESMTP id 39umawam46-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 06:28:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KYRouIikVzUKFS0egQpfsD9XJWUiuC8mZ3fKWYiPFiydV6+b+VriVmbV7H+O/+/tBQEJVG0Xnc5Ari704ovHaKg0plmQJKRQ3Bo3UItnL82wFa+9VuHYqyzClnEpES2lLk+eWZSHqFGtxzIzyEBs5A7YDmpuLGlwh8Dbl45mGk+5bkxuhLHWyDnvUDUamM+vDI5Loij1Tog1SgBQ5LrhrhWOM56MWwIHZTIAjW9WlcWA81wcXWBQq6UTVeir5PVJ9Y6Z4pMvXmwI6o0bLteU/XZzocxAWtqZC0x9B21ZYZwHkjkTJJUK/pt/Ev6R99FWZECeqYpmbHH0zcC+lP2azA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/B8XuM3rPOQeqQvMmQ0k8eBJT7GOVt553ydoCrjoy4I=;
 b=PZDoNZjj0Pwx3Nosjbr2kBtUjejFSDQNu6mKB4JUQSI0Jc/xcISCUDWEtJbDdPqjCSqpEEG/4EOwnqm9NbzzWE8vXgbQ7mJLvFmh1QVlJyiuADzZhMF7rienp1M1Gk1/fKPSUpX6BcywOqAcSnjzPGAM4EDlxBFF64f7Dhm5pOZSXNAVs4j7CDTuWQlBVbopVw8gzC+WCa5BWU5klKFM1V88WWALb/VQafT9S2eaLR5Bdm3RAL7jYHpDRFvHCB9fCcz8ig/wXO5CEUvFtcdertHiplGauTUyN6WKDZ1OfjQgcNH5YrbkNQzQ/FNK3crfGKvJBAS7zvbcfu92zuie3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/B8XuM3rPOQeqQvMmQ0k8eBJT7GOVt553ydoCrjoy4I=;
 b=QBA3BeUv9LxFQUoU8AgyYW23Hy/bTeuwctgyyb5RwzXOc94Szag5sCM2SKrUK0DWDfyYAuyIh7e5iLX0EX9XuJB4xLUjDWROIGR1DRdUmO6aiG6tPIGzmsNYx9TxDIxc4avwOYIyDEWfSamuWCUMz/ukDfuJ59PtShO/NAAYg74=
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
Subject: [PATCH RFC 16/19] vfio-user: pci reset
Date: Sun, 18 Jul 2021 23:27:55 -0700
Message-Id: <ebb0f1f6c2a99420a67a5e6162c0692ac32c77ce.1626675354.git.elena.ufimtseva@oracle.com>
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
X-MS-Office365-Filtering-Correlation-Id: 1923b104-2328-4b84-98ab-08d94a7e621a
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4814:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB48149DE0C6A85BDD73AF16768CE19@SJ0PR10MB4814.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:220;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Bn6yNk0wrG4p5YPB5v9mYOaNGjn5uaYoS23jhiKj9ygHFMpqHy9klOYvt7nMRAMmy1BT80BfEfEPbpKfJuwr4IU/fPiJBZXpGQzL4Sz2WVL8A0brGvGdrVMQ01LBXpFgaV1jYtBbjFs/mzssN3iEYmRnE5oxA4Y4Rd2pJTvnZnkBuO4mxlIVQqb7tr0PD28IqZxfpDERUIVeXI0bK8P1bhgOOVaK20Obv2i0/4lUXQMgW7eQcl4Wmx3poVRdhU6zCCJOSS8/J6h9/onyoCnPQOmGTodOStrN84TQRQPdCcg1+SeAr46YmkkDaat9LY1tODnMceUv9zXSrbbwg2Qo8c1JL39YhXjt/A0OSl42HWBbVVx+nhcngPhnToCXovqfISI2FraKca4pHbW0+7qPFa0+rCCJtQmuRL/+e11ONNct1btcSVBpkOTWzmHDuNGzI4a16QjTdhPnOR+YWWWZ2pwFCY5cqKDICqhHPEOhjRu2ZiYATUU6ZRGPxMkE1cc2SaMpUGWQz0lNhQrTvmKKyORAxGvVkxFbjJlR8NdMkmmm6rxoHMo1G+hpmzKvVUK2YawdXs5bSSITZi1FwOeIzsYtbCvx/YQZSsTCHzB10VAW7pcHmbALpPC3a7iUCVb2/MtXJ5ZQOOcEuZdBqNSoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2869.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(366004)(376002)(346002)(136003)(2906002)(6486002)(5660300002)(316002)(6512007)(186003)(66476007)(44832011)(66556008)(2616005)(6506007)(38100700002)(6916009)(52116002)(6666004)(8936002)(86362001)(107886003)(8676002)(83380400001)(66946007)(478600001)(36756003)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JhhaYppWG5JeXh1C8t5mG3yTXlQUCwUeIsSBh++Gm7VKKhQvXUxoyX/4yPvg?=
 =?us-ascii?Q?fa3qNM4Y0gLJ8Z0IshGVZlKApMPHOtWpKOMCn+lit+OnZ3BjToiEaHfzOjV6?=
 =?us-ascii?Q?S9RpsYzDQGB0gC+y4yCimxSMbTIyXIGSNVdlq0ur+UQJ0hwdWttlMotATPri?=
 =?us-ascii?Q?l3Gy03dGTfoyz27oV+pqyzbPxShhRECS6gjR3pX8duwTyxH6LmqkIAt98Mpd?=
 =?us-ascii?Q?N7vgoS562KdSLQp3Dd4cnRB0KOSd7NEhsheWp2755HpvwvDmMoGWW+oDCyOu?=
 =?us-ascii?Q?WzjG36bAsiuaJH0YXb3crazvKif32tYjmg3JXsUWmuFbbPa6Y+3nx1PGj0hP?=
 =?us-ascii?Q?tkt2VJRwwYgIYHXjgYpQWdJJiNej01X5Pund5UQtmB0O2K+N+PpWo/8aF6xZ?=
 =?us-ascii?Q?zr5nttbTvUlqCUAFtzzOGS73vyhAUWnEg+8kksgRKGhZ9LM4BWnFWsXBBGQp?=
 =?us-ascii?Q?OJ9qwuN8sH2KO53uhe/O0DebPhA9MFljRhlGpWWqVHchIlc/CwoqsgE23ihQ?=
 =?us-ascii?Q?sddSv29ba9XHM5u8bg2mW8XW23XujAVJ6RL3dyiJ3cbWaUvVwItAjBclYd1q?=
 =?us-ascii?Q?WOmLVY2VirHyoeYq07sKghkjkJbxrkJiI93KxEhywohOicNXbJA8oQFacv/3?=
 =?us-ascii?Q?BP7xJ9aQO50zfjBhJFVrJ57Iu4+k7swzDCYPUceeUOZ82caMTuhCmqwm/+tV?=
 =?us-ascii?Q?hlr3Tv2pEM+fxuxE4TqV3CgXnHaFTNbFuG/mpPo+3cktisLj8R2VGVuVfNjH?=
 =?us-ascii?Q?CL57X96HU7CkF9dcA+qid6bEZdB0ZmIfoPCvP/wvetO8Dw4lIk/I0AMwFmbX?=
 =?us-ascii?Q?ihV/tcVB07ADMMk8ZBmXhMn7bX6tYhR6tvxRv4xcKmF2FVENrGtFCkaujJTN?=
 =?us-ascii?Q?4qdGroM22Q0SFQR5X5CX+biPkP5923v+AKc7PqtaFnUWGt3RRQnS4Jqf0WVD?=
 =?us-ascii?Q?LyS952cCzeMV5hfdgTa09m0nvT3K/CTYISUDze/leA68o6s9YqtoKYEA7iOc?=
 =?us-ascii?Q?qB+tsPocF8900YTWsBI0XzjD1Lw66rhSXwGOck+5fpvFOGHfXl4OUgS9cQ64?=
 =?us-ascii?Q?AEnMUmcW+UkHxF0zaJ/ekiDgHm2Qx6EajfbZKvhQT8y/ZNaidv2ATw7cysfM?=
 =?us-ascii?Q?JJ3BUpIeAzJZ+wrRhNApE2ATHTB+4e/Qswbzz0UgP2FLdZXVUVyMkisbUw12?=
 =?us-ascii?Q?qmqonnxiCJqhjJddwrpmMrvoEvatHtFoxE518HhEml7EjXfG27iI35e4ju4x?=
 =?us-ascii?Q?VPfykcR88WpLHw+lKFS3VBfZTjkq/o5t1HRUOR9YA6FiiQXnvqLcCUWcF3cY?=
 =?us-ascii?Q?YXtfD2ALDOb7eRG1cQAp3s4VkUWgykIKH8bfI92P1UNRiHV/D5g416kyvQ6w?=
 =?us-ascii?Q?Hex+1rDkGA38WU9zmw3ZEZ16eOXD?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1923b104-2328-4b84-98ab-08d94a7e621a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2869.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 06:28:12.2940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5eyMJBryvc+aMOWbRVvnG9MWf2faDipBB5Q5d1RP/BPi2pRmHHwzqadM3N9y+9XBMuKT2sLpUJ4dLBv8U5L5Gz2xUsI1VH/UHcZcMuUzxMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4814
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10049
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 spamscore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107190035
X-Proofpoint-ORIG-GUID: 0hCUuSk3EmVt0uKjRhihhEHg_N5nv5kr
X-Proofpoint-GUID: 0hCUuSk3EmVt0uKjRhihhEHg_N5nv5kr
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

Send VFIO_USER_DEVICE_RESET to reset remote device.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/user.h |  1 +
 hw/vfio/pci.c  | 29 ++++++++++++++++++++++++++---
 hw/vfio/user.c | 12 ++++++++++++
 3 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index afb85952da..95c2fb1707 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -254,4 +254,5 @@ void vfio_user_set_reqhandler(VFIODevice *vbasdev,
                                              VFIOUserFDs *fds),
                                              void *reqarg);
 int vfio_user_set_irqs(VFIODevice *vbasedev, struct vfio_irq_set *irq);
+void vfio_user_reset(VFIODevice *vbasedev);
 #endif /* VFIO_USER_H */
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 52af5a1061..a6c28dac03 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -2212,8 +2212,9 @@ static void vfio_pci_pre_reset(VFIOPCIDevice *vdev)
 
 static void vfio_pci_post_reset(VFIOPCIDevice *vdev)
 {
+    VFIODevice *vbasedev = &vdev->vbasedev;
     Error *err = NULL;
-    int nr;
+    int ret, nr;
 
     vfio_intx_enable(vdev, &err);
     if (err) {
@@ -2221,11 +2222,18 @@ static void vfio_pci_post_reset(VFIOPCIDevice *vdev)
     }
 
     for (nr = 0; nr < PCI_NUM_REGIONS - 1; ++nr) {
-        off_t addr = vdev->config_offset + PCI_BASE_ADDRESS_0 + (4 * nr);
+        off_t addr = PCI_BASE_ADDRESS_0 + (4 * nr);
         uint32_t val = 0;
         uint32_t len = sizeof(val);
 
-        if (pwrite(vdev->vbasedev.fd, &val, len, addr) != len) {
+        if (vbasedev->proxy != NULL) {
+            ret = vfio_user_region_write(vbasedev, VFIO_PCI_CONFIG_REGION_INDEX,
+                                         addr, len, &val);
+        } else {
+            ret = pwrite(vdev->vbasedev.fd, &val, len,
+                         vdev->config_offset + addr);
+        }
+        if (ret != len) {
             error_report("%s(%s) reset bar %d failed: %m", __func__,
                          vdev->vbasedev.name, nr);
         }
@@ -3634,6 +3642,20 @@ static void vfio_user_instance_finalize(Object *obj)
     vfio_user_disconnect(vbasedev->proxy);
 }
 
+static void vfio_user_pci_reset(DeviceState *dev)
+{
+    VFIOPCIDevice *vdev = VFIO_PCI_BASE(dev);
+    VFIODevice *vbasedev = &vdev->vbasedev;
+
+    vfio_pci_pre_reset(vdev);
+
+    if (vbasedev->reset_works) {
+        vfio_user_reset(vbasedev);
+    }
+
+    vfio_pci_post_reset(vdev);
+}
+
 static Property vfio_user_pci_dev_properties[] = {
     DEFINE_PROP_STRING("socket", VFIOUserPCIDevice, sock_name),
     DEFINE_PROP_BOOL("secure-dma", VFIOUserPCIDevice, secure, false),
@@ -3645,6 +3667,7 @@ static void vfio_user_pci_dev_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *pdc = PCI_DEVICE_CLASS(klass);
 
+    dc->reset = vfio_user_pci_reset;
     device_class_set_props(dc, vfio_user_pci_dev_properties);
     dc->desc = "VFIO over socket PCI device assignment";
     pdc->realize = vfio_user_pci_realize;
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 0fd7e01986..8917596a2f 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -905,3 +905,15 @@ int vfio_user_set_irqs(VFIODevice *vbasedev, struct vfio_irq_set *irq)
 
     return 0;
 }
+
+void vfio_user_reset(VFIODevice *vbasedev)
+{
+    vfio_user_hdr_t msg;
+
+    vfio_user_request_msg(&msg, VFIO_USER_DEVICE_RESET, sizeof(msg), 0);
+
+    vfio_user_send_recv(vbasedev->proxy, &msg, NULL, 0);
+    if (msg.flags & VFIO_USER_ERROR) {
+        error_printf("reset reply error %d\n", msg.error_reply);
+    }
+}
-- 
2.25.1


