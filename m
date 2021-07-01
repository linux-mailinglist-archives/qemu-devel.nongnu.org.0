Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7763B9849
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 23:42:47 +0200 (CEST)
Received: from localhost ([::1]:39458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz4SL-0002yu-Vl
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 17:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lz4Qp-00021L-NF
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 17:41:11 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:56338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lz4Ql-00058A-Bh
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 17:41:11 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 161LX2Lf020490; Thu, 1 Jul 2021 21:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2020-01-29; bh=ucxuJ+Yohe+IxL+cUyFchL6WLPSwqc2qyshX1OTmOqE=;
 b=g+ith91qZYeJM/NbOlMzGalMsAaM7M8HbEXM6qScbnWVPuWTUUK5UzHcyz3G0xR/teOs
 toRsmiDGL0WbwTZG+FPv3UPSsMAM5VbPBrwmIVrCXQFlyvmfxADmlv8S4uJVpCh1BRuG
 AtFOrFtMb4osVKBDZc/hoeUEHQ7PQSr0UukL5zCjxvppfQ76gBzFHJ5iB7WRr8YT1yXh
 lIVBPSvRv0RnC/xpgnt16R1Pz4mRXVuTUFP+UTFrn//Q9ufcwJAs7MajCABSFYyPZ1cj
 QRG+ul91lgmVymRkztakILhQVy/uT2X+AP3su4h3wJIiF7KmBtAcZb6m2f7fVQaE+YlQ Kg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39gb2t4t48-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 01 Jul 2021 21:41:01 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 161LeBp8045673;
 Thu, 1 Jul 2021 21:41:00 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2045.outbound.protection.outlook.com [104.47.57.45])
 by userp3020.oracle.com with ESMTP id 39ee11r505-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 01 Jul 2021 21:41:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ReJhhzI7rJc+wekwM5zDxduns0n0I5t9sNC2aPPvWmhhCJszJW7j+5Q6ARifvPQoy2lG4t6LI6it/oL2phnYtuUQ9l2yvOw0TP6C7swC30apK9234TxkJVIeU9szMsP0AVtq+GV1FiDk2MsXdeOtgE5y8ihICw+ulVkCp+EPGGKhC1KbY5dWV35LYDmVUsS1qutUlKdMxfjfSlOnhXS79hNHHXzif/pBqnwrI0uV05H7mkdP5811r01CiJZihAMZy/z3Ak33jTVYn7pMwOdi2w1pXDth1YcpxxQNQbj8P095451yMgRIvdB/Eatj0Uf5vowqcrveT9OldhUlDKN8OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucxuJ+Yohe+IxL+cUyFchL6WLPSwqc2qyshX1OTmOqE=;
 b=PzJ+Cdx151U9K3BjVs7vVMc7acfAVQ9JWx1zNfcPDeIANq0yQNa07lLfU43vzXkK3oSU7amMNYU2cwJiiFqNnhlnIexdFZGH/vN7AUooQ40hJjRQlA0UcfIKqEtBWzkpfYRtW5FQTEdCY8+PW16ad+oJYStKS5YrLzft9KRHk0ZlgIQMkAOhl9vjDrusTG5D+K+jvL+3EOtF/PgTdVVg0/ZKUQwA2unCg7LU1QFtLFFgMK+ihI1AOG/z0vnL4ovxjrhKH7i1lGSz4QwOF7FkP3T3J8UOI2ox3WdhpJPGgleMLRpos2Ldtl49Q9WSGHHKh5mtauSPrf/L8VfFbIdHuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucxuJ+Yohe+IxL+cUyFchL6WLPSwqc2qyshX1OTmOqE=;
 b=Gg+S6/b86au3redcU4wHod/f5D+gavtyYXucZz/wx7EzoNfptD5KGqx2Hb0qt0j5dufj4AbwZXrkICMlgSJhoe9ME1fMgMwzSqbjCdgZ8kkDroFQTasAI5J9P9+5GrvrpymJsNox7+z+kusPVF89n1LdS4EHnirNBF4v00UGn7M=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by SJ0PR10MB5453.namprd10.prod.outlook.com (2603:10b6:a03:3ba::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Thu, 1 Jul
 2021 21:40:58 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::18a:7c1f:bf20:ba6c]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::18a:7c1f:bf20:ba6c%3]) with mapi id 15.20.4287.022; Thu, 1 Jul 2021
 21:40:58 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/1] hmp: synchronize cpu state for lapic info
