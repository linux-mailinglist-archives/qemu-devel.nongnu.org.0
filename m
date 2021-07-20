Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1130E3CFDC9
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 17:43:48 +0200 (CEST)
Received: from localhost ([::1]:46732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5ruM-0001IZ-L4
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 11:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5rsW-0007J0-O2
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:41:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5rsT-0004cK-8b
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 11:41:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626795707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=s3PRAvPVzq6+iE3dZ58zGRjzYjBXa0FcbOoUMhueVXk=;
 b=FRhYhsoqoUL5jW8niQsolCl+qKePzd/EoQVIqnnFcROrXqNeK0pAnRc2Y43EGTmiaBiCU6
 n8N/fzsyEKnd3QUbi/Q9JFtIuwAIu0c+4fQ7Ye6bOa4ryAfTEf6QvBN4/K2n/Bok0Rg9rM
 XjQso4Ky8qv9+GYPoFG+FSeS648aHyM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2--ja5IMwDPSSO2IJV73a97w-1; Tue, 20 Jul 2021 11:41:44 -0400
X-MC-Unique: -ja5IMwDPSSO2IJV73a97w-1
Received: by mail-wr1-f72.google.com with SMTP id
 h15-20020adffd4f0000b0290137e68ed637so10411325wrs.22
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 08:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pbx4/5GI86p/4RF+CltdHVbaaVyWUlxlAgLiX9vi1W0=;
 b=J67il2vPn2iZAba3Oty+fCVrB+rUmhI5UUiDThUBeD4tN9C/ze3i22hpIssmxmUMz9
 sakMIM9nlosuCZe9HGgUYs4UnMTgwvsuJTQYtxXzEn0JvGgXzEc3YD7E3MBpL5uUmaL6
 EPwvI9aEak8R/Pcju3c1+gMGAHOCDwdfbPFtlhaobrV/peICZxAPhXWbwvPUbwXYFrDt
 4k/XKtfBqhuY6vl8sNQBH0Q40dZoZlkDqb6X9ey/8H1zmS8JG60uoIBdwBaOL1dk4DOq
 Pfs7MrbWy5G3tQMNbk5mCkchcSnWsiL/ottReQ7gpta4JpAOdpk995Q2Eqa5SyvImD6P
 WVfQ==
X-Gm-Message-State: AOAM533HP3LS2An3JLtm+hO3f2ITwmjAT0IHjXz1hDDsRIwRZkXER3Ao
 Nm3RId3ofvCB7LQVffNbXvSJKbvm/WWGvukTRwmw3GqRxWK4lUJlso1Kj9tPMVRMeOuXYEgfRCk
 k5grbd4AMq0CpmjqFCqd79nL3cy7KoO1YiFazSjBg0E6Sc7PQsc7R3mJqoAH2UpjV
X-Received: by 2002:a1c:7308:: with SMTP id d8mr31355751wmb.20.1626795703535; 
 Tue, 20 Jul 2021 08:41:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+5I2WYjLvCB6WNboj3Iz0nrcBwG635r1iqOCapROuZX4tq0uGmCo/zCNb/GmYGYHAWhtjzQ==
X-Received: by 2002:a1c:7308:: with SMTP id d8mr31355733wmb.20.1626795703275; 
 Tue, 20 Jul 2021 08:41:43 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id
 p18sm2669480wmg.46.2021.07.20.08.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 08:41:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/17] Kconfig patches for 2021-07-20
Date: Tue, 20 Jul 2021 17:41:24 +0200
Message-Id: <20210720154141.3919817-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 7457b407edd6e8555e4b46488aab2f13959fccf8=
:=0D
=0D
  Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-2021=
-07-19' into staging (2021-07-19 11:34:08 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/philmd/qemu.git tags/kconfig-20210720=0D
=0D
for you to fetch changes up to 3fac1da88f95f5338bb79420682427ab06adf99e:=0D
=0D
  hw/tricore: fix inclusion of tricore_testboard (2021-07-20 17:17:07 +0200=
)=0D
=0D
----------------------------------------------------------------=0D
Kconfig patches queue=0D
=0D
Various Kconfig patches collected during v6.1 development cycle.=0D
=0D
----------------------------------------------------------------=0D
=0D
Alex Benn=C3=A9e (1):=0D
  hw/tricore: fix inclusion of tricore_testboard=0D
=0D
Philippe Mathieu-Daud=C3=A9 (16):=0D
  hw/mips: Add dependency MIPS_CPS -> MIPS_ITU=0D
  hw/mips: Express dependencies of the Boston machine with Kconfig=0D
  hw/acpi: Do not restrict ACPI core routines to x86 architecture=0D
  hw/acpi/Kconfig: Add missing Kconfig dependencies (build error)=0D
  hw/i386/Kconfig: Add missing Kconfig dependency (runtime error)=0D
  hw/ide/Kconfig: Add missing dependency PCI -> IDE_QDEV=0D
  hw/arm/Kconfig: Add missing dependency NPCM7XX -> SMBUS=0D
  hw/arm/Kconfig: Remove unused DS1338 symbol from i.MX25 PDK Board=0D
  hw/arm/Kconfig: Add missing SDHCI symbol to FSL_IMX25=0D
  hw/riscv/Kconfig: Add missing dependency MICROCHIP_PFSOC -> SERIAL=0D
  hw/riscv/Kconfig: Restrict NUMA to Virt & Spike machines=0D
  hw/ppc/Kconfig: Add missing dependency E500 -> DS1338 RTC=0D
  hw/pci-host/Kconfig: Add missing dependency MV64361 -> I8259=0D
  hw/isa/vt82c686: Add missing Kconfig dependencies (build error)=0D
  hw/isa/vt82c686: Add missing Kconfig dependency (runtime error)=0D
  hw/ppc/Kconfig: Add dependency PEGASOS2 -> ATI_VGA=0D
=0D
 configs/devices/mips64el-softmmu/default.mak | 4 ----=0D
 configs/devices/ppc-softmmu/default.mak      | 1 -=0D
 configs/devices/tricore-softmmu/default.mak  | 1 +=0D
 hw/acpi/Kconfig                              | 4 ++++=0D
 hw/acpi/meson.build                          | 3 ++-=0D
 hw/arm/Kconfig                               | 3 ++-=0D
 hw/char/Kconfig                              | 1 +=0D
 hw/i386/Kconfig                              | 1 +=0D
 hw/ide/Kconfig                               | 2 +-=0D
 hw/isa/Kconfig                               | 4 ++++=0D
 hw/mips/Kconfig                              | 6 ++++++=0D
 hw/pci-host/Kconfig                          | 1 +=0D
 hw/ppc/Kconfig                               | 2 ++=0D
 hw/riscv/Kconfig                             | 5 +++++=0D
 hw/riscv/meson.build                         | 2 +-=0D
 hw/tricore/Kconfig                           | 3 +--=0D
 hw/tricore/meson.build                       | 4 ++--=0D
 17 files changed, 34 insertions(+), 13 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


