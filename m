Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 662103B0195
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 12:39:57 +0200 (CEST)
Received: from localhost ([::1]:45988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvdoy-0005jc-Ei
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 06:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lvdh9-0002qp-Mr
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:31:51 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:47957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lvdh5-0006Un-MY
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:31:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1624357905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YNtQKJgWDoWDlVAwmxUFwWRqzufX15bZ0cjXSqzL/K0=;
 b=OIPeqTT6tzzN45OEmF+gQFQWpnAB5PZ0Sk9cM0/DOUL6TezcLn4NzHCHUggw172BW7kv8H
 lk8kS9HskNPSGqqaAP7L32p9oaKojwtYp3ZwocCrpWzAPXYD60gDNje/otvijod/zHNUn9
 Yye/QGXFIdLIkOQII6hVrhY39ALbkrg=
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2059.outbound.protection.outlook.com [104.47.2.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-wIIrLDcTMius7MSWtyOBRA-1; Tue, 22 Jun 2021 12:31:44 +0200
X-MC-Unique: wIIrLDcTMius7MSWtyOBRA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cfnsc3DcP634HYFwRhTRFUUS8AjMtXzYJohzAAk75u6vmQORnqHZkRdnZYeL1ocvAG0vaTPOASsrqUkzW5zSLSsFfB8HtL5oRhx78jAzbZNBbB1Az0fFOxKRzQj8br1IWlI+5VzTPo6kKwJfAIAVSlhC3QuAQ6UyXQubcKbkTIq/tvQzg8Y231vSG+U4JU8ShJNFvJzVPDFCuHEelI87ppO7heHMYPqBAkTG42apm6oAeb/OeJqmHNfPnF75yj2DtYneFQkHD6GegJ1Amxu+JszZBteYYrXmVL+NEDmyjcN/ci/d5R//DWUyMLMKOQ6aJ7Jdfz9WZUoRaL4O7xhudg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNtQKJgWDoWDlVAwmxUFwWRqzufX15bZ0cjXSqzL/K0=;
 b=C0L8MQDrPqw88XhmOE+7K+uljCTwQbjWWd1FV0pbjfY92E1/4GD76eqUjwiHlibw1orpl1+z2FcAVYLYkbJsaWeSebCZo7NlYx8ANqxdiDLFLjCsHoeRo9w1ZkwJPl0V7b3FpGceCWs0FSaFQLhbe/E4+9ywCRxMRAW+FAveMq+6P6JliayOsuN3TeqbKuXyHm4iEMod95oTkQ6MVk8N30yIlvz+MQLRV8lcTL1QUti66I41BNuA+TmXNfl3hlFVkufSCYYZd+1DaiAp3kdhMPmdHVE0ubsRtFk4sll3GHikjadptvYyYAFYd4dOnqA0FSKKxEqvOtMsZiHgwkf8cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB5887.eurprd04.prod.outlook.com
 (2603:10a6:803:e8::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Tue, 22 Jun
 2021 10:31:41 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::28dc:6111:d2dd:4777]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::28dc:6111:d2dd:4777%3]) with mapi id 15.20.4242.023; Tue, 22 Jun 2021
 10:31:41 +0000
From: Al Cho <ACho@suse.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-s390x@nongnu.org"
 <qemu-s390x@nongnu.org>