Date: Thu,  1 Jul 2021 14:40:51 -0700
Message-Id: <20210701214051.1588-1-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [138.3.200.16]
X-ClientProxiedBy: SJ0PR13CA0057.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::32) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (138.3.200.16) by
 SJ0PR13CA0057.namprd13.prod.outlook.com (2603:10b6:a03:2c2::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.8 via Frontend
 Transport; Thu, 1 Jul 2021 21:40:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81f2ed4b-fb88-4477-1ee4-08d93cd8e996
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5453:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB5453D03B90C6A9660D0C0565F0009@SJ0PR10MB5453.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2WkezT1o7a86O4mJSNGZrNWU4ZRnBZ9zwOZfGWJOEqXWIdKBGfQEbPSljRZ8vsGJUnCJJGfZHwDgXZ35FXG44vdRwT+y+9zRy2SgutZcEEmrfvRPS80vpyHSSC/Ed1WD084Lorjn4BcvUKAn5A1IN90mfzkz+1t1IYXsVN3V+Vvh2sHd4fSbM3kbrH0lmnTIfwLnJMHVRVl2zFDI1MBqYPlqGuGU8kCQ6V+X9nIrTHBRj/vqbDSF0/00q5h3/7YKC8QL77Wic7sC7bWp3mpMSnUy3Dp5KD0bFFpVKfBZDdAw6okPk4XqvWb+BAb3LwfxH+QJ6frU4Xs+2PIyfjD2YWHkodcKpszB9UzTDm8P++RnglE+2mBbB82aCFqW6miY4eUKa3wLyNmLrYk++IvvwyN2ECt584wswxWrHLtecbrXaByMjEu5/XIeJFS9Qd3ts0mKG8htHCThfyayMBTXL165TStx9zL/RwApKl6sIhi8msR3+s5d9jydE3vl5DPp/Yp1mueLgqESBWRT0nghxAeWcABXQNLJMvFB6C/y9g5D1vUcv8CEZFhtbKMrYzKWMZ2Zo3HU7RYO3Ay4GfieTCaXw91OMLD6rWF+gjEY85Of9pUkwmAbTdIpQIIZ3LgO0DLlUGC0PgrZlWTXwJt7hAkWPaInU7x8FbXpwkTnmVADNk5obIdEHyc3NpMwTLiyKZ8oNPxLCLpDqOTpLcAcqTpiu6UHyqfkMxITWvq019YgjLcxurW1sHHOGpcYmPVq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(39860400002)(376002)(136003)(346002)(366004)(2906002)(316002)(6506007)(44832011)(107886003)(6916009)(956004)(38100700002)(8676002)(66946007)(86362001)(4326008)(6666004)(6486002)(5660300002)(66476007)(2616005)(52116002)(16526019)(38350700002)(36756003)(6512007)(186003)(8936002)(26005)(66556008)(1076003)(478600001)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2tQbwq5stLEvAt7zl0OdbphTDiS8OuE7u7o8t1BjM1cTB4gO22gKpw4gfFyK?=
 =?us-ascii?Q?jApN7DPUdwXyfOFPMi2vNVrVCf2vrARkQLRkCicPvUw5pSKLHiuGdKcmBPg3?=
 =?us-ascii?Q?kS+Rmm8jYz7AzmkXUwY/KnkQINZ/CWD3WnP+zG3u4zPlIbueUyE35/znJDCa?=
 =?us-ascii?Q?qFUc4N5mycLYznOywH3UPuV0BcW4WgCjfduYqrNQZNjmVhsAYl7HHkkLs+U5?=
 =?us-ascii?Q?dLtPrg+rcT/trbD/ZJPZ0wBBx8IZNnR1wEI81MaAHF78P5f+VBTFUdK4CPL0?=
 =?us-ascii?Q?jVIG31Y9I0JfmABargAcyORWSDoHd7ry+uFjXLe5M4ZCM0Vl5hhJAYpSVn6K?=
 =?us-ascii?Q?KsV3TcdJBXy7Isq8hZyoMg364/i2SS4L0e23zgDDUtX4ohUIaTHGgcLI53bt?=
 =?us-ascii?Q?vA1/fzpFl/DY+P7WFPtJdkpuwln5I1mgDKm3EKoe7z5BqBWzzUb/ZXUXGDyR?=
 =?us-ascii?Q?xDRglWbAUKOqmn80Sao0sR/V9eaMPysSgpFFV7Y/08wlqqO+J8/MKLAuZG0u?=
 =?us-ascii?Q?7y9eXrvvaFRw2RMgPRI9XmI9BOL9gA2j62zijv1bY+jjtDlzvoQly6nCitOn?=
 =?us-ascii?Q?fiqnAyq3X2gT4IJU/2AqQG1bXxSXHGMahT3nmedQnNgoAOfvi3qAisd0eLDM?=
 =?us-ascii?Q?qCtAzhVgJJsM5/aapbV+9csbMCyiO7oovngJHwP1u5sRoK0jX/jmitabmvtg?=
 =?us-ascii?Q?kxy6y9iVMlX0+cY3nGk7R5GpiCeNZbpRTPFGbKQsII90kHqk8CLUlrhz75Xx?=
 =?us-ascii?Q?JqfzjE6P4FDSy215ibgs+fUD8klJg7s500DNmVBymJYn49b/FDEop27dHTgW?=
 =?us-ascii?Q?jSDxolXkm0z7nGKL24t4oMwXEeodrPpqxSgaUvPm3Dy9EcN4XCFY8qUuIxks?=
 =?us-ascii?Q?xArUymSd2pUZ1PVO95NNwBMe4/eFbtfpxICkYxEkiK4TBA417lpEK6tlxHse?=
 =?us-ascii?Q?qr78c+YzqrisRUrNxGG9icwRm8o3QNvUQUg/l9znPFaD02gBklI/pd4vJfX3?=
 =?us-ascii?Q?JU7f5uw1XatMCVgufVKWQ2Sh9aZDII/kAsk3vRc/aM8l7oC/tKpuzQ/xb599?=
 =?us-ascii?Q?5VFby6sZ52K/o2N47a0+Jj5oSLFvk0dgN2iiiCsryhnt+OZdu30VBwdBkm+l?=
 =?us-ascii?Q?sVMJBit4uEBmYhxai/dqEieDbpqxa5xlraJoor6HTFrbg0wfeG8tCimhIDNT?=
 =?us-ascii?Q?zEE0ZVPHNez10DAqSw2q1Zev/Afb45fNvkJDHZfeCNqVSu5BV/IcWa0keQlJ?=
 =?us-ascii?Q?w00lfwahLw6fyVBXH1QndedVk08c4DA4RV1Gjiax+xMYwqjlJuMMBwOJUvFP?=
 =?us-ascii?Q?LCl8y8rrCsfU9CI2gVdooraS?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f2ed4b-fb88-4477-1ee4-08d93cd8e996
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 21:40:58.0427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H0IG71tBA0fBn+PRawblHdZZF0Rhmf0XBZ7dYdMB/B4DDditINvIPUUmDBq6ZTY4caZ2/ZEsbYKFm5c/YW2MQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5453
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10032
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 spamscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107010126
X-Proofpoint-GUID: 72WRSLZZEX0GSBoEJ5RoT262Y9vmUrrq
X-Proofpoint-ORIG-GUID: 72WRSLZZEX0GSBoEJ5RoT262Y9vmUrrq
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: kwolf@redhat.com, brijesh.singh@amd.com, ehabkost@redhat.com,
 jejb@linux.ibm.com, joe.jin@oracle.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While the default "info lapic" always synchronizes cpu state ...

mon_get_cpu()
-> mon_get_cpu_sync(mon, true)
   -> cpu_synchronize_state(cpu)
      -> ioctl KVM_GET_LAPIC (taking KVM as example)

... the cpu state is not synchronized when the apic-id is available as
argument.

The cpu state should be synchronized when apic-id is available. Otherwise
the "info lapic <apic-id>" always returns stale data.

Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
---
Changed since v1:
  - I sent out wrong patch version in v1

 target/i386/monitor.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/i386/monitor.c b/target/i386/monitor.c
index 119211f0b0..d833ab5b8e 100644
--- a/target/i386/monitor.c
+++ b/target/i386/monitor.c
@@ -28,6 +28,7 @@
 #include "monitor/hmp-target.h"
 #include "monitor/hmp.h"
 #include "qapi/qmp/qdict.h"
+#include "sysemu/hw_accel.h"
 #include "sysemu/kvm.h"
 #include "sysemu/sev.h"
 #include "qapi/error.h"
@@ -656,7 +657,11 @@ void hmp_info_local_apic(Monitor *mon, const QDict *qdict)
 
     if (qdict_haskey(qdict, "apic-id")) {
         int id = qdict_get_try_int(qdict, "apic-id", 0);
+
         cs = cpu_by_arch_id(id);
+        if (cs) {
+            cpu_synchronize_state(cs);
+        }
     } else {
         cs = mon_get_cpu(mon);
     }
-- 
2.17.1


