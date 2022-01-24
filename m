Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FF0498694
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 18:24:15 +0100 (CET)
Received: from localhost ([::1]:42126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC34h-00056t-11
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 12:24:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nC2yE-0005Rl-M9
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 12:17:34 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:39898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1nC2y4-0007jV-3B
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 12:17:26 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20OFYOa4016125; 
 Mon, 24 Jan 2022 17:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2021-07-09; bh=WKn6Wh3EgUtaDByvHM+RMMbaEtINNCw/U6SEPoS/ZFQ=;
 b=Yk2j+FK1ZEcQhgIrFzJLO+V04WRHaDrkbgPf22ooz/mqFl+5Npj1kwpnmWhbq6e4WQQx
 Uu6g+1ibsjQjldlNLs+T3a7meszeJw1WIXFAzpYY6YYgGM/UXC/0C84kLmoyDeBFfSZ/
 10h8bBCHR4nsUF3PCqtB1gzEdof9Hz/GEO82TE3KzdT6mRNCl6UcP+dX9tYePoyrDg+K
 9W2zLrR3qVYyYsgz+yk0+rJEUUtDcreWVDLETpD+i3WuO3UW6Hcsci4umy+HHceDGtf3
 dh7r7QF/iBOVXvhgVl/6vlrNdLCFnZR2YBRm+Rh9VXZ44FJqxMCWPsxt2i/c5KQdHgKr ig== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dsxvfgcjn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 17:17:18 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20OHCPRx087592;
 Mon, 24 Jan 2022 17:17:17 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
 by userp3020.oracle.com with ESMTP id 3drbckxt6u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 17:17:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cwb6SId9JTa7t1w298fJbVRldzxCLmfWe1NKrD5lJvwr9ML5Of3yApD97bO9MlODXLPD44fJCWHCcvgal/wMO6JhdGh6ruuvOSqqX/kHq7wAa4QEHTM/yfvQAmAS2emrC+n8vHkUyU9Pap3lFEfLnJrBrJEaxOVSoeyophGAwqTwB1bgHzVTu1xN64TnpAjceSyUo81sQKjymNVOXd95XQGv1lqb070OxIv4DZeNYYLn7fuR1+ZUtyT3+UXVTNlYSPlFYhLlPi2Y/Wgfu69s/m/2w4pMd9DgurafWX5kfxBPfJ/y00EGOpOQctWr/Yhvy8zEwcd2N6L0C8PNTd3U+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKn6Wh3EgUtaDByvHM+RMMbaEtINNCw/U6SEPoS/ZFQ=;
 b=dT7r0XK+vqVr0KG9/2+WC9qoImxBCFI4WaC+4ger/qaiQiQEVmfNm1ZF67E4VCPHZTJEklffXZLhUTBhkX9TsIrxlC0a/wyZ7rL2wQ4nz0pFsFgvPKxOoM2mIG8QhOdcxQ8lnLWGpL9amN96EWm3+ksft4WmVVVT88sI5yY/Dne12v/O6Wi91N2BT31bcyogejzH7EnTxT0ds6R3/szERP8fYfhF6dh4im0N3CaJNUZ3WNx70I3bOObMuvK//O+hLSpdhdAOs8u3hesRZPmphVK9gfNmVDARXdR9HL4u/YkjDJ0ibQamRc/Rl7aO9EK0a9j+I+h46I4GKBQeGOpOiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKn6Wh3EgUtaDByvHM+RMMbaEtINNCw/U6SEPoS/ZFQ=;
 b=dCBAixUksnZwHt9LnuMUi+PVvzsGFNfrq+DpEEHb3zpb6H/vWBPNosHrZO9KiOz9sm1o3zgQB6ynYjARVkWGnyG6dkQPs7cz6Vyq23K8/Z+qQICnn4WcnNUhL0JjPezZEGCDc34bO7+6eGvlCYgCBHNxP67BJJivTzGyjN08sk4=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by DM5PR1001MB2265.namprd10.prod.outlook.com (2603:10b6:4:30::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Mon, 24 Jan
 2022 17:17:14 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::ac06:be4:5723:771c%4]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 17:17:14 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v13 00/10] acpi: Error Record Serialization Table, ERST,
 support for QEMU
Date: Mon, 24 Jan 2022 12:16:51 -0500
Message-Id: <1643044621-15892-1-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0055.namprd04.prod.outlook.com
 (2603:10b6:806:120::30) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08ea5a65-186f-4907-e109-08d9df5d5d68
