Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D99942595C
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 19:25:06 +0200 (CEST)
Received: from localhost ([::1]:58978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYX8j-0004VH-LZ
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 13:25:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mYWz1-0001eI-6p
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:15:03 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:9872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mYWyy-0001SF-8S
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 13:15:02 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 197H4MFt009673; 
 Thu, 7 Oct 2021 17:14:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2021-07-09; bh=/li/ha5mlhUoXj7w+4RdEJH38oLoZKklGOOxTogr5Rs=;
 b=zsYzVR6NIMdDnYCqMeWD92zvEVd+ZKhbI7JoPuKTy4CnNtvKTThPp4uH1kv6+4cynyF/
 CgK1s27dyKsRfyucwEebMrrxkoQvMu+kEyET/Yuc+2uE2QfzebTJxAxMGKM9lqcNW9qt
 949ghUAs7a0v+gGxhDValLp+Ce9rZ8qQ4Kn7WUxZ7/rN9NZniS3oQwDQgDGGclbl5AvA
 g55LDR8y3cN6p3V9+P7AVcaGq/q+j9kAn/tyKv4JWzTo/j+aafd99JDoWqqWaMO85x05
 DSk2JqzcBmTVLddsDwjYf73A0HcXewhgB5z+P6oev9uu9HwimTLIFjmU1ylANMRCRW9o kw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bhxbs38hv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Oct 2021 17:14:55 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 197HASk5072645;
 Thu, 7 Oct 2021 17:14:54 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
 by aserp3020.oracle.com with ESMTP id 3bev91a0wx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 07 Oct 2021 17:14:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLqzTxZF5w6wckUOU3lDagz0sQ9GVvZKxr1Yvc40Xi3r/Rhvh2GBfqnBZaY1HAZhFor55DYP4Y95KQzs5yiqg6LDNfJrLjtWbz0jiHPPtAALPtgw74F1SUIgJHvbFKmc/xtT0rU1AhQDj8V952a/oNKuPP//7NElOzR0r7d5Ch/a/oZNvrvzl0HuKgHwlbqd1b6MMhyBV6qJkzrARaYq4ms6Raojcx5acJ5lVWA1qxaTlm3lb6XdLShV9QgYf5rqfHXnbqnMrUQ0radIatEQqlws4mF9nyslrAAJ9kpDPwGkdYqu3+N1YWkZfF7hgqIFJ/LplwHrj686uLJauw0tnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/li/ha5mlhUoXj7w+4RdEJH38oLoZKklGOOxTogr5Rs=;
 b=JLuv+cowFzB2YCXqQwq5EFYq/0Ofy6Kp28u6hbRlOGBymw52JjhhWXPrwccXmcjCShSlm/eYvFcdXAK2MtWNTSUKf1CbFOhUPbvceToB4aNyKZe3RmK1smL0K0WFwXJqG+rwGAkFzzvb42mOkfil+OBowkWCKjCgH/IwSiVA2wFEAWsJTQw2YU3Nglrtl08Z7xEwJptSg0OevDD7Guh48Lp5xiLq6PEsGH+lIfTY04iXWUgHzZUiVMcubIZXlTki5tMDvoW8j6DQ+kvfcYDC5L0stB3qSsUp/6eoQ8Xu9W41sklKuwbZWCKptE6VMfjm4ZuYunY9vmxAkC5BHjMy6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/li/ha5mlhUoXj7w+4RdEJH38oLoZKklGOOxTogr5Rs=;
 b=behKP+k8fhD2l0SMq3qDlwKrB91n4cE+7P91CkLOzx+HefNbfmVsdsXECHaPasc3yIb2XNw6qFStMy0HCrIGTkWD0BKk/qZAjjKpXpCExgy4AlJI6JIyEEvrI/B2OeT7U6g6A9I2fyQilFTxUw8pwCzt67TG2FpAG0hAiUJtglo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB5524.namprd10.prod.outlook.com (2603:10b6:303:163::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Thu, 7 Oct
 2021 17:14:52 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6%7]) with mapi id 15.20.4566.023; Thu, 7 Oct 2021
 17:14:52 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 00/10] acpi: Error Record Serialization Table, ERST,
 support for QEMU
