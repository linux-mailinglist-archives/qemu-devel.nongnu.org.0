Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 418643BE6B5
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 12:55:11 +0200 (CEST)
Received: from localhost ([::1]:41252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m15Cw-0003hr-9q
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 06:55:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1m15BS-00025L-9e
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:53:38 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:29519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1m15BP-0001yi-Ls
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 06:53:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1625655212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lhp5dWAnMcsNlPEBi270VDh6OK2Vc+6EFPQpweVIcCU=;
 b=mgZ/WxqF+2K/g7im7PZneLOjmj9V/J+WXtJ8jMaWYzcnqvOWHayDTTz1079pJMraS4spQS
 1jl3mDuaTG/mxpOAw0fu34LJDtOuAV7B4R3Km8dxlKdnbnH+jy4xNJBZvAR9k+KpjXijS6
 Ui4mE4xHGzhBDqHMReWkxmtuW2mWQsY=
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-1-7M7XXqKGOF2y0ksDi9xrnA-2;
 Wed, 07 Jul 2021 12:53:31 +0200
X-MC-Unique: 7M7XXqKGOF2y0ksDi9xrnA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g95WzB1Lm/gg6oTDAJm6ai3IpDeMC+PqN8r4ywW+ZLmE4iY2tu/FSV6CeNaCFrFgdwEKMIEaVXApzUmBXO50Z8kAhqA0WLbowQX0mfaSEMR9UhjuYmPcDletfGul1z9cFrzRWD5QPKvKBgK48gVSwQQqT9NSvHjUyxppGz7++40IKbJ7RWutl+EA302gSA6DfCkoIFuXzg7t9hApFVRWR1LWAvA0ZFRf7HBBhvodUPAsj1ZcA1qJ7l+lY21wQD8Ci2ZJthPgifZ/S6eJS+I0dyqHCWdsvpAnaO7xWqaFe0ULP9ocd+EZvXVk8llXWzh9adsbHMBcZ6r6zUp73tg89A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iqu7YOxBpvRNRJ4E7O8XTo2Q16AukrSZfhQ9B281ibE=;
 b=RGDXsIgZf9bJeTmHw77v3cIGI+nzjCvD5XGeFR10zyoZFmG9nD7FE98Ig42Un5mxoag3pQAui55lD8hl5q6TxIMYfgXWWcpnAnYkgOlvJxuB9fsQ/XX8k4V7i01F2PP6ItLNzJb7q/nfkhQ65SwROAE4MPeyAgGVV7AIne21xcR6iOufC3fd01vo2zbUSrhjrqG2U42YRMVIw6JulDaXVLhaumKcdzu7w/m8wVaNNzAqLfjdaYKKvA80SW0mbaVvyOPh4AQSe0K8qV6e/iFhLFcjf5UyD1y08YTzY9VmRtRGJKxstR3huPembJ6PJ4QbX6z0dvrXbLtRv+hyhjqovQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR0401MB2238.eurprd04.prod.outlook.com
 (2603:10a6:800:28::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Wed, 7 Jul
 2021 10:53:29 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f%5]) with mapi id 15.20.4308.020; Wed, 7 Jul 2021
 10:53:29 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com,
	acho@suse.com,
	jose.ziviani@suse.com
