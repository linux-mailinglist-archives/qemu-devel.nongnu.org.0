Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B40514986C9
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 18:29:46 +0100 (CET)
Received: from localhost ([::1]:52080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC3A1-0003bO-RF
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 12:29:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nC2yE-0005Rg-L0
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 12:17:34 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:8218)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nC2y4-0007jQ-36
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 12:17:26 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20OG2mll001332; 
 Mon, 24 Jan 2022 17:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=kw5zRb6fcbfjGiIjU/ZOl679L3q3FAE7+fmlUiHRVQ0=;
 b=HEb20oUKMPIL9Z1BDYrNeiFvLmMH8IQZwxdepTtGUlFJnSI+6PqImQwZXVhBVuYOLcbv
 qoHpORBOWkgBcJYG0NkshoHlb4ktBptze0oN9xlzSimzIvdX3cIggMw/KHD9oOXRhv/Q
 7hm6du58F/CYlNEIhAF+DEognfuqOxXrWD8KDwve4Nysw8gm3Am6k3IXDmDsgA7X0ftS
 d4EVp3+IjUR3GjIQ3+LSahQScxieFFx3sAqvGKzlM6Eg6pnsPFKsl6K/5lNOvI7Ze+wG
 jR1F3U9RR4bmqgVSo5g3UbbVW9MC0jhP1WancxgGD61jXz27XEmAD9DMtkz245CrCdDo mg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsy9s0ajj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 17:17:19 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20OHCPS0087592;
 Mon, 24 Jan 2022 17:17:18 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
 by userp3020.oracle.com with ESMTP id 3drbckxt6u-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 17:17:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ky03/fQk8uhV+CqdathYdJRC0/+qQk85GJhxWypd/BsYKruRwr47Cq9OaWODE1LQ2ttjvR1plnSEEhws4OZINTBvviVldcm+FOVP3hgXOv8Oz69tlmqoWutGF0sbb19r1kpq5rwCyXl2mjJqrWwTGa8wsZtX7kLOlz+jU2khx9ovNxr1rDNS25sTNlXMJBLnf52H1jLw9Bw3WitAxoaqcHH/Vn/RWQGS7c5zuKtzo5f2cxfFxviPRu8si+VVfU6CnYUSFp5RbjjEP+QBH6gNSiSxUFODTAdalkinzcY1oKz5dVuhE9SyHGMJiwtq2T7bCt8O3kcjg4q82qO7TtyCNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kw5zRb6fcbfjGiIjU/ZOl679L3q3FAE7+fmlUiHRVQ0=;
 b=mo1e/cc7/goSKBllTxvavlBTkwimf3DAPWgBkLeZywotZ9AyuTgFuoAuD+RzEe0NCi+cJKJg4pd7T0b0BSD1gTiAkT8dgtm8w7eh28sHeQZUMle5vt14B5J8KE0sN+iNWK47XVMo8CvJ299pqQEvnhra+Xma68BNhmWrjCBZZltetpaZUmKmOqJ4EgsLBkN3RC/tOXhY+p+x39oTxz0iDJ2pSSKrBgl7Ak9psYshm1KHU3CVSHImI5pm91tlkhjcgDZdoxqmH8DOQlMy5AvmpF834ez0pwfFmrNx2haYznezaiJ+8NWGZFHmoZvvZKWm8By++a++Cf3CE0uQhpMKyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kw5zRb6fcbfjGiIjU/ZOl679L3q3FAE7+fmlUiHRVQ0=;
 b=jj6bI6NI6V2m6xp0ApSl8hLb1Grysjqiwqa9QzbstJ1w3lTBC+Aa/PR4NJiSBBFoF+vVAd8ebOl/vnhhyZWzxUFdnZH3VOfQYCo/BEGJWcPut2uIRjXONpVG11E2l64ZyHcomGqkg/kzzSSMwowe/ihqg2LXTPQ3HxmFrUebvZU=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by DM5PR1001MB2265.namprd10.prod.outlook.com (2603:10b6:4:30::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Mon, 24 Jan
 2022 17:17:16 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c%4]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 17:17:16 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v13 01/10] ACPI ERST: bios-tables-test.c steps 1 and 2
