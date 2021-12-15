Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27663475CC4
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 17:09:22 +0100 (CET)
Received: from localhost ([::1]:59562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxWqH-00079e-9U
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 11:09:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mxWMb-0000V8-KH
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:38:41 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:32228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mxWMW-0000RZ-4d
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 10:38:40 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFEKA6h010344; 
 Wed, 15 Dec 2021 15:38:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=kw5zRb6fcbfjGiIjU/ZOl679L3q3FAE7+fmlUiHRVQ0=;
 b=CryZaV3qVrNwy8F9v2NglfJiTWLO9qhe6EpI9iO8An41/3CQ8mVFhsT4n85XK8z4s106
 VOKv8YnKGLQOwabFDvVtwX1BCcDwG4ZqjZc+1YXEAhkLwBxxxPCxJYF/vEIHcpUC/v83
 Qn53Af8hBhjLmQRkFJVFlHeVfQU0zV/6qQ3/hDccNzINsyjE3j2REGrDBcV3kz16hpfO
 ay7IHNznSLUqdKek0aB7+JP5311KOvr5HRCsHtLZ/Mw3PhDuB06XHHqzBK6vPFBXk47T
 GeErD4s8D5tpEL+6OMJO3pbRoaSOk+M3TAHJoFbKrCvoubI4hJvm7f4pdNXj/o0TXUCp Og== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cx5akey6q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:38:32 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BFFUXT5094314;
 Wed, 15 Dec 2021 15:38:32 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by aserp3020.oracle.com with ESMTP id 3cxmrc0wfr-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 15:38:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f8WX23wVdtn5XQW4/pVu9WrNEIxerUZO7UjA23CMfuAIXWJTilMnWS20O5MyKvj+3XGF7oRPSR0fPdUV9i8CFQ3D2LFtY4r5hG2vdttxuWB6DMNB/NWynMbFbcF0NDNP86SITozSYpn9VyPHVjHouM5NVHtHYOLda/CxRWVTtkIDVfTiJb1aFw/Wht/f9mpPqhidcN8U5ketaB43N2abMJUWmNwDZOJB1uT55huZ8dcYFR46wX5jsMUp/32pEJJZq4DVc1anDd1s/+5yHYQCdS4SU/8b/kC/W26yRirgrpmvtFVxYJPndk70I5KzRBlsF80RjatW3vGPrGUAbw6EKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kw5zRb6fcbfjGiIjU/ZOl679L3q3FAE7+fmlUiHRVQ0=;
 b=WGlRvrtkAZQlh17tkoiGG1gIbrGXYWe2dyAaOOsASWUqLhZZKTwYuE8ac1NpmPQbI/O4jA4AZpvLcoV3WZE0PN5PVcIQ72UuMYqyrCzOYcMZVzXX88CD1H1BR8Uk1iG8ElIcNMkVAaZr5jUoldJMZHKPkbo2N2rkf+x5zFnRtvMzSPuWUOTriZrEFJE/ekIBfAFfo4lxwdby1U5a8FSdJZLF4KC6TZlp4Cfi65R5mZvsdRIcl+vL+6wClQUFErVq+/bV/vAHN1L9HHmjU8oVF7iWIWzmLM4qBv4IbqHqM3TyehhwJaDXcK59Pi6n4wYJJQgB9zw7pKJSlcSNG0z1vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kw5zRb6fcbfjGiIjU/ZOl679L3q3FAE7+fmlUiHRVQ0=;
 b=Zbgl5oTxoONIyE089iYri86N43z/4ISoIdQQ3zwp/eo0khYPHV99cuWAuTXjDnt8dxivddoPLln6IQh5QdVHP3h+guZXUbeJtWEcjTAybllZHBLkE2DYtJtAGhT9j0LJjrxQgPZTBqlTsPjbaSTKZiFusAmRYALglGr2/9u5PhI=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO6PR10MB5441.namprd10.prod.outlook.com (2603:10b6:5:35a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Wed, 15 Dec
 2021 15:38:31 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 15:38:31 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 01/10] ACPI ERST: bios-tables-test.c steps 1 and 2
Date: Wed, 15 Dec 2021 10:38:06 -0500
Message-Id: <1639582695-7328-2-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1639582695-7328-1-git-send-email-eric.devolder@oracle.com>
References: <1639582695-7328-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN1PR12CA0073.namprd12.prod.outlook.com
 (2603:10b6:802:20::44) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f98b2785-ba21-4e49-a30e-08d9bfe0f223
X-MS-TrafficTypeDiagnostic: CO6PR10MB5441:EE_
X-Microsoft-Antispam-PRVS: <CO6PR10MB54412615CDA12909EB31533097769@CO6PR10MB5441.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RmgA+Hw3BYj5kkHQaDcAcY9wUUsYM3HL8yaiX+FjErL0XVctT1Zx9tjsgLfgz6LPCsvAOXHKwNwHGeFclU2yh1ipVGJ3MLLWeJE1TKdHerQQWvRyE5HljcMAlwcSeVeQXRA8Gw8omtLQVe94U6uUZVkYl5B2QyCqf4HdtMbASPTQgwlQMtaV2TuxBS6nQYsogR27L6uVQfjKWHuq9KNQeBZQZ3SRqr30+JHUjxyq31WVuywWCQxWOK439RRQT8XuswDvDu2U2ibvZq2XmuTyx45dA3D1VKaeD3/7YM75Muq0hPzg1Z1mJD6sxEZzEszgDuMw74MBUKRP3GTr7M+BSrtRtSGz6iIOihjv0vFHHCTLcPJUIb8KQ1Ol3Nbfv57EofDNCVS1PcUhK1LViCqz/iHDfiiBApEC2UXPucwzRYAOCIoDiR0SdOlmVw2mcJSOwMWmdtYGLt3QhusaIQ5RouAS9d7RKYCWfSOI0qzDLhepWeWWlfkQ4hXPvx9nl1B37yPqZSiSUYFoQzfTdZn7hHD+Oqekq1+FlpXV3Dt5P4EG7JXSRy1xAqjXYFT/jnZEHV51nSRy5OeynEnhkwEdgN/SK5OacYP9AZvk5OhFB/b4vETZ/oN1zBbwFE17Dons1I7z4DdPkmTep7df6eK8IgqOi8lcTZuy7NssavupURziZZuUYLD6Dsnl9AzBfAvUIQFYWqDFsTwqoYCU4TBKRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6916009)(86362001)(38350700002)(8936002)(66946007)(52116002)(316002)(66476007)(66556008)(6512007)(6506007)(6666004)(2616005)(38100700002)(5660300002)(8676002)(186003)(6486002)(26005)(508600001)(36756003)(107886003)(4326008)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n+PeGPPQL0N7B2apYrmYBY/CaMEPPouDXB2DzcpDANgjj3dMaB81lryq8rNk?=
 =?us-ascii?Q?/qCoudC1o2+/bIDElIXTPInx13Xx+koB5x58+AsOOx5UtxSsfgA1KwX5Rx2W?=
 =?us-ascii?Q?+3Yhf1WX9jnXpJQP6UyHCPLjNabuQZzxi0HsF1U/1AI/oGOARQ0QtDvFpkzL?=
 =?us-ascii?Q?SOHNER0WzLPH+QZoBp2LyKunDjM6Bw0hhLjRSCKvZBrVMJVpuqhUdLkl0Epp?=
 =?us-ascii?Q?BsSJhnd38nakZtkLeP8s0zLCiYl5v9VGFiYyKMwN2uSYBfwawl/OnIbeqise?=
 =?us-ascii?Q?Qq3mL/VW6O9a7y0m/At2pg73fgPULfS9jQegMHVRvNSlYLSSF1N+Whp+3o0C?=
 =?us-ascii?Q?allN+AD5U+s6tA72CH1xsCcyvzcMXfqvmjtf2dhF/PwWNuoy3pjBmaNIIokC?=
 =?us-ascii?Q?UsUo+88nAyAN01xSRqKTgAJk3N1vw9X0AxvHDYn1v3dTb2uC5wCGAVGmjSGn?=
 =?us-ascii?Q?rlI92dpgTJbbisloGGvTJeznhfm8bdR3QvnG96xhNEacYxBPaU4+Sw9DVD6C?=
 =?us-ascii?Q?nl22hetqCdEpM2EX9PQ/7iFWPOJg2rLnhIGQlLjzkytKTlcjVmbR4W7HuLJ6?=
 =?us-ascii?Q?n0o96XuXVJxwufLPchvAOx0pS1NQZQK/o7GcG0Wytbd1SgO056K2Cf+v9vKt?=
 =?us-ascii?Q?8SuUZFqD5IPb5lbrO9fIYue2CTJNBLZkayB4hETEcBuwDGuneke1GEUAHRRL?=
 =?us-ascii?Q?rcLeuU/5443v5+b+070aGNI8xFssRhlZlEYmjcnJkolyNoxMHOE0KDzzb0OC?=
 =?us-ascii?Q?CIlMGTBzVWwdCqgCtpOJyOFu1RLeDTq4Z/NVgPl7AqKIom+LINSWDL+a9TCM?=
 =?us-ascii?Q?PuAmsOEG3eF0QehZ3kP1xfZOuHzf15vPHwVVkwL2k2IUOE9WZts+Nzs8rEtK?=
 =?us-ascii?Q?LY4hKZhhBzre8M1axo3KxubkthDGzTZ5jdC6zldJQNpsz0jLfu/SuA03zXLK?=
 =?us-ascii?Q?K5j17Mjwif/zWGibsCEhivQJjp11TSuELJNRHoLL7DZC7nqLtq4ZgYPWWMlF?=
 =?us-ascii?Q?J7f5yQACSRlipF86WdKH9ucBTU/u6kQ+JltmWxHbjOkBf8nVlVJeO19bt9CV?=
 =?us-ascii?Q?tDNCsFzFmeqqT+Aq0CchBgLpuAfsiPB10AI4SBOl98rD0FFLaF3/xbU8S6X+?=
 =?us-ascii?Q?ge1OsUMiI75p2LYjxN0kA8ZapXnV/FyRya0/aters/w/5LWvqgOVXj7NTDXV?=
 =?us-ascii?Q?ikmAzJ8ZXoUvb68I6eWTbrWWKpSNz10MJEZZN7CIJS/CjY8g9hi5lvBwpVtZ?=
 =?us-ascii?Q?Wl7aKkQ9wHrDwfjJm738O13a0hvsxLgGMdMhyCOw4/vD2i9PdYGw9eqLU66/?=
 =?us-ascii?Q?gqSugdgDW0KefL6utCkoeOMIlSgZ3Tkyz4qXOLzaJSwEI311gHAQf8fabh0s?=
 =?us-ascii?Q?SrLEBN6PYpk39OrH8LHlQL3Y1nbWLJOurmgvtX1W6rcxsmn3XjiESKloc/Y9?=
 =?us-ascii?Q?cd2bukq1nfHu1f1ffKNE37MFGuU50Fek+7nIAjkv/0rTyP1emBqJJ4gIJRHM?=
 =?us-ascii?Q?gUSJlRnsrX7BW9IbioxjGArhqSSDxZ2dpdfAo98iayIEk1yFReZlemc2KFQg?=
 =?us-ascii?Q?PNRTLL9qoEYlYq3cGZf3hMOwo+DYmlIWAtaK3Q/mSnF88GyTfYnP7fVMOIlh?=
 =?us-ascii?Q?h7vXPDDd3nn4Jhz+N5l0+NAs44nvcEkEa3FdcpA5BzkLL9Lc1bkFWPkC7hTJ?=
 =?us-ascii?Q?b1St6g=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f98b2785-ba21-4e49-a30e-08d9bfe0f223
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 15:38:30.8437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DFXFjs6LaViNH/B5JAyoxOZ6bLIJQr0CYlrykyDx9hURu1LQTtDjT7r5mEybfYQVPsgMrUlYtHUPTGbvzkMQeVTjTeK72tjxzFXB0EDhB9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5441
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10198
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112150088
X-Proofpoint-GUID: YBQNR0PlNARd1jL2GS-3DzOklr8Xp_td
X-Proofpoint-ORIG-GUID: YBQNR0PlNARd1jL2GS-3DzOklr8Xp_td
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


