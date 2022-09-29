Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAEE5EFC88
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 19:59:26 +0200 (CEST)
Received: from localhost ([::1]:54404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odxoj-0004Us-Co
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 13:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odwQc-0003Qi-67
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:30:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odwQX-00030k-F8
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 12:30:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664469020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gC3+NrPfXFR4uctVxnJ16jl5irlKTj8V+d5609LtWag=;
 b=Wxa5HSrrlug7ljA7lwXiBmUaY1kvWv6MJQ/PWmbODp5VgoKrEc2Mh3s4Vy2cQ8TOu9ux4C
 5hlvPL3NMfk/7uuSfTQ8rwXbapMJpqnUdIjM4rK5ep7K1LZ+X87qluZWFl4s6I/vlTZym7
 Vlcz6dNqQr7yIpyWZqhTtdAN9sFrYSM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-376-_Ol3WUVSP0KFwyUw7Ha9kg-1; Thu, 29 Sep 2022 12:30:19 -0400
X-MC-Unique: _Ol3WUVSP0KFwyUw7Ha9kg-1
Received: by mail-ej1-f71.google.com with SMTP id
 7-20020a170906328700b007838b96bf70so952204ejw.7
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 09:30:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=gC3+NrPfXFR4uctVxnJ16jl5irlKTj8V+d5609LtWag=;
 b=V54VqbZYDoh4y+H0ZY1vfCnYNum6P6M7oXbLSEE4GnfUy9GpwIpGe3RjAjm9sgIYw9
 2iaHjWCOuvXWymo2m3TcjU31xzs+EUkrzQS9IJuEo2Stc49w+lGs+WWCiJCVyulVUjKx
 U8eoQewiEydABvqXS9/1X3ZxCP3aAn9yrbxiI1GixIrCSRnbbUrrySUR1Un8os7W2mHg
 Hb/Rss6nFvo93wHGqvR+291ZN7mXsvxW0Sh7Gvim5/FoWD8iroUmfgZz7kGVi3jg27f/
 2R2pSVazDrvYAMCrrMpgJV+G+3MducEfv8pjNhH60FkIXxm+0wu6vvZfnIVU5j3avI4C
 QKDg==
X-Gm-Message-State: ACrzQf24SmUuyRAT047f6XMkx88GwzVFmceu0tUy0BaoSmfVYPF96wqo
 HF0uf8s5hYs3dzi9Twk8duHM6LSIrDi61oD3zMsloXxxDHKaPvCZKRQT6B04KFudDWGQXoUQ2+p
 l++cRmErxKEjlMFt4y+S0cSN15TaEEN/AHlQWtWiC5sUOzT7pMR34kFZHo1bSayMYzVM=
X-Received: by 2002:a17:907:97d2:b0:787:a9ee:8ced with SMTP id
 js18-20020a17090797d200b00787a9ee8cedmr3411589ejc.335.1664469017692; 
 Thu, 29 Sep 2022 09:30:17 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6+AxLIgS6QD7OfGAQp7pt7MWicoyzxJLu/GRsP3/B+Uwed3WnL5fDxzMaSrGf7FjMBfn5ZFw==
X-Received: by 2002:a17:907:97d2:b0:787:a9ee:8ced with SMTP id
 js18-20020a17090797d200b00787a9ee8cedmr3411574ejc.335.1664469017394; 
 Thu, 29 Sep 2022 09:30:17 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 ca5-20020a170906a3c500b007778c9b7629sm4174206ejb.34.2022.09.29.09.30.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 09:30:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/14] x86 + misc changes for 2022-09-29
Date: Thu, 29 Sep 2022 18:30:00 +0200
Message-Id: <20220929163014.16950-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.08,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 99d6b11b5b44d7dd64f4cb1973184e40a4a174f8:

  Merge tag 'pull-target-arm-20220922' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-09-26 13:38:26 -0400)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 1750b7328bd0cf98875df189e9664980db07c692:

  x86: re-initialize RNG seed when selecting kernel (2022-09-29 18:24:13 +0200)

----------------------------------------------------------------
* x86: re-enable rng seeding via SetupData
* x86: reinitialize RNG seed on system reboot and after kernel load
* qboot: rebuild based on latest commit
* watchdog: remove -watchdog option
* update Meson to 0.61.5, move more configure tests

----------------------------------------------------------------

I couldn't rerun the CI (I did run it about a week ago before rebasing)
because I finished my Gitlab minutes and haven't yet set up a private
runner.  Apologies in advance if it breaks somehow.

Paolo

Jason A. Donenfeld (5):
      x86: return modified setup_data only if read as memory, not as file
      x86: use typedef for SetupData struct
      x86: reinitialize RNG seed on system reboot
      x86: re-enable rng seeding via SetupData
      x86: re-initialize RNG seed when selecting kernel

Paolo Bonzini (8):
      qboot: rebuild based on latest commit
      configure: do not invoke as/ld directly for pc-bios/optionrom
      watchdog: remove -watchdog option
      ui: fix path to dbus-display1.h
      meson: require 0.61.3
      meson: multiple names can be passed to dependency()
      configure, meson: move C++ compiler detection to meson.build
      configure, meson: move linker flag detection to meson

Ray Zhang (1):
      target/i386/kvm: fix kvmclock_current_nsec: Assertion `time.tsc_timestamp <= migration_tsc' failed

 configure                       |  97 +++-------------------------------------
 docs/about/deprecated.rst       |   5 ---
 docs/about/removed-features.rst |   5 +++
 hw/i386/microvm.c               |   2 +-
 hw/i386/pc_piix.c               |   3 +-
 hw/i386/pc_q35.c                |   3 +-
 hw/i386/x86.c                   |  70 ++++++++++++++++++++++-------
 hw/nvram/fw_cfg.c               |  12 ++---
 hw/watchdog/sbsa_gwdt.c         |   6 ---
 hw/watchdog/watchdog.c          |  43 ------------------
 hw/watchdog/wdt_aspeed.c        |   6 ---
 hw/watchdog/wdt_diag288.c       |   6 ---
 hw/watchdog/wdt_i6300esb.c      |   6 ---
 hw/watchdog/wdt_ib700.c         |   6 ---
 hw/watchdog/wdt_imx2.c          |   6 ---
 include/hw/nvram/fw_cfg.h       |  22 +++++++++
 include/sysemu/watchdog.h       |  12 -----
 meson                           |   2 +-
 meson.build                     |  67 +++++++++++++++++----------
 pc-bios/optionrom/Makefile      |  12 ++---
 pc-bios/qboot.rom               | Bin 65536 -> 65536 bytes
 qemu-options.hx                 |  33 +-------------
 qga/meson.build                 |   2 +-
 scripts/main.c                  |   1 +
 softmmu/vl.c                    |  16 -------
 target/i386/kvm/kvm.c           |   2 +-
 tests/qtest/dbus-display-test.c |   2 +-
 ui/dbus.h                       |   2 +-
 28 files changed, 153 insertions(+), 296 deletions(-)
 mode change 100644 => 100755 pc-bios/qboot.rom
 create mode 100644 scripts/main.c
-- 
2.37.3


