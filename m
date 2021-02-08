Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E733631443E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:46:42 +0100 (CET)
Received: from localhost ([::1]:41960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9GEr-00042y-Vc
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:46:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1l9Dc7-0000pd-5o
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 15:58:31 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:56716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1l9Dbx-0002hx-Rt
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 15:58:30 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 118KuPBf009595;
 Mon, 8 Feb 2021 20:58:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2020-01-29; bh=gNuqm09S0QUUGCWPZtzOPx8nTyqq1AtMcCX3KoZg1qs=;
 b=wDLKtqSEjAawKw6Uv+EERY1vbUMBEkLKvhLb/EpXwUdR8bLEJhxQ887yJnXw4i0h5R0Z
 xY2vsPc401aQASiuSMKU4ZM1sLrRl5C+MXgZTYhn6sB69ab828AY5URfSeRT1Ba2cPEv
 vz0GTY9RZjhBRWSthOzX03emikMPn0t9FvbAK6en6pC1iODJGONHdhALKgAZK13//VYN
 6GoQaxS9YoRAW6GveIfwrTzaC6qSZiQbi3sSFR4raAHKS9DyAIW6i8F+E0GyIrv4s3Bd
 vsAGUFqTg61WYTXygFysn6cB3A3+mHNRFpAyiQKX8mUfD57JgItbtq3YkjDI+d83UwbT 4A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 36hk2kdc5t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Feb 2021 20:58:15 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 118K5MCK020904;
 Mon, 8 Feb 2021 20:58:15 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 by aserp3020.oracle.com with ESMTP id 36j510b3ac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Feb 2021 20:58:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SbDc1IWikXB6AjevTkeOkas341gH/j2McNHDtNxY5t0iCHhdrdx2nVk9oWq7+DhMRBzhL00nTOWfFCOPrKFg7rspHER4IHm3uF7bZNQgTNOIElRQu4NgHlwb63sK2Q6ULK5a6gDSc1sp+pkL/7K0AN1J+HFbogproSrs2Pxp0VV5iOunjDtNlcQjTw7XUfol0wBjzp+61yX+icu3yG4gZKcxR8SNs3qOXYAtJDlCRMRr+rLJ5QokVsHGBqkCMivglbAz99uAnf0kWuuy3sIycK8Jgsdaa5ZTz6+GIltaeXZPFCYX/ForvUYNIwFb9m9bUKFIkKwnfO29fr6kAeNS6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gNuqm09S0QUUGCWPZtzOPx8nTyqq1AtMcCX3KoZg1qs=;
 b=Ox82TcLBzFo0ORTWa5gCx+P7XdkcMK2t7XF0130CdWjIoPENqNGmWHp3SeT5RpDDURM4Q3urySz1jNx3JSzzWEO8A3enkJh0WRftwCkhyPqdB/kKO9hFmTzHVC6qWkOoJY/NuYvrmDNgyrRfW3bDmjgK7Q0znufaYvNnUDIwnxYrKhN/6ntqleTcOY7tJwvGYxfcSCkKhWvqUq8GFNcmFHViW3HVf8Q8rPsz5Om1RM7AQ76neYE3otLmC46xcjKYbkaQtWYAW7wD0Cv2PfzBBmmBUNlW/yEaWRm9Z4uGPKiddo1TxYE1/RDH8FUg+/45+zeBevgmQ30lkcNjCg12Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gNuqm09S0QUUGCWPZtzOPx8nTyqq1AtMcCX3KoZg1qs=;
 b=WJJf4/zmMfI84GG9KM9xRxOxU780YK7h8PMkSjH3jQ8agShXaq2r8wzJR9vaTAuW0F873QMWOjWGzf6mH3KDik2qk9cw2nngsDdJEYW5rT6TxRXWtDe+sivX00igGI8mUDHf4Lx6gZUIq4sx+F1MQ0VRdSPRsRCLvShZ09G03Sw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1599.namprd10.prod.outlook.com (2603:10b6:300:28::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Mon, 8 Feb
 2021 20:58:12 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::1193:5eb7:7993:85a2]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::1193:5eb7:7993:85a2%7]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 20:58:12 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: mst@redhat.com, imammedo@redhat.com, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, rth@twiddle.net, ehabkost@redhat.com,
 qemu-devel@nongnu.org
Subject: [PATCH v2 0/7] acpi: Error Record Serialization Table, ERST,
 support for QEMU
