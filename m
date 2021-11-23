Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7172645ADB2
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 21:59:31 +0100 (CET)
Received: from localhost ([::1]:35736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpct0-0004MC-0X
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 15:59:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mpcr9-0001ui-FG
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 15:57:35 -0500
Received: from [2a00:1450:4864:20::429] (port=35616
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mpcr7-0006LH-H1
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 15:57:35 -0500
Received: by mail-wr1-x429.google.com with SMTP id i5so222116wrb.2
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 12:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xl5Vgk0YQyYb1wxD/Ut57kOMsbfZbkXQIZ0at/zZwfg=;
 b=ahz7yv7bCIhw1V71QWFxmiA+WyXwrq4lGkH+m+1krERN7x5pRBHmUPUKwsm68e/QQo
 X7wDaikSws3yzM0yq/z2vusPKc0AaSJ4YTKaq3XRGlrKOT+ci2i9KyCvWqHJMd0zthaX
 LolBpQPQfWJYVvE7m5c4BHY30HQLk+AesKdjZr3Y6TfTmAx+7VDIWREpCaWQ0IKPy/SK
 cRM+/ICu2ZfhcdCyud/L87W1Cjs/byh3gLFr8rjAFQh9Ehro4gSijvOxZNmiwWJeXA8Q
 tumj6WPi4Z4tARtRoLk1SG4TWXzw/E7gQx2sbUmPUdOwDW3l6Rmhzv8WP28+XpTh88zl
 yEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xl5Vgk0YQyYb1wxD/Ut57kOMsbfZbkXQIZ0at/zZwfg=;
 b=EY4KNs6E1lBMVEeyrIBnTMJ9UC43sB9nSV15r48xxKkK9f0FxiXGED1FGnBsIDDFFG
 0Qs85QDXYV7aQ/VyyN5phX/Rv7b7dumica3NGOeryWbKaYT9wYimlALUsbVe3LQpVNvG
 tvBqTKPTp6hSB5rQkuNRzED/khl2CTTbzZ8fUb7+iMLPxvYx7nsZoeCJwDESL2ESeGjl
 Vp2VO92/+RB0owaMYkf7LtnV75G99CvI/irY7aT2J+uayhpj0DW2fHM6LF0kOvsPcPc1
 FDuB5pQAmmYXZel42rGcrMAntC0WtNLgP22oEcFyk4PZ9pMfvaWkt8nUDToKP8CzGFCk
 TeWg==
X-Gm-Message-State: AOAM531iP6n1cu9plZlPl1gpOQ7dhrF2aGiacTjoFTaToO7mp2l+N+oO
 S0JGAncfD7b+5VWL5E4u1dcrNA==
X-Google-Smtp-Source: ABdhPJwJzTasmaBTXHSfgxGEOp9y9nthxh0MwmsGDqY9Rb5LQr7zkZ9YWfnRxdTGb7o/FjUFkpXs3Q==
X-Received: by 2002:a05:6000:1c2:: with SMTP id
 t2mr11256705wrx.378.1637701051542; 
 Tue, 23 Nov 2021 12:57:31 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l18sm13220684wrt.81.2021.11.23.12.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 12:57:30 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 28FAA1FF96;
 Tue, 23 Nov 2021 20:57:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 v1 0/7] more tcg, plugin, test and build fixes
Date: Tue, 23 Nov 2021 20:57:22 +0000
Message-Id: <20211123205729.2205806-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
for-6.2 tree. There are fixes for TCG, plugins, build and test.

The following still need review:

 - plugins/meson.build: fix linker issue with weird paths
 - tests/avocado: fix tcg_plugin mem access count test
 - accel/tcg: suppress IRQ check for special TBs

Alex Bennée (4):
  accel/tcg: suppress IRQ check for special TBs
  tests/avocado: fix tcg_plugin mem access count test
  plugins/meson.build: fix linker issue with weird paths
  gdbstub: handle a potentially racing TaskState

Pavel Dovgalyuk (1):
  softmmu: fix watchpoint-interrupt races

Philippe Mathieu-Daudé (1):
  MAINTAINERS: Add section for Aarch64 GitLab custom runner

Willian Rampazzo (1):
  MAINTAINERS: Remove me as a reviewer for the build and test/avocado

 include/exec/exec-all.h      |  1 +
 include/exec/gen-icount.h    | 21 +++++++++++++++++----
 accel/tcg/cpu-exec.c         | 19 +++++++++++++++++++
 gdbstub.c                    |  2 +-
 MAINTAINERS                  | 10 ++++++++--
 plugins/meson.build          |  4 ++--
 tests/avocado/tcg_plugins.py |  2 +-
 7 files changed, 49 insertions(+), 10 deletions(-)

-- 
2.30.2


