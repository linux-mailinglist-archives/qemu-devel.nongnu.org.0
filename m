Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8BA53E51C
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 16:42:16 +0200 (CEST)
Received: from localhost ([::1]:56704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyDvq-00059H-VD
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 10:42:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDr5-0001xO-Od
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDqn-0000Vq-Hr
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654526214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9hRKYEqLROnnzZvZUlOGxYQw4MEQ7eabgAKIqLl4+sQ=;
 b=gldUPw/91TIIsN05AhmI4uXx6XNB7H2QT86xBaCyDqFuTK5cD+g2AkUm5it9BGjjE9NdS1
 oA9QDrmN2x1N042vKxOzsvGMgjLjFhYCheY2DKjdRCSdcbV4srC592dyjnJk5nQodgnlQ9
 8T6jtJuCG6ul31JR30pjXk+9tjTIiwo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-ESAz_O9eO7qeuiExHxUf9A-1; Mon, 06 Jun 2022 10:36:52 -0400
X-MC-Unique: ESAz_O9eO7qeuiExHxUf9A-1
Received: by mail-wm1-f71.google.com with SMTP id
 bg13-20020a05600c3c8d00b003974d0ff917so7804462wmb.3
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 07:36:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9hRKYEqLROnnzZvZUlOGxYQw4MEQ7eabgAKIqLl4+sQ=;
 b=D8YS7wi+F6iBwkA0ql+91H8B7Vm6rKxQ6LVCEj0l5Ii6lOmvhs7I31+a44ZTKQHERB
 t4RFrCE9W23XeOHxn2aua64SObHMCWAYRYsnLq2NZPlRjZ82QrFMeGh0K/e6pCIpJC0l
 mod7bOZt54qhAZZCCpHqSjPABSXUisSwW9xP90Sz/+o731MCRewPqOpaZfpXbihGVKos
 UNtgLy7d6UwO8YSI16Mtly2KEonYT8yUt6t+GcWGPvoW9E+TXEAAOBZ2UKkv1SKgdxuF
 F7mdtkFRWosja7maoyVn7KkTaEKo2UbRUars6RhzDlBCnkf3UaQZk0te0T7qkbBNr7Dv
 omRA==
X-Gm-Message-State: AOAM533ij4I4C/qBmKLGHyZxvqpsxKlZ0sVoStYcHHfnPO0Ndep0L15j
 HA405N69+KfQ8cOluEU9Fwf6j7RHip3FI/Gs0lVDVhiHAYfmOOCl+u60iPHmuE7ZlIIs1998uYj
 mZ0+SwB0e3tI4MGeEekCLM5ykIQZmZrW9/MQHwPjnA3xzd5yo6U7dYi+qwLQ/pjGWQp4=
X-Received: by 2002:adf:f646:0:b0:210:32ea:e679 with SMTP id
 x6-20020adff646000000b0021032eae679mr21088060wrp.395.1654526206949; 
 Mon, 06 Jun 2022 07:36:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4Jowv1b+bct5tIHraBBa9BDqjoAfya8XJ5Q9IZ7i0/sn6AHXQBDF/6JbGaJdW4GooH4dHxA==
X-Received: by 2002:adf:f646:0:b0:210:32ea:e679 with SMTP id
 x6-20020adff646000000b0021032eae679mr21088023wrp.395.1654526206554; 
 Mon, 06 Jun 2022 07:36:46 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 u10-20020adfdd4a000000b002102cc4d63asm18080138wrm.81.2022.06.06.07.36.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 07:36:45 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/29] Misc patches for 2022-06-06
Date: Mon,  6 Jun 2022 16:36:15 +0200
Message-Id: <20220606143644.1151112-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

The following changes since commit ca127b3fc247517ec7d4dad291f2c0f90602ce5b:

  Merge tag 'nvme-next-pull-request' of git://git.infradead.org/qemu-nvme into staging (2022-06-03 14:14:24 -0700)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to ca5765c8521b8284b8277ed4b811ac0ab9010fc8:

  meson: qga: do not use deprecated meson.build_root() (2022-06-06 16:04:08 +0200)

----------------------------------------------------------------
* prepare to expand usage of test venv
* fix CPUID when passing through host cache information
* a20 fix
* SGX fix
* generate per-target modinfo
* replay cleanups and simplifications
* "make modules" target

----------------------------------------------------------------
Dario Faggioli (1):
      tests/Makefile.include: Fix 'make check-help' output

Igor Mammedov (2):
      x86: cpu: make sure number of addressable IDs for processor cores meets the spec
      x86: cpu: fixup number of addressable IDs for logical processors sharing cache

