Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AFE2E6D2B
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 03:08:01 +0100 (CET)
Received: from localhost ([::1]:58822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ku4QZ-0005MR-N7
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 21:07:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ku4OZ-0004aX-EH
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 21:05:55 -0500
Received: from mail-oln040092253069.outbound.protection.outlook.com
 ([40.92.253.69]:5087 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1ku4OW-000467-U3
 for qemu-devel@nongnu.org; Mon, 28 Dec 2020 21:05:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZnMG1vU+aORtOOcWWSbkqIXcFGDaTFNZLyLXqUhpfnzyhtYSCoIv2f0DDx1BqjHVr+Sqttp9I7YvRFAOnBlTqTPVaE7+3NKgcezw+CmJT1bZF9RWO0EWEx+G/JHLtQgr173NryjzwaT/vFX7iVg8m/a30vxhIu6WZMQTUxZaHz+Z4voGTk93pMLeZUKRWGzn5/ebZJqw7K0O4wG71EMvqctDrVcNXgEWc2v1WhWRE0NnV+/JIrvELx4uwLeE2L6r0JG/F9M9rcYqrwU9gQTcqiyMk3n6Fd/jgRUYDyB6CxhRBfSyDjGFl0vx5s1mDQJf0QsLDe5Iu/mpQqBW/wYEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MGqRM7vBPI6+WcpsEnLwV1sJVTl4ayWau9g3NFohSnE=;
 b=U13bQIBGYFmdmL2nf8mIoTzl8bPGHPV2HOzcjQBx2wVfAINgG5Hc+FOuLFzswtRyZtG/GHrjJ1IOI8aePO0KEslSBSzDa5Y/JO9i+u+yDonitxlyVwq7ZkI6rqk8AYojspVGYpoRrz49mWyOiPkgdtieh2BAKx573IgJjDXqJ7EuEqe5Oe2mjWzHi+xOchUue8rFLXHPFx8UOIVaTMw6xKjKdShmVkBCnnrKL66XS2VDwBX56yLfOfFI8KeBHhSIfBtgl0XX4A4luUx4daf46nkFsxo+rxzyarNwsI0+2ak+gm/FtUD8MqQXs7z1o0xxnUKKWoJXapQBra4mquCLIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MGqRM7vBPI6+WcpsEnLwV1sJVTl4ayWau9g3NFohSnE=;
 b=HUr29RODfAp9fHy+OtyCEvRRuiEUxgnH6NLXcT+LZ+p899aVRq8WJqdoqn6Krnl3IC1iPxiX9nNjYjI6A2RFqzRFyKN7ADCt3xFy9GWGLW2Ae9pODJt0Uw+NkCiHP8lOotoxxZkxzlUTikTh/fW6M1y5wSiJLMZ8BN17KrGZAkOXwEUnTENBv65/lWr0W2ivMGBgrC/5H0fNxn1SmzHE0VxrcnifQULcotXaBvKHSrpBfmTpLIWBauO4tiRvg29RkT2hg1x1Gv48hJXQrEYIVlUtWGUH7OUUAtvtZfVuGrLNg2Wep/6wjYv31qxwgk/FjxYS2IM6R2q9t+oyAjDhcw==
Received: from PU1APC01FT004.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebe::43) by
 PU1APC01HT234.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebe::468)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Tue, 29 Dec
 2020 02:05:40 +0000
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM (10.152.252.60) by
 PU1APC01FT004.mail.protection.outlook.com (10.152.252.98) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 02:05:40 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:267F89DFC67BDA122AD8F7150E65842B3D8706C8343A5D543FD16F99A2AFB159;
 UpperCasedChecksum:5E46B7E6C039DD4189C1FB385E8B32B2C5176FA1060B1B5CFED37AADCE540118;
 SizeAsReceived:7482; Count:45
