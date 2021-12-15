Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0077D475C35
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 16:51:18 +0100 (CET)
Received: from localhost ([::1]:43060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxWYl-0001am-PC
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 10:51:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mxWKe-0006bB-No
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:36:40 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:15566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1mxWKb-00006j-8t
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:36:40 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFEWeMs023139; 
 Wed, 15 Dec 2021 15:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2021-07-09; bh=a3a4s641EqWZclBacc/JHp8P7eQoqD6hY1zM7rlLmTQ=;
 b=iYbyKLp6HvBFxs4Wu9pJm3yzHCAYeIGyk8B88IvOLRD9lYIXZxj98Pg5Vi7nzIZsr1cI
 sbKt+ZyugKUL53J57YpZ2Hmw8Vpg2j5roagj1r4JXvbn99jy4SBEFh73ZqVaGEVjITKf
 8qUYuWl76ejsGezGrZ2J8p+0OqjS8ymD6M4LV1bLOcBPM8vwLcfBSUaU7EUEj6ClVsea
 veYFIMn0m39HtFtqf/ljypUT9+x8VkorTFEg4/xSDb5VJQ/E0rehYGXKa91IKF0QK7D5
 WEuuOHnNO4FB/UkQuIc3sGVh4nNBWATqZ2y2rrEgzUtTk9dG72AM2Mcs9fbewpo4pFQM Tg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cx3py778y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:36:33 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BFFUW6d094227;
 Wed, 15 Dec 2021 15:36:32 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by aserp3020.oracle.com with ESMTP id 3cxmrc0uc4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:36:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EnItfu41dh/hwSsP59rnlz0nvuax+8XICXjXyxHTLrdDQ4Qob5SVe8g10LvJ8N/kxyUDJsQ14deBcfgZN8GzQLQEe2CwE4LGkGoE/IGQwrBpwhCw64coquPCQW0kTGjBFtNkxNpph5NuHnFW2Kn5SrsW6rmj9xBol4gcKC0pUTCNzPbflJfkHOqKsSW73nZCdqLTyErWDzpgxZexv5sNiHlBdpTJHaYS+HV5fA1P2VVDkFs2emQptqyOjydYU6Hpet4f3/5/li7kfcSbxMK7r9rWAtlF20SWUs7EMjgPhVD2tfTW0+nN4eLfcJC3YzP1U4OUzwmWRx59z0sHcJ7kBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3a4s641EqWZclBacc/JHp8P7eQoqD6hY1zM7rlLmTQ=;
 b=aNvsEPixa1ggincDww0uHbDPzbr+8k5F7oEDMQW/Xrk5G0qxcxj9R7/cZgMeftXFS8/Uu4XRIHF+tS2qguaGuGcqwvNuEykU2jN4Sglp+r/2TAVjLwDL+6hoEOr9E+f2uDcB8MD++6OKlrY22Kwyaf8Hq1cIop5btshg7YhcuXWCAA5GOqF5B5ck9K9bvYkTECuNbwgilibPzJYc3gCMbgFoT50hWsuCfKklD8bCO9mSQfZ7p6lQRbZ9TfCv0MIBWz5RAFlytNcG1VWOAYYLqWT1EmIPZlZ/uYr3xh2HWAawtdLNdRFIzsANhWVdNX17a5Xa6Ot4iqpXNz++ZVcCYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a3a4s641EqWZclBacc/JHp8P7eQoqD6hY1zM7rlLmTQ=;
 b=ADvjqWdX15kkkQlwExqXC+GygWaPUgPo+apkh+ruDm9ZbVfY3BpAD2XqR667+yCX1HtLQM2FAPK9e8zzbLIRcgJOLsKnHtw4g3xV4J1SiBKnr27GD26NzRobjODu5i1dNdbHRSFRipAS4vOV0wb89POPXceVnFecDgKWmREv4/c=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BLAPR10MB5282.namprd10.prod.outlook.com (2603:10b6:208:30e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 15:36:29 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::b911:b919:6383:970d%5]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 15:36:29 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 13/14] vfio-user: register handlers to facilitate migration
