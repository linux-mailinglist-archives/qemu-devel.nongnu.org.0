Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDC742FBB5
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 21:07:38 +0200 (CEST)
Received: from localhost ([::1]:33954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbSYL-00070A-92
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 15:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mbSUl-0003xy-N1
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:03:55 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:12740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mbSUh-0007uj-Lb
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 15:03:55 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19FIi0UC024966; 
 Fri, 15 Oct 2021 19:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=LCdtDt/Ba10+aNqhz1gNkesbsXVQs/WiKkEhkxxyl6E=;
 b=XsMxQZVG+QVAi1jc4y81zclAKcNEOLr99LQp73o/QHavJVJb3AWU9q+L4wmU30vUVQqT
 LqBXMCJ4iKEvDSEMH+RWO61j8UDzNMSGxLVl9iM4RWtosur48uYtoBuKQzU9ExjPsS6D
 bY+kQ7ZcBt70KDosW0BCMNTPGm58zjkZONOUKR4vlfdhn8Lax1/WqOEN/2HoMTifrRdg
 KhFEqSS+2q9k7rxuS2gWzWI+oJev/zxCefr3WlXRZpZEKaQPEhcoJzZvuody5wlDIsWz
 Jxbtyk/TExXkldfg1bgFx77sA8DjJb64iCkDpzYdbvQIocKx0j0UQtALLcTseaHtih/B Sg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bqbgfserw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Oct 2021 19:03:47 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19FJ1JCL069131;
 Fri, 15 Oct 2021 19:03:46 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by userp3030.oracle.com with ESMTP id 3bkyvew1ch-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Oct 2021 19:03:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmzf8p9PuLYWcIkPSu2Ul48zYDPMabbyhIaaMX0M5KiPFk4uf3SCWtvksLIWijAGVG4fF+Ytt0jNB+03xv5lz/+aiSM2IGztQr3iAmL3Twon1FG+xrukPAfubutEY1/42snefqR36Ujo4S58QSCamDonGFO6oAWXhK/q8ll3J1iehtSDBXz1a5RpnFpbEf+DpULbtuPSxTIY1kyXaBsie1/44B4zCJwSwzhK/yhHGh3x/+MKXVWqO9xbu9cH3dfgDMgI0vR/Y1M4KFnlBgXSSXNWWwbOnKGbhvcugb2PA2uB2mBdWk3/Q/fviU3qhqHOHWv3IJZqyRIPBuVDDZl/ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCdtDt/Ba10+aNqhz1gNkesbsXVQs/WiKkEhkxxyl6E=;
 b=bMQ5gmoxg3Gm+xVcNAYMqxeE9IwQrtQ7kG8ntwu1Zc4DySUWac0cCc/3fPtpmQmbr43iYNrqE5oXjMCxdPsDWrPEb7jdVgUkSbOcTLQuZ2p+93239QrBc6xO/j9vkjWUWXye3NQXO7s+w316/luhcw3Edqt6Eo7+szpx8koIhdK7wKpPFt2m4SZwiOoIGrE+wad9NMW6W4ogfR72SHKhzsh49Wm+lqxACkr3j28Lt7SBlouYSiBFcovX46Es3sMHry0mYrBynO1vzCHCfiRwmzvTeGhiAxXg4jm680aZh04qyou+JOUsQg6ZhaxdFs2pITwru0sS8leetQKRL6gJcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LCdtDt/Ba10+aNqhz1gNkesbsXVQs/WiKkEhkxxyl6E=;
 b=MPJStf40Lpk4e1YT6vioBPTyXW4vPCmH4TYCw8+YarFeZLVmotgmZXViCJ3ocFE+wDqjQDGsxvwGcUsJYTlrZBGwXI/WtdTc7dXbWmqkMptFzkB+4dw4eABjpYZ7BFgof9r0bf8y0kDhz+NPdDEsWuGbwhhwc9fOynounQvHXBk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR1001MB2288.namprd10.prod.outlook.com (2603:10b6:301:2c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Fri, 15 Oct
 2021 19:03:43 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6%9]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 19:03:43 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 10/10] ACPI ERST: step 6 of bios-tables-test.c