Received: from ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e]) by ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 ([fe80::88cb:2262:60f7:7d1e%8]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 02:05:40 +0000
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: alxndr@bu.edu,
	qemu-devel@nongnu.org
Subject: [PATCH v3 0/7] fuzz: improve crash case minimization
Date: Tue, 29 Dec 2020 10:05:09 +0800
Message-ID: <ME3P282MB17451412C0E506C9D5108B35FCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [6B/36Ibwb30hQUlXFO9XYJVMQQmrgm58a+btBdv3s0stUykgu1TElHxxAmN9YdKd]
X-ClientProxiedBy: TY2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:404:a6::34) To ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:ac::12)
X-Microsoft-Original-Message-ID: <20201229020509.3699326-1-Qiuhao.Li@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pc (2001:250:fe01:130:6d26:2348:77a5:f7ed) by
 TY2PR02CA0046.apcprd02.prod.outlook.com (2603:1096:404:a6::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 02:05:39 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 1e2d913f-6294-4b25-e0f9-08d8ab9e3dfa
X-MS-Exchange-SLBlob-MailProps: gjx25WM8ZNXNvqD3/CHhguXtu0t+EKJepWF7lh9dBqLRLRb6QjfAfLCtFV+uAAWu+r+6NWIO2QLVOiAcmHs8CmiAiw3D0H+HP3gOYF9VS/tmpCTqpcshH/1DYRyEmHSsLqZ+iJGdmGrEie3Kb24pKUNfTzPtrdedHnLMBnZaOdB1piiqfQKCYow9Fp9UDGBO/EB109zC2JIb6OKL6Uk4b4LQY8umFAjLH2fs0johnqxA0/0qVQRKT4SIBEy4fDOVf+6EiX0a4wT+ji97W7FzcY6SRNuFw4wrjpc6kOccHA+xYagLKx/OoBzMi4S0heIldhJL/WhUz4foN5VFHgbzRRnmwE4dAM7Hrokz0mE2KQf+DERJSk/bVZ3cZsu3qBxnvb8RUJSrNT83991vArHFfjSZuFFbNjYzMXrcR0DidI4qmhRB96j6wSqZOprstaVErDO+Vfy3YKmhiRKQfIjAyOKBnzZwrcLE8uJK2L2Wq2W/jso3c2wwR8H0qF8xikXdlMviY283mou0ZJ8Ip77eGlt/Pbwqenz51PX/hOniXbm2XTp5lIi2Gkp1tQsKP2gsCq2RAYKpdsPeEbxKLPmH3FU46TS3tgGzvklwAzCbsJYt1962/FMiYdxjwAYJFGLai9JtGjRBEy+11izaub6r7ZowkLeKDMOuoZePwLpjBasaI65gkdzZnyqjWBxbkQCsQUD7CeTVKBLeVKTHGvZ7pt/XtR5cKUB749SB6P2/kDo=
X-MS-TrafficTypeDiagnostic: PU1APC01HT234:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O38np/yLPpE+IuqgpUfxk0ARJsv15fNysC9PiWpQEauvoXaHkWxrOqUjndZ+MKL3tyuyora3+mgllCw2jynD+jEQXp85e/WCXDIIhXEFPRd0A1LbUSFhJlF9FF9Exm+ff6Fad7klvPOGs+yFLn06swsgI4uflQonmfx3v38z0D85kk4TIPA6d4GEV0tZeGHIqbI/aqdo2EPSyodouH92xZwwTg6GLgB9U6BqR/BJbCVPOE6j93bXmtx/wgTgVEB8
X-MS-Exchange-AntiSpam-MessageData: 0od14L9t25brABlEFXMfztqW7BuYAWAXNORN4ACPMF4hSzTsIDSxmTM5j4lzvOA7roxorL3OdX+xRmZ4HJjXrXMbjvq4evHy4q66kaDbWTp4yoxbX6Kphx35djW7JKrjjtqqDT703YUXH1sqI832DGdH4kkHInTAG4y6wwbUEuA+c+Teym+NWMeD5/sP+V00RSfser61puTg7uFVPYEokw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 02:05:40.4963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e2d913f-6294-4b25-e0f9-08d8ab9e3dfa
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT004.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT234
Received-SPF: pass client-ip=40.92.253.69; envelope-from=Qiuhao.Li@outlook.com;
 helo=APC01-SG2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

v2 --> v3:
  Fix: checkpatch.pl errors

v1 --> v2: 
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
  fuzz: loop the remove minimizer and refactoring
  fuzz: add minimization options
  fuzz: set bits in operand of write/out to zero
  fuzz: heuristic split write based on past IOs

 scripts/oss-fuzz/minimize_qtest_trace.py | 260 ++++++++++++++++++-----
 1 file changed, 212 insertions(+), 48 deletions(-)

-- 
2.25.1


