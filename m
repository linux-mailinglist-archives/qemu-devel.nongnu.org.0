Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A74162EEBA7
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 04:06:44 +0100 (CET)
Received: from localhost ([::1]:33462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxi6t-0001T6-8v
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 22:06:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kxi5L-0000p6-Uw
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 22:05:11 -0500
Received: from mail-sg2apc01olkn082b.outbound.protection.outlook.com
 ([2a01:111:f400:febd::82b]:7297
 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kxi5J-0001xv-MN
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 22:05:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jyabM4fjn5S/HLch9y6m675oMP6vBenLmt6la04SgtFn0C6wqzKhmkTdYBHhwqsg3eEkThnxTxAQIiqim6zBqizMbPU+3bzQRIjaQBI53MBEY8Pb+7az+x0gT40yuqKu6TH31omXrMPudsdO+56EZ/tPEj0UUZicF5hg3Bzq0uU2Pn8jJ2yBeFnzCK1fuANOgK5nxQVj7V/09WAVDpNjVorcvmmo8NDgQSy6PQv7K0vTwU3+i7E/N3qDIA+4/f+l1LrLj5TKYLoAB0kajmDKwVztiw83D1Eq3NUHW7od5ZPuuvxJGgKEieAMUBXr/FWWCQ6/0k68UI0J+nzxoY3dFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IM7AlzgcVMifP/CINJoEdib5JElErRQLb5Hk6jORz28=;
 b=h4ZzfQa+Cr2Tw6wNWEhV2+iIo9Y2BdZQibJJ5oOmQRTmTlfxP7kTmO12mDuMy8h0trIo0WHqL/O1wrdsUoyH1GVWkXiSArDDpZTnGU3OZk7Ifyb+Rcgq+Pvs1Ih+SP+4/VceKfUSuXWqCdqNhzN0Srn12VLfzS05ZcI6La7ilG9Gq4yyiTZNWOGfjt/+heQhE66ePtGttubUn9N0f2/KqqRiXp8EgNDr98piVC0ykm94NkrOrceX7Y4fDUGY2vgnZALMilBP0gkKf21VQ57Qg9iAw6P6LXRnhAWaaQqgSxEIww1puKr3Q/Xe8LOwUuC+oEasK851Z4FS2NV4C1FU+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IM7AlzgcVMifP/CINJoEdib5JElErRQLb5Hk6jORz28=;
 b=kRtuvK7rAmX6VEG2rxdiXKt9wUZ5a53IN61hhrMdDJ4BOCWxDdlbU5OJONFVinwDxPqye28JiuR7FPgRgPgZnZkgHRlZI2CsbS0oIJXTMYGmk9Vpeec/i3r4pKzltaapLTSfQ3R8aJfqv+8qP4AknrgXUnfH5M0K7R6+x0C4Eq3sJ2EU7LjjXMM6Jz6sni/G51/gPgot+ent6Z/DQaBzGpoiSyu/izC6CxGDcUOkpC+QqlY8PTmudwtF4gjOZM/1GhZeA3uxPgLkbitZO6+fcegH6z9jy57Fq7LOUNgQ/kGNRdY3MS8su/YYMniYKDnxDNX/oweU6GsuFf0FAGnPAQ==
Received: from HK2APC01FT029.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::4d) by
 HK2APC01HT011.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::138)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 02:44:57 +0000
Received: from MEAPR01MB3494.ausprd01.prod.outlook.com
 (2a01:111:e400:7ebc::4b) by HK2APC01FT029.mail.protection.outlook.com
 (2a01:111:e400:7ebc::195) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.24 via Frontend
 Transport; Fri, 8 Jan 2021 02:44:57 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:05EC73EECE0089F8DE96F64ECB98874565F13EB3B6C8E1C03DEDCE0464C7936F;
 UpperCasedChecksum:8E6E4EB6679E2793B8933346AAB3D61318EDD5E8BF59612FB5C738B5A5972049;
 SizeAsReceived:7511; Count:45
Received: from MEAPR01MB3494.ausprd01.prod.outlook.com
 ([fe80::2d4d:a683:7f83:cf50]) by MEAPR01MB3494.ausprd01.prod.outlook.com
 ([fe80::2d4d:a683:7f83:cf50%7]) with mapi id 15.20.3742.006; Fri, 8 Jan 2021
 02:44:54 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v5 0/7] fuzz: improve crash case minimization
Date: Fri,  8 Jan 2021 10:44:37 +0800
Message-ID: <MEAPR01MB349464ED835FE8243FB09100FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [k4mJ7DJ9X+4n0sYEUkE/CdUdW247QFHM5dmlPFyICep/FEH8tF3uAHdJ8jCWWqdV]
X-ClientProxiedBy: TYAP286CA0033.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:8014::20) To MEAPR01MB3494.ausprd01.prod.outlook.com
 (2603:10c6:201:39::11)
X-Microsoft-Original-Message-ID: <20210108024437.66558-1-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from XPS-13-9360 (2001:250:fe01:130:40a3:2fc0:cdf4:4729) by
 TYAP286CA0033.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:8014::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Fri, 8 Jan 2021 02:44:54 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 3006f14f-83ac-45fa-a283-08d8b37f616a
