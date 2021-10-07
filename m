Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C8F4253C1
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 15:11:28 +0200 (CEST)
Received: from localhost ([::1]:33506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYTBH-0000mP-0V
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 09:11:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT6e-00020E-7m
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:06:40 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:38653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mYT6Y-0006qd-Fp
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 09:06:39 -0400
Received: by mail-ed1-x534.google.com with SMTP id dj4so22927148edb.5
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 06:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4B5ny7VHfu3mmSw8XKHkk4/C96+TOn8WY6JkmuVD3Cc=;
 b=Zu6hFo8Rm5zjAJ2Cs0Z3OVZuEpFKErQi+Mfy3QWsrae9Hj7LMup0z0JUbNi7Om2tsI
 dU8jEh8T6dajHWL6OAfGdWk6UKkGUGKCs/G0wMsj+V/I8b4+aQyW8k8xB1hQQU6i3Tsh
 2klzx0N2oooU+ZeUGZAOpoKX9pSuu8wokXeEdZbbwy5ZudZvJ37wc0qExHN5J8CMzXwD
 fis/7JpXF22J1umBWu4ApGyi20rFnVsRlv6smxf20w4S2P4snjUPxDc08p0xJfcPWav4
 lNeRTiB13jAmhjeo/GAR+9zW/NyUu9wwJA9cnv0d7DDf/Mp9taj6SDDm1HIHG4i7MmYZ
 /FPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=4B5ny7VHfu3mmSw8XKHkk4/C96+TOn8WY6JkmuVD3Cc=;
 b=Hs539RrDcZV+mKrzU7HQZtlQSIJ64DdoQ0nNEerCqi3vdj5BL7x6axoCk0hfhKVwxl
 ktb5/HxcS3Xs68iLctcfgBbcOzzosfabgbOdXc6jChTOdbRNdsaHNSBDDoVGmwo/8l9P
 Ht1e8jEPXXYXhs5D8PbDdOV+KowHy60i24I4zOm7mtvMn4scPcAJbq6IUnJpCjyHoz4R
 NM0JAR6wkOcwPEq726AvmENMfqrEgujsyozBZJkFsSEyEThqhc2FJYjuIUjX9aJ8MzDs
 YlQdOFKlhuRut1yGbAH+u7kli08arzInLPxUvjBKs4UijdPsrt9x97VI0ewRebj6pNEu
 ac+Q==
X-Gm-Message-State: AOAM531Suz1yXOTcmJvJIb5CXviol6QNbhMghyYRKfHwiXxpgCqMA6io
 O6saooEenyuO/kD4zfOe8Vl6pNF2fVc=
X-Google-Smtp-Source: ABdhPJwW6/uH096YQJWbsGtSSkbnrAX6/k/Kt+6PdZzh/E+kFBmrGGTTFS2SSoMj00vqiusHIHNV8Q==
X-Received: by 2002:a50:e0c9:: with SMTP id j9mr6226474edl.336.1633611992405; 
 Thu, 07 Oct 2021 06:06:32 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id ca4sm10167543ejb.1.2021.10.07.06.06.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 06:06:31 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/24] configure->meson queue for 6.2
Date: Thu,  7 Oct 2021 15:06:06 +0200
Message-Id: <20211007130630.632028-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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

Here is my queue of test conversions to meson for 6.2.  This includes
especially:

- patches 1-5: converting audio driver detection; also adds
  --enable-* options for all audio drivers, so that they are more
  similar to other drivers

- patches 6-7: converting fuzzing configuration

- patches 8-9: converting trace backend configuration

- patches 23-24: automatically generated command line parsing
  for options in meson_options.txt

Most of these patches are months old, and I only included them now
because I had already enough issues with the version update...

Marc-André Lureau (1):
  configure, meson: move Spice configure handling to meson

Paolo Bonzini (23):
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
  configure, meson: move remaining HAVE_* compiler tests to Meson
  configure, meson: move pthread_setname_np checks to Meson
  configure, meson: move libaio check to meson.build
  configure, meson: move vde detection to meson
  configure, meson: move netmap detection to meson
  configure: remove obsolete Solaris ar check
  configure, meson: move more compiler checks to Meson
  configure: remove deprecated --{enable,disable}-git-update
  configure: accept "internal" for --enable-capstone/slirp/fdt
  configure: prepare for auto-generated option parsing
  configure: automatically parse command line for meson -D options

 Kconfig.host                  |    4 +
 Makefile                      |    8 +-
 audio/meson.build             |   23 +-
 block/meson.build             |    2 +-
 chardev/meson.build           |    2 +-
 configure                     | 1253 ++-------------------------------
 docs/devel/build-system.rst   |  133 ++--
 docs/meson.build              |    2 +-
 hw/mem/Kconfig                |    3 +
 hw/mem/meson.build            |    2 +-
 meson.build                   |  422 +++++++++--
 meson_options.txt             |   46 +-
 net/meson.build               |    6 +-
 scripts/meson-buildoptions.py |  155 ++++
 scripts/meson-buildoptions.sh |  268 +++++++
 scripts/meson.build           |    2 +-
 stubs/meson.build             |    4 +-
 tests/qtest/fuzz/meson.build  |    6 +-
 trace/meson.build             |   15 +-
 trace/simple.c                |    2 +-
 ui/meson.build                |    4 +-
 util/qemu-thread-posix.c      |    5 +-
 22 files changed, 1010 insertions(+), 1357 deletions(-)
 create mode 100755 scripts/meson-buildoptions.py
 create mode 100644 scripts/meson-buildoptions.sh

-- 
2.31.1