Date: Fri, 15 Oct 2021 15:03:00 -0400
Message-Id: <1634324580-27120-11-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1634324580-27120-1-git-send-email-eric.devolder@oracle.com>
References: <1634324580-27120-1-git-send-email-eric.devolder@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0129.namprd13.prod.outlook.com
 (2603:10b6:806:27::14) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 SA9PR13CA0129.namprd13.prod.outlook.com (2603:10b6:806:27::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.9 via Frontend Transport; Fri, 15 Oct 2021 19:03:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22d0e168-3ba7-42de-e3f3-08d9900e81d5
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2288:
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2288B56C64732EF9092F1DDF97B99@MWHPR1001MB2288.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:153;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SDHn4jSTmXqWfU5EPqTduMMunuDV6d9jbcb0j9flGoiy9ndkIVtccvcTWEDDDZHCaxQpWbVRVm5sHRlXLOvtBaHLethLrnEqbRCeSSavDTK48o1+8HRwmQEuG3xj2OoWrKfxq9MS2VVxuvhvovd+ng8xsqO+2IDrPMEF97VFsquBrgQ9134zV2Vzzjvup+edy819uGlIThtUa7XogRjLD1WW7oC1Z/HRGGhc9wQjc/8/Azm+2eFwYCe24e5ODciuVDT+00Zs9rChobULOYu3wJn6OLbGmUGZgWnWjnd3Gf/nSGS4mNkST5UISrWBDg09dfsL+bR7o8oR9Ej7+0GHwu67VcOhQBUvU2vtNtxKa3QS/TKPpfC3iknp4X+GQSboN3uC5f4Ck8gHoLxLGOc/GwhhmaYNeAAUWxq5tEm+yQJc7t3n1oag1cabnN2osDB97z9CDOswnvi52j+LHf2VqqrAEXDIL+rHecFaGQi94A3Hgvt5w7YDYaoQWqxxPTDZtn0N+rV4DsVTIHwF1UEj3hzTxo6xsxZ1CpCf7/aqa5jBCxPRdFbAiQQX8qkSve1wuCqb4WP2HKdQBZgwj3Y/b+yUbOtnra9BtEDcz8HIVka09V0nEJWjbIhYqoXxGviyRzwzzzsNg9xgvSdRl3uWS4CQT3y5Nia8nbrTlHIe1+erb+UUOXbw3F7C/KD3x9bSNUmHZe9D/0R/lmNXahq7Fw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(6486002)(316002)(107886003)(83380400001)(4001150100001)(956004)(6916009)(38100700002)(66946007)(8676002)(36756003)(4326008)(186003)(6666004)(508600001)(26005)(8936002)(2906002)(66556008)(66476007)(38350700002)(30864003)(7696005)(52116002)(2616005)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7atR62U/MqjmJYjt1Et4+bWf36OO0Lvch33Bgy1u0vDDlYr/Zj83/8Gt26N3?=
 =?us-ascii?Q?Z7T8orcj+x3UpVki+gkYw1hHWpRTZIK+MX8Yn2bxOup5fHzDTVkTjh4nOcti?=
 =?us-ascii?Q?ANc+A034xiFx4buok8LCJdMm2ZpaQw4fTNTsqjYMC2ijLJqJc8/ImJif6Xb5?=
 =?us-ascii?Q?qNOBAjkcoJ0dKYvr5O4RiNpXCs+r7BIIqccMj7IhrkVkD5LFfqP6EFt1MAga?=
 =?us-ascii?Q?0iTgxnErLYLfg14na3/zwUwg35qeWDwFc/SXwJCpIAkue4Kp4o3c7dMkinZx?=
 =?us-ascii?Q?iaq3MqIP5CfAto4buA/nrzQYhcr6cQX5YxL2RC0/V7FGGrOjMeETIXj9uhaW?=
 =?us-ascii?Q?9tmRvKd06lLUaxMLGNYASbO3Uomk3fSdasCLOaHcxwHlRhDb953+1pZGY6Yr?=
 =?us-ascii?Q?qvzBnRQAXRwsBFiIVSyAtKL7p8zUIxT/yR1OU60aKVeUqOpRfDc3O68N+CWc?=
 =?us-ascii?Q?rTzUU1ZLKgejDhq6L3BQHlA31HdpLwZl6b9OoV/7CxttLM2BGkeCm8wQRKmW?=
 =?us-ascii?Q?HZknhDaG3ZTByg+3mwDX7X1VXmZTVCGUw81EM9UcI+JuO6LkqMa6bMB01Ia4?=
 =?us-ascii?Q?VPSv9A58n20vjn5AlKL6bfOPNvJYbid9iiSUhSr7Ud41RlO7MXmZVfPoJUK8?=
 =?us-ascii?Q?lP0Mlp1MTPj6iQNBDFk41iyJmQ1iKZHEJMuySNPa+VRIRCoUX5PYNzaR4KDp?=
 =?us-ascii?Q?zpHeOCkd7F8e9/6rGhOgrVmbJiAGZQGnD1NK/PMebHl8/fmqjA4UilyEIq2w?=
 =?us-ascii?Q?ZE6RxKHH5LoyP/kKeBJfwXnroHEalX5Y7nrYTuG0H8iGoZbDYOLR06+i8SDS?=
 =?us-ascii?Q?Lmu0MJTXkyCOTHaghdGZkjfsiYuJPyzzgFp0EivBXGzMT3KkVhW3lJU/S/kM?=
 =?us-ascii?Q?kvGz7iztlnjpfm7Mk7y/NSEeSAA8hZRzn6twoXQSuBjwD/BMDIIwt0hIc/XW?=
 =?us-ascii?Q?JR3IdkBKOw2+ogiDAR2n2kJCC6EQdsU26OKFNwm5zn1ix2FEvxsoS8BrCr6D?=
 =?us-ascii?Q?DroRW4oQm+1LAgfAxsR7gZOmCT4bMr/m6vKR9PnKy2QHC+AlqeNAxCvMfOez?=
 =?us-ascii?Q?j07+HluIFRxn16rGgS+78FRsduI+uQk+HXX1YFpsjU3R2XeJx7oRuG9ml5Re?=
 =?us-ascii?Q?u6VMl/sqTsLGy+3XdwrulQPe0VLDNh2ROHlEcOsK2aQYK9V5WPzweYhu8c/T?=
 =?us-ascii?Q?GXr27HLPmpk97DVcEMNppBhsA+dVwHMX2Twe7rEC5C3bMcj80NuFQemo5Abb?=
 =?us-ascii?Q?jtoScUSd/UfSkXGb5UNDk0HV99eTXphY8Zhsu8cmBeL1Nvx4sIEUUCv/b5qP?=
 =?us-ascii?Q?KcF7wnnG5pUzR8Pq33bYK0Yt?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22d0e168-3ba7-42de-e3f3-08d9900e81d5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 19:03:43.3459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3OPI99pmP8z9+rrzCcb4ZmUJP1KZ7owISheq3jXfUyYd0x34CLez0R9L7pDzIVZULBi4FB4cuLp/NsDq1vSXegou4u1JgCLYkMARdvssWnA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2288
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10138
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110150116
X-Proofpoint-ORIG-GUID: WXgZyoagxKs4Lqnv4IC4THslHOe0fnW8
X-Proofpoint-GUID: WXgZyoagxKs4Lqnv4IC4THslHOe0fnW8
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_NONE=0.001,
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
is step 6.

Below is the disassembly of an ERST table, tests/data/acpi/pc/ERST.
This is a PCI device and as such its base address can change; it
is possible for the address fields to differ between this and other
ERST tables.

[000h 0000   4]                    Signature : "ERST"    [Error Record Serialization Table]
[004h 0004   4]                 Table Length : 00000390
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : D6
[00Ah 0010   6]                       Oem ID : "BOCHS "
[010h 0016   8]                 Oem Table ID : "BXPC    "
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "BXPC"
[020h 0032   4]        Asl Compiler Revision : 00000001

[024h 0036   4]  Serialization Header Length : 00000030
[028h 0040   4]                     Reserved : 00000000
[02Ch 0044   4]      Instruction Entry Count : 0000001B

[030h 0048   1]                       Action : 00 [Begin Write Operation]
[031h 0049   1]                  Instruction : 03 [Write Register Value]
[032h 0050   1]        Flags (decoded below) : 00
                      Preserve Register Bits : 0
[033h 0051   1]                     Reserved : 00

[034h 0052  12]              Register Region : [Generic Address Structure]
[034h 0052   1]                     Space ID : 00 [SystemMemory]
[035h 0053   1]                    Bit Width : 20
[036h 0054   1]                   Bit Offset : 00
[037h 0055   1]         Encoded Access Width : 03 [DWord Access:32]
[038h 0056   8]                      Address : 00000000FEBF3000

[040h 0064   8]                        Value : 0000000000000000
[048h 0072   8]                         Mask : 00000000000000FF

[050h 0080   1]                       Action : 01 [Begin Read Operation]
[051h 0081   1]                  Instruction : 03 [Write Register Value]
[052h 0082   1]        Flags (decoded below) : 00
                      Preserve Register Bits : 0
[053h 0083   1]                     Reserved : 00

[054h 0084  12]              Register Region : [Generic Address Structure]
[054h 0084   1]                     Space ID : 00 [SystemMemory]
[055h 0085   1]                    Bit Width : 20
[056h 0086   1]                   Bit Offset : 00
[057h 0087   1]         Encoded Access Width : 03 [DWord Access:32]
[058h 0088   8]                      Address : 00000000FEBF3000

[060h 0096   8]                        Value : 0000000000000001
[068h 0104   8]                         Mask : 00000000000000FF

[070h 0112   1]                       Action : 02 [Begin Clear Operation]
[071h 0113   1]                  Instruction : 03 [Write Register Value]
[072h 0114   1]        Flags (decoded below) : 00
                      Preserve Register Bits : 0
[073h 0115   1]                     Reserved : 00

[074h 0116  12]              Register Region : [Generic Address Structure]
[074h 0116   1]                     Space ID : 00 [SystemMemory]
[075h 0117   1]                    Bit Width : 20
[076h 0118   1]                   Bit Offset : 00
[077h 0119   1]         Encoded Access Width : 03 [DWord Access:32]
[078h 0120   8]                      Address : 00000000FEBF3000

[080h 0128   8]                        Value : 0000000000000002
[088h 0136   8]                         Mask : 00000000000000FF

[090h 0144   1]                       Action : 03 [End Operation]
[091h 0145   1]                  Instruction : 03 [Write Register Value]
[092h 0146   1]        Flags (decoded below) : 00
                      Preserve Register Bits : 0
[093h 0147   1]                     Reserved : 00

[094h 0148  12]              Register Region : [Generic Address Structure]
[094h 0148   1]                     Space ID : 00 [SystemMemory]
[095h 0149   1]                    Bit Width : 20
[096h 0150   1]                   Bit Offset : 00
[097h 0151   1]         Encoded Access Width : 03 [DWord Access:32]
[098h 0152   8]                      Address : 00000000FEBF3000

[0A0h 0160   8]                        Value : 0000000000000003
[0A8h 0168   8]                         Mask : 00000000000000FF

[0B0h 0176   1]                       Action : 04 [Set Record Offset]
[0B1h 0177   1]                  Instruction : 02 [Write Register]
[0B2h 0178   1]        Flags (decoded below) : 00
                      Preserve Register Bits : 0
[0B3h 0179   1]                     Reserved : 00

[0B4h 0180  12]              Register Region : [Generic Address Structure]
[0B4h 0180   1]                     Space ID : 00 [SystemMemory]
[0B5h 0181   1]                    Bit Width : 20
[0B6h 0182   1]                   Bit Offset : 00
[0B7h 0183   1]         Encoded Access Width : 03 [DWord Access:32]
[0B8h 0184   8]                      Address : 00000000FEBF3008

[0C0h 0192   8]                        Value : 0000000000000000
[0C8h 0200   8]                         Mask : 00000000FFFFFFFF

[0D0h 0208   1]                       Action : 04 [Set Record Offset]
[0D1h 0209   1]                  Instruction : 03 [Write Register Value]
[0D2h 0210   1]        Flags (decoded below) : 00
                      Preserve Register Bits : 0
[0D3h 0211   1]                     Reserved : 00

[0D4h 0212  12]              Register Region : [Generic Address Structure]
[0D4h 0212   1]                     Space ID : 00 [SystemMemory]
[0D5h 0213   1]                    Bit Width : 20
[0D6h 0214   1]                   Bit Offset : 00
[0D7h 0215   1]         Encoded Access Width : 03 [DWord Access:32]
[0D8h 0216   8]                      Address : 00000000FEBF3000

[0E0h 0224   8]                        Value : 0000000000000004
[0E8h 0232   8]                         Mask : 00000000000000FF

[0F0h 0240   1]                       Action : 05 [Execute Operation]
[0F1h 0241   1]                  Instruction : 03 [Write Register Value]
[0F2h 0242   1]        Flags (decoded below) : 00
                      Preserve Register Bits : 0
[0F3h 0243   1]                     Reserved : 00

[0F4h 0244  12]              Register Region : [Generic Address Structure]
[0F4h 0244   1]                     Space ID : 00 [SystemMemory]
[0F5h 0245   1]                    Bit Width : 20
[0F6h 0246   1]                   Bit Offset : 00
[0F7h 0247   1]         Encoded Access Width : 03 [DWord Access:32]
[0F8h 0248   8]                      Address : 00000000FEBF3008

[100h 0256   8]                        Value : 000000000000009C
[108h 0264   8]                         Mask : 00000000000000FF

[110h 0272   1]                       Action : 05 [Execute Operation]
[111h 0273   1]                  Instruction : 03 [Write Register Value]
[112h 0274   1]        Flags (decoded below) : 00
                      Preserve Register Bits : 0
[113h 0275   1]                     Reserved : 00

[114h 0276  12]              Register Region : [Generic Address Structure]
[114h 0276   1]                     Space ID : 00 [SystemMemory]
[115h 0277   1]                    Bit Width : 20
[116h 0278   1]                   Bit Offset : 00
[117h 0279   1]         Encoded Access Width : 03 [DWord Access:32]
[118h 0280   8]                      Address : 00000000FEBF3000

[120h 0288   8]                        Value : 0000000000000005
[128h 0296   8]                         Mask : 00000000000000FF

[130h 0304   1]                       Action : 06 [Check Busy Status]
[131h 0305   1]                  Instruction : 03 [Write Register Value]
[132h 0306   1]        Flags (decoded below) : 00
                      Preserve Register Bits : 0
[133h 0307   1]                     Reserved : 00

[134h 0308  12]              Register Region : [Generic Address Structure]
[134h 0308   1]                     Space ID : 00 [SystemMemory]
[135h 0309   1]                    Bit Width : 20
[136h 0310   1]                   Bit Offset : 00
[137h 0311   1]         Encoded Access Width : 03 [DWord Access:32]
[138h 0312   8]                      Address : 00000000FEBF3000

[140h 0320   8]                        Value : 0000000000000006
[148h 0328   8]                         Mask : 00000000000000FF

[150h 0336   1]                       Action : 06 [Check Busy Status]
[151h 0337   1]                  Instruction : 01 [Read Register Value]
[152h 0338   1]        Flags (decoded below) : 00
                      Preserve Register Bits : 0
[153h 0339   1]                     Reserved : 00

[154h 0340  12]              Register Region : [Generic Address Structure]
[154h 0340   1]                     Space ID : 00 [SystemMemory]
[155h 0341   1]                    Bit Width : 20
[156h 0342   1]                   Bit Offset : 00
[157h 0343   1]         Encoded Access Width : 03 [DWord Access:32]
[158h 0344   8]                      Address : 00000000FEBF3008

[160h 0352   8]                        Value : 0000000000000001
[168h 0360   8]                         Mask : 00000000000000FF

[170h 0368   1]                       Action : 07 [Get Command Status]
[171h 0369   1]                  Instruction : 03 [Write Register Value]
[172h 0370   1]        Flags (decoded below) : 00
                      Preserve Register Bits : 0
[173h 0371   1]                     Reserved : 00

[174h 0372  12]              Register Region : [Generic Address Structure]
[174h 0372   1]                     Space ID : 00 [SystemMemory]
[175h 0373   1]                    Bit Width : 20
[176h 0374   1]                   Bit Offset : 00
[177h 0375   1]         Encoded Access Width : 03 [DWord Access:32]
[178h 0376   8]                      Address : 00000000FEBF3000

[180h 0384   8]                        Value : 0000000000000007
[188h 0392   8]                         Mask : 00000000000000FF

[190h 0400   1]                       Action : 07 [Get Command Status]
[191h 0401   1]                  Instruction : 00 [Read Register]
[192h 0402   1]        Flags (decoded below) : 00
                      Preserve Register Bits : 0
[193h 0403   1]                     Reserved : 00

[194h 0404  12]              Register Region : [Generic Address Structure]
[194h 0404   1]                     Space ID : 00 [SystemMemory]
[195h 0405   1]                    Bit Width : 20
[196h 0406   1]                   Bit Offset : 00
[197h 0407   1]         Encoded Access Width : 03 [DWord Access:32]
[198h 0408   8]                      Address : 00000000FEBF3008

[1A0h 0416   8]                        Value : 0000000000000000
[1A8h 0424   8]                         Mask : 00000000000000FF

[1B0h 0432   1]                       Action : 08 [Get Record Identifier]
[1B1h 0433   1]                  Instruction : 03 [Write Register Value]
[1B2h 0434   1]        Flags (decoded below) : 00
                      Preserve Register Bits : 0
[1B3h 0435   1]                     Reserved : 00

[1B4h 0436  12]              Register Region : [Generic Address Structure]
[1B4h 0436   1]                     Space ID : 00 [SystemMemory]
[1B5h 0437   1]                    Bit Width : 20
[1B6h 0438   1]                   Bit Offset : 00
[1B7h 0439   1]         Encoded Access Width : 03 [DWord Access:32]
[1B8h 0440   8]                      Address : 00000000FEBF3000

[1C0h 0448   8]                        Value : 0000000000000008
[1C8h 0456   8]                         Mask : 00000000000000FF

[1D0h 0464   1]                       Action : 08 [Get Record Identifier]
[1D1h 0465   1]                  Instruction : 00 [Read Register]
[1D2h 0466   1]        Flags (decoded below) : 00
                      Preserve Register Bits : 0
[1D3h 0467   1]                     Reserved : 00

[1D4h 0468  12]              Register Region : [Generic Address Structure]
[1D4h 0468   1]                     Space ID : 00 [SystemMemory]
[1D5h 0469   1]                    Bit Width : 40
[1D6h 0470   1]                   Bit Offset : 00
[1D7h 0471   1]         Encoded Access Width : 04 [QWord Access:64]
[1D8h 0472   8]                      Address : 00000000FEBF3008

[1E0h 0480   8]                        Value : 0000000000000000
[1E8h 0488   8]                         Mask : FFFFFFFFFFFFFFFF

[1F0h 0496   1]                       Action : 09 [Set Record Identifier]
[1F1h 0497   1]                  Instruction : 02 [Write Register]
[1F2h 0498   1]        Flags (decoded below) : 00
                      Preserve Register Bits : 0
[1F3h 0499   1]                     Reserved : 00

[1F4h 0500  12]              Register Region : [Generic Address Structure]
[1F4h 0500   1]                     Space ID : 00 [SystemMemory]
[1F5h 0501   1]                    Bit Width : 40
[1F6h 0502   1]                   Bit Offset : 00
[1F7h 0503   1]         Encoded Access Width : 04 [QWord Access:64]
[1F8h 0504   8]                      Address : 00000000FEBF3008

[200h 0512   8]                        Value : 0000000000000000
[208h 0520   8]                         Mask : FFFFFFFFFFFFFFFF

[210h 0528   1]                       Action : 09 [Set Record Identifier]
[211h 0529   1]                  Instruction : 03 [Write Register Value]
[212h 0530   1]        Flags (decoded below) : 00
                      Preserve Register Bits : 0
[213h 0531   1]                     Reserved : 00

[214h 0532  12]              Register Region : [Generic Address Structure]
[214h 0532   1]                     Space ID : 00 [SystemMemory]
[215h 0533   1]                    Bit Width : 20
[216h 0534   1]                   Bit Offset : 00
[217h 0535   1]         Encoded Access Width : 03 [DWord Access:32]
[218h 0536   8]                      Address : 00000000FEBF3000

[220h 0544   8]                        Value : 0000000000000009
[228h 0552   8]                         Mask : 00000000000000FF

[230h 0560   1]                       Action : 0A [Get Record Count]
[231h 0561   1]                  Instruction : 03 [Write Register Value]
[232h 0562   1]        Flags (decoded below) : 00
                      Preserve Register Bits : 0
[233h 0563   1]                     Reserved : 00

[234h 0564  12]              Register Region : [Generic Address Structure]
[234h 0564   1]                     Space ID : 00 [SystemMemory]
[235h 0565   1]                    Bit Width : 20
[236h 0566   1]                   Bit Offset : 00
[237h 0567   1]         Encoded Access Width : 03 [DWord Access:32]
[238h 0568   8]                      Address : 00000000FEBF3000

[240h 0576   8]                        Value : 000000000000000A
[248h 0584   8]                         Mask : 00000000000000FF

[250h 0592   1]                       Action : 0A [Get Record Count]
[251h 0593   1]                  Instruction : 00 [Read Register]
[252h 0594   1]        Flags (decoded below) : 00
                      Preserve Register Bits : 0
[253h 0595   1]                     Reserved : 00

[254h 0596  12]              Register Region : [Generic Address Structure]
[254h 0596   1]                     Space ID : 00 [SystemMemory]
[255h 0597   1]                    Bit Width : 20
[256h 0598   1]                   Bit Offset : 00
[257h 0599   1]         Encoded Access Width : 03 [DWord Access:32]
[258h 0600   8]                      Address : 00000000FEBF3008

[260h 0608   8]                        Value : 0000000000000000
[268h 0616   8]                         Mask : 00000000FFFFFFFF

[270h 0624   1]                       Action : 0B [Begin Dummy Write]
[271h 0625   1]                  Instruction : 03 [Write Register Value]
[272h 0626   1]        Flags (decoded below) : 00
                      Preserve Register Bits : 0
[273h 0627   1]                     Reserved : 00

[274h 0628  12]              Register Region : [Generic Address Structure]
[274h 0628   1]                     Space ID : 00 [SystemMemory]
[275h 0629   1]                    Bit Width : 20
[276h 0630   1]                   Bit Offset : 00
[277h 0631   1]         Encoded Access Width : 03 [DWord Access:32]
[278h 0632   8]                      Address : 00000000FEBF3000

[280h 0640   8]                        Value : 000000000000000B
[288h 0648   8]                         Mask : 00000000000000FF

[290h 0656   1]                       Action : 0D [Get Error Address Range]
[291h 0657   1]                  Instruction : 03 [Write Register Value]
[292h 0658   1]        Flags (decoded below) : 00
                      Preserve Register Bits : 0
[293h 0659   1]                     Reserved : 00

[294h 0660  12]              Register Region : [Generic Address Structure]
[294h 0660   1]                     Space ID : 00 [SystemMemory]
[295h 0661   1]                    Bit Width : 20
[296h 0662   1]                   Bit Offset : 00
[297h 0663   1]         Encoded Access Width : 03 [DWord Access:32]
[298h 0664   8]                      Address : 00000000FEBF3000

[2A0h 0672   8]                        Value : 000000000000000D
[2A8h 0680   8]                         Mask : 00000000000000FF

[2B0h 0688   1]                       Action : 0D [Get Error Address Range]
[2B1h 0689   1]                  Instruction : 00 [Read Register]
[2B2h 0690   1]        Flags (decoded below) : 00
                      Preserve Register Bits : 0
[2B3h 0691   1]                     Reserved : 00

[2B4h 0692  12]              Register Region : [Generic Address Structure]
[2B4h 0692   1]                     Space ID : 00 [SystemMemory]
[2B5h 0693   1]                    Bit Width : 40
[2B6h 0694   1]                   Bit Offset : 00
[2B7h 0695   1]         Encoded Access Width : 04 [QWord Access:64]
[2B8h 0696   8]                      Address : 00000000FEBF3008

[2C0h 0704   8]                        Value : 0000000000000000
[2C8h 0712   8]                         Mask : FFFFFFFFFFFFFFFF

[2D0h 0720   1]                       Action : 0E [Get Error Address Length]
[2D1h 0721   1]                  Instruction : 03 [Write Register Value]
[2D2h 0722   1]        Flags (decoded below) : 00
                      Preserve Register Bits : 0
[2D3h 0723   1]                     Reserved : 00

[2D4h 0724  12]              Register Region : [Generic Address Structure]
[2D4h 0724   1]                     Space ID : 00 [SystemMemory]
[2D5h 0725   1]                    Bit Width : 20
[2D6h 0726   1]                   Bit Offset : 00
[2D7h 0727   1]         Encoded Access Width : 03 [DWord Access:32]
[2D8h 0728   8]                      Address : 00000000FEBF3000

[2E0h 0736   8]                        Value : 000000000000000E
[2E8h 0744   8]                         Mask : 00000000000000FF

[2F0h 0752   1]                       Action : 0E [Get Error Address Length]
[2F1h 0753   1]                  Instruction : 00 [Read Register]
[2F2h 0754   1]        Flags (decoded below) : 00
                      Preserve Register Bits : 0
[2F3h 0755   1]                     Reserved : 00

[2F4h 0756  12]              Register Region : [Generic Address Structure]
[2F4h 0756   1]                     Space ID : 00 [SystemMemory]
[2F5h 0757   1]                    Bit Width : 40
[2F6h 0758   1]                   Bit Offset : 00
[2F7h 0759   1]         Encoded Access Width : 04 [QWord Access:64]
[2F8h 0760   8]                      Address : 00000000FEBF3008

[300h 0768   8]                        Value : 0000000000000000
[308h 0776   8]                         Mask : 00000000FFFFFFFF

[310h 0784   1]                       Action : 0F [Get Error Attributes]
[311h 0785   1]                  Instruction : 03 [Write Register Value]
[312h 0786   1]        Flags (decoded below) : 00
                      Preserve Register Bits : 0
[313h 0787   1]                     Reserved : 00

[314h 0788  12]              Register Region : [Generic Address Structure]
[314h 0788   1]                     Space ID : 00 [SystemMemory]
[315h 0789   1]                    Bit Width : 20
[316h 0790   1]                   Bit Offset : 00
[317h 0791   1]         Encoded Access Width : 03 [DWord Access:32]
[318h 0792   8]                      Address : 00000000FEBF3000

[320h 0800   8]                        Value : 000000000000000F
[328h 0808   8]                         Mask : 00000000000000FF

[330h 0816   1]                       Action : 0F [Get Error Attributes]
[331h 0817   1]                  Instruction : 00 [Read Register]
[332h 0818   1]        Flags (decoded below) : 00
                      Preserve Register Bits : 0
[333h 0819   1]                     Reserved : 00

[334h 0820  12]              Register Region : [Generic Address Structure]
[334h 0820   1]                     Space ID : 00 [SystemMemory]
[335h 0821   1]                    Bit Width : 20
[336h 0822   1]                   Bit Offset : 00
[337h 0823   1]         Encoded Access Width : 03 [DWord Access:32]
[338h 0824   8]                      Address : 00000000FEBF3008

[340h 0832   8]                        Value : 0000000000000000
[348h 0840   8]                         Mask : 00000000FFFFFFFF

[350h 0848   1]                       Action : 10 [Execute Timings]
[351h 0849   1]                  Instruction : 03 [Write Register Value]
[352h 0850   1]        Flags (decoded below) : 00
                      Preserve Register Bits : 0
[353h 0851   1]                     Reserved : 00

[354h 0852  12]              Register Region : [Generic Address Structure]
[354h 0852   1]                     Space ID : 00 [SystemMemory]
[355h 0853   1]                    Bit Width : 20
[356h 0854   1]                   Bit Offset : 00
[357h 0855   1]         Encoded Access Width : 03 [DWord Access:32]
[358h 0856   8]                      Address : 00000000FEBF3000

[360h 0864   8]                        Value : 0000000000000010
[368h 0872   8]                         Mask : 00000000000000FF

[370h 0880   1]                       Action : 10 [Execute Timings]
[371h 0881   1]                  Instruction : 00 [Read Register]
[372h 0882   1]        Flags (decoded below) : 00
                      Preserve Register Bits : 0
[373h 0883   1]                     Reserved : 00

[374h 0884  12]              Register Region : [Generic Address Structure]
[374h 0884   1]                     Space ID : 00 [SystemMemory]
[375h 0885   1]                    Bit Width : 40
[376h 0886   1]                   Bit Offset : 00
[377h 0887   1]         Encoded Access Width : 04 [QWord Access:64]
[378h 0888   8]                      Address : 00000000FEBF3008

[380h 0896   8]                        Value : 0000000000000000
[388h 0904   8]                         Mask : FFFFFFFFFFFFFFFF

And the diff of DSDT (note this seems to suggest that some other
device is omitted from the .acpierst configuration, but otherwise
DSDT is unchanged).

 --- dsdt-noacpierst.dsl	2021-10-14 15:44:13.000000000 -0400
 +++ dsdt-acpierst.dsl	2021-10-14 15:47:14.000000000 -0400
@@ -5,13 +5,13 @@
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/pc/DSDT, Thu Oct 14 15:44:13 2021
+ * Disassembly of tests/data/acpi/pc/DSDT.acpierst, Thu Oct 14 15:47:14 2021
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x00001772 (6002)
+ *     Length           0x00001751 (5969)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0x9E
+ *     Checksum         0x95
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPC    "
  *     OEM Revision     0x00000001 (1)
@@ -964,16 +964,11 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS "

             Device (S18)
             {
-                Name (_SUN, 0x03)  // _SUN: Slot User Number
                 Name (_ADR, 0x00030000)  // _ADR: Address
-                Method (_EJ0, 1, NotSerialized)  // _EJx: Eject Device
-                {
-                    PCEJ (BSEL, _SUN)
-                }
-
+                Name (ASUN, 0x03)
                 Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                 {
-                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, _SUN))
+                    Return (PDSM (Arg0, Arg1, Arg2, Arg3, BSEL, ASUN))
                 }
             }

