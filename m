Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 908CB46F2CB
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 19:08:11 +0100 (CET)
Received: from localhost ([::1]:54478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvNpy-0005a8-M1
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 13:08:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mvNgh-0000Kk-1B
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 12:58:35 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:21668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mvNgc-00033c-OW
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 12:58:34 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B9Hfjvm028298; 
 Thu, 9 Dec 2021 17:58:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2021-07-09;
 bh=WEhbo6JhI8teBzguE/uXGDbztcnVPYxZmVXAS/fx+bU=;
 b=FdbZpxjXtF1A7h7V+sCPzYaPbw1uEmql8nmltniwRQJuNFa+FWEqNRj8mwZ5Ig4SanZu
 j6//Gbp+32vQ24V1Z8IReZu7BEdfGIDQx8opJy/Dets4bix1xzMijTYgvmiLs4x+kjzh
 4s00WsP02K6gIYoBIyFZm9T2Kj7EYqDs1A8MSO1PZlf7cmTUR23cGadjeUxg07bhROQL
 mWdnBHp6j1Z6P1TxCPngbQqy4EPnxzIcXU3t6IOj4Tek0Nd26oIYbB96hztym53qiOwg
 es875hjWihh5R08gWIQpoyscRC0Q1MSJE6KQjVMwiyv7pTnOxbCX0eLn86YSs2Slq7F1 8w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ctse1m2v5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Dec 2021 17:58:27 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B9HonBB119771;
 Thu, 9 Dec 2021 17:58:26 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by userp3020.oracle.com with ESMTP id 3cr1ssvdsc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 09 Dec 2021 17:58:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eeM5jRxN99GX/k/HSNp/FK5RGfelBhMvW6o8D6Fdyif0gTwHeX6IgouSleFYgu+Fe9wRqMaus1+zDdtnZnwtyfPZl8xKV2J3Fxn6YJb+FPlJEF3xKnFwtwnW/4a/HxvnPtAlNm9X+TPvGe3IWUB26KkBHsZg74M+HiN9VhxpLyaF/3bHv2UfwS6xj1WapeUaz6KEN4VhDSbHlupdtcym9dO+2YwlHVEagtFEm0wzri9A2JFzIVuTvD/qGNMtuS7yTWMZPfodzrXKjFnh/04Hoem88NF10A4+QGLEcdlFD9YNjb/c883TtDYnNyvZerA3MvtMztB5lnwUNkG4QGQyMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WEhbo6JhI8teBzguE/uXGDbztcnVPYxZmVXAS/fx+bU=;
 b=BOT5PUVRrG8a0sNMW0bWREY/egV8tRsatXsa5K9badZNeN1G6XRb0T7LEwpkH3jy/Uvyk/mR7OCK1/2HS2wgY1bCsqPL6pjVNlocB1OFYN+DFQZGS4M9lmDoVuIhlLRi56WgXGxiUWuMd7v9N4FGAsWTkor7+sTP1m+Hr8xpq2rSbSq8A5tgPITg5XPTTN6KrE3GeelHBKoo3qFCokmtErDYrBONBMzr7qwO0M90FklbK2vQVm8yI0ctmYiNLM9/1+D7TyiqGNSgEV6W1y44WEKyPvYgGho1GPvqzPr1JPf1kbmuX6WXC/sB7l1XAQeyD3r6Xh5MR3gtaztHtRV4QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEhbo6JhI8teBzguE/uXGDbztcnVPYxZmVXAS/fx+bU=;
 b=RCiNv3SHUO5PGUKLqPfdeuVWZE9ow6Hmt8O4wRUjo5tZWbfujYsFSyuD3JbsHNB7aHaNufQpNhg+v1FaWcD6w42KuD7B1JN/QLvAAaOrQWDfY4w4AHsseMcL1Nt93Bm7hW/D1hAz3P/ZhJcWuQ+BNPWW2GaQuANfqixKVWlbXNA=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by MWHPR10MB1503.namprd10.prod.outlook.com (2603:10b6:300:22::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 17:58:19 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::143c:ea64:7017:19f%4]) with mapi id 15.20.4755.022; Thu, 9 Dec 2021
 17:58:19 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 10/10] ACPI ERST: step 6 of bios-tables-test.c
Date: Thu,  9 Dec 2021 12:57:35 -0500
Message-Id: <1639072655-19271-11-git-send-email-eric.devolder@oracle.com>
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
 Thu, 9 Dec 2021 17:58:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d01ff0bd-9143-404b-c776-08d9bb3d7bb5
