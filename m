Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1266C42599A
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 19:35:11 +0200 (CEST)
Received: from localhost ([::1]:35322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYXIU-0001Me-3Y
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 13:35:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mYWzI-0001pC-FY
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:15:22 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:42944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mYWzD-0001zp-6C
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:15:19 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 197H4pHb020991; 
 Thu, 7 Oct 2021 17:15:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=0pnkBo0Jo0Mv2Z/pP8Uw4ieZq+cGWDm3B+qrm35nYuQ=;
 b=RwxCzUy76tEmRaWFz76IUwZIBQSJqwJhLnEhEMMi7lmTkcuNMi5MrJ9cHc6kR+InZwdQ
 kPmJV558bH/rE7R1Gl5jULztPjYZm97uQ7ghZWbfYMd2pTLg2S1r//Vn+fkrJVTu0G6M
 0/gynZAdyDIK9wQerTLdsXq58WN14/zmMs9/bc0leQkVJ3pXAua9mVljF4vrN5l9736f
 XuJPJifify3nZhECbItsWAan4VfeIYUpO2LIY53waITI8FZoT5z/Fuz+fdWmpYgQl9S2
 NMKFVLmNCgZy9aoNbvGbgYy+Vy+IG/cKobr66A0Y6tpnZ6HNBfsuyMpZDMmr5PpgTmgL +g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bhwfdkc6x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Oct 2021 17:15:10 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 197HAnnF119620;
 Thu, 7 Oct 2021 17:15:09 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
 by userp3030.oracle.com with ESMTP id 3bf0sak5y2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Oct 2021 17:15:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gupm39fX0SPX20yX2PUmJhSeUFdekJTqvHQAbV1r34GqX77lwlchwa/m+k/Wt7A39nFngukK1JzS0hnAxtOzyo32z4SDj+FT7ZT+tBjii2nz0JZ/YVNdYZAPpOXvVcW6yzHE5bD2GYtA7+aOKHTXpBCVtYJ0hFXd9o8GkERJom8Y/z9qGIsZ2NvXWE5ASNfBUDs0re63q/t50TlvWO3rjW+Q5+IbnPnVyXLdBsuQn53wBseWrTg1PqdYu8v5Yt2pMDdt34xZno4Ol0QyYPB4V5RW0vIwK03Dgu/9Q8nvm+EGrVz6kypqrnCAl+vVe9xiClkdXkQ/V31/EiUnBNwzbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0pnkBo0Jo0Mv2Z/pP8Uw4ieZq+cGWDm3B+qrm35nYuQ=;
 b=JaCCqUSyfJNoeV0lDVFwj3XEe6/15KbC8d3q7HwZWu3zu/vStYHXE+dw3FpSJJ9N1b4N7educJ7MYh6stKGZOa9ADg6zhxDgNwV3DqMJiO5ZQSE+wgiL+6s6a8XMQ37T5K04IfAmI5c32N7dn9RM13zKEAMJ1HZMWAq/T7ienVzEj6iylIcZHmIm+d47eYv0AHIiwMRYWKBeZnY9URTshQIm9dG2k4bbFtxmljcWcW7DoDKSz7afU61eRS0iST071Gi8TTcMnayKruncues3DDMVDbwuqA01ID8zJXqM6M7PRIwjIMOS966ZdIuxKKJTeu3pz0v9MrzqYXXs1znF2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0pnkBo0Jo0Mv2Z/pP8Uw4ieZq+cGWDm3B+qrm35nYuQ=;
 b=k7kVjhZURi7Dr566+yS6lAkyO2hH1a4kYVeEnonzN0KxyUc/BtSvkHk43m5FNmqdX0KORNPnsgY7zScDtvuygIfLlU7Cq0edGkuK9BmPcpDVZuU/fPAURHEUxFRBtWkYyo6OSnrLb+cClXtgWbRJPkjm9aHkeSuEvA3EncT6XGg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB5524.namprd10.prod.outlook.com (2603:10b6:303:163::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Thu, 7 Oct
 2021 17:15:06 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6%7]) with mapi id 15.20.4566.023; Thu, 7 Oct 2021
 17:15:06 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 09/10] ACPI ERST: bios-tables-test.c steps 1 and 2
