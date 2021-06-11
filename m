Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AE83A48C8
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 20:39:14 +0200 (CEST)
Received: from localhost ([::1]:44900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrm3m-0000Lz-0e
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 14:39:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lrlwk-0006Xy-6Q
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 14:31:58 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:34202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lrlwg-0007dd-7Q
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 14:31:57 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15BIM6vS003206; Fri, 11 Jun 2021 18:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=wZfAvjwjzb4XNzJEnJp2r64ok9W1vDs4HG855mJ8SyE=;
 b=wKUu1sCJX9BEUciZEGDETaQvSotMwFvpncheK13ggy5/s6a5+ULLijTdl5OR4HcYbmGe
 Yo9RD5Dgumm0tGDlfraj2G9O8aHfsDpFaGHPUQoi8YQra30jFmieFspvNGMrREJmlEwx
 xi8IaXrxXxSvWm4RrOt7AuogE4uXmuu1AA4/KFi8saqYKIynGAl1EpaPVxHL4HerlH+j
 UoKYx5GFWkZoLEVw8r6IZ71caXR8oVz0c5pMU+EDdO7ih4sr9cqn+4yaBT2z6OvMw9Is
 qEblU/MKSBZ/c8FaJ9b82wnbqWk4v9IJXant6AzWV2fiQGwkja4xP9BxDVckQ+ojWate Ng== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3944a1g5qb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Jun 2021 18:31:45 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15BIVhQt015874;
 Fri, 11 Jun 2021 18:31:44 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by userp3030.oracle.com with ESMTP id 3949cw8h2e-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Jun 2021 18:31:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DOmSKGePh/ncJIj1H36njTQPM2Kl+uZ1fqvaUed9V4GZRgx9r3VgcRiFsA46PlQxLdwdfCEOp+6kcyk/9gwX3kHDXrAnKPNfwZQNaz7MgC0Dn3lHy1rI0DmHgkEAC+D/gsDlrKHjGIPWgX+oGJLqhQiPtim/fSINUkTklct0aIUCPT5i0Uk/VlYorJTzByPvBXKyx9mD3rMQ0YDfvszRx2p3uSqrJz11kw8Zm1PxLACX6gPwHJlBNcV3ZswavBlwWdhP7F08viBLRxRvlPc1w2njoniaZclwRDKqyFgfEwqrObik63Z1qoMBvzEKdNvHhyyrZJWkONn5vyB1NM4Y4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZfAvjwjzb4XNzJEnJp2r64ok9W1vDs4HG855mJ8SyE=;
 b=koOvGAZvRRDooSXxNZr8iT/Has3OiQ4kKmRKLBeF/l1rqx2++9Aqqf98XEVbZnWZFaqZpuOUrRmRbiK+tBUuMmzZmjOtnwBA/bk8JyxA/9crfQZFm579vMOYLlHQFcXxNma9u7LaFN7ejJIdW2qnM3tUeOQ7BCCS8G/Y6reEV3o+GHxPPsPaYqm5M1HOrM8iFeK8vJfA58FasFPxbfqHvziq3NrXAkL5z96PqzxX6x0pUIPe7FwxepV3CudA+aBSOlVJ2R2jsWmrfmEQN2MNsyMOygxc2wC0VFJzdI736EhGW2UNKxdFmTh/Dk0nIiMzm6obw9U7EF5BbICe7LOkDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wZfAvjwjzb4XNzJEnJp2r64ok9W1vDs4HG855mJ8SyE=;
 b=Av4PK+73TU2moWzy6yYJFDPdpu6pgeNgbyQXO9WYPrct4KmNLR7H2kVtqffI05tOIbRj1AGswFS6g03WDpybh4vN29wO7A8QpQIKGr6dIMPYzV8a2XckVZm3JdsR9G1H3qAMPF4kltR4qyUK2pI8zffDfOJbiPFHha9iHDOUK8A=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO6PR10MB5457.namprd10.prod.outlook.com (2603:10b6:303:13f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Fri, 11 Jun
 2021 18:31:43 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc%7]) with mapi id 15.20.4219.024; Fri, 11 Jun 2021
 18:31:42 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/6] ACPI ERST: bios-tables-test.c steps 1 and 2