Date: Wed, 15 Dec 2021 10:35:37 -0500
Message-Id: <5f3cfae32d974c9a7ef3a1a9a2897557b9106de6.1639549843.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1639549843.git.jag.raman@oracle.com>
References: <cover.1639549843.git.jag.raman@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0105.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::46) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e562d64e-c6b5-4cb1-0e66-08d9bfe0a9db
X-MS-TrafficTypeDiagnostic: BLAPR10MB5282:EE_
X-Microsoft-Antispam-PRVS: <BLAPR10MB528205CD41823719C1818A9E90769@BLAPR10MB5282.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wd8GMTtN2ZQXXe0S4G7scX9l8bhNrEaeENDvrG9UZXQTHgmcnly5ANiM+364Kwg07cvFVHYUzVdjuAiQkPvlstXVWiEX/++puApMwdy4qEp3O8uqOAbQZjNBQtKVT91lOvCsXEaTIuRTkk6E4NlDmDGwL0N+3LdTzjmmNfZQ58sbE9fwse9zpjso+bIGHppWEP5io0drWOWBzManzIv5F/Sdu9A5LKsEZmRV0rh/VnuNMSwdoH/mytwAHXIHF2dxcGw11eJihswuKTfygB1mEODSPE15nECAQhZes+4Iw+suYncWYgnHb1xKAGx0duqTcZCvJ5dOEmlRqUjVXZlLk/XBxe0zUJ9q+iq05ZzFCHBR5cCcsuaqxYf16C/sq+kWzRY5dgra3Dii3jPTKiIpVxt0tWCXLcyAFZhDuq0W3TVHlOctuta5NH9IJsk7Je8wNyZj1NUCJm9MCP8bSfY20GNgJtIN1oj69DahAqoqzghDCnhX15exdO+BdgxdFNcmwa7hsFteVumgft///PlGMVHH7TS8xClXU4ijzMUkkAwPHggNc2hzR0QF0r69NgDiYloOKBYGcK/4lzxdRPBf6bs5SzsQu6vz/pf5y7aqskoLfsm0n6dEKvIfIssPTHmjE5AbN7DpFURaAb4R4Zf7rSMW80uF99UokU4oE0J/eQL23JtsBTouvu2FJeQdrPJqeNyquO/TSCy6ElLlzbDz5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(86362001)(36756003)(316002)(52116002)(6512007)(508600001)(2616005)(6506007)(4326008)(6666004)(6916009)(6486002)(7416002)(107886003)(83380400001)(8676002)(26005)(8936002)(38100700002)(38350700002)(30864003)(66946007)(5660300002)(66556008)(66476007)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KOs2JtGYssjbW6q+YdpttBelSJeRG8odg3TosNwTxMpMXLogVGbLvGAViy3f?=
 =?us-ascii?Q?CZLfzhGCi1HKLWhzLR4xsK1CipZr1d+iKD7ihvrOoFWKRLKpkFL5UVU4PxyR?=
 =?us-ascii?Q?2j5y2od861QsrPrEphkGW8F9h7cuff3EJdCH4LhslWm8RQH5XEviHGnb8Ps2?=
 =?us-ascii?Q?FS8Oo+1qoM/nU/8ZgMAEBge2ETA2tH/wBINqI4oGh6nOgcJsi4tiquTTWFzc?=
 =?us-ascii?Q?C7zugqH30QFdY9rlOBQyFdNO7UMZyW/x+zN/8pkwUD+/dh+Z27PrJpq0xMaT?=
 =?us-ascii?Q?rga/4ePVQn0t5i9Icdx0wECjpcXZrum4xmMvQxYNtZ/FkmuyOtXyLV5Uxdwt?=
 =?us-ascii?Q?PIjdc/9Ctheo80aBBp9OeTK4IPCSp7EHIoFQ7z5HxzpC/qFiUbSdDV8WqENj?=
 =?us-ascii?Q?EMRxK8sskoKqHV9DIq2ZADJMlmh//eLP4+HXu/FpDxZBTA9YB7Samf5eRulz?=
 =?us-ascii?Q?QpxKOX2viBcaCB9fnGOV0tn6eP5ri05n1BPUZu+lT83/pR/7k7oB2s/YqbUC?=
 =?us-ascii?Q?HR2HHu43tDrfzkPT10BxQD+xn6B7NK4PQB2lGxrAki+U2f2w42b52qLhKiFT?=
 =?us-ascii?Q?sYhgGGSmV1wjfgnuGGnMwTk1hsqLYyQRwV3+eVzuyP89qJoyvB0FysM54cO/?=
 =?us-ascii?Q?KlfR5Hk+lveVwWumNQwbQz2sksEU38O2DU44nKQuZ4tSWH08OvPWFBew/x3K?=
 =?us-ascii?Q?0ErK5SnFo9ctYawUxWkTnkgvfsurOtJ6TzV4zhmtJ0f5uvJ/D+QljlQPPGoU?=
 =?us-ascii?Q?BKkLDuYhVC1gYXz9zZSgd6+BF9XNTv7Cv16pEpCFNMvm/IFR9uOdAjoJf7qC?=
 =?us-ascii?Q?nE/fuwBTfJoDp6uoeE1g1IkzyJ4a3vXH/HUHLhtIy60MlnnCGt4RNc2vU//M?=
 =?us-ascii?Q?NNcecmwH28rJiN4Kcit9duRogfdnJOlUMgUQ9AkgKfClNL7/oIdcdBoHRjqX?=
 =?us-ascii?Q?NfUVqMJ+IRQv/et47p8DhYgcnezFS2J3HWBBaiI+3LTOxYnjj+NxYBukk+hT?=
 =?us-ascii?Q?T6C1ZJxJ02XO4Vr07FCImAknk5fQukYkJUdbbHPWK1vpzT1dzNcIqAKKaZ45?=
 =?us-ascii?Q?Nu15bF5y+kZ+tGSs6WEug1XzfEA/vWNm7dg8LjS1ldJqRiQh65bG9thGRHob?=
 =?us-ascii?Q?gCIgPWM+8dQQcUlBZEdCwOMT0KDhdMfu5MhA5LY04SmrYx8V1lZhTM33ajeo?=
 =?us-ascii?Q?Bq11bbcEFCZcRAD4vHNGEi8dWQyUS7DxpXNqRyXg8qgf0O2bq6Ah9NVKewCR?=
 =?us-ascii?Q?L2v7LkN899BV1kVfceo6n8r5eYkktTGRbsda7RB0hxxN7MYwdwgRkwu8jzKc?=
 =?us-ascii?Q?zDYJN5Wj05ksTCd/LypXPQe6ZBEDopRzze1HxOYmRYVcQQEyJ1bjy7FrDu8J?=
 =?us-ascii?Q?09dO1OU46lPph2nCTT9C5H6xSWpd8H5NJI2fiOoSFiZJzUNpKn65t5JI9mZX?=
 =?us-ascii?Q?2JttAA9J6aC4TRRmn0htBNmylPCNRduZtIUyGAygK6pWmovFLvT6/X0xorRq?=
 =?us-ascii?Q?p+Dy53AxfEZOn8ufo6psnBFvTDqsmLoWKqY9eA7G9BQqYMMbDrYcVzUajRIA?=
 =?us-ascii?Q?G7MtarC0C8AZfMObyPYZoUdrMvxXQKbuvUu2doJpdqxqGbNgZabxHeUb4W9O?=
 =?us-ascii?Q?DSoV3lglCoVuUm7OH2kg1GQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e562d64e-c6b5-4cb1-0e66-08d9bfe0a9db
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 15:36:29.4952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b/x8eQ4/QmRBP60hbxTsNmo1/D/4LqC7jSuUzqI9Heon2QCJX2UztChuZt0LAjMi8YM9UhKvDvAa8JKo2rmJqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5282
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10198
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112150088
X-Proofpoint-ORIG-GUID: X8RSICUC5YjjF2wJtCASiTsx3vsocnWn
X-Proofpoint-GUID: X8RSICUC5YjjF2wJtCASiTsx3vsocnWn
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 jag.raman@oracle.com, bleal@redhat.com, swapnil.ingle@nutanix.com,
 john.levon@nutanix.com, philmd@redhat.com, wainersm@redhat.com,
 alex.williamson@redhat.com, thanos.makatos@nutanix.com,
 marcandre.lureau@gmail.com, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Store and load the device's state during migration. use libvfio-user's