Date: Thu,  7 Oct 2021 13:14:35 -0400
Message-Id: <1633626876-12115-10-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1633626876-12115-1-git-send-email-eric.devolder@oracle.com>
References: <1633626876-12115-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: MN2PR08CA0015.namprd08.prod.outlook.com
 (2603:10b6:208:239::20) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 MN2PR08CA0015.namprd08.prod.outlook.com (2603:10b6:208:239::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Thu, 7 Oct 2021 17:15:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14d9c685-500f-4d81-4f59-08d989b601f8
X-MS-TrafficTypeDiagnostic: CO1PR10MB5524:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB5524491B3DB90181AAA9EBF497B19@CO1PR10MB5524.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2Ey1PhUngfzZi+7fu+36EJAjk+0h5H0uSEypnjiUr4s6RYl3lyd545/5fOB2oVyvhWPtGVW4QX7E98O3Aic5s3ybnR6gouK2UQIMZHxglpoPuZjYtA7o5QlflpEJh7s5jG1mnJKQYlBSclvDgRM/3hkp5qG99s50mcwhqDhacniGu9XsZvgnqO1RfcOmSN24IYIdO1R3j/BhHj6eJq2XlDvFAvcy/akRsZYDaW0VEA3wucgIjxmthn5vnSCqwLJ+zHBVyinCt1jV4zPP5NLgKk9WduI2VLT6XEYsfi94f0cjsjF/3VWh8mbsvPETE5oQNkgKszA16Ghu8iMgCGWn/x94xzpJDF7rcO3MklD3t1tREytJhS+xcUIx/rae355OsxFx25u5NhhJ21VNUduHtOE3dmcijSBTheDigj9IGPXLjgwyjwz+ztD6C7NRJlh5i3lz9a3/xzAYdfQhMaFM/KfmGNnCTmi3jf+pAAJxu+Obq8usHCdGAwu5/Vn6iiKPRjYB3uZHG/dPlbQbXPYGdMS29qnttNWBhpq04FtoWR5cyPQgy3vkyBM122vGzQFP6qCL5UTT3URoyFQvt4EprL2Ir0m+UbgFb16bm6ddawofk/PqljO8K4izNkqMKbFQVNgsCavkBkj+uhmLZKFinPeKvJBGkbpThD3Vnr5kzeuzkJIXESU3GnNILPfgWuRgr9+48nFnejMnrjhLz1n1Mg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(6916009)(38350700002)(66476007)(2906002)(36756003)(66556008)(107886003)(5660300002)(316002)(86362001)(8676002)(2616005)(8936002)(6666004)(956004)(4326008)(508600001)(186003)(6486002)(52116002)(7696005)(26005)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WbIf7ZkXWoFSju9G4v7+kV3czdMc4jA47NN0G+KKo7mouB/3VLqeU1bAK6D8?=
 =?us-ascii?Q?b07pwiJppu2FaVLM8jmT7Xy77UlNkm3EPMHsGnjlQSscXh24jzh4oCDk2m26?=
 =?us-ascii?Q?YcQkQFupR3Wo0LfSEHWmERfjJ8LL+Egk3OwbLrfsh7h8x9ml95WBcOXaaOup?=
 =?us-ascii?Q?D3GB7LRCETSxxez4SX/IyTyJZEgOyABYJg0TONwx1023KpVO0KPiqOds07hq?=
 =?us-ascii?Q?Q21Z2c63TVMKdNYGMbeKTwHCVJOJt/CfUgWPQAkfZbZyXDyXbm2/a4qdxO5y?=
 =?us-ascii?Q?yC40KV6FxuVRxA9hwEtgMpDNMirKSsX6svjEsyoWgyJQWl4mm0mKY4sVHFSp?=
 =?us-ascii?Q?sQfKzjHz2ScVY2W1TfBfxvprDTmq0A9KGx8+QVknzRPMJgVZ/J4MOeEYO6ct?=
 =?us-ascii?Q?PGiUT7Qm1LxEhv6r1SR+DUqMJITYZia0l1mxCkULwDVS/jVcQQOd30xZWRCl?=
 =?us-ascii?Q?3iRgO9Q8ExzGCA1zUDPqmFVmaU+EkQwYvRzwv/uhEFNa5aCNv0NbJeKsDBhK?=
 =?us-ascii?Q?7i/dN/bmd7uHSZDYjV3SDzSj3UNRcxkmii014NDT/BwXznICtyusWSKQyBeN?=
 =?us-ascii?Q?H8i7DWFlOHzBIXRAovVofI3YAkGUeXpDd+0osq4FxzHr1cD/uyhsdmwWY9tC?=
 =?us-ascii?Q?+J19mG68n2FuyTKc5cKYkS1cJpQOI4EYyZE/PzPETOc0E7nabfSb26AvWskV?=
 =?us-ascii?Q?rlAgo9MRVn7CKMWd+Hfhex67BoD9O5G6b7w9+mMRI78yVx6MVol5N0dUuXys?=
 =?us-ascii?Q?Z4KwQqwOCvcya3DOrIOlsH3AvPkqyBXVEHV5c7Akbhb56mPPkQL5mIJVj2yH?=
 =?us-ascii?Q?wwobUOTSkiJFSZEiBAe+y3w8fUBRgaU5Clc2kZi1Zb2OT1q/GUrP7mibwxPy?=
 =?us-ascii?Q?idJTshTuY1b1qE0jrsbPAlARENPCI4Kt1a6Mt1hOI88pr8DUaSVb4sCIrB+e?=
 =?us-ascii?Q?6N7KuAku76gaPCmepSXVUs+9zwk625Je78c5/Uz736Qorj/1jhTPBUlKuuHe?=
 =?us-ascii?Q?7AKrDf5cxutpt2exqLPtup+TgMMErJVqxiFE1cY+3mhLx/pWD9wK5DDVhlVb?=
 =?us-ascii?Q?QWp+Bz0GU01hkjkgVsGzL0YdrhBqOKkCaeh0w9JY2cbC8h1P3rVI/jWkNDOB?=
 =?us-ascii?Q?yC0pZqhw4hFsnVhlzMUufImkF0zyysm7EkI50DJyIhwKarUm3uVIpnqgjqTI?=
 =?us-ascii?Q?ohycfoc37WOpPXstu2j8QW6zSqf+o68LibufikYzxhxvbg2kIbOaPhH71WG8?=
 =?us-ascii?Q?qc/mkEeZvDFnpSxRBJtSjEG9cSaW3PbtUjmqnp35BzKM6uKo+u1bfxeVERYd?=
 =?us-ascii?Q?SolLumiitWdG1FTJY3abPNjM?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14d9c685-500f-4d81-4f59-08d989b601f8
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 17:15:06.1481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Uqj4NH0K1Um1ymn2lQz26eoa9XKn4x/t257IyVJQyf04JSrxowB/eEAJ8OpxUs8hzXe4eGgZH/AADK4NdMMMd1+LNUax78DXwvXSwfiDLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB5524
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10130
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0 adultscore=0
 mlxscore=0 phishscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110070112
X-Proofpoint-ORIG-GUID: wIdcVV4e8b3k6nITadl9qjaG8KDPPTiE
X-Proofpoint-GUID: wIdcVV4e8b3k6nITadl9qjaG8KDPPTiE
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 tests/data/acpi/pc/ERST                     | 0
 tests/data/acpi/q35/DSDT.acpierst           | 0
 tests/data/acpi/q35/ERST                    | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 5 +++++
 6 files changed, 5 insertions(+)
 create mode 100644 tests/data/acpi/microvm/ERST.pcie
 create mode 100644 tests/data/acpi/pc/DSDT.acpierst
 create mode 100644 tests/data/acpi/pc/ERST
 create mode 100644 tests/data/acpi/q35/DSDT.acpierst
 create mode 100644 tests/data/acpi/q35/ERST

diff --git a/tests/data/acpi/microvm/ERST.pcie b/tests/data/acpi/microvm/ERST.pcie
new file mode 100644
index 0000000..e69de29
diff --git a/tests/data/acpi/pc/DSDT.acpierst b/tests/data/acpi/pc/DSDT.acpierst
new file mode 100644
index 0000000..e69de29
diff --git a/tests/data/acpi/pc/ERST b/tests/data/acpi/pc/ERST
new file mode 100644
index 0000000..e69de29
diff --git a/tests/data/acpi/q35/DSDT.acpierst b/tests/data/acpi/q35/DSDT.acpierst
new file mode 100644
index 0000000..e69de29
diff --git a/tests/data/acpi/q35/ERST b/tests/data/acpi/q35/ERST
new file mode 100644
index 0000000..e69de29
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523..c06241a 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,6 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/DSDT.acpierst",
+"tests/data/acpi/pc/ERST",
+"tests/data/acpi/q35/DSDT.acpierst",
+"tests/data/acpi/q35/ERST",
+"tests/data/acpi/microvm/ERST.pcie",
-- 
1.8.3.1