Date: Fri, 11 Jun 2021 14:31:18 -0400
Message-Id: <1623436283-20213-2-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1623436283-20213-1-git-send-email-eric.devolder@oracle.com>
References: <1623436283-20213-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.201.23]
X-ClientProxiedBy: SA9PR13CA0097.namprd13.prod.outlook.com
 (2603:10b6:806:24::12) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 SA9PR13CA0097.namprd13.prod.outlook.com (2603:10b6:806:24::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.9 via Frontend Transport; Fri, 11 Jun 2021 18:31:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea36c1e1-4ec1-420e-1542-08d92d072917
X-MS-TrafficTypeDiagnostic: CO6PR10MB5457:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB545752FD90DCC5A85D85DF9397349@CO6PR10MB5457.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KGHQG7Ed/TGLdtD3+ysr4gl8UMg1yMo6ez2dOo+YysKjhybfFRaP+MfDviLPOjdn9dGaT/wRNyt8Nx+nrPewXM6VXD/eKj/9uCmzd7/V0U5pievGGQAeLnHSLm7pC/m4erXvY1qKwbVe9uBOothXnz/at0vU4OE1c+MbzfP6SbYqU0djtVEcPelcOqwH6LAIxesSc6O+x1BHakdPgEoUINJNhCeYmGt33u1OflQlmZfemyoCHU0gXwREs35g8f9ZNhOyY+t7DIB+MbUOUoaQ3GlxWfTEVHUkdN1CFklgrjzxMyCOHFfiI9Inqb30qfLni1EKQnCucbnaDyEaVlUftmxThpVTEuSPEFIRDH8JS+hDbuEwoLnTZxnnG4mVniJpA1PwNwarA3mi9u8wGIeHyUgDF6WIaXMq4O7ijvErpFOjzJ2lT933bACjmE4Ehln5vH3ZgNejlqsioLnnjwMKXgRIFHVvSa/OASSX6tvlnnKzxSL20cLAgotMJIRbwxxJyyLXA5z2/+LeIpyQ/BTsweYMfnwuIyaAbIqnvb2To/dDZt2MSLbgXJCESxk4nqbMmlivKiKUDjF2zGoGuVnKnJnafw05eOM3bkZGwZ9xvtUBRuYHTLCga9jRdod86BH2qCvbVCk1AoGYj2ziLJeDs+FmlYHFwCWX5wp7yVKSW8U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(396003)(136003)(366004)(39860400002)(7696005)(8936002)(26005)(36756003)(52116002)(6666004)(66556008)(186003)(6486002)(478600001)(66476007)(4326008)(66946007)(316002)(5660300002)(86362001)(16526019)(2616005)(2906002)(6916009)(38350700002)(956004)(8676002)(38100700002)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1Y/qT55qI98bmfBtpRgbP4lbldcxmBDeR5htKgKw5rCzIglbS0ZIVgpQDYzL?=
 =?us-ascii?Q?Y4/YQV1oqoDqmeohFlT9VgwIyNWKWQzDIFlykUJ8bqJ6+EzQnijcClWzpfb9?=
 =?us-ascii?Q?7V0mvG04L9OJNNqPAHgIG8nSP3PbW2W4yNcslkZfCfwuDph5J0Q4ZzYutOD3?=
 =?us-ascii?Q?xBrRsEHA2x4QSu8fVlWj16OfPLVhXYdYa9EGzZV97QLbIBjgso+1c3vvAhN+?=
 =?us-ascii?Q?tfwSn7JJBl4gHPa2hMVCyptWV4+MI66GDzctVk7eQQguodD8qGeCZm9DuugK?=
 =?us-ascii?Q?9aV38TZG0WkfC/zuIJJxbds9Gkrn1np7QYKyywbCH1okDZV9Y+okaJps8463?=
 =?us-ascii?Q?s0xJWZ1r3go81iEgLKbXcRisIGoCjNcDRdeSTSMacMm3XhZ6XviCYaYlC/pE?=
 =?us-ascii?Q?zhDDrGQCiMFyyNjryetoHMl5OOh0mL6+OYJwPSzHCVL2RDUDJlcg5WzWBfql?=
 =?us-ascii?Q?wtgicOhWnycmlbzXoiDiIKaojUZrsUlSB/LzDspGCVHLCsVoM9vC3k7alfOC?=
 =?us-ascii?Q?f3MomM5wwnw2l9rdnhvetuui6AR7+JRvV3bPmDw2u6V+5XpS7tQ3xXo3Bgli?=
 =?us-ascii?Q?62vutUTY7u06qbdWCjDy8jciqRw4NBzOhnIjwGOE0sWqIu7ksqbHrEhpLhaD?=
 =?us-ascii?Q?23QgGRn4EqGjN6HCYqhoFQHeyuBiPxC1jlwLwYDBLTh4NnHpwqZshX7TJPgz?=
 =?us-ascii?Q?iWZwbod4Xw1SX/TLi3EtpPa4/eRD5o5qsYRCcywCsm+A1M/UixrppOF4pFc7?=
 =?us-ascii?Q?a7ZeadVgWfImWgs4r0Sy/qr6VB2RGYhBAbnS2+R1Z6b+NhWnM7FQlVmMYdK6?=
 =?us-ascii?Q?abrpjVSOUncDi8J6by5OMsqwxlpPHoZKwMvLuqZtOF2Wv9FabiCISDR+SHxb?=
 =?us-ascii?Q?azwcrbViU89nPyFI4ODQe2+Oa9F1uyLiLtXglQly8MSrCOOUU8yEefxuG/0k?=
 =?us-ascii?Q?Gp7GeV0qgikE6tNzbF58LZ+KSUo5NvtSDAHr7Svhav3BHchD0SDkSPOiUJou?=
 =?us-ascii?Q?xct2QYZ9WeRDkZI0fRihWAQWjpXNPzxFL1l1mmp/7+RRVQ902WPoq+310B5m?=
 =?us-ascii?Q?xD8+Aoo/12hWh59ld/muqZ5GjxrfEVE9wNUhiM5XkFqVY+5MF0t0792+PnW8?=
 =?us-ascii?Q?zSFpUc8uXPRAcGHc9UcEA6Wlm/VZhrj9RIUeGQZLzcgcb/nGfQyyR4MPN5g8?=
 =?us-ascii?Q?ZM1TqRlHm3EV1n36EY9CL7NZkkjr1eI1ATMdyIUIN/LxTAttCAkwgSgYObQI?=
 =?us-ascii?Q?QV2pDgPMxja539lp6lV6Ywpf1zE+mWUbJmxR2wfoMliJKMP5MxQ8aNp1NaTY?=
 =?us-ascii?Q?aLZC/DRo2REmXuptea+YWkoX?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea36c1e1-4ec1-420e-1542-08d92d072917
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 18:31:42.8548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N48N6RDxoqmin8eH3qWG6061c5F0fK/EDRSVmTGTZxZxJ5Hjznpzjv7ldaOpSoYCoi+esey6AEnwEp5GbW05EzTeGa8/xWIC6eKUp33CiXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5457
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10012
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106110115
X-Proofpoint-ORIG-GUID: eHI9qlzn0W3oMiMEu3GVp8hB50VD3NuS
X-Proofpoint-GUID: eHI9qlzn0W3oMiMEu3GVp8hB50VD3NuS
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 pbonzini@redhat.com, imammedo@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Following the guidelines in tests/qtest/bios-tables-test.c, this
change adds empty placeholder files per step 1 for the new ERST
table, and excludes resulting changed files in bios-tables-test-allowed-diff.h
per step 2.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 tests/data/acpi/microvm/ERST                | 0
 tests/data/acpi/pc/ERST                     | 0
 tests/data/acpi/q35/ERST                    | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 4 ++++
 4 files changed, 4 insertions(+)
 create mode 100644 tests/data/acpi/microvm/ERST
 create mode 100644 tests/data/acpi/pc/ERST
 create mode 100644 tests/data/acpi/q35/ERST

diff --git a/tests/data/acpi/microvm/ERST b/tests/data/acpi/microvm/ERST
new file mode 100644
index 0000000..e69de29
diff --git a/tests/data/acpi/pc/ERST b/tests/data/acpi/pc/ERST
new file mode 100644
index 0000000..e69de29
diff --git a/tests/data/acpi/q35/ERST b/tests/data/acpi/q35/ERST
new file mode 100644
index 0000000..e69de29
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523..e004c71 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,5 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/ERST",
+"tests/data/acpi/q35/ERST",
+"tests/data/acpi/microvm/ERST",
+
-- 
1.8.3.1