handlers for this purpose

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 include/migration/vmstate.h |   2 +
 migration/savevm.h          |   2 +
 hw/remote/vfio-user-obj.c   | 323 ++++++++++++++++++++++++++++++++++++
 migration/savevm.c          |  73 ++++++++
 migration/vmstate.c         |  19 +++
 5 files changed, 419 insertions(+)

diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 017c03675c..68bea576ea 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -1165,6 +1165,8 @@ extern const VMStateInfo vmstate_info_qlist;
 #define VMSTATE_END_OF_LIST()                                         \
     {}
 
+uint64_t vmstate_vmsd_size(PCIDevice *pci_dev);
+
 int vmstate_load_state(QEMUFile *f, const VMStateDescription *vmsd,
                        void *opaque, int version_id);
 int vmstate_save_state(QEMUFile *f, const VMStateDescription *vmsd,
diff --git a/migration/savevm.h b/migration/savevm.h
index 6461342cb4..8007064ff2 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -67,5 +67,7 @@ int qemu_loadvm_state_main(QEMUFile *f, MigrationIncomingState *mis);
 int qemu_load_device_state(QEMUFile *f);
 int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
         bool in_postcopy, bool inactivate_disks);
+int qemu_remote_savevm(QEMUFile *f, DeviceState *dev);
+int qemu_remote_loadvm(QEMUFile *f);
 
 #endif
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
index 2b28d465d5..cc0b82445b 100644
--- a/hw/remote/vfio-user-obj.c
+++ b/hw/remote/vfio-user-obj.c
@@ -53,6 +53,11 @@
 #include "hw/pci/msi.h"
 #include "hw/pci/msix.h"
 #include "hw/remote/iohub.h"
