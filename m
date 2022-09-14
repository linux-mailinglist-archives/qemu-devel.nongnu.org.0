Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D005B8DD4
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 19:07:02 +0200 (CEST)
Received: from localhost ([::1]:35198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYVqn-0000Ff-Iy
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 13:07:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUxi-0005lI-SK
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:10:12 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:41939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUxd-0004P0-6v
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 12:10:04 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 az24-20020a05600c601800b003a842e4983cso11917087wmb.0
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 09:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=pHXwt+CX6FmWpN98IurSpcjgTpJWDiRcDg1aN1X0I2o=;
 b=ffWutsN6KxIm+Q7T6aKPJlp2CVrkIYqWCSYFFfhAfxuTY/iBrjiEpYsNa7mfyCHsug
 0LY2BEoiaP3sS7u+wA4YJPL4nKftm7iau1xBBlCK1ZrA1OBpmBwDgpOtGwcRGCODGfSb
 ej30MD8wwXlQc4mTV7mWPAOtX3taRULh8fUN6bIBpXtLmnXpWadIFBUE9YyMCcuaQ02m
 ZuHVzF3KQ57bYKAMqyF/PpZI2hTCZKwqrqlPPYg9oTv2ZrTSNRzn57yx3e3bMX2T2F7k
 rFEWWvKmGkQ7aK1wzcHhEOqZBiglab6LLJASqrkSGhpbPE1+i8JD+j9LAFRUf/m9o5aG
 PmBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=pHXwt+CX6FmWpN98IurSpcjgTpJWDiRcDg1aN1X0I2o=;
 b=s4Idfv6kF3ttHT9uEdrYBpsX1pY2APgX6fqixAIyeTkS7G4O/KCOCgkMHzr0Lnr27p
 o/G7TSAN1nSuQoi/AezXUK0NeukWIEiPpaFHfd1lnMZQ1Ob4nJFFvkPquOpf9l9h1NQv
 b4dHMliZn7j964Qc99Trt6uxGoz3yn/JxhQRPb0JZUBQLnYILW8kJxUc8YukZDYbB4TU
 z/xGtRKJmULGU9rkwzdchbxIDzh2Lm+Wf5zp620o2S7GCRQAKOsk/IQN4tHMh8rnPFIR
 eGoBSaE7QeQDXDm5R16v1lJmlfkp9JYSRQjUtfo6NAkcPWqRf7wsuhYkJaKxA43FDVOF
 MMoA==
X-Gm-Message-State: ACgBeo3mE1OZgbo42hZ4HaPwUDA+LF2Sr7Hyj3Jij1cCwUleH/4Zbc9t
 orkvUVuYXMZFMnyUojohPHbmBQ==
X-Google-Smtp-Source: AA6agR4U4+BfZrPHnFCjkFIcVZjh/wFj8OiUl9x6YvpyeBUJLW/8j6jBAD6Jvb9reB3nAzrN4E4csA==
X-Received: by 2002:a05:600c:4793:b0:3b4:7276:1c5e with SMTP id
 k19-20020a05600c479300b003b472761c5emr3815542wmo.118.1663171796318; 
 Wed, 14 Sep 2022 09:09:56 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t12-20020a05600c198c00b003b47e75b401sm13863904wmq.37.2022.09.14.09.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 09:09:55 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 304A21FFB7;
 Wed, 14 Sep 2022 17:09:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 0/4] use MemTxAttrs to signal cpu index
Date: Wed, 14 Sep 2022 17:09:51 +0100
Message-Id: <20220914160955.812151-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Hi,

This ostensibly fixes a bug with gdbstub when accessing the GIC state
(via system registers). It also proposes a pattern for removing
current_cpu/qtest_enabled() hacks in hw/ by passing the cpu index via
MemTxAttrs. For the ARM timer code we also assert that those accesses
do come from a CPU (as opposed to HW DMA attempting to overwrite
stuff).

We do need to audit helpers in target/ which use the address_space API
to read and write data and ensure they properly form their MxTxAttrs
so this works cleanly.

What do people think?

Alex Bennée (4):
  hw: encode accessing CPU index in MemTxAttrs
  qtest: make read/write operation appear to be from CPU
  hw/intc/gic: use MxTxAttrs to divine accessing CPU
  hw/timer: convert mptimer access to attrs to derive cpu index

 include/exec/memattrs.h |  4 +++-
 accel/tcg/cputlb.c      | 22 ++++++++++++++++------
 hw/core/cpu-sysemu.c    | 17 +++++++++++++----
 hw/intc/arm_gic.c       | 39 ++++++++++++++++++++++-----------------
 hw/timer/arm_mptimer.c  | 25 ++++++++++++++-----------
 softmmu/qtest.c         | 31 +++++++++++++++++++------------
 6 files changed, 87 insertions(+), 51 deletions(-)

-- 
2.34.1


