Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FC542DF35
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 18:33:21 +0200 (CEST)
Received: from localhost ([::1]:52688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb3fU-0006K2-4d
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 12:33:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mb3c2-0003Kn-P7
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:29:46 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:38784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mb3c0-0000VU-Ji
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:29:46 -0400
Received: by mail-ed1-x52a.google.com with SMTP id d9so26303834edh.5
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 09:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gtvvUw0iTZvQxrMv58zhybFDWX/0bNu+wDsCoErtwpU=;
 b=K+ZQUlPjMFcD2zholM00bPPP5l5JuqDK3klfDyIIDD7e6HZFYhYyTAV+X9g18iSNUX
 GBp6YKt95vEFU4/6SYPVINlB88eJzqw+DjZNAdP21cZGMPgXZjwPm6sGpa5KKI4xjbCT
 mwlbUAn4Grkv4gRByfcvj81o8yd60hYdgvOZUYNg+0ivAnW7B9pIL2iMIamntYCFIEry
 DKIHUbv25BYXFHRxeDYx9NKCRY2hN0TeX08tC7Kv3h3PKdQIULGXvo+MNFKo5z9zHnd/
 nUSr9PDX2mOGHZIuuK6dfzwsEl1nr+3Tz7Y9WzK06A1BB7bPSTRS3M7ln31iplrf443x
 E2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=gtvvUw0iTZvQxrMv58zhybFDWX/0bNu+wDsCoErtwpU=;
 b=j2Q0m3X0PVOlbl4vvhxi6p1D8HaL4JNuMYIQeYn5vz5heq2L6nIAZqnKr14GBu0N7J
 3Smhha7/UwaIh7EMRFbj+tlylsHCjsWeKvpGMYnf3B2gVyIRrHzPAlLCXcl66kAwUi73
 pAC2iB5YSy+y5PIs2sJiyohhsGaEBgjXWVCAvaO2LL8B5ppIgI1nxa5G9lKCcIG0j/rh
 2YAjNs2clo/Y9bjq6T+f9ii8i4yMBt1pWjHI6dNU//CJEhiUU+FizHHmcvWR/D5+7ebj
 Nlmim1hxceOKgdSk7fWVGWKvrA2f5AipOhN3heA1TYVLfqS+ruA4ithADLfilWrRjRSI
 N7jQ==
X-Gm-Message-State: AOAM530cURXN5wmpoOXKBHIp4c3lJkIFiZIwztB5xrdAi/EftorMVAa0
 xDpKiZpAIqB5Tl9+4vO4StTUudBmCtU=
X-Google-Smtp-Source: ABdhPJwEt7MKU+R3bVFSH4FiBYkTnaxAflD0zniZl8L+9G0O7ZppOeIeFT2J5LxLPcHbZbNw/124aw==
X-Received: by 2002:a17:906:b254:: with SMTP id
 ce20mr5172053ejb.306.1634228980423; 
 Thu, 14 Oct 2021 09:29:40 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x22sm2658404edv.14.2021.10.14.09.29.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 09:29:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/26] Meson changes for 2021-10-14
Date: Thu, 14 Oct 2021 18:29:12 +0200
Message-Id: <20211014162938.430211-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit e5b2333f24ff207f08cf96e73d2e11438c985801:

  Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20211013' into staging (2021-10-13 11:43:29 -0700)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 3b4da13293482134b81d71be656ec76beff73a76:

  configure: automatically parse command line for meson -D options (2021-10-14 09:51:06 +0200)

----------------------------------------------------------------
* Meson conversions + introspection-based command line parser

----------------------------------------------------------------
Marc-André Lureau (1):
      configure, meson: move Spice configure handling to meson

Paolo Bonzini (25):
      configure: remove --oss-lib
      audio: remove CONFIG_AUDIO_WIN_INT
      configure, meson: move audio driver detection to Meson
      meson: define symbols for all available audio drivers
      configure: add command line options for audio drivers
      kconfig: split CONFIG_SPARSE_MEM from fuzzing
      configure, meson: move fuzzing configuration to Meson
      trace: simple: pass trace_file unmodified to config-host.h
      trace: move configuration from configure to Meson
      configure, meson: move CONFIG_HOST_DSOSUF to Meson
      configure, meson: get HOST_WORDS_BIGENDIAN via the machine object
      configure, meson: remove CONFIG_GCOV from config-host.mak
      meson: HAVE_GDB_BIN is not used by C code
      configure, meson: move remaining HAVE_* compiler tests to Meson
      configure, meson: move pthread_setname_np checks to Meson
      configure, meson: move libaio check to meson.build
      configure, meson: move vde detection to meson
      configure, meson: move netmap detection to meson
      configure: remove obsolete Solaris ar check
      configure, meson: move more compiler checks to Meson
      configure: remove deprecated --{enable, disable}-git-update
      configure: accept "internal" for --enable-capstone/slirp/fdt
      configure: prepare for auto-generated option parsing
      meson-buildoptions: include list of tracing backends
      configure: automatically parse command line for meson -D options

 Kconfig.host                  |    4 +
 Makefile                      |    8 +-
 audio/meson.build             |   23 +-
 block/meson.build             |    2 +-
 chardev/meson.build           |    2 +-
 configure                     | 1271 ++---------------------------------------
 docs/devel/build-system.rst   |  132 ++---
 docs/meson.build              |    2 +-
 hw/mem/Kconfig                |    3 +
 hw/mem/meson.build            |    2 +-
 meson.build                   |  421 ++++++++++++--
 meson_options.txt             |   46 +-
 net/meson.build               |    6 +-
 scripts/meson-buildoptions.py |  172 ++++++
 scripts/meson-buildoptions.sh |  270 +++++++++
 scripts/meson.build           |    2 +-
 stubs/meson.build             |    4 +-
 tests/qtest/fuzz/meson.build  |    6 +-
 trace/meson.build             |   15 +-
 trace/simple.c                |    2 +-
 ui/meson.build                |    4 +-
 util/meson.build              |    4 +-
 util/qemu-thread-posix.c      |    5 +-
 23 files changed, 1041 insertions(+), 1365 deletions(-)
 create mode 100755 scripts/meson-buildoptions.py
 create mode 100644 scripts/meson-buildoptions.sh
-- 
2.31.1


