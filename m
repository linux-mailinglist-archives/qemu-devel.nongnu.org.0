Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A997DB6A
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Aug 2019 14:27:15 +0200 (CEST)
Received: from localhost ([::1]:55494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htAAs-0007ZE-Lv
	for lists+qemu-devel@lfdr.de; Thu, 01 Aug 2019 08:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44922)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1htA6a-0000rr-Rf
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 08:22:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1htA6X-0002Gw-Kw
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 08:22:48 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:40214 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1htA6X-0001SL-E3
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 08:22:45 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id B458A1A215B;
 Thu,  1 Aug 2019 14:21:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 966141A20CF;
 Thu,  1 Aug 2019 14:21:39 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu,  1 Aug 2019 14:21:01 +0200
Message-Id: <1564662076-17964-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH for 4.2 v5 00/15] linux-user: Misc patches for
 4.2
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

A set of misc linux user patches for 4.2.

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

Aleksandar Markovic (13):
  linux-user: Add support for FDMSGON and FDMSGOFF ioctls
  linux-user: Add support for FDRESET, FDRAWCMD, FDTWADDLE, and FDEJECT
    ioctls
  linux-user: Add support for FDFMTBEG, FDFMTTRK, and FDFMTEND ioctls
  linux-user: Add support for FDSETEMSGTRESH, FDSETMAXERRS, and
    FDGETMAXERRS ioctls
  linux-user: Add support for HDIO_GET_NICE and HDIO_SET_NICE ioctls
  linux-user: Add support for HDIO_GET_WCACHE and HDIO_SET_WCACHE ioctls
  linux-user: Add support for HDIO_GET_ACOUSTIC and HDIO_SET_ACOUSTIC
    ioctls
  linux-user: Add support for HDIO_GET_ADDRESS and HDIO_SET_ADDRESS
    ioctls
  linux-user: Add support for HDIO_GET_BUSSTATE and HDIO_SET_BUSSTATE
    ioctls
  linux-user: Add support for KDGKBMETA and KDSKBMETA ioctls
  linux-user: Fix support for KDGKBLED and KDSKBLED ioctls
  linux-user: Fix support for KDGETLED and KDSETLED ioctls
  linux-user: Add support for RNDRESEEDCRNG ioctl

Aleksandar Rikalo (1):
  linux-user: Add support for semtimedop() syscall

Yunqiang Su (1):
  linux user: Add support for FDFLUSH ioctl

 linux-user/ioctls.h        | 36 ++++++++++++++++++++++++++++++++----
 linux-user/syscall.c       | 41 +++++++++++++++++++++++++++++++++++++++++
 linux-user/syscall_defs.h  | 45 +++++++++++++++++++++++++++++++++++++++++++++
 linux-user/syscall_types.h | 12 ++++++++++++
 4 files changed, 130 insertions(+), 4 deletions(-)

-- 
2.7.4