X-MS-TrafficTypeDiagnostic: MWHPR10MB1503:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB150370F3374B1E1A6D2606A097709@MWHPR10MB1503.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:177;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aTgAcTmSxLB13fNlKC9uKpJv1BwP+h21V0tIsthfKiNyfUcJjFmLmBHdWSosADTZ2y0McUMmqjNg6+2ymAww3JU+9FZ/yohSGe4Dl1ZjbQUuKCqUeQctumfBTlDYIC9fXpjaDA09H5RMcKhxc++5oBN6mpbWQnZ5qasiZsTjn4BSh43WGknCkuTxTxNw08a9xK0NaSEZw09zFeLkng3H5bf50njHuQDB7WmGnI/e7uY823zP8IU9PzkfWnGCIAz5GppjUC/bMtX9iuR88fTEmAnu7kkX8hqRq/CMGWnVpLM3WJdhcKVV9jXArdt60Tvmt/rm5u7Q23oE9iturhP3HpAlHV3wZMVi30k3lIagJZVoVUXAPjKWHHz8wc3wPT3lFInxlazvYGT22BTs55IMePnllkyRTPv+LynMDXw2Q6+NBPngAhU4JyR3i2T/c6bZeT4hCahfaiIZRyyIEtAfwqzIF3LfLF3rCM4zpKr9SkGCoJnXAF6W2CC7r2y30olHDjhcH/rJygUI3l/vh8PoY9uRLPdaMMsHVKmZkC3p7WCXF/u+akzeuLydti1Mv86ZD5Jx2w/KCz5guE3tSzInwstKyvftSEEXIpJJ6Dvpp9ovjIGEuzOwT5vzM8K8U/6vfHDAPsPqR3KFHksT2KpZBHj+tnsR2WsbiU6igwxlNm1ayKTKt3ngRu5FI9ZGNmEoid8REsdx7N9/GkVx9/Si0g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2616005)(5660300002)(4326008)(956004)(52116002)(66946007)(38350700002)(8676002)(7696005)(6486002)(83380400001)(107886003)(36756003)(38100700002)(66476007)(26005)(186003)(86362001)(66556008)(508600001)(6666004)(30864003)(2906002)(8936002)(316002)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YseFM83FUN6PIB9BA+M4cbmX6RZGE9nKDPg3SmKjDyegxGwbX/h+JtE8VfO4?=
 =?us-ascii?Q?D0HYg8R/rR4HAfhs3DbtfkDov3O+acSEMCpgTQK4vqzC2XNKUKm81lH35n/D?=
 =?us-ascii?Q?o3RWOQR7mopr7/4cOsuZG2WisoydT8LicGlNLwnDzd43rMNHb+kI5NsD5+B0?=
 =?us-ascii?Q?YvY9L1gOVzYZZzgOo9hvFB4o6cO1ihrD9HKCy7IV8EqatddM7A3R4EJJ+wsM?=
 =?us-ascii?Q?jsWhSsRvZuWBxIDS2sfY9TCmCKSVOZcrGNZEPzzItfkYzTF2olvVnQq79f/H?=
 =?us-ascii?Q?4L014pz29g4z1qBoeHcW+IE4mxDnZdjZLEYt0rcURyTJvYkMqXyijvdjdsgA?=
 =?us-ascii?Q?5fKS74D/RZNe5PO3dD6xNM5jeQGndP7vFfcGHotb6jnxp21GtOqGPQx+Xt26?=
 =?us-ascii?Q?uS+syGVXb3fEbkgu1rVtE6pAkzdz9piZYDzCjHUrH9YdvRjG8G6fJ3mSfGYQ?=
 =?us-ascii?Q?wIX/oeUyjQlw/ATTw9S4ysLiL20kPYOSomY2YGtZO52Bfyn8PGwMJ6enbqqM?=
 =?us-ascii?Q?uLqHbT2HAlGy2UNNbNODuDEHZQPKtPJftmxMxWXUeaPVfGQSmNPILFDqvBru?=
 =?us-ascii?Q?8grtHFrxhNruNpl2F4JWoyR/NP8eqM7kYUl2CQwXTC1O/JFkIe5twOnURBb3?=
 =?us-ascii?Q?penPQs4GNTPshO/etWq86lTjwx/xVXxnuinj43mkwrePORLZZt7GOCMQhpVT?=
 =?us-ascii?Q?7wsTLGQn289McAMSFsdsICqj5tu3gPRWnmiSg+Rd/2WWsAvs/40b97eG90Ye?=
 =?us-ascii?Q?xr2cVz1vcgEfAkuFwCX+FEuU5qW2fArXefqZUkXPKn5+XKwvolveBToWbj61?=
 =?us-ascii?Q?2rvrsaqO4ZTSZ6XlmTQoFBBVmidzr+eJwQPVQVUjYc/0njH1IxNScY4zVbhc?=
 =?us-ascii?Q?qa0hFXkxPd+ITeX9TmVHslagjalKEEKHELRyJf7TYMfTQq+Kzam2K0Jqt0P/?=
 =?us-ascii?Q?RdakmPgdIVUQwsVOd7t14nknN/CaGZWdI2MOqDRRAQ+zleDMNTBHRb//3l60?=
 =?us-ascii?Q?ddrfYeX5MnuidG0Or/2/Vxo74uUez7osqDUpm7TUZZT2eJFfDgLBr06o+dAy?=
 =?us-ascii?Q?bUS1I6NEUSPnP+HtCA+oydPGIePbEp2XvjSFmwJbgtgymjcPDgr3dZiVmJHO?=
 =?us-ascii?Q?MLAu+9sB29ohLZVihweFV+45isUCVRP41jArb7NzzSnCiNG1PxZZkANWfIeR?=
 =?us-ascii?Q?ZBurcR4QZA/gzYd7FYRdepNAHHiW6ogxhxD25pawDOgpd/XTVD6j58tWGoGG?=
 =?us-ascii?Q?7FstnjKC9gTzSb8Ac81hEIBfHnSbz5F2JGx6aYVpPTRtNW7wZNptC/CAU/j7?=
 =?us-ascii?Q?e+p8bfoPHaA12QC6cGpmqSr4co9XaR50P2zuYprcqnqjaa3rh4ypS3X0gC5n?=
 =?us-ascii?Q?OLs+lM02tF09O5gve0bVnr6gvU9kJyAn/9QoikVGmMKYEjaCEJBbPp10dAdu?=
 =?us-ascii?Q?GsAYCtBva/4OPJbCsGDaWLh8xEWmimXjNyk8ZVtlox13Y9HRmUr0PoMU1nMl?=
 =?us-ascii?Q?zFTKtnInkdBonA5AGJzntEYfYtaUXxigpC5tfRltfaRAtPLrVfRNv6VnTCAM?=
 =?us-ascii?Q?r7APkvU+SmhUt5uLuuC805zymBQIFovhcWodrTFqnlW7I3NQAcKZAMdqgBEy?=
 =?us-ascii?Q?0MWGNj7coR/7mQoa/6xjm0p/GESLsMG+1n5pwLWhg4qdWb74k9IIW1sREZ6g?=
 =?us-ascii?Q?jbVPmXy/DDelV6EQQ+2UTBLPQRk=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d01ff0bd-9143-404b-c776-08d9bb3d7bb5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 17:58:19.3795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CmbyaMwTlOYNd+t4ULYI++NK3t+nEY8zvewSkuen/z1uHhrUiX4U9q1H6iyrAkxsguamL4qqUUNyjHp0L3mk7rxWEcKJqwLIwtOq8dpfs5Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1503
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10193
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=922
 mlxscore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112090093
