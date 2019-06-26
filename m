Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAB35724D
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jun 2019 22:10:00 +0200 (CEST)
Received: from localhost ([::1]:44710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgEEx-0004nw-K9
	for lists+qemu-devel@lfdr.de; Wed, 26 Jun 2019 16:09:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36584)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <laurent@vivier.eu>) id 1hgEDZ-0004LB-85
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 16:08:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1hgEDY-0005oh-AN
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 16:08:33 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:56981)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1hgEDY-0005nh-1e
 for qemu-devel@nongnu.org; Wed, 26 Jun 2019 16:08:32 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MLz3X-1hxTrl1UFl-00HxEF; Wed, 26 Jun 2019 22:02:56 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Wed, 26 Jun 2019 22:02:48 +0200
Message-Id: <20190626200252.30220-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:J4z0zesVEL2KoUQPlh8qoaHWhyBnXCdbzFB7xJLWT7ygyRTg93Z
 4v2VN80V5nUVS2CAhIIQCUGnbyaRpK8F891aIZgj1uUVO1cGxonKWHkr3z6cpq4hd6Her60
 mE3zjEGDtO/yfmIa9M/gQWdyRMCf4/nlC6mhjJoG6iUJZWkVKrc/Z+91IM5GwOsHyteuWjP
 p/Sfc2epeNVXfnfGtmeOg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zdYOlSxHL4E=:q6jmpY4TQtR1f+Q2uoHUyl
 RHdMvu9/roBPib8Oyn1Rnniu/+SEHzrKg3SaoXQ9B/sXqLyVto5T83y/Rk25O/0uTrHxzxZMo
 QCNXbM1vSp0/88aETJBPqh1uHp6Sw9V5+LIcEomrDmBAfLoWx/IjUV9G/KjTCdT1WY4l0M1rd
 +WmBNZAIDgDbaV3swD0sJgAJOP04xT9teazgIsdHX7bcQy8DszY8WznE+xOKjdWFb1fyh7PH+
 ZtamsdKLLZ3b5Ez6XPM6QyYR7EsNMTjPsL1M+Ob+LB626JHRyfsklteh8ZDd4aiYq5QWSaOiN
 PCaJ5o3vC3DpDEKhTzF0CjogBbYwLa6/mzw40RrK0UXb+tdlSon0rYW4udrCNbx+x/NdQtGBg
 j5VWenDqKiImwD8MXFlvPFim50ewapISbrHn3qSJNSXMlFVqSevhBoM/QZewdc0HlXGS6QpW2
 qYaOWwCnrk9YKrsUiPZxv3P9rnt5kshSf7F7v0AHr1P9A8kJH2fREXKqMSvxl5X+P95WDwM9E
 tZFgPzQ/IbR/md8ExuihyczxoSnqBSxg+ox5uBh/HHdEuIO9/t93CEWFQiuxLieXY2hlerfCu
 KCE/OGWh1wDKUlgkeGcf2ehRvw4ybUzs6FlX6KMm2p+aB8ifJPXXYVADoCMugkaT+1IuSoLZ1
 W3me3w7jaVnVho8eu+R4BDAAQCaVIZh+YHHHOqoZcomN/KomBkEnwr7tnuSrQwat9omytCukA
 wBW5E/X7py3tlTkq+eToJJaw/XRsR/QF8ISbgV37JCCDIO5KsUldFnUmTRc=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.73
Subject: [Qemu-devel] [PULL 0/4] Trivial patches patches
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 474f3938d79ab36b9231c9ad3b5a9314c2aeacde:

  Merge remote-tracking branch 'remotes/amarkovic/tags/mips-queue-jun-21-2019' into staging (2019-06-21 15:40:50 +0100)

are available in the Git repository at:

  git://github.com/vivier/qemu.git tags/trivial-patches-pull-request

for you to fetch changes up to b827891d73778eaf962b0536f955194cf4faa424:

  MAINTAINERS: Change maintership of Xen code under hw/9pfs (2019-06-26 18:30:03 +0200)

----------------------------------------------------------------
configure improvements and fixes
MAINTAINERS update

----------------------------------------------------------------

Antonio Ospite (2):
  configure: set source_path only once and make its definition more
    robust
  configure: disallow spaces and colons in source path and build path

Daniel P. Berrangé (1):
  configure: use valid args testing sem_timedwait

Greg Kurz (1):
  MAINTAINERS: Change maintership of Xen code under hw/9pfs

 MAINTAINERS |  3 ++-
 Makefile    |  4 ++++
 configure   | 13 +++++++++----
 3 files changed, 15 insertions(+), 5 deletions(-)

-- 
2.21.0


