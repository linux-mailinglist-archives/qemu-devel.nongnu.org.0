Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E3A33A1F1
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 00:36:04 +0100 (CET)
Received: from localhost ([::1]:52216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLDng-0004BQ-04
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 18:36:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLDm2-0003Zs-IO
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 18:34:22 -0500
Received: from mail-dm6nam10on2117.outbound.protection.outlook.com
 ([40.107.93.117]:49377 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLDlz-0008VN-Qu
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 18:34:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hc+UelNgKKLgZ0NXMKWEwIhk9b+6Yg55IXMhM81RFel/Gyi8LjnHXw7dMo7L1Wy0G73i/0KTbcECkfnICbyjKjjy17B+/KZDTLXkpEyd7evMSCyeUvxMfPN5VhLiOMHqw1I/+/LFq3n0XEk2f8YZU8ISPlMjdmcQsk0yFCBLnVUQX42NRcnIEuWXkFM7/NYqaC7flimTlqHrhxxw9wHqfkE6QQkp3ZJ9vv9+xVGpS6Qjt8Ukkz1TsMCgkv5gatyc3/bho9GffRYW6sXeC4T0qj2m4468LxjE7ldkFEW8baj/Pd3MZ7/KPStRGY9kF8Kn1UWgAcBEnabZwRHjrI0Kmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JbsBPlsiC0TFGV2ZHPwilEaXlzzoxnvo4NE5LgtYAc=;
 b=M38BEiHDgwbIuAiCHx16U3grYUk8ZBHQh7EShL4itoXB1Bvg7TuhSydVh7Yyk1Jc71+t+Qm2lRQJsvx/qY/2ZD9MMppgpZ73m3kh10qLu7BhiXKeOkW6Rl3A0taJW+r9d837amN/zbwImZkifi0+Hh2yzEqUxkyGnFNM5OAiH5KTLEjaSJd+Kh40tdHSYVoP5LZEzLP5UWcgi89VRSIbEmN4j3SlXa1p68O1UG5RmEqsIAXZeVe4mHerIrEaR6vSshq+CShXisZ2QR3HXQtARLwABGKBkaJo1dfUBVGOHidaQiEVAoMQqoDSi+UGWTlXAeDP3lxrzh4DeYhNNf6uuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JbsBPlsiC0TFGV2ZHPwilEaXlzzoxnvo4NE5LgtYAc=;
 b=vdsAad1oPnAGgWi0xVudJ5O/1OkG3ThSNQUxur/WUNnVktubNF7mEFr+XuG3oJn2OtowtWKibfYiOJ/axFWGSWLy1NW3BnxyhsgbOMdWV9X6GgX09xslfhZcNdMyqAmO44bNiOvwjRz6gU8KZfTMciV6f6nx2kbn6KA+w3PQd8U=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4446.namprd03.prod.outlook.com (2603:10b6:805:f6::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Sat, 13 Mar
 2021 23:19:12 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6%6]) with mapi id 15.20.3912.031; Sat, 13 Mar 2021
 23:19:11 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] fuzz: Add a sparse-memory device to accelerate fuzzing
