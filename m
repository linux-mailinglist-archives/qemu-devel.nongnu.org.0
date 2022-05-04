Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3899851B013
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 23:07:30 +0200 (CEST)
Received: from localhost ([::1]:42040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmMDZ-0007kZ-BG
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 17:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmMCY-0006Lk-Ne
 for qemu-devel@nongnu.org; Wed, 04 May 2022 17:06:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmMCV-0007AP-Bv
 for qemu-devel@nongnu.org; Wed, 04 May 2022 17:06:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651698382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=H4rNiF0N7fdN6KO0nV74IhQX4WOT/vBdcy/QQMPmWnc=;
 b=P2sxSLutP0tC6ciOgvgMOefNzxkONGVNU0DyN0wNYfZE1Ul09Z+37mcc+rgadR+bdiB7nj
 csjXYK6V1RB978C2uqcfQeloiQi/3WTFEWlv/hFAx0G4kSKNO8lgpSwhMXaqlnBQUAPmpL
 9d4+8l0RCNakYHfVBRlCfcEhNdZomyE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-K7T6shSQMi2VhBijpHjqfw-1; Wed, 04 May 2022 17:06:21 -0400
X-MC-Unique: K7T6shSQMi2VhBijpHjqfw-1
Received: by mail-ed1-f71.google.com with SMTP id
 cw28-20020a056402229c00b00425dda4b67dso1411899edb.10
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 14:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H4rNiF0N7fdN6KO0nV74IhQX4WOT/vBdcy/QQMPmWnc=;
 b=RqZypOx2YPfhctEjZHwU0NCcedJKG+oaJ7WfdtCuPzgT6Yznzn3vgs0FSmnJJb+ixX
 LQDOVdjpCLylgTHjUCf3lTupdRkPKRV5ijqx8TuJJDfGRD7UJSGSIW2Sqm5HtdLcLoC8
 89bgUR2O2hrVJ5IP+UmPN6fKzt/vndWGBhLMETvDm3OVO8EMSfCY7+JReKppppYMIohs
 trOiXdNazU3iRdjNr5IkxqqxRs7AA7gqKvV/rNs17iDvdhKZeMirzaEtWv5ApFWyrgJc
 MZDqZDIq5fiEq6r0II5By6ktHMeFYIU+dDzyJ643GosbXjHrpjC1WuD0+Rs71VQv7FCH
 2Cmw==
X-Gm-Message-State: AOAM530HFHhbscEmuHuH3X/zsfdcln/FDPstDIZgEriCs4VHqgaa1r3W
 /uKRkvQ/G+PQvPmYU7NNbc1FTJ2tfblwclrN3rpxwJ6zG6iJD07yQemLQ8CAz1HA+rMIghVFWg0
 Qb2sWcTfU/BPnkSOIhK4vApgigC+m890l5NNACkMRMmxYWpESyUUpBHDUn3yZ3c0GQvg=
X-Received: by 2002:a17:906:594a:b0:6f3:d242:8d64 with SMTP id
 g10-20020a170906594a00b006f3d2428d64mr22094633ejr.34.1651698379657; 
 Wed, 04 May 2022 14:06:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQafNN1CU/quMdeJbkbv7qhC5gDMBC94erSB5+4PHH2Tb986IyJG49rhFdgBAnIYkP4d1G2Q==
X-Received: by 2002:a17:906:594a:b0:6f3:d242:8d64 with SMTP id
 g10-20020a170906594a00b006f3d2428d64mr22094590ejr.34.1651698379219; 
 Wed, 04 May 2022 14:06:19 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 og21-20020a1709071dd500b006f3ef214df8sm6135982ejc.94.2022.05.04.14.06.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 14:06:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 00/25] Misc patches for 2022-04-29
Date: Wed,  4 May 2022 23:06:14 +0200
Message-Id: <20220504210615.680072-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The following changes since commit f5643914a9e8f79c606a76e6a9d7ea82a3fc3e65:

  Merge tag 'pull-9p-20220501' of https://github.com/cschoenebeck/qemu into staging (2022-05-01 07:48:11 -0700)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to ec7bd939178789b371df86276ba1d983f2de07ce:

  pc: remove -soundhw pcspk (2022-05-01 23:06:15 +0200)

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

 Kconfig.host                                    |   3 -
 backends/meson.build                            |   8 +-
 configure                                       | 673 ++----------------------
 docs/meson.build                                |   2 +-
 hw/audio/pcspk.c                                |  10 -
 hw/audio/soundhw.c                              |  27 +-
 hw/net/meson.build                              |   8 +-
 hw/scsi/Kconfig                                 |   5 +
 hw/virtio/Kconfig                               |  18 +-
 hw/virtio/meson.build                           |  34 +-
 include/hw/audio/soundhw.h                      |   3 -
 include/hw/virtio/virtio-scsi.h                 |   2 -
 meson.build                                     | 256 ++++++---
 meson_options.txt                               |  28 +-
 net/meson.build                                 |  12 +-
 qga/vss-win32/meson.build                       |   4 +-
 scripts/ci/org.centos/stream/8/x86_64/configure |   3 -
 scripts/meson-buildoptions.py                   |  86 ++-
 scripts/meson-buildoptions.sh                   |  74 ++-
 scripts/qemu-stamp.py                           |  24 +
 scripts/xen-detect.c                            | 203 +++++++
 target/i386/whpx/whpx-all.c                     |  87 +++
 target/i386/whpx/whpx-internal.h                |   3 +
 tests/meson.build                               |   2 +-
 tests/qtest/meson.build                         |   4 +-
 tools/meson.build                               |   2 +-
 26 files changed, 776 insertions(+), 805 deletions(-)
 create mode 100644 scripts/qemu-stamp.py
 create mode 100644 scripts/xen-detect.c
-- 
2.35.1


