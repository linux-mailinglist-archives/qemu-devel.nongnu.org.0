Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 183B3426A22
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 13:49:48 +0200 (CEST)
Received: from localhost ([::1]:51160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYoNm-0000mM-Hv
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 07:49:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mYoJW-0006Cz-N7
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 07:45:22 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:53751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mYoJV-0006u2-4n
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 07:45:22 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MryCb-1n56Co1Cpp-00nxCB; Fri, 08
 Oct 2021 13:45:19 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 00/13] M68k next patches
Date: Fri,  8 Oct 2021 13:45:05 +0200
Message-Id: <20211008114518.757615-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lbBuozqK3nVf918tiibo05wqXTflJPPS8oNXgIg1FpxMXVD7DTb
 PvKHrps1wdH8lRf1QAY3s0uPrlKCrNkATcUmBFTFC3WynlOb46LpAKQTl4kJCKuE2iZUiHB
 KHi9PaI8ETpvCPZ15qFLHbQHM+QJ3DzzNnNLtDxCAAn9wfml3JBkqMWl1CyYIgXNflTbjNl
 DMoB56+W/82m1Y0Xk51uA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CFfyQu1bEdU=:0bULcVjY7LMMto310X904W
 htfN/DvQDjJzhEfHIFa6UffDHRSbSvYCJJgJ9PhNdTR9Q623ebN2Ats3/aAFvtF6YK/7PMswy
 KzPlgIaPHy9RIy7jNGVA3DHZa06EgLIrskD4/INYmbY4ZPZwv+UcEbl2ArrgpV7Fb1/Z/gKgW
 KcAdAqsBdoDmzJ3/9f7FcWDnLEsCM1UmkdBC2SVO36SKH2tkORNnBTiZo2EQzS9zLRk49RzY+
 BfwiELuDu9u+ZM60V4mGnoaGcUPsMuck1xEg+nUY3uSfEcAC4isLvw1U/pUTtUlcgqw22CsYp
 U73Tk0lJwzqGGk+mWZxb10CCAwEiiyNRcQ4yrPSWERGnHZw4riejhsPamADcfszf5IkOsnw6+
 qOSihvTfbg0zx/5EjJ1Q2QKOeaGuXpSuUQWkXdQ8LjEGI8aokBerTBq/dvUxVrqHLYeVZfDuZ
 QjmQhVWbEKJh53UwOb1FF4a1FtoAwx3ZUVk4hR7BcJ+ZGzhgihi+mz95XDxhAYWWdEHTOr5Pd
 80pBI3iRy+KDgTmb/aydo/FuZUPoZ0kAE7Ythq3cGYB39z52nDAWrbZ6gmqLXIc7NIgK+hzMx
 BEPpAbeRtdJgka3Sm7IBPaKbM4BjfNgLVTq2u71+aWznDS1qbNBHJ/q1Hq0eQC+yqhxUM+0r8
 BZxnrQhLURl8oQ9NMERXc4YSYOw4S8Drh+aX6v8+pxFKiz/33oyjnVi8YOW4WpnZKLAgT9MV5
 NPAbN+zD7+JcM5D/zQ6crOBGAXIEDjNy2BbrSg==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

The following changes since commit 14f12119aa675e9e28207a48b0728a2daa5b88d6=
:=0D
=0D
  Merge remote-tracking branch 'remotes/vsementsov/tags/pull-jobs-2021-10-0=
7-v2' into staging (2021-10-07 10:26:35 -0700)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu-m68k.git tags/m68k-next-pull-request=0D
=0D
for you to fetch changes up to efd0c37edc8efe7dccc2356f4a07f33581bc9e67:=0D
=0D
  q800: wire macfb IRQ to separate video interrupt on VIA2 (2021-10-08 13:3=
1:03 +0200)=0D
=0D
----------------------------------------------------------------=0D
Pull request q800 20211008=0D
=0D
macfb: fixes for booting MacOS=0D
=0D
----------------------------------------------------------------=0D
=0D
Mark Cave-Ayland (13):=0D
  macfb: handle errors that occur during realize=0D
  macfb: update macfb.c to use the Error API best practices=0D
  macfb: fix invalid object reference in macfb_common_realize()=0D
  macfb: fix overflow of color_palette array=0D
  macfb: use memory_region_init_ram() in macfb_common_realize() for the=0D
    framebuffer=0D
  macfb: add trace events for reading and writing the control registers=0D
  macfb: implement mode sense to allow display type to be detected=0D
  macfb: add qdev property to specify display type=0D
  macfb: add common monitor modes supported by the MacOS toolbox ROM=0D
  macfb: fix up 1-bit pixel encoding=0D
  macfb: fix 24-bit RGB pixel encoding=0D
  macfb: add vertical blank interrupt=0D
  q800: wire macfb IRQ to separate video interrupt on VIA2=0D
=0D
 include/hw/display/macfb.h |  43 +++++=0D
 hw/display/macfb.c         | 386 ++++++++++++++++++++++++++++++++++---=0D
 hw/m68k/q800.c             |  23 ++-=0D
 hw/display/trace-events    |   7 +=0D
 4 files changed, 429 insertions(+), 30 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