X-Proofpoint-GUID: xg7knWsO7YiHrnYr9R8ms5aeOq7ehHNI
X-Proofpoint-ORIG-GUID: xg7knWsO7YiHrnYr9R8ms5aeOq7ehHNI
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
is step 6.

Below is the disassembly of tests/data/acpi/pc/ERST.acpierst.

 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20180508 (64-bit version)
  * Copyright (c) 2000 - 2018 Intel Corporation
  *
  * Disassembly of tests/data/acpi/pc/ERST.acpierst, Thu Dec  2 13:32:07 2021
  *
  * ACPI Data Table [ERST]
  *
  * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
  */

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

 Raw Table Data: Length 912 (0x390)

Note that the contents of tests/data/q35/ERST.acpierst and
tests/data/microvm/ERST.pcie are the same except for differences
due to assigned base address.

Files tests/data/pc/DSDT.acpierst and tests/data/acpi/q35/DSDT.acpierst
are new files (and are included as a result of 'make check' process).
Rather than provide the entire content, I am providing the differences
between pc/DSDT and pc/DSDT.acpierst, and the difference between
q35/DSDT and q35/DSDT.acpierst, with an explanation to follow.

diff pc/DSDT pc/DSDT.acpierst:
 @@ -5,13 +5,13 @@
   *
   * Disassembling to symbolic ASL+ operators
   *
 - * Disassembly of tests/data/acpi/pc/DSDT, Thu Dec  2 10:10:13 2021
 + * Disassembly of tests/data/acpi/pc/DSDT.acpierst, Thu Dec  2 12:59:36 2021
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

