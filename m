Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8B22FB9B1
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:40:49 +0100 (CET)
Received: from localhost ([::1]:48838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1sBc-0007Yi-4E
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:40:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1l1sAK-0006e0-0L
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:39:28 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:44486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1l1sAH-0004Wm-TV
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:39:27 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JEabIR100741;
 Tue, 19 Jan 2021 14:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2020-01-29;
 bh=qn9IBqtSd8Ms+Ov1X1btN6ah972Gafr+Ilp36sCEMwI=;
 b=vFcXn1enN3mZbzKDYPfO01wl5kcVcRpHU3QH29J6Lzhhv00mnDLf3QQ440u464wEX8ms
 zaXS4II7IzFG5s6dyu7XMeC8xpnG7xIamJ9luaK4VETZ2Q0HcAqnOcd2Lej1iYXeofhi
 L34mwVk0am/IhBGYf9jOSBATldwwi/lX29X0I87GfS/MEAGt1A3gu6IXfcERUjjBQokx
 o5MpG3VleHU72Zpbv+ZtTqwuOe6NhGPyi1nM255oqSguRtEWd7pKwJFD3mjNysSM3Wkw
 MKG1H3+MkX4o/MFOKl4tC2AO7/bFvZtm3Nhj6EVhZH8ScThsd+YkpUrTRNkFMtc9mcz2 fw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 363xyhrpas-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 14:39:20 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10JEaILp097263;
 Tue, 19 Jan 2021 14:37:20 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
 by aserp3030.oracle.com with ESMTP id 3649qp9e2j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 14:37:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LwCh3jnSocEOFFQ/PRe1alHOUqv0qMWjHfwtDI/n+Wr7/V5jrppFuR3w6BnAmsfl4peQ2ptrhPEgPyzy998w/fNWs0yH+OLgkB60nPZwXZPp9EIs5FwZFUekywbkIgreAnnDXHKOte+Ry9MVNapjC5prQVopIRHSt1hvHe++27SfOauEMcGzVfj92VD10AGdhTDrCu42cDnImYRMgBBj9Wdv11SJdHF7BM2m26tznOHLiWhRGBpJTaQJKWkQfHowcVHeo/iWTjx2Tc9oFx44l1qKoy1x6YBMYtHu4sPaA2winYi3OdS4NZaFOp8vDbqiZDtklBiv8RkTymatYAoHnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qn9IBqtSd8Ms+Ov1X1btN6ah972Gafr+Ilp36sCEMwI=;
 b=RzVTpQYNfcy8r8D6KSQ28x8nyB0pyda8D+X5tDdIHmKlqw4UIj5rEAke4/37Ir+6tg+3OS03ZrZQ5Nrpt98WWqOLpx/xWPb06dmynwaMmQqy3+79oa/A1zXg88MijD9Hu0ucjcCdu86JCIcWGUdTT2LEb6E4rvEMmis0eGjvhkepFok12O9WM2fHnWiH8UQkNR1ETj7UjCCWwiYrA5fkO7SnDGgEUA4+0+p88E+wLZkFvBkqhZEvsoAtPN6jGM/i8igeFLx93FmAlWMTCAWi9df2Nn5AMi8r+ISk+Q2FnDIkSxSF4KQihZjI9j1TH5GfTOJYS4l02gjoqOJA12TR+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qn9IBqtSd8Ms+Ov1X1btN6ah972Gafr+Ilp36sCEMwI=;
 b=mPcMddud92xQWdr5opZA20J6ShZSXcx1QD/9b4xJx1z3yV7HidX1rPl2tmkLj05+uIyZ37ec3ydfxzDtFfDJ4ILMf+B3CYp9/85uo3FNswN4q8qWR+IpTsDBxs7M4pHpMLUOUVUoSEXGGlntA9QxOff+047AXG1n8rJfxdR4508=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR10MB2048.namprd10.prod.outlook.com (2603:10b6:300:10d::19)
 by MWHPR10MB1757.namprd10.prod.outlook.com (2603:10b6:301:7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Tue, 19 Jan
 2021 14:22:14 +0000
Received: from MWHPR10MB2048.namprd10.prod.outlook.com
 ([fe80::106e:c89d:3be1:6a52]) by MWHPR10MB2048.namprd10.prod.outlook.com
 ([fe80::106e:c89d:3be1:6a52%3]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 14:22:14 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/2] x86 CPU feature +/- fiddling and +kvm-no-defaults
Date: Tue, 19 Jan 2021 14:22:05 +0000
Message-Id: <20210119142207.3443123-1-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2001:8b0:bb71:7140:64::1]
X-ClientProxiedBy: LO4P123CA0153.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::14) To MWHPR10MB2048.namprd10.prod.outlook.com
 (2603:10b6:300:10d::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from disaster-area.hh.sledj.net (2001:8b0:bb71:7140:64::1) by
 LO4P123CA0153.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:188::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.11 via Frontend Transport; Tue, 19 Jan 2021 14:22:12 +0000
Received: from localhost (disaster-area.hh.sledj.net [local])	by
 disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 0b6d99b7;
 Tue, 19 Jan 2021 14:22:07 +0000 (UTC)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b11a8c09-f46e-485f-f6c7-08d8bc859e0c
X-MS-TrafficTypeDiagnostic: MWHPR10MB1757:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB175795078715D5AE251B297688A30@MWHPR10MB1757.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9lgMBuWEYvIjfN7qy6V75ioRY+pnMj+0/uqtHlCZ4cKcw49I9P6Dzk9j9RmFv61AH/PUmyTG1QakYTH2Xm8s8n43nFn/2pKy/rcnzc4NB02DPPdc/Ie/qOWfCy71iN0iz4e8qtdcT9FfV0AInzhGkfoBwBnNke70bJMgRsDXIbMpIPV1nXPFJpttBm0CelUhpeHvQUlFzVOzGCcTp+J15nkXsnXDdIhiun9Q76RSYHVgFFg6XYcEHvi/MVtIiQ4WJQfYeClSVRw5Zq/TQfi2tqOTG2eAVMXMUZq1VoHkUwZxLEXWyXKWGZ/5/Nqc8WzPBI9RWIeC6sSDtreeLCT6lxUOt6ZTU7jd7gf1SNXhNJzd6MJTsljtaO5C9cB3Mr8pvpldZzqCDUMZmGeaU8gQ+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR10MB2048.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(396003)(376002)(346002)(136003)(366004)(52116002)(86362001)(54906003)(316002)(66556008)(2616005)(5660300002)(8936002)(1076003)(66476007)(66946007)(83380400001)(478600001)(8676002)(36756003)(107886003)(6916009)(4744005)(2906002)(4326008)(186003)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?eEPQMug4FfuWSrHNJO3HxcCJRsiXWP24N7ghNvNBjgNCnBzm5uMFQkLGtEZA?=
 =?us-ascii?Q?EBmRA+UE3uUVyIoxxsxNmL2UVAJnBFr1M8ZEBPLbUDCoOtrrPL631wa8Hrhq?=
 =?us-ascii?Q?h0OtikaxDv1IqWqCVE80euP1DwQ3QOEI7T6GBpniCB1PDX2PP4lR1AP4EIav?=
 =?us-ascii?Q?iYwAh0cMaCQBUnYJWAc/tu0UkZsqSRoHmboJFJ2kYxeDkRTcFRTBnsIzZVfN?=
 =?us-ascii?Q?P4/TJlsXMFVX1f2vvle9T7mNaq2YCsHrOxOK+gAfMRNAElwIyqetygl9OTxV?=
 =?us-ascii?Q?vxb+JwAxKyXY6iqNmSuDhc/by3EOCblXspz1Ujm7LTlLEllAvSH2Dvj4PAns?=
 =?us-ascii?Q?xbmvcGlg5k0M0ww/9pvnxoMAB4WqOKN7oMjzC31M5IRbcxef28F+twke46YH?=
 =?us-ascii?Q?OgYGqy5JB7T05gVCu0X2KUajw+AHcRRWBeOwc7HzJE4NEDWmdmaHpSnTwHF7?=
 =?us-ascii?Q?hv/zRDIjyjepVg+WomT9CxSFO2U3kZEmp+Sh+a0llRBCiwK91KzBIfkhb/K3?=
 =?us-ascii?Q?noA4bdayeFDCawnFH4SpXF7tpgrNcJ7PsYRqloBnZ8DciK/bPtWXL0imzPUH?=
 =?us-ascii?Q?9cXFvJafpXCnwfDkXGzKQdhvbTi5ZO2Il3M9dhrktBlO5X+eF34gNKwV1fSR?=
 =?us-ascii?Q?3Gi3dcWc5BK9ma15cLKHLS0zgAnofOEW2E+YA025Sn+evM2DUiMoptlgLsdb?=
 =?us-ascii?Q?OoGzcY86w9No2HA/irKoYKZIU/MflO+JxmzQQuNiWaJfDti6FgEUhyGEOpXD?=
 =?us-ascii?Q?mnKS4ynf/hsgg7pFUZ8tFvehlGlOQgWwLwd/MGmH0EzFvTt/8ZBbsisK3xBG?=
 =?us-ascii?Q?ItOEzL45BommSfB3z5UVNDDAteyHzwZrmQS1zqtVrusQt07ej0G8uUW0rHpK?=
 =?us-ascii?Q?q+Mknp9SRtr2jqF102+j4UCN2wv5h5xIUgIHaEhbdC2SDmiG2FebNP/5rxol?=
 =?us-ascii?Q?tR+yXEKCRrsUbWBfoPqFcjAOReND9/SD/zrD9AKPhxAWIzvxRXgWwO51CSUo?=
 =?us-ascii?Q?yC1tOQUCIrw0mOGnsKTrENuBng=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b11a8c09-f46e-485f-f6c7-08d8bc859e0c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR10MB2048.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 14:22:14.4095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SndDfmN9VoDFlUJUg+Vvai5khlTopcKCHIVSuB1M3AO+ayDbpGuQohmWYATqWYUxGj3Jh0++4wjFD467t99Q2+e7nUZcbDv/rknDxAGmwFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1757
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9868
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=758 adultscore=0
 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101190088
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9868
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 malwarescore=0 mlxlogscore=996 bulkscore=0 priorityscore=1501 spamscore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101190088
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=david.edmondson@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Edmondson <david.edmondson@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently "-cpu -feature,+feature" will disable -feature, which seems
contrary to the intention of the user. Fix this such that the later
flag wins. There are no changes to the interaction of +/- and =on/=off.

Enabling KVM currently causes a default set of KVM features to be
enabled. Allow this default set to be defeated, requiring all features
to be explicitly enabled.

David Edmondson (1):
  hw/i386: -cpu model,-feature,+feature should enable feature

Joao Martins (1):
  target/i386: Add "-cpu +kvm-no-defaults"

 target/i386/cpu.c                   | 38 +++++++++++++++++++++++------
 target/i386/cpu.h                   |  3 +++
 tests/qtest/test-x86-cpuid-compat.c |  8 +++---
 3 files changed, 38 insertions(+), 11 deletions(-)

-- 
2.29.2


