Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADAB387EE1
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 19:47:16 +0200 (CEST)
Received: from localhost ([::1]:33078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj3oJ-0006Yy-8G
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 13:47:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lj3ig-0001Cd-Mj
 for qemu-devel@nongnu.org; Tue, 18 May 2021 13:41:26 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:27004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lj3ib-0000Aj-Ia
 for qemu-devel@nongnu.org; Tue, 18 May 2021 13:41:26 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14IHbG9t027888; Tue, 18 May 2021 17:41:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=8QzQ83OTB1QxZvrDhng5bM912/+XZXsq8LfgKe/hi/o=;
 b=q6ilYoXKz3A9QJqcxnB3ZhrMDMRt76t5GwBrRxeGgirD746+NLhvoIdk6HmZf7qVBRMZ
 WW5ZLgnFPsIdkdTBFE4VxdjSUn8LC7EbAYuxpVAXP0Y7+LOU3PaWYaGUgdRV9YpI9/Wh
 /AyQmzZA8V72yobuM7T/kPNzm3cVzP22r6bq3y/OrO9QPnUPzbHgSNrGOV9FiZcuCTf8
 kazO7J1i2mY6Sefv00KgJ1HGKNv9WEcaIpVEb3N4yVI4Vywf0aTvxVkVE1N79MIF+62e
 XGSSfeScFzWkznvo4PsknvSv0qHXlOVeuWRNBY1AOIYASznFFLprCw5ZV5jvOpJPoAnh jg== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 38kh0h8rrw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 May 2021 17:41:15 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14IHfD5t175976;
 Tue, 18 May 2021 17:41:14 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2040.outbound.protection.outlook.com [104.47.51.40])
 by userp3030.oracle.com with ESMTP id 38megjpmfn-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 May 2021 17:41:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D13p7yg+UuVdONi3r41YojWZpxnxuCvtsdMbCme7vlb1mqT4u12yHDRjtzN8k4eZMb7nMmB/sOg14+QLm/rS0oXDHD0NlhTS8yHXkBieCH68VWlYE0CZ7iPCR/9vpGfeUiq7GB8cuFEIz8tAlOI+BcRC7bv8tldXeXA8gkc3Xd8uhvPuarBj/Npb+ZS3akxB4xlXBVwVOIMwG88X0t233VqP9nZOMEj9z5c2i250FGrq0EHqhzmO0Ktfy2tkEJeRt4ne+R98i2viab1JrmM/fc3egAyO75N++28sspfd8v9YVTEuYSrVZ8VOmurhCv6x2eb+QgN+3fdLVujTYTtNZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8QzQ83OTB1QxZvrDhng5bM912/+XZXsq8LfgKe/hi/o=;
 b=m1BoMpnXG9KfRxvW0+sMXRP9Biww1OHFYzzZzO/9/0ObsDb0VBAFWpanpdMcRlONPQWK3pi4YHmEwyxqyB7cWi4s3wWhe3D6CWG/6URMWT/6pBb/Q8MKdzfcUvSo9mOXzv4f3xJh2kDwdJzaMAldsLPhFbGZdcNdO26/PmJg7zVyJ7m6HqDc8FYBeeLldWjHaTHjB6tkH7KnYZfRO6+yPR0YzLkM+MvZD5iA/IRvIgnKe39Et1KcwSN+wtHyrUs3Fb3YBjQ7qJK72754LgBa5tlgAZ52ahpWnGCC/ZJn20mEd6INvTshdgDdUI00P4eCv8yaSBBGXy8jlopGYmEwqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8QzQ83OTB1QxZvrDhng5bM912/+XZXsq8LfgKe/hi/o=;
 b=rwNSq1R3w1eK1Lag1F2gowi+viePiu2+TwomXzLAjgrS0Y3Rw1PVgorJkRoBBvQC4mS60V2VmeX5f90WqHem5bpcjcUrQLlyZPJ74ZIfBk6RcQRK5HUMK7TbrpbajWy3olnV5kyB7gj6Fob8h1dCbszXBZKu67S/h6R3GF4uNsQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by BY5PR10MB3812.namprd10.prod.outlook.com (2603:10b6:a03:1f7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 17:41:12 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::18a:7c1f:bf20:ba6c]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::18a:7c1f:bf20:ba6c%3]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 17:41:11 +0000
