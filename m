Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD72533AC9
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 12:44:35 +0200 (CEST)
Received: from localhost ([::1]:60708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntoVG-0008PH-N5
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 06:44:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntoRr-0005gi-0X
 for qemu-devel@nongnu.org; Wed, 25 May 2022 06:41:03 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:54437)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1ntoRp-0002ET-67
 for qemu-devel@nongnu.org; Wed, 25 May 2022 06:41:02 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M7KKA-1nuvyA3Izc-007mGO; Wed, 25
 May 2022 12:40:58 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 0/8] Linux user for 7.1 patches
Date: Wed, 25 May 2022 12:40:49 +0200
Message-Id: <20220525104057.543354-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4Gn85shOh5BVhuuxFLUOvzYb6LMKrcYTTx0+rhCKXRoRaHm/1Bi
 bzJwlysVcP5plWeOHgzDKU+gwRKnSaejAGl+I8pV16VLkCOFZIMYx6520JOAdgRWYxl/AEi
 XJY2v9rLOorpqpHptrhOZFqWzTsI2WeF3UvYX6J6HBMZ5+2rvVnGkBMK2V4qmX+vch9veF5
 S6iaDfT9gohYCojgHtrUA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:b+lSF8J2Lzg=:wf0LB+yLta4CdhJULfZ23X
 cvI03JFTZ2r7NK0JRMkQcFS6l1Nk4XEUQ3dV9DkOHxJw6OFqP6baxdAmQuQsSx3J2YvUtFJZh
 n/Zn6HPvrK0M5U8W77zWr/GFdhL1jgsSifWgxayRa6x+mflb9eIHWqIjjK+fWAvdu/cAah8kV
 4UcpXfc/F8sk8cxM4FaG8S8mpWS1eNf5cc+PPSrAwDIGvUOSLKwbJTR0b9gYw4h0BBskcohCu
 KMbLugkDH+T7os3oKkeOxQHdqi9nxPT92HrCj8JMhWzyTzdRVLFiyAm1RXE3U3q5ZFBi4YABZ
 6O1yc/cH4GemJKp22sAJYFEZXUh3SGCa8vu0I9JCV3BVfXTJSMbwo3SSb8blm6927mUbSlyoU
 RzlIwKUNmxQXdMIH2jYpPLZvUK7jo8vELBPUYppq7RDCLE/aeSPKp4lE7mTLATt52NI9IreRN
 iv7+iUEOifBwOhgIvT1of54BHTVWohfJCpd020oWocgZprgojvkrRrVo01IXWCFeCB5GMRZ4Y
 J6AibgDOOV2pjD2DutF6uJqDMT3IG479FeBsGbdn0I0zyhYMDTavdVHopkLZ2HKXp4JHxNcq3
 Zy4nGp/7lDB5MEnBa1mCdSugcH0jrB6/QZ5kR9fBGHFLtgipxPIEWvviOqRjKAi4pOpjOHsep
 vyCmBWLj6w0fOCShWgLO4vBFPzfZLwcYOup+vWXYOqcMi2+kxdWXPfDTWuvvLjuQKl46kJR5H
 Sz2cYtxJ+sNHGkzJpT6LGonr6X4Kr7N+gYmSOg==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 3757b0d08b399c609954cf57f273b1167e5d7a8d:

  Merge tag 'pull-request-2022-05-18' of https://gitlab.com/thuth/qemu into staging (2022-05-20 08:04:30 -0700)

are available in the Git repository at:

  https://gitlab.com/laurent_vivier/qemu.git tags/linux-user-for-7.1-pull-request

for you to fetch changes up to 565a84c1e61acb6e2bce03e5ca88b5ce400231ca:

  linux-user/host/s390: Treat EX and EXRL as writes (2022-05-23 22:54:02 +0200)

----------------------------------------------------------------
Pull request linux-user 20220525

s390x fixes
CPUArchState cleanup
elfload cleanup
fix for uclibc-ng and by musl

----------------------------------------------------------------

Fabrice Fontaine (1):
  linux-user/syscall.c: fix build without RLIMIT_RTTIME

Ilya Leoshkevich (3):
  linux-user/s390x: Fix unwinding from signal handlers
  tests/tcg/s390x: Test unwinding from signal handlers
  linux-user/host/s390: Treat EX and EXRL as writes

Philippe Mathieu-Daudé (3):
  linux-user/elfload: Remove pointless non-const CPUArchState cast
  linux-user: Have do_syscall() use CPUArchState* instead of void*
  linux-user: Remove pointless CPU{ARCH}State casts

Richard Henderson (1):
  linux-user: Clean up arg_start/arg_end confusion

 linux-user/elfload.c                       |  12 +-
 linux-user/include/host/s390/host-signal.h |   7 +
 linux-user/linuxload.c                     |  12 +-
 linux-user/main.c                          |   4 +-
 linux-user/qemu.h                          |  12 +-
 linux-user/s390x/signal.c                  |   5 +
 linux-user/strace.c                        | 202 ++++++++++-----------
 linux-user/strace.h                        |   4 +-
 linux-user/syscall.c                       |  83 +++++----
 linux-user/uname.c                         |   4 +-
 linux-user/uname.h                         |   2 +-
 linux-user/user-internals.h                |  18 +-
 semihosting/arm-compat-semi.c              |   4 +-
 tests/tcg/s390x/signals-s390x.c            |  69 +++++--
 14 files changed, 252 insertions(+), 186 deletions(-)

-- 
2.36.1


