Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A5C38F9DE
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 07:19:17 +0200 (CEST)
Received: from localhost ([::1]:41316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llPTI-0006rW-Jp
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 01:19:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1llPRn-0006A3-Gd
 for qemu-devel@nongnu.org; Tue, 25 May 2021 01:17:43 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:30935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1llPRf-0000eP-Nk
 for qemu-devel@nongnu.org; Tue, 25 May 2021 01:17:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1621919850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=i0KJnL7bxkOFEu9amuqgSbv6vvSGANlE8pxaclqVzCc=;
 b=TMZRFRO1imhDZAkumCvuciTlImlV9zQUxYw+4GGFPGPIDqd3CPaimF0sWkUfaTgsZIMhbS
 9IZ9iTxSYYHgGjkQKWurvGB8CVcPfnooxblcVj/lI3i6+1yhYwIzzu064YvBL87x7pCFjb
 0YjI+xbRCI4hkxTAvGv71/2LlLE3Rbs=
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2050.outbound.protection.outlook.com [104.47.4.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-25-7B5_bvHaNqyEr33rFwCCFA-2; Tue, 25 May 2021 07:17:29 +0200
X-MC-Unique: 7B5_bvHaNqyEr33rFwCCFA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NQH/FbkxrI6CQgbRtBj2AK0fb36/7oQfG0l4DY6A3hdJdliM7BLRtOblaC9qQyNMUSzi2seQNeClRRnyFh6EydCzJpJM1ZnYDqOkq/xqbp5a1mD3aa129anszS6E7kAyf19kcokDsTBUOioMfUWTu3JZia4/49K1lnfKohWM8wwggFjsVOYmkgyDEN12XTuicSXo8yWkFmso/3eL+aGI4GHsTOw+Dxnhw1mcbQ+jtrUUbqwyxEM8EjoMLlCQ/FOri53caxD2lGRBzpQg76DHYBI5xrZB7xW6cB50nAQ5w0fM8Y7QBCF4qftkgaXYJSPkZqJBvuOP4trLyhyaIhTRjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UN0fDdQdAdpW2tZnC5Dc0rpM9wKFyLOsI6XbwdgeDMI=;
 b=JE+QjExKBiqjlUtDVGT7zZ53sXUVG2FGQrrTDIJEHed7kot5iuEkTnqSX+Ntt/jjqlOfpxodp7jIhhbOryNB8tcCwEz2yVb5rWFgWbaDv02A2G22AReki+d9aCl2r5DRwDz1+v4PDYAV7xEaCAbImhdw7sLieAjOgQ5X4Zci+ETHaGSTVLFfKW2FPvSoo4hbRGb6WsqEZs8fYhuuieRQZqIqWF/Gys7xkT5Fygt+MgRCajw91g1mKdoQ9vSosQ3gvtXmXH/JsUvfoWK7ekAHrBGG8tEaH6GyVaMl2tg84FEC0RVCYiFDdcQ2oQa2nPnLx/ZwDAAOBnwhS42k1/e2ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB2989.eurprd04.prod.outlook.com
 (2603:10a6:802:8::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Tue, 25 May
 2021 05:17:27 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::b446:f4ea:d07c:ef5f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::b446:f4ea:d07c:ef5f%7]) with mapi id 15.20.4150.027; Tue, 25 May 2021
 05:17:26 +0000
From: "Cho, Yu-Chen" <acho@suse.com>
To: qemu-devel@nongnu.org,
	qemu-s390x@nongnu.org
CC: cohuck@redhat.com, thuth@redhat.com, richard.henderson@linaro.org,
 cfontana@suse.de, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, pbonzini@redhat.com, acho@suse.com
Subject: [RFC v4 00/14] s390x cleanup
Date: Tue, 25 May 2021 13:16:47 +0800
Message-ID: <20210525051647.17594-1-acho@suse.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [114.24.16.253]
X-ClientProxiedBy: HKAPR03CA0012.apcprd03.prod.outlook.com
 (2603:1096:203:c8::17) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (114.24.16.253) by
 HKAPR03CA0012.apcprd03.prod.outlook.com (2603:1096:203:c8::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.12 via Frontend Transport; Tue, 25 May 2021 05:17:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15e7af82-58b6-4af7-38a6-08d91f3c62e2
X-MS-TrafficTypeDiagnostic: VI1PR04MB2989:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB2989CDC0482E63B2C7F73182A0259@VI1PR04MB2989.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2J2uKYBN67blRgH4p1AmCKur4LmelUxIcrPRVbQcbJ2p3E9ROOfKgJluj3CKM94BERstW1+PIHIblKYVEVBHzUslVtKiO1VQNodAKMJASpaNAKNvv2tb6+C2qAQ5r50WxV07jCDwwKy3tIGudjSq9eDJ50pAD8JAfDvswmO30z2bV9eAmJfEVAJej58Irpt473zwl4d530JU5y2D215cYOdtWvBXF8tXG0WiE6ub8oHM8MEgPzH3GKjeZ3qVgh/q9nA2mSgU5YKXEl9e10fzYMhRnoBE4LNf6ImWLG30k7Q3TDR9Q5zgggSY+hgmRhO3X6UK7/UyXb70u/2bBjk6F4ZtBtUzfkd759Z5IuGcm8GJv58dyBZBoQB1Xy1JxgCAtLo1KDWQKPDKRBryHZ7swZZH9uMxFzjILbRrhx+PqWlLVbFIt9l1LEoZbUcoHdD/+L1ShViawcY5EEpGWlx5JvdO6ypIU+9UB/UmFWy72CBz2x+5nzqEhza8FRAdFx2RbGzOu+mFloF0/TKkQXUSenKXWb/V1H/rgY1GsWvm8BUKAKIN24yhHtKeB3C+azMSb+pYpS+mrFWnS+WpzgP2PTJaAdCFYRKshTatviRn6Ku/Db0sQcn0ANUrpSfgQph5ZZB/yKUB7cz4fvAxUsRybxFepJ3IZ97vKEXDFb68l8bqdabW797AOJUQHEmHKS2PB1l9fIlZL8DzTsv24UDTQGNBde4iRJuy9iXehxo/YnRS+S/mp76zJeklUmkBXGYjsS33M9wb5NXwWQAv6M6mioeyVJWNn9ZY+P9WOERuf42OZQ8yM8GBnETPjDDGvU5X
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(346002)(39830400003)(136003)(396003)(956004)(1076003)(2616005)(7416002)(2906002)(8676002)(6506007)(38350700002)(36756003)(66946007)(38100700002)(6512007)(5660300002)(86362001)(186003)(66476007)(16526019)(83380400001)(66556008)(26005)(52116002)(8936002)(107886003)(6666004)(966005)(6486002)(508600001)(4326008)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ZfyNE/k4qyR71g8i9BC3GkXKaBEgsVp9QKrDyTRPWrDU+SJGKW/kOkLCTMRC?=
 =?us-ascii?Q?FZEG5ZKGoKEoyJdJeC7iHnT3PLwcNS3vzHVm1vFYPWHxLBmqMt04bzqpUQqr?=
 =?us-ascii?Q?AtnSZPvdHhkN/mVQaARE2UoFuvCOl9T/vXKoi4vq/k+6A5f//wnqQvwIxznj?=
 =?us-ascii?Q?IX8Nyj4aoSpSG+iPHl7tldXBgziyPbhia9kIQH7zQxl4XF44+6S0Zn3S8jnc?=
 =?us-ascii?Q?NGQqtCvoqkkd1zxwECnE3yzIzi6glqG6gKaFGKHrAOeiH+/1FoymiTA4XFLZ?=
 =?us-ascii?Q?dmCsCpoNymTpE3orRoJmFDESs0I1t2KI9QdrmAX1OnSvRRWG2wqZt+9Q+lEj?=
 =?us-ascii?Q?KRUET7rfr/QQ6oWZYl7JQai6J4Sszr+nJz345KVPbCz2nP/QEtTQhVpz8b5M?=
 =?us-ascii?Q?83Gf50WTQrYee6PIUUMDuZrR0DcJhIuy36XCceg+FIKK23e+tQKgcTqZ4zxC?=
 =?us-ascii?Q?9joBFdBqf0j1Ck1ctO6GnODekgvy4or7t31Walar5rc0NXbWMOtDuV6z6zCW?=
 =?us-ascii?Q?qAn69vRuR6wQ4cINhGK/Rbk+UNl7DLFQzCixXRtTuAdRmTyh1Q5FqQ8HvJQj?=
 =?us-ascii?Q?/p05hm4sxkog47J5UyESvrwqQIPJUoKL0DACjgWdu6LObku/LHQmcH0BTnTX?=
 =?us-ascii?Q?kO05F2JAnwh0frA96r04KUoK0pCiAZxvotxa1RYDQrndwST++C+fTb2uNFyk?=
 =?us-ascii?Q?ZcqFlLD5vUsL+jIglxtNWd0opDVep5EOSZTOPEu+pjzWE5xSRVMtBe6fYSBH?=
 =?us-ascii?Q?nbGImRfJ2zhvVzir+6+YtNFVaVuBPic4IZvkrPnOLD/lM+HVkKqObQ//agjh?=
 =?us-ascii?Q?y1Dk0OvVmDOs7vFmPW4+b2/pbmH4Pln+WaVLcaRjBT9XeCwSwFPoz2A/jhLd?=
 =?us-ascii?Q?4HMI/04RLIU9LzBlH0eC8DX+66gGcxCund2Jgbyypklsocq0YKJ3XgTJ4J9/?=
 =?us-ascii?Q?T4YHh8GiZZGSGfCeSPJNpJWqXS45ynbs9iSttLPcYiQ5Z5WyGxNFWhs1hfKE?=
 =?us-ascii?Q?HdwV8GdDF6b9oF5QRkYfjty9cXZQfeGn/fkFAcMbmxFfoOdNYHwL7VOL5v8+?=
 =?us-ascii?Q?MvEES/DZc9wyBMIucIaLLv1z/wgf6JiQ3bqzlNEdvQc6HJiOv5NzGpttoUaH?=
 =?us-ascii?Q?k5O1/jZqTpBJAiFX7o/HayE0OnCtyC0117pAAz/kGXEh4drHfW4bdhM8yzfL?=
 =?us-ascii?Q?my6wtCKJT3NrIGBw636HvNjEYM47aJ5YCbhIYItggFk2f+MGSXVztoBlAOho?=
 =?us-ascii?Q?2K7eqYV6MkIQL4vLqAUwZRvF/R/zdTUMXnfr/TMoOCoTvL6RB6TH0zQee8hm?=
 =?us-ascii?Q?eZu2FSy6q0bXb7hEP0Tooych?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e7af82-58b6-4af7-38a6-08d91f3c62e2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2021 05:17:26.8636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tvWxMm8J7yizt5V4C3y5NihHlM8+fVX9GFOSHCo5cjE8wnKTQ4TkjCBlVWewYu+r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2989
Received-SPF: pass client-ip=194.104.109.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


---

v1 -> v2: split more, stubs removal for KVM, kvm/ move, sysemu cpu models

* "hw/s390x: rename tod-qemu.c to tod-tcg.c"
  - new patch (Cornelia)

* "hw/s390x: tod: make explicit checks for accelerators when initializing"
  - now error out and abort() for an unknown accelerator. (Cornelia)

* "target/s390x: remove tcg-stub.c" : new patch split from
  "target/s390x: start moving TCG-only code to tcg/" (Cornelia)

* "target/s390x: use kvm_enabled() to wrap call to kvm_s390_get_hpage_1m"
  - new patch, allows the removal of kvm stubs

* "target/s390x: remove kvm-stub.c"
  - new patch, we do not need stubs, as all calls are wrapped by
    kvm_enabled(), and all prototypes are visible.

* "target/s390x: move kvm files into kvm/"
  - new patch

* "target/s390x: split sysemu part of cpu models"
  - new patch

* "MAINTAINERS: update s390x directories"
  - new patch


Pre-requisite series (not really needed for now, only in further work down =
the line):

https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg07461.html

Motivation and higher level steps:

https://lists.gnu.org/archive/html/qemu-devel/2020-05/msg04628.html

Comments welcome, thanks,
                        AL

Cho, Yu-Chen (14):
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
  MAINTAINERS: update s390x directories

 MAINTAINERS                                   |   8 +-
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
 target/s390x/cpu-sysemu.c                     | 304 +++++++++++++
 target/s390x/cpu.c                            | 286 +-----------
 target/s390x/cpu_models.c                     | 421 +----------------
 target/s390x/cpu_models_sysemu.c              | 426 ++++++++++++++++++
 target/s390x/cpu_models_user.c                |  20 +
 target/s390x/diag.c                           |   7 +-
 target/s390x/gdbstub.c                        |   2 +-
 target/s390x/helper.c                         | 113 +----
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
 54 files changed, 1009 insertions(+), 1036 deletions(-)
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
2.31.1