@@ -1399,11 +1394,6 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS "

             Method (DVNT, 2, NotSerialized)
             {
-                If ((Arg0 & 0x08))
-                {
-                    Notify (S18, Arg1)
-                }
-
                 If ((Arg0 & 0x10))
                 {
                     Notify (S20, Arg1)

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
---
 tests/data/acpi/microvm/ERST.pcie           | Bin 0 -> 912 bytes
 tests/data/acpi/pc/DSDT.acpierst            | Bin 0 -> 5969 bytes
 tests/data/acpi/q35/DSDT.acpierst           | Bin 0 -> 8306 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   5 -----
 4 files changed, 5 deletions(-)

diff --git a/tests/data/acpi/microvm/ERST.pcie b/tests/data/acpi/microvm/ERST.pcie
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..d9a2b3211ab5893a50751ad52be3782579e367f2 100644
GIT binary patch
literal 912
zcmaKpO%8%E5QPUQ|KVrvh9h_c12J)@5f?5!k_Ygv*jGA8UW7?#`}+D#XXyDpKHiZ?
z@anI_W$gOrZRl(SB7!yMqx}#E4EC&a5=}m^g_!0^0`kEl)DOuIXM6D@@*xq*8vyqH
z)b0KTlmlgmH~xt7vG<k#Z1~z=OnyT76ZX;Ysy^;NC0^^$`kY?zKK;^vMtny1JAD$P
zc^BR{l;i*H`IJAW`~~?1`_TXD_wQ2@UlL!DU$GCpQ-4i-O}x_^JdQTRH^e)=(_c$`
LOT5z?_v4Aa+v(5&

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/pc/DSDT.acpierst b/tests/data/acpi/pc/DSDT.acpierst
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..bb0593eeb8730d51a6f0fe51a00a00df9c83c419 100644
GIT binary patch
literal 5969
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

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/DSDT.acpierst b/tests/data/acpi/q35/DSDT.acpierst
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..b0eafe90e5832935557ec5e6802c0147c88f379c 100644
GIT binary patch
literal 8306
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
L!3s0<%&`9h*gn5%

literal 0
HcmV?d00001

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index c06241a..dfb8523 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,6 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/DSDT.acpierst",
-"tests/data/acpi/pc/ERST",
-"tests/data/acpi/q35/DSDT.acpierst",
-"tests/data/acpi/q35/ERST",
-"tests/data/acpi/microvm/ERST.pcie",
-- 
1.8.3.1


