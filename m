Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A7D5A7AD8
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 12:04:36 +0200 (CEST)
Received: from localhost ([::1]:53680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTKaJ-0003F6-5B
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 06:04:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTKXj-0006MV-Ex; Wed, 31 Aug 2022 06:01:55 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:43541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTKXh-0002sU-KJ; Wed, 31 Aug 2022 06:01:55 -0400
Received: by mail-ed1-x52b.google.com with SMTP id c59so11451076edf.10;
 Wed, 31 Aug 2022 03:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=F5xy2Mkh8h9720Ym4ErnjCGWdqH+nrmnZC4hRYuhMck=;
 b=DOl5FVhdJvqB4YqeYh3jLhHZN8Wg5pwSMqFj6nY5kyltmZnCIs0RnEgZdZst4CHACB
 e5dHNRvO5D+EG87Kp0cxJrlS9rBL5cFRQDv9NH5D2Q3/fgo0Yu4FoOIXy3E5Prj4mz0K
 lG9Y/cjBnOwud/x966Lpam9Pm0aIDl/QahiNq95y06s9sicfm8eQ5wD2sUvZAjm0789d
 IAhpgYfCVsqa9nwJ1P6qe4SNLfzl0VUa0Q4PVzEsu5jvl3AnOq9whkhIuOzsvYaLs6WW
 bikkltJzlJZx3HvwS5WPDxHN64NGHU7Wke8Ll/7kRMLHg8Xo/a/3LHguJPNWWBu7LPs7
 c20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=F5xy2Mkh8h9720Ym4ErnjCGWdqH+nrmnZC4hRYuhMck=;
 b=Ryx8EXfj3SBp9u7H3Gn3mES26DYGhcxooEL/M/jTxMHKorADOFru37IDiOyV21J/GM
 kQcO8toEKOY6VO5WAVhFDE3chu18KeBSVPCO6xueCBJ8rFF6+Y0Mt1mAcW1YYNhk0le7
 5oGbyeYqcprdyQS8nkm78bcWw1rb5vdVT60VvFmUrDaPUXrAMP6UFFrr4/w5qtffqiky
 pxXKF0BAgytICsLXWbW/UkWqsZNfs0u79g6Z1gSeBe4Fith6RpiKCDMdPbjte2LhlC6E
 U6Z+XNRF+pFiO/Oepw2ojJtKR4+jeN6QVIpqlapv0IIAPbyogZJ0RQpu7/sQ6ck+vCfp
 tIeA==
X-Gm-Message-State: ACgBeo2bJRFuCdQlIz0j3vx5mwLD9h0oLbtb4ATdem+dXkbFhfQPcxUI
 MnNFhDnmMw5lR3hkRn31XGZ7XE5KDzU=
X-Google-Smtp-Source: AA6agR71aQ2eZFhdWVmiTOQzGPvzVMgZS8Vka3+5RnxPakxbUZnALlK2HuoKyzA/awRRlALKj60f2A==
X-Received: by 2002:a50:9344:0:b0:448:ce76:7c81 with SMTP id
 n4-20020a509344000000b00448ce767c81mr5819177eda.187.1661940111075; 
 Wed, 31 Aug 2022 03:01:51 -0700 (PDT)
Received: from osoxes.fritz.box (pd95ed71f.dip0.t-ipconnect.de.
 [217.94.215.31]) by smtp.gmail.com with ESMTPSA id
 6-20020a170906310600b0073c10031dc9sm6449583ejx.80.2022.08.31.03.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 03:01:50 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 00/10] Instantiate VT82xx functions in host device
Date: Wed, 31 Aug 2022 11:59:04 +0200
Message-Id: <20220831095914.2041-1-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52b.google.com
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
Bernhard Beschow (10):=0D
  hw/isa/vt82c686: Resolve chip-specific realize methods=0D
  hw/isa/vt82c686: Resolve unneeded attribute=0D
  hw/isa/vt82c686: Prefer pci_address_space() over get_system_memory()=0D
  hw/isa/vt82c686: Reuse errp=0D
  hw/isa/vt82c686: Instantiate IDE function in host device=0D
  hw/isa/vt82c686: Instantiate USB functions in host device=0D
  hw/isa/vt82c686: Instantiate PM function in host device=0D
  hw/isa/vt82c686: Instantiate AC97 and MC97 functions in host device=0D
  hw/isa/vt82c686: Embed RTCState in host device=0D
  hw/isa/vt82c686: Create rtc-time alias in boards instead=0D
=0D
 configs/devices/mips64el-softmmu/default.mak |   1 -=0D
 hw/isa/Kconfig                               |   1 +=0D
 hw/isa/vt82c686.c                            | 120 +++++++++++++++----=0D
 hw/mips/fuloong2e.c                          |  21 ++--=0D
 hw/ppc/Kconfig                               |   1 -=0D
 hw/ppc/pegasos2.c                            |  25 ++--=0D
 include/hw/isa/vt82c686.h                    |   2 -=0D
 7 files changed, 116 insertions(+), 55 deletions(-)=0D
=0D
-- =0D
2.37.3=0D
=0D