Date: Thu,  7 Oct 2021 13:14:26 -0400
Message-Id: <1633626876-12115-1-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-ClientProxiedBy: MN2PR08CA0015.namprd08.prod.outlook.com
 (2603:10b6:208:239::20) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 MN2PR08CA0015.namprd08.prod.outlook.com (2603:10b6:208:239::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Thu, 7 Oct 2021 17:14:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5babaaca-8134-4cdc-38cb-08d989b5f971
X-MS-TrafficTypeDiagnostic: CO1PR10MB5524:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB5524288CE40DC1FE1A19F67D97B19@CO1PR10MB5524.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z0Rli0Xc+ahsOXGt8ZnX+4Zz+MLLlVF0JpZrFKnqHKijaMy7aB3UaBE/4Bnbo312hUG6thH1ZwCYeRKuevJ9k6X2XRvkEhy1gnaLQQWUwGcojpSrk9VDBV02rms/YS1H93QmR8Yi6gUVWYG40GkwMta3GqA3pbOwFgBx3f0alVzs9kUsEptVe307+YUDCSQT9OgXNwcb9cyIUv0A5jDmACCHN3CSzC4iRDJC/69NGrgA4ugrolUVQY3B9dI6PbBQ07S/xGYF7I5CxqdJStMAmLdRal+3Yhpzh12I45a83SJ/mm3gg9xYnfrHgSRiTKUY2Yg5L69xr1iF16rwcrOPt/DVYET7vEcEfWBd5QD4gBmyX6OkDZVwAG/C8e13xI6gPgFShz+VT+SlxYuMlKmWVdQLjymUptXLEPNy6ZFI++luw/HZG7pPitt9iYqbqBQ6qC+KYBl1wMqLRGMzB6dKvx/1zA0OOoOhP03ic7Yj50tMCHWbCSsTwpYQNoNvmIoG5iAFsivGi10xfYp1MpVC7U9qulEofFeI11lUmlmK/GqXfiUIii6hs3SQqNfAGluRLcDQHMC7kWGoWIYGQMRyX85G1IrZLzPjNuvh0rweym1jZrlehzvkD/uqcT+blY0OXhlJrcBTpd/yiO8vbAC3WV20k52DufEE0C7DVtP/vLP2AytQ8yes4xncFAWJue3fNYKGJhxlifNtc7l6vvCzjg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(6916009)(38350700002)(66476007)(2906002)(36756003)(66556008)(107886003)(5660300002)(316002)(86362001)(8676002)(83380400001)(2616005)(8936002)(6666004)(956004)(4326008)(508600001)(186003)(6486002)(52116002)(7696005)(26005)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RKSLSe6S+heJp59xVFvCNtBiLnkAFzkN5r9OdG7dyZqnLwrYLlwWvf2N2UQe?=
 =?us-ascii?Q?i7l9AnhCW9qZNc18RWau4+kLpxSaJU84yJBZyXH2OnYvYYEga2v2/kKWvpdf?=
 =?us-ascii?Q?SyjsZOw5qzyGzBwWpU2tga2GQaWPxjXRx2JMWwYz1EuAQOgZMZ5ZpDMqy8Ku?=
 =?us-ascii?Q?QYov0c8mt1N04OItLiv/U77ZMELPZJd9bTY4udVInxV7325RZo6lDa9gIfcj?=
 =?us-ascii?Q?VVBHcElTygWdcgCTCa0JfHYsfrRrmSB+B8YptRInsDN5Qyp1Hi2cQK32st8x?=
 =?us-ascii?Q?l5i/6cRPO1Bs5HW+FyFzhC6DciUZHavrUvs5UG2vW0YZ4Uak9XoAASCHvDav?=
 =?us-ascii?Q?e37oMPbtAqTD7aimLUWmLzsKCF/0/Esc5ceyC/KGsDDVglMW/m+GNmibYYAN?=
 =?us-ascii?Q?VYBFXSM8ArilVinuN46H0tB+pBxtO+LaMBngUl6Iqeu0YS5fmOYKJQ0yrQ34?=
 =?us-ascii?Q?EH8UbJOjLwgTAbZFsLZNyWxmJ/IouleWxpgJWjmZxZaVe7yjSPSUWxm74BCa?=
 =?us-ascii?Q?ofCGjoHixSQqz8OJSTl8iIa97W+6BqbrlAARx16g6ge6T4JDuzeHLQwrGLUt?=
 =?us-ascii?Q?g0HKrv+/4pupAhiPPlXJZ42QZuK+YLhLyiLfLoC9Sf4XzELfoCt4ahNOlhrh?=
 =?us-ascii?Q?JTy3KeD5ynEn1Fau0v1cQindYhihOHvu1cWbsf2+lZweF9C/PP/Usr7i9/+R?=
 =?us-ascii?Q?QysoOTAipsxeaBgBpXqUkhPhiWg2UAHVJ5Yfsrw08bndQodmeUrX/AKPD+mZ?=
 =?us-ascii?Q?SYZU2eGm3nwtKsI6IL2gLWJd188+cPlXPQZrPov8Ti6FtZDz2QzXkmsiUpnc?=
 =?us-ascii?Q?C/R9eXATwV16+BxsnzU8DiIoYjzFzJRWRb1ScQYbDeGdu3kBxiMBZVHLGScK?=
 =?us-ascii?Q?yFjtNTjXDsP6VKHB5ITIOudOwW9E/RQVlMgjlty+WVsN00kDUpbtL3J0ZskT?=
 =?us-ascii?Q?kXF2YoWlONAMS+6nSnYunmVTalpn93SNE42SMZNMErlHEzZgAiMAl/roXHmb?=
 =?us-ascii?Q?AHYXYR4Zu33NEd06m8ZmUY+Rj3dvVV1xiQlw7MWZ0NzlE7qlQtsk/elnlz8D?=
 =?us-ascii?Q?/Uj6e4E+spexOqhkZVquLuImqincfa6m+R1w3I8Mxb1hgUhdT4OEpBJyuASv?=
 =?us-ascii?Q?oZF0Ouy6tqDu/Fet2QwLvmCLqlP/obPKF2uaGOHppCRh+rT+A4dLhcji+Neq?=
 =?us-ascii?Q?qTcWiYUzMcoC8DP8psKRa9UYeOJ9arW2/MdKrZ5CoklxpVXuYF3dudvo1neQ?=
 =?us-ascii?Q?Kov6/7XXaLtCsCVSNJuvc0TmyG56C2g4aZ9mfbhKLevYKIsLclj83988VeCj?=
 =?us-ascii?Q?Dgh5zvIenBl2OtjhaPO0517S?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5babaaca-8134-4cdc-38cb-08d989b5f971
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 17:14:52.1815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IKAvVvS/PYyorAHQhGd/+kzonxFY5NIbjsMNgd9JzUuVGpn4ZoCAu23ELy86E4zgDJBhSOoVcO7W6buOrBBkLKKPxEBBEZEArWOtsejUcnY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB5524
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10130
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110070112
X-Proofpoint-GUID: T_OXCVHOB7Onk3nLlUnj5NM9OSaRVZ4u
X-Proofpoint-ORIG-GUID: T_OXCVHOB7Onk3nLlUnj5NM9OSaRVZ4u
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

This patchset introduces support for the ACPI Error Record
Serialization Table, ERST.

For background and implementation information, please see
docs/specs/acpi_erst.rst, which is patch 1/10.

Suggested-by: Konrad Wilk <konrad.wilk@oracle.com>
Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>

---
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
Eric DeVolder (10):
  ACPI ERST: specification for ERST support
  ACPI ERST: PCI device_id for ERST
  ACPI ERST: header file for ERST
  ACPI ERST: support for ACPI ERST feature
  ACPI ERST: build the ACPI ERST table
  ACPI ERST: create ACPI ERST table for pc/x86 machines
  ACPI ERST: qtest for ERST
  ACPI ERST: bios-tables-test testcase
  ACPI ERST: bios-tables-test.c steps 1 and 2
  ACPI ERST: step 6 of bios-tables-test.c

 docs/specs/acpi_erst.rst          |  200 +++++++
 hw/acpi/erst.c                    | 1075 +++++++++++++++++++++++++++++++++++++
 hw/acpi/meson.build               |    1 +
 hw/acpi/trace-events              |   15 +
 hw/i386/acpi-build.c              |    9 +
 hw/i386/acpi-microvm.c            |    9 +
 include/hw/acpi/erst.h            |   24 +
 include/hw/pci/pci.h              |    1 +
 tests/data/acpi/microvm/ERST.pcie |  Bin 0 -> 912 bytes
 tests/data/acpi/pc/APIC.acpierst  |  Bin 0 -> 120 bytes
 tests/data/acpi/pc/DSDT.acpierst  |  Bin 0 -> 5969 bytes
 tests/data/acpi/pc/ERST           |    0
 tests/data/acpi/pc/ERST.acpierst  |  Bin 0 -> 912 bytes
 tests/data/acpi/pc/FACP.acpierst  |  Bin 0 -> 116 bytes
 tests/data/acpi/pc/FACS.acpierst  |  Bin 0 -> 64 bytes
 tests/data/acpi/pc/HPET.acpierst  |  Bin 0 -> 56 bytes
 tests/data/acpi/pc/WAET.acpierst  |  Bin 0 -> 40 bytes
 tests/data/acpi/q35/APIC.acpierst |  Bin 0 -> 120 bytes
 tests/data/acpi/q35/DSDT.acpierst |  Bin 0 -> 8306 bytes
 tests/data/acpi/q35/ERST          |    0
 tests/data/acpi/q35/ERST.acpierst |  Bin 0 -> 912 bytes
 tests/data/acpi/q35/FACP.acpierst |  Bin 0 -> 244 bytes
 tests/data/acpi/q35/FACS.acpierst |  Bin 0 -> 64 bytes
 tests/data/acpi/q35/HPET.acpierst |  Bin 0 -> 56 bytes
 tests/data/acpi/q35/MCFG.acpierst |  Bin 0 -> 60 bytes
 tests/data/acpi/q35/WAET.acpierst |  Bin 0 -> 40 bytes
 tests/qtest/bios-tables-test.c    |   55 ++
 tests/qtest/erst-test.c           |  167 ++++++
 tests/qtest/meson.build           |    2 +
 29 files changed, 1558 insertions(+)
 create mode 100644 docs/specs/acpi_erst.rst
 create mode 100644 hw/acpi/erst.c
 create mode 100644 include/hw/acpi/erst.h
 create mode 100644 tests/data/acpi/microvm/ERST.pcie
 create mode 100644 tests/data/acpi/pc/APIC.acpierst
 create mode 100644 tests/data/acpi/pc/DSDT.acpierst
 create mode 100644 tests/data/acpi/pc/ERST
 create mode 100644 tests/data/acpi/pc/ERST.acpierst
 create mode 100644 tests/data/acpi/pc/FACP.acpierst
 create mode 100644 tests/data/acpi/pc/FACS.acpierst
 create mode 100644 tests/data/acpi/pc/HPET.acpierst
 create mode 100644 tests/data/acpi/pc/WAET.acpierst
 create mode 100644 tests/data/acpi/q35/APIC.acpierst
 create mode 100644 tests/data/acpi/q35/DSDT.acpierst
 create mode 100644 tests/data/acpi/q35/ERST
 create mode 100644 tests/data/acpi/q35/ERST.acpierst
 create mode 100644 tests/data/acpi/q35/FACP.acpierst
 create mode 100644 tests/data/acpi/q35/FACS.acpierst
 create mode 100644 tests/data/acpi/q35/HPET.acpierst
 create mode 100644 tests/data/acpi/q35/MCFG.acpierst
 create mode 100644 tests/data/acpi/q35/WAET.acpierst
 create mode 100644 tests/qtest/erst-test.c

-- 
1.8.3.1


