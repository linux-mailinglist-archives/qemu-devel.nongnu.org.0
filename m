Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C2733C7EE
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 21:45:00 +0100 (CET)
Received: from localhost ([::1]:55770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLu5D-0005NI-SU
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 16:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lLu2u-00049r-V7
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 16:42:36 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:39579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lLu2r-00031l-85
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 16:42:36 -0400
Received: from localhost.localdomain ([82.142.6.26]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MX0TX-1lF1MS20AT-00XNb6; Mon, 15 Mar 2021 21:42:29 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] M68k for 6.0 patches
Date: Mon, 15 Mar 2021 21:42:21 +0100
Message-Id: <20210315204226.3481044-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Se4zHM7J6XVpep3VEoOkJWtlQzKzl+nv3u6qrP+06W4yY6eszev
 eDe+yuYgnrGo1yihUZ2FiurmYfHzTCWLDUInACwjvShhZQ2Tld6ipABTbDGdtVPLd0ic4iO
 +uDB3YV6cjQmyobhtB4GFaQxiKGmK7Uz1FFRkdux5UTjU/rrXjwMrcCPvgHTWsC8fuCCo7m
 j/SvGdxs8kQevO7s6FZkw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6Aro6fCrwGA=:hbNlT1aPBavzrlJTvoHxJO
 TZGJHkAtHQHwuNXrF25RYkZ2tThUqLZQhENt1DVxatedd/52kQtrvpcURxMwRtP63dfc3Ogtu
 eD4ZsPc3k1SLFrZue7rBq1HL90YlUNDU2uAghyDLT3612IjTkU8N8TeZ8IbkkSZx+2XzYLum0
 4fFKLN/HaS/rkuHe/dOQ7Gi2srA7NrYMMS9pRIE+TD87ZObOQ2ijWiJ1U/sdEE0cxW6AGoqha
 r+cVEIyRn5mmiosnYuKv7b5Wmdd8RLek454H/yr9PpLI5ePpWjThHxs9xYwRQDwUmaNPMcxDB
 PcibJEGpd5OEjlQG8Yh2l24kqzqxNOD4UXzrjI2jAbnzTNlgKMgvzvZLDO6Ew6zzB8rURY/55
 EGNXrFtjUv9oN35Mxa194AVAEivAcocdQ+ZeaZ6XvEMTD5ZLMuk4rKnUg6R+0
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit e7c6a8cf9f5c82aa152273e1c9e80d07b1b0c32c=
:=0D
=0D
  Merge remote-tracking branch 'remotes/philmd/tags/avr-20210315' into stag=
in=3D=0D
g (2021-03-15 16:59:55 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu-m68k.git tags/m68k-for-6.0-pull-request=0D
=0D
for you to fetch changes up to e1cecdca559d552bc5ab282696301858a97c3e8c:=0D
=0D
  m68k: add Virtual M68k Machine (2021-03-15 21:03:06 +0100)=0D
=0D
----------------------------------------------------------------=0D
m68k pull request 20210315=0D
=0D
Add m68k virt machine=0D
=0D
----------------------------------------------------------------=0D
=0D
Laurent Vivier (5):=0D
  hw/char: add goldfish-tty=0D
  hw/intc: add goldfish-pic=0D
  m68k: add an interrupt controller=0D
  m68k: add a system controller=0D
  m68k: add Virtual M68k Machine=0D
=0D
 docs/specs/virt-ctlr.txt                      |  26 ++=0D
 default-configs/devices/m68k-softmmu.mak      |   1 +=0D
 include/hw/char/goldfish_tty.h                |  35 ++=0D
 include/hw/intc/goldfish_pic.h                |  33 ++=0D
 include/hw/intc/m68k_irqc.h                   |  41 +++=0D
 include/hw/misc/virt_ctrl.h                   |  22 ++=0D
 .../standard-headers/asm-m68k/bootinfo-virt.h |  18 +=0D
 hw/char/goldfish_tty.c                        | 285 ++++++++++++++++=0D
 hw/intc/goldfish_pic.c                        | 219 ++++++++++++=0D
 hw/intc/m68k_irqc.c                           | 119 +++++++=0D
 hw/m68k/virt.c                                | 313 ++++++++++++++++++=0D
 hw/misc/virt_ctrl.c                           | 151 +++++++++=0D
 MAINTAINERS                                   |  13 +=0D
 hw/char/Kconfig                               |   3 +=0D
 hw/char/meson.build                           |   2 +=0D
 hw/char/trace-events                          |  10 +=0D
 hw/intc/Kconfig                               |   6 +=0D
 hw/intc/meson.build                           |   2 +=0D
 hw/intc/trace-events                          |   8 +=0D
 hw/m68k/Kconfig                               |   9 +=0D
 hw/m68k/meson.build                           |   1 +=0D
 hw/misc/Kconfig                               |   3 +=0D
 hw/misc/meson.build                           |   3 +=0D
 hw/misc/trace-events                          |   7 +=0D
 24 files changed, 1330 insertions(+)=0D
 create mode 100644 docs/specs/virt-ctlr.txt=0D
 create mode 100644 include/hw/char/goldfish_tty.h=0D
 create mode 100644 include/hw/intc/goldfish_pic.h=0D
 create mode 100644 include/hw/intc/m68k_irqc.h=0D
 create mode 100644 include/hw/misc/virt_ctrl.h=0D
 create mode 100644 include/standard-headers/asm-m68k/bootinfo-virt.h=0D
 create mode 100644 hw/char/goldfish_tty.c=0D
 create mode 100644 hw/intc/goldfish_pic.c=0D
 create mode 100644 hw/intc/m68k_irqc.c=0D
 create mode 100644 hw/m68k/virt.c=0D
 create mode 100644 hw/misc/virt_ctrl.c=0D
=0D
--=3D20=0D
2.29.2=0D
=0D

