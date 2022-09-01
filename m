Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2685A966B
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 14:12:09 +0200 (CEST)
Received: from localhost ([::1]:48972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTj3I-0007ac-0S
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 08:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTiaN-0005gk-MZ; Thu, 01 Sep 2022 07:42:27 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:37886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTiaB-0000Dq-PX; Thu, 01 Sep 2022 07:42:14 -0400
Received: by mail-ed1-x529.google.com with SMTP id b16so22178213edd.4;
 Thu, 01 Sep 2022 04:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=w3a9d8qpqyBTLSXZ8UdLBrk+4IWQvo501TyOwOx4xag=;
 b=b//ykuSo38xkH5kfYZQ4Cj9Uq2rky5Y3ht4tQ8/IfWgqBnBNysDEcQY9bji83iLv4Z
 9Rtpw4At4I7IHMNA2shKkybPsfQD85ox5Xfo47hIhmWuyH/1+SW88RAEdZALUBx5GWAy
 fwB7Ok9rtgJY3TY6S6tg9HASqBmVMMF1Fak1P5yKNLkS7LGLPs5D4k5dSgC1azE/onCh
 IHlXmOYitKIeCpO24fYl+AejtulTluUkF9SCBlssrfaQ22LijYedyagB4yoFauem4rqY
 2L6MF7tzwxZBOKWdgGzBUXcSN8YZ904Zaeq4gJqDN1B0GpY0PXmUyphNaRCOwKQ3QObj
 +XPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=w3a9d8qpqyBTLSXZ8UdLBrk+4IWQvo501TyOwOx4xag=;
 b=zrizRBwP8SEbmCNU4Tev7qLiQfYY7Z4mLQfWgh0iXhMjS0Y9NH3XD6vsWlpHPKgfT0
 AcK493VByajU00svXAemk3RfdyvxTyDhth834bxs7Kfg91ezl4PYIVbqzaEbkIlO9QOA
 fvHeA3QifTJ5ZcLfPTCtoCFBtiK8cxjj2dBRpDv40+bRTpo5isHDPdZR/S0Jxv2bFavn
 MevCDAexuMg61QfpUI9b8d+fyUxEw1xUCDqL+9mcKLKKYPVsom6jyWQBK5z4FSN99IQC
 tAID+Vk3O1+hJLnvzErpxNSfr26SG++zSbOupiRDBGJJNFhvQ9XpYZ0JP6B41YWwLzcd
 bNnA==
X-Gm-Message-State: ACgBeo2IybZ99e7dfhSrq9eNaHCXgVqTq71kS1z5K0e3ZfyuCUS4jpnT
 mo/baftWdKt3DlX/pqLmUsFMBNX3N9o=
X-Google-Smtp-Source: AA6agR7QoaWg59pTbn65ujOxRsda0Tw6dPXceh9/dff3P8RI8f3uC/NIj39CSKxXuYHKmnrmBYVbOg==
X-Received: by 2002:a05:6402:51ce:b0:43e:74bc:dce with SMTP id
 r14-20020a05640251ce00b0043e74bc0dcemr29107848edd.225.1662032517314; 
 Thu, 01 Sep 2022 04:41:57 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a17090660cc00b0073ddb2eff27sm8387455ejk.167.2022.09.01.04.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 04:41:56 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v5 00/13] Instantiate VT82xx functions in host device
Date: Thu,  1 Sep 2022 13:41:14 +0200
Message-Id: <20220901114127.53914-1-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v5:=0D
* Add patch "Inline vt82c686b_southbridge_init() and remove it" (Zoltan)=0D
* Use machine parameter when creating rtc-time alias (Zoltan)=0D
=0D
Testing done: Same as in v3.=0D
=0D
v4:=0D
* Fix in comment: AC97 Modem -> MC97 Modem (Zoltan)=0D
* Introduce TYPE_VT82C686B_USB_UHCI define (Zoltan)=0D
* Introduce TYPE_VIA_IDE define (for consistency)=0D
=0D
v3:=0D
* Replace pre increment by post increment in for loop (Zoltan)=0D
* Move class defines close to where the class is defined (Zoltan)=0D
=0D
Testing done:=0D
* `make check-avocado`=0D
  Passes for boot_linux_console.py for mips64el_fuloong2e=0D
