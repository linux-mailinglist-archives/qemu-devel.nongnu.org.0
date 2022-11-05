Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3D361DDEF
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 20:54:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orPDa-0008CF-IT; Sat, 05 Nov 2022 15:52:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1orPDY-0008BU-Te; Sat, 05 Nov 2022 15:52:36 -0400
Received: from mout.kundenserver.de ([212.227.17.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1orPDX-0003Zp-1w; Sat, 05 Nov 2022 15:52:36 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MDPuq-1oguol04s2-00AW93; Sat, 05
 Nov 2022 20:52:29 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 0/7] Trivial branch for 7.2 patches
Date: Sat,  5 Nov 2022 20:52:20 +0100
Message-Id: <20221105195227.354769-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:AxNwMz8Hh7V73idUpDDu8RxxJlkmZUtyHcQH3gkYFvih1ZM424k
 BKhKO+1KlQCzTaodrmt8s75laitO5j+bgxEVC30qLkcrRhg+2oE1PnAnNaaXy6GfIvHIaJH
 gHjVT82L7BrEZhLdhNiOP9zUdc7JB5HaZWFeMN2POnoGDOHWY5HVeJuBcNN3GXZ3czPO3oI
 aqm1IuhhgFQUHjyqmCfSQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SofKvfEUtT8=:VnXwDx2CqSCugeB0kT6siR
 pRwaBE/Zu9sgVB9XPVJYoKxtovl9K1l2Imd1ac4H749TeghzRL8UKo0BzSsDLm2+JQK2r6frg
 amtJ3u7mymZmBJRDdefTp5Huhc4Cc6yTlIdy1Yj7gUM6oXavAsX32TAti2nXspr07qLNpfQqg
 d50HuIDcLqBx90F1hRiW/jbAVWCm8866TTU23Mx3VcTRbSi1xbQuUWGs8xBm/f0gyFmG7l3hK
 idVkj3CWHEYe85nLSCF9oDKgB2W3nS1OXj9957o68kFcpXst5NXZK46jsVcNtcPm4w3DvoLST
 bU/wBj93vmkHTVjbpnTgPJr2D00ANC5Y+bCK5k8ZZvxwPuqg42Rllnh2JIZYmEFJzloXtEhWf
 mHuyRqqqQ8a37AVCBAU7kTokh+PHsBleI3+rri2KN6tUlp/ynTeHWKBaYV9gVZ1qg5hPBuIy2
 oHjDbM2hKZ6HjPuclKYW5HCdJqMBzs/DUc9rf51fnYVm1fJreO8nGtWSAoK3P56E1RSJLijAd
 glNhzL0lxWI/DC3vUSvQk1Vb+RjZsq07yYYl5hwFKUPUKWE28zyZJg2tiOrZHWqiFvnwc7btT
 ycy6SzophT4WCfZSGS2H8lBA/yWZvuDQ7hZ+V+gkNBpDcB4BDB7BfYfnnx49yKQZO/gnNkQv0
 +vl0VVZzQ8zPv/xs8ZMV23q56cSBkpfF+7F8/1BQpZoQ8YD7ZadYXlPoWnyizCGbv+qkA8Fgi
 uqqmqLcQOU+ui+7ZYaK2XkQHP2zvHp3ibCiS/Thnhr1fomQTU+SOUvIOQ4qyz5szPOY65yBnV
 lGjiTX9
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 6295a58ad1b73985b9c32d184de7d2ed1fbe1774:

  Merge tag 'pull-target-arm-20221104' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-11-04 11:01:17 -0400)

are available in the Git repository at:

  https://gitlab.com/laurent_vivier/qemu.git tags/trivial-branch-for-7.2-pull-request

for you to fetch changes up to 5a820d5d07cb101752c731799a326648a5aa185a:

  tests/unit: simpler variable sequence for test-io-channel (2022-11-05 20:35:45 +0100)

----------------------------------------------------------------
Pull request trivial branch 20221103-v2

----------------------------------------------------------------

Alex Bennée (1):
  tests/unit: simpler variable sequence for test-io-channel

Chuck Zmudzinski (1):
  xen/pt: fix syntax error that causes FTBFS in some configurations

Han Han (1):
  qapi: virtio: Fix the introduced version

Philippe Mathieu-Daudé (3):
  target/m68k: Rename qregs.def -> qregs.h.inc
  target/s390x: Rename insn-data/format.def -> insn-data/format.h.inc
  target/tricore: Rename csfr.def -> csfr.h.inc

Stefan Weil (1):
  Fix some typos in documentation and comments

 docs/devel/testing.rst                        |  2 +-
 docs/system/arm/cpu-features.rst              |  2 +-
 docs/system/loongarch/loongson3.rst           |  2 +-
 docs/tools/virtiofsd.rst                      |  2 +-
 hw/xen/meson.build                            |  2 +-
 include/exec/memory.h                         |  2 +-
 qapi/qom.json                                 |  2 +-
 qapi/virtio.json                              | 34 +++++++++----------
 qemu-options.hx                               | 10 +++---
 qga/qapi-schema.json                          |  2 +-
 target/m68k/{qregs.def => qregs.h.inc}        |  0
 target/m68k/translate.c                       |  4 +--
 .../tcg/{insn-data.def => insn-data.h.inc}    |  2 +-
 .../{insn-format.def => insn-format.h.inc}    |  0
 target/s390x/tcg/translate.c                  | 10 +++---
 target/tricore/{csfr.def => csfr.h.inc}       |  0
 target/tricore/translate.c                    |  4 +--
 tests/qtest/libqtest.h                        |  2 +-
 tests/unit/test-io-channel-command.c          | 14 +++-----
 19 files changed, 45 insertions(+), 51 deletions(-)
 rename target/m68k/{qregs.def => qregs.h.inc} (100%)
 rename target/s390x/tcg/{insn-data.def => insn-data.h.inc} (99%)
 rename target/s390x/tcg/{insn-format.def => insn-format.h.inc} (100%)
 rename target/tricore/{csfr.def => csfr.h.inc} (100%)

-- 
2.37.3


