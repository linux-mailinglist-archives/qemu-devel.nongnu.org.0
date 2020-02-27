Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E85A1718BA
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 14:31:04 +0100 (CET)
Received: from localhost ([::1]:59602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7JFn-0003Gv-4c
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 08:31:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33093)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1j7JDq-0001Na-Sf
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 08:29:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1j7JDp-0005hM-7i
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 08:29:02 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:37077 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1j7JDp-0004Qi-1D
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 08:29:01 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id F19B21A209C;
 Thu, 27 Feb 2020 14:27:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.14.106])
 by mail.rt-rk.com (Postfix) with ESMTPSA id C852D1A203E;
 Thu, 27 Feb 2020 14:27:50 +0100 (CET)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] MIPS queue for February 27th, 2020
Date: Thu, 27 Feb 2020 14:27:31 +0100
Message-Id: <1582810056-22646-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 89.216.37.149
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
Cc: peter.maydell@linaro.org, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

The following changes since commit db736e0437aa6fd7c1b7e4599c17f9619ab6b8=
37:

  Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream' into s=
taging (2020-02-25 13:31:16 +0000)

are available in the git repository at:

  https://github.com/AMarkovic/qemu tags/mips-queue-feb-27-2020

for you to fetch changes up to 0484d9d4fbe9beacd3dd36fdf7fc3e14940bf078:

  tests/acceptance: Count multiple Tux logos displayed on framebuffer (20=
20-02-27 14:19:07 +0100)

----------------------------------------------------------------

MIPS queue for February 27th, 2020

  - Adjusting maintainership of MIPS KVM CPUs
  - Machine memory and interrupt-related minor improvements
  - Acceptance test for SMP support on Malta with I6400 CPU

----------------------------------------------------------------

Aleksandar Markovic (1):
  MAINTAINERS: Reactivate MIPS KVM CPUs

James Hogan (1):
  MAINTAINERS: Orphan MIPS KVM CPUs

Philippe Mathieu-Daud=C3=A9 (3):
  hw/mips/mips_int: Simplify cpu_mips_irq_init_cpu()
  hw/mips: Use memory_region_init_rom() with read-only regions
  tests/acceptance: Count multiple Tux logos displayed on framebuffer

 hw/mips/mips_fulong2e.c                |   3 +-
 hw/mips/mips_int.c                     |   2 +-
 hw/mips/mips_jazz.c                    |   6 +-
 hw/mips/mips_mipssim.c                 |   3 +-
 hw/mips/mips_r4k.c                     |   3 +-
 MAINTAINERS                            |   6 +-
 tests/acceptance/machine_mips_malta.py | 118 +++++++++++++++++++++++++++=
++++++
 7 files changed, 127 insertions(+), 14 deletions(-)
 create mode 100644 tests/acceptance/machine_mips_malta.py

--=20
2.7.4