* `qemu-system-ppc -machine pegasos2 -rtc base=3Dlocaltime -device ati-vga,=
guest_hwcursor=3Dtrue,romfile=3D"" -cdrom morphos-3.17.iso -kernel morphos-=
3.17/boot.img`=0D
  Boots successfully and it is possible to open games and tools.=0D
=0D
v2:=0D
* Keep the call to pci_ide_create_devs() in board code for consistency (Zol=
tan)=0D
* Create rtc-time alias in board rather than in south bridge code=0D
* Remove stale comments about PCI functions (Zoltan)=0D
=0D
v1:=0D
This series instantiates all PCI functions of the VT82xx south bridges in t=
he south bridges themselves.=0D
For the IDE function this is especially important since its interrupt routi=
ng is configured in the=0D
ISA function, hence doesn't make sense to instantiate it as a "Frankenstein=
" device. The interrupt=0D
routing is currently hardcoded and changing that is currently not in the sc=
ope of this series.=0D
=0D
Testing done:=0D
* `qemu-system-ppc -machine pegasos2 -rtc base=3Dlocaltime -device ati-vga,=
guest_hwcursor=3Dtrue,romfile=3D"" -cdrom morphos-3.17.iso -kernel morphos-=
3.17/boot.img`=0D
  Boots successfully and it is possible to open games and tools.=0D
=0D
* I was unable to test the fuloong2e board even before this series since it=
 seems to be unfinished [1].=0D
  A buildroot-baked kernel [2] booted but doesn't find its root partition, =
though the issues could be in the buildroot receipt I created.=0D
=0D
[1] https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2=0D
[2] https://github.com/shentok/buildroot/commits/fuloong2e=0D
=0D
Bernhard Beschow (13):=0D
  hw/isa/vt82c686: Resolve chip-specific realize methods=0D
  hw/isa/vt82c686: Resolve unneeded attribute=0D
  hw/isa/vt82c686: Prefer pci_address_space() over get_system_memory()=0D
  hw/isa/vt82c686: Reuse errp=0D
  hw/isa/vt82c686: Introduce TYPE_VIA_IDE define=0D
  hw/isa/vt82c686: Instantiate IDE function in host device=0D
  hw/isa/vt82c686: Introduce TYPE_VT82C686B_USB_UHCI define=0D
  hw/isa/vt82c686: Instantiate USB functions in host device=0D
  hw/isa/vt82c686: Instantiate PM function in host device=0D
  hw/isa/vt82c686: Instantiate AC97 and MC97 functions in host device=0D
  hw/mips/fuloong2e: Inline vt82c686b_southbridge_init() and remove it=0D
  hw/isa/vt82c686: Embed RTCState in host device=0D
  hw/isa/vt82c686: Create rtc-time alias in boards instead=0D
=0D
 configs/devices/mips64el-softmmu/default.mak |   1 -=0D
 hw/ide/via.c                                 |   2 +-=0D
 hw/isa/Kconfig                               |   1 +=0D
 hw/isa/vt82c686.c                            | 120 +++++++++++++++----=0D
 hw/mips/fuloong2e.c                          |  39 +++---=0D
 hw/ppc/Kconfig                               |   1 -=0D
 hw/ppc/pegasos2.c                            |  25 ++--=0D
 hw/usb/vt82c686-uhci-pci.c                   |   4 +-=0D
 include/hw/isa/vt82c686.h                    |   4 +-=0D
 9 files changed, 126 insertions(+), 71 deletions(-)=0D
=0D
-- =0D
2.37.3=0D
=0D

