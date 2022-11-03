Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B14618416
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:19:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqcvz-0002E0-Fj; Thu, 03 Nov 2022 12:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqcuN-0000ff-5u; Thu, 03 Nov 2022 12:17:35 -0400
Received: from mout.kundenserver.de ([212.227.126.134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oqcuK-00084L-Gh; Thu, 03 Nov 2022 12:17:34 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MNss4-1ofZEO2BkO-00OGCU; Thu, 03
 Nov 2022 17:17:28 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 00/10] Trivial branch for 7.2 patches
Date: Thu,  3 Nov 2022 17:17:17 +0100
Message-Id: <20221103161727.4116147-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:CS/ef4TvcNMijeb9VfAa9DX4Y4p0ywcrvbe8CLqkgOM/o10/bFy
 FLvrTgYOpDojRsZxrVVmH+igUQpPjYXBA3N6h33CoQjKxjEyLMgP3VEDI58m95jZGZLSvN6
 CcZCH2LJAr89syuxTDxDQ2dAY1knC3NLtNW+6eJishRAwkxa5ksy1L4eY0vrsqRqSuP7eKa
 dB49qQeR25GpT6O6HYxzQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+Z3lqpX7xQM=:1m4Im9d/fhMkEBU/icmkgJ
 m0m9DmBHBHaOCHM/eAw6qOYFbsPvRm8lSBf/fsB4HICMSCZ69r+CQDRIoC3kdLgv0oExqlcyl
 DlnGwkt9k60msMK5s1hqrswZOm7BbEunFIe3nelD3wpl/408xKG/wvnJjBQWe11CsTsH3uPoM
 /6sUXFrMF8ASxzDMuGuy1EaGIZ3zRXK6pbkf0gKYfJenyNPuGck9LdEvm9x2uYaXWjyz6RrdK
 gpLw8sgsF3sot2T0elRCJMKV0lrbWpzPcvf4RRK/zL7PrO1kzQTjQ/MVc2WtO/7tfdSC5gA25
 s7j2H2fyjq2o2aqa1mw6s3qs1PeVuudK+zAyBJ51Yal04frgabfNnECQ7O/hyFt75cf816nyj
 ofd/2YNb88zU3YhM995MX2uPJ3nBny2z/FVjlhfNE3TJM6FPr+kna7fjyGcRr7NSE+uDBb3gl
 S7JVXi7HViW74ltXajDasg9UD5Nm8nhvFNCTWWAPOOEWBxvHC7eJ13jO+zQ2bE+QcI+sJ6kJP
 KSND8K6fTJBJHW2Pzg2nrrgBgsn/xn8xYK97trx7cZWMhuJ2/ZWDy2d3n3YU6Ba08FRvXv9+i
 ciHg4Tl01Fz7zL6WBLNVC/zTBIMe4B44T/sf8OE5VFAGa18TIAEY8oYM9q8+nkppMKFpWcGPj
 k+eSiEuGwn54+lvxWLlN2sSOqztSCc8uKtk8gEAynFRJCAxFdDCyg2Npfa3ObDQMjm7fWDSNn
 kOCU1bOl+Wg1tVgn6OFM2XPMEkJiwuuZ/fXOlXwwypsHV/5SncAvLGmfpUjT2Kct661inJpSO
 Wn/tuTH
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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

The following changes since commit a11f65ec1b8adcb012b89c92819cbda4dc25aaf1:

  Merge tag 'block-pull-request' of https://gitlab.com/stefanha/qemu into staging (2022-11-01 13:49:33 -0400)

are available in the Git repository at:

  https://gitlab.com/laurent_vivier/qemu.git tags/trivial-branch-for-7.2-pull-request

for you to fetch changes up to 489db95896b86dacdde9dab1de84745880449e37:

  tests/unit: simpler variable sequence for test-io-channel (2022-11-03 17:16:34 +0100)

----------------------------------------------------------------
Pull request trivial branch 20221103

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

Stefan Weil (4):
  Fix some typos in documentation and comments
  libvhost-user: Fix wrong type of argument to formatting function
    (reported by LGTM)
  libvhost-user: Fix format strings
  libvhost-user: Add format attribute to local function vu_panic

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
 subprojects/libvhost-user/libvhost-user.c     | 19 ++++++++---
 target/m68k/{qregs.def => qregs.h.inc}        |  0
 target/m68k/translate.c                       |  4 +--
 .../tcg/{insn-data.def => insn-data.h.inc}    |  2 +-
 .../{insn-format.def => insn-format.h.inc}    |  0
 target/s390x/tcg/translate.c                  | 10 +++---
 target/tricore/{csfr.def => csfr.h.inc}       |  0
 target/tricore/translate.c                    |  4 +--
 tests/qtest/libqtest.h                        |  2 +-
 tests/unit/test-io-channel-command.c          | 14 +++-----
 20 files changed, 60 insertions(+), 55 deletions(-)
 rename target/m68k/{qregs.def => qregs.h.inc} (100%)
 rename target/s390x/tcg/{insn-data.def => insn-data.h.inc} (99%)
 rename target/s390x/tcg/{insn-format.def => insn-format.h.inc} (100%)
 rename target/tricore/{csfr.def => csfr.h.inc} (100%)

-- 
2.37.3