Date: Mon, 24 Jan 2022 12:16:52 -0500
Message-Id: <1643044621-15892-2-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1643044621-15892-1-git-send-email-eric.devolder@oracle.com>
References: <1643044621-15892-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0055.namprd04.prod.outlook.com
 (2603:10b6:806:120::30) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97920c8a-7138-44e6-09d8-08d9df5d5e7b
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2265:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1001MB2265DFED585540381EC63D8D975E9@DM5PR1001MB2265.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4iqRG85fdMV7o+DKvdiKZ9ypl8kUAEm9U8BVftVTRe4LT9IpqGxHHqWrUh5biHr+HNfxdgkO8dWwUZP1P05pcwQfyqXGD+GoyBDDMGo7KzG1tTi8mWdKMSZhDKMgZ3LJv1P1wcBgauF4lGfWcVRvr2oiR0yMIMO9fPwDdcwAImPy/8H0ecpkpFgJTVcL/9xkjhy4ajvY6YmHrzaUVSbhy7b57BreD2Kwt5NgU+E9o/Po+6y6BpAi1U6D/uUNUyDupqAP8KG9qlkR569VeNvakHLG+ICKw/stdZkyXD4rvVpanHVST6+NiJvJlTsjrgFHweTZe1fp8eN2GmwWurZPWild8Vnb+HXikdPLEtiz+QMYai55Kbk6h3t/Y0aXeRpzRrb3oVRne3U6E5Ifo+HVIqY1WPkzXss6sgEsMrT6NO+uAdwdPImCF0/vmYr86pBDojc3ALcIBFvVuoPEDAXZJr50B7jeRFMc9LzwisEFl6apX0sr4Ol6FhI/WXDNGK2Z71/wLtEWtBANIGCQMe4uebiEwf5+M7lFB30uL8Oqy0cBLiDuk5z65EsvN8UxVYws9VoVI7G3ElPig7GtHy+iE2RCXuJIT7Nlm8oHJEJRAhUrt2VeNckeDi8It9gAXOtROYG1sONI1+9votdBH0HHIeQYULDCPmgmmf6DLHhgdL7CQuOq+xcykoECJul3JC2iHx4tMYGrVbuWGLy098TUxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(5660300002)(508600001)(6486002)(316002)(6916009)(66476007)(186003)(2906002)(38350700002)(38100700002)(36756003)(52116002)(4326008)(66946007)(6666004)(8936002)(6506007)(8676002)(26005)(2616005)(107886003)(86362001)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9t8pnlxwHltci44lh6vf5+zIYsKPwJq1Cdr+2/ZZ9EyrXwxiOso0i496yzsI?=
 =?us-ascii?Q?rBdh63nQ0ku8YY8CHw06a883HrVE+oAc93LlQTXAHhauu51wM8g4CceZDdfS?=
 =?us-ascii?Q?OqvWeJ38qw1FZucQSKVR/elHccVxtQkpeZKxcH9cHdt5DF30LjsQL+Xekcyb?=
 =?us-ascii?Q?OQL8fGLKDUKShJoyZQJtuN3No8mZhLg6QqfVlzYz7kVuq5qVaBs8xjYLlq2/?=
 =?us-ascii?Q?q0M7Qi/kfTeaueg5VmyafwwpeWtqC5AIjyJzfzIM/aFxEUoabqSSI/jT40dn?=
 =?us-ascii?Q?sxP974H+QODBmXjCaD5DK/otaxUwCtcEdaxbuKzGbH8xLFVnzCXWjZ2Owusu?=
 =?us-ascii?Q?5RHOucqRSHgWLKmxA5mpLYUV8G3/7yicNfp1XDLCyLETd16VUmuVdzRCbv0F?=
 =?us-ascii?Q?DGQ5zIT6yFO41scP65pCgyaPpVSz0rOGY2VADX/qMaiBAJ08Ql4MlDCdir0D?=
 =?us-ascii?Q?Wir+q6MkomNqFqvZ7TkQD0VbyuBq1ln9ZMA00la5xS9H9/Y6BX5tCvbTIEQ+?=
 =?us-ascii?Q?RlLFpnhQsjBOl25TH6FX2ZLFLQpzynzTpc003/cFMWsU/rIFRX6eK17FZoWX?=
 =?us-ascii?Q?uLWRENhI5/ny2PIcSOrkc/AtMIoTZDC/ZER77uTowBY4Js2IWjGFYrFf2L5f?=
 =?us-ascii?Q?8y5+bscxwmg+QAMopxNPAFXogGNYdR3Suf4qLaFw/jese7ABS/VKJBHx2Xez?=
 =?us-ascii?Q?pt0VWzOtLUIfjOafI3jmNEwcQgAhv325j15X/jTowrX1lIBiP7bMUAukjUqV?=
 =?us-ascii?Q?45q8/TXcSmNd9jZNwsNE+282i9k40sVZiRLUDtmLvmYZace536U2syO8buxk?=
 =?us-ascii?Q?Xhpzp+oc4nLldTrBDSv6982Wj00wZ3oFeuuPUiQ2S89M3h3xMx5+S7BumQV1?=
 =?us-ascii?Q?2U1AgpzbN9W9+0lLtK0RdmiWUYkBztWwG1YF7ka5qVHFkas9N7k7IvUzfujO?=
 =?us-ascii?Q?EHFQ5XkIpF3ZTuirK0qlwDVqLKfcRmS2HVmn+JKNPM50yu9P4jE5aShrHbV1?=
 =?us-ascii?Q?whwYQ0T3/qj4H3V6JcVIHyCUWSusOretHCqxcyseZftKdtYPwC1uR4F6PFJu?=
 =?us-ascii?Q?Yxg3i8Q8N6GbBJSI93fJ08gh16gNJxpLaC+Db1kTaLYR8eQxzWAK5+CUgcxN?=
 =?us-ascii?Q?qH0DppLdScOv8DcQ/QpIJ12opC16X+3kVgM2QDa5+BT0Iv40B071JVfemZoK?=
 =?us-ascii?Q?043tZZJaBgQ/jIUZWFc7KEZtzM7pZ0qrkJs0xj9OaR9vjLTQBZPtQKw0tGrd?=
 =?us-ascii?Q?FSvePeVTxdt0GedSDFc7RJW7ggMqXRWrHpfhJvSj/hJuTAiRmvpBBYRpVzH3?=
 =?us-ascii?Q?5CV3MoMlMMJtAW6Du2HDOSd/8NAywg0XO1F8HBhWOqWPG+wykSyqcfChAUnC?=
 =?us-ascii?Q?OW6Tm1sspV2zQTmwkzCzqDvjkEKJmvb+ke5CeXubrdFxBbZmUDV7fdow1xsk?=
 =?us-ascii?Q?pWNt3/blD1tdO18t6lT0EgUk4eW2KcNsdZpr4EdoRS+0Kna2fSY3tByrT3k9?=
 =?us-ascii?Q?vJlcjahZ9/ksaVPNLpocOsJT6p0LKrkn9/X5AdIqIC+MHJNv84wR+q+3NWOz?=
 =?us-ascii?Q?tPEs26/azi0G3mIvnLuRgi6cbO4g6R2X85GUpeaARAT9HNvSSCdhVn1WJofV?=
 =?us-ascii?Q?enuyvQN8ctmhWGbqhvmZrhyLXZ4+T1hSVvgZrcQGzUv0e15AYgXjEGEG3yoG?=
 =?us-ascii?Q?g/rujQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97920c8a-7138-44e6-09d8-08d9df5d5e7b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 17:17:16.2209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fOcwUvjtp5hm9qU87QJpTb+4Y0ttJOfX3bpgBexLTWYy4bT1/j3NZYNJ88aWLchPWSFSpbcHfo5d7Ca1hnX65wPOYNBpVLDgdx0+XN87MPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2265
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10237
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 malwarescore=0
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201240115
X-Proofpoint-GUID: ch3skR8NzYU8pHhPagN-zm1qncr6hdag
X-Proofpoint-ORIG-GUID: ch3skR8NzYU8pHhPagN-zm1qncr6hdag
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, pbonzini@redhat.com, ani@anisinha.ca,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Following the guidelines in tests/qtest/bios-tables-test.c, this
change adds empty placeholder files per step 1 for the new ERST
table, and excludes resulting changed files in bios-tables-test-allowed-diff.h
per step 2.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/data/acpi/microvm/ERST.pcie           | 0
 tests/data/acpi/pc/DSDT.acpierst            | 0
 tests/data/acpi/pc/ERST.acpierst            | 0
 tests/data/acpi/q35/DSDT.acpierst           | 0
 tests/data/acpi/q35/ERST.acpierst           | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 5 +++++
 6 files changed, 5 insertions(+)
 create mode 100644 tests/data/acpi/microvm/ERST.pcie
 create mode 100644 tests/data/acpi/pc/DSDT.acpierst
 create mode 100644 tests/data/acpi/pc/ERST.acpierst
 create mode 100644 tests/data/acpi/q35/DSDT.acpierst
 create mode 100644 tests/data/acpi/q35/ERST.acpierst

diff --git a/tests/data/acpi/microvm/ERST.pcie b/tests/data/acpi/microvm/ERST.pcie
new file mode 100644
index 0000000..e69de29
diff --git a/tests/data/acpi/pc/DSDT.acpierst b/tests/data/acpi/pc/DSDT.acpierst
new file mode 100644
index 0000000..e69de29
diff --git a/tests/data/acpi/pc/ERST.acpierst b/tests/data/acpi/pc/ERST.acpierst
new file mode 100644
index 0000000..e69de29
diff --git a/tests/data/acpi/q35/DSDT.acpierst b/tests/data/acpi/q35/DSDT.acpierst
new file mode 100644
index 0000000..e69de29
diff --git a/tests/data/acpi/q35/ERST.acpierst b/tests/data/acpi/q35/ERST.acpierst
new file mode 100644
index 0000000..e69de29
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523..603db07 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,6 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/DSDT.acpierst",
+"tests/data/acpi/pc/ERST.acpierst",
+"tests/data/acpi/q35/DSDT.acpierst",
+"tests/data/acpi/q35/ERST.acpierst",
+"tests/data/acpi/microvm/ERST.pcie",
-- 
1.8.3.1


