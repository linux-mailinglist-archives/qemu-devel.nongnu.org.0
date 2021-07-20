Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6EE3D055E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 01:29:06 +0200 (CEST)
Received: from localhost ([::1]:54128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5zAf-0005Z0-Sq
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 19:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5z8n-00031y-5r
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:27:09 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:33777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5z8l-0005Wo-8a
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:27:08 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 g8-20020a1c9d080000b02901f13dd1672aso2335400wme.0
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 16:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K0O40nZnfeo+79AAfZdYJ1rF9JvXgIXneyRkSEHLXQU=;
 b=p0Ws1KbSOVsagHpzNHH3FUhsbDZgEaXBLu0cby3Gg7XgqYQWfF1Sm9PUJcFIjvFGEF
 kpCHBXGAECSQp+Y/3W9pQ8of6Q1mDl6RFO+Ts+43gbB2ch/pEaS3qbLcTAxh/ZcOhbUC
 u6EOvSoV+MzclHBFBZ/CeD1DH+T8DgKthiUFiG1Is+y4Z4Pp8Y8tb6mYrE3XtbntboXV
 qNEMEkuKJZwXtRRUT5ZEz4yj4E4FKFkj7ZkjuM4ZrKSLA1wcjfWIn+hQiu9PBUmOIJK4
 ljAktl2BWxkbBZ83sjUmnP9J4b8/MVBjjd8JRmP8bz1YcdbEvBVpgDe8CmI5titIaF7p
 j92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K0O40nZnfeo+79AAfZdYJ1rF9JvXgIXneyRkSEHLXQU=;
 b=Zl8d4+wBw4KWfdpX5wdKqwwvFIxAeVvDdIrvorUhUJm5nSahv9VHCC3yr1TMSKWCvs
 s4j6xgvJEJov13vlEglp09zzV1mVgTrqVKBOG3WsrgSmaYwts7uQJtWJInRCiCuNcoXm
 tg89/hOlD/2BWC+bxINIydl0IUAgrmXKjNB3U1TSrR1HyLSIZGC79F/pIJXJK4bRa3V+
 sukiFslAUCgyyW/YnXPFXNwUBljRqQAVMhbns8riSYns4Oe6jba+nxAwjP+wdnlsx75P
 Y5DUzNCSZby/3lVcfQcKaCdSrmXzTAp1JNHbxBhqInGjzED8gRNHAiv71fKCY/dp+vIL
 xHKA==
X-Gm-Message-State: AOAM532rVs3Un79A5/TvW5EuTENc9gKlvUvTETOf3PUP/uG94Ng4B/Dc
 3+53juBeg5vtTKOMPmEF1f6NQg==
X-Google-Smtp-Source: ABdhPJwSVvMolluWsyMsA8ihdQC+jZBxtwnAICwN1tKwWdc2CQ6HqiZVPcRq//ZvUtFQc4zjmwcSsg==
X-Received: by 2002:a05:600c:25a:: with SMTP id 26mr888723wmj.87.1626823625343; 
 Tue, 20 Jul 2021 16:27:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p9sm24210933wrx.59.2021.07.20.16.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 16:27:04 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C0DE11FF7E;
 Wed, 21 Jul 2021 00:27:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.1-rc1 v1 00/29] various fixes pre-PR (metadata, docs,
 plugins, testing)
Date: Wed, 21 Jul 2021 00:26:34 +0100
Message-Id: <20210720232703.10650-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is a roll-up of all the various patches I've been posting
targeting the 6.1 bug fixes. So far they include:

  - gitdm metadata updates (dropped un-acked mappings)
  - documentation on driver/device configuration
  - some miscellaneous plugin bug fixes
  - fix and CI test for Tricore (posted earlier today)
  - gitlab tweaks for MacOSX and OpenBSI

Phillipe may have merged his PR with some of the tricore patches by
the time this gets in.
  
The following are still need review:

  - gitlab: enable a very minimal build with the tricore container
  - tests/tcg/configure.sh: add handling for assembler only builds
  - contrib/gitdm: add more individual contributor entries. (3 acks, 1 sobs)
  - contrib/gitdm: un-ironically add a mapping for LWN
  - contrib/gitdm: add domain-map/group-map for Wind River
  - contrib/gitdm: add domain-map for Eldorado
  - contrib/gitdm: add domain-map/group-map mappings for Samsung
  - gitdm.config: sort the corporate GroupMap entries
  - contrib/gitdm: add a group mapping for robot scanners
  - contrib/gitdm: add domain-map for MontaVista
  - .mailmap: fix up some broken commit authors
  - docs: collect the disparate device emulation docs into one section


