Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F943A48BA
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 20:34:34 +0200 (CEST)
Received: from localhost ([::1]:32846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrlzF-0000aB-UF
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 14:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lrlwi-0006TX-I1
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 14:31:56 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:63418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lrlwa-0007cF-GJ
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 14:31:56 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15BIM6Ru030364; Fri, 11 Jun 2021 18:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2020-01-29; bh=dKiaWcWf8hDoPHnKqoERvhU//OoT/PcxYwKwCF71kxY=;
 b=srIEM6Zt4zXBxjFYzWqYaEQAQddwfcsAXiUnmnoQaVYCHpA0u5h0DbtcPl2g732rT5fF
 brZDqnrfiU8Gn+gDjqYP0FSR4phd2WU2IChOnw4HbZKHJl0Owm11jltFnXmyePfYeUsh
 UfLqHZEGoFw7PMbGLx68vI2nr3/SFvBTxC56RxVoJtPFM0iRxA9JRTKyChVeoZW3hemu
 mtLNZCLKpNxTkVEjPx2sBZyeqbHItZB/8c0ALzBIAPCZgfgHGru9Ba+CFFT8MBG1ZAVu
 X0UvDbrPIZLFO6bLoIsAav1abQd2l2BEvwF4lcS9jcLhRcDIkv3QbAwQynBK+1Fv/jN9 xw== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 393mkb8f2g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Jun 2021 18:31:44 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15BIVhQs015874;
 Fri, 11 Jun 2021 18:31:43 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by userp3030.oracle.com with ESMTP id 3949cw8h2e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Jun 2021 18:31:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dtU+snw06xdLkiR2K3AXYerllrjmDr4M6k/xu0pZYiHoK/QghPTwO94yiP8+THGcV2xP4sO0ZbVDKepEtp7+dJlp0tFYCIe63AnpAmtV4F0YETCudUNgivDQDZR9kAzx3JI8NJkdYywxZacI83A1Swlxz7AKrm7sAV0posBEXU6vk+5C5P3PCZpVyN1kmGROeimvYXa7dPLIoPucQU3NuiP2voLjDsG89Vuea+rLxsXFkBidqwZSLg6AH+gcyo04BZvPnMpjdSSpgoRpfKZuie2ZeifqsYJDAGUcRHYQeWmyX+NuJEbDTm1xnw6dYIz8M50gYEL3SDfRxrFciPvyrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKiaWcWf8hDoPHnKqoERvhU//OoT/PcxYwKwCF71kxY=;
 b=ahsmeYnuTnSJOhlOT/sq/M3Q65wUuoXiB3m4+LFTvGtrcKfYHy3I5DtZ5VI6G6z0c+KMS27OGzM6ZFY7+39dnb6KF2hOka3FI0NyMDX/WTvElgOuJKIWkigyHeAKMVThJREX+zSx8BnnK9tEsTgMPZFNm9jQOSd3/4m4Or0w7iEB14fZy9GDS64uXcafa0ejmdOgpncfpl4/hL4QXM2QI/TEEDOvEipAIPjVwvZmU1Wi1B7GU3SqO+LdARQuVRTjIqyAJ+ZRUJif3ua575Fm1sbqs4Mvne8a3a5C2io3jIkJGPawlaSyGN/TwH60D8VRsZP7AnfXNRzi8xeAnCqfNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKiaWcWf8hDoPHnKqoERvhU//OoT/PcxYwKwCF71kxY=;
 b=CKry7GdqTdsBeveBwsmTFRNSxzwoqB9is+r5RJxA/pWfMb6q5FhG3z72flg0TJNX2qMUekTI5UMwaAxqGJBxUZJyAhxmXbrgc7b1DiGtngKkbLoYM8rOkzdQP1M26tWW36TCe8RxNr0RtzJP8O7w3KqxCWcOgXKIIe0HAabkRLA=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO6PR10MB5457.namprd10.prod.outlook.com (2603:10b6:303:13f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Fri, 11 Jun
 2021 18:31:40 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc%7]) with mapi id 15.20.4219.024; Fri, 11 Jun 2021
 18:31:40 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/6] acpi: Error Record Serialization Table, ERST,
 support for QEMU
Date: Fri, 11 Jun 2021 14:31:17 -0400
Message-Id: <1623436283-20213-1-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
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
 15.20.4242.9 via Frontend Transport; Fri, 11 Jun 2021 18:31:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3a7b578-33bb-46f5-61a9-08d92d0727d1
