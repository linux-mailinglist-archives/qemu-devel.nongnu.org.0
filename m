Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AAD45DDCB
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 16:43:58 +0100 (CET)
Received: from localhost ([::1]:42666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqGui-0001cW-Vu
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 10:43:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mqGsh-0006V5-HR
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 10:41:51 -0500
Received: from [2a00:1450:4864:20::431] (port=37648
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mqGsf-0002Is-Do
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 10:41:51 -0500
Received: by mail-wr1-x431.google.com with SMTP id b12so12543527wrh.4
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 07:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FbzO+oW2ufG1AIjWLwSx5faB7B4B5beUF+L8Oq4gIdw=;
 b=KBzNVArwMMynCwEst24uZ0hZTFntDtuuSm75sXXXpxmkRiHbgCUdM4Jy9kNLv7YFMX
 BW+2rJYXy3gt+7tsiv3xYH4/37+H/dJg7PfNTFMGh9sT5QaxNdePMKEQ0SPmBOxoTJdP
 b26TryDY08Hj+Eg9zvlw3MwsnuA83NsGvU4xGI2I7CUew5nodCdkFxCto8CkCzuSOzA1
 cR0Hh2FFgu1D3nxo+0HoHMQRmVtpdiH2YOy2PR/0OgT3hWZUnCL5H8/Vr/Vutq5/I9Rh
 iOBA45Q6eONLpeudQYhxFfe9z7q58+VG14k3ipe0wcezKZf5NHnhhs/LK1LQnY3UPNlk
 +aIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FbzO+oW2ufG1AIjWLwSx5faB7B4B5beUF+L8Oq4gIdw=;
 b=3BkcX4tN3Uvb/e2vuK1IMFYi6KIDnv3y3qq2veYRytfk1LBzf/pIEiQgXsnsTj8UOw
 lxHGFAOcgrRjK9pjLw52bM3rP0drruAkH2CmjeLK7FJYx7S0fpMI1QNg4jzq6QZVP/GY
 yNbNgtyXG9fG7+Yj2nZbILxui/7wqXGyAbem6OxAZU4KYWfTC/Pl5yX5Z8WdNVukjJRN
 Keyb5PXE8gYxwriao/hLmodv/nz95T1V1np3ANzmqjMblwGshAQXyFf2vm+h4LWeegKy
 ABPzxgUpJQ8SFeWUeKX3gBmQgxVlERHYRQvfl8z2yUKZxLJJg/c+p8xTTYOsjnQFg1Sv
 wmDA==
X-Gm-Message-State: AOAM530wVQXXHc+6MUl8qehgkVXbuRKoChn35e+gB1qWhiYnQXuZMSx1
 vpA+TbBxF92+Prxuo7I6QHHigQ==
X-Google-Smtp-Source: ABdhPJx4Vzhmpq3KXiNYCQty/8krNEw5aH+wJWDiHlTVnM3n3uiY/BPtpix2nrlCpBWldd4oKO5i8w==
X-Received: by 2002:a05:6000:47:: with SMTP id
 k7mr7349445wrx.485.1637854907526; 
 Thu, 25 Nov 2021 07:41:47 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h17sm8348626wmb.44.2021.11.25.07.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 07:41:45 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F17E41FF96;
 Thu, 25 Nov 2021 15:41:44 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 v2 0/7] more tcg, plugin, test and build fixes
Date: Thu, 25 Nov 2021 15:41:37 +0000
Message-Id: <20211125154144.2904741-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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

For v2 I split the CF_NOIRQ patches and simplified a little bit. I
tested with a custom trace point while using watchpoints on the x86_64
memory TCG test. A proper test case would be nicer.

The following still need review:

 - accel/tcg: suppress IRQ check for special TBs
 - accel/tcg: introduce CF_NOIRQ

Alex Bennée (5):
  accel/tcg: introduce CF_NOIRQ
  accel/tcg: suppress IRQ check for special TBs
  tests/avocado: fix tcg_plugin mem access count test
  plugins/meson.build: fix linker issue with weird paths
  gdbstub: handle a potentially racing TaskState

Philippe Mathieu-Daudé (1):
  MAINTAINERS: Add section for Aarch64 GitLab custom runner

Willian Rampazzo (1):
  MAINTAINERS: Remove me as a reviewer for the build and test/avocado

 include/exec/exec-all.h      |  1 +
 include/exec/gen-icount.h    | 21 +++++++++++++++++----
 accel/tcg/cpu-exec.c         |  9 +++++++++
 accel/tcg/translate-all.c    |  2 +-
 gdbstub.c                    |  2 +-
 softmmu/physmem.c            |  2 +-
 MAINTAINERS                  | 10 ++++++++--
 plugins/meson.build          |  4 ++--
 tests/avocado/tcg_plugins.py |  2 +-
 9 files changed, 41 insertions(+), 12 deletions(-)

-- 
2.30.2


