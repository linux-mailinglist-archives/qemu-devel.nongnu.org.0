Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAA53B742D
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 16:22:30 +0200 (CEST)
Received: from localhost ([::1]:59468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyEdA-000232-Jy
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 10:22:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lyEaY-0007ni-I0
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:19:46 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:40214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lyEaV-0003Qu-Lx
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 10:19:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1624976380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=M/J4XPlHGwBvLWZ49dL4LtR0gHQToJ4alLtrac/JPd0=;
 b=Qq6Io/MobUkn94b21jQzd/PCHL0M59VWnFHFX484gW1HHgrzYw6QZP7SZmqhIqG4z0Wi/F
 uJDZo0UoG+mRuQIb7n/Kn+ettdaIs0UCyB3IP3SNL63xUEI4MjFr+yepAwGYRScixlprOi
 4ZdVVK6yjExvyfo2/gIGmj7toR0QuwM=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-azWsbxMiNEC48smYrnHMAw-1; Tue, 29 Jun 2021 16:19:39 +0200
X-MC-Unique: azWsbxMiNEC48smYrnHMAw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nDhVAyo17a6xx3JsWp5WpMXAei4x7VQjnTiMisBgiABZrq9D+ROcfCHP1WRuPwwu8zWi48QplG3BpcsOXhlzS8doxsFCTwADizkx3LdXffjo9Ar0lDaMkhxxNDrnmFHr788pnjjUFDItYHMcKBl6b4myWhW4meuwW8T1DvMkSgnNZRE0owbf43dn4Nw3+wkD27vFZ8BxLAMigLX/UkDU/Sk/j4J630zgPB1vy5oLbP+MymhvgZ3x6LU6DL/UtYTd9DfMpAHT10iXgWWayh+AtfM84PYSb98OaCs9y/AK5q8B8N9ftQTOLDXGajOs5JHSxlgoRcglZuKRNft9sA9f7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4+fs60PV+EdgH/NY1nIZ7QosH82kpL1azwCdqy9pBw=;
 b=YE3T6nWJ/gyPJ6zfxGNdNpD1Sjp5QC6/TorhVJQzCQdrw/G4fP5kNEbMR7Bgsyrjgj9pxjVyYMWHSQVznMG/oFoPzHaBIxoujKzfGVS4uA4vJA+zCqirZPbMLGmH8v2b7SUaKITJg1eLTvN4ULn8BP+CffQ6FNcDYRQh+wtK6XFJihe2xD7XYvGG3nQp1g8Xxxj6eelVYkQLfthvg17cQeblukRZaANZH6Jgjq6Szr4yEW8IYp3RrZwp7AhVgPd92IFjtSiOIC7h3/P+1uDpmulbUK5jdoC8poAKgWV4Cry5cvSPZk+KbrPx2ZCb69c72m/WyTCUpaKrneGhQixfpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VE1PR04MB7295.eurprd04.prod.outlook.com
 (2603:10a6:800:1ac::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Tue, 29 Jun
 2021 14:19:37 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f%5]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 14:19:37 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cfontana@suse.com,
	acho@suse.com,
	jose.ziviani@suse.com
Subject: [RFC v6 00/13] s390x cleanup
Date: Tue, 29 Jun 2021 22:19:18 +0800
Message-ID: <20210629141931.4489-1-acho@suse.com>
X-Mailer: git-send-email 2.32.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [1.169.28.175]
X-ClientProxiedBy: HKAPR03CA0020.apcprd03.prod.outlook.com
 (2603:1096:203:c9::7) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (1.169.28.175) by
 HKAPR03CA0020.apcprd03.prod.outlook.com (2603:1096:203:c9::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.12 via Frontend Transport; Tue, 29 Jun 2021 14:19:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1973b2d7-47ec-4214-04c7-08d93b08ecb5
X-MS-TrafficTypeDiagnostic: VE1PR04MB7295:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB7295325CDC185E76CAE10736A0029@VE1PR04MB7295.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WhOAdcu03Y+D1Tx/hTBcbuDa+o0rP3K/xOhGDjI3X+gWyyZ7cg4dqj3TTovG7nfgDgCgKss5ns9Yr9bUuPH8ugt3CQX/eWSTR/SjUwqAy3m9yFft3rzMZUXs/WBjt9BZ2kKjzwpYlZ0p7LyDlcJwZJG+JkPmFNUc/Q+hOYACneO8Go0eZbOPGstv2rVM/9reOgX7sSc9bcwJUHExkEm67/h5UPzpWlhLRama1HdYFSm5OnRLdyEfu2TBesz+FOFMG47YABBad9Ck/vKLp/5j2//rui48A/S7H5v9vJBr2E9sfAmXmdGAsDyPXPM/NapZoZjmoHksNz6tZvWgyjtL9NZmZ7FXXZYCBxgOqOrGMcut/rbeHC6aP+TKZGZuQDb/YlO+uez/SF3OpnzuxhvRodU3aI94BIQcxhhWHPjATkRaw2KdTitRmwB5dgFbEKMl8bbjHMyihI0paZxsI9y1YIDN4zZfcbaEwTlpFGyOYzYqbNqevYZfmQJmkfxt5iKVsPhKHkPkdQRqW7qqDECGh0LZgVsp+02kN6AGg6LnrB5RQfZ1CiT5pDnUyWDnw22cJNgmF5d6s9f6EIjXzNciy8oF1KeTr2CRGaVXHxKQVby0tC3ePtHskD721xyNljg/86tWJgzUEVgkg80aQx/QMMUx+6zJCqOPrgc1VWn9TmzqD4aVIjrK9sQl0ke26eIaMUGOtuHOvja0w5rBs/0iRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(346002)(376002)(396003)(39850400004)(2906002)(316002)(4326008)(8676002)(36756003)(66946007)(6496006)(107886003)(8936002)(66476007)(83380400001)(66556008)(450100002)(1076003)(16526019)(86362001)(6666004)(2616005)(38100700002)(186003)(956004)(6486002)(478600001)(5660300002)(26005)(36456004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aqm0H7G+t7UkmgKCnJCJFkMuHND6XMgVEVqCZkvhjpMhrCZ2v35LWKgNlOBN?=
 =?us-ascii?Q?s0G+CJxH5j+t/FgS8pCX9bF9/naJ3mVWlD+zScduJPV5Vwj0W8TnFm+cs+Fw?=
 =?us-ascii?Q?EtClYvNGFwZ9WPKTRxARNM5wGcllpKmzFiXZGkdDH95VPaPvhR/zD71KqgJ/?=
 =?us-ascii?Q?8GvrbFUFqy4wTF5R5xG8lo3st4Sx6XrQZ/5ivPautw6NJorHu9an7FmSp2xO?=
 =?us-ascii?Q?9OYP1dD2Owx7VQeU6KLeKN91VbBLamnkhlsHENk9WCjg1k2QjawTyeY9fPsY?=
 =?us-ascii?Q?zLCVupCeka5X2Hiybgp/j3QfGhtEa1V7scCu3jG5ILFwkGMeBnzRLbgo4F36?=
 =?us-ascii?Q?d1zJ9DAW+Y3RunuGuzsIZJBBiRcmItd+JEA9MaFMWBEWm6uEGQnc7GqT4NkJ?=
 =?us-ascii?Q?vUrh/gO6y3Y9Ds1NRR6r4JPtszOpbpSdYKUHZqsyJujVAILtE/hqWpN6OMmZ?=
 =?us-ascii?Q?vJJSA0YF28gOnVKKbqeMn4iqPJBxmBR02sJ7Nj3/6A8lJ0SckxgiY8hJPzXt?=
 =?us-ascii?Q?mr0gn071yH54I9+5Q4uZQp0OYP6NZPDdQUsJIzm8GLZ1TnOiO5p5iNUzJUMO?=
 =?us-ascii?Q?sdJ9Rk6gj6eYNzUYIgBT4bWgt++bTZs8hopMGZOzB0CPlQhoTHPd2tKN14dK?=
 =?us-ascii?Q?RLVb/aLu4L0NT9JrKJFq6XgDyTHS5yTCP0XQuouotaUNcgzueuPTJi5/nVBB?=
 =?us-ascii?Q?FGBThYvuCdgsx5+7+bUJ0+aQpemx5OaZPBCQnqVnMCq7f3l3L8wBL1oFDe97?=
 =?us-ascii?Q?VXvwpTQhti3RSSA2SDyV73Js/ibaNjKaM99JvxWex6QuStVMAKp33J+UV/Q9?=
 =?us-ascii?Q?5Fly4uhM7aonXHCnZ0CK2rYZX9tsKiLzxZr6J1od40yyBqJPRgEH8jVPkcJX?=
 =?us-ascii?Q?+b6DUIACEP4APgdtU2t2uywQL6uvxieUy9Ry1pSnouEpVJz3bE1TpzvyYIOF?=
 =?us-ascii?Q?mLCtD/raDnN6PmHuLIW0erN/i3kLXeaG6HDlLb0Cf9bjCxrDXq/ZKWwUesWO?=
 =?us-ascii?Q?Hh75dMeZTalSpXL9rqAR592PQzneZ+qV6Ax0kn3sW1TKa5fP4xUnfJRWFUIb?=
 =?us-ascii?Q?uAY15LoN9Q2+MG5w2roBJHyqE+x0rVqJNdEGjShClBqrDeMgfDMy1bkNKJ96?=
 =?us-ascii?Q?NBqMFiMSgCO7vM2cu//WYwS7Xx2DPhSJSD2nhHrxVfGpzifrmvZl2B3Zp3p2?=
 =?us-ascii?Q?5XtOvdMO25jmtIjtHFms+vTkvHqT2za9Z8SX2Yy4Og3XieRn9mXUf4XeV3xN?=
 =?us-ascii?Q?L0Xv/oYl5q1EpDoBxPgh2tO/pnA+GZphkxCALgFDHbe65I86KR5dQIYOdWRp?=
 =?us-ascii?Q?tNHQW/Hk3PZwIout98GRH0vS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1973b2d7-47ec-4214-04c7-08d93b08ecb5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 14:19:37.0327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0PHQYPtQxzetHH4zTgma7dE7eKT2IjNHWg0+GKcjNue/4n6UCICQnJCaozoGXIWO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7295
Received-SPF: pass client-ip=194.104.109.102; envelope-from=acho@suse.com;
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

v5 -> v6:

* target/s390x: start moving TCG-only code to tcg/
  - keep the old pattern in MAINTAINERS (Cornelia)

* target/s390x: make helper.c sysemu-only
  - fixed typo

v4 -> v5:
* "target/s390x: start moving TCG-only code to tcg/"
  - add change to MAINTAINERS file

* "target/s390x: move sysemu-only code out to cpu-sysemu.c"
  - make use of SysemuCPUOps s390_sysemu_ops to handle

* "target/s390x: split cpu-dump from helper.c"
  - add description to explain why split cpu-dump from helper.c

* "target/s390x: make helper.c sysemu-only"=20
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

 MAINTAINERS                                   |   6 +-
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
 target/s390x/cpu-dump.c                       | 176 ++++++++
 target/s390x/cpu-sysemu.c                     | 309 +++++++++++++
 target/s390x/cpu.c                            | 289 +-----------
 target/s390x/cpu_models.c                     | 421 +----------------
 target/s390x/cpu_models_sysemu.c              | 426 ++++++++++++++++++
 target/s390x/cpu_models_user.c                |  20 +
 target/s390x/diag.c                           |   7 +-
 target/s390x/gdbstub.c                        |   2 +-
 target/s390x/helper.c                         | 162 +------
 target/s390x/interrupt.c                      |   6 +-
 target/s390x/ioinst.c                         |   2 +-
 target/s390x/kvm-stub.c                       | 121 -----
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
 54 files changed, 1057 insertions(+), 1083 deletions(-)
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


