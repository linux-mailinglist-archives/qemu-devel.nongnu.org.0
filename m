Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2DB48A324
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 23:47:39 +0100 (CET)
Received: from localhost ([::1]:40422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n73Rz-0001RU-1i
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 17:47:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1n73Mz-0004E3-N0
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 17:42:29 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:18748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1n73Mx-0001p5-3j
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 17:42:29 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20AJmAD9030658; 
 Mon, 10 Jan 2022 22:42:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2021-07-09; bh=wGq4PR9Jr8hpjxbaaNaMmW5rs9figOPjzaIQXhTbP4w=;
 b=U5HvZDTzv1kHMbB9hc+dM5vFnmvSwQHu2HyBZB+/DoTy8nFTZkRIUjmKdOcjQtetgVJK
 wzBUHJd5YN1s8ZwIEmha4beUcxYi0/wQbmJm0I7J4kZ3PGvM7sJAm5Bvu4a5vUh7x8Kn
 8tZfJ8DFaDLcQj1cAtgk9s7Gzq9kvDxuvMJbN/oBxk41UjM3Mp7hCSFEFn8CQyZsJRHL
 mXK15FOYjzyXSbacM0zCoJdRr6erCK8GnuZ3+DYDMbtWHrkJLplKZ9FRUN1XYtGQbxBX
 xVai16Y3JXPPScUl2LL6X0AHNHMMzRbFkiWY7viSMFsYOh0qZd5CtjYPOIkqsfkzVmOb qg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dgn749fsa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jan 2022 22:42:20 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20AMaQfZ117286;
 Mon, 10 Jan 2022 22:42:19 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by aserp3030.oracle.com with ESMTP id 3df0nd6pac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jan 2022 22:42:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VbVslWUwrY2FsT6A8oodCzm6n4v0GVWxhYMS9AU/AUalbPRySDkujkcB1ZDE+w60+bL4DQsm4z6oZe0Y8bz3okzZ8zS0uXqYW3r9vZibSeqI2g9o5W+2+gDuC5kqrEMoMuOFMLXWJXNJIyJdjXj2hfoF4XCjQ5TUY+eCxnkxolCYjp8Z7Knx+R0gCniROygvZl3fXGhRLZ6LJlWSaCdvEwTFQFvwwy58/V/Mk2oPpZ+ExPEZIZGF2p5wj7NQ5lg3CaJWe4yLZxW6wHm1bji2A8Vd8TZlePjJGIm1cvrLnzSRPjoF7Ou3pHumn2kc1zYD4v2cP1y/mU7jarOy+009Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wGq4PR9Jr8hpjxbaaNaMmW5rs9figOPjzaIQXhTbP4w=;
 b=e7JcfMLJnfiL0N2VuffVp/qJMMHKWfeI+iEQ+1fF5KrNN+D5IzjdkR6ryp5bNgKKHw+S8AyME9/ZLB4JivaA4d2SxTrw7bQI4hYj8qrUUySvlthtMf/fyWWfwpX8a8sa9R7DS9dzhoPawb8n+z+YPUUjiTPehFMnaxd9l8caIn9R+QPiBia5V053u6b2pKHFD9OLNiTUTgv+o9fhck5pUHgSbA7wuXMddPNPWYOdj2cvGqk6S+Dl4iT5NkspRKekn0yMTcHWPTJXI1MvBtwFT8n/phNEFYJkl7LbpyfAW8BdQr9HSURpfU6fSV97DMBegUwJwk2EkhkbNP9cBtXNbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wGq4PR9Jr8hpjxbaaNaMmW5rs9figOPjzaIQXhTbP4w=;
 b=TdxuBnKd/O+KdcfLSUylMgGE7JGknj+lla3BiscufWysdGJGt5XF1pcTu0fq6yhEaTbWADAfr8KDeAZ+MYCiwwhCWyqR0OUguyFTKQAEYywECJnLqUZ8DN+l4iOGaD5HWyWhCwUpwKTzupQNm/fDvDluHrYJPsBlDxTNefTgong=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1598.namprd10.prod.outlook.com (2603:10b6:300:2a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Mon, 10 Jan
 2022 22:42:17 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d573:6cc0:c616:6f2c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::d573:6cc0:c616:6f2c%6]) with mapi id 15.20.4867.012; Mon, 10 Jan 2022
 22:42:17 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v12 0/9] acpi: Error Record Serialization Table, ERST,
 support for QEMU
