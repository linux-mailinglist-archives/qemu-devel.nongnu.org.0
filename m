Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB94030D77
	for <lists+qemu-devel@lfdr.de>; Fri, 31 May 2019 13:47:28 +0200 (CEST)
Received: from localhost ([127.0.0.1]:41535 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWg0O-0002Ai-14
	for lists+qemu-devel@lfdr.de; Fri, 31 May 2019 07:47:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40508)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hWfxs-0000x9-7C
	for qemu-devel@nongnu.org; Fri, 31 May 2019 07:44:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hWfvu-0008Pm-FB
	for qemu-devel@nongnu.org; Fri, 31 May 2019 07:42:51 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:35770 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1hWfvu-0007Vn-8S
	for qemu-devel@nongnu.org; Fri, 31 May 2019 07:42:50 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id 8CCE61A1E57;
	Fri, 31 May 2019 13:41:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
	[10.10.13.43])
	by mail.rt-rk.com (Postfix) with ESMTPSA id 73B341A1DDB;
	Fri, 31 May 2019 13:41:45 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Fri, 31 May 2019 13:41:29 +0200
Message-Id: <1559302891-29002-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v7 0/2] linux-user: A set of miscellaneous
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
Cc: arikalo@wavecomp.com, lvivier@redhat.com, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

This is a collection of misc patches for Linux user that I recently
accumulated from variuous sources. All of them originate from problems
observed on mips target. However, these changes actually affect and fix
problems on multiple targets.

v6->v7:

  - fixed a build error for older kernels related to the patch on
    setsockopt() options
  - removed four patches that on the meantime got accepted into the
    main source tree

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
  - improved the commit me

Aleksandar Rikalo (1):
  linux-user: Add support for statx() syscall

Neng Chen (1):
  linux-user: Add support for setsockopt() options
    IPV6_<ADD|DROP>_MEMBERSHIP

 linux-user/syscall.c      | 162 +++++++++++++++++++++++++++++++++++++++++++++-
 linux-user/syscall_defs.h |  37 +++++++++++
 2 files changed, 198 insertions(+), 1 deletion(-)

-- 
2.7.4


