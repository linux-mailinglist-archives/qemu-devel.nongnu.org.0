Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9AF3B013B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 12:20:31 +0200 (CEST)
Received: from localhost ([::1]:51802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvdWA-00052L-Co
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 06:20:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lvdTT-0002H2-4x
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:17:43 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:31073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lvdTQ-0005w3-8g
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:17:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1624357056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UvaoNT1D5xQhAeB8acWUiFTTz5F/HaVPauyx7HgJZW8=;
 b=KrVMXr4VgGQgaXC0L/eJxDAur/P7I6M9hP2hoR71Rkcri5th76VHZReKQDPW7sCwhKGkJf
 EWOvoRKGOyBPAjzwuKo/S/POIibPJogUtBj6z4USpBKMg7HzwpVxkqzUB8nad7IBy5fW4c
 zvJmLzhVwERO9VQZ4LJn47MyGkPNWoI=
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2052.outbound.protection.outlook.com [104.47.0.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-18-GIqx6g0eNpakEnkCj7GZOA-1; Tue, 22 Jun 2021 12:17:35 +0200
X-MC-Unique: GIqx6g0eNpakEnkCj7GZOA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EEbaUscwszLT1AFZzHhAy9cx6rpfpb6hODZoxZPPhjY5XcitNO+VozI6qsb5oRXzroEQYfWOykNPZ+PjqTmc92RfQwobVGL3FgGYTbNuuwjDIdJkL5dKy1/buhjF/i1ydthWADaA0fcM3R5GhWRSOpmCK8zK7CKZejCVtRcNvE/gXEiml3UXIbg6A1r7ZWA/hx0FvYAuAl9qsQY9PEPnMZWpMNWYm6g9y6cjJneDe/qr218ufsAsbCWje5ev2ao/HAJzB5y61fRmO3gQKh/qLvUb3y4b74eU69sObb0IWr2InQz1hziGP3RyKBkDvV6ZmR3t4VgbzKPN99DSb7ioZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yVSD7Svl4p3EYBYBAbPmKnz6iyV75NpNOUidF1vTKc=;
 b=JeE/EYh3d9kX64loRJAUkIGsX+6BUZFyCC6tFdHWl2/TWIjdHR2OTqdDqdA72q5nuFzFMubvsGL/GHUXhVvwQmma9VhNypjfd5C7/B+d9BgTFdJXWsvnu4ionNODHCXoya+7xraaQSB+TI4zQqmVKdmvbPV+ec62RIvQhNYQgmyIBkKVHFizwCNNetWky3nYN0Woipy2Mptc46IgND1FptgoEY1Nau523cpeB1DO0EgkiXwoiBSpRvCGBWhFSSt2KW8DUMvOzWjSLs9Dr6IJTlkgZwnzqesjXEBfcg+Wywhe91dPysOEGwfxIjFkpZUifNGbzeorw6pwn9Cu7Y9YMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB5405.eurprd04.prod.outlook.com
 (2603:10a6:803:d6::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Tue, 22 Jun
 2021 10:17:34 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::28dc:6111:d2dd:4777]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::28dc:6111:d2dd:4777%3]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 10:17:34 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com,
	acho@suse.com
Subject: [RFC v5 00/13] s390x cleanup
Date: Tue, 22 Jun 2021 18:17:13 +0800
Message-ID: <20210622101726.20860-1-acho@suse.com>
X-Mailer: git-send-email 2.32.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [1.169.30.211]
X-ClientProxiedBy: HK2PR04CA0046.apcprd04.prod.outlook.com
 (2603:1096:202:14::14) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.30.211) by
 HK2PR04CA0046.apcprd04.prod.outlook.com (2603:1096:202:14::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Tue, 22 Jun 2021 10:17:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9eb68e4b-0e81-495e-5d0d-08d93566f330
X-MS-TrafficTypeDiagnostic: VI1PR04MB5405:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5405DC95F89BA6B857379BA8A0099@VI1PR04MB5405.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LtuxvE0LpaIBtsqU87bcK7+dcR+mfeUeBwJheFxEXZdOPcA3kce4uGONik6N3O4W+lCJCwiB+PKPJDyxANWSUK0J3XSoJ69xCiaXIKq0jXdWA1gdWUUs0qOBdrPTBEwtZfyFr2n6GKAyhdKi0WtaLIO3EVTOoRBdQPhf8g+atFYkRDPl4h4LnuhUmUNIbpSaxShGLRoPzrdApdVj2HVK34a4ycCjK9i7Eqr2Th64Ldt9bxLoj6FrlVSpqBXxvANQqpTJa/ozod6MMSTMQe1bvwqDV2YPibOfQIuQx8O7Az55ok1w5WFNd51AAOIbIEIcLq3naVcGhbnRUlkdn0olnBYoGcW4I4U0p5B7t6d+Vf7rpp4hWiYP5/xuChGpgFFqjUCNhqwHB7sreQWykAiv3yqn8tKR1/TD1EPGWRlDXUgX/OfT1PgT0Oaqed6BHENxXWsVtu9I3NoXEtTYzEwQ3slc5uY2kCEH0qBeH9R8AGMWkZcbJeHXWUccif2095iyqcJo4bbkPrlAExPnSqo8efM+Kj2o6Tzlv6upOrX5JqSNrjR0ZZzo2KjHxYxvz3OObNE//7tZbKJ5kYhBNxCQS4bO5VUBswE0c3114Qt4LmfiEMUNrKfy67zrhG7LVR7ccR8vYKKDc8RFKB0wXdUBlg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39850400004)(366004)(136003)(376002)(396003)(8936002)(26005)(107886003)(38100700002)(36756003)(478600001)(186003)(16526019)(6486002)(83380400001)(5660300002)(1076003)(2906002)(956004)(86362001)(66946007)(4326008)(316002)(66556008)(66476007)(8676002)(6666004)(450100002)(6496006)(2616005)(36456004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wOVB1fDuuRBH6WuzGRpVgKkrCmVsOOXSlPIogAE1b8MrTeERvHlMxTtpPIX4?=
 =?us-ascii?Q?Kw5m9PrHZv+rVnqWdro/sZidKUxiKfQw/kd2TtgLRwKvvjCsZP3yABkwfFoT?=
 =?us-ascii?Q?d0kcFXBCZsukggDSXda+EVQgq/hBpBuyq34PW6Ti766qqnGpQTTeFAfYK/pg?=
 =?us-ascii?Q?QBSm4VsDpp5j/xTXjQ+xQu10+alseDWBOBN39BKjbVALvajhm7j+AtJ5KMEQ?=
 =?us-ascii?Q?DDuCOd4hUw7rUqVJJoQoTsONwrrhTSR01bCRHST9I5lcFb85OiexncrsLr+4?=
 =?us-ascii?Q?nOvDomW9bTD8bl3688MdxyTVpmHIrCTeDy9oUsA18fxIH+gVvr4xw3o9nxR9?=
 =?us-ascii?Q?4QqhdiyXZLpoJyEBtx70FSHfV2NwCtX1LZMCy23anUeRVp77/ZOdsZlYsdAu?=
 =?us-ascii?Q?54XeBLwASpg9kxVB8vGAuy45eLSp3+xXpU2CiLwzZxD6w7yMVkzEyGw9zBrw?=
 =?us-ascii?Q?Zed0tXi1+lQwNRXCJid95dCerSXYJN3Lw6Kb2+ql/pP8akuqP+R3voQIZHFy?=
 =?us-ascii?Q?OnPgNKMzWsRL0Dp2JoBpkjI2g0V/ukZ1Fy/FuROc5ZG04OLUiFpCB4IQrBBV?=
 =?us-ascii?Q?RK3DJMSNIh/WSLhJDthSBKF83bfoz7iVjkFos01h4GMxBl16qo2y6B5BH0eY?=
 =?us-ascii?Q?FX9COH2X+ZkHVOlN61YQ7/3FYcvokCive0CJOGCHCtFa8sEkxK+CAxeQ6368?=
 =?us-ascii?Q?GnmfhUCKT0elzv2tcSp4wroo8DDzhMWbJRDodfywJpMsF2PI2+ni5K2FFH3E?=
 =?us-ascii?Q?8U1hjspIcGEZM0CxMFAD/72tlhlMvw/G8rcBKV7CU/jjb9M53Tz1jzMTaQxl?=
 =?us-ascii?Q?ENDKeW8g/qHsSPwYFLfYUlZUcYtPQuPp/yg7pPSTYtc1DKbV/OCVfYQvg5Kd?=
 =?us-ascii?Q?r/l3Ii/8/wVc6Bh3u57dE3zhBvc96RUfrjajR5eXT7/RnYfTDnAW8ABa+uY5?=
 =?us-ascii?Q?dQXePJiq/Fr+V8xsqY4gTUCrKiG3n1zP5MgN/bf+i9b1PcPS6cbo/E+WibVW?=
 =?us-ascii?Q?u3BiOOCE2dYTa4ETsXVZc5dJaJOlE15FBVgQJvsXLr1tRqxci6Aj5SVJBR4K?=
 =?us-ascii?Q?W8NlrAk68kmXb2zWIeoGo2v/PjinfN1ewJ/NHDpy27V7Hp8tgSUqVChoaaF/?=
 =?us-ascii?Q?SQKGuIFbN9jYpULtyALmuyvUEDZhYbW6IHtvVcTEbm7F8jmeX05gmHst2u9U?=
 =?us-ascii?Q?aVfBpooouI9StOopTaWONdI9w++ddmEqPqAhVdeOpsqdJRqe7+vTplrFKYfJ?=
 =?us-ascii?Q?QpUKyzNMzPWJ2A6Clr3V7tT3iobOAyj2/ZUV5pD4Wnszf7/K7Mof562S/jrm?=
 =?us-ascii?Q?NlwSNIVzeORqSLaqaY6dC0K3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eb68e4b-0e81-495e-5d0d-08d93566f330
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 10:17:33.5953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CeTlKyprn7wW5OC/kqEXwxdX5NKwAp+qMxLH6qau4mKfauomavSqis09QdDWslhO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5405
Received-SPF: pass client-ip=194.104.111.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

v4 -> v5:
* "target/s390x: start moving TCG-only code to tcg/"
  - add change to MAINTAINERS file

* "target/s390x: move sysemu-only code out to cpu-sysemu.c"=20
  - make use of SysemuCPUOps s390_sysemu_ops to handle

* "target/s390x: split cpu-dump from helper.c"=20
  - add description to explain why split cpu-dump from helper.c

* "target/s390x: make helper.c sysemu-only" #9
  - mention at the beginning of this file that this is sysemu only
    (Cornelia)

* "target/s390x: remove kvm-stub.c"=20
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


Cho, Yu-Chen (13):
  target/s390x: meson: add target_user_arch
  hw/s390x: rename tod-qemu.c to tod-tcg.c
  hw/s390x: only build tod-tcg from the CONFIG_TCG build
  hw/s390x: tod: make explicit checks for accelerators when initializing
  target/s390x: remove tcg-stub.c
  target/s390x: start moving TCG-only code to tcg/
  target/s390x: move sysemu-only code out to cpu-sysemu.c
  target/s390x: split cpu-dump from helper.c
  target/s390x: make helper.c sysemu-only
  target/s390x: use kvm_enabled() to wrap call to kvm_s390_get_hpage_1m
  target/s390x: remove kvm-stub.c
  target/s390x: move kvm files into kvm/
  target/s390x: split sysemu part of cpu models

 MAINTAINERS                                   |   7 +-
 hw/intc/s390_flic_kvm.c                       |   2 +-
 hw/s390x/meson.build                          |   4 +-
 hw/s390x/s390-stattrib-kvm.c                  |   2 +-
 hw/s390x/tod-kvm.c                            |   2 +-
 hw/s390x/{tod-qemu.c =3D> tod-tcg.c}            |   2 +-
 hw/s390x/tod.c                                |   9 +-
 hw/vfio/ap.c                                  |   2 +-
 include/hw/s390x/tod.h                        |   2 +-
 meson.build                                   |   1 +
 target/s390x/arch_dump.c                      |   2 +-
 target/s390x/cpu-dump.c                       | 131 ++++++
 target/s390x/cpu-sysemu.c                     | 309 +++++++++++++
 target/s390x/cpu.c                            | 289 +-----------
 target/s390x/cpu_models.c                     | 421 +----------------
 target/s390x/cpu_models_sysemu.c              | 426 ++++++++++++++++++
 target/s390x/cpu_models_user.c                |  20 +
 target/s390x/diag.c                           |   7 +-
 target/s390x/gdbstub.c                        |   2 +-
 target/s390x/helper.c                         | 115 +----
 target/s390x/interrupt.c                      |   6 +-
 target/s390x/ioinst.c                         |   2 +-
 target/s390x/kvm-stub.c                       | 126 ------
 target/s390x/{ =3D> kvm}/kvm.c                  |   4 +-
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
 54 files changed, 1012 insertions(+), 1042 deletions(-)
 rename hw/s390x/{tod-qemu.c =3D> tod-tcg.c} (98%)
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


