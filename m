Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 034FD393364
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 18:13:56 +0200 (CEST)
Received: from localhost ([::1]:51950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmIdv-0006Na-4A
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 12:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lmITv-0005Ah-0b
 for qemu-devel@nongnu.org; Thu, 27 May 2021 12:03:35 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lmITq-0000Mk-D4
 for qemu-devel@nongnu.org; Thu, 27 May 2021 12:03:34 -0400
Received: by mail-wr1-x42b.google.com with SMTP id q5so426749wrs.4
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 09:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qsKYmPQ+MgbAD/xad+rN6rLSYydv7lDDEek/E7q8yMg=;
 b=nuwZ5782+p5fJ+QiHy/eTkbkoVTlcBu8GE1z2o0mt1IRREF0NddXKm/TLQa80jCKGB
 sCQioiMZFqCNcmleAhKmOfJ9bpHxjGwj9WG9b2A73dhoT/7r1EeZYBYtoQlC/g6UMZcw
 7qFWfKqFV5i16acEuVAmJdGSqZByLp5cU5PfGEyRgVUM6BuvqBhlT9s6h5qvtEhkn1wp
 0vb9gLYYw+6qpi+2ahhvGg/8sSNRdjz1XKV+16IecklKvFOhDYtGw82N/I69LP2Bf0ZQ
 kdiOUrl8j8elUvKnNnqEOgY+YkWtdhTJQooMWCgzVp9dzD6nWogLcHLTif612Sqg9r5S
 +u9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qsKYmPQ+MgbAD/xad+rN6rLSYydv7lDDEek/E7q8yMg=;
 b=JwsFtmhNm+a5d9HEJlxpxHmTbc0eczmfDPascwix06w5vd0sWVaxGVO3fF6FQfEQw3
 T11V3/a35tTDPB/tF4owUx/Sblt2sqg1+WTq9SS89r9FUr8M0WV342oDLklcqqaBaSiJ
 XuPO0gjI0sP0w5obLnTFco5p2EXTHYzyYCV82vdEmKjUrY47yuXE/PA0+vDHzU3K0oHa
 5brY9O1RKTnjnmH1gQ5ueY295Y0RylSHbu6+zG5BHOZ0NaCveUbvr7CSSKj90yQITEnR
 M99QfHDRuzrdYJJtxIHFTNsqQRjdDzmBTvjwjmymDZMoXVfdVx8RFI0+d8OjtPBgpu9g
 St/g==
X-Gm-Message-State: AOAM532ERCDRH+HsE57D3XX9yIMnwzddNBQuBRf8Q+I0q47NJgh9GEVK
 czDDQQP87v1g8LIzeAMyHLVPYQ==
X-Google-Smtp-Source: ABdhPJzF4ZcklrrLnXSAqVYn8rZBat1h+nSBAmxuoDYsc4/sfgb1vQ1r5iBrdrshz/whwZ+FEl0exw==
X-Received: by 2002:adf:e88b:: with SMTP id d11mr4274301wrm.392.1622131406181; 
 Thu, 27 May 2021 09:03:26 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s14sm3609677wrv.56.2021.05.27.09.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 09:03:23 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 63AEA1FF7E;
 Thu, 27 May 2021 17:03:19 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 0/6] testing/next queue (signal, meson, acceptance tags)
Date: Thu, 27 May 2021 17:03:13 +0100
Message-Id: <20210527160319.19834-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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

This is the current state of my testing queue. I don't think there is
any pressing hurry to get this merged.

I should note I'll probably need to drop the signals test in any PR as
it's still causing some intermittent failures on various system.

The tweaks to acceptance tests need the additional support from
Phillipe's series:

  https://patchew.org/QEMU/20210526170432.343588-1-philmd@redhat.com/

They following still need review:

 - tests/acceptance: tag various arm tests as TCG only
 - tests/acceptance: tweak the tcg/kvm tests for virt
 - tests/tcg/configure.sh: tweak quoting of target_compiler
 - meson.build: fix cosmetics of compiler display
 - tests/tcg: add a multiarch signals test to stress test signal delivery

Alex Bennée (5):
  tests/tcg: add a multiarch signals test to stress test signal delivery
  meson.build: fix cosmetics of compiler display
  tests/tcg/configure.sh: tweak quoting of target_compiler
  tests/acceptance: tweak the tcg/kvm tests for virt
  tests/acceptance: tag various arm tests as TCG only

Philippe Mathieu-Daudé (1):
  gitlab-ci: Convert check-dco/check-patch jobs to the 'rules' syntax

 meson.build                            |   8 +-
 tests/tcg/multiarch/signals.c          | 149 +++++++++++++++++++++++++
 .gitlab-ci.yml                         |  16 +--
 tests/acceptance/boot_linux.py         |  24 ++--
 tests/acceptance/boot_linux_console.py |  18 +++
 tests/tcg/configure.sh                 |   6 +-
 tests/tcg/multiarch/Makefile.target    |   2 +
 7 files changed, 197 insertions(+), 26 deletions(-)
 create mode 100644 tests/tcg/multiarch/signals.c

-- 
2.20.1


