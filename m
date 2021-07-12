Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E863C674B
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 02:01:23 +0200 (CEST)
Received: from localhost ([::1]:56598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m35rW-0006yx-FV
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 20:01:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1m35or-0004IB-8m
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 19:58:37 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:21408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1m35om-0002zJ-U5
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 19:58:36 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16CNlFF0026160; Mon, 12 Jul 2021 23:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2020-01-29; bh=ublohvYmiNs2RubS5Bw8lmoG8AeafozCf6949AIEaEM=;
 b=CAiDHF2f7h06xhkjpJZLowOtnpALudEQQnAEnCrs5Ang5rmd/mUDyBITNmACfe13G5as
 Ttyr/6MMaZityFj/FQEtCBg9+mErfxBn8M81k9EWI+iE1g0w16B++24ROqoog/l9Y2vG
 ABAqn9dJHz5vreyZl0XjA3bp381oA0x0BI/y4ukezu5uJWoBi4D1ihFuuNyFXJEZxagU
 uAq5ZC7ZSGXk3/GCrtCMMJChkdLAnBKpZW5SE4IlcyjfiQwTynX/y/Aal23xvQULvnbg
 dOjyhq2WOBnQSf4cm0316YVBX4wSjBw80mvBXqM3GscsjnsExyCxqQRssXj6WVvKQl8S eA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39rpxr968c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 23:58:28 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16CNosEe167701;
 Mon, 12 Jul 2021 23:58:27 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
 by userp3020.oracle.com with ESMTP id 39qnavtx6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 23:58:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kDCSx83YpD/YJ3HhAGV7JyKcXI3uGnbfCqA2A2kBjAtZ125RbL9wxWgSCfmg4FPz08cctBKGHixEszJ185SFsgvwwH1smHxt4tYxvXmB7i1hceji/NS8oJASoA6+5dGdrGTK4rI09lMA1AWpT8guZmhA3a6Fr3ZbW158EH6f39SFM0/h2Nx4dQDy5cqlk8pWzTNPDcF2ou1/OJ82Y3OM5JKu2/8B2L+739ttUtDVqGnWKA0dn52HV19NbPpqiBCAD/TmGlj3v+RSDSiyLpDa7F7IeG/sz9ER3YXvtypFKScgFO+PPTRvGFaJZCydMGPbYbSUGChKA1UTnKfX2HNNOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ublohvYmiNs2RubS5Bw8lmoG8AeafozCf6949AIEaEM=;
 b=VkBEmrlzIdYWlTjIexNQpwdkmanrspKu+xaJ+C4DWKFsiQiRf+4WPYDW7QB5Z4ixkxTDnNTXATVZnnlgOPYDyCfbtI9xzLL39DVIbYhe6ht9cXo8DosJnRRAzoq5dYwQI9ZQ7EYsSEXNzLbJJdmoq/oxPw8cqJ9IZMCF7cNP9hZmicgsEN2kPAxOtHEfDE7TxT2levH8PPu/dH6RFfYxBgQs4sP937klxpQvDxl07sJuwpSrDMAQb8RWTFUjGpkSfzNjCaliag9Ugnme0th4+ZRdHI9S+tczFhOWffQ+y98guJF2lwKKCV3Bq0w3bwvYSOnJxTwoZNY04CmZpT4E9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ublohvYmiNs2RubS5Bw8lmoG8AeafozCf6949AIEaEM=;
 b=tBC4pSuCeE1xmUB8nMZxLgrglGiB+Nhaz46RiD19PVk0OuFynpxOxel2Tng+KupJL2u6jT1zpEO6ScREvaTRZdEDcVsz7n4NrtlEMB+S8AZAqTldYWwc4DFpzMqXq+u13+fFzMigYqyWwWGKYoUT0rsM+CSTf0KR9ZwuHAlteig=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BYAPR10MB2598.namprd10.prod.outlook.com (2603:10b6:a02:b1::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.26; Mon, 12 Jul
 2021 23:58:25 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::18a:7c1f:bf20:ba6c]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::18a:7c1f:bf20:ba6c%3]) with mapi id 15.20.4308.027; Mon, 12 Jul 2021
 23:58:24 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND v2 0/3] To add HMP interface to dump PCI MSI-X table/PBA