Aaron Lindsay (1):
  plugins: Fix physical address calculation for IO regions

Alex Bennée (22):
  docs: collect the disparate device emulation docs into one section
  docs: add a section on the generalities of vhost-user
  configure: remove needless if leg
  contrib/gitdm: add some new aliases to fix up commits
  .mailmap: fix up some broken commit authors
  contrib/gitdm: add domain-map for MontaVista
  contrib/gitdm: add a group mapping for robot scanners
  gitdm.config: sort the corporate GroupMap entries
  contrib/gitdm: add domain-map/group-map mappings for Samsung
  contrib/gitdm: add domain-map for Eldorado
  contrib/gitdm: add domain-map/group-map for Wind River
  contrib/gitdm: un-ironically add a mapping for LWN
  contrib/gitdm: add domain-map for Crudebyte
  contrib/gitdm: add domain-map for NVIDIA
  contrib/gitdm: add group-map for Netflix
  contrib/gitdm: add an explicit academic entry for BU
  contrib/gitdm: add a new interns group-map for GSoC/Outreachy work
  contrib/gitdm: add more individual contributor entries.
  tcg/plugins: implement a qemu_plugin_user_exit helper
  hw/tricore: fix inclusion of tricore_testboard
  tests/tcg/configure.sh: add handling for assembler only builds
  gitlab: enable a very minimal build with the tricore container

Mahmoud Mandour (3):
  plugins/cache: Fixed a bug with destroying FIFO metadata
  plugins/cache: limited the scope of a mutex lock
  plugins/cache: Fixed "function decl. is not a prototype" warnings

Philippe Mathieu-Daudé (1):
  gitlab-ci: Extract OpenSBI job rules to reusable section

Thomas Huth (1):
  gitlab-ci: Remove the second superfluous macos task

Viresh Kumar (1):
  gitignore: Update with some filetypes

 docs/interop/vhost-user.rst                   |  2 +
 docs/system/device-emulation.rst              | 90 +++++++++++++++++++
 docs/system/{ => devices}/ivshmem.rst         |  0
 docs/system/{ => devices}/net.rst             |  0
 docs/system/{ => devices}/nvme.rst            |  0
 docs/system/{ => devices}/usb.rst             |  0
 docs/system/devices/vhost-user.rst            | 59 ++++++++++++
 docs/system/{ => devices}/virtio-pmem.rst     |  0
 docs/system/index.rst                         |  6 +-
 configure                                     | 10 +--
 configs/devices/tricore-softmmu/default.mak   |  1 +
 include/qemu/plugin.h                         | 12 +++
 include/qemu/qemu-plugin.h                    | 13 +++
 bsd-user/syscall.c                            |  6 +-
 contrib/plugins/cache.c                       | 11 ++-
 linux-user/exit.c                             |  2 +-
 plugins/api.c                                 |  2 +-
 plugins/core.c                                | 39 ++++++++
 .gitignore                                    |  2 +
 .gitlab-ci.d/buildtest.yml                    | 11 +++
 .gitlab-ci.d/cirrus.yml                       | 15 ----
 .gitlab-ci.d/opensbi.yml                      | 28 +++---
 .mailmap                                      |  4 +
 contrib/gitdm/aliases                         |  6 ++
 contrib/gitdm/domain-map                      |  7 ++
 contrib/gitdm/group-map-academics             |  3 +
 contrib/gitdm/group-map-individuals           |  5 ++
 contrib/gitdm/group-map-interns               | 13 +++
 contrib/gitdm/group-map-netflix               |  5 ++
 contrib/gitdm/group-map-robots                |  7 ++
 gitdm.config                                  | 13 ++-
 hw/tricore/Kconfig                            |  3 +-
 hw/tricore/meson.build                        |  4 +-
 .../dockerfiles/debian-tricore-cross.docker   | 34 +++++--
 tests/tcg/configure.sh                        | 18 ++++
 35 files changed, 370 insertions(+), 61 deletions(-)
 create mode 100644 docs/system/device-emulation.rst
 rename docs/system/{ => devices}/ivshmem.rst (100%)
 rename docs/system/{ => devices}/net.rst (100%)
 rename docs/system/{ => devices}/nvme.rst (100%)
 rename docs/system/{ => devices}/usb.rst (100%)
 create mode 100644 docs/system/devices/vhost-user.rst
 rename docs/system/{ => devices}/virtio-pmem.rst (100%)
 create mode 100644 contrib/gitdm/group-map-interns
 create mode 100644 contrib/gitdm/group-map-netflix
 create mode 100644 contrib/gitdm/group-map-robots

-- 
2.32.0.264.g75ae10bc75


