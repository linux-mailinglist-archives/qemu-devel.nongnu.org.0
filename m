Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A18599CEC
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 15:33:12 +0200 (CEST)
Received: from localhost ([::1]:42360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP27b-0001fa-AW
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 09:33:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oP22v-0004jV-Io
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 09:28:21 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:34522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1oP22n-0001yK-7n
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 09:28:21 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 12so3717089pga.1
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 06:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=qSlwFhmCa1m3kEKBc6ItndjENyAZMPOMrMeDLzZqhWY=;
 b=fRsXbN8Y+/30SjUJt481QkNXYnTTq65ViKDn4ZOZp6RE/QQOBE+TWzqyaRDemQs78H
 8OaWjpaHxwegoQKMRGnzxptm0Q/KdNo/8joeFOL0+CH8WEfD5iGERAnI2mzl5b3Oomlq
 y3OPwVgp06HAKHD2FzspnpFMCOD9CXGOWSTosl2fX+uZswqflZ5RvSfkcX5XqjDlfZAf
 PB6/6VbbVGK1nWuQXciJXwdtPfayP9xeSxpxMcAgelQvLprXlIEdBdlz7o87vMJuirlc
 KoTc6ECyiN1b0htCZElmVUF/DHXTzoxmb4vWyOy8fhC82ou+AXTV10n6aaVrNg0JxMz/
 D3Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=qSlwFhmCa1m3kEKBc6ItndjENyAZMPOMrMeDLzZqhWY=;
 b=YQS6qC4MQa8W9jyqlEAcDwQKjopm9l0FyBWwslwTfClf2BBaLlhWrbGLOlUTH4Gi2M
 LtuVQRQguoM3Ci0j3ZfHwz3NFmPbvSvaFPoBDW/TTzvu0olBwvUU5bS9OgiJ8jDy/GTv
 3gFiDQGvimz4LeNcIAi1x+1HCnvqkoq9lv0sHG0QHBX9Orq8/f+1fmXc+UvhzFT7TPrW
 dj+wNVVYznXJ3GKR9OYK0zWCxBiXGdqf97h/fki9iEOuW2Q6bPbRgqJIzUH9lI9mt5PY
 kD2k21PTxOFJl+G5CS+kAac3WSPubg72vlR1BkO7ta+OUfOxraw+OZ2FWvbhlRx5Za/g
 JDIA==
X-Gm-Message-State: ACgBeo3GvWoPigqb3c/VklDc8x9bc1FB4x++QXMg0A9q2G5lf5CN8FDU
 amDfsd6VDO8nqizjjsLD77ov7TkFaC4=
X-Google-Smtp-Source: AA6agR5c5R9NVXGY7Au6vrDrFsyN0B+maJqsBrjAh29l6e+QDwDoILMUuHWfX4IMTykX6bZy5ohrFg==
X-Received: by 2002:a63:fb4a:0:b0:429:8605:6ebf with SMTP id
 w10-20020a63fb4a000000b0042986056ebfmr6250745pgj.225.1660915691013; 
 Fri, 19 Aug 2022 06:28:11 -0700 (PDT)
Received: from localhost.localdomain ([2400:4050:c360:8200:c4c3:cfa3:24fd:3a7])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a1709026b8400b0016edb59f670sm3195005plk.6.2022.08.19.06.28.08
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Aug 2022 06:28:10 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v5 0/3] ui/cocoa: Run qemu_init in the main thread
Date: Fri, 19 Aug 2022 22:27:53 +0900
Message-Id: <20220819132756.74641-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

v5: Rebased to 4d65d4ba57372c57a1236fb5cb789dbcc100645c, restoring the
    exit() call in call_qemu_main() and dropping Reviewed-by from
    "ui/cocoa: Run qemu_init in the main thread".

v4: Asynchronously call -[NSApplication terminate:] to avoid potential
    deadlock with qemu_thread_join(). (Paolo Bonzini)

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
 include/qemu/main-loop.h |  13 ----
 include/sysemu/sysemu.h  |   2 +-
 meson.build              |  10 +--
 softmmu/main.c           |  10 +--
 softmmu/vl.c             |   2 +-
 tests/qtest/fuzz/fuzz.c  |   2 +-
 ui/cocoa.m               | 144 ++++++++++++++-------------------------
 9 files changed, 64 insertions(+), 126 deletions(-)

-- 
2.32.1 (Apple Git-133)