+#include "migration/qemu-file.h"
+#include "migration/savevm.h"
+#include "migration/vmstate.h"
+#include "migration/global_state.h"
+#include "block/block.h"
 
 #define TYPE_VFU_OBJECT "x-vfio-user-server"
 OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
@@ -82,6 +87,35 @@ struct VfuObject {
     PCIDevice *pci_dev;
 
     int vfu_poll_fd;
+
+    /*
+     * vfu_mig_buf holds the migration data. In the remote server, this
+     * buffer replaces the role of an IO channel which links the source
+     * and the destination.
+     *
+     * Whenever the client QEMU process initiates migration, the remote
+     * server gets notified via libvfio-user callbacks. The remote server
+     * sets up a QEMUFile object using this buffer as backend. The remote
+     * server passes this object to its migration subsystem, which slurps
+     * the VMSD of the device ('devid' above) referenced by this object
+     * and stores the VMSD in this buffer.
+     *
+     * The client subsequetly asks the remote server for any data that
+     * needs to be moved over to the destination via libvfio-user
+     * library's vfu_migration_callbacks_t callbacks. The remote hands
+     * over this buffer as data at this time.
+     *
+     * A reverse of this process happens at the destination.
+     */
+    uint8_t *vfu_mig_buf;
+
+    uint64_t vfu_mig_buf_size;
+
+    uint64_t vfu_mig_buf_pending;
+
+    QEMUFile *vfu_mig_file;
+
+    vfu_migr_state_t vfu_state;
 };
 
 static GHashTable *vfu_object_dev_table;
@@ -125,6 +159,272 @@ static void vfu_object_set_device(Object *obj, const char *str, Error **errp)
     vfu_object_init_ctx(o, errp);
 }
 
