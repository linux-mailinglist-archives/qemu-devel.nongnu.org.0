Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C616B226AD
	for <lists+qemu-devel@lfdr.de>; Sun, 19 May 2019 12:58:52 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46905 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSJWl-0006qk-UD
	for lists+qemu-devel@lfdr.de; Sun, 19 May 2019 06:58:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56589)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hSJRo-0003ET-6w
	for qemu-devel@nongnu.org; Sun, 19 May 2019 06:53:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hSJRl-0001oI-Up
	for qemu-devel@nongnu.org; Sun, 19 May 2019 06:53:44 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:42710 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1hSJRl-00015k-N6
	for qemu-devel@nongnu.org; Sun, 19 May 2019 06:53:41 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id 788351A2015;
	Sun, 19 May 2019 12:52:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
	[10.10.13.43])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 5CF951A0F04;
	Sun, 19 May 2019 12:52:33 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Sun, 19 May 2019 12:52:14 +0200
Message-Id: <1558263144-8776-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PULL 00/10] MIPS queue for May 19th, 2019
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

The following changes since commit 1b46b4daa6fbf45eddcf77877379a0afac341d=
f9:

  Merge remote-tracking branch 'remotes/kraxel/tags/ui-20190517-pull-requ=
est' into staging (2019-05-17 17:25:19 +0100)

are available in the git repository at:

  https://github.com/AMarkovic/qemu tags/mips-queue-may-19-2019

for you to fetch changes up to 71074d1d2fae9a0c8dab87c5bb5271a71d6cb7ab:

  mips: Decide to map PAGE_EXEC in map_address (2019-05-19 12:11:46 +0200=
)

----------------------------------------------------------------

MIPS queue for May 19th, 2019

  * A fix for HelenOS boot hang (related to the flag PAGE_EXEC)
  * A set of fixes for emulation of MSA ASE on big endian hosts
  * Improved usage of object_initialize() and object_initialize_child()
  * Better handling of 'div by zero' cases in MSA ASE

----------------------------------------------------------------

Jakub Jerm=C3=A1=C5=99 (1):
  mips: Decide to map PAGE_EXEC in map_address

Mateja Marjanovic (7):
  target/mips: Make the results of DIV_<U|S>.<B|H|W|D> the same as on
    hardware
  target/mips: Make the results of MOD_<U|S>.<B|H|W|D> the same as on
    hardware
  target/mips: Fix MSA instructions LD.<B|H|W|D> on big endian host
  target/mips: Fix MSA instructions ST.<B|H|W|D> on big endian host
  target/mips: Refactor and fix COPY_S.<B|H|W|D> instructions
  target/mips: Refactor and fix COPY_U.<B|H|W> instructions
  target/mips: Refactor and fix INSERT.<B|H|W|D> instructions

Philippe Mathieu-Daud=C3=A9 (2):
  hw/mips: Use object_initialize() on MIPSCPSState
  hw/mips: Use object_initialize_child for correct reference counting

 hw/mips/boston.c         |  25 ++--
 hw/mips/cps.c            |  20 +--
 hw/mips/mips_malta.c     |  17 +--
 target/mips/helper.c     |  13 +-
 target/mips/helper.h     |  16 +-
 target/mips/msa_helper.c | 191 ++++++++++++++++--------
 target/mips/op_helper.c  | 376 +++++++++++++++++++++++++++++++++++++++++=
+-----
 target/mips/translate.c  |  59 +++++++-
 8 files changed, 574 insertions(+), 143 deletions(-)

--=20
2.7.4