CC: Claudio Fontana <Claudio.Fontana@suse.com>
Subject: Re: [RFC v5 00/13] s390x cleanup
Thread-Topic: [RFC v5 00/13] s390x cleanup
Thread-Index: AQHXZ0/QIMrnWDZjfUamEbD+AB7CnKsf1Ig+
Date: Tue, 22 Jun 2021 10:31:41 +0000
Message-ID: <VI1PR0402MB374435690911F44EB68F613FA0099@VI1PR0402MB3744.eurprd04.prod.outlook.com>
References: <20210622101726.20860-1-acho@suse.com>
In-Reply-To: <20210622101726.20860-1-acho@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
x-originating-ip: [1.169.30.211]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba57ba65-466a-47c3-63ee-08d93568ec92
x-ms-traffictypediagnostic: VI1PR04MB5887:
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB58879680F5ABB62A3AC9B6B3A0099@VI1PR04MB5887.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JUGR4iBXm2Xw+zn+Fa8fj0I2Ewe7VrR2SSwx6VeRj/dmBA6792EM30j4qJXLkbilkVywEOAW5DGtwJ3GNy6BX+ytRBbLSTn4vuAAvVDFswJ7zTxqZpLJo+nOcrLGiVGM4+IR1+4lnPvisvoUCLj/CMPRyemSZOVfDMSmT7isbRxxIvMu1FyoEzyJeGZ4JmdJF2E9udNVU/xErKEhplSvh+ptablJgujPZMjkifISlAN2pD14B3iDKvuA4qO3xAHoAaBSYjN2Qhh/Ejb7grAoMSy8/wxyp4uIgC4qE1EdtVeDUjm3x7Fcpuv+iptx1aGQRpZ9/slrz+HAoX6Zcyka1EP409rmX8YgxHpVQSpVSs5Fa2LchJuTHtGk9J7IluXWhv8l8LMGAt6PcKhk0TTd62NcnBk0py6cTkOaABroUdmqSggJESOyf6gbqd0CkNFjCqUsvjm9XzRjubDrJaHRWmc9s7JpUG76dWDun8a1VXDLvn5Fh+S6yrpNxwksp5GQS28n2r30AB/tlwV2isF1B98UI6Ys4h+hS5ES5Z2Ydmn+SfikqNllvSMBZ+R7pvEwL7uE7LReos8P0mLse7H9bVz847R613na73+thSiJ1NTAmzAjKixz41Ft+4kY7Baz8Pvj1qd0V0KJgAnZSUV/cNqaj7ZPuV797Ux2K1We0MlyarjjQ3HglkWGiBr8sbzqezvOc9BbOJzya67i7Dd12kO22pgsAA9FJbBr5dUbl/o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(346002)(396003)(366004)(136003)(376002)(966005)(55016002)(5660300002)(6506007)(4326008)(26005)(110136005)(450100002)(33656002)(8676002)(71200400001)(52536014)(478600001)(2906002)(7696005)(316002)(66446008)(86362001)(66946007)(38100700002)(19627405001)(166002)(107886003)(64756008)(83380400001)(76116006)(8936002)(66476007)(53546011)(186003)(9686003)(91956017)(122000001)(66556008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Xkt/W+T+5SPQvPdxaDEunYM2Y7mioGb8jYpXwvFJ9fH7XAjF+cZYglSgBmYP?=
 =?us-ascii?Q?vKoh35mCawXU+IKHIUzrILrW94TQRSmtbgorvhZJq/yVyQsQ3pGki5m7aNma?=
 =?us-ascii?Q?SQbbXZqrORqjYT1oUZtPYkAJmYfqieqhqtkfgxrfJ1gCQGedLRG+K8tFCB+W?=
 =?us-ascii?Q?9dyzIXUJgroMyYMMCRnT1H3vzGzVSx7f8L06U2w9xVqGDpvl0mk5lGcWyQG2?=
 =?us-ascii?Q?LVy7UrrK/p/MtYw5lJOZxJ8x8QYuzZtqaso4UJE4pBZ+aYG6QXk0ib0ups/0?=
 =?us-ascii?Q?kEUjS2Uqn6mAO4AJ6oM+YaF6vK2ugRKtRAYF8lldhAVhjF95dKkpQS5m8zXE?=
 =?us-ascii?Q?/cjNntMn+GkCZYl/V5lXwiW8yqnwmTNUWHW6BSeOtwo6VxTe8jpvZY/SKYi/?=
 =?us-ascii?Q?23/dnq4Js3x5EKBeRFvS84ay5y/bL7Dfhy5JRrHJVFrYU6LTnQKvgSeFoQBI?=
 =?us-ascii?Q?Hn5WLqZ1XFfUa7hto4tfgoBSgFyB8XstJkd8ttHH8qDc58a86YYqUT1jgNV4?=
 =?us-ascii?Q?G3DzmytFU26ZJ3IuuBVfl5vNAhGUaPnjuWerQ+KrF2OFLYg18VcRu2y6CzgP?=
 =?us-ascii?Q?C8jKgjKnoZ4kSKlYsme1pHfZrrcg/Ysw15Qy5qodv1GRi/Qqtijlz6e6vihN?=
 =?us-ascii?Q?qNyGKh7wo2tKcRuv07kai8XOW539ds+Asseyz1oztivpREFrrRJfxpJbl5Xz?=
 =?us-ascii?Q?WfW3RUZd7kBAr11yamMZ9X15id9PiuaFSs9WVP5v3RnWPdxafvBVazlcHujY?=
 =?us-ascii?Q?5jvPMp/5pIi2otg9UyBdsxKvFqTrnlVAC4S5YqlBA4rRZvK+OpGDyFsZwpN7?=
 =?us-ascii?Q?ND2i5CQOYADAnP4PwYhrhmFCNGWlT9ItAhvefHCWoPn2KYBnH0FGvcn21UJN?=
 =?us-ascii?Q?9UW4EAnoQvUABUSBN1vNtBgArTcOh90CgOUieXSPvN+Ls7FXKLNgMJ898Uh3?=
 =?us-ascii?Q?yIWRJGnHcUyiH5kvWMHpMw82UVnqTQIPSO9gL9ZRRPubJEqjljYIfXJls6+x?=
 =?us-ascii?Q?3KRD0tJJHfzDcWqOXevFkYPNXrE/hnjrcCUTWqoc3+TvNNGxvm9rCBXoE6ya?=
 =?us-ascii?Q?z+DS6leFEAyM2PRzcXqRqt3OxeiyPdxofNWLz8VVCMXosanmYod02wTcc6lp?=
 =?us-ascii?Q?hISXPAGZ8LaZi8qApQLhq2LQjoIQBvajfcOLVynkIWEOdLjyld5nuqmiJutd?=
 =?us-ascii?Q?aiWX3Gsaehg5fF4gO00acNXjY3TL12jaC4aPX2398PJQ5ZC+AA8fsfI4ynfc?=
 =?us-ascii?Q?N3OIr/pevzoMYJ8N5PSgkAc1fo4F6Fnvg1wqk/H9o1x7WYI18sb0wUU7br/U?=
 =?us-ascii?Q?5MA=3D?=
Content-Type: multipart/alternative;
 boundary="_000_VI1PR0402MB374435690911F44EB68F613FA0099VI1PR0402MB3744_"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba57ba65-466a-47c3-63ee-08d93568ec92
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2021 10:31:41.0704 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9CLQU3uOtL9b5MSzO/QrWJlBZOxECOki/k1Oy2llJxcqWKrDksDsiczvqMgHaujs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5887
Received-SPF: pass client-ip=194.104.111.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--_000_VI1PR0402MB374435690911F44EB68F613FA0099VI1PR0402MB3744_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

There is the CI/CD result of this patches set

https://gitlab.com/alcho.tw/qemu/-/pipelines/324863789

Cheers,
            AL

________________________________
From: Al Cho <ACho@suse.com>
Sent: Tuesday, June 22, 2021 6:17 PM
To: qemu-devel@nongnu.org <qemu-devel@nongnu.org>; qemu-s390x@nongnu.org <q=
emu-s390x@nongnu.org>
Cc: Claudio Fontana <Claudio.Fontana@suse.com>; Al Cho <ACho@suse.com>
Subject: [RFC v5 00/13] s390x cleanup

this is the next version of a cleanup series for s390x.

v4 -> v5:
* "target/s390x: start moving TCG-only code to tcg/"
  - add change to MAINTAINERS file

* "target/s390x: move sysemu-only code out to cpu-sysemu.c"
  - make use of SysemuCPUOps s390_sysemu_ops to handle

* "target/s390x: split cpu-dump from helper.c"
  - add description to explain why split cpu-dump from helper.c

* "target/s390x: make helper.c sysemu-only" #9
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

--
2.32.0


--_000_VI1PR0402MB374435690911F44EB68F613FA0099VI1PR0402MB3744_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
There is the CI/CD result of this patches set</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<a href=3D"https://gitlab.com/alcho.tw/qemu/-/pipelines/324863789" id=3D"LP=
lnk">https://gitlab.com/alcho.tw/qemu/-/pipelines/324863789</a></div>
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview _EReadonly_=
1"></div>
<br>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Cheers,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AL<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Al Cho &lt;ACho@suse.=
com&gt;<br>
<b>Sent:</b> Tuesday, June 22, 2021 6:17 PM<br>
<b>To:</b> qemu-devel@nongnu.org &lt;qemu-devel@nongnu.org&gt;; qemu-s390x@=
nongnu.org &lt;qemu-s390x@nongnu.org&gt;<br>
<b>Cc:</b> Claudio Fontana &lt;Claudio.Fontana@suse.com&gt;; Al Cho &lt;ACh=
o@suse.com&gt;<br>
<b>Subject:</b> [RFC v5 00/13] s390x cleanup</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">this is the next version of a cleanup series for s=
390x.<br>
<br>
v4 -&gt; v5:<br>
* &quot;target/s390x: start moving TCG-only code to tcg/&quot;<br>
&nbsp; - add change to MAINTAINERS file<br>
<br>
* &quot;target/s390x: move sysemu-only code out to cpu-sysemu.c&quot; <br>
&nbsp; - make use of SysemuCPUOps s390_sysemu_ops to handle<br>
<br>
* &quot;target/s390x: split cpu-dump from helper.c&quot; <br>
&nbsp; - add description to explain why split cpu-dump from helper.c<br>
<br>
* &quot;target/s390x: make helper.c sysemu-only&quot; #9<br>
&nbsp; - mention at the beginning of this file that this is sysemu only<br>
&nbsp;&nbsp;&nbsp; (Cornelia)<br>
<br>
* &quot;target/s390x: remove kvm-stub.c&quot; <br>
&nbsp; - add additional comment to explain the function can be<br>
&nbsp;&nbsp;&nbsp; removed (Thomas)<br>
<br>
* &quot;target/s390x: move kvm files into kvm/&quot;<br>
&nbsp;&nbsp; - add change to MAINTAINERS file<br>
<br>
* &quot;target/s390x: split sysemu part of cpu models&quot;<br>
&nbsp;&nbsp; - add change to MAINTAINERS file<br>
<br>
* &quot;MAINTAINERS: update s390x directories&quot;<br>
&nbsp; - removed, squash this in respectively:<br>
&nbsp;&nbsp;&nbsp; #6 target/s390x: start moving TCG-only code to tcg/<br>
&nbsp;&nbsp;&nbsp; #12 target/s390x: move kvm files into kvm/<br>
&nbsp;&nbsp;&nbsp; #13 target/s390x: split sysemu part of cpu models<br>
<br>
v3 -&gt; v4: take s390x part from Claudio and modify for the current master=
<br>
<br>
* &quot;target/s390x: meson: add target_user_arch&quot;<br>
&nbsp; - new patch, add target_user_arch to avoid the proliferation of #ifd=
ef<br>
in target code.<br>
<br>
v2 -&gt; v3: minor changes<br>
<br>
* &quot;hw/s390x: rename tod-qemu.c to tod-tcg.c&quot;: move to the front (=
David)<br>
<br>
* &quot;hw/s390x: only build tod-qemu from the CONFIG_TCG build&quot;<br>
&nbsp; - move just after, use &quot;tod-tcg&quot; instead<br>
<br>
* &quot;hw/s390x: tod: make explicit checks for accelerators when initializ=
ing&quot;<br>
&nbsp; - removed a line break in commit message<br>
<br>
* &quot;target/s390x: start moving TCG-only code to tcg/&quot;<br>
&nbsp; - split the rename s390x-internal.h rename part, do it before the mo=
ve<br>
<br>
* &quot;target/s390x: move kvm files into kvm/&quot;<br>
&nbsp; - fix broken/missing move of trace events<br>
<br>
<br>
Cho, Yu-Chen (13):<br>
&nbsp; target/s390x: meson: add target_user_arch<br>
&nbsp; hw/s390x: rename tod-qemu.c to tod-tcg.c<br>
&nbsp; hw/s390x: only build tod-tcg from the CONFIG_TCG build<br>
&nbsp; hw/s390x: tod: make explicit checks for accelerators when initializi=
ng<br>
&nbsp; target/s390x: remove tcg-stub.c<br>
&nbsp; target/s390x: start moving TCG-only code to tcg/<br>
&nbsp; target/s390x: move sysemu-only code out to cpu-sysemu.c<br>
&nbsp; target/s390x: split cpu-dump from helper.c<br>
&nbsp; target/s390x: make helper.c sysemu-only<br>
&nbsp; target/s390x: use kvm_enabled() to wrap call to kvm_s390_get_hpage_1=
m<br>
&nbsp; target/s390x: remove kvm-stub.c<br>
&nbsp; target/s390x: move kvm files into kvm/<br>
&nbsp; target/s390x: split sysemu part of cpu models<br>
<br>
&nbsp;MAINTAINERS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 7 +-<br>
&nbsp;hw/intc/s390_flic_kvm.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp; 2 +-<br>
&nbsp;hw/s390x/meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 +-<br>
&nbsp;hw/s390x/s390-stattrib-kvm.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;=
 2 +-<br>
&nbsp;hw/s390x/tod-kvm.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +-<br>
&nbsp;hw/s390x/{tod-qemu.c =3D&gt; tod-tcg.c}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +-<br>
&nbsp;hw/s390x/tod.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 9 +-=
<br>
&nbsp;hw/vfio/ap.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 2 +-<br>
&nbsp;include/hw/s390x/tod.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +-<br>
&nbsp;meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 1 +<br>
&nbsp;target/s390x/arch_dump.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp;&nbsp; 2 +-<br>
&nbsp;target/s390x/cpu-dump.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; | 131 ++++++<br>
&nbsp;target/s390x/cpu-sysemu.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 309 +++++++++++++<br>
&nbsp;target/s390x/cpu.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 289 +-----------<br>
&nbsp;target/s390x/cpu_models.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 421 +----------------<br>
&nbsp;target/s390x/cpu_models_sysemu.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 426 ++++++++++++++++++<br>
&nbsp;target/s390x/cpu_models_user.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 20 +<br>
&nbsp;target/s390x/diag.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 7 +-<br>
&nbsp;target/s390x/gdbstub.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +-<br>
&nbsp;target/s390x/helper.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 115 +----<br>
&nbsp;target/s390x/interrupt.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp;&nbsp; 6 +-<br>
&nbsp;target/s390x/ioinst.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +-<br>
&nbsp;target/s390x/kvm-stub.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; | 126 ------<br>
&nbsp;target/s390x/{ =3D&gt; kvm}/kvm.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 4 +-<br>
&nbsp;target/s390x/{ =3D&gt; kvm}/kvm_s390x.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 0<br>
&nbsp;target/s390x/kvm/meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 17 +<=
br>
&nbsp;target/s390x/kvm/trace-events&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 7 +<=
br>
&nbsp;target/s390x/kvm/trace.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp;&nbsp; 1 +<br>
&nbsp;target/s390x/machine.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp;&nbsp; 6 +-<br>
&nbsp;target/s390x/meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp; 42 +-<br>
&nbsp;target/s390x/mmu_helper.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 4 +-<br>
&nbsp;target/s390x/{internal.h =3D&gt; s390x-internal.h} |&nbsp;&nbsp; 8 +<=
br>
&nbsp;target/s390x/sigp.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +-<br>
&nbsp;target/s390x/tcg-stub.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp; 30 --<br>
&nbsp;target/s390x/{ =3D&gt; tcg}/cc_helper.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +-<br>
&nbsp;target/s390x/{ =3D&gt; tcg}/crypto_helper.c&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +-<br>
&nbsp;target/s390x/{ =3D&gt; tcg}/excp_helper.c&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +-<br>
&nbsp;target/s390x/{ =3D&gt; tcg}/fpu_helper.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +-<br>
&nbsp;target/s390x/{ =3D&gt; tcg}/insn-data.def&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 0<br>
&nbsp;target/s390x/{ =3D&gt; tcg}/insn-format.def&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp;&nbsp; 0<br>
&nbsp;target/s390x/{ =3D&gt; tcg}/int_helper.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +-<br>
&nbsp;target/s390x/{ =3D&gt; tcg}/mem_helper.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +-<br>
&nbsp;target/s390x/tcg/meson.build&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 14 +<=
br>
&nbsp;target/s390x/{ =3D&gt; tcg}/misc_helper.c&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +-<br>
&nbsp;target/s390x/{ =3D&gt; tcg}/s390-tod.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 0<br>
&nbsp;target/s390x/{ =3D&gt; tcg}/tcg_s390x.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 0<br>
&nbsp;target/s390x/{ =3D&gt; tcg}/translate.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +-<br>
&nbsp;target/s390x/{ =3D&gt; tcg}/translate_vx.c.inc&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 0<br>
&nbsp;target/s390x/{ =3D&gt; tcg}/vec.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 0<br>
&nbsp;target/s390x/{ =3D&gt; tcg}/vec_fpu_helper.c&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp; 2 +-<br>
&nbsp;target/s390x/{ =3D&gt; tcg}/vec_helper.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +-<br>
&nbsp;target/s390x/{ =3D&gt; tcg}/vec_int_helper.c&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp; 0<br>
&nbsp;target/s390x/{ =3D&gt; tcg}/vec_string_helper.c&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 2 +-<br>
&nbsp;target/s390x/trace-events&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 8 +-<br>
&nbsp;54 files changed, 1012 insertions(+), 1042 deletions(-)<br>
&nbsp;rename hw/s390x/{tod-qemu.c =3D&gt; tod-tcg.c} (98%)<br>
&nbsp;create mode 100644 target/s390x/cpu-dump.c<br>
&nbsp;create mode 100644 target/s390x/cpu-sysemu.c<br>
&nbsp;create mode 100644 target/s390x/cpu_models_sysemu.c<br>
&nbsp;create mode 100644 target/s390x/cpu_models_user.c<br>
&nbsp;delete mode 100644 target/s390x/kvm-stub.c<br>
&nbsp;rename target/s390x/{ =3D&gt; kvm}/kvm.c (99%)<br>
&nbsp;rename target/s390x/{ =3D&gt; kvm}/kvm_s390x.h (100%)<br>
&nbsp;create mode 100644 target/s390x/kvm/meson.build<br>
&nbsp;create mode 100644 target/s390x/kvm/trace-events<br>
&nbsp;create mode 100644 target/s390x/kvm/trace.h<br>
&nbsp;rename target/s390x/{internal.h =3D&gt; s390x-internal.h} (97%)<br>
&nbsp;delete mode 100644 target/s390x/tcg-stub.c<br>
&nbsp;rename target/s390x/{ =3D&gt; tcg}/cc_helper.c (99%)<br>
&nbsp;rename target/s390x/{ =3D&gt; tcg}/crypto_helper.c (98%)<br>
&nbsp;rename target/s390x/{ =3D&gt; tcg}/excp_helper.c (99%)<br>
&nbsp;rename target/s390x/{ =3D&gt; tcg}/fpu_helper.c (99%)<br>
&nbsp;rename target/s390x/{ =3D&gt; tcg}/insn-data.def (100%)<br>
&nbsp;rename target/s390x/{ =3D&gt; tcg}/insn-format.def (100%)<br>
&nbsp;rename target/s390x/{ =3D&gt; tcg}/int_helper.c (99%)<br>
&nbsp;rename target/s390x/{ =3D&gt; tcg}/mem_helper.c (99%)<br>
&nbsp;create mode 100644 target/s390x/tcg/meson.build<br>
&nbsp;rename target/s390x/{ =3D&gt; tcg}/misc_helper.c (99%)<br>
&nbsp;rename target/s390x/{ =3D&gt; tcg}/s390-tod.h (100%)<br>
&nbsp;rename target/s390x/{ =3D&gt; tcg}/tcg_s390x.h (100%)<br>
&nbsp;rename target/s390x/{ =3D&gt; tcg}/translate.c (99%)<br>
&nbsp;rename target/s390x/{ =3D&gt; tcg}/translate_vx.c.inc (100%)<br>
&nbsp;rename target/s390x/{ =3D&gt; tcg}/vec.h (100%)<br>
&nbsp;rename target/s390x/{ =3D&gt; tcg}/vec_fpu_helper.c (99%)<br>
&nbsp;rename target/s390x/{ =3D&gt; tcg}/vec_helper.c (99%)<br>
&nbsp;rename target/s390x/{ =3D&gt; tcg}/vec_int_helper.c (100%)<br>
&nbsp;rename target/s390x/{ =3D&gt; tcg}/vec_string_helper.c (99%)<br>
<br>
-- <br>
2.32.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR0402MB374435690911F44EB68F613FA0099VI1PR0402MB3744_--


