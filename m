Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFABE4A023A
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 21:43:12 +0100 (CET)
Received: from localhost ([::1]:49552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDY5N-0007Iz-0M
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 15:43:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nDY0v-0004Dz-6O
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 15:38:33 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:34560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nDY0t-0002f1-3c
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 15:38:32 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20SK3sOv028584; 
 Fri, 28 Jan 2022 20:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=kw5zRb6fcbfjGiIjU/ZOl679L3q3FAE7+fmlUiHRVQ0=;
 b=0kshDY7REmrP+tGQboyaW6fDrygFkf4+HEmOXFK7ORpp/5xBWQMnplpoKaT3T2WEDBdS
 aKUjITLNhpAP8HcTkwMH8mWdzDi9v2aqAlqgmR7x++kbS0PyjOidK66QzRKraEmw2XPd
 AtewVQCQn2EojlYiaUNv15uuKyEuf3blBc1SMbaPPrMzVBzSQhYpcs4zsoadfKFAcCcQ
 9JgDGf5swcGomdIOw5y3oI2mgM5KHIpYSyEBD+Vbjv58NHdPOmqY2rjI5IxIw+oKeey8
 PBqHlEhieo/TJ8cF24/AyOSf/rTZU9vrA4mhTx6jy9+vSrSXdbBLMZZ+Q+OHR9Fs2jJH QQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3duwrxmeaa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 20:38:24 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20SKPpgT044218;
 Fri, 28 Jan 2022 20:38:22 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by userp3020.oracle.com with ESMTP id 3dv6e5m6hf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 20:38:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hhcsN9mXEaFrs10AqpHrT22I7Fr0aTpl9G2xJQ2idXS0MYgKjIGbBFelTvYsR6pYX6rgicbosjo3NAlpB4w6cVYXfVewOkwhAIWuQr3KKla7sh0f/H5hfRDIT5XY6YHDORu21kGbDM0Xdt5P8NtEAif8LTFwvuyrL2SJ/B6iLqBlSf1p0dC5a0KRfX9hbIlTyfltcmZUCoa7xHq1pDQTnyB/3WKlSvUeMDmzO+m70czW6T6JTTshx+jAiWmwyLzkw202ywCiP4uYN8OVJGoGRnZQEEeHHbs4g6uwxkvRLQFPRUFkrScUAoxiLCRJXNzT4tWMCMBOEokaQ7Zn5mLhiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kw5zRb6fcbfjGiIjU/ZOl679L3q3FAE7+fmlUiHRVQ0=;
 b=gktJ8j5C9526dXZr2+U7NV0RkQVW3McmZBV2TMpG/4dK5HwvEX886YYwttm3KD5kuKTdhYs+GqjQvLI0X8IPAsexLnyorwwaCxMjYT5oCQSkEq5ztWiIDKJQPfYKwfKtifwlNmaGq9d8TU4I4COxM2s6esfcgtgfXXl0vRi6z4t1rDK35uQ2Hi+sInIoPMRb0sQ87N6WQkyUKkXreSAIeFLrJstvPezRRh6AV9cxDfmlCzXATPuC9bdDCmadwHn8+Tj8B8ihU8C2dJpqywauMnxj6V9conQzn7zplAO9ipVoKU5apHfhHjOX/kXRBWklUCKQyt9Ix1XjUniY5pNtVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kw5zRb6fcbfjGiIjU/ZOl679L3q3FAE7+fmlUiHRVQ0=;
 b=lzl903oT05AsQPPX1Rbg10i7jtU8swKrw4ZVTmnAV0nYy7TK8QwQPrQCtqLAUGivIgvDB25SmbDgwfD01v2qUW/XSVNfxZGDvUlF/5clQchBZyb1uokoPXSU9NpqS68K2QQ1TIWfwl5PiVxxJ4yduxdKjdFcRMz2UZRNysSY1c8=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by PH0PR10MB5530.namprd10.prod.outlook.com (2603:10b6:510:10c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Fri, 28 Jan
 2022 20:38:20 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c%4]) with mapi id 15.20.4930.019; Fri, 28 Jan 2022
 20:38:20 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v15 01/10] ACPI ERST: bios-tables-test.c steps 1 and 2