John Snow (9):
      python: update for mypy 0.950
      tests: add "TESTS_PYTHON" variable to Makefile
      tests: use python3 as the python executable name
      tests: silence pip upgrade warnings during venv creation
      tests: add quiet-venv-pip macro
      tests: install "qemu" namespace package into venv
      tests: use tests/venv to run basevm.py-based scripts
      tests: add python3-venv to debian10.docker
      tests: run 'device-crash-test' from tests/venv

Jose R. Ziviani (2):
      modules: introduces module_kconfig directive
      modules: generates per-target modinfo

Paolo Bonzini (4):
      build: add a "make modules" target
      regenerate meson-buildoptions.sh
      configure: remove reference to removed option
      meson: qga: do not use deprecated meson.build_root()

Pavel Dovgalyuk (9):
      replay: fix event queue flush for qemu shutdown
      replay: notify vCPU when BH is scheduled
      replay: rewrite async event handling
      replay: simplify async event processing
      docs: convert docs/devel/replay page to rst
      docs: move replay docs to docs/system/replay.rst
      tests/avocado: update replay_linux test
      tests/avocado: add replay Linux tests for virtio machine
      tests/avocado: add replay Linux test for Aarch64 machines

Stephen Michael Jothen (1):
      target/i386/tcg: Fix masking of real-mode addresses with A20 bit

Yang Zhong (1):
      target/i386: Fix wrong count setting

 .gitlab-ci.d/buildtest.yml               |   8 +-
 accel/tcg/tcg-accel-ops-icount.c         |   5 +-
 configure                                |   1 -
 docs/devel/index-tcg.rst                 |   1 +
 docs/devel/replay.rst                    | 306 +++++++++++++++++++++++
 docs/devel/replay.txt                    |  46 ----
 docs/replay.txt                          | 410 -------------------------------
 docs/system/index.rst                    |   1 +
 docs/system/replay.rst                   | 237 ++++++++++++++++++
 hw/display/qxl.c                         |   1 +
 hw/display/vhost-user-gpu-pci.c          |   1 +
 hw/display/vhost-user-gpu.c              |   1 +
 hw/display/vhost-user-vga.c              |   1 +
 hw/display/virtio-gpu-base.c             |   1 +
 hw/display/virtio-gpu-gl.c               |   1 +
 hw/display/virtio-gpu-pci-gl.c           |   1 +
 hw/display/virtio-gpu-pci.c              |   1 +
 hw/display/virtio-gpu.c                  |   1 +
 hw/display/virtio-vga-gl.c               |   1 +
 hw/display/virtio-vga.c                  |   1 +
 hw/s390x/virtio-ccw-gpu.c                |   1 +
 hw/usb/ccid-card-emulated.c              |   1 +
 hw/usb/ccid-card-passthru.c              |   1 +
 hw/usb/host-libusb.c                     |   1 +
 hw/usb/redirect.c                        |   1 +
 include/qemu/module.h                    |  10 +
 include/sysemu/cpu-timers.h              |   1 +
 include/sysemu/replay.h                  |   9 +-
 meson.build                              |  28 ++-
 python/qemu/qmp/util.py                  |   4 +-
 python/setup.cfg                         |   1 +
 qga/meson.build                          |   2 +-
 replay/replay-events.c                   |  56 ++---
 replay/replay-internal.h                 |  37 ++-
 replay/replay-snapshot.c                 |   2 -
 replay/replay.c                          |  78 +++---
 scripts/device-crash-test                |  14 +-
 scripts/meson-buildoptions.sh            |   4 +-
 scripts/modinfo-generate.py              |  49 +++-
 softmmu/icount.c                         |  12 +-
 stubs/icount.c                           |   4 +
 target/i386/cpu.c                        |  22 +-
 target/i386/tcg/sysemu/excp_helper.c     |   4 +-
 tests/Makefile.include                   |  48 ++--
 tests/avocado/avocado_qemu/__init__.py   |  11 +-
 tests/avocado/replay_linux.py            |  85 ++++++-
 tests/avocado/virtio_check_params.py     |   1 -
 tests/avocado/virtio_version.py          |   1 -
 tests/docker/dockerfiles/debian10.docker |   1 +
 tests/requirements.txt                   |   1 +
 tests/vm/Makefile.include                |  13 +-
 tests/vm/basevm.py                       |   6 +-
 util/async.c                             |   8 +
 53 files changed, 894 insertions(+), 649 deletions(-)
 create mode 100644 docs/devel/replay.rst
 delete mode 100644 docs/devel/replay.txt
 delete mode 100644 docs/replay.txt
 create mode 100644 docs/system/replay.rst
-- 
2.36.1