Date: Mon, 10 Jan 2022 17:41:55 -0500
Message-Id: <1641854524-11009-1-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::13) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f8687f5-e8ad-4cae-1628-08d9d48a73f6
X-MS-TrafficTypeDiagnostic: MWHPR10MB1598:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB159858450B0B4DEEF61EA39397509@MWHPR10MB1598.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q1889AdZ4nyDoXmKl1XKrS0X28quH4M7M34p0vCRtQRBQZW3Cfa8K63izVI/2++qRryLOObHx5ueSQKkxrrgrgTXInLSTbzht/qBQxv6WYhlvhwlxxwB9DbmjIt4RvIw1XYpqkKI/zF0CdHBPw+/yAtDoWSvnuDY5ieSArNXx4DD4YQazAUSlx+CMBJmDErEPRSuBGyXI73sRgj/XQmFFOhVG7SBxy5C8B0SQnuw+jpJplI9jlwLKDTEjxHQWDJbQVOuh0ed+0TqLw7CTkszs2rTGDgyuhZfbj3+/7TI5YCaGlwd1Tfp3DowltbaOe/Gvgaw+nQLHwQuPSclz9iznr6ckv+rDZbbtWvi5Gqt5cEoMKLnQDQmYMdUWliM0xhnESKMs9wB+UZpgbFEnYHK0n5XutUMv9EnlqBxEwhOeAHZe1/oiUoiiTddDgtCBdA9fgphmXoICCvfkdA/Rxh62Y0karWdqHvItJvPqO+tiOfd+1AemlPrpImUAmyXU+P/9ZrlSRZIDu4bqUXgrd02im/GS5WwbBkb8GboGD/4PdG4AX/oPttxUYJEQw9cvcuQlsmrxrIoP9w4Fbuxk39QjJmj+6fb0HD5e5k+MRFn5OOSyFhyAkxPeXtsFP5XM9uNygo5fiuMu+DsZ6dMY7yF+HhB/PyUS9pszSwrWYs3c8sJW+goCrf64gsRssPoerAoNiwKQIlAsOZOzgN2zEu/mg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38350700002)(66476007)(6916009)(6666004)(66556008)(6486002)(66946007)(52116002)(38100700002)(2906002)(6506007)(186003)(8936002)(316002)(6512007)(508600001)(4326008)(2616005)(83380400001)(36756003)(86362001)(107886003)(5660300002)(26005)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M7xiUCMnklYGt+k37SGlnzvdl6cZ8oQK6s8ht6NNFb85chaiAL3giSZTAI3A?=
 =?us-ascii?Q?j4yfe5UQanA7nSRjvaxVSTufn2PM3/xnODsV2JC8if1YfEvYnZ0o4D3h7USs?=
 =?us-ascii?Q?37QpUJoUheAm86/8zbMtNIiOAIzARYHmG2B7CmT8aaIa2NAAq4DnlIctUPSF?=
 =?us-ascii?Q?X9Sovu3U/r+CLIUCsksEu4n5PZrD7AVyWRNxX1+F1bHX1G5WdEWVCdn/D4lO?=
 =?us-ascii?Q?ju8i6SYfLM2E2Ka8lYtBnsiqxgvG3LZjDkg153VF5Q37ztwA+3BSStu7JAw7?=
 =?us-ascii?Q?dJPkODY6CQHttX2zpGHT7/qeHy0cLlpKF4hDSmneJqyf6WHXRBjUxd4AncZ+?=
 =?us-ascii?Q?ZL9YRGcjq+KXIvfFAn1FtV8o33YXfsBvyRUOYBBRUwvYRQS3MDvobQkAgttp?=
 =?us-ascii?Q?k6xJ3R5eYwU33aRayO2MPWqR3P5nIx2M0+urXyIds3abuHBk9GNX7yphP0iO?=
 =?us-ascii?Q?32UZP+uROl7fRAxgeNNwQ1rsyF/jQfKuejLkZJx+uFLbcRWu1R6nKIzD6C8G?=
 =?us-ascii?Q?dgMgsw+e2IlLx3VKYZ4ejbDmXDR68bqT8Pj75NjIzIQq67iZ7Pg4WfArKjz8?=
 =?us-ascii?Q?aldyn2pIiI/zEnX+lLl2zJVhbxrvg+nCtEL5fCAnSYTOv0n/Y8jDaElD2Gvv?=
 =?us-ascii?Q?UM5QErRekltesH8HJOUa25SH03Idi2Hr1Cwr8BJnFimPFIqZRy1WXg5pjCgF?=
 =?us-ascii?Q?1CkemcmO4e/ZvzYukPab96bEGvdfpwAUg74MogD+1nTpoFCyJ1E6gURtwxEW?=
 =?us-ascii?Q?D1w87W0bMTITiK+8HkAwI1HfvLCZqgkfDOoIoTpoaGaCkKokWmYngp92UsA7?=
 =?us-ascii?Q?drfN+xu/2dmSiYiejIUq0z4jHiCxAF/HzPPDpOtlo45viug9Z0SbPw5M4zTo?=
 =?us-ascii?Q?W8JbCfoabPXhQNvJl13BnLNy2fEM5ZphcOEz86/s9NgyywiKQF+whYwV/0Pq?=
 =?us-ascii?Q?wZyEqoZmjEzXSrIuL5FvDPwZavIxV4MydR0P+onoIYgNccl35miJimwz/+mt?=
 =?us-ascii?Q?0atLIW+FqAdQ0eUMgdJBdpQTM3HVk8WT//ZmvZlLsI30TBVg3tRo3UPEVzMm?=
 =?us-ascii?Q?K35mtrc3SxVj0dzP2BuyWMYmUp2aaVuM0p9RKjuaI5eQtaAulHkYc2AtnG5g?=
 =?us-ascii?Q?tjub0thorPgn+t9E1u83yiYupjKds96konqEEktiJQCglp9NloctqqbNuc5V?=
 =?us-ascii?Q?/3NG43qnbvvCNpFqoctS7EocEnWeTKVWH65Jv7hMK/Za3rwDn4VVzxQNLV5W?=
 =?us-ascii?Q?rEoZEzyP3a0Dg48jsXravIS76bIdrDtpa5GiOoTez2xXTVImye8wNxORyuyu?=
 =?us-ascii?Q?ZEI49Sb52EYUrl+SEmCHoEvDrBOo/QTI9H6Dj6hv6+KjXo2bdXLY4pwINos1?=
 =?us-ascii?Q?t5hdwaWOf0SZQfavVUOjZefZ/sRfAaJLTbx0Ncu6s+ajd4SlRkw3Yec6uALl?=
 =?us-ascii?Q?mt0fjBUrOZt77zImTxgjawtfSNSFcrEMzDPpbc6S8pcMf42C36f9pyr0mqE0?=
 =?us-ascii?Q?t/fsPGC1qOZl9DxJB5MrfZXt8VDGV1STOSnpQOpJ2nzgM/a1UPYd0wQTbbuQ?=
 =?us-ascii?Q?7DGnaxMt/mZ471AIWcArzCDo1k0bhjfjnzI6Y3MyxCw/b+564kvgCgdy1Bbo?=
 =?us-ascii?Q?ZqY+I7tUV12dNeCcyGgp6mnhZ3QhsiBrakCSZnAUXq70VmwRdto1ShyOCOsO?=
 =?us-ascii?Q?jW1qyg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f8687f5-e8ad-4cae-1628-08d9d48a73f6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 22:42:17.2918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P2eVQIRg10YPMGu0o/Kdztno2EWWYpPoFQLKm3KV9/askRdidQh3/NPRcpIYvOgiphVa6+HrYFUNDw91oRg8KaSDsSCGGYwDJT2ohdLwwEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1598
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10223
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0 spamscore=0
 phishscore=0 adultscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201100146
