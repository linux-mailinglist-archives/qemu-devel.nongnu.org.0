Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C843AA588
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 22:47:18 +0200 (CEST)
Received: from localhost ([::1]:60872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltcRR-0005Lo-GH
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 16:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcO2-0001E4-KR
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:43:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltcO0-0000We-Cv
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 16:43:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623876223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XT/BaPHXQ2iKmtoJYhCDT5OMEKKMcajY2ogzA67rhtM=;
 b=H/uLPdxumGY579ZVjXYb/dFxvrpQj83l4jq5PGaYsmuD9FR8ATDFSy2xfMZACuQaOyoPoT
 r6mXv0lL8xf+P38791vTbUNgFUCZSAvPGps2nXCBrgSuUPwgBpBeJXNUpYkFX5c1MJ9cVK
 BFNJT9aD5uIj9GYUsLpKdzTD+ljk6iE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-U8Z5jsVtMaegXQjggUIaew-1; Wed, 16 Jun 2021 16:43:32 -0400
X-MC-Unique: U8Z5jsVtMaegXQjggUIaew-1
Received: by mail-wr1-f69.google.com with SMTP id
 f22-20020a5d58f60000b029011634e39889so1856976wrd.7
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 13:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qd41qF6YdpaPVbu56vCGcVRR7FoLj4WEN5xEJTu5nA8=;
 b=Y5C8+wXax5MDfPANjBZ6a9F0BXpSq8WzHwIHLNKeXxiTfCkLwCm+x2QUKlGPxKOlIR
 32jEg69fwvczrcb8DSdyC7jjjKN0m8S+F7uaqTLuDyT4WsdSCnkVixKugrfqI8RSEu/W
 yKvyLLk71/VayQlUCwEujsACwsAZoUUiTMXv7qvF+g+rqT+veIB75sOG5Vcz/1S+jaqa
 tSW7zAEznxKN8a9VOINCsRpiIK6i09wKN6P2sxtHX7uUCwoSCyFZ70dulX8Ki7BiMMR6
 qbo1doMTAIB4rLsow9QUinIr1tVZc+fx9PgJ+2YFA1anlkb66QU36LyOADSg10XDHp07
 RQiA==
X-Gm-Message-State: AOAM530uOMiWSzuHPSsw51lf9dVQBNw+mcz8plot7Lvvz09nrORGsSV8
 a/HVPXAx/qZy+dsSUncL0xFZMI+ieNtvYnDBgeT6sGfRaRFsHfj2dpMnq2ngnzGOSAShCe8QGUA
 6vYMUWdwoXNs5KoM/Jv8vMn0uv+2TWhAvPr+SO1+FRoA3mTsyM8OBZq1fnMYA5suj
X-Received: by 2002:a5d:6b0e:: with SMTP id v14mr1120766wrw.297.1623876211051; 
 Wed, 16 Jun 2021 13:43:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmud2xVhgskGmZ5T/ez2TvRiKf2AbdcT0++n6aRcSfDHHF+J6+P7JjVkdk7NWkeNgGDRhsmw==
X-Received: by 2002:a5d:6b0e:: with SMTP id v14mr1120735wrw.297.1623876210835; 
 Wed, 16 Jun 2021 13:43:30 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id x18sm3112363wrw.19.2021.06.16.13.43.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 13:43:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/23] target/i386/sev: Housekeeping (OVMF + SEV-disabled
 binaries)
Date: Wed, 16 Jun 2021 22:43:05 +0200
Message-Id: <20210616204328.2611406-1-philmd@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Laszlo Ersek <lersek@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
While testing James & Dov patch:=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg810571.html=0D
I wasted some time trying to figure out how OVMF was supposed to=0D
behave until realizing the binary I was using was built without SEV=0D
support... Then wrote this series to help other developers to not=0D
hit the same problem.=0D
=0D
Some SEV patches I was following have been queued on Eduardo's=0D
'x86-next' tree, so I used his tree as base, and included David and=0D
Connor patches to reduce merge conflicts.=0D
=0D
Patches 1-16 are SEV related,=0D
patches 17-23 are OVMF related.=0D
=0D
Special comment for Laszlo: Please don't review this version,=0D
wait for the respin (hoping the SEV cleanup patch get accepted,=0D
the respin will be focused on OVMF).=0D
=0D
Based-on: https://gitlab.com/ehabkost/qemu/-/commits/x86-next/=0D
Supersedes: <20210610064556.1421620-1-philmd@redhat.com>=0D
=0D
Connor Kuehl (1):=0D
  MAINTAINERS: Add Connor Kuehl as reviewer for AMD SEV=0D