Subject: [PATCH v7 00/14] s390x cleanup
Date: Wed,  7 Jul 2021 18:53:10 +0800
Message-ID: <20210707105324.23400-1-acho@suse.com>
X-Mailer: git-send-email 2.32.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0080.apcprd04.prod.outlook.com
 (2603:1096:202:15::24) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.20.159) by
 HK2PR04CA0080.apcprd04.prod.outlook.com (2603:1096:202:15::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Wed, 7 Jul 2021 10:53:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ea8148a-da71-45b5-a461-08d94135745f
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2238:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB22381F2FE5EACACA123A6C4BA01A9@VI1PR0401MB2238.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7BaIafaaHB9/M16XecIfxF+GUe/1ISQEkfNdeo1EVx9rRjG/BRCwe4NIe0Zv09CWPd3vgDIr2JJ3+NMvLrEPAwxIYWYXcrYRA0/z2ACRYS2B/COIgYNUySSN5txMd1TqKwNAPU0Ij0qtS4i9OxT4pNI3FzYlJRIgUYhQZcE18IfXBHovBa4IzAPCcRAEBireOVAsNd12PcoMAqBMCV2lu7Phu0IekjTIjFXdVqyLwD+3Vj13sMv4xM4UaljDXRrT6iuuVnkjwRxbNo+8IZrtoFopWZgpWj+0U1RRYXIcA3mZYFB9OLOVlZG2fV59ljRIsaYGfFJEzMGvHetRuLQG0lxwX7Uo9dWL/nbhAfH0Q3CEKHW5Qy41SErJ7VAqVSUYHYNBClBz26mDpQQ2IoKkB5gmmRyvwClfskcNck2TQDSDVzjyh128xv7mKq4KBeElD22VAxw8Bt9F4KM0/jfcdAJiUVav6JCelKGe0HS+A6PZbwtwgcXiZ0mBi6uwXHNlHNprylbZ/3DjRs2ldxYt0KX2hOujyiELEFlVtA4jngE0EO6lQXIh20uPfYEyIvbyVbp7MqhOzJu/GvIDu86IqhsEvlv85OEAkzP/b+lgWKN7m+dop+Xby7hue71hsXeKMgmt0jotgdVBN15BgWoMxlZPTRXRlL+ruAo3SLBUp40UV53MxRX7MbJuPmlAFe6rCufb970abDsCoYsClLuxug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39850400004)(366004)(396003)(136003)(316002)(26005)(66946007)(66556008)(6496006)(6486002)(186003)(6666004)(86362001)(8936002)(8676002)(83380400001)(2906002)(107886003)(5660300002)(66476007)(450100002)(478600001)(36756003)(4326008)(2616005)(956004)(1076003)(38100700002)(36456004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s5dH41jgwcApi+MEzw5e5ZD9oy/RkP0eEuqKuLKjvQxQSVO4PiywBot98sWg?=
 =?us-ascii?Q?aZMdKis1Lt0vjCh8wiKhPI9A9bAQfNE9MpormAeCUMAiMH/z3dIBiTJwuUW9?=
 =?us-ascii?Q?0LZkEC9e3xBxeWfC5DPqoS9Xfhs1RzWrljbgSMYT4rmR9aNGJ82jGa5h7qan?=
 =?us-ascii?Q?JUnVcrm+nlrWAoKOEZ63kHlLfHSFNxHdGxqRQsWNXemyVO+9AqVoa6zQ39RH?=
 =?us-ascii?Q?pxDWYN5XuBesQgmE/Q6dDgDNiGmVScHMAy8L+tgFHlohLdWyRKFVb2Zg2uEj?=
 =?us-ascii?Q?6wiJxi9NgoYNDHvunJy82k1xDXUNoh59YbRfYiM/0L62Lh1GYj0ENTK8kHAf?=
 =?us-ascii?Q?DKT6ijGuBJFL9h3LKvQofesy4zkt3eyNFNEhRvAt0U0VXSHv9TuofojQC56I?=
 =?us-ascii?Q?moO00JoHssFfCLddnjvfuPtPIMU3gMdcaSKODDh3/GEnH64Gcjf1xT7vBPAO?=
 =?us-ascii?Q?B2bfHGTK4+cQsf8nO0c//NmMl8voGHuwYJD1IXgLM3QtUgOdzACT6lZTkL3V?=
 =?us-ascii?Q?hFobmmkxdG2WZRMkEfMQ+MXY86EdE3jp4MEtYtAyXF7wZVm6AiWtuQRY6ssV?=
 =?us-ascii?Q?9z0OtUOiUjQf1JbliEFghC0+oZrib9GJRbnqt8y6NXjyzQebFdLzfwabq6J8?=
 =?us-ascii?Q?A+7YWKk2hw1TeDSTm0Cvn2/Osvby3XzTq+FijLcQ5+aYixbyVbbhHDrsiiED?=
 =?us-ascii?Q?gtJx7RECZaWgyHHrRyLc4K+eZFjeSEtt5Bwu05TI3a9vCOFafYTj7/6UiWGI?=
 =?us-ascii?Q?XXGmv2V0Hnqp1XdsmNqJROdbevmWLtTUnolJX9rqEqNBp/lq6J3TklM+RF0l?=
 =?us-ascii?Q?OV4+CApxgwvwLSaE/WcUoFm+pTyrUBWtFtTvCGehDvQSx0TKjqkffxVoCdCa?=
 =?us-ascii?Q?36KApgASmQ9S5izGLFcOo93NU/Q4gnqEzZ3kFkYlnseAcn+YtaCEAlGkJzk/?=
 =?us-ascii?Q?SGfu0nRKqqhrRxF85PbZIdTTM9FWDfMPEJ6x96+i+lq2WbMUdLybDAPQLRdr?=
 =?us-ascii?Q?JWifjYStzqJMrS019BawgxCaCXUCn3VYqxorFUMvtcLLsxZmpkutx1kTG5O+?=
 =?us-ascii?Q?agRgQzcK04SfPF+S1o7t1P2niF+gXZf1G4o1OCY+OWfrfKyK6DpZ3DcOaw4i?=
 =?us-ascii?Q?adZBpbEg7GSceHERhFPVJPdUygNqVruCluOOcaN0qWTuLMLMQjpdPAndzuVI?=
 =?us-ascii?Q?CV7IfWSG5rTG63dWNo27bJxaFxvm6C6YoQQgoip0Gt36x8WQUYSTO6npOd1x?=
 =?us-ascii?Q?dA2DK/gG1M6EBoc1OL7iGTr/BRPPD1wXxZqYqORguywmd+pWAa2MU6wAsKBe?=
 =?us-ascii?Q?/yxRqfpxI6lb/OXCBB6IdCYI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ea8148a-da71-45b5-a461-08d94135745f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 10:53:29.2542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yNRv4K+JU10XIOOZ5R366f/3nUzadWkuuL25Oe4q4TIlEO6CH+CiKgqGcg91xD/k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2238
Received-SPF: pass client-ip=194.104.109.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

this is the next version of a cleanup series for s390x.

v6 -> v7:

* "hw/s390x: rename tod-qemu.c to tod-tcg.c" #2
  - change the comment at the top of the file:
    "TCG implementation" instead of "QEMU implementation"
    (Thomas)

* "hw/s390x: only build tod-tcg from the CONFIG_TCG build" #3
  - swap the order of the patch 03 to 04 (Thomas)

* "hw/s390x: tod: make explicit checks for accelerators when
  initializing" #4
  - swap the order of the patch 04 to 03 (Thomas)

* "target/s390x: rename internal.h to s390x-internal.h"
  - Separate from "target/s390x: start moving TCG-only code to tcg/"
    (Thomas)

* "target/s390x: start moving TCG-only code to tcg/" #6->#7
  - remove the part of rename internal.h to s390x-internal.h
  - remove s390_cpu_*() in s390x-internal.h to next patch
    (Thomas)

* "target/s390x: move sysemu-only code out to cpu-sysemu.c" #7->#8
  - add s390_cpu_*() to s390x-internal.h (Thomas)

* "target/s390x: split cpu-dump from helper.c" #8->#9
  - move s390_cpu_set_psw and s390_cpu_get_psw_mask() to cpu.c
    (Thomas)

* "target/s390x: make helper.c sysemu-only" #9->#10
  - fixed typo: s/systemu/sysemu/

* "target/s390x: move kvm files into kvm/" #12->#13
  - remove the include header change in target/s390x/kvm/kvm.c
    (Thomas)

v5 -> v6:

* "target/s390x: start moving TCG-only code to tcg/"
  - keep the old pattern in MAINTAINERS (Cornelia)

* "target/s390x: make helper.c sysemu-only"
  - fixed typo

v4 -> v5:
* "target/s390x: start moving TCG-only code to tcg/"
  - add change to MAINTAINERS file

* "target/s390x: move sysemu-only code out to cpu-sysemu.c"
  - make use of SysemuCPUOps s390_sysemu_ops to handle

* "target/s390x: split cpu-dump from helper.c"
  - add description to explain why split cpu-dump from helper.c

* "target/s390x: make helper.c sysemu-only"
  - mention at the beginning of this file that this is sysemu only
    (Cornelia)

* "target/s390x: remove kvm-stub.c"
  - add additional comment to explain the function can be
    removed (Thomas)

* "target/s390x: move kvm files into kvm/"
   - add change to MAINTAINERS file

* "target/s390x: split sysemu part of cpu models"
   - add change to MAINTAINERS file

* "MAINTAINERS: update s390x directories"
  - removed, squash this in respectively:
    #6 target/s390x: start moving TCG-only code to tcg/
    #12 target/s390x: move kvm files into kvm/
    #13 target/s390x: split sysemu part of cpu models

v3 -> v4: take s390x part from Claudio and modify for the current master

* "target/s390x: meson: add target_user_arch"
  - new patch, add target_user_arch to avoid the proliferation of #ifdef
in target code.

v2 -> v3: minor changes

* "hw/s390x: rename tod-qemu.c to tod-tcg.c": move to the front (David)

* "hw/s390x: only build tod-qemu from the CONFIG_TCG build"
  - move just after, use "tod-tcg" instead

* "hw/s390x: tod: make explicit checks for accelerators when initializing"
  - removed a line break in commit message

* "target/s390x: start moving TCG-only code to tcg/"
  - split the rename s390x-internal.h rename part, do it before the move

* "target/s390x: move kvm files into kvm/"
  - fix broken/missing move of trace events

Cho, Yu-Chen (14):
  target/s390x: meson: add target_user_arch
  hw/s390x: rename tod-qemu.c to tod-tcg.c
  hw/s390x: tod: make explicit checks for accelerators when initializing
  hw/s390x: only build tod-tcg from the CONFIG_TCG build
  target/s390x: remove tcg-stub.c
  target/s390x: rename internal.h to s390x-internal.h
  target/s390x: start moving TCG-only code to tcg/
  target/s390x: move sysemu-only code out to cpu-sysemu.c
  target/s390x: split cpu-dump from helper.c
  target/s390x: make helper.c sysemu-only
  target/s390x: use kvm_enabled() to wrap call to kvm_s390_get_hpage_1m
  target/s390x: remove kvm-stub.c
  target/s390x: move kvm files into kvm/
  target/s390x: split sysemu part of cpu models

 MAINTAINERS                                   |   6 +-
 hw/intc/s390_flic_kvm.c                       |   2 +-
 hw/s390x/meson.build                          |   4 +-
 hw/s390x/s390-stattrib-kvm.c                  |   2 +-
 hw/s390x/tod-kvm.c                            |   2 +-
 hw/s390x/{tod-qemu.c =3D> tod-tcg.c}            |   4 +-
 hw/s390x/tod.c                                |   9 +-
 hw/vfio/ap.c                                  |   2 +-
 include/hw/s390x/tod.h                        |   2 +-
 meson.build                                   |   1 +
 target/s390x/arch_dump.c                      |   2 +-
 target/s390x/cpu-dump.c                       | 134 ++++++
 target/s390x/cpu-sysemu.c                     | 309 +++++++++++++
 target/s390x/cpu.c                            | 332 +++-----------
 target/s390x/cpu_models.c                     | 421 +----------------
 target/s390x/cpu_models_sysemu.c              | 426 ++++++++++++++++++
 target/s390x/cpu_models_user.c                |  20 +
 target/s390x/diag.c                           |   7 +-
 target/s390x/gdbstub.c                        |   2 +-
 target/s390x/helper.c                         | 162 +------
 target/s390x/interrupt.c                      |   6 +-
 target/s390x/ioinst.c                         |   2 +-
 target/s390x/kvm-stub.c                       | 121 -----
 target/s390x/{ =3D> kvm}/kvm.c                  |   2 +-
 target/s390x/{ =3D> kvm}/kvm_s390x.h            |   0
 target/s390x/kvm/meson.build                  |  17 +
 target/s390x/kvm/trace-events                 |   7 +
 target/s390x/kvm/trace.h                      |   1 +
 target/s390x/machine.c                        |   6 +-
 target/s390x/meson.build                      |  42 +-
 target/s390x/mmu_helper.c                     |   4 +-
 target/s390x/{internal.h =3D> s390x-internal.h} |   8 +
 target/s390x/sigp.c                           |   2 +-
 target/s390x/tcg-stub.c                       |  30 --
 target/s390x/{ =3D> tcg}/cc_helper.c            |   2 +-
 target/s390x/{ =3D> tcg}/crypto_helper.c        |   2 +-
 target/s390x/{ =3D> tcg}/excp_helper.c          |   2 +-
 target/s390x/{ =3D> tcg}/fpu_helper.c           |   2 +-
 target/s390x/{ =3D> tcg}/insn-data.def          |   0
 target/s390x/{ =3D> tcg}/insn-format.def        |   0
 target/s390x/{ =3D> tcg}/int_helper.c           |   2 +-
 target/s390x/{ =3D> tcg}/mem_helper.c           |   2 +-
 target/s390x/tcg/meson.build                  |  14 +
 target/s390x/{ =3D> tcg}/misc_helper.c          |   2 +-
 target/s390x/{ =3D> tcg}/s390-tod.h             |   0
 target/s390x/{ =3D> tcg}/tcg_s390x.h            |   0
 target/s390x/{ =3D> tcg}/translate.c            |   2 +-
 target/s390x/{ =3D> tcg}/translate_vx.c.inc     |   0
 target/s390x/{ =3D> tcg}/vec.h                  |   0
 target/s390x/{ =3D> tcg}/vec_fpu_helper.c       |   2 +-
 target/s390x/{ =3D> tcg}/vec_helper.c           |   2 +-
 target/s390x/{ =3D> tcg}/vec_int_helper.c       |   0
 target/s390x/{ =3D> tcg}/vec_string_helper.c    |   2 +-
 target/s390x/trace-events                     |   8 +-
 54 files changed, 1058 insertions(+), 1083 deletions(-)
 rename hw/s390x/{tod-qemu.c =3D> tod-tcg.c} (96%)
 create mode 100644 target/s390x/cpu-dump.c
 create mode 100644 target/s390x/cpu-sysemu.c
 create mode 100644 target/s390x/cpu_models_sysemu.c
 create mode 100644 target/s390x/cpu_models_user.c
 delete mode 100644 target/s390x/kvm-stub.c
 rename target/s390x/{ =3D> kvm}/kvm.c (99%)
 rename target/s390x/{ =3D> kvm}/kvm_s390x.h (100%)
 create mode 100644 target/s390x/kvm/meson.build
 create mode 100644 target/s390x/kvm/trace-events
 create mode 100644 target/s390x/kvm/trace.h
 rename target/s390x/{internal.h =3D> s390x-internal.h} (97%)
 delete mode 100644 target/s390x/tcg-stub.c
 rename target/s390x/{ =3D> tcg}/cc_helper.c (99%)
 rename target/s390x/{ =3D> tcg}/crypto_helper.c (98%)
 rename target/s390x/{ =3D> tcg}/excp_helper.c (99%)
 rename target/s390x/{ =3D> tcg}/fpu_helper.c (99%)
 rename target/s390x/{ =3D> tcg}/insn-data.def (100%)
 rename target/s390x/{ =3D> tcg}/insn-format.def (100%)
 rename target/s390x/{ =3D> tcg}/int_helper.c (99%)
 rename target/s390x/{ =3D> tcg}/mem_helper.c (99%)
 create mode 100644 target/s390x/tcg/meson.build
 rename target/s390x/{ =3D> tcg}/misc_helper.c (99%)
 rename target/s390x/{ =3D> tcg}/s390-tod.h (100%)
 rename target/s390x/{ =3D> tcg}/tcg_s390x.h (100%)
 rename target/s390x/{ =3D> tcg}/translate.c (99%)
 rename target/s390x/{ =3D> tcg}/translate_vx.c.inc (100%)
 rename target/s390x/{ =3D> tcg}/vec.h (100%)
 rename target/s390x/{ =3D> tcg}/vec_fpu_helper.c (99%)
 rename target/s390x/{ =3D> tcg}/vec_helper.c (99%)
 rename target/s390x/{ =3D> tcg}/vec_int_helper.c (100%)
 rename target/s390x/{ =3D> tcg}/vec_string_helper.c (99%)

--=20
2.32.0


