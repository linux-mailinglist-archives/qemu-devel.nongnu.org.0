Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4F932FB63
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 16:37:44 +0100 (CET)
Received: from localhost ([::1]:40710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIYzu-0000c4-RX
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 10:37:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIYyh-00086p-2K
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 10:36:27 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:41922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lIYye-00080b-H8
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 10:36:26 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 t5-20020a1c77050000b029010e62cea9deso1104098wmi.0
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 07:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YigSrgE3v7Rr/LmXZsGhUoVIJTD46I8WJpH/sN75e0U=;
 b=t+Yq7HffEkScIu+RBZq+P2/g9uyx3smuGT12X9edces5H+PwIbSP5bH44sw60qrL/d
 kU5K06e7C6yXDmUBAjhpYNUGaPc/dE0URyW6AY/1amJfxqi47F5VSpfxidNC9h1GAqwU
 4H3z1I6Wzl/2LxYezKGAOQgup0JirLYZS51+pQHTv0FK28RDIb8UjEKByRVflrS6GEeb
 8qQLTHQGlflIn1juCIOLf2zl1zRx7OI/Fq3926j1BbsniBqrrSCnH2tYWfXSoywpJvyt
 fm5tSfKzH0WBCU7BB05Sw/RISQiKD6MQWfyZ2b6NC1lRR2AC3cRhnyehbjGUnGerl6Vo
 1JMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=YigSrgE3v7Rr/LmXZsGhUoVIJTD46I8WJpH/sN75e0U=;
 b=q83yfSObo7Rph6MeQUo118+FpnHrSnboTEagq0hbfkonf90ZTQK6VcvRmLKfeAuiCD
 JjVvkBRQ/Wfc2HYdHvFUQa8/uuKZbtYhDhexSEeHSsfc2xPXm1GZ/9nXs9OKqeX7n9yC
 xJRNzfrEHS4ggBhUHMjBom5avUokl1RyTwpb0xAxuirb6gN+sufB4vwnP5VCds+chKsO
 fYlz1KuLTfqRpzvpAY4bTKCS2NPl1+jWJaDe5jY6mTAoN7l2ZHgV66r1xk9Du2IDZM8G
 68Pd12LF/mA9ENqhYGwfLGceM+e90OPjUWnCiIDB7MI+YAloGtM9X4yJKbMVp6lYqi50
 Ab7w==
X-Gm-Message-State: AOAM533iefha7KOlZnGrsTW/z8oMim2JEa6wo1kaTBp2cNVmt7UDU+tg
 wfdpDzhlyfQ1Angxvk+5rasOBdUxx3s=
X-Google-Smtp-Source: ABdhPJxqRnv6AyE/UyMB+9obnTMSV/jg2ZTCSpcKjhUgfzpLVurEJNfaML1JAP3todLUGLnNlQVfOQ==
X-Received: by 2002:a1c:b4c6:: with SMTP id d189mr13875465wmf.72.1615044982788; 
 Sat, 06 Mar 2021 07:36:22 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 21sm9773572wme.6.2021.03.06.07.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 07:36:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/14] Renesas patches for 2021-03-06
Date: Sat,  6 Mar 2021 16:36:07 +0100
Message-Id: <20210306153621.2393879-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,=0D
=0D
As SH-4 is not very active, I'm here covering up with this trivial patch qu=
eue.=0D
=0D
The following changes since commit 91e92cad67caca3bc4b8e920ddb5c8ca64aac9e1=
:=0D
=0D
  Merge remote-tracking branch 'remotes/cohuck-gitlab/tags/s390x-20210305' =
into staging (2021-03-05 19:04:47 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/philmd/qemu.git tags/renesas-20210306=0D
=0D
for you to fetch changes up to ef95ca038295bdf6749cbce426b281c21a08971e:=0D
=0D
  hw/sh4/sh7750_regs: Replace link to license by its full content (2021-03-=
06 16:19:03 +0100)=0D
=0D
----------------------------------------------------------------=0D
Renesas patches queue=0D
=0D
- MMU prototype cleanups=0D
- Clarify licenses=0D
- Fine-grained Kconfig entries for SH-4 devices=0D
----------------------------------------------------------------=0D
=0D
Philippe Mathieu-Daud=C3=A9 (14):=0D
  target/sh4: Fix code style for checkpatch.pl=0D
  target/sh4: Replace magic value by MMUAccessType definitions=0D
  target/sh4: Remove unused 'int access_type' argument=0D
  target/sh4: Let get_physical_address() use MMUAccessType access_type=0D
  target/sh4: Remove unused definitions=0D
  hw/sh4: Add missing license=0D
  hw/sh4: Add missing Kconfig dependency on SH7750 for the R2D board=0D
  hw/intc: Introduce SH_INTC Kconfig entry=0D
  hw/char: Introduce SH_SCI Kconfig entry=0D
  hw/timer: Introduce SH_TIMER Kconfig entry=0D
  hw/block: Introduce TC58128 eeprom Kconfig entry=0D
  hw/pci-host: Introduce SH_PCI Kconfig entry=0D
  hw/sh4: Remove now unused CONFIG_SH4 from Kconfig=0D
  hw/sh4/sh7750_regs: Replace link to license by its full content=0D
=0D
 hw/sh4/sh7750_regs.h          |  24 +++++++-=0D
 include/hw/sh4/sh.h           |  31 ++++++++++-=0D
 target/sh4/cpu.h              |  11 ----=0D
 hw/block/tc58128.c            |  26 +++++++++=0D
 hw/{sh4 =3D> pci-host}/sh_pci.c |   0=0D
 target/sh4/helper.c           | 101 +++++++++++++++++-----------------=0D
 MAINTAINERS                   |   6 ++=0D
 hw/block/Kconfig              |   3 +=0D
 hw/block/meson.build          |   2 +-=0D
 hw/char/Kconfig               |   3 +=0D
 hw/char/meson.build           |   2 +-=0D
 hw/intc/Kconfig               |   3 +=0D
 hw/intc/meson.build           |   2 +-=0D
 hw/pci-host/Kconfig           |   4 ++=0D
 hw/pci-host/meson.build       |   1 +=0D
 hw/sh4/Kconfig                |  12 ++--=0D
 hw/sh4/meson.build            |   1 -=0D
 hw/timer/Kconfig              |   4 ++=0D
 hw/timer/meson.build          |   2 +-=0D
 19 files changed, 160 insertions(+), 78 deletions(-)=0D
 rename hw/{sh4 =3D> pci-host}/sh_pci.c (100%)=0D
=0D
-- =0D
2.26.2=0D
=0D