Date: Mon,  8 Feb 2021 15:57:52 -0500
Message-Id: <1612817879-21511-1-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-Originating-IP: [138.3.200.23]
X-ClientProxiedBy: BYAPR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:40::37) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ban25x6uut23.us.oracle.com (138.3.200.23) by
 BYAPR04CA0024.namprd04.prod.outlook.com (2603:10b6:a03:40::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.21 via Frontend Transport; Mon, 8 Feb 2021 20:58:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e4251bc-9863-42a8-f467-08d8cc743f5f
X-MS-TrafficTypeDiagnostic: MWHPR10MB1599:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB15998BCBE88C02424F659305978F9@MWHPR10MB1599.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iJvs+rcgGyWbxp5ukGGA05keH7vtBD01BoeZxLU6kxQrZXCXOjNLdloJmI3sSglbA+QKJEfkozoUUvmxznEiGIcsl+kDlWXdfc+7lHOYgiL1PUYDD75VpbwqSoGhvU9HvRh3kFc2GdgeU2S46Ro2XM+tKoHVbW6ah/nkM63J2dd/CfjS4EYK7pPW80ciZvOokNeA+ff/aRrFgTkTlgv5YkC/Bi7KwBfJ/+xMYAHdfr97N1JnfMO5rg5E3uKpYlj2mLOWSwdhL/XCk2hcKEt2tchYyL++ClhNiFQN1N60CGzVnKja7ZnvYB0hY42dy2rigK0r8ch/cirt2qKClaOMJoCmCGZZsY83pHOplbw/CUbUZbgPfG6QPYk+mysw6pOx1mGMTaZktvKMXI1yksMEeca+pZRkXDMxAazoVneVe9/kQ8E6Od15YXrADugKryW4yb/CFzH7nzzVEZ7dU2nKz4G034Zhq7x2PIrCxlaGItfeq1/rHr6LT9QDJu7wSej/FET2XKF/lLvRRhOZYx6J7FJrhg4ua5wg8pw0ZwRiCqC9X7OPwDj5m2BLsGdQmwVDambblcJ5fCXuw3zBtyait5JiH4scARO0k/jAa9FFTZw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(376002)(396003)(346002)(39860400002)(6666004)(4326008)(316002)(2616005)(52116002)(186003)(86362001)(36756003)(16526019)(956004)(966005)(5660300002)(45080400002)(478600001)(66476007)(107886003)(8936002)(26005)(66556008)(8676002)(66946007)(6486002)(2906002)(7696005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?F4vc5AD0kArb0Sn1zEN8vbptc2oZ2wjJ8gIf1ToQhluf8QxeFr3ydJrhPYp4?=
 =?us-ascii?Q?5XV5BGOT/AePeKcGqhq/BrMGdr/8Qfp02ALmWksVhulPGmgEQGwpba1glASY?=
 =?us-ascii?Q?Dv9aWaOclcizpuM+mfKD8L3/Tx4l4UjfQQvmokun4LEI0UN8o0tXwTpe244A?=
 =?us-ascii?Q?N6bOnSqvPPcE0UYEYPdJpctyADgDZTqEMMdskaf252VpIXxQ1Ib2+Un4wJkm?=
 =?us-ascii?Q?i43RujtnaenaH813qKPCpfRtU2oOmzaDNGZ74l5I8wkMmTCE70ix5LfTBSEq?=
 =?us-ascii?Q?/q05s350/6aRanYI7tWJ0F4abkAg6hQo42zJqVtLQMuKs5KTFJnmoCLofuBQ?=
 =?us-ascii?Q?GgSp/wAoZ+5/eDSTO4qywjcLzTQxE7UeZklSSz3YY/Hr8uHC66oZechIHZSR?=
 =?us-ascii?Q?V9bSOdCqTrFFiYcGAe7um6DYSI/H+CKM891Ud5N1FCyybguelu7B/8uwo90B?=
 =?us-ascii?Q?rGc8QqJ4CdoV/Q9cVWcURAgd+tL7EmB9wlKScsgKISEhXXfyYs8ge0MItl2f?=
 =?us-ascii?Q?MQooyEFWXx+OZcokHhy96STFgr/MqdjmXqEIQmKPmlXWeW3qGxzYRK3bMDf9?=
 =?us-ascii?Q?u7RSeP/FIKHsMFIGiKsfoRijyxFTY6d7KDnI22QXNrF1M2xJQyPoa744JVzq?=
 =?us-ascii?Q?T4EF+DGOzXae/FOkCog//Tb/fuAEawncWQ5HhVz+P5AkpZU4NlqlCHAq6k7V?=
 =?us-ascii?Q?p+ytmP1eAnHsLrSEGumkaeuIDP759toooo5lq6+BPe7w2GWhvXThT66auN2Q?=
 =?us-ascii?Q?hoZD5aO27dOTdbzD0RfD+xPJAkEMiIFjsbTFasuggex8+OhD9Ge/3BvtOw6z?=
 =?us-ascii?Q?By3KNIaz9sV5D/wQ8DoLrTCYEPC6LhU0v3KB3yQms+mW5aRhfLw92t6YF7wT?=
 =?us-ascii?Q?hkS1QWKVqEevISuxZeYnsuvPJzr6fxk8zypPjivNBOicsTneqMaz0WSS0Ta+?=
 =?us-ascii?Q?XDoXKQpF+6e3O7N/duSv7kPDg1xJLJMPlr4K+g3jonxkgwQg3T0dm15/K6oD?=
 =?us-ascii?Q?k5esyMg05w4RIsM3eDiUIkgLyep42/CPZWhxYoy3npu7vifEseKwyw0kAyf4?=
 =?us-ascii?Q?cyTILRM5mN/H6TtOF51NrFUbngewcuaDOlwi9gkmkYiAAOD5oG58/0hZiyIx?=
 =?us-ascii?Q?2HeZhQWKdpH1/NmsznsYT8qgkLp2hrZ6XGaI3AR3sakcmAj5UHzUO0QLrJV4?=
 =?us-ascii?Q?SM4O5ViKiOiGV2knV+z7gHP2ZQ3tfYoS+ErmK8dqaIsbK4gpmMlrT1+AGUrf?=
 =?us-ascii?Q?5d7gITY52+6vonyHv/1QV9Xgr0aSTn+x4m5UuhT5efWYSl2wsuUpVvgzGk+V?=
 =?us-ascii?Q?RywwnkoVxlx44rt9FNM44KnF?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e4251bc-9863-42a8-f467-08d8cc743f5f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 20:58:12.6422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EDp/yxXDFFuwnaFWdFPm/B/EnLhW2CqTknxh20gSGKKgvVyMMB9g8T2jx5nf08KR6xUjjO24MBHsE4RKGX+LEregO7Ddz267IBhWF6eYuxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1599
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102080119
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0
 priorityscore=1501 clxscore=1011 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102080119
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=eric.devolder@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: boris.ostrovsky@oracle.com, kwilk@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset introduces support for the ACPI Error Record
Serialization Table, ERST.

Linux uses the persistent storage filesystem, pstore, to record
information (eg. dmesg tail) upon panics and shutdowns.  Pstore is
independent of, and runs before, kdump.  In certain scenarios (ie.
hosts/guests with root filesystems on NFS/iSCSI where networking
software and/or hardware fails), pstore may contain the only
information available for post-mortem debugging.

Two common storage backends for the pstore filesystem are ACPI ERST
and UEFI. Most BIOS implement ACPI ERST; however, ACPI ERST is not
currently supported in QEMU, and UEFI is not utilized in all guests.
By implementing ACPI ERST within QEMU, then the ACPI ERST becomes a
viable pstore storage backend for virtual machines (as it is now for
bare metal machines).

Enabling support for ACPI ERST facilitates a consistent method to
capture kernel panic information in a wide range of guests: from
resource- constrained microvms to very large guests, and in
particular, in direct-boot environments (which would lack UEFI
run-time services).

Note that Microsoft Windows also utilizes the ACPI ERST for certain
crash information, if available.

The ACPI ERST persistent storage is contained within a single backing
file, with a default size of 64KiB. The size and filename of the
backing file can be obtained from QEMU parameters.

The ACPI specification[1], in Chapter "ACPI Platform Error Interfaces
(APEI)", and specifically subsection "Error Serialization", outlines
a method for storing error records into persistent storage.

[1] "Advanced Configuration and Power Interface Specification",
    version 6.2, May 2017.
    https://www.uefi.org/sites/default/files/resources/ACPI_6_2.pdf

[2] "Unified Extensible Firmware Interface Specification",
    version 2.8, March 2019.
    https://uefi.org/sites/default/files/resources/UEFI_Spec_2_8_final.pdf

Suggested-by: Konrad Wilk <konrad.wilk@oracle.com>
Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>

---
v2: 8feb2021
 - Added qtest/smoke test per Paolo Bonzini
 - Split patch into smaller chunks, per Igo Mammedov
 - Did away with use of ACPI packed structures, per Igo Mammedov

v1: 26oct2020
 - initial post

---
Eric DeVolder (7):
  ACPI ERST: bios-tables-test.c steps 1 and 2
  ACPI ERST: header file for erst
  ACPI ERST: support for ACPI ERST feature
  ACPI ERST: build step for ACPI ERST
  ACPI ERST: support ERST for x86 guest
  ACPI ERST: qtest for ERST
  ACPI ERST: bios-tables-test.c step 5

 hw/acpi/erst.c               | 952 +++++++++++++++++++++++++++++++++++++++++++
 hw/acpi/meson.build          |   1 +
 hw/i386/acpi-build.c         |   4 +
 include/hw/acpi/erst.h       |  77 ++++
 tests/data/acpi/microvm/ERST |   0
 tests/data/acpi/pc/ERST      | Bin 0 -> 976 bytes
 tests/data/acpi/q35/ERST     | Bin 0 -> 976 bytes
 tests/qtest/erst-test.c      | 106 +++++
 tests/qtest/meson.build      |   2 +
 9 files changed, 1142 insertions(+)
 create mode 100644 hw/acpi/erst.c
 create mode 100644 include/hw/acpi/erst.h
 create mode 100644 tests/data/acpi/microvm/ERST
 create mode 100644 tests/data/acpi/pc/ERST
 create mode 100644 tests/data/acpi/q35/ERST
 create mode 100644 tests/qtest/erst-test.c

-- 
1.8.3.1