Date: Mon, 12 Jul 2021 16:58:09 -0700
Message-Id: <20210712235812.19725-1-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0019.namprd11.prod.outlook.com
 (2603:10b6:806:d3::24) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (138.3.200.16) by
 SA0PR11CA0019.namprd11.prod.outlook.com (2603:10b6:806:d3::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Mon, 12 Jul 2021 23:58:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08e3d289-5310-4a30-34d0-08d94590efa1
X-MS-TrafficTypeDiagnostic: BYAPR10MB2598:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB259811021AF8CB2250FB35DAF0159@BYAPR10MB2598.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 93x9UyOMowpVZtgnlm4JaBM3qBEMDZtjW0x45i4laTcmOmQdDRlXu3oI6RX1+K8sXxLoO9QkHXBVuFJA1uthsg9jG3VFsIuG71ZdeImyT5TvgpqVhZuTSXsFxhxyFViNuoXe9fTUc4p0ThrAY5N6/1G7WWiBmINM40PefoTy3flFebybii0TNX8fw5MjmHiDsKfgG784t7jKOJn2c1XpaGZo/ow8d9khcJvazgKkQMAIkPYpRPsfuDvkEz1XUvgU5xCEcUxEBBInBIXg0jUQ3cVANOOzKNe313pHVC6XtxulPTzQmBkdzFrQx6HN1LSnD1KbTtxjuvSE5pezcKMaY5saHbw9eV7J3bkuXcA2XzzKcltOt2KW2WUWvbKGf8pbfflO3xrmhobJPL7fcxfylYckmfQz//pIDUVLqchoNIIpyjpPtUJBOLnidpYRq2zRCYmLArz3txEm/5wGPyBiYPDcXt6GutWEKx8a+B7gj9UHt+GqOQQx3DrS2le1fg+0IM8clOACxkzKsCDmc8FjR1kG3iAI3f1/dGBlPromVOtwihe5BTQvtxG1jyJRdB9m+tlvwKUA1S63s91A8lhBw14mWKGydq9WNHx7MDJkuAWCVr3iu9+WkC3wt726HXXs7flbcihN5djrncWKAW4SB7V9fsb4n6cwF1RZMl0m75KV/v2hGwwBPvJPgJMau+dj5OizPvnDKxPtcr17uUEPowSEn6fit4nV41b3mq/CmTcoNSij5pPP+jCKtr9IkmpS1H5niHDoyS4LW1wrC+nRlokHaNGj/UGeSx78ONhAR6F9ZZmLEeHgCCz1+FZ/uOC7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(136003)(376002)(396003)(366004)(5660300002)(6666004)(86362001)(38350700002)(38100700002)(52116002)(6506007)(66476007)(44832011)(66556008)(66946007)(6486002)(36756003)(956004)(2906002)(2616005)(966005)(8676002)(107886003)(186003)(6512007)(6916009)(4326008)(1076003)(478600001)(8936002)(316002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qZnJWZr5jv+mVqqY8BD6NT8HEMDIUSCcjxtSC9K91o+5eGxoxPcifG2Y5bf1?=
 =?us-ascii?Q?+mZ++3S6wAvBvnzv+zkca+QMcHvLMSDVkGMxGeewmhKPSVwRDVRrKqP+HDa0?=
 =?us-ascii?Q?+0GHMuDKU41jHTOqDH5xn7eSD43JGXVNwfH7NvE10e/FzpfOFti6aDGyC98u?=
 =?us-ascii?Q?6ycD2F6DrvpMcQut4+iSXvPMjkR0BL8Y/nXk4usuDw+9qekM9xOebHY7hS4y?=
 =?us-ascii?Q?/lzRJP2eXLfqT7PCg24BQoE+BSmxzcRT/Uv/44bHcuAw8jpT0yeim9JxPezV?=
 =?us-ascii?Q?8UJ21tot/f01C1nIKvoEhkrLaAfH0k3R/oXTlP3MtR5Y70ivz9RbRUGeY0zG?=
 =?us-ascii?Q?h/kmlSpg031EuXxDaS2vI5LcG6K7OxpIbqP0VJsjZiZK8FpnFnkMJBPiKh/s?=
 =?us-ascii?Q?0aswMi9ByJykBX0UwzTYRFx0pnJy4ur4poR8Nv86IMV/nQPwhTswNIlwD2tj?=
 =?us-ascii?Q?H7pD6TGgytHqpsUGLbwhlte4EQFD7L+tNJ6kYZbSMgL6EnpWCfNjRkvV6lIV?=
 =?us-ascii?Q?s+F8wk8bTyuENfd0+A46OLc0p61bX3wHuGBcvNM1VrD3s0TDBDf+0Uc/7Poi?=
 =?us-ascii?Q?r00xH+ZNzNYGd7CpcU4GzMWEUub49da5Q+BrlvQWU+8zyENX/qvvh9WVlR5G?=
 =?us-ascii?Q?OwdKWeM146ifeReA7tnY6AdNh3OYxxYcZMh8jjTG6Bp9Tj3t4wnf/njBVac3?=
 =?us-ascii?Q?nGEWhVUGLDglIuZOopUsExe8A0f7Pb8iDcLdCYKR/MgalXThCXmI1Lp9LyAc?=
 =?us-ascii?Q?Z/Y2uUCgSs052EFcKc3A7k1/tSQNdEQcTW7olW/wY6JKHLFFhWG9VxFpmfBg?=
 =?us-ascii?Q?HCEBSlMnJMsHE38Lg0iOJV8a/U4iS2XVdg57NsfoMVvuDdCERbyt8T5dbXJD?=
 =?us-ascii?Q?XKBV0jtDuzsP6T9rRdhTifzUbSWUBmXHiGDhNG3x0xCbUhGR0zYjRI8b9BCf?=
 =?us-ascii?Q?Vl0R9DxxGbjKWGRvaL2etiMmq6KqbiCiTe7FUIifnSsOX2Fw4yh2RDNA41ns?=
 =?us-ascii?Q?jAYuPDQaeot/WT3MA1Dn8rM4jVyQkcZl/Klcrsn8wviT3o+bglZsZuZrQH+K?=
 =?us-ascii?Q?5jVj0R0rOEXSmlG1qcnZoKTuH9kYp+fuaqh6q3GFn8rI1J7k+qzCgGVTvui0?=
 =?us-ascii?Q?N8hSs2vqCkeqeJNif73vsfvaEWYI9q1uMZsO3fp7vmdhjwX46awdjh11q0Zg?=
 =?us-ascii?Q?DNhRtrkGNBVLvjqP9/gvJKySGp6eswLZNUtVHhtSktP45KulmnUQ+emua0Wg?=
 =?us-ascii?Q?7duetSHuvYd0+Cnq4j6/lALCKu0x/7Dmg4NjHDuJujaaGhxmeW4+WzNRXAvl?=
 =?us-ascii?Q?6zebV4QAtmhE1qGXYBA2tzs6?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e3d289-5310-4a30-34d0-08d94590efa1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 23:58:24.9111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hd/0ka/krkQlG1s/7Y7Wkb+1azsdigKiAj0OnlUFiTnq2aHpRIO0R9DPUI22VR+H5IZnRbZYeQ+jIfReFpoBrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2598
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10043
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 mlxlogscore=843 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107120162
X-Proofpoint-GUID: FbVMs13aIxFK7383u8KEyCLijn1MoIHq
X-Proofpoint-ORIG-GUID: FbVMs13aIxFK7383u8KEyCLijn1MoIHq
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 jasowang@redhat.com, joe.jin@oracle.com, dgilbert@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I have just rebased the v2 patchset on top of most recent qemu to resend.

This patch is to introduce the new HMP command to dump the MSI-X table/PBA.

Here is the RFC v1:

https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg04673.html

The idea was inspired by below discussion:

https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg09020.html


(qemu) info msix -d /machine/peripheral/vscsi0
Msg L.Addr Msg U.Addr Msg Data   Vect Ctrl
0xfee00000 0x00000000 0x00004041 0x00000000
0xfee00000 0x00000000 0x00004051 0x00000000
0xfee00000 0x00000000 0x00004061 0x00000000
0xfee00000 0x00000000 0x00004071 0x00000000
0xfee01000 0x00000000 0x000040b1 0x00000000
0xfee02000 0x00000000 0x000040c1 0x00000000
0xfee03000 0x00000000 0x000040d1 0x00000000

MSI-X PBA
0 0 0 0 0 0 0

virtio pci vector info:
config: 0
queue 0: 1
queue 1: 2
queue 2: 3
queue 3: 4
queue 4: 5
queue 5: 6


Changed since RFC v1:
  - Add heading to MSI-X table (suggested by David Alan Gilbert)
  - Add device specific interface, e.g., to dump virtio-pci queue-to-vector
    mapping (Suggested By Jason)


 hmp-commands-info.hx       | 14 +++++++++
 hw/pci/msix.c              | 63 +++++++++++++++++++++++++++++++++++++++++
 hw/virtio/virtio-pci.c     | 22 ++++++++++++++
 hw/virtio/virtio.c         | 10 +++++++
 include/hw/pci/msix.h      |  2 ++
 include/hw/pci/pci.h       |  3 ++
 include/hw/virtio/virtio.h |  2 ++
 include/monitor/hmp.h      |  1 +
 softmmu/qdev-monitor.c     | 36 +++++++++++++++++++++++
 9 files changed, 153 insertions(+)

Thank you very much!

Dongli Zhang