+/**
+ * Migration helper functions
+ *
+ * vfu_mig_buf_read & vfu_mig_buf_write are used by QEMU's migration
+ * subsystem - qemu_remote_loadvm & qemu_remote_savevm. loadvm/savevm
+ * call these functions via QEMUFileOps to load/save the VMSD of a
+ * device into vfu_mig_buf
+ *
+ */
+static ssize_t vfu_mig_buf_read(void *opaque, uint8_t *buf, int64_t pos,
+                                size_t size, Error **errp)
+{
+    VfuObject *o = opaque;
+
+    if (pos > o->vfu_mig_buf_size) {
+        size = 0;
+    } else if ((pos + size) > o->vfu_mig_buf_size) {
+        size = o->vfu_mig_buf_size - pos;
+    }
+
+    memcpy(buf, (o->vfu_mig_buf + pos), size);
+
+    return size;
+}
+
+static ssize_t vfu_mig_buf_write(void *opaque, struct iovec *iov, int iovcnt,
+                                 int64_t pos, Error **errp)
+{
+    VfuObject *o = opaque;
+    uint64_t end = pos + iov_size(iov, iovcnt);
+    int i;
+
+    if (end > o->vfu_mig_buf_size) {
+        o->vfu_mig_buf = g_realloc(o->vfu_mig_buf, end);
+    }
+
+    for (i = 0; i < iovcnt; i++) {
+        memcpy((o->vfu_mig_buf + o->vfu_mig_buf_size), iov[i].iov_base,
+               iov[i].iov_len);
+        o->vfu_mig_buf_size += iov[i].iov_len;
+        o->vfu_mig_buf_pending += iov[i].iov_len;
+    }
+
+    return iov_size(iov, iovcnt);
+}
+
+static int vfu_mig_buf_shutdown(void *opaque, bool rd, bool wr, Error **errp)
+{
+    VfuObject *o = opaque;
+
+    o->vfu_mig_buf_size = 0;
+
+    g_free(o->vfu_mig_buf);
+
+    o->vfu_mig_buf = NULL;
+
+    o->vfu_mig_buf_pending = 0;
+
+    return 0;
+}
+
+static const QEMUFileOps vfu_mig_fops_save = {
+    .writev_buffer  = vfu_mig_buf_write,
+    .shut_down      = vfu_mig_buf_shutdown,
+};
+
+static const QEMUFileOps vfu_mig_fops_load = {
+    .get_buffer     = vfu_mig_buf_read,
+    .shut_down      = vfu_mig_buf_shutdown,
+};
+
+/**
+ * handlers for vfu_migration_callbacks_t
+ *
+ * The libvfio-user library accesses these handlers to drive the migration
+ * at the remote end, and also to transport the data stored in vfu_mig_buf
+ *
+ */
+static void vfu_mig_state_stop_and_copy(vfu_ctx_t *vfu_ctx)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    int ret;
+
+    if (!o->vfu_mig_file) {
+        o->vfu_mig_file = qemu_fopen_ops(o, &vfu_mig_fops_save, false);
+    }
+
+    ret = qemu_remote_savevm(o->vfu_mig_file, DEVICE(o->pci_dev));
+    if (ret) {
+        qemu_file_shutdown(o->vfu_mig_file);
+        o->vfu_mig_file = NULL;
+        return;
+    }
+
+    qemu_fflush(o->vfu_mig_file);
+}
+
+static void vfu_mig_state_running(vfu_ctx_t *vfu_ctx)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    VfuObjectClass *k = VFU_OBJECT_GET_CLASS(OBJECT(o));
+    static int migrated_devs;
+    Error *local_err = NULL;
+    int ret;
+
+    /**
+     * TODO: move to VFU_MIGR_STATE_RESUME handler. Presently, the
+     * VMSD data from source is not available at RESUME state.
+     * Working on a fix for this.
+     */
+    if (!o->vfu_mig_file) {
+        o->vfu_mig_file = qemu_fopen_ops(o, &vfu_mig_fops_load, false);
+    }
+
+    ret = qemu_remote_loadvm(o->vfu_mig_file);
+    if (ret) {
+        error_setg(&error_abort, "vfu: failed to restore device state");
+        return;
+    }
+
+    qemu_file_shutdown(o->vfu_mig_file);
+    o->vfu_mig_file = NULL;
+
+    /* VFU_MIGR_STATE_RUNNING begins here */
+    if (++migrated_devs == k->nr_devs) {
+        bdrv_invalidate_cache_all(&local_err);
+        if (local_err) {
+            error_report_err(local_err);
+            return;
+        }
+
+        vm_start();
+    }
+}
+
+static void vfu_mig_state_stop(vfu_ctx_t *vfu_ctx)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    VfuObjectClass *k = VFU_OBJECT_GET_CLASS(OBJECT(o));
+    static int migrated_devs;
+
+    /**
+     * note: calling bdrv_inactivate_all() is not the best approach.
+     *
+     *  Ideally, we would identify the block devices (if any) indirectly
+     *  linked (such as via a scsi-hd device) to each of the migrated devices,
+     *  and inactivate them individually. This is essential while operating
+     *  the server in a storage daemon mode, with devices from different VMs.
+     *
+     *  However, we currently don't have this capability. As such, we need to
+     *  inactivate all devices at the same time when migration is completed.
+     */
+    if (++migrated_devs == k->nr_devs) {
+        vm_stop(RUN_STATE_PAUSED);
+        bdrv_inactivate_all();
+    }
+}
+
+static int vfu_mig_transition(vfu_ctx_t *vfu_ctx, vfu_migr_state_t state)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+
+    if (o->vfu_state == state) {
+        return 0;
+    }
+
+    switch (state) {
+    case VFU_MIGR_STATE_RESUME:
+        break;
+    case VFU_MIGR_STATE_STOP_AND_COPY:
+        vfu_mig_state_stop_and_copy(vfu_ctx);
+        break;
+    case VFU_MIGR_STATE_STOP:
+        vfu_mig_state_stop(vfu_ctx);
+        break;
+    case VFU_MIGR_STATE_PRE_COPY:
+        break;
+    case VFU_MIGR_STATE_RUNNING:
+        if (!runstate_is_running()) {
+            vfu_mig_state_running(vfu_ctx);
+        }
+        break;
+    default:
+        warn_report("vfu: Unknown migration state %d", state);
+    }
+
+    o->vfu_state = state;
+
+    return 0;
+}
+
+static uint64_t vfu_mig_get_pending_bytes(vfu_ctx_t *vfu_ctx)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+
+    return o->vfu_mig_buf_pending;
+}
+
+static int vfu_mig_prepare_data(vfu_ctx_t *vfu_ctx, uint64_t *offset,
+                                uint64_t *size)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+
+    if (offset) {
+        *offset = 0;
+    }
+
+    if (size) {
+        *size = o->vfu_mig_buf_size;
+    }
+
+    return 0;
+}
+
+static ssize_t vfu_mig_read_data(vfu_ctx_t *vfu_ctx, void *buf,
+                                 uint64_t size, uint64_t offset)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+
+    if (offset > o->vfu_mig_buf_size) {
+        return -1;
+    }
+
+    if ((offset + size) > o->vfu_mig_buf_size) {
+        warn_report("vfu: buffer overflow - check pending_bytes");
+        size = o->vfu_mig_buf_size - offset;
+    }
+
+    memcpy(buf, (o->vfu_mig_buf + offset), size);
+
+    o->vfu_mig_buf_pending -= size;
+
+    return size;
+}
+
+static ssize_t vfu_mig_write_data(vfu_ctx_t *vfu_ctx, void *data,
+                                  uint64_t size, uint64_t offset)
+{
+    VfuObject *o = vfu_get_private(vfu_ctx);
+    uint64_t end = offset + size;
+
+    if (end > o->vfu_mig_buf_size) {
+        o->vfu_mig_buf = g_realloc(o->vfu_mig_buf, end);
+        o->vfu_mig_buf_size = end;
+    }
+
+    memcpy((o->vfu_mig_buf + offset), data, size);
+
+    return size;
+}
+
+static int vfu_mig_data_written(vfu_ctx_t *vfu_ctx, uint64_t count)
+{
+    return 0;
+}
+
+static const vfu_migration_callbacks_t vfu_mig_cbs = {
+    .version = VFU_MIGR_CALLBACKS_VERS,
+    .transition = &vfu_mig_transition,
+    .get_pending_bytes = &vfu_mig_get_pending_bytes,
+    .prepare_data = &vfu_mig_prepare_data,
+    .read_data = &vfu_mig_read_data,
+    .data_written = &vfu_mig_data_written,
+    .write_data = &vfu_mig_write_data,
+};
+
 static void vfu_object_ctx_run(void *opaque)
 {
     VfuObject *o = opaque;
@@ -425,6 +725,7 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
     ERRP_GUARD();
     DeviceState *dev = NULL;
     vfu_pci_type_t pci_type = VFU_PCI_TYPE_CONVENTIONAL;
+    uint64_t migr_regs_size, migr_size;
     int ret;
 
     if (o->vfu_ctx || !o->socket || !o->device ||
@@ -497,6 +798,26 @@ static void vfu_object_init_ctx(VfuObject *o, Error **errp)
         goto fail;
     }
 
+    migr_regs_size = vfu_get_migr_register_area_size();
+    migr_size = migr_regs_size + vmstate_vmsd_size(o->pci_dev);
+
+    ret = vfu_setup_region(o->vfu_ctx, VFU_PCI_DEV_MIGR_REGION_IDX,
+                           migr_size, NULL,
+                           VFU_REGION_FLAG_RW, NULL, 0, -1, 0);
+    if (ret < 0) {
+        error_setg(errp, "vfu: Failed to register migration BAR %s- %s",
+                   o->device, strerror(errno));
+        goto fail;
+    }
+
+    ret = vfu_setup_device_migration_callbacks(o->vfu_ctx, &vfu_mig_cbs,
+                                               migr_regs_size);
+    if (ret < 0) {
+        error_setg(errp, "vfu: Failed to setup migration %s- %s",
+                   o->device, strerror(errno));
+        goto fail;
+    }
+
     ret = vfu_realize_ctx(o->vfu_ctx);
     if (ret < 0) {
         error_setg(errp, "vfu: Failed to realize device %s- %s",
@@ -542,6 +863,8 @@ static void vfu_object_init(Object *obj)
     }
 
     o->vfu_poll_fd = -1;
+
+    o->vfu_state = VFU_MIGR_STATE_STOP;
 }
 
 static void vfu_object_finalize(Object *obj)
diff --git a/migration/savevm.c b/migration/savevm.c
index d59e976d50..69b7ea8b09 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1605,6 +1605,49 @@ static int qemu_savevm_state(QEMUFile *f, Error **errp)
     return ret;
 }
 
