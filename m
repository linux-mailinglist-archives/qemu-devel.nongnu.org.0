Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F02611F8
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Jul 2019 17:46:06 +0200 (CEST)
Received: from localhost ([::1]:60200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjmt3-0005uR-EJ
	for lists+qemu-devel@lfdr.de; Sat, 06 Jul 2019 11:46:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57720)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <th.huth@gmail.com>) id 1hjmqN-0004WB-8q
 for qemu-devel@nongnu.org; Sat, 06 Jul 2019 11:43:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <th.huth@gmail.com>) id 1hjmqM-0003h2-34
 for qemu-devel@nongnu.org; Sat, 06 Jul 2019 11:43:19 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46733)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <th.huth@gmail.com>) id 1hjmqL-0003fc-TP
 for qemu-devel@nongnu.org; Sat, 06 Jul 2019 11:43:18 -0400
Received: by mail-wr1-f66.google.com with SMTP id z1so8060715wru.13
 for <qemu-devel@nongnu.org>; Sat, 06 Jul 2019 08:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mpmCPLcfQfQcRXoEmtaRC7vTJkoFX8Se8gKsApaKeuk=;
 b=NxK1vAC0gl5j6TdfAaM0Xzx0UYCsWhVxnmuSlIvc5QvSpSyL8mgnPu7XKzWsxoBWqG
 5PVkAwrcNDLdBzVyQ0TcKzZJan5i3CbI/JSND/Nbm788UiYJPz5iUjjLIq5b2iLTizB7
 O7KHthJx6aPeQxsxCTt5OuMryW7SvusVocgbAw/HDRXiSgXrksMqmbi10uzZR9VU1hbs
 iJJ2JWkpdvk54SsKeGtFMipIXoYxmKacl2Md4V3JaNquLuQiISxJCLiFsTbdle+77Pk6
 4WsDKUUgOy0iuCsIUKxIYDGNqFwuuI3HeVelqDa7AmLk3xzTlSuTMZbozrsVotrmfxiO
 RPAQ==
X-Gm-Message-State: APjAAAVFWZS/kZ1/s3oS4Ee0HIRTMYMWkO8jNBU3M4XyemW/WnEx+T06
 e6z5lku7tY12Bp5VkckrC8z0Iq6Z
X-Google-Smtp-Source: APXvYqxm/Ke9mx3wZULj84JkzfQ+FidGCCYTRfhPd60/SuYUZjHHyZCjUx8hw4oTBnuk4c9PRWdrTA==
X-Received: by 2002:adf:fa42:: with SMTP id y2mr7653369wrr.170.1562427795992; 
 Sat, 06 Jul 2019 08:43:15 -0700 (PDT)
Received: from thl530.multi.box (pD9E83551.dip0.t-ipconnect.de.
 [217.232.53.81])
 by smtp.gmail.com with ESMTPSA id h6sm12393850wre.82.2019.07.06.08.43.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 06 Jul 2019 08:43:15 -0700 (PDT)
From: Thomas Huth <huth@tuxfamily.org>
To: qemu-devel@nongnu.org
Date: Sat,  6 Jul 2019 17:43:04 +0200
Message-Id: <20190706154308.7280-1-huth@tuxfamily.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.66
Subject: [Qemu-devel] [PATCH v3 0/4] m68k: Add basic support for the
 NeXTcube machine
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

During Google Summer of Code 2011, Bryce Lanham added the possibility to
emulate the NeXTcube machine in QEMU, e.g. see these URLs for some details:

https://wiki.qemu.org/Google_Summer_of_Code_2011#NeXT_machines_system_emulation
https://lists.gnu.org/archive/html/qemu-devel/2011-08/msg02158.html

But since the machine requires a 68040 CPU and this was not included in
upstream QEMU in 2011 yet, the patches have never been merged to upstream.

Then, during the last years, Laurent completed the full 680x0 support in
upstream QEMU, so we could finally merge the NeXTcube support, too.

The QEMU interfaces changed a lot since 2011, so I had to modify the
sources quite a bit, but with the attached patches, it is now possible
to boot up to the firmware monitor again.

Note that boot device emulation is still missing (network and SCSI),
so you can not boot any operating systems with this machine yet. I have
the patches for these devices in my brach here:

 https://gitlab.com/huth/qemu/commits/next-cube

... but they are not quite working yet, so I'll submit them later once
they have been fixed and the basic support patches of this series have
been merged.

v3:
 - Don't connect the devices to the sysbus from the device files themselves,
   do it from next-cube.c instead.
 - Adjusted some values according to Philippe's review comments
 - The MMIO region at 0x820c0020 is now correctly initialized as alias
 - Some more clean-ups here and there

v2:
 - Don't use memory_region_allocate_system_memory() for the framebuffer
   device anymore
 - Turn the keyboard device into a proper QOM device
 - Put the global variables in the third patch into the machine state
   structure
 - Got rid of the "//" C++ comments

Thomas Huth (4):
  m68k: Add NeXTcube framebuffer device emulation
  m68k: Add NeXTcube keyboard device
  m68k: Add NeXTcube machine
  m68k: Add an entry for the NeXTcube machine to the MAINTAINERS file

 MAINTAINERS                      |   7 +
 default-configs/m68k-softmmu.mak |   1 +
 hw/display/Makefile.objs         |   1 +
 hw/display/next-fb.c             | 145 +++++
 hw/m68k/Kconfig                  |   4 +
 hw/m68k/Makefile.objs            |   1 +
 hw/m68k/next-cube.c              | 972 +++++++++++++++++++++++++++++++
 hw/m68k/next-kbd.c               | 284 +++++++++
 include/hw/m68k/next-cube.h      |  47 ++
 9 files changed, 1462 insertions(+)
 create mode 100644 hw/display/next-fb.c
 create mode 100644 hw/m68k/next-cube.c
 create mode 100644 hw/m68k/next-kbd.c
 create mode 100644 include/hw/m68k/next-cube.h

-- 
2.21.0