X-Proofpoint-ORIG-GUID: PiIeG1ggUc1tZX9xiK1VhWcHyaT2etl6
X-Proofpoint-GUID: PiIeG1ggUc1tZX9xiK1VhWcHyaT2etl6
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 konrad.wilk@oracle.com, pbonzini@redhat.com, ani@anisinha.ca,
 imammedo@redhat.com, boris.ostrovsky@oracle.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset introduces support for the ACPI Error Record
Serialization Table, ERST.

For background and implementation information, please see
docs/specs/acpi_erst.rst, which is patch 2/10.

Suggested-by: Konrad Wilk <konrad.wilk@oracle.com>
Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>

---
v12: 10jan2022
 - Converted macros in build_erst() to uppert to follow coding
   style, as pointed out by Michael Tsirkin.
 - And few items to help further simplify build_erst().

v11: 15dec2021
 - Simplified build_erst() via feedback from Michael Tsirkin
 - Addressed additional feedback from Ani Sinha

v10: 9dec2021
 - Addressed additional feedback from Ani Sinha

v9: 2dec2021
 - Addressed feedback from Ani Sinha

v8: 15oct2021
 - Added Kconfig option for ERST, per Ani Sinha
 - Fixed patch ordering, per Ani

v7: 7oct2021
 - style improvements, per Igor
 - use of endian accessors for storage header, per Igor
 - a number of optimizations and improvements, per Igor
 - updated spec for header, per Igor
 - updated spec for rst format, per Michael Tsirkin
 - updated spec for new record_size parameter
   Due to changes in the spec, I am not carrying the
   Acked-by from Ani Sinha.
 - changes for and testing of migration to systems with
   differing ERST_RECORD_SIZE

