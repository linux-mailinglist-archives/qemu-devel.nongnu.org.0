Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DD9576311
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 15:50:37 +0200 (CEST)
Received: from localhost ([::1]:41954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCLiG-00041t-Vy
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 09:50:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oCLgK-0000Ml-Fv
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 09:48:36 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:38879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oCLgI-0006sV-MP
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 09:48:36 -0400
Received: by mail-pl1-x635.google.com with SMTP id k19so3278541pll.5
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 06:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=81amebdTj/sFHNo/UeydOLOVbjTcmTqGFQIdlNPLf9o=;
 b=Z/SNrVPqdAe7S/8odfiTJNLC+2najhfd+bfhWZXXFrC3rUzLMX7TL7YH1pjMAlpkRd
 CsDy+KCxJPqhWxSuac1dqnDQaSx5SfxlhkmQN3gf0DspcoKQVEw8qjNIGBA37Au8X/xw
 i3kHk5F/1tZTviyHfWUZJ5XcEYT1SU1LiDuQuhu4rFnTYXifD6Q6++UXZtR5dGJSwNOk
 1x+e41FZSrZZmk/OstLrn3pk6oPcykSDz3YuQ4F98ZyUeJnQo5FjjBDw81CMOCN0hWqe
 Q2cs9nsNbJoH7n5fpDJOxWh1HR+2WzDlFzgAVYWmsEoEePQusxjWHBYl7BZwVFsL9i5A
 A6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=81amebdTj/sFHNo/UeydOLOVbjTcmTqGFQIdlNPLf9o=;
 b=0BNnCeB27JP0kOTHFGZSmq7LRkullt6FBcPuL07/p9h8Xq53T9QvXVlflJieG0Ksur
 N44ztr5f0Eqr7GiE1CT5+eeyCNRqqcaQO3PJkhe+z0L4/u0ilpLnz1CnPNwrl10jE39l
 cbBOe2M3TZp+qXq9+Rs++dt4M0QX0KBkd6uMGJHv45SPjQ+aHb2b2KIjdO09bHwqsn2f
 i4ZszFQCWbdXyTBom1ujzl+ThmBu7xfs8VCi2woGe/GK5r+mGbJJuugduAP1AvBgPCCP
 fSs53JyRhP8xatrZoq7QVFEKcHojwNSlpLW4H+BA2CndUwCrVauc8ZcJ1H8Pssc6N/xr
 sObw==
X-Gm-Message-State: AJIora83nGGgedi3KPtxIDALPj2vnTWLh8r9enZ5UpDYKxaisFSNOf47
 MpUVIO/1PRC2jf5TrHBo5h4jtxmL74s=
X-Google-Smtp-Source: AGRyM1utNkQYjS1J+oUuoyT3sjq09nsma7ySq/eUaWb+pm4S2nhbID99F/tg9NeGfp7EeA59J/4F2g==
X-Received: by 2002:a17:90b:240b:b0:1ef:8a68:1596 with SMTP id
 nr11-20020a17090b240b00b001ef8a681596mr15683304pjb.234.1657892912652; 
 Fri, 15 Jul 2022 06:48:32 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d554:ffbd:f962:2efd])
 by smtp.gmail.com with ESMTPSA id
 x22-20020a17090a165600b001f035bfcc53sm5579126pje.18.2022.07.15.06.48.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 15 Jul 2022 06:48:32 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v3 0/3] ui/cocoa: Run qemu_init in the main thread
Date: Fri, 15 Jul 2022 22:47:47 +0900
Message-Id: <20220715134750.63090-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

This work is based on:
https://patchew.org/QEMU/20220317125534.38706-1-philippe.mathieu.daude@gmail.com/

Simplify the initialization dance by running qemu_init() in the main
thread before the Cocoa event loop starts. The secondary thread only
runs only qemu_main_loop() and qemu_cleanup().

This fixes a case where addRemovableDevicesMenuItems() calls
qmp_query_block() while expecting the main thread to still hold
the BQL.

Overriding the code after calling qemu_init() is done by dynamically
replacing a function pointer variable, qemu_main when initializing
ui/cocoa, which unifies the static implementation of main() for
builds with ui/cocoa and ones without ui/cocoa.

v3: Document functions involved in startup. (Peter Maydell)

v2: Restore allow_events flag to fix the crash reported by
    Philippe Mathieu-Daudé.

Akihiko Odaki (3):
  ui/cocoa: Run qemu_init in the main thread
  Revert "main-loop: Disable block backend global state assertion on
    Cocoa"
  meson: Allow to enable gtk and sdl while cocoa is enabled

 docs/devel/fuzzing.rst   |   4 +-
 include/qemu-main.h      |   3 +-
 include/qemu/main-loop.h |  13 ---
 include/sysemu/sysemu.h  |   2 +-
 meson.build              |  10 +--
 softmmu/main.c           |  14 ++--
 softmmu/vl.c             |   2 +-
 tests/qtest/fuzz/fuzz.c  |   2 +-
 ui/cocoa.m               | 172 ++++++++++++++-------------------------
 9 files changed, 78 insertions(+), 144 deletions(-)

-- 
2.32.1 (Apple Git-133)