Date: Fri, 28 Jan 2022 15:38:00 -0500
Message-Id: <1643402289-22216-2-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1643402289-22216-1-git-send-email-eric.devolder@oracle.com>
References: <1643402289-22216-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0007.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::22) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99190823-f36e-4e0c-419a-08d9e29e1ed5
X-MS-TrafficTypeDiagnostic: PH0PR10MB5530:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB5530011D193F7F3606DA9D5997229@PH0PR10MB5530.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dx+g0rMECq9Gk9RZ/3VnjV6Oa17i9Y+8XbXwIeP31L2TeSoMSPKDaZWcCW2flnzn0BR+QaiNUgwnfSsgJN3J2tDNCvIjZIIdlkFJMIqVcc53AsrhOLcEEFkB+/Q6LPlKV9EvALOogR6NbAIXsHYqQ4sde6GNcOpdfQXnW2lHziAYMXtLFtY8Glso20fyYxvpi8x4STxWleCN4cAIuD5gbkbTI0uatlbstLXSZgdpicuzajxWWxdyugQxfkF/mqiXCBY5ucwf6j72WK96xr5Rm5pjhZfBrcrLhUhlG45RlqNT/e2zGadKYWIC5zb3usJFd+4UEgO6KVWwsZudmWNX5sYbENFGNEmZWmFTJOBOKm3fJVzZsWADDeOS5oZM1m5tb7SxfKXUdfH6ItUK9jcFLnfrL9nHeL9VGo8LrxexBU22kExbJJ/aSYVe5S3joxYWci1dNnuQR7vECU1F8EH7EUo9oIMqMfuJAAmDg0tqh5YouiYBaWNMsLqewRpQoRlpFfjpyGJRJKmaw6ua41M9hOD51bnqgONeO+igwHGZZcwsiuS4ejt5smYnxdRfL7ISewhDATnm1DUvaQ86bK3Hj5XN2tgmcMMy3N65F5wlxpAiTtPTOYa/nBo03N6d2gTO2JKwIxJoz6VIXqGgLRtC+nVsYAxwm/YtQUifNl4N6KirAsB/Tyseb1Hws/1A8xcAVz925rvUHNu007/5Ls7V/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(52116002)(66476007)(26005)(66946007)(6666004)(38350700002)(6486002)(5660300002)(8676002)(6506007)(508600001)(6916009)(186003)(36756003)(2906002)(4326008)(107886003)(86362001)(6512007)(316002)(2616005)(38100700002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z21Arm68Y8KqNuqRC358WQALhXHsYBjiPLt/Ss4OZQHyqrmLvAq7YcWkTYoz?=
 =?us-ascii?Q?/bAJq4hKCNmTKXnu4CIM6pYdJxwNZRYYfEPRXxoCLiHfkTEe50TZqx8i+uYN?=
 =?us-ascii?Q?t46t2/bE/B+lZ5ICGvj6pN0w2fMs8jYKJk+H3fiJQQTN92Zudt4FhPlOOPOI?=
 =?us-ascii?Q?VFQC5Qqc/yBKDseCvMMjXUvYYAz1J0cyp4ijLsWdqzqON2WdHeHyFaCv38QN?=
 =?us-ascii?Q?OBRKecredvHwSbfWwZKiD5yPAy3x2PyPY2+T5tfaisNcKuwpgJ7laQCLbV6J?=
 =?us-ascii?Q?/RC/6MdksI8hw5oOs4fobh0MDhj8q+lZgGLEc829Tao4DEgt+F/S+UD6r2Ci?=
 =?us-ascii?Q?Nb2Hpc/lNMoK6EHR3bKVCi2PTTxG4IzOJJX5I/7M7HzQCdXCeDKoY7b80We2?=
 =?us-ascii?Q?WOAyKhS9g0zSh2/EihBc7j1c+MC8HbzfT2/f4hsL/rSC/7CWYvSJxQ4f3aUx?=
 =?us-ascii?Q?B9e/rnyILz3SJZMcs5i4YzzaoztHuOeP9v10LZfnSqpxwv8jZ6IJIJkr0t6r?=
 =?us-ascii?Q?iCtyhKMJvbU1qcUd/d0iRU3CESp/1iWn+gaMoTbhHK2ULS2bJQBmr05ZgBmf?=
 =?us-ascii?Q?YINYdDj/ggsE7l+h+EFENhHX5+b0Z5RQLqV4DI2GN3UybzzHJFxF4QmF6Puz?=
 =?us-ascii?Q?Uen/wlt1d1dAdHZSJIQt6JFCKW++iK0Mpl2t1WDJ45ztUTWqxkJKBdv6EbTI?=
 =?us-ascii?Q?V8ayb4Fkp5x2OBu+5nb6M1X+GelYGmUdG2dLd7GqSJ5wTmejr7BJzebLLinF?=
 =?us-ascii?Q?Tu/nt0bY2ioKK6+gHQ2F5zJCAkqloW6cUfe944exVS/l7qa7qfBVpwl7VoJw?=
 =?us-ascii?Q?8VcLGQ913WaN1ymJcygGy0fWqKUVGfmuUZ9DoarEL9CWjFbD2X0odOXct57Z?=
 =?us-ascii?Q?7eGxrMS9mzxmps+CGNHpLdrYRWXn98z1oZFcHRVL51+uAMZWProMuEYtSNAL?=
 =?us-ascii?Q?LHdV61R43ODsZroFbVjLofCkzj3J5EjZSgs6V8qAK5vt+wDtpKrSUWSI1PzH?=
 =?us-ascii?Q?7Ci28CTDbFC2cmsAJon22Hqy12/F1G1IFghQXIE9Wklc0CE5qb8NJTCfue5x?=
 =?us-ascii?Q?vEkBG7HuA/0ODQRjbaqokIHYtp6jItrAJXwtuic1tjQbHMUmQ9jyJI0ZhTB4?=
 =?us-ascii?Q?M3gplNBu11/lrGDa9sn4X6orXEfxSOonygwjah8HM/n+QRCWkCF0UKGzRSbd?=
 =?us-ascii?Q?uIhxF/KJzD9fk180VJV4Nn/wwmEP4W8dErUHCGp0yqzcIPZhUDoPfy1aAHu8?=
 =?us-ascii?Q?bVs7hTBBC8WP/DAUBpNADQDVs/di6IzU605y0cYbtbya/hUFskWOr56VijaA?=
 =?us-ascii?Q?oxv6SE9E0+6T4TQ64Ay9moreLJm2n0oIlNdJ327Dq2hfseuO1vTk+Yqb1oT/?=
 =?us-ascii?Q?Po6K7FjO8+tmegHMtpREuR3scOYQ8Ru62QpTLby9HRa+6GIpPNS9HubUKwfQ?=
 =?us-ascii?Q?6BbQIqB70XtGuY/46/5np9wz4msQ5JnZ/jvYjMYxiJDhJ62E9PpphHlQmn27?=
 =?us-ascii?Q?gTLBaZeyEN9r/sr/zKo+/bJ89HWoYhZrkNzHbQ5CStjtME5Bs7FPxL7ttX9T?=
 =?us-ascii?Q?8oWX4Ee/CTLJgT7snskFD3VRp/kr+mRc3fiXvE7Q/dXl3Tx8814kYmmuYhHu?=
 =?us-ascii?Q?LVpmrgARIdRb79jm1QjcDmmaSY0b4O7i5QBFr8u1ZGdsbgWVf89s+NXjaeev?=
 =?us-ascii?Q?uYloQg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99190823-f36e-4e0c-419a-08d9e29e1ed5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2022 20:38:20.1825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qB65O6s4bhALFz0uFgIu9K2daF83g1VRL3SGPYOTBy2xxi2JkhzKCA9ley+LsUrNn6qRcshKQml/42YAoABq60/+Z0JvbUKVjESrb1/xgCw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5530
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10241
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201280118
X-Proofpoint-GUID: inn2CWoyK4-DCQVCcq0Htk6B8XXzDIHg
X-Proofpoint-ORIG-GUID: inn2CWoyK4-DCQVCcq0Htk6B8XXzDIHg
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