diff q35/DSDT and q35/DSDT.acpierst:
 @@ -5,13 +5,13 @@
   *
   * Disassembling to symbolic ASL+ operators
   *
 - * Disassembly of tests/data/acpi/q35/DSDT, Thu Dec  2 10:10:13 2021
 + * Disassembly of tests/data/acpi/q35/DSDT.acpierst, Thu Dec  2 12:59:36 2021
   *
   * Original Table Header:
   *     Signature        "DSDT"
 - *     Length           0x00002061 (8289)
 + *     Length           0x00002072 (8306)
   *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
 - *     Checksum         0xFA
 + *     Checksum         0x9A
   *     OEM ID           "BOCHS "
   *     OEM Table ID     "BXPC    "
   *     OEM Revision     0x00000001 (1)
 @@ -3278,6 +3278,11 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS "
                  }
              }

 +            Device (S10)
 +            {
 +                Name (_ADR, 0x00020000)  // _ADR: Address
 +            }
 +
              Method (PCNT, 0, NotSerialized)
              {
              }

For both pc and q35, there is but a small difference between this
DSDT.acpierst and the corresponding DSDT. In both cases, the changes
occur under the hiearchy:

    Scope (\_SB)
    {
        Scope (PCI0)
        {

which leads me to believe that the change to the DSDT was needed
due to the introduction of the ERST PCI device.

And is explained in detail by Ani Sinha:
I have convinced myself of the changes we see in the DSDT tables.
On i440fx side, we are adding a non-hotpluggable pci device on slot 3.
So the changes we see are basically replacing an empty hotpluggable
slot on the pci root port with a non-hotplugggable device.
On q35, bsel on pcie root bus is not set (its not hotpluggable bus),
so the change basically adds the address enumeration for the device.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Acked-by: Ani Sinha <ani@anisinha.ca>
---
 tests/data/acpi/microvm/ERST.pcie           | Bin 0 -> 912 bytes
 tests/data/acpi/pc/DSDT.acpierst            | Bin 0 -> 5969 bytes
 tests/data/acpi/pc/ERST.acpierst            | Bin 0 -> 912 bytes
 tests/data/acpi/q35/DSDT.acpierst           | Bin 0 -> 8306 bytes
 tests/data/acpi/q35/ERST.acpierst           | Bin 0 -> 912 bytes
 tests/qtest/bios-tables-test-allowed-diff.h |   5 -----
 6 files changed, 5 deletions(-)

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

diff --git a/tests/data/acpi/pc/ERST.acpierst b/tests/data/acpi/pc/ERST.acpierst
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..f24fadd345c798ee5c17cdb66e0e1703bd1b2f26 100644
GIT binary patch
literal 912
zcmaKpOAdlC6h#XZC=fn#CoF*_7>J28jW}>wF2KFG3zs9lTPTnl;U#=7r>E_sr(1u2
z21<FK_R^jEx_w-`TFO&O;T_LLF4O@x8LMi!H}5Z^t6_Tah{H!Y?i2S%JoA7!BFgz1
zf~;?N{b8^}H2K=viyuzh`L7M``U{CiG=Ib#4X^gc{m10T<lDURCp`CW$T#HMd{o-?
zH~aE`PznCu9;f*enm;9;GDrTme_0zSBR|7ODR;g(@qEM!N8Z_gL4HBL%^N<3mgJY@
R+q~0XMSexT%^U0Ee0~)`g#iEn

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/DSDT.acpierst b/tests/data/acpi/q35/DSDT.acpierst
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..cad26e3f0c27a40a33101155a5282ed9bcb1d441 100644
GIT binary patch
literal 8306
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
Lf)z9L%&`9h*%QBN

literal 0
HcmV?d00001

diff --git a/tests/data/acpi/q35/ERST.acpierst b/tests/data/acpi/q35/ERST.acpierst
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..f24fadd345c798ee5c17cdb66e0e1703bd1b2f26 100644
GIT binary patch
literal 912
zcmaKpOAdlC6h#XZC=fn#CoF*_7>J28jW}>wF2KFG3zs9lTPTnl;U#=7r>E_sr(1u2
z21<FK_R^jEx_w-`TFO&O;T_LLF4O@x8LMi!H}5Z^t6_Tah{H!Y?i2S%JoA7!BFgz1
zf~;?N{b8^}H2K=viyuzh`L7M``U{CiG=Ib#4X^gc{m10T<lDURCp`CW$T#HMd{o-?
zH~aE`PznCu9;f*enm;9;GDrTme_0zSBR|7ODR;g(@qEM!N8Z_gL4HBL%^N<3mgJY@
R+q~0XMSexT%^U0Ee0~)`g#iEn

literal 0
HcmV?d00001

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 603db07..dfb8523 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,6 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/pc/DSDT.acpierst",
-"tests/data/acpi/pc/ERST.acpierst",
-"tests/data/acpi/q35/DSDT.acpierst",
-"tests/data/acpi/q35/ERST.acpierst",
-"tests/data/acpi/microvm/ERST.pcie",
-- 
1.8.3.1


