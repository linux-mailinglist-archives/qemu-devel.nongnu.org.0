Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D029C6510F0
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 18:09:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Jcc-0000zN-9n; Mon, 19 Dec 2022 12:08:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7Jcb-0000xY-0E
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 12:08:13 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7JcZ-0008Bz-14
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 12:08:12 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so6971202wms.2
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 09:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xaXGuhLi91XWyNiiryTG48wBfMhNq5IwN4LER27KkvM=;
 b=YcKbtRGVyodItQdFrAbja+VAzuD2RwlblueAI6XfW2+00Nmem+GqNg6zt9q3XWgcK+
 FP6jcFRLKkP5XovQQyFIb542ZqgRi85+miOWIt0QRRLrOheMKDqSw6b0snAV77hE51hJ
 BuMCiuY3a+ImJfYvtjMrGeXpWuyQb0MchJt0BxN6RxUAZrL1D/bHSLPqtCR7HwQyk90v
 TNTGj7zRvIkJ4dFpHvriQBFSqsvlmMB/5eXT1z2t7+yZdlmXjug1PBdLPvEtEepEs3no
 4lx5LhDErkHvuXB0YSi1BTU40LF0K+SyrNK3Tj6hq98GX6Y+IbtQjcz70YyeM9r4zZue
 IQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xaXGuhLi91XWyNiiryTG48wBfMhNq5IwN4LER27KkvM=;
 b=qjeHiDJzTunXjvptY83oQ9aPt24G5BmgSzzyyB2tTWVNB3+bHlCmkj72/Op7ZiksdH
 B+Pojubr00JvQYOFAMvbTQaG5hcSP2Ghv9otJ7RhfZESndNJheBHQT0Xcr/Ovp6uyW2T
 GMZAylmU8VXHXqy2cm3Lp+vBvg6NBHlieJjckT1rZ02PzGmIWa/UvFlO01RHP5FixRbu
 4JC+7/ZcOGAA5jhNJENS7FyHEMqOevH63+yfBVep+50J7+leTeSQgcMuX+BYkA39hCR7
 dKT5dJycxTLMD0aomMUlBNoWL8+F2ONEPFOo3K6+8gPMMVZnr4tX1BeJjfAepwhaee2F
 60UQ==
X-Gm-Message-State: ANoB5pn9hyrhATcLRiztXK5CwibSLft1ow8LUixuO15YXT8Z87geneG0
 mGT095pscWtVx0KqYgkt+7uhjGmGyI97GN9ksMQ=
X-Google-Smtp-Source: AA0mqf6eVnoxE8oZzyZMK6jmzsFJPjL4JTOwPWYXV/HpOH3KKiu5/RX+iMzak4y33J2o9w+uwIE8Rg==
X-Received: by 2002:a05:600c:4f85:b0:3c6:f732:bf6f with SMTP id
 n5-20020a05600c4f8500b003c6f732bf6fmr33633653wmq.13.1671469689040; 
 Mon, 19 Dec 2022 09:08:09 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a05600c0b4b00b003c5571c27a1sm15184563wmr.32.2022.12.19.09.08.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 19 Dec 2022 09:08:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Yanan Wang <wangyanan55@huawei.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Riku Voipio <riku.voipio@iki.fi>
Subject: [PATCH 0/5] exec: QAPI housekeeping for user emulation
Date: Mon, 19 Dec 2022 18:08:01 +0100
Message-Id: <20221219170806.60580-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Since there is no monitor in user emulation builds, we
don't generate the QAPI headers for the QMP commands.

I'm not sure when the --disable-system --disable-tools
configuration started to bitrot; it might not be super
important, but I'm using it to better sort SYSEMU vs
USER code, so I need to get it building again.

I'm trying to split a big series in smaller ones to reduce
maintainers spam.

Philippe Mathieu-Daude (2):
  replay: Extract core API to 'exec/replay-core.h'
  tests/unit: Restrict machine-smp.c test to system emulation

Philippe Mathieu-Daudé (3):
  exec: Remove unused 'qemu/timer.h' timer
  tcg/tcg-op-gvec: Remove unused "qemu/main-loop.h" header
  accel/tcg: Restrict 'qapi-commands-machine.h' to system emulation

 MAINTAINERS                    |   1 +
 accel/tcg/cpu-exec.c           |  91 +---------------------------
 accel/tcg/hmp.c                |  14 -----
 accel/tcg/internal.h           |   3 +
 accel/tcg/meson.build          |   2 +-
 accel/tcg/monitor.c            | 105 +++++++++++++++++++++++++++++++++
 accel/tcg/tcg-all.c            |   2 +-
 accel/tcg/translate-all.c      |   1 -
 accel/tcg/translator.c         |   2 +-
 accel/tcg/user-exec-stub.c     |   2 +-
 cpu.c                          |   2 +-
 gdbstub/gdbstub.c              |   2 +-
 hw/core/ptimer.c               |   2 +-
 include/exec/gen-icount.h      |   1 -
 include/exec/replay-core.h     |  76 ++++++++++++++++++++++++
 include/sysemu/cpus.h          |   1 -
 include/sysemu/replay.h        |  67 ++-------------------
 stubs/replay.c                 |   2 +-
 tcg/tcg-op-gvec.c              |   1 -
 tcg/tcg.c                      |   1 -
 tests/unit/meson.build         |   2 +-
 tests/unit/ptimer-test-stubs.c |   2 +-
 util/guest-random.c            |   2 +-
 23 files changed, 203 insertions(+), 181 deletions(-)
 delete mode 100644 accel/tcg/hmp.c
 create mode 100644 accel/tcg/monitor.c
 create mode 100644 include/exec/replay-core.h

-- 
2.38.1