+static SaveStateEntry *find_se_from_dev(DeviceState *dev)
+{
+    SaveStateEntry *se;
+
+    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
+        if (se->opaque == dev) {
+            return se;
+        }
+    }
+
+    return NULL;
+}
+
+int qemu_remote_savevm(QEMUFile *f, DeviceState *dev)
+{
+    SaveStateEntry *se;
+    int ret = 0;
+
+    se = find_se_from_dev(dev);
+    if (!se) {
+        return -ENODEV;
+    }
+
+    if (!se->vmsd || !vmstate_save_needed(se->vmsd, se->opaque)) {
+        return ret;
+    }
+
+    save_section_header(f, se, QEMU_VM_SECTION_FULL);
+
+    ret = vmstate_save(f, se, NULL);
+    if (ret) {
+        qemu_file_set_error(f, ret);
+        return ret;
+    }
+
+    save_section_footer(f, se);
+
+    qemu_put_byte(f, QEMU_VM_EOF);
+    qemu_fflush(f);
+
+    return 0;
+}
+
 void qemu_savevm_live_state(QEMUFile *f)
 {
     /* save QEMU_VM_SECTION_END section */
@@ -2445,6 +2488,36 @@ qemu_loadvm_section_start_full(QEMUFile *f, MigrationIncomingState *mis)
     return 0;
 }
 
