Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D953A83AF
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 15:22:00 +0200 (CEST)
Received: from localhost ([::1]:57778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5VEU-0003L2-KT
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 09:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54849)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i5Utu-0001dH-4J
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 09:00:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1i5Uts-00088B-3P
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 09:00:41 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:44136 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1i5Utr-0007RD-MB
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 09:00:39 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 36A821A2175;
 Wed,  4 Sep 2019 14:59:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 1C82A1A1D64;
 Wed,  4 Sep 2019 14:59:34 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 14:59:20 +0200
Message-Id: <1567601968-26946-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v6 0/8] linux-user: Misc patches for 4.2
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
Cc: riku.voipio@iki.fi, laurent@vivier.eu, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

A set of misc linux user patches for 4.2.

v5->v6:

  - added a patch on FIOGETOWN/FIOSETOWN ioctls
  - removed a number of patches from the series for easier review
    and integration; these patches will be submitted at a latter
    date

v4->v5:

  - added a patch containing support for two additional ioctls
  - added two patches containing fixes for four additional ioctls

v3->v4:

  - reworked the patch on semtimedop()
  - added five patches containing support for ten additional
    ioctls
  - minor improvements of code formatting

v2->v3:

  - minor code formatting improvements
  - added a patch on semtimedop()

v1->v2:

  - updated commit messages
  - minor improvements of code formatting
  - added three patches containing support for ten additional
    ioctls 

Aleksandar Markovic (6):
  linux-user: Add support for RNDRESEEDCRNG ioctl
  linux-user: Add support for FIOGETOWN and FIOSETOWN ioctls
  linux-user: Add support for FDMSGON and FDMSGOFF ioctls
  linux-user: Add support for FDRESET, FDRAWCMD, FDTWADDLE, and FDEJECT
    ioctls
  linux-user: Add support for FDFMTBEG, FDFMTTRK, and FDFMTEND ioctls
  linux-user: Add support for FDSETEMSGTRESH, FDSETMAXERRS, and
    FDGETMAXERRS ioctls

Aleksandar Rikalo (1):
  linux-user: Add support for semtimedop() syscall

Yunqiang Su (1):
  linux user: Add support for FDFLUSH ioctl

 linux-user/ioctls.h        | 18 ++++++++++++++++++
 linux-user/syscall.c       | 41 +++++++++++++++++++++++++++++++++++++++++
 linux-user/syscall_defs.h  | 37 +++++++++++++++++++++++++++++++++++++
 linux-user/syscall_types.h | 12 ++++++++++++
 4 files changed, 108 insertions(+)

-- 
2.7.4


