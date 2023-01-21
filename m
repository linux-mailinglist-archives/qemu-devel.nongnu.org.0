Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD93676716
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Jan 2023 16:21:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJFex-00022r-Rv; Sat, 21 Jan 2023 10:19:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pJFev-00022J-W1; Sat, 21 Jan 2023 10:19:58 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pJFeu-0005ej-3l; Sat, 21 Jan 2023 10:19:57 -0500
Received: by mail-ej1-x636.google.com with SMTP id u19so20743378ejm.8;
 Sat, 21 Jan 2023 07:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZaFxQ318zqI9yx3w1a9X/TJWerDxpxTfr45H0meu4/I=;
 b=GdemnmaQ1BhUTB6oXRt/9F9GXZ4k0d22pNH6nkL6dKG7I8pUobebUIcKe4TcTAY3mI
 pjJNyLcaq2+rSr+ZlIgWQT3zn+3bS8AnCUhfmL9fe3276dnqAu3Cf+6Z8D7NCDFgs4uQ
 +UjpalwaSMiogxW+UMpzU1nXR092/GghbRUJCBE9ajVPujyWbjY+p5ElJ3306RHvEiDA
 gj8Mt9JUkDv6Vp0Tg3OsL4Hgp/TWiRCJVa98pjir8/SHvS+j+RCb1TFwsJU7PPOW36pF
 Ss8HI388hyUQFTDH5wHi/JW/+9XX52IJZPd+BAyspvllMQQUCUtvf4x6GX7PaFWE1Fgb
 lH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZaFxQ318zqI9yx3w1a9X/TJWerDxpxTfr45H0meu4/I=;
 b=7TrhqdmIkFlHnLKDVbBqgGBQDydf1qX4jA7xs+IWJ7OdOyR8r0+JfW+PAer5garpu7
 4dbteEPBysHnSmO+RwUKF5sCzGNFJTYM8yhV0sMTQADen9KY6QBcn4PHC0Zmvio85o5Q
 pidWyXb2c2yaeo/DYm93EgeffdHZocnakz+KcYfE1gE9Bam9nKlXENE9rZMdtB2gGwXc
 TR38lF3tyxFOiRPzSjkq+dTUxjyvVqYxBc2gTIxrmt/bNpl9VBZgzeo/utZYup0TTT8g
 KEvJ2TyLboAfOQlQ2HhDBer8Ag4uJAOrstZ9EgNHBwUGEcg+5TBz1AvEgvmIjMWwKJLu
 iPIw==
X-Gm-Message-State: AFqh2koZX+5tteHujjoGyktdZuwZyHAtIihTGCiw8tjIM57zwGQfbSlg
 41w4MhjV8kZv3/zQt1SUe91fEi+KXaL8Yg==
X-Google-Smtp-Source: AMrXdXtYChtUU5U7eowfgemyvjSqOAutRK928ygF1Fg1tfV/Uzfqim6Z5DUuZ6E0Sx2dnNmKcWwFug==
X-Received: by 2002:a17:906:169a:b0:863:e38b:5b0a with SMTP id
 s26-20020a170906169a00b00863e38b5b0amr19724493ejd.65.1674314393361; 
 Sat, 21 Jan 2023 07:19:53 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 20-20020a170906101400b0085ff05d5dbdsm14162567ejm.173.2023.01.21.07.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Jan 2023 07:19:52 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-trivial@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 0/7] AML Housekeeping
Date: Sat, 21 Jan 2023 16:19:34 +0100
Message-Id: <20230121151941.24120-1-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This series factors out AcpiCpuAmlIfClass::madt_cpu from AcpiDeviceIfClass.=
=0D
By letting the (x86) CPUs implement the new interface, AML generation is=0D
delegated to the CPUs, freeing the ACPI controllers from worrying about x86=
 CPU=0D
specifics. The delegation to the CPUs is especially interesting for the PII=
X4 PM=0D
since it is also used in MIPS only contexts where no ACPI bios is available=
.=0D
=0D
Furthermore, the series introduces qbus_build_aml() which replaces=0D
isa_build_aml() and resolves some open coding.=0D
=0D
v4:=0D
- Squash qbus_build_aml() patches into one (Igor)=0D
- Don't use a bare function pointer for AcpiDeviceIfClass::madt_cpu (Igor)=
=0D
=0D
Testing done:=0D
* `make check`=0D
* `qemu-system-x86_64 -M pc -m 2G -cdrom manjaro-kde-21.2.6-220416-linux515=
.iso`=0D
* `qemu-system-x86_64 -M q35 -m 2G -cdrom \=0D
   manjaro-kde-21.2.6-220416-linux515.iso`=0D
=0D
v3:=0D
- Clean up includes in AcpiDeviceIfClass::madt_cpu sub series last (Markus)=
=0D
- Restructure qbus_build_aml() sub series (Phil, me)=0D
=0D
v2:=0D
- Don't inline qbus_build_aml() (Phil)=0D
- Add 'hw/acpi/piix4: No need to #include "hw/southbridge/piix.h"'=0D
=0D
Bernhard Beschow (7):=0D
  hw/i386/acpi-build: Remove unused attributes=0D
  hw/isa/isa-bus: Turn isa_build_aml() into qbus_build_aml()=0D
  hw/acpi/piix4: No need to #include "hw/southbridge/piix.h"=0D
  hw/acpi/acpi_dev_interface: Remove unused parameter from=0D
    AcpiDeviceIfClass::madt_cpu=0D
  hw/acpi/acpi_dev_interface: Factor out TYPE_ACPI_CPU_AML_IF=0D
  hw/acpi/acpi_dev_interface: Remove now unused #include "hw/boards.h"=0D
  hw/i386/pc: Unexport pc_madt_cpu_entry()=0D
=0D
 hw/acpi/hmat.h                       |  3 +-=0D
 hw/i386/acpi-common.h                |  3 +-=0D
 include/hw/acpi/acpi_aml_interface.h |  3 ++=0D
 include/hw/acpi/acpi_cpu_interface.h | 26 ++++++++++++++++=0D
 include/hw/acpi/acpi_dev_interface.h |  4 ---=0D
 include/hw/i386/pc.h                 |  6 ----=0D
 include/hw/isa/isa.h                 |  1 -=0D
 hw/acpi/acpi-x86-stub.c              |  7 -----=0D
 hw/acpi/acpi_interface.c             | 18 ++++++++++-=0D
 hw/acpi/cpu.c                        | 13 ++++----=0D
 hw/acpi/hmat.c                       |  1 +=0D
 hw/acpi/memory_hotplug.c             |  1 +=0D
 hw/acpi/piix4.c                      |  3 --=0D
 hw/i2c/smbus_ich9.c                  |  5 +--=0D
 hw/i386/acpi-build.c                 |  5 +--=0D
 hw/i386/acpi-common.c                | 42 +++----------------------=0D
 hw/i386/acpi-microvm.c               |  6 ++--=0D
 hw/i386/generic_event_device_x86.c   |  9 ------=0D
 hw/isa/isa-bus.c                     | 10 ------=0D
 hw/isa/lpc_ich9.c                    |  6 +---=0D
 hw/isa/piix3.c                       |  5 +--=0D
 monitor/qmp-cmds.c                   |  1 +=0D
 target/i386/cpu.c                    | 46 ++++++++++++++++++++++++++++=0D
 23 files changed, 117 insertions(+), 107 deletions(-)=0D
 create mode 100644 include/hw/acpi/acpi_cpu_interface.h=0D
=0D
-- =0D
2.39.1=0D
=0D