+int qemu_remote_loadvm(QEMUFile *f)
+{
+    uint8_t section_type;
+    int ret = 0;
+
+    while (true) {
+        section_type = qemu_get_byte(f);
+
+        ret = qemu_file_get_error(f);
+        if (ret) {
+            break;
+        }
+
+        switch (section_type) {
+        case QEMU_VM_SECTION_FULL:
+            ret = qemu_loadvm_section_start_full(f, NULL);
+            if (ret < 0) {
+                break;
+            }
+            break;
+        case QEMU_VM_EOF:
+            return ret;
+        default:
+            return -EINVAL;
+        }
+    }
+
+    return ret;
+}
+
 static int
 qemu_loadvm_section_part_end(QEMUFile *f, MigrationIncomingState *mis)
 {
diff --git a/migration/vmstate.c b/migration/vmstate.c
index 05f87cdddc..83f8562792 100644
--- a/migration/vmstate.c
+++ b/migration/vmstate.c
@@ -63,6 +63,25 @@ static int vmstate_size(void *opaque, const VMStateField *field)
     return size;
 }
 
+uint64_t vmstate_vmsd_size(PCIDevice *pci_dev)
+{
+    DeviceClass *dc = DEVICE_GET_CLASS(DEVICE(pci_dev));
+    const VMStateField *field = NULL;
+    uint64_t size = 0;
+
+    if (!dc->vmsd) {
+        return 0;
+    }
+
+    field = dc->vmsd->fields;
+    while (field && field->name) {
+        size += vmstate_size(pci_dev, field);
+        field++;
+    }
+
+    return size;
+}
+
 static void vmstate_handle_alloc(void *ptr, const VMStateField *field,
                                  void *opaque)
 {
-- 
2.20.1


