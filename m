Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D535515E1D
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 16:17:28 +0200 (CEST)
Received: from localhost ([::1]:40170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknuZ-0007Xb-N0
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 10:17:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkniu-00076Z-Gf
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 10:05:25 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:47051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nkniq-0002fY-Ep
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 10:05:22 -0400
Received: by mail-ej1-x62d.google.com with SMTP id j6so20230942ejc.13
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 07:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+25IMSRLLZVlA+cLmnRitOekeRpfQatnM5YaPxkk0BY=;
 b=Mn9LF7+nRJGomR8/2r2b6X9x5kBszp5wxOcCBTtEvnJf7YOrCIxwhau6ZtoIcrdRET
 iThwrgmIhA6o6Q+HNOGoyDOkokudYKu6jk4nt8cfVyin4kvMqWCrdfqZU3lK1sQG6m8n
 CVBPRr1M2Si6cagjU7N9H13sgPSlPovWoILBRC+Q5+2snpqfMk/ZhBDfIIOtu9wPEU6K
 W3QZctgenSdjbNERmaBiSOXf21NbPu7v411jCqt/mX3KeIgCEk56Wg4hmHTOPLJHw5eA
 011BUC2bGr207ILEEEOC9CO12j/saWg9v5nRP72+tX2eEJmshYSWo9Wrn3QDDFsmJvra
 r8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=+25IMSRLLZVlA+cLmnRitOekeRpfQatnM5YaPxkk0BY=;
 b=rFlC8Hr0dhXO78ii+OQz3q8zVDZLjIYyefu0YJv5rHaaoDveCW/viNnR93tI5D4ySJ
 Ni/4i0PfdPaaahHl/GU1SfDunVklHk0L0p5UVQzsbQDwP33uCtV0b0z72cvQu9346In+
 bGfg+cyvwUnxN3LI8G0t/6y3oOKzSgQzlpzLgdwYmKGOztbsqZ1tGp6TUh5giGjcWqIT
 UXntAkwQh54lOHPpQ7J4iP2hHjcdjcoj7NWUkewZ3eVrrj84xcaiT5c9pKFI2Fnvy2kY
 Enl8EO07EjUyyAsZMoWOP1PXWTofX29QpWfxn8/9XBahUiauCR/Bq1E2L03QMDmx361w
 ZUYw==
X-Gm-Message-State: AOAM533GGFMTYpLSU6jYaV79RPkXWSXUrIa40/6JjICGWZ5NFI44GUQI
 7L/SR8jvLwGIB1u3z5d1j7dPnmpA/iHH2A==
X-Google-Smtp-Source: ABdhPJzcDbFLwVM4XEBkdLHuXlpDQjngdX6gJwWkHo//MMnJ9jJ9k21uThmQQnEsnofyWd87YOURNw==
X-Received: by 2002:a17:907:7d93:b0:6f4:64a:c5a8 with SMTP id
 oz19-20020a1709077d9300b006f4064ac5a8mr3854986ejc.614.1651327518821; 
 Sat, 30 Apr 2022 07:05:18 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 s26-20020aa7c55a000000b0042617ba6392sm4101003edr.28.2022.04.30.07.05.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 07:05:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 00/25] Misc patches for 2022-04-29
Date: Sat, 30 Apr 2022 16:05:15 +0200
Message-Id: <20220430140517.460997-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

The following changes since commit 731340813fdb4cb8339edb8630e3f923b7d987ec:

  Merge tag 'pull-riscv-to-apply-20220429' of github.com:alistair23/qemu into staging (2022-04-29 08:46:55 -0700)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 189fad0006dd4f2f336e05a99d981cc1ecab1b33:

  pc: remove -soundhw pcspk (2022-04-30 10:10:05 +0200)

----------------------------------------------------------------
* WHPX support for xcr0
* qga-wss fixes
* Meson conversions
* Removed -soundhw pcspk

----------------------------------------------------------------
Konstantin Kostiuk (2):
      configure: Add cross prefix for widl tool
      qga-vss: always build qga-vss.tlb when qga-vss.dll is built

Paolo Bonzini (22):
      meson-buildoptions: add support for string options
      meson, configure: move Xen detection to meson
      configure, meson: move iasl detection to meson
      configure: move Windows flags detection to meson
      configure: switch string options to automatic parsing
      meson, configure: move --tls-priority to meson
      meson, configure: move bdrv whitelists to meson
      meson, configure: move --with-pkgversion, CONFIG_STAMP to meson
      meson, configure: move --interp-prefix to meson
      meson: always combine directories with prefix
      configure: switch directory options to automatic parsing
      meson: pass more options directly as -D
      configure: omit options with default values from meson command line
      meson, virtio: place all virtio-pci devices under virtio_pci_ss
      configure: simplify vhost-net-{user, vdpa} configuration
      build: move vhost-vsock configuration to Kconfig
      build: move vhost-scsi configuration to Kconfig
      build: move vhost-user-fs configuration to Kconfig
      meson: create have_vhost_* variables
      meson: use have_vhost_* variables to pick sources
      configure, meson: move vhost options to Meson
      pc: remove -soundhw pcspk

Sunil Muthuswamy (1):
      WHPX: support for xcr0

 Kconfig.host                     |   3 -
 backends/meson.build             |   8 +-
 configure                        | 673 ++-------------------------------------
 docs/meson.build                 |   2 +-
 hw/audio/pcspk.c                 |  10 -
 hw/audio/soundhw.c               |  27 +-
 hw/net/meson.build               |   8 +-
 hw/scsi/Kconfig                  |   5 +
 hw/virtio/Kconfig                |  18 +-
 hw/virtio/meson.build            |  34 +-
 include/hw/audio/soundhw.h       |   3 -
 include/hw/virtio/virtio-scsi.h  |   2 -
 meson.build                      | 256 +++++++++++----
 meson_options.txt                |  28 +-
 net/meson.build                  |  12 +-
 qga/vss-win32/meson.build        |   4 +-
 scripts/meson-buildoptions.py    |  86 ++++-
 scripts/meson-buildoptions.sh    |  74 ++++-
 scripts/qemu-stamp.py            |  24 ++
 scripts/xen-detect.c             | 203 ++++++++++++
 target/i386/whpx/whpx-all.c      |  89 ++++++
 target/i386/whpx/whpx-internal.h |   3 +
 tests/meson.build                |   2 +-
 tests/qtest/meson.build          |   4 +-
 tools/meson.build                |   2 +-
 25 files changed, 778 insertions(+), 802 deletions(-)
 create mode 100644 scripts/qemu-stamp.py
 create mode 100644 scripts/xen-detect.c
-- 
2.35.1


