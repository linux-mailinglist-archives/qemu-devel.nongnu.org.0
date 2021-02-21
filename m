Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46635320E6C
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 23:57:57 +0100 (CET)
Received: from localhost ([::1]:57170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDxfo-0002cE-3X
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 17:57:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDxeS-0001GH-RQ; Sun, 21 Feb 2021 17:56:32 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:33245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDxeR-0000Xo-Bx; Sun, 21 Feb 2021 17:56:32 -0500
Received: by mail-wr1-x429.google.com with SMTP id 7so17186236wrz.0;
 Sun, 21 Feb 2021 14:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VD+cjb3EnEENiAZZm9EnB2Oy0NBOH1rk1BQCyawm+7Y=;
 b=khgHZR70A9AWYtabJ1UthOlvy/4E0Jhx1Ti2dyV8LqMHqmD86DXIGfeGi7nxnnA1UR
 L5G1fSAcdbhfBMHvnbLos8izVxjYuen/cIac7ThK3VZ5mWotqK6p/FBvd1Zq7kJ8+pn5
 QmBfFfFWaB1tA60NXBedv9MWmoNN33S0drdsVUmPtYmPsWdytA2DbKmeTSCGRZNBWbQg
 ViG4yRlXMyzezh2E/wJnUap15Zvi7yFAw+0QDCeG8lCKWD/r3j7bgzFB0NfLcrgiW56X
 178A393t3jhP0YjdEeN1kU05DGcg0V/D/1FByHEWQiPsjMDmk4WYSpX/V8IN0tTISYQS
 9W9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=VD+cjb3EnEENiAZZm9EnB2Oy0NBOH1rk1BQCyawm+7Y=;
 b=bsvPVZLwj/NkjADA1timZ86FMAVEqElOOSnxLxnUAo9842fiPZLgGUXQF9ktZp9NXR
 Ksy93DP31zssSYYU+1BlTszJdHjGF1lynpXzTd6TX0nREfk5kt5BFgKPcZ/MTYZFhcfa
 mBLncT8ZA7LEK5lrIhWjrnckTYaR6O5Z5/QhXwWNxZ1P7iHud6zb4BJoyVGzM0a7rlcU
 3uLnOrnlBBRAYdlIxhX4XcHOkAc3H4kPvF7UIKSOb6yP4g6vjsj4ZpO8M5RjWdRi3yXJ
 BMhUjEuidhnlA+uMEgTpWhTRaLCKDL5P6XQxTlXzXAr+P2gO8ksuhpkptj2i1R0wX9Ez
 oISA==
X-Gm-Message-State: AOAM532mhrGmrIVZZsm7IYm7bIfbOLKNaMQI8pos/l8nLEirZJhog0u9
 4EXnEquhYEQj4fjpLJfoSlgEYaB3in8=
X-Google-Smtp-Source: ABdhPJxuXja83AzRbxl8zCrU3qI7L4P4FY/qNdllgn0ha+Yv7+T1AXxZySi2oEL70kUFXapqhYx35Q==
X-Received: by 2002:a05:6000:c9:: with SMTP id
 q9mr19665002wrx.338.1613948189013; 
 Sun, 21 Feb 2021 14:56:29 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f7sm26490633wre.78.2021.02.21.14.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 14:56:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] hw/lm32: Kconfig cleanups
Date: Sun, 21 Feb 2021 23:56:23 +0100
Message-Id: <20210221225626.2589247-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Michael Walle <michael@walle.cc>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Laurent,=0D
=0D
This series is fully reviewed. Since LM32 is not very=0D
active, can this go via qemu-trivial@?=0D
=0D
Thanks,=0D
=0D
Phil.=0D
=0D
v2: Rebased=0D
=0D
Supersedes: <20210208135048.2601693-1-f4bug@amsat.org>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/lm32/Kconfig: Introduce CONFIG_LM32_EVR for lm32-evr/uclinux boards=0D
  hw/lm32/Kconfig: Rename CONFIG_LM32 -> CONFIG_LM32_DEVICES=0D
  hw/lm32/Kconfig: Have MILKYMIST select LM32_DEVICES=0D
=0D
 default-configs/devices/lm32-softmmu.mak |  2 +-=0D
 hw/char/meson.build                      |  4 ++--=0D
 hw/intc/meson.build                      |  2 +-=0D
 hw/lm32/Kconfig                          | 10 +++++++---=0D
 hw/lm32/meson.build                      |  2 +-=0D
 hw/timer/meson.build                     |  2 +-=0D
 6 files changed, 13 insertions(+), 9 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