From: Dongli Zhang <dongli.zhang@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] msix/hmp: add hmp interface to dump MSI-X info
Date: Tue, 18 May 2021 10:41:28 -0700
Message-Id: <20210518174130.9381-2-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210518174130.9381-1-dongli.zhang@oracle.com>
References: <20210518174130.9381-1-dongli.zhang@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.200.16]
X-ClientProxiedBy: BYAPR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:a03:74::23) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (138.3.200.16) by
 BYAPR05CA0046.namprd05.prod.outlook.com (2603:10b6:a03:74::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.11 via Frontend Transport; Tue, 18 May 2021 17:41:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7bf1f7eb-1f7a-40a9-358a-08d91a242063
X-MS-TrafficTypeDiagnostic: BY5PR10MB3812:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB3812092D0EA9D271FC4A206AF02C9@BY5PR10MB3812.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:345;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DRGzadgOzKPGLWH5wYwD/MekxZat5xUbVPBmKLTpsgciUgTaZ5773w6uK+ru/Q0/9rhuAiuXBxzvpxL+nQ6RKvuYPJuQ9sWgyzGCRxZkYb3vyNs8nDerrpxLksEycBLeCZSmLmhKCjpAm6MV4fSh8V8zOweQ+2fffYpAeDoqy87YS5eKRjSN7oBDOtN5gi7TE/Ud/d2JocXzS1aHCdde/uNpkHREHQwuf1Ve509+0aR++jz1WpqiSOgEDVuSfZ2eeOq90yoB35bkXP9mIpa/eElozg0m7r9Ukv/C020941ixKXVPKdbRpvKA6YKbKviivKxVFcXzOnJntI/HLJfge+Q473t2KQBiXCD2wyp2n/mL1B0muKEatNET5Lx5aOYJb/a3HVfYQetSs/mkC/V0I3j6Yi9UavcQsyGfItT7gV8MUdEOC5g516GskdQFJT4J+J65Lh1Vs5VEw97NBfHsq7bOSNmWvrgRHrRBNbF54iArGglkxJA9RXtgt5irC4BsUTgtInavQEYsnM1AsQMnlolZmvs4aQPRwEkb7B/Bx0EGCoRaGfPnp78Mem3x6cBXRLiyX46c9SgJCPKe9tzvvXGXUtRx/r8bosto6pHGyrSzq5dN0WAW7GIDrvfE0XbyLvnxgLvl2VCn0TVgfuPmSfDRls58EZ25KmpjacdMnzqQWkjqqNvpQR7DtsiT3eFZptomDIEqh4GjlLqf9jYW1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(376002)(396003)(39860400002)(136003)(8676002)(5660300002)(6916009)(6512007)(186003)(38350700002)(16526019)(38100700002)(86362001)(6666004)(4326008)(6486002)(6506007)(2906002)(1076003)(107886003)(26005)(66476007)(478600001)(8936002)(52116002)(66946007)(44832011)(36756003)(66556008)(83380400001)(956004)(2616005)(316002)(69590400013)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?dJfbAovq1TfqTNa4ZrYuxtppbHAOSbpvvQ/xv46V236lieSZyoETQZyAJh6j?=
 =?us-ascii?Q?a1v+Vd5QNCneFs9mN7NYEQNNMoMvFFJ2VSIUde66KalwgvUR8p+JDeQluSim?=
 =?us-ascii?Q?PIt16rfLAuW8hZv6Hh7cMkbAvoyaHe10wvnvOduT/NmCnKisXbas/4uap8Dq?=
 =?us-ascii?Q?pu6qRVubI5vcM4OVDzCztReJEKQHfIRpeWIsvfDmj31Tr02eABAQ+phcPXy+?=
 =?us-ascii?Q?niIBB96CHiDDTUNPwDK5oh/3a1pyYgMh5JJMR/TcxIT61pdVznZ9Snmos/e6?=
 =?us-ascii?Q?T67bg3je5xLmkbkloIFKiJxJ9NWsV+pWH+paf50L+QOOrJfPMdpxmVjWhrXl?=
 =?us-ascii?Q?+dIBehPCLqNdPxkcqni4LH18Dy/yj93ME64a14cluU29DQFjo7SuUbZgmF/j?=
 =?us-ascii?Q?2iIjSB3rfP3eKiC53Un+FY0tQiPUZPLJG88ZpDZT/J0qPWusdCPHcnbahN1J?=
 =?us-ascii?Q?+PDZ4pkBhSEmmvXFPP0MaWXSqFd210n6T9YOFQUSkNYvim+Ufe1m/25aE+4A?=
 =?us-ascii?Q?rk0QnX7p6JGUvk4fvlkMo+pdXOLYrrLWQ23B9b9G/V4aleFZf3O9+g+rGUW6?=
 =?us-ascii?Q?8aVMg8rHEexWVftC/01ZvBHv+m/84f6XseMO08kzyhG742M5/t1+8B3Box6+?=
 =?us-ascii?Q?H3cgDjwo7I/36dKJjZWITxNuvhlK3MfnXsFkeTQcz3tYGTN+xGUGm/Ph8NKm?=
 =?us-ascii?Q?8DRjJzl+Gy7Ig0sNbUwKsOMG0/vRpOL/JjRJuVljJp825WpmSa0yyaauoyJm?=
 =?us-ascii?Q?4i0vhwDfJg96YuVhfzpdcwKT4Y52ECsTP/MKv0g4EG1r8P8pGl0R5Q1DUu0M?=
 =?us-ascii?Q?gtOMia7IDQviQUPGuAR54e9PJzx7eTawumM+IdPIyL6LL/q5Bf0VoGUP19YE?=
 =?us-ascii?Q?rA9gVtnMXtq/8Hf5QO03cBmGMpaDdu61sJmnb7uPzQVPx6WOqQFiOoUJXi4o?=
 =?us-ascii?Q?a49P7oJlqWkZuTuY5mJ569cAPOIjp+nTzNLdaj5a7uZyL6eoPUXCzMli9FZo?=
 =?us-ascii?Q?xt6Ihp+MXZNBUnsrRkON02swrdGKB4LqATt8HpbORX+iSlcDBMxSK/A4QH7P?=
 =?us-ascii?Q?0oh3jIyQuQ6xra+hhz02Mt0uH9u3jJFxYBnFhD1fdGYtPN3phC4fx4EO68zs?=
 =?us-ascii?Q?nTlfSDMZ0L9jJh6TWseyHRap7q2KHHgKM9zGzYxStdp5yeNXFWihaoCMjgQF?=
 =?us-ascii?Q?25kOLBpwPCB+bYLaW2PzFH0Vytio7IjJ1xWjTioTUcNNZNbcjcU+6N0kON+n?=
 =?us-ascii?Q?Akzmtw9SFcabqMPStI+b09Td8Bowhy8z/7Mrzh2S6SFxe4NZ5NaMUceY8Win?=
 =?us-ascii?Q?NbEItI90gU8Lj2KiF1Hz7ZrO?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bf1f7eb-1f7a-40a9-358a-08d91a242063
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 17:41:11.8071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D2QvKkc/ZOZC80XkY4ZfMb+GCb0Dp6aO4YmMEDLjvNMaAMuv/APPz35zmrZskyfCP5MtsHx1L9DmqUzEzhCcvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3812
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9988
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=639
 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105180122
X-Proofpoint-GUID: JXXDKjMgt0PxQiVXKLVBCMZw9DlHHwZx
X-Proofpoint-ORIG-GUID: JXXDKjMgt0PxQiVXKLVBCMZw9DlHHwZx
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=dongli.zhang@oracle.com; helo=mx0b-00069f02.pphosted.com
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

This patch is to add the HMP interface to dump MSI-X table and PBA, in
order to help diagnose the loss of IRQ issue in VM (e.g., if an MSI-X
vector is erroneously masked permanently). Here is the example with
vhost-scsi:

(qemu) info msix /machine/peripheral/vscsi0
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

Since the number of MSI-X entries is not determined and might be very
large, it is sometimes inappropriate to dump via QMP.

Therefore, this patch dumps MSI-X information only via HMP, which is
similar to the implementation of hmp_info_mem().

Cc: Jason Wang <jasowang@redhat.com>
Cc: Joe Jin <joe.jin@oracle.com>
Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
Changed since v1:
  - Add heading to MSI-X table (suggested by David Alan Gilbert)
  - Not sure if it is fine to use Acked-by from David and there is
    very few change

 hmp-commands-info.hx   | 13 +++++++++
 hw/pci/msix.c          | 63 ++++++++++++++++++++++++++++++++++++++++++
 include/hw/pci/msix.h  |  2 ++
 include/monitor/hmp.h  |  1 +
 softmmu/qdev-monitor.c | 25 +++++++++++++++++
 5 files changed, 104 insertions(+)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index ab0c7aa5ee..cbd056442b 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -221,6 +221,19 @@ SRST
     Show PCI information.
 ERST
 
+    {
+        .name       = "msix",
+        .args_type  = "dev:s",
+        .params     = "dev",
+        .help       = "dump MSI-X information",
+        .cmd        = hmp_info_msix,
+    },
+
+SRST
+  ``info msix`` *dev*
+    Dump MSI-X information for device *dev*.
+ERST
+
 #if defined(TARGET_I386) || defined(TARGET_SH4) || defined(TARGET_SPARC) || \
     defined(TARGET_PPC) || defined(TARGET_XTENSA) || defined(TARGET_M68K)
     {
diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index ae9331cd0b..4b4ec87eee 100644
--- a/hw/pci/msix.c
+++ b/hw/pci/msix.c
@@ -22,6 +22,7 @@
 #include "sysemu/xen.h"
 #include "migration/qemu-file-types.h"
 #include "migration/vmstate.h"
+#include "monitor/monitor.h"
 #include "qemu/range.h"
 #include "qapi/error.h"
 #include "trace.h"
@@ -669,3 +670,65 @@ const VMStateDescription vmstate_msix = {
         VMSTATE_END_OF_LIST()
     }
 };
+
+static void msix_dump_table(Monitor *mon, PCIDevice *dev)
+{
+    int vector;
+    uint32_t val;
+    uint8_t *table_entry;
+
+    monitor_printf(mon, "Msg L.Addr ");
+    monitor_printf(mon, "Msg U.Addr ");
+    monitor_printf(mon, "Msg Data   ");
+    monitor_printf(mon, "Vect Ctrl\n");
+
+    for (vector = 0; vector < dev->msix_entries_nr; vector++) {
+        table_entry = dev->msix_table + vector * PCI_MSIX_ENTRY_SIZE;
+
+        val = pci_get_long(table_entry + PCI_MSIX_ENTRY_LOWER_ADDR);
+        monitor_printf(mon, "0x%08x ", val);
+
+        val = pci_get_long(table_entry + PCI_MSIX_ENTRY_UPPER_ADDR);
+        monitor_printf(mon, "0x%08x ", val);
+
+        val = pci_get_long(table_entry + PCI_MSIX_ENTRY_DATA);
+        monitor_printf(mon, "0x%08x ", val);
+
+        val = pci_get_long(table_entry + PCI_MSIX_ENTRY_VECTOR_CTRL);
+        monitor_printf(mon, "0x%08x\n", val);
+    }
+
+    monitor_printf(mon, "\n");
+}
+
+static void msix_dump_pba(Monitor *mon, PCIDevice *dev)
+{
+    int vector;
+
+    monitor_printf(mon, "MSI-X PBA\n");
+
+    for (vector = 0; vector < dev->msix_entries_nr; vector++) {
+        monitor_printf(mon, "%d ", !!msix_is_pending(dev, vector));
+
+        if (vector % 16 == 15) {
+            monitor_printf(mon, "\n");
+        }
+    }
+
+    if (vector % 16 != 15) {
+        monitor_printf(mon, "\n");
+    }
+
+    monitor_printf(mon, "\n");
+}
+
+void msix_dump_info(Monitor *mon, PCIDevice *dev, Error **errp)
+{
+    if (!msix_present(dev)) {
+        error_setg(errp, "MSI-X not available");
+        return;
+    }
+
+    msix_dump_table(mon, dev);
+    msix_dump_pba(mon, dev);
+}
diff --git a/include/hw/pci/msix.h b/include/hw/pci/msix.h
index 4c4a60c739..10a4500295 100644
--- a/include/hw/pci/msix.h
+++ b/include/hw/pci/msix.h
@@ -47,6 +47,8 @@ int msix_set_vector_notifiers(PCIDevice *dev,
                               MSIVectorPollNotifier poll_notifier);
 void msix_unset_vector_notifiers(PCIDevice *dev);
 
+void msix_dump_info(Monitor *mon, PCIDevice *dev, Error **errp);
+
 extern const VMStateDescription vmstate_msix;
 
 #define VMSTATE_MSIX_TEST(_field, _state, _test) {                   \
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 605d57287a..46e0efc213 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -36,6 +36,7 @@ void hmp_info_irq(Monitor *mon, const QDict *qdict);
 void hmp_info_pic(Monitor *mon, const QDict *qdict);
 void hmp_info_rdma(Monitor *mon, const QDict *qdict);
 void hmp_info_pci(Monitor *mon, const QDict *qdict);
+void hmp_info_msix(Monitor *mon, const QDict *qdict);
 void hmp_info_tpm(Monitor *mon, const QDict *qdict);
 void hmp_info_iothreads(Monitor *mon, const QDict *qdict);
 void hmp_quit(Monitor *mon, const QDict *qdict);
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index 721dec2d82..7837a17d0d 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
+#include "hw/pci/msix.h"
 #include "monitor/hmp.h"
 #include "monitor/monitor.h"
 #include "monitor/qdev.h"
@@ -1005,3 +1006,27 @@ bool qmp_command_available(const QmpCommand *cmd, Error **errp)
     }
     return true;
 }
+
+void hmp_info_msix(Monitor *mon, const QDict *qdict)
+{
+    const char *name = qdict_get_str(qdict, "dev");
+    DeviceState *dev = find_device_state(name, NULL);
+    PCIDevice *pci_dev;
+    Error *err = NULL;
+
+    if (!dev) {
+        error_setg(&err, "Device %s not found", name);
+        goto exit;
+    }
+
+    if (!object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        error_setg(&err, "Not a PCI device");
+        goto exit;
+    }
+
+    pci_dev = PCI_DEVICE(dev);
+    msix_dump_info(mon, pci_dev, &err);
+
+exit:
+    hmp_handle_error(mon, err);
+}
-- 
2.17.1


