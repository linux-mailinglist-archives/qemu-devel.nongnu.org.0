Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7453F572974
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 00:45:27 +0200 (CEST)
Received: from localhost ([::1]:54602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBOdB-0003Fs-QF
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 18:45:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBOBG-0007Hn-OH
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 18:16:35 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:54213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBOBE-0002R6-4R
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 18:16:33 -0400
Received: by mail-wm1-x334.google.com with SMTP id l68so5494678wml.3
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 15:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cDltY/+VrTgBzzpIhj6hMmyVQ2vK9x59l46uvYlTbpo=;
 b=mnNJV+Vknkc/WT0L/MCjFUImXKU7jRvTdMEMnnIVdo3+lEXyft+bxpCvTS7HNc5vVk
 vdTzErYWuZzZeb4D0mOeyRtoW5ZQBR6SUw+kK4KdXDDxfQpaiU6ae0j2GebgL4TLI1dL
 5nWDrbvoJNDVMGhPifoQbVT3jKugOgJ+PgnnsHdB0IaYqbDYo2IGexALD9JPh3oL4/Sw
 HoOoBXeEWPMHZDuFIJmmegr19raQqP6BWPtrs/SaApH/IJoy0CHBrFDT8y9XXq4LYfex
 GBNHLJ5aLNl6OdgbkDnMdQgn5IdeSP1XbW9X+cZA+JifrE4NLpi+uxdminA/wPm4hJgO
 Nv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=cDltY/+VrTgBzzpIhj6hMmyVQ2vK9x59l46uvYlTbpo=;
 b=OZJ7mlKyXm4iSP7Sd4vDwphIBwc7HjukFBnv7U5wBev9IIi/P8nrIoEpvyZYtFCdK9
 ZCtYJSzcYOe7o0VEbh8i6/RKCm3EBqnoI5HcG9Fp+SOXIHkAl2wifXCIj9utEkMyDBf9
 Zi23jIw9jBKdUbvP8j7cRiHNOmhVki7Ja68U+WPK8ILniBnzQsbhLs32CIR0PfWo47ZJ
 8KSrOrs4UVRPgr20SNn2rsvDMWP+sRtpnNZbEqGDwcHAa+9NBKpeEXoSJvXGEmWEGY7O
 Da2W8gku4htfIxmQhzCCuQTP5H1vfgULHPwd1hbBynd0TdO3rQeos8x8jH849uwxx42V
 Rhew==
X-Gm-Message-State: AJIora+VPUcFkIJxLckTUVm/DtnT2stla01W1DL2JTQSs27gtDiGGQlU
 ZixzzDVuMfMcneGIASMnddxHZ3rVwgdGvoWt
X-Google-Smtp-Source: AGRyM1uVj3IVmpwQg7PM7PeDRvVMecqa4GB8+pMEV2ouViUn8fp7QWoy5CMoW/17628CN0pa7FAUKg==
X-Received: by 2002:a7b:c31a:0:b0:39c:4783:385e with SMTP id
 k26-20020a7bc31a000000b0039c4783385emr6189175wmj.185.1657664189777; 
 Tue, 12 Jul 2022 15:16:29 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m23-20020a05600c3b1700b003a2e278510csm231563wms.15.2022.07.12.15.16.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Jul 2022 15:16:29 -0700 (PDT)
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Cameron Esfahani <dirty@apple.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 0/5] Darwin patches for 2022-07-12
Date: Wed, 13 Jul 2022 00:16:02 +0200
Message-Id: <20220712221607.9933-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

The following changes since commit 8e3d85d36b77f11ad7bded3a2d48c1f0cc334f82:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2022-07-12 14:12:15 +0100)

are available in the Git repository at:

  https://github.com/philmd/qemu.git tags/darwin-20220712

for you to fetch changes up to 50b13d31f4cc6c70330cc3a92561a581fc176ec9:

  avocado: Fix BUILD_DIR if it's equal to SOURCE_DIR (2022-07-13 00:06:02 +0200)

----------------------------------------------------------------
Darwin patches:

- Enable RDTSCP support on HVF
- ui/cocoa: Take refresh rate into account

Few buildsys fixes:

- Restrict TCG to emulation
- Remove a unused-but-set-variable warning
- Allow running Avocado from pseudo-"in source tree" builds

----------------------------------------------------------------

Akihiko Odaki (1):
  ui/cocoa: Take refresh rate into account

Cameron Esfahani (1):
  hvf: Enable RDTSCP support

Peter Delevoryas (2):
  ui/cocoa: Fix switched_to_fullscreen warning
  avocado: Fix BUILD_DIR if it's equal to SOURCE_DIR

Philippe Mathieu-Daudé (1):
  configure: Restrict TCG to emulation

 .gitlab-ci.d/buildtest.yml             |  2 +-
 configure                              | 20 ++++++++++++++------
 meson.build                            |  3 ++-
 target/i386/hvf/hvf.c                  | 26 +++++++++++++++++---------
 target/i386/hvf/vmcs.h                 |  3 ++-
 target/i386/hvf/x86_cpuid.c            |  7 ++++---
 tests/avocado/avocado_qemu/__init__.py | 17 +++++++++--------
 ui/cocoa.m                             | 20 ++++++++++++--------
 8 files changed, 61 insertions(+), 37 deletions(-)

-- 
2.36.1