X-MS-TrafficTypeDiagnostic: CO6PR10MB5457:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB5457211F7914CC401A9997FA97349@CO6PR10MB5457.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IECkWQuFXotcHyQ6k02cWXd12toFwPTQYy4hYRUCaEjxBehi7DZSFqeaDxXtkH63YBS2D5L9HdVNWy9nqh7WvNs37SoMGkKMiALX5NCGExuANrNHoLnYPnHvy0cJC/+VbfF7m/lRXrMW53v1stnGvatALHFe4ECT2V8oGK+hMGUdEKJ4IRDz+1HnZj05SFW+9BxV9TPpxjblEW6Lb9diuoAqKVSWT2WFjLVsKTC3kznOBohtYidFKJ4qM0WCGggvj8ZyPFiaLgwY+KSYbvMDtOcFLy4XYLs1/RnX2nv/yABoE/0OlDev8hR5YxoPLmoaBxVMq2nm7Ik2qiuuRPRGCK9Mn1PrvFfxsGkZR96BNEKfEnK8j+NeXbKInBoehZ4zpELbHlNMkNSqcNyIpLHy0V+BeXdBY9KXXmmn/s6oe0GGQNXeOXw5zflshNUlnIGTspI14YGCt7hfEbqSLoIPiHJ56dw6A6XXpgMrDknpGVoIYTeNQBm8w/7QLtD64PRy7r49ys5zbKvBiHpZsCKbasugN4QN8Z2Ei9jmr9vnYrYx15rX4BuKNDsknVoLXTi8Hu4gxas1uoPXHA6M5PIxvRSZhKmN4l/g7/rYu5dKshmYtDh1i4WKkEIitMgbD/Q/E9zbpDsJpgEFTQRd3YJ93iU1yTxr3/duTawNYjPoSsfD70B/QwRp3SWRG0I6jsc/JLnwhdxiG1fOB2gXrrGy4iUH/3IZRR5od1+W70qx2iRXlAdNrRsp1nVjc0o4t+jywBsvv70GwHv9w1NSJFLwK7YbAeuNUW8dOBCdmujOWtLJtOf3X14yuZY0LJbzgnLO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(396003)(136003)(366004)(39860400002)(83380400001)(7696005)(8936002)(26005)(36756003)(52116002)(6666004)(45080400002)(66556008)(186003)(6486002)(966005)(478600001)(66476007)(4326008)(66946007)(316002)(5660300002)(86362001)(16526019)(2616005)(2906002)(6916009)(38350700002)(956004)(8676002)(38100700002)(107886003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B1H9yLY4wUlzUMDuEdpTksZOK/bf0No2DdidoptDADHqgwWzjd9AhyBJZO6o?=
 =?us-ascii?Q?41w+W+5VgmN2TkP5u+gsXfcZlEoFRMpZdE4fACI+Asg+OgUbt207k4CNTyD0?=
 =?us-ascii?Q?bfHQcu690gAcQ1NjVPy/vbaElBlStXI6hRb70/2Q8x1bNJGei51jOgWen/Ph?=
 =?us-ascii?Q?BFMJqhBfXQRExtgDhPHozCLIdihscZr1sHuQUMaH9QiI+Onewji9IU2nl+my?=
 =?us-ascii?Q?9lXS99gZlbK3J75RtNtv4rUPRNSGIjHcNh7vO6iZCndRKYt1vPtkHarzzPaN?=
 =?us-ascii?Q?pWPYfaXp9BHK7cIHz6gAXSkkQ6B22EzcMcdgQZL4O9REC8vAwjqwJIyiliyR?=
 =?us-ascii?Q?hvmIC7CeFRdftd9t0h80Xd8TOUPc7KuoRaVu2chKXm31vhMubb9Yy7VBEIig?=
 =?us-ascii?Q?iCwYTzZLQLwnEk9tvhMaeB3x3oj6WiS5CiemRd/QE8G7YiN73C+pq0YTamNA?=
 =?us-ascii?Q?g6skhjN3Fi3khbW9+VTvmGLVxkfsMnq8S/ezfAOn1+6q8p17RSkZzowCrb9a?=
 =?us-ascii?Q?j+ONNsN9NwXxfWBx4bZLyJioddC2kJrJ7D2sFWZfz03XqCEKGoOxk/O/f9lj?=
 =?us-ascii?Q?T72ErMYi1Uw1ajUnZhJHdfzFb+4ICsyBzYaSqV9hHyRCJleLKVEBP3yReqzm?=
 =?us-ascii?Q?f+G/3LETIv1y56UK+8tRic5LBwK27jv8RWthWbLNzwnVE684HYZfNB2Wlc1x?=
 =?us-ascii?Q?/DhrGKISwlp8cAFaK+8hbhqZ8xQfvJ3Bnr3vgiJhh1vs+WqAwdBBP6R8I7S4?=
 =?us-ascii?Q?/8JEBjOTTjZCPfBZ39xLYgT2S+CQC1UNl3+BtecmLuEwyRj21GzbBEYS37Qe?=
 =?us-ascii?Q?SRYWcXuhWMoLbiExL+z3CjlIaOdXL4vT9uzHab99N7ruY20AlbgMEKlcTeZD?=
 =?us-ascii?Q?+utKIVfzazBaubFiilLKXoxY9G5S34OxCJjk62xPtGy9oYw4PmxnW5YH9jZB?=
 =?us-ascii?Q?XBkPxmwKHHF4lmKCOexnnWcmNErfbVsF14WoZ/iXKAfrUX60VKoS25r3ermk?=
 =?us-ascii?Q?OsakU/lxVciOvso++Tj2C8Ijxik0y38mUJOq/Q9mPuh8Q6UpndTvxgaA/xdG?=
 =?us-ascii?Q?kdSVxo1eU61ktR4P1INoAMGbQAgpuGAcP70gQrXe8Em10uj0xGKQfgUWCj6n?=
 =?us-ascii?Q?oTxH74+RuVIGcEtbeuSVQwbfH7offRGs5Re7/PBj9RBnnF3nHb+XynxFNKxp?=
 =?us-ascii?Q?1Xzdh+oE3yq98Idye5T6bT2WJ7bOsPIh7p/frT9tDdK6M+zUHxj+5OtOoR+O?=
 =?us-ascii?Q?GVwGvztt9pcAfzPTeSaKrI0HPLCSj6iNh5eX1d4YRv2s+owrUEQSSt4qdlkF?=
 =?us-ascii?Q?lC5qO5y0WWuI31+9kOou9RvG?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3a7b578-33bb-46f5-61a9-08d92d0727d1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 18:31:40.7940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CN+vf77VTL6tEYRSXrOUkyEGOIE+2+6HpU/3rOn2znR2HFnaeA5VLcpZOxRba85V0KUXoRoABYTTYugZ5OLvTjmE0++tLzSyDCNtYMmrWjw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5457
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10012
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106110115
X-Proofpoint-ORIG-GUID: AJzLgm_aiNrxf0LCQj6_587LOBLqlfc8
X-Proofpoint-GUID: AJzLgm_aiNrxf0LCQj6_587LOBLqlfc8
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
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
resource-constrained microvms to very large guests, and in
particular, in direct-boot environments (which would lack UEFI
run-time services).

Note that Microsoft Windows also utilizes the ACPI ERST for certain
crash information, if available.

The ACPI ERST persistent storage is contained within a single backing
file. The size and location of the backing file is specified upon
QEMU startup of the ACPI ERST device.

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
v4: 11jun2021
 - Converted to a PCI device, per Igor.
 - Updated qtest.

v3: 28may2021
 - Converted to using a TYPE_MEMORY_BACKEND_FILE object rather than
   internal array with explicit file operations, per Igor.
 - Changed the way the qdev and base address are handled, allowing
   ERST to be disabled at run-time. Also aligns better with other
   existing code.

v2: 8feb2021
 - Added qtest/smoke test per Paolo Bonzini
 - Split patch into smaller chunks, per Igo Mammedov
 - Did away with use of ACPI packed structures, per Igo Mammedov

v1: 26oct2020
 - initial post

---
Eric DeVolder (6):
  ACPI ERST: bios-tables-test.c steps 1 and 2
  ACPI ERST: header file for ERST
  ACPI ERST: support for ACPI ERST feature
  ACPI ERST: create ACPI ERST table for pc/x86 machines.
  ACPI ERST: qtest for ERST
  ACPI ERST: step 6 of bios-tables-test.c

 hw/acpi/erst.c               | 880 +++++++++++++++++++++++++++++++++++++++++++
 hw/acpi/meson.build          |   1 +
 hw/i386/acpi-build.c         |   5 +
 include/hw/acpi/erst.h       |  79 ++++
 tests/data/acpi/microvm/ERST |   0
 tests/data/acpi/pc/ERST      | Bin 0 -> 976 bytes
 tests/data/acpi/q35/ERST     | Bin 0 -> 976 bytes
 tests/qtest/erst-test.c      | 109 ++++++
 tests/qtest/meson.build      |   2 +
 9 files changed, 1076 insertions(+)
 create mode 100644 hw/acpi/erst.c
 create mode 100644 include/hw/acpi/erst.h
 create mode 100644 tests/data/acpi/microvm/ERST
 create mode 100644 tests/data/acpi/pc/ERST
 create mode 100644 tests/data/acpi/q35/ERST
 create mode 100644 tests/qtest/erst-test.c

-- 
1.8.3.1


