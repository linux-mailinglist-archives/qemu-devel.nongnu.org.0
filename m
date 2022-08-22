Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE1D59CBBD
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 00:50:51 +0200 (CEST)
Received: from localhost ([::1]:45424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQGFu-0001E9-B9
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 18:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oQGA5-0003rL-Ps; Mon, 22 Aug 2022 18:44:51 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:36428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oQGA4-0007vX-4Q; Mon, 22 Aug 2022 18:44:49 -0400
Received: by mail-ed1-x52d.google.com with SMTP id w10so3662690edc.3;
 Mon, 22 Aug 2022 15:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=eC+LI3IuRWQeGkdyetD6UVPAmmhZN9hfwRPTvBGefJk=;
 b=qnMwOjPP6UowC32QYWMoQeaZC4PtL9hA1hLNm/t0ICVWwuT79mFcj4jIkukU7VT3PQ
 oPV4BYkyQV17Stojk4Nckm0DrUM0PKlCN7qGzZYxZWN0LmOgEjXY1OsIOZZkMMgHVrXA
 Oa7sPEGOhtehGUMhmku67KVg1LoiMPrTRlFL0TxtBS6ke/VqaUNAlybfVa3oG7+jgGBH
 FNhecoSfWJpQ41wRLw9j/S6qH7GP+cckcocK7G1DHIg/DC9rrfARiHwPsN5dmWTagiG2
 mtCeLuaXklL3AfAMuaqdc0KvWEdiZJkq7Q2QRTnE+VmqqgYxZFxFO6I5r8tzmMGgInPW
 cs+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=eC+LI3IuRWQeGkdyetD6UVPAmmhZN9hfwRPTvBGefJk=;
 b=X+YmeO3+W98UitDuK1euCDYd20x//VUYJAIe/BTX0zyZhEzSNDRFCTZkva8gS7WyPn
 q2zxOXw8URG1dUJqbwwbDVBqeCYHP98cLbQntxo7GLuvbiB0E5sNuWDM5t+b+wlqQY9g
 EMcaWBlD+eYMQTWk0PDz+9t+UOHmER8ORmT7OMe62fzW8Gvw8+8Gfc4XIa1xv881syg/
 k45X3QcHNSJeoIw+Smnhw2wtITW/k+h98hcHvuEKjRa35z/ABuhjW5USvC+pGYGtnmhf
 RWAchaVUFfSd7278+GrjvzuA/4fwc5047ISzrAAsdbxU4X5Y/u0j6Y0/egC/h/BhK2h3
 2WHw==
X-Gm-Message-State: ACgBeo0INT9VuVHgESXLaw4vKYwNCXBlO6sLD4WKBbMUe1Usbt8A2a9Z
 ZJUEk/NtXvP1Fr/AFn9gIcLT5j5BR54=
X-Google-Smtp-Source: AA6agR4n7heg2jY+MDKz8BF2TBYzupYGbhXCJSC/2apB3NwZMRbe8KYlvgnGLvvXkXLTbTa5z6Vldw==
X-Received: by 2002:a05:6402:b5a:b0:446:7c00:2503 with SMTP id
 bx26-20020a0564020b5a00b004467c002503mr1047469edb.127.1661208285105; 
 Mon, 22 Aug 2022 15:44:45 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-183-070-107.77.183.pool.telefonica.de. [77.183.70.107])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a170906768400b0073d7b876621sm2455758ejm.205.2022.08.22.15.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 15:44:44 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-ppc@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 0/9] QOM'ify VT82xx devices
Date: Tue, 23 Aug 2022 00:43:46 +0200
Message-Id: <20220822224355.11753-1-shentey@gmail.com>
X-Mailer: git-send-email 2.37.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52d.google.com
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

This series instantiates all PCI functions of the VT82xx southbridges in th=
e southbridges themselves.=0D
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
Bernhard Beschow (9):=0D
  hw/isa/vt82c686: QOM'ify Super I/O creation=0D
  hw/isa/vt82c686: Resolve unneeded attribute=0D
  hw/isa/vt82c686: Prefer pci_address_space() over get_system_memory()=0D
  hw/isa/vt82c686: QOM'ify via-ide creation=0D
  hw/isa/vt82c686: QOM'ify vt82c686b-usb-uhci creation=0D
  hw/isa/vt82c686: QOM'ify pm creation=0D
  hw/isa/vt82c686: QOM'ify ac97 and mc97 creation=0D
  hw/isa/vt82c686: QOM'ify RTC creation=0D
  hw/isa/vt82c686: Reuse errp=0D
=0D
 configs/devices/mips64el-softmmu/default.mak |   1 -=0D
 hw/isa/Kconfig                               |   1 +=0D
 hw/isa/vt82c686.c                            | 119 +++++++++++++++----=0D
 hw/mips/fuloong2e.c                          |  12 +-=0D
 hw/ppc/Kconfig                               |   1 -=0D
 hw/ppc/pegasos2.c                            |  14 +--=0D
 6 files changed, 99 insertions(+), 49 deletions(-)=0D
=0D
-- =0D
2.37.2=0D
=0D

