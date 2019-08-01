Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBB37DB65
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Aug 2019 14:26:27 +0200 (CEST)
Received: from localhost ([::1]:55488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htAA6-0006BG-ML
	for lists+qemu-devel@lfdr.de; Thu, 01 Aug 2019 08:26:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45373)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1htA7W-0001ZJ-9S
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 08:23:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1htA7U-0002zW-8L
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 08:23:45 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:51356 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1htA7T-0002yx-FN
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 08:23:43 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 67AAF1A215B;
 Thu,  1 Aug 2019 14:23:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 4F15F1A20CF;
 Thu,  1 Aug 2019 14:23:41 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu,  1 Aug 2019 14:21:13 +0200
Message-Id: <1564662076-17964-13-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564662076-17964-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1564662076-17964-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH for 4.2 v5 12/15] linux-user: Fix support for
 KDGKBLED and KDSKBLED ioctls
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
Cc: laurent@vivier.eu, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Fix support for KDGKBLED and KDSKBLED ioctls.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 linux-user/ioctls.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/ioctls.h b/linux-user/ioctls.h
index 2100cf4..ea92eea 100644
--- a/linux-user/ioctls.h
+++ b/linux-user/ioctls.h
@@ -65,8 +65,8 @@
      IOCTL(KDGKBSENT, IOC_RW, MK_PTR(MK_STRUCT(STRUCT_kbsentry)))
      IOCTL(KDGKBMETA, IOC_R, MK_PTR(TYPE_INT))
      IOCTL(KDSKBMETA, IOC_W, TYPE_INT)
-     IOCTL(KDGKBLED, 0, TYPE_INT)
-     IOCTL(KDSKBLED, 0, TYPE_INT)
+     IOCTL(KDGKBLED, IOC_R, MK_PTR(TYPE_CHAR))
+     IOCTL(KDSKBLED, IOC_W, TYPE_INT)
      IOCTL(KDGETLED, 0, TYPE_INT)
      IOCTL(KDSETLED, 0, TYPE_INT)
      IOCTL_SPECIAL(KDSIGACCEPT, 0, do_ioctl_kdsigaccept, TYPE_INT)
-- 
2.7.4


