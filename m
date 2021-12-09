Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E4646F2AE
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 19:00:54 +0100 (CET)
Received: from localhost ([::1]:36870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvNiv-0002BZ-Be
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 13:00:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mvNgF-0007oW-8a
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 12:58:07 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:11656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mvNgD-0002tN-Jj
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 12:58:07 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B9HnErl012024; 
 Thu, 9 Dec 2021 17:58:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=kw5zRb6fcbfjGiIjU/ZOl679L3q3FAE7+fmlUiHRVQ0=;
 b=LhIMah6NMECcp6QLO9+LD+MelE8V2nAwet8m5gHNVdMlGnsxilyPxKqiIZXyCKCDdbdR
 Sq4MK/TuHtWkyhJI4V15DxgcFtoqCi6Vsuj3duZ7X+wbpYHqsrIxEMb0ckVGJ7cMvMtp
 OLFhSMjbO/9rjpnfjOm/F8S9pIWP0TlZF/mtrhuoQOLr5R5n9yVB30tK++yzOMH8lFFl
 PJ+YqA+fSpsqOk0nR2SZUsvs8hgPnXkLmHWRAwpRyBoxk47NQ4hDhlH8xwVjQKDnO9rd
 Lv5Qcf9VCnvCxXKc4S8j3AHLWZDjeQHkcv2um8m1qBnjTwr/8va6SyWutMUBynhqcTpC 0Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ctrj2v9s8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Dec 2021 17:58:03 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B9HpUWK189753;
 Thu, 9 Dec 2021 17:58:02 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
 by aserp3030.oracle.com with ESMTP id 3csc4whm7r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Dec 2021 17:58:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jyoVxB2aKA0SsLILA5T4GHYJDQDkRllaZ59tuqMEIUZzX0/IV4qGxM9lbLqc/WY+JmpY3db7p2/1GhOs6ikANuma3BTmV9Go94ROm5hXRynXGQItNAWqs9va4e9EzWivs7QdCM3IMLSJGP9Ju35AEA0uY3/HiB/0Eo0vnsTur1UjnCPUQhFns4mfgNBe66T6H4eN8oV9QK5l2JMxm45qSS870avgijAnzrDu9pJdSyJnhSsUu0PMXfRjauVmTg0Avr5+8Wwlw2M6kTjGxqTexz4TN7ys98qZuY0G5PJHMZHEIwPbKu1SmJRHLFO9Xp7LwBfGzkSbUVvKXdk6aQBJMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kw5zRb6fcbfjGiIjU/ZOl679L3q3FAE7+fmlUiHRVQ0=;
 b=V4YEJ3CJ8XnDupn6fYm6Cs2Agv1eBlX9lQAzmYSHNu1oPimWgMvOWNB5Z0obTpcqna4+QCUZf33Ggl9hh3J54lZw+R7kVRSrXPjAWImEVhHJdkTBQLfpVzLHgBX+H2car/p3Z8c2WH3P5fQQ6Jo2XjEtJb1LNBTXDCk57nrRtdGZTVr1pCTjwErqk6garWjBBMbDLF8PeGysQU0JuB1dfvmhXkAukPMM+HG2xtUCCteZ/kA9YbmDufy3P44vs7Hzcit5zulouKYMLzJBUkbXZEfbZyZqXULFkv+KFd0mauxkqgNRyMzawODzp1B0uvm56T0qmixLlHK+15nbQ18BUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kw5zRb6fcbfjGiIjU/ZOl679L3q3FAE7+fmlUiHRVQ0=;
 b=kCdNQH0L1IYK3C0hTop/pDJx7vnxW2OzGfiJCEmxy4t9nuAvmoIv30rQA1I0VPxKiL+kJKuDpjjaVT16dMfDjZsXKM+0wrxq+4KhUZ7iEEFCGiBOG1BqrjERYTFruy+S80LJIQzWlMmpOfcfB6gbbEhZSkM0iFN+3fDfycowUEE=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MW4PR10MB5810.namprd10.prod.outlook.com (2603:10b6:303:186::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 17:58:01 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4755.022; Thu, 9 Dec 2021
 17:58:01 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 01/10] ACPI ERST: bios-tables-test.c steps 1 and 2
Date: Thu,  9 Dec 2021 12:57:26 -0500
Message-Id: <1639072655-19271-2-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1639072655-19271-1-git-send-email-eric.devolder@oracle.com>
References: <1639072655-19271-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0073.namprd04.prod.outlook.com
 (2603:10b6:806:121::18) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 SN7PR04CA0073.namprd04.prod.outlook.com (2603:10b6:806:121::18) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 9 Dec 2021 17:57:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8131fdee-1116-452e-e162-08d9bb3d70c7
X-MS-TrafficTypeDiagnostic: MW4PR10MB5810:EE_
X-Microsoft-Antispam-PRVS: <MW4PR10MB58108BD72055C4A5B1CC721797709@MW4PR10MB5810.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oSGml64kKKgXoYUI0oeRzTFcOQVtbTNnfeQupXn9BIxBW1yXjhPhrtU4S2pZs0K2yeq2cZkCJnkLvoJXTewIgP4Xz0Lj+iaag1rOg880RqTGUAMhfyZpG3qoamvpX9gLQmP5AyJwo/lhiUYvmqCEjP5FQ2SQVgrP/Jv9RnUVY5aJjdiyo41qRikhps3qq3ssPcbKd9ccYx0ETbK5N4Y+jWbtmwy1fNBeYiKU6QxKOuKGFiy53w5a45eWCsE7Do2wS2qzfMiNtDtM6wZHr1DuwTv9QYpADOebQdZ/SAE/HPSCAFP2qnSCHfKa8f93YK/XtUAA06UjGMInd8yhBknv9ruhjL9eSJiYaCFyMfM197lXTB1/qNAeSYXGQj3JKJ0mV2/vrwct1vNrSRi730N0worNzscz3F4b7lUD7T1pa7H56xXy52uZF2wzAhGLdpT1Ys76vCzT+CjqSDNiRPSliCz4zpsgja+BQvr3C5izfkXNHN3uY7hklxo+tM0H1lDzc5be8lRU5CJTxxVbYgH9bYhgSbDQuKZU2w7xa5p2Y5gMh83LFrWqmoXN8eLr8zhElSsPmpbbJ1Luhoc/WxLqsvvcETXdJIrZewTWmvhsB8fWkRRQFeA1lVgEJMCAzVDG6u3EB6FyXc8SavwUqwRMqR8gxkmruZqdrai4eYpCh3KOBrIFT8N6zYPFEX5lBZAQe/4jpkviRzd55jfVNaxXDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(508600001)(6916009)(5660300002)(186003)(66476007)(36756003)(26005)(6666004)(86362001)(52116002)(38350700002)(956004)(38100700002)(2616005)(6486002)(66946007)(107886003)(4326008)(7696005)(66556008)(8676002)(8936002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7eCRvzK7qO8A37rbYYoEh+5yF89+cXSw66V0f66OwYwxpiGKmrzRWeBnccIm?=
 =?us-ascii?Q?z7I6rw3l1Z1MVqZPq4kgee1VS8jehaMSZHKtymK9/xzg59NmWW/TZrhq8VAm?=
 =?us-ascii?Q?7ZmXqQMd3+oBKUjWAntOaIY6wOCcMl8OfxpFJS56rGUSisKJ+zTdRyMpngKn?=
 =?us-ascii?Q?XlaaibNWvW6KcV2n9tjfJR0me/jAlYWvLrKKXgGh9RCmiuHxsty9yIbjHbuE?=
 =?us-ascii?Q?G2OCrOGQwvsJZsEnrUrVtu8fQRWDDYBFuv1I8/HG40dIA/8q4UPHJ7AaT+Iy?=
 =?us-ascii?Q?HN2NOqemAUu0pwIUHI3wIzn1PObKoE8S5S+r3jmXPjVxpuJZxW/3VU9K+qUw?=
 =?us-ascii?Q?wLM/XpLZQXZz6tiU8mJ6uTzRL86vJv2kk3rrRSic8xw8YmQMz15ykMh4UfkS?=
 =?us-ascii?Q?RgHSZFZBVb5AX5gFcrHPwZRdreZCx0jTuIZZFYT6LP9pG0EcZHDAeLwA4ATW?=
 =?us-ascii?Q?6jc8+zfAspqJFkIe3AhqghzCOjaQVgdS26Oafta74zyq9aK3m0cd2h6VAXwk?=
 =?us-ascii?Q?nDsPpMzLa4fdzDxd4UYvGF15TO90onGAcEU8nHid4MDMrmy7wyiKSfqqZxjx?=
 =?us-ascii?Q?eYpT6l9zu3UnsPbS8FyNR2Kj0yfQns5wu3fRecmAZx0pH2XGeRXEhIn8EyL+?=
 =?us-ascii?Q?Ad7l5tobKHaVnOz881wiFu5QE0DYvvGnykyQslwSSobvanpoRT6hdnTKtIsA?=
 =?us-ascii?Q?iUMVRZR9UE8+k9AxDPwT+CgDreXwNtz8mjXwfU+T9s3BHS5kwHb7783FnbGX?=
 =?us-ascii?Q?hQU3vDrETLCPu3U2HlkwhGSMAFP4btc+p8Mz7Migiyo/OuP+sj8pv+JQqPxR?=
 =?us-ascii?Q?NW2LN8X6kf8pf12Sj5XD7BkX/M7siKKaN2MNS4Ox6WCJLaIvsG1v4u78wfxU?=
 =?us-ascii?Q?Sn7RLKbebbMAU+Vryt+JQ7RXT3Y6K2j1fA5P5C5bPibCx9Nm/1h3VfdAcNGC?=
 =?us-ascii?Q?fdCRky8kK37ALsLvsf5ZiYQKuUf9avEENlgCZ5OsSKy8vr30xDcOo5IVI6z7?=
 =?us-ascii?Q?RuawAlzj6vXEQg/TlmHrioe/CelM6yx7itDmBMpqdRaUTQmYR09qWd/7aqkm?=
 =?us-ascii?Q?DtzgyuaVqt04sCJV3JoDxa/qPMLSqH97IMSCjGb68L9ECsmjfzD541z5Qkgf?=
 =?us-ascii?Q?NXdW/J5e8xVwNjH4naqfrhQWWCrNJNWTqwesx9r9lvwdVnnAvpfIr7iWWZYr?=
 =?us-ascii?Q?rQ1icSPK45KlfXkPoUizgb8yKDlsXLy/yizMZNy52MmsaVHv57WidUeWJ6R0?=
 =?us-ascii?Q?5YGrKleObjl4L6j71ayTzgnvyJUGmvacWC4b+L+/cJaLp9yU2sBwctu4c6UI?=
 =?us-ascii?Q?kvtYsVIhi6fljxtLL/msBo8FXJ9L7MKzivOV/UZkZnv+cl5MavPvjwn/pV4p?=
 =?us-ascii?Q?swCcChSmZunQb2h+zQ0/MEg13m2fSb9+SoNfokF58BVn+7GLrmYvOVRYt5xD?=
 =?us-ascii?Q?Bn7A/fqTAQ9aJexcZTbjqmi4Sjn3pxHblnItGgvohpPydy2vWdPY+WdQ3ipN?=
 =?us-ascii?Q?OeUVZP9MKY7M1v0ADNzBskxAoZJ+4S33e3nUVibLzsDsh5DQwbS7/VbCkqoa?=
 =?us-ascii?Q?TzPSJ0Qjwv6SUam5J0wZdGmco9VjhoNA7agjJNAsgY+cxgDEEyNdcfZmcoUy?=
 =?us-ascii?Q?oweCrhfP9yZdyumf4Znk4mC1JujroJBQOZht4k46c1WbQkA/gNkxNWN8KaUR?=
 =?us-ascii?Q?lx0wRg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8131fdee-1116-452e-e162-08d9bb3d70c7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 17:58:01.0900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Sq05VEwQ+kZqxfi2RmHi/F9vaLfLui94osjvmQ0WPJhoFdGg9XG8/TVWZ8hnslwG5CwhAoOEjt3Kziuz4Bv1PbxBnpQPClmz4mCJUT3CT0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5810
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10193
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112090093
X-Proofpoint-ORIG-GUID: g6_6J60j8tTmWVwh0lJoDkkxlm2Up0V9
X-Proofpoint-GUID: g6_6J60j8tTmWVwh0lJoDkkxlm2Up0V9
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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


