Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCE4FB5B3
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Nov 2019 17:52:41 +0100 (CET)
Received: from localhost ([::1]:47446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUvsm-0002cF-DP
	for lists+qemu-devel@lfdr.de; Wed, 13 Nov 2019 11:52:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44955)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Filip.Bozuta@rt-rk.com>) id 1iUviu-0000v9-0s
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 11:42:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Filip.Bozuta@rt-rk.com>) id 1iUvis-0005kr-G7
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 11:42:27 -0500
Received: from mx2.rt-rk.com ([89.216.37.149]:35014 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Filip.Bozuta@rt-rk.com>)
 id 1iUvir-0005TJ-L4
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 11:42:26 -0500
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 7B5521A22BD;
 Wed, 13 Nov 2019 17:41:20 +0100 (CET)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw493-lin.domain.local (rtrkw493-lin.domain.local
 [10.10.14.93])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 56A611A229B;
 Wed, 13 Nov 2019 17:41:20 +0100 (CET)
From: Filip Bozuta <Filip.Bozuta@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 5.0 0/6] linux-user: Add support for real time clock ioctls
Date: Wed, 13 Nov 2019 17:41:05 +0100
Message-Id: <1573663271-31519-1-git-send-email-Filip.Bozuta@rt-rk.com>
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
Cc: laurent@viver.eu, Filip.Bozuta@rt-rk.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add ioctls for all rtc features that are currently supported in linux kernell.

Filip Bozuta (6):
  linux-user: Add support for enabling/disabling rtc features using
    ioctls
  linux-user: Add set and read for rtc time and alarm using ioctls
  linux-user: Add read and set for rtc periodic interrupt and epoch
    using ioctls
  linux-user: Add get and set for rtc wakeup alarm using ioctls
  linux-user: Add get and set for rtc pll correction using ioctls
  linux-user: Add rtc voltage low detector read and clear using ioctls

 linux-user/ioctls.h        | 23 +++++++++++++++++++++++
 linux-user/syscall.c       |  1 +
 linux-user/syscall_defs.h  | 36 ++++++++++++++++++++++++++++++++++++
 linux-user/syscall_types.h | 25 +++++++++++++++++++++++++
 4 files changed, 85 insertions(+)

-- 
2.7.4