Date: Sat, 13 Mar 2021 18:18:56 -0500
Message-Id: <20210313231859.941263-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR10CA0020.namprd10.prod.outlook.com
 (2603:10b6:208:120::33) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR10CA0020.namprd10.prod.outlook.com (2603:10b6:208:120::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend
 Transport; Sat, 13 Mar 2021 23:19:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3726ff4b-bc77-494e-c7a8-08d8e67668cb
X-MS-TrafficTypeDiagnostic: SN6PR03MB4446:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB4446857E8AC24FDF5FE3DA3FBA6E9@SN6PR03MB4446.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 62DtET1ac/5YHkpyFJcVN8lUVhymjQ6NcRjWnHTvFQhSBMP6mvpQexiEvUFgN5bOCbdfCzHzY1fr7WZSRDTx26lRqfCM2NzHk5XrI5BCaNelGxeqldiqWvFK8Te8WeZE2G11NDAEa39yMOL32l10TZRK2/ln1pXezS9mxzURjlFidmdAfXqbPWGDSaM5n1kE7nnmD4iUasQZ9V3JIcvHPuiEnbKbUIryYja9qSi2E2nd7D63XNJJP4XJT+XWKnZzvY2x73XQEkcVdEPsnKrH5KkFPtdlaOb73ipBGIlaOKdEJyWwVIZjKx/Gxavp+YeVT4hsJAA5/AIsqokNEJuQiT4cIRVO+gOqm6JNl/JwIbqD52VRtrv3US/oxo1lMUwRLkI52w917fPnr19ZhXyiJFomLarZHnJhrXRf2Q67G1VArKqHJL+nfszsPpmlFFNBm1ca9b5sqmnuUmNvhCu0ClvSikl9WJnTvJEZTsJ4TKvvQn9WAgGIngHDMSsgAuEY++5vaIIWeo3kL/4t0hKqoXODPT2PSWmX/R/jw9aUlMmDoOZz0hBvsqstKg9K9FWV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(39860400002)(366004)(346002)(478600001)(2616005)(86362001)(8676002)(6916009)(6506007)(956004)(36756003)(786003)(6486002)(316002)(2906002)(6666004)(4326008)(186003)(52116002)(6512007)(26005)(16526019)(8936002)(66556008)(66946007)(5660300002)(66476007)(83380400001)(1076003)(75432002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Ya7uNbOedCLr6Oo79GmRcQw1ByFUBwz03q0Ppe0b3jJ1Liva2CJPuyPitXHb?=
 =?us-ascii?Q?OD0U/vA3uL/iUfPOf+Q3d84CgTTySlAkYvZ67oamxfB/6QVOMIp5roToKubM?=
 =?us-ascii?Q?Hi/to+IKMxgb1MnsZNZChMZ8VNmsIE9eFRvui2Z/yKPZrMnaMdLA4g4uYrpu?=
 =?us-ascii?Q?Iyc/Ay/KEhZmB93fZWcey7uVXwLRYuuML10GeSX5T+1b8eGoWtk20E3vr45j?=
 =?us-ascii?Q?r7dvd84aN29z/geHP5OXaDpgIzA5isC04BT9kojW5gMoBdNe74M0/Y8J/0Ku?=
 =?us-ascii?Q?DLA+CWXxR5/PsUIymxE57IvKR8L0kvvX2rw5Yge5nWFvPUrQlBNQIRWysh8v?=
 =?us-ascii?Q?8Kuj2f7m4AWYMczZpSX/TR+Lpgarswc1QwZrdLmDnVg8yUeVcfw78Yrf8Med?=
 =?us-ascii?Q?TIfJDCcO6AnXBo84XJWT9BWWAmDgwAZVdiW5+KLRDRXyZbWbzFskWQA8yB+p?=
 =?us-ascii?Q?eRZVCh5NkzViZeJ2NCqAqxf0nmDJiIn2FomjQkLx8xX8m50G8nOH2gP+OSsE?=
 =?us-ascii?Q?+Dz9+AnZOdt5tjWJWlJPbfE0+gIEzT/P+dtLQ7NwPWUaKT0TduQp2980tV8G?=
 =?us-ascii?Q?K0Kjp5fWdK8tUuhVmphBsaoNrc0nGuxVv+WqWIKyfj1mg6NOfQpE9WXkSHfN?=
 =?us-ascii?Q?xvgZO+bRTe3wBITRZlQ5389TaA7pkb8f2W/NUrSoePRBonVX5LPzr5Izabsm?=
 =?us-ascii?Q?q3fWB+8HZFFV0lE/jLD/wIriHlJyElIHNo/dralVrNfFy+LxVxaUgJ5qY9TT?=
 =?us-ascii?Q?UeZZdMHDdVOAEdrR6zBlDrsIdnNrmvFxbJNkhyozR0vokhTrOyz7o0P6i00q?=
 =?us-ascii?Q?TyDsmVCb8NqxLTLIafdwen9Bu1uc21mbGl0BvkIGaIynOFxEAs1732r3NIV9?=
 =?us-ascii?Q?pTAnpXF6EWt28V3GamwjKvs7q7xuR4bVmRrAEsV3eclmv90V8hFvohuWNAZT?=
 =?us-ascii?Q?pHamvKCj3Xs6loYQJQaSP/dAV+s2mTmA89VMQ//HMtBBkH5dpopIVKxxpsSR?=
 =?us-ascii?Q?97j2YKl1L8L1ETVgDmDkn1PWJJsNJ2OViwnd/XLZS3rVueUWKbx05w+C2Ccu?=
 =?us-ascii?Q?xmRwdLmqXURB8jDXaIb1kDxGaRyXAg8XLUAaeJEFKpPQcReDpO1dR3ckp3vf?=
 =?us-ascii?Q?USe9WJeOJVg3S1YCg8M0fwiKH8b5zk00KvauncCb6LF2xEnl3dMDW36wAViW?=
 =?us-ascii?Q?Noxo2kAwRsA0WGs7axJ49Fz3BYYLkLD5S8rHHxKcQzaO7Xinxat2PuRjYgF1?=
 =?us-ascii?Q?GI4VRdkkCLZj/Qim8OCBix0qo3XupRUgaRHB7UfvK3ZbpMa1uOEuFHKbAY/A?=
 =?us-ascii?Q?BigO26cNkxKu8WCej8MJXTeZ?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 3726ff4b-bc77-494e-c7a8-08d8e67668cb
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2021 23:19:11.4469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xgULnazFDVPXd/N5nvpx7aWVMEjFb2MRdgYh55JJkCVXecWsJ3TCo0n5O9/b2PDV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4446
Received-SPF: pass client-ip=40.107.93.117; envelope-from=alxndr@bu.edu;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: darren.kenny@oracle.com, f4bug@amsat.org, Alexander Bulekov <alxndr@bu.edu>,
 bsd@redhat.com, stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2:
    - Make the device a TYPE_SYS_BUS_DEVICE device
    - Remove the qtest (the device cannot be enabled for testing outside
      of the fuzzing code).
    - Since this will only be used for short-lived fuzzing processes, do
      not keep track of empty regions.
    - Move some DMA callbacks to properly fill DMA buffers in sparse
      memory

The generic-fuzzer often provides virtual-devices with bogus DMA
addresses (e.g. 0x4141414141414141). The probability that these fuzzed
addresses actually land within RAM is quite small. The fuzzer eventually
finds valid addresses, however, this takes some time, and this problem is
compounded when the device accesses multiple DMA regions. This series
adds a "sparse" memory device, and configures it for the generic-fuzzer.
This allows us to simulate 16 EB ram (only a tiny portion actually
populated). Thus, almost any randomly generated 64-bit address will land
in memory that the fuzzer can populate with data.

Alexander Bulekov (3):
  memory: add a sparse memory device for fuzzing
  fuzz: configure a sparse-mem device, by default
  fuzz: move some DMA hooks

 MAINTAINERS                     |   1 +
 hw/mem/meson.build              |   1 +
 hw/mem/sparse-mem.c             | 152 ++++++++++++++++++++++++++++++++
 include/hw/mem/sparse-mem.h     |  19 ++++
 softmmu/memory.c                |   1 -
 softmmu/physmem.c               |   2 +-
 tests/qtest/fuzz/generic_fuzz.c |  14 ++-
 7 files changed, 185 insertions(+), 5 deletions(-)
 create mode 100644 hw/mem/sparse-mem.c
 create mode 100644 include/hw/mem/sparse-mem.h

-- 
2.28.0


