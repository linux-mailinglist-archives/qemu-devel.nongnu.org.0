Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E4E381773
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 12:07:17 +0200 (CEST)
Received: from localhost ([::1]:51334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhrCQ-0008TP-J5
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 06:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhr98-0005i4-13; Sat, 15 May 2021 06:03:46 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:38701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lhr94-0006K1-O8; Sat, 15 May 2021 06:03:45 -0400
Received: from quad ([82.142.31.78]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MzQc2-1lLlus0GVE-00vPIH; Sat, 15
 May 2021 12:03:38 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 00/16] Trivial branch for 6.1 patches
Date: Sat, 15 May 2021 12:03:19 +0200
Message-Id: <20210515100335.1245468-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CrDRLrubcODRx5cOiJqQI3rnCpZk855C/5fKBMZLlLxyJAc4fDs
 woVdJQJSuISPzpoyn2VNwBo+xOdKG8toM0xhzEG9MTS9YtX0TJR8gyDY+cpys5kkpW2XQ3m
 irMMBwM1SDsfLHGEIkm+VjdsTDb322jM7P0mM4bx94p5PlhVXpiq7DCr8EQwHxzrnzPLcNX
 I5JLN/MrYLi9E3IAWsyHg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jYyLzjIR/7M=:u6IT7gcvMHjrNQaI+nH//g
 tGsKQbDsXiYIqW0U+H3XWS+3EuEFTz6VSHp0TV2DXT1sc3EAWKPLugcDEBNwuOH7e2r/HgjK6
 R+HG5nJOpmHolxcpTHIzjZ+/bxbEBEw4ujhV1LD4dxDCcJZQz3rlazW775+FyCNeDMJyTnyvz
 oaftUvD1xOAqlxvg+H2h/86pah5ToxszEPphkQok6cGS3uveQOhX0M7VWzt+ia9nhFwitmGc2
 mkva2lInTWtNI/xZffTHAAgd84mFkEW7shxQ/ENKM+q5Y9U9PA+ZCmumopOctkin8h74+JDsb
 7CmETr+NHWsJMHAsECcK+L2YGyDROd/oRBf0r6yTzVZuKSkPLz8sRxxrVxqhiOjjG+Uh2oaMv
 BDrxWypwdPKtqpGE8YpBV65g6Lj/Qs1WDC+mF6Y6JSvrkkFAyyDOhTlTNRtZwFWMdV8DFZniQ
 YO5/qlrkn6pyfG4xH0UrSsYW/wi9Mge6sI1OAVn/+3gPa9PuNeu9wZeEgwdU2BDyfXEzw3+V3
 j19fCYPYwqhTOtcmRWcrpA=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 3e9f48bcdabe57f8f90cf19f01bbbf3c86937267=
:=0D
=0D
  Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-2=
0210511' into staging (2021-05-12 17:31:52 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/trivial-branch-for-6.1-pull-request=
=0D
=0D
for you to fetch changes up to 29f9c636894c462fa54fad08049e51877905e93b:=0D
=0D
  target/avr: Ignore unimplemented WDR opcode (2021-05-13 19:18:42 +0200)=0D
=0D
----------------------------------------------------------------=0D
Pull request trivial-branch 20210515=0D
=0D
----------------------------------------------------------------=0D
=0D
Frederic Konrad (1):=0D
  hw/avr/atmega.c: use the avr51 cpu for atmega1280=0D
=0D
Greg Kurz (1):=0D
  virtiofsd: Fix check of chown()'s return value=0D
=0D
Jagannathan Raman (1):=0D
  multi-process: Avoid logical AND of mutually exclusive tests=0D
=0D
Michael Tokarev (2):=0D
  qapi: spelling fix (addtional)=0D
  hw/gpio/aspeed: spelling fix (addtional)=0D
=0D
Philippe Mathieu-Daud=C3=A9 (10):=0D
  backends/tpm: Replace qemu_mutex_lock calls with QEMU_LOCK_GUARD=0D
  hw/virtio: Pass virtio_feature_get_config_size() a const argument=0D
  virtio-blk: Constify VirtIOFeature feature_sizes[]=0D
  virtio-net: Constify VirtIOFeature feature_sizes[]=0D
  hw/timer/etraxfs_timer: Convert to 3-phase reset (Resettable=0D
    interface)=0D
  hw/rtc/mc146818rtc: Convert to 3-phase reset (Resettable interface)=0D
  hw/mem/meson: Fix linking sparse-mem device with fuzzer=0D
  hw/pci-host: Do not build gpex-acpi.c if GPEX is not selected=0D
  target/sh4: Return error if CPUClass::get_phys_page_debug() fails=0D
  target/avr: Ignore unimplemented WDR opcode=0D
=0D
Stefano Garzarella (1):=0D
  cutils: fix memory leak in get_relocated_path()=0D
=0D
 backends/tpm/tpm_emulator.c   | 34 +++++++++++++---------------=0D
 hw/avr/atmega.c               |  2 +-=0D
 hw/block/virtio-blk.c         |  2 +-=0D
 hw/gpio/aspeed_gpio.c         |  2 +-=0D
 hw/mem/meson.build            |  3 ++-=0D
 hw/net/virtio-net.c           |  2 +-=0D
 hw/pci-host/meson.build       |  2 +-=0D
 hw/remote/mpqemu-link.c       |  2 +-=0D
 hw/rtc/mc146818rtc.c          | 42 ++++++++++++++++++-----------------=0D
 hw/timer/etraxfs_timer.c      | 14 +++++++++---=0D
 hw/virtio/virtio.c            |  2 +-=0D
 include/hw/virtio/virtio.h    |  2 +-=0D
 qapi/qom.json                 |  4 ++--=0D
 target/avr/helper.c           |  6 +----=0D
 target/sh4/helper.c           |  7 ++++--=0D
 tools/virtiofsd/fuse_virtio.c |  4 ++--=0D
 util/cutils.c                 |  2 +-=0D
 17 files changed, 69 insertions(+), 63 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

