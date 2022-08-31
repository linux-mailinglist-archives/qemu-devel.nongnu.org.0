Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B86045A8241
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 17:52:04 +0200 (CEST)
Received: from localhost ([::1]:60292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTQ0Z-0008La-E2
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 11:52:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTPvC-0002fI-Mz; Wed, 31 Aug 2022 11:46:31 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:34650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTPvA-000363-O4; Wed, 31 Aug 2022 11:46:30 -0400
Received: by mail-ej1-x62d.google.com with SMTP id y3so29260675ejc.1;
 Wed, 31 Aug 2022 08:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=qBQXGdEdLbOLX0OHWScH3MtFtN8XYLsC1g6zk3UIblA=;
 b=pNt4ME3QndjTwtJ719j4uXaTUzS7CdAbuF0+3mCzHn58IqNCLkN6XCLZb/uHIwoqWV
 cAR0H+UZci+9f/8+S5zep8/VUyVGh1+EX1wSFdq/BZwr6tGuSDxPjBkGVu3c98KdsHyy
 ev065rkYgW7ce+wt9HYeAtRcgPhVqyJuJi+qzsJoGsS5vnv2FqRdOcR0D7I7RtlK2Zc7
 keIYdOP55dGbm53BF6cPqm6glA6XEbci/d7AqIDvGYZHNYvqAx+yJ2EQvs+iZZHYsMj0
 Rpcj/OzmG49zWKfiqg96zqrDz7CqzmFUsrcfer3q9/37Q5iPaMat+SXPFlQnPX4JCR3J
 frdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=qBQXGdEdLbOLX0OHWScH3MtFtN8XYLsC1g6zk3UIblA=;
 b=1ITHr7f0Yk5ohqI+XQ4ZSpdAbf7RMSsUuE5dtnhO5Rnf1zqVyw6QqYeffLqAVueBoN
 bF09dMZ3FNHU3I5QhGz7DYLe9otkELvks770/HHScGt0eigZngde0nuONV07wVuxv7kO
 gHrGJnV1I/ZA2JVm9muzHFf3S7px2U2cWxHUAvpYvOr/gbc9Vd8XxyLDnFX3hbJObgpC
 IBI5iZWj9E2D1swO94dZq/hxwSYT+gLyMA7aCGv5R7SeFNdOMmVfgjw0g71zxshaULXP
 C2WjGIHooElxxgtEUA62KqtMFAAsGQudAvwjIHT7spYuM0SCeOWpZft2Xix63BfJyEuG
 jQGg==
X-Gm-Message-State: ACgBeo3VIHBoof3RL23RopndcYRgm4msBLXlhif8jpgETDQGkLYI0NcZ
 X0LMrq+HhkKNqv85sFgYEMShhdLql84=
X-Google-Smtp-Source: AA6agR6Tc9wU+WL4l0iHwBvnLUreECRtwWiQHZD3R/tNeTrphKvLniV1Gl7CS4FLSKoyYN8jcXLgEg==
X-Received: by 2002:a17:906:5a44:b0:741:7925:d42a with SMTP id
 my4-20020a1709065a4400b007417925d42amr11296061ejc.611.1661960785085; 
 Wed, 31 Aug 2022 08:46:25 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 k9-20020a508ac9000000b00445e930e20esm9252123edk.64.2022.08.31.08.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 08:46:24 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 00/12] Instantiate VT82xx functions in host device
Date: Wed, 31 Aug 2022 17:45:53 +0200
Message-Id: <20220831154605.12773-1-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

v3:=0D
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
Bernhard Beschow (12):=0D
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
  hw/isa/vt82c686: Embed RTCState in host device=0D
  hw/isa/vt82c686: Create rtc-time alias in boards instead=0D
=0D
 configs/devices/mips64el-softmmu/default.mak |   1 -=0D
 hw/ide/via.c                                 |   2 +-=0D
 hw/isa/Kconfig                               |   1 +=0D
 hw/isa/vt82c686.c                            | 120 +++++++++++++++----=0D
 hw/mips/fuloong2e.c                          |  21 ++--=0D
 hw/ppc/Kconfig                               |   1 -=0D
 hw/ppc/pegasos2.c                            |  25 ++--=0D
 hw/usb/vt82c686-uhci-pci.c                   |   4 +-=0D
 include/hw/isa/vt82c686.h                    |   4 +-=0D
 9 files changed, 121 insertions(+), 58 deletions(-)=0D
=0D
-- =0D
2.37.3=0D
=0D