X-MS-Exchange-SLBlob-MailProps: gjx25WM8ZNUOze3FI6XN1n/uGT+rrP37g4KA8Afldo+t1+5nxIF3FFytn5yuzTKIrqIKTuarPdC0fZNttLqqG+w8RTgz/IbAbDZHEh9AWqEf88OxchhWvBkn/jyG5Mnt88xL9IK7Y+WH2EB9dsEZsmPXzgOCNvxJXioe59qGpDTFsJnyKUZviCYRiPGTaD/4+AACEeoxpmLwmydnoy7yvyoNQg5u2iDwXvE8yuGoOy0hvUag+il2dr4R198BFrdsku23iMjpwWoe3tRwaro0+hL0xy/NDA0owEkxsrFJOHwDkZNjOD7SfSU2mgBUCkAkWR4EMpaFWNqoQk3v4X/PbKM71/A47Qc9iVPVhJhlbMyvyZfJmpX6IwRiqvyRrMxborBuhUJvJMKDw+c6hAfkZoQJofC1SYAlU+1qH6VXQDfEkPZiJVEzB4wbhA5hT6asp4s+4wVRtVFkxyX0NhVrHj+dDp2/H694FPcbPXINV3rMzp3NTag0MRhkGqucR8xdvU1FkHFcHpo33E9tAkRH4ng9UIAQLlqz+J2MPAaAL0ed5+vExG9MQ+Ad3KR/LNgCi2qgQKM9mrY5hGrNYXwSleY8HhY/qMh6jhnU50JpndAKuhdO/SN6S20lhz26SKHLex2jmswKlExT9WWyAoh/9tm8SnUcTPOomKoOs5qBSD/7p3df+0e+0qa40eNCflPRCGa7iMVYVqMV4zQwNcm8+H6ukFl9KgfulkfOysJWQ6E=
X-MS-TrafficTypeDiagnostic: HK2APC01HT011:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ilaE6TBjZvgcDklPmbZlrQPL16LkqUnmWF4B/a6NwJD8i0lr/YC/uxlxUEyAHYq4EzN/zmzFvCK4RimV3Yxhzq1V4LzCA3I2Xmav02CkltT9f2dFDJFZZk/tlWJF+ptGwd2qOtDZ8S0TGwJELBaRKpPg02L/JrYuY+wXqWD48p+2KiMoboYF9sAu2HuKhvRoPcVj1mhO6zDuMhnpdJTd5tUakvrNmE77hZpJ7J8dihjaU4qlCv0EOa6IQmK5Uvoj
X-MS-Exchange-AntiSpam-MessageData: 7BlvWEtbo3LY6PBB9Y0jp+yQHU1hrahV+t32TFYbKUsjZWtI2BIW8DT9w1pFZ/lIWEZ8QIKTbIBawmvFwI1Oak3Cjw8Hvr0n0gwy0NnNZ5Ix7orDLNJxDqgQQO0298hd2TM3mPmavRWzkGpWVOCpgSuI/r36nppUuN3SKh8PEIv2OiJDKA0PfBK9J9u2YwPrCO7KsUc9NDKxbSUjtpU4QA==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 02:44:54.8322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 3006f14f-83ac-45fa-a283-08d8b37f616a
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT029.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT011
X-MS-Exchange-Transport-Forked: True
X-OriginatorOrg: outlook.com
Received-SPF: pass client-ip=2a01:111:f400:febd::82b;
 envelope-from=Qiuhao.Li@outlook.com;
 helo=APC01-SG2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 MSGID_FROM_MTA_HEADER=0.001, SPF_HELO_PASS=-0.001,
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
Cc: thuth@redhat.com, Qiuhao Li <Qiuhao.Li@outlook.com>,
 darren.kenny@oracle.com, bsd@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extend and refine the crash case minimization process.

Test input:
  Bug 1909261 full_reproducer
  6500 QTest instructions (write mostly)

Refined (-M1 minimization level) vs. Original version:
  real  38m31.942s  <-- real  532m57.192s
  user  28m18.188s  <-- user  89m0.536s
  sys   12m42.239s  <-- sys   50m33.074s
  2558 instructions <-- 2846 instructions

Test Enviroment:
  i7-8550U, 16GB LPDDR3, SSD 
  Ubuntu 20.04.1 5.4.0-58-generic x86_64
  Python 3.8.5

v5:
  Fix: send SIGKILL on timeout
  Fix: rename minimization functions

v4:
  Fix: messy diff in [PATCH v3 4/7]

v3:
  Fix: checkpatch.pl errors

v2: 
  New: [PATCH v2 1/7]
  New: [PATCH v2 2/7]
  New: [PATCH v2 4/7]
  New: [PATCH v2 6/7]
  New: [PATCH v2 7/7]
  Fix: [PATCH 2/4] split using binary approach
  Fix: [PATCH 3/4] typo in comments
  Discard: [PATCH 1/4] the hardcoded regex match for crash detection
  Discard: [PATCH 4/4] the delaying minimizer
  
Thanks for the suggestions from:
  Alexander Bulekov

Qiuhao Li (7):
  fuzz: accelerate non-crash detection
  fuzz: double the IOs to remove for every loop
  fuzz: split write operand using binary approach
  fuzz: remove IO commands iteratively
  fuzz: set bits in operand of write/out to zero
  fuzz: add minimization options
  fuzz: heuristic split write based on past IOs

 scripts/oss-fuzz/minimize_qtest_trace.py | 257 ++++++++++++++++++-----
 1 file changed, 210 insertions(+), 47 deletions(-)

-- 
2.25.1


