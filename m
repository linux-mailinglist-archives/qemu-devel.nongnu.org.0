Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7068F4617C4
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 15:15:12 +0100 (CET)
Received: from localhost ([::1]:49176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrhR1-0007vq-GI
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 09:15:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mrhLi-0001BX-PJ
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:09:42 -0500
Received: from [2a00:1450:4864:20::330] (port=33347
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mrhLg-0006UC-Uw
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:09:42 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso11023531wmh.0
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 06:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G4oFQXcKYo2o98r+NeoUx3AdzYgCvRjhTAswdB5RUo0=;
 b=y6LUIMAb3ZYF6D+9HB1ndjq9vHG0R1qYYSOCwXUSPE9aLECvNYkH2QxQBoc3j7PloT
 k4zJd9HaFzrrgXGyWbaBGKArTA8SYjvdzxoim0E058d8wAaqFZjYD6eSBYAg9fE91guu
 ZzI8lgs50TQckkNC5/3KHGX2wJLsaK2xWgSjq/wmOQrpXYOLed3WmFAN3UXAfpnQ68Zi
 DhyJe0NVn5Q9JfX1OHLZySgYdZeBIYDR0owLbstMxTdr1v3l4+DfkqHbfndkladQmeij
 xfLRac5wsRn9Y9rDf6vr8wG/CF11Zfp6FdYfWKhRXQ5fAarTBviB4VZvX6Tqd6oBQcr/
 /DhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G4oFQXcKYo2o98r+NeoUx3AdzYgCvRjhTAswdB5RUo0=;
 b=hAq/IjqZmRCXJvsDEuWS4fgA5OvpSs8S1zd1lipRKPOTymdI7w/euBVGSZq+YSekp6
 yIZl4MVA6y/76wVTygjjJVOiF0IyiAxiwVBdEVDZVGbw6uV73myxTTd1RVr7F3QUooJi
 M5+vRxrJoApvvowVoSpGR7hSwWuEtUEM9pKwh4rWGoVaHp8p93cFm+HQQjkFltTKwGWe
 8EF/uHhmB5Y2R2+izrPvxW36NuoMqz67YG0S0uiJJ5xaXter2INBThEcaKeEVfMrsY9U
 fkIb43tqAqgqCGvyIm+Ff9Oay/ZORb7LAR2y4aRHpprmMnNsfBGhDhbw7Katvv95d1CV
 gy+w==
X-Gm-Message-State: AOAM5310KWSgNXVatVd/dfozmH4/Yrt6iHYFFiq6alTChPdVD4uKQllh
 ZW8U1E6NicA8gvP3GpRCeKujxg==
X-Google-Smtp-Source: ABdhPJyImeWU96maE3XG2AtxI7KW93XNgU33JQbNinyX//EjW8wmSFl8+JkbQuQ39ADRso0/A9DdbQ==
X-Received: by 2002:a05:600c:3c8a:: with SMTP id
 bg10mr37383090wmb.106.1638194977153; 
 Mon, 29 Nov 2021 06:09:37 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n15sm20980668wmq.38.2021.11.29.06.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 06:09:34 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E44C91FF96;
 Mon, 29 Nov 2021 14:09:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 v3 0/8] more tcg, plugin, test and build fixes (pre-PR)
Date: Mon, 29 Nov 2021 14:09:24 +0000
Message-Id: <20211129140932.4115115-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

As the release process rolls on here if the current state of my
for-6.2 tree. There are fixes for TCG, plugins, build and test. I;m
going to declare this a pre-PR series so I can roll it as soon as the
final review comes in.

Only a single change for v3 (accel/tcg: suppress IRQ check for special
TBs) to cover more cases. I've also slotted in simple warning cleanup
for the syscalls plugin.

The following still need review:

 - accel/tcg: suppress IRQ check for special TBs

Alex Bennée (5):
  accel/tcg: introduce CF_NOIRQ
  accel/tcg: suppress IRQ check for special TBs
  tests/avocado: fix tcg_plugin mem access count test
  plugins/meson.build: fix linker issue with weird paths
  gdbstub: handle a potentially racing TaskState

Juro Bystricky (1):
  tests/plugin/syscall.c: fix compiler warnings

Philippe Mathieu-Daudé (1):
  MAINTAINERS: Add section for Aarch64 GitLab custom runner

Willian Rampazzo (1):
  MAINTAINERS: Remove me as a reviewer for the build and test/avocado

 include/exec/exec-all.h      |  1 +
 include/exec/gen-icount.h    | 21 +++++++++++++++++----
 accel/tcg/cpu-exec.c         |  9 +++++++++
 accel/tcg/translate-all.c    |  4 ++--
 gdbstub.c                    |  2 +-
 softmmu/physmem.c            |  4 ++--
 tests/plugin/syscall.c       |  8 +++-----
 MAINTAINERS                  | 10 ++++++++--
 plugins/meson.build          |  4 ++--
 tests/avocado/tcg_plugins.py |  2 +-
 10 files changed, 46 insertions(+), 19 deletions(-)

-- 
2.30.2


