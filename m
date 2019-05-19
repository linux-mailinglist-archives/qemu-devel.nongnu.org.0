Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA05822724
	for <lists+qemu-devel@lfdr.de>; Sun, 19 May 2019 18:17:17 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50677 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSOUu-00061T-GO
	for lists+qemu-devel@lfdr.de; Sun, 19 May 2019 12:17:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44359)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hSOTN-0005I5-Vv
	for qemu-devel@nongnu.org; Sun, 19 May 2019 12:15:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hSOTN-0005jS-1G
	for qemu-devel@nongnu.org; Sun, 19 May 2019 12:15:41 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:52692 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1hSOTM-0005hi-Fq
	for qemu-devel@nongnu.org; Sun, 19 May 2019 12:15:40 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id 77A271A202F;
	Sun, 19 May 2019 18:15:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
	[10.10.13.43])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 550601A1182;
	Sun, 19 May 2019 18:15:37 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Sun, 19 May 2019 18:15:21 +0200
Message-Id: <1558282527-22183-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v6 0/6] linux-user: A set of miscellaneous
 patches
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
Cc: lvivier@redhat.com, thuth@redhat.com, jcmvbkbc@gmail.com,
	arikalo@wavecomp.com, daniel.santos@pobox.com,
	amarkovic@wavecomp.com, nchen@wavecomp.com, philmd@redhat.com,
	aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

This is a collection of misc patches for Linux user that I recently
accumulated from variuous sources. All of them originate from problems
observed on mips target. However, these changes actually affect and fix
problems on multiple targets.

v5->v6:

  - fixed a mistake in patch #4
  - improved commit messages in patches #4 and #6

v4->v5:

  - added the patch on statx() support
  - improved the patch on IPV6_<ADD|DROP>_MEMBERSHIP to take into
    account the possibility of different names for a field
  - minor corrections in commit messages

v3->v4:

  - improved commit messages (fixed some typos, improved relevance)

v2->v3:

  - updated and improved commit messages
  - added IPV6_DROP_MEMBERSHIP support to the patch on setsockopt()'s
    option

v1->v2:

  - added the patch on setsockopt()'s option IPV6_ADD_MEMBERSHIP
  - improved the commit message of interp_info sanitizing patch


Aleksandar Markovic (2):
  linux-user: Fix support for SIOCATMARK and SIOCGPGRP ioctls for xtensa
  linux-user: Add support for SIOCSPGRP ioctl for all targets

Aleksandar Rikalo (1):
  linux-user: Add support for statx() syscall

Daniel Santos (1):
  linux-user: Sanitize interp_info and, for mips only, init field fp_abi

Neng Chen (2):
  linux-user: Add support for SIOC<G|S>IFPFLAGS ioctls for all targets
  linux-user: Add support for setsockopt() options
    IPV6_<ADD|DROP>_MEMBERSHIP

 linux-user/elfload.c      |   5 ++
 linux-user/ioctls.h       |   3 +
 linux-user/syscall.c      | 158 +++++++++++++++++++++++++++++++++++++++++++++-
 linux-user/syscall_defs.h |  45 ++++++++++++-
 4 files changed, 209 insertions(+), 2 deletions(-)

-- 
2.7.4