=0D
Dr. David Alan Gilbert (1):=0D
  target/i386/sev: sev_get_attestation_report use g_autofree=0D
=0D
Philippe Mathieu-Daud=C3=A9 (21):=0D
  qapi/misc-target: Wrap long 'SEV Attestation Report' long lines=0D
  qapi/misc-target: Group SEV QAPI definitions=0D
  target/i386/monitor: Return QMP error when SEV is disabled in build=0D
  target/i386/cpu: Add missing 'qapi/error.h' header=0D
  target/i386/sev_i386.h: Remove unused headers=0D
  target/i386/sev: Remove sev_get_me_mask()=0D
  target/i386/sev: Mark unreachable code with g_assert_not_reached()=0D
  target/i386/sev: Restrict SEV to system emulation=0D
  target/i386/sev: Move qmp_query_sev_attestation_report() to sev.c=0D
  target/i386/sev: Move qmp_sev_inject_launch_secret() to sev.c=0D
  target/i386/sev: Move qmp_query_sev_capabilities() to sev.c=0D
  target/i386/sev: Move qmp_query_sev_launch_measure() to sev.c=0D
  target/i386/sev: Move qmp_query_sev() & hmp_info_sev() to sev.c=0D
  monitor: Restrict 'info sev' to x86 targets=0D
  hw/i386/acpi-common: Remove unused includes=0D
  hw/i386: Rename acpi-build.c -> acpi-pc.c=0D
  hw/i386: Move pc_madt_cpu_entry() to acpi-pc.c=0D
  hw/acpi: Do not restrict ACPI core routines to x86 architecture=0D
  hw/i386: Introduce X86_FW_OVMF Kconfig symbol=0D
  hw/acpi/Kconfig: Add missing Kconfig dependencies (build error)=0D
  hw/i386/Kconfig: Add missing Kconfig dependency (runtime error)=0D
=0D
 qapi/misc-target.json               |  78 ++++++++--------=0D
 include/hw/i386/pc.h                |   1 +=0D
 include/monitor/hmp-target.h        |   1 +=0D
 include/monitor/hmp.h               |   1 -=0D
 target/i386/sev_i386.h              |  11 ---=0D
 hw/i386/acpi-common.c               |  45 ----------=0D
 hw/i386/{acpi-build.c =3D> acpi-pc.c} |  39 ++++++++=0D
 hw/i386/pc_sysfw.c                  | 107 ----------------------=0D
 hw/i386/pc_sysfw_ovmf-stubs.c       |  26 ++++++=0D
 hw/i386/pc_sysfw_ovmf.c             | 135 ++++++++++++++++++++++++++++=0D
 target/i386/cpu.c                   |   1 +=0D
 target/i386/monitor.c               |  91 -------------------=0D
 target/i386/sev-stub.c              |  49 +---------=0D
 target/i386/sev-sysemu-stub.c       |  69 ++++++++++++++=0D
 target/i386/sev.c                   | 130 +++++++++++++++++++++------=0D
 MAINTAINERS                         |   8 ++=0D
 hw/acpi/Kconfig                     |   4 +=0D
 hw/acpi/meson.build                 |   3 +-=0D
 hw/i386/Kconfig                     |   5 ++=0D
 hw/i386/meson.build                 |   4 +-=0D
 target/i386/meson.build             |   4 +-=0D
 21 files changed, 443 insertions(+), 369 deletions(-)=0D
 rename hw/i386/{acpi-build.c =3D> acpi-pc.c} (98%)=0D
 create mode 100644 hw/i386/pc_sysfw_ovmf-stubs.c=0D
 create mode 100644 hw/i386/pc_sysfw_ovmf.c=0D
 create mode 100644 target/i386/sev-sysemu-stub.c=0D
=0D
--=20=0D
2.31.1=0D
=0D