X-MS-TrafficTypeDiagnostic: DM5PR1001MB2265:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1001MB22658C6C0F63B74BBDF9C303975E9@DM5PR1001MB2265.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zM25A1kZHw+2MF48HGtItQxRhMnB+wD2bCcF2F7WQ6cR0Um4oMNVyBxR+bRZ5Et4D3WCAJ94UekJchl2GS8qP35Eladupfy9ElmPvedybDHLjJuHWWyJUKA3pJ/UdskuQtVG2SpDhqSXiBTh6OA2rwvQCadL0wcd36KjK0G4gMcwYzPEELnrcR3zvK7AYIRKFrjCDhGxu2MRrTBlUtCMZb/BnEZACqiJTor4+8DL4JIZTCFPNIXPSkkFYvggk2RjXRF7qURkkK6NkqqUn5/1EFKAnRKNSV7LVdrSO77h15ViuNxC+yEzG0O+JRKViOOMnKhqB+EzJbgprZOdluB6Or++GU8I1hZAXNXYA9j0MwRpd8CItTlzqltLUaO90CyYJlZs7VL/oTiOPuZ/lUfwe6oe85SyCGoTzpBPJp0wUskeIlT9hhCkaYwIPMiHWCcehwv1v5zZTwZT8Qa6W3+S5YJSUbc9D6SVBvXRw26WpLAQSnMl5LVO5zzyVx9fkV3Ay6bGjxgPSf6wus3f1AaCjm0qDyW6+p9VSxKtGd+IeVFQf9KXrs3Xpvaj0oo4YQxUWRoUS5Cm+FQVnYVoZjLvoQm7yko/pYdfm5wRZiPIYUqvcFEdjWXCIloaYmJiOxlM5tIm4ECqbsBJqxUO9x9MTQePzeMjuWicp3GjJr7dWQ3oLVjD2wmkgEeYZOUsN/CO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(5660300002)(508600001)(83380400001)(6486002)(316002)(6916009)(66476007)(186003)(2906002)(38350700002)(38100700002)(36756003)(52116002)(4326008)(66946007)(6666004)(8936002)(6506007)(8676002)(26005)(2616005)(107886003)(86362001)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hxmgEowsXXiD/7nEr5qnRJmVJ0f3TmXmMGnJRnL/W9gCaQZY1CPQiCgajqmh?=
 =?us-ascii?Q?grEz4zvc24h0DDv3HHX2a3ApfYvCpJMS2SAiz1mvNgTuZ7kJDi3Xn1JqdrXd?=
 =?us-ascii?Q?oFSKfe1TkLVBidaRG22N61BW+budI8cl8CHrdg3iMXzpd5Y9+DaUlXCl5w2L?=
 =?us-ascii?Q?6GVsz+sSNnfBXgGXPMNOOZJgpPh2NJg7AoC8oFYa2LIqMO/A6rnR3pHP6aTm?=
 =?us-ascii?Q?gwuC4d0LM1IqKaN41zGcWtkb4zQF6upjau8awu19n2sDQ0scrm3DtOdRGh1r?=
 =?us-ascii?Q?Qn64ZCLrS0rhzsPolKkCXVPOJ0T5+lkaVPyCCrKbmaQS7QdR853g9Ruly6+M?=
 =?us-ascii?Q?7Z9zp2pG5/HKC7oxFYyUJHgvgIpu68R0n929yGWFXtqhc5cn3P1cDXBX1ao2?=
 =?us-ascii?Q?VhvqjKboKAtDptNSS5Na2J4Kfr3BenZVmGmw3lo3QhfzDFuCttxUWFnGIxRm?=
 =?us-ascii?Q?XyxrFTHA2KoXBwvqo8dnRKdC9C1F97SVkpJW6G8z7xIydWs2AgwStZ8vwcz0?=
 =?us-ascii?Q?rBp0tXcR5r3SLhgFlK1D4SD/svrj6d0acjWX4EWy1Xy0fqAR6AEn1af480NK?=
 =?us-ascii?Q?tJHRgpQkWZB86VldKS/DZX0gyVeiphQ+e+04Y53+lFpgcZgwbBWBsC+yTWbd?=
 =?us-ascii?Q?M7n/bAV26e2FjgBYklxHDrkeaY42zXOYpLK530yql8OZ1ADmSh/dt2t6k1cN?=
 =?us-ascii?Q?fliqmxYB7NbRHgphGUbvJxyqUUuBnRLXwCEkk8QWuh1towphzkebRQKEaosw?=
 =?us-ascii?Q?tpA//Fc5YMGY45TgibTLYIuFeqWbojMQZ5Bz8rFczIvB8KKJuQcXWyrrHqR3?=
 =?us-ascii?Q?ygnoaMB/PpodFbw6nVS25vjOs0OtB53QW+se3b6y82q/iaGUBDgL//u9vU/L?=
 =?us-ascii?Q?rZ6x+uidshnokmv6LKgpuGLNCdTvUVtDJls/2vtnwx9kfjaj4cCcnxv1rjVA?=
 =?us-ascii?Q?Ircp54+Im0gUtJ6xyULMTXnYWGSirp7ERElXNr7GEgJeSgsAboSdvXslim2m?=
 =?us-ascii?Q?ClZJX/czmcqELMWUqhgeZU5IgcwQ+XGxFsp2wYVhJQZ2piOcjzZjWQ31pdRo?=
 =?us-ascii?Q?thz13hfwUuQ34k8hqaOu+GNS9yNIroE/5Fa4c1xfDm/aMcIKfmqSgPp56H5u?=
 =?us-ascii?Q?ieafDlnUAXHJgdC95XuqorCnxBftoszQuKdquZB7UbUV/FznhCwRkCrHEahY?=
 =?us-ascii?Q?8kIuJmEw2LphTaF1mHhMf/t+f7LnW9HFYsPXWBZjk1m9dEmTykpPRInEpI4e?=
 =?us-ascii?Q?bE+dHUCkHjebo1ZZVqdhECaxaKvDJ29sttMDvV51MSN2FRLjr1mpPaM1gGPP?=
 =?us-ascii?Q?bdXP1lULeW5wm2AelAaU6iY38OW/IBe3ZdIylqXVzptLZLiGpyQrwpZBYs7M?=
 =?us-ascii?Q?qwPG87h3oqdT2HaIQDGWMV+cYEG7YfPaEgTtcgCX3f0/t+6PsjOfqQ8HNaJU?=
 =?us-ascii?Q?g0wcGxMz2ZMDVSWnlgPeS9J7/isdMX7bmzUPoPXsmjscq+80wy5U+nTLPOJ2?=
 =?us-ascii?Q?VeLVO8WUjnk+CtXrhCcJIdCP7gxs/iHNzDsHDJoP5acPbZr7CjFoFjsfEga9?=
 =?us-ascii?Q?FrPmV6asvldLTumSUToWZdAfGFFqO41/pz6gsmUfyG6Q4tQf/jc0rW6siLeu?=
 =?us-ascii?Q?IbJbLhYM1eeoHt4A5Jfb27t+YocP+N2sGa12Gj5HUM84uKW9lTNIRk/IW7Fn?=
 =?us-ascii?Q?ffh2Ow=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ea5a65-186f-4907-e109-08d9df5d5d68
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 17:17:14.4866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7KNVAgb0lE9mbREsxFZRFreNp8rHkWH7dBqWNsRQu5E8/HOscfhpSJJzR/ROebmsYifLq5jqkRngvGlpTV/FJaJxzmJdj7tP0vOz5OQKRe8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1001MB2265
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10237
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 malwarescore=0
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201240115
X-Proofpoint-GUID: eSSsqbpXZjEXSxsPEHkjlRxUzX_NlztB
X-Proofpoint-ORIG-GUID: eSSsqbpXZjEXSxsPEHkjlRxUzX_NlztB
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
v13: 24jan2022
 - v12 erroneously omitted step 6 of bios-tables-test.c, this
   has step 6 included.
 - No other changes to v12.

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
Eric DeVolder (10):
  ACPI ERST: bios-tables-test.c steps 1 and 2
  ACPI ERST: specification for ERST support
  ACPI ERST: PCI device_id for ERST
  ACPI ERST: header file for ERST
  ACPI ERST: support for ACPI ERST feature
  ACPI ERST: build the ACPI ERST table
  ACPI ERST: create ACPI ERST table for pc/x86 machines
  ACPI ERST: qtest for ERST
  ACPI ERST: bios-tables-test testcase
  ACPI ERST: step 6 of bios-tables-test.c

 docs/specs/acpi_erst.rst          |  200 +++++++
 hw/acpi/Kconfig                   |    6 +
 hw/acpi/erst.c                    | 1032 +++++++++++++++++++++++++++++++++++++
 hw/acpi/meson.build               |    1 +
 hw/acpi/trace-events              |   15 +
 hw/i386/acpi-build.c              |   15 +
 hw/i386/acpi-microvm.c            |   15 +
 include/hw/acpi/erst.h            |   24 +
 include/hw/pci/pci.h              |    1 +
 tests/data/acpi/microvm/ERST.pcie |  Bin 0 -> 912 bytes
 tests/data/acpi/pc/DSDT.acpierst  |  Bin 0 -> 5969 bytes
 tests/data/acpi/pc/ERST.acpierst  |  Bin 0 -> 912 bytes
 tests/data/acpi/q35/DSDT.acpierst |  Bin 0 -> 8306 bytes
 tests/data/acpi/q35/ERST.acpierst |  Bin 0 -> 912 bytes
 tests/qtest/bios-tables-test.c    |   54 ++
 tests/qtest/erst-test.c           |  172 +++++++
 tests/qtest/meson.build           |    2 +
 17 files changed, 1537 insertions(+)
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


