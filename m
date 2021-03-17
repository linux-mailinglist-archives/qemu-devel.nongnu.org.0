Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C3533EA7D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 08:26:20 +0100 (CET)
Received: from localhost ([::1]:36946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMQZP-0008Nx-G9
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 03:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMQVc-0003U5-S8
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 03:22:24 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:37593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMQVY-0007qZ-Vk
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 03:22:24 -0400
Received: by mail-ed1-x533.google.com with SMTP id x21so987448eds.4
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 00:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sX/XuQQq99vEmrqTBeSlSr/iT0iidu+q6tBBPBw8O8E=;
 b=hLQVb1239XOB/voELqdru+a4x2VZBOWF0pHr0+MnJOyhaWVGcno3bYm+srJ9fZs2ch
 Z+3vUE6Jeu5pl6eqdbXT5hD4hRk9tDNUOMLEQKKFAhIv75exX84snayCWqWLRh/IPV6J
 tUWVbAlHUa0wScNtK75XRk0eC14klEYs1wLE+4qwvqly5UKXUiLI7CCWOaSpfBipgyR3
 OlxnJz/blxhIPipBWcHX/F2MlwwRJU69OcVO70Rj9JMVPlSqqV5+uowcm5v22foIBONE
 ITLi0G8wAhn2zfNv4zY3/dnCeqRIxvukXwUBx5PX5F7g/+soqu2XewoCoaPWj1amGljA
 PDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sX/XuQQq99vEmrqTBeSlSr/iT0iidu+q6tBBPBw8O8E=;
 b=cjVwLj0XYF/1+KYm8EW+4uTQWAyzDllYtmAo/Xo8p/E4efZ2t6Imi0gGNPCmyE9w0Y
 TUqiBoM4xS7hoaF+W5ScaAXdIh+TVZB5yp0qDABi3kZItkF/i7jzqQER0pkDKG0MrSNd
 7FJSM3W5jzJu74c94kE/2jEnhXeoJH+BFd/bdRkA0k7e4bGkS/7CY2sitUTcN21X5BMp
 USgAaQX8XTSZbqDEd7+7ATl7zoqGn1/x+rQnxEo5uD9E++ZoOWzR5O2ITSi23cKS4Qjm
 CIyG53PmTpDNQpZ+7lbIgY4gU/gLGkOXZvgog4hOSBSoPGFT4Ti058gGQnuT8CDYcmLu
 ab1Q==
X-Gm-Message-State: AOAM530ukTYDXBdekpoIJqPd8TqXhI8XQTJDpvFXjpCe2MJefPRitIt3
 E7vaLCDjm3XEUej1//rwgi3CcA==
X-Google-Smtp-Source: ABdhPJwLzsaV67+jeZoBekBOS+Mxdiw9IfAf2DM2HLd1spdbaKBYoyLRRUfOWA5bgObJFEeUll/lhA==
X-Received: by 2002:aa7:c889:: with SMTP id p9mr39901221eds.82.1615965739489; 
 Wed, 17 Mar 2021 00:22:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r17sm12368358edx.1.2021.03.17.00.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 00:22:17 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A656B1FF7E;
 Wed, 17 Mar 2021 07:22:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 00/15] misc fixes (strtoz, plugins, guest-loader)
Date: Wed, 17 Mar 2021 07:22:01 +0000
Message-Id: <20210317072216.16316-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Apologies for the delay, it took several swings at the CI to get a
clean pass. I've dropped the SYS_HEAPINFO and final kernel-doc
integration patch for now. I've also nabbed rth's strtoz fix although
that is also in another 1 change PR he submitted earlier.

The following changes since commit 5b7f5586d182b0cafb1f8d558992a14763e2953e:

  Merge remote-tracking branch 'remotes/kraxel/tags/usb-20210315-pull-request' into staging (2021-03-16 13:17:54 +0000)

are available in the Git repository at:

  https://github.com/stsquad/qemu.git tags/pull-misc-6.0-updates-170321-2

for you to fetch changes up to 9e7118023fda7c29016038e2292d4d14129b63da:

  hw/core: Only build guest-loader if libfdt is available (2021-03-17 07:17:46 +0000)

----------------------------------------------------------------
Final fixes for 6.0

  - plugins physical address changes
  - syscall tracking plugin
  - plugin kernel-doc comments (without integration)
  - libfdt build fix for guest-loader

----------------------------------------------------------------
Aaron Lindsay (1):
      plugins: Expose physical addresses instead of device offsets

Alex Bennée (9):
      plugins: expand kernel-doc for qemu_info_t
      plugins: cleanup kernel-doc for qemu_plugin_install
      plugins: expand the callback typedef kernel-docs
      plugins: expand the typedef kernel-docs for translation
      plugins: add qemu_plugin_cb_flags to kernel-doc
      plugins: add qemu_plugin_id_t to kernel-doc
      plugins: expand inline exec kernel-doc documentation.
      plugins: expand kernel-doc for instruction query and instrumentation
      plugins: expand kernel-doc for memory query and instrumentation

Matthias Weckbecker (1):
      plugins: new syscalls plugin

Philippe Mathieu-Daudé (1):
      hw/core: Only build guest-loader if libfdt is available

Richard Henderson (1):
      utils: Use fixed-point arithmetic in qemu_strtosz

Yonggang Luo (2):
      plugins: getting qemu_plugin_get_hwaddr only expose one function prototype
      plugins: Fixes typo in qemu-plugin.h

 include/qemu/qemu-plugin.h  | 232 +++++++++++++++++++++++++++++++++++---------
 contrib/plugins/hotpages.c  |   2 +-
 contrib/plugins/hwprofile.c |   2 +-
 plugins/api.c               |  25 +++--
 tests/plugin/syscall.c      |  49 ++++++++++
 tests/unit/test-cutils.c    |   2 +-
 util/cutils.c               |  50 +++++++---
 hw/core/Kconfig             |   5 +
 hw/core/meson.build         |   3 +-
 tests/plugin/meson.build    |   2 +-
 10 files changed, 297 insertions(+), 75 deletions(-)
 create mode 100644 tests/plugin/syscall.c

-- 
2.20.1


