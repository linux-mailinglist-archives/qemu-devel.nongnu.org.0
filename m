Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F1115C048
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Feb 2020 15:27:36 +0100 (CET)
Received: from localhost ([::1]:53144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2FSp-0000mX-CJ
	for lists+qemu-devel@lfdr.de; Thu, 13 Feb 2020 09:27:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57045)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Filip.Bozuta@rt-rk.com>) id 1j2FRb-00083q-Bl
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 09:26:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Filip.Bozuta@rt-rk.com>) id 1j2FRY-0007Qo-6s
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 09:26:17 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:47018 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Filip.Bozuta@rt-rk.com>)
 id 1j2FRY-00057j-0C
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 09:26:16 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id E592E1A20D6;
 Thu, 13 Feb 2020 15:25:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw493-lin.domain.local (rtrkw493-lin.domain.local
 [10.10.14.93])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 9F0EB1A200A;
 Thu, 13 Feb 2020 15:25:10 +0100 (CET)
From: Filip Bozuta <Filip.Bozuta@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] tests/tcg/multiarch: Add tests for implemented real
Date: Thu, 13 Feb 2020 15:25:03 +0100
Message-Id: <1581603905-21565-1-git-send-email-Filip.Bozuta@rt-rk.com>
X-Mailer: git-send-email 2.7.4
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series covers tests for implemented rtc and alsa timer ioctls. The names
of ioctls that are covered by these tests can be found in patch descriptions.
The functionalities of each ioctl that is tested can be found in patches that
implement them.

Some of the features that are accessible through these ioctls are not supported
on all test host pc's. These tests were written so that the implemented ioctls
can be properly tested on pc's that support all of their features.

Both rtc and alsa timer test folders have separate files for manually written
and remotely obtained tests. Tests that were obtained remotely run multiple ioctl
tests at once, while the manually written tests can be used to run both individual 
and multiple ioctl tests based on the command specified when running the test.

Filip Bozuta (2):
  tests/tcg/multiarch: Add tests for implemented rtc ioctls
  tests/tcg/multiarch: Add tests for implemented alsa sound timer ioctls

 .../manual-test/alsa-timer-ioctl-manual-test.c     | 294 +++++++++++++++++
 .../alsa-timer-ioctl-tests/remote-test/timer.c     | 158 +++++++++
 .../manual-test/rtc-ioctl-manual-test.c            | 352 +++++++++++++++++++++
 .../rtc-ioctl-tests/remote-test/rtc-test.c         | 226 +++++++++++++
 4 files changed, 1030 insertions(+)
 create mode 100644 tests/tcg/multiarch/alsa-timer-ioctl-tests/manual-test/alsa-timer-ioctl-manual-test.c
 create mode 100644 tests/tcg/multiarch/alsa-timer-ioctl-tests/remote-test/timer.c
 create mode 100644 tests/tcg/multiarch/rtc-ioctl-tests/manual-test/rtc-ioctl-manual-test.c
 create mode 100644 tests/tcg/multiarch/rtc-ioctl-tests/remote-test/rtc-test.c

-- 
2.7.4