v6: 5aug2021
 - Fixed compile warning/error, per Michael Tsirkin
 - Fixed mingw32 build error, per Michael
 - Converted exchange buffer to MemoryBackend, per Igor
 - Migrated test to PCI, per Igor
 - Significantly reduced amount of copying, per Igor
 - Corrections/enhancements to acpi_erst.txt, per Igor
 - Many misc/other small items, per Igor

v5: 30jun2021
 - Create docs/specs/acpi_erst.txt, per Igor
 - Separate PCI BARs for registers and memory, per Igor
 - Convert debugging to use trace infrastructure, per Igor
 - Various other fixups, per Igor

v4: 11jun2021
 - Converted to a PCI device, per Igor.
 - Updated qtest.
 - Rearranged patches, per Igor.

v3: 28may2021
 - Converted to using a TYPE_MEMORY_BACKEND_FILE object rather than
   internal array with explicit file operations, per Igor.
 - Changed the way the qdev and base address are handled, allowing
   ERST to be disabled at run-time. Also aligns better with other
   existing code.

v2: 8feb2021
 - Added qtest/smoke test per Paolo Bonzini
 - Split patch into smaller chunks, per Igor Mammedov
 - Did away with use of ACPI packed structures, per Igor Mammedov

v1: 26oct2020
 - initial post

---
Eric DeVolder (9):
  ACPI ERST: bios-tables-test.c steps 1 and 2
  ACPI ERST: specification for ERST support
  ACPI ERST: PCI device_id for ERST
  ACPI ERST: header file for ERST
  ACPI ERST: support for ACPI ERST feature
  ACPI ERST: build the ACPI ERST table
  ACPI ERST: create ACPI ERST table for pc/x86 machines
  ACPI ERST: qtest for ERST
  ACPI ERST: bios-tables-test testcase

 docs/specs/acpi_erst.rst                    |  200 ++++++
 hw/acpi/Kconfig                             |    6 +
 hw/acpi/erst.c                              | 1033 +++++++++++++++++++++++++++
 hw/acpi/meson.build                         |    1 +
 hw/acpi/trace-events                        |   15 +
 hw/i386/acpi-build.c                        |   15 +
 hw/i386/acpi-microvm.c                      |   15 +
 include/hw/acpi/erst.h                      |   24 +
 include/hw/pci/pci.h                        |    1 +
 tests/data/acpi/microvm/ERST.pcie           |    0
 tests/data/acpi/pc/DSDT.acpierst            |    0
 tests/data/acpi/pc/ERST.acpierst            |    0
 tests/data/acpi/q35/DSDT.acpierst           |    0
 tests/data/acpi/q35/ERST.acpierst           |    0
 tests/qtest/bios-tables-test-allowed-diff.h |    5 +
 tests/qtest/bios-tables-test.c              |   54 ++
 tests/qtest/erst-test.c                     |  172 +++++
 tests/qtest/meson.build                     |    2 +
 18 files changed, 1543 insertions(+)
 create mode 100644 docs/specs/acpi_erst.rst
 create mode 100644 hw/acpi/erst.c
 create mode 100644 include/hw/acpi/erst.h
 create mode 100644 tests/data/acpi/microvm/ERST.pcie
 create mode 100644 tests/data/acpi/pc/DSDT.acpierst
 create mode 100644 tests/data/acpi/pc/ERST.acpierst
 create mode 100644 tests/data/acpi/q35/DSDT.acpierst
 create mode 100644 tests/data/acpi/q35/ERST.acpierst
 create mode 100644 tests/qtest/erst-test.c

-- 
1.8.3.1


