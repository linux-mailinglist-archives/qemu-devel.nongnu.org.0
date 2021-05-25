Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A263902B9
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 15:46:53 +0200 (CEST)
Received: from localhost ([::1]:55926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llXOW-0001HB-UH
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 09:46:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llXMl-0008ES-GR
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:45:03 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:40521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llXMj-0005mI-OM
 for qemu-devel@nongnu.org; Tue, 25 May 2021 09:45:03 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 f6-20020a1c1f060000b0290175ca89f698so13481137wmf.5
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 06:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OeVlJTh8lkO4JN++x0Va04oGJ+tHihxJ121Pkv5m4oU=;
 b=unK3SaqoR5EyOhN+o1NVo76zHPOW5QNpT2mbLwveyzilz7/08tMRbQXp5BPJ3zmnlM
 jA52OdUzULKcOBZKF3gJmXFN65t7LDnVN79z3kIAsAhMY72cV+n6ITW+kOuMh/W+RRdE
 yaAWzln6AIAPAjwcoxjrtJok3jXIHto5XULqVeIbZaUf0K45wafSCb4dD0jn1jqfr7Ju
 b/3HDiyYkyWneXcYqaq/IbLkbsCkCjLKfJQfg6Az6QNGtsFM0pBbyfLBUQEhVUrAT7o6
 LYMKExJlAvoqdAIHuKwJLzL/yrvPimjPLFhdgoIxj/jQDi3rzdnZwv5Id6mJSwgWN8CV
 HrKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OeVlJTh8lkO4JN++x0Va04oGJ+tHihxJ121Pkv5m4oU=;
 b=bLUE60jRXrE5qvtryryikcgIW1Q4K7PMAcP5wW+zij0/CvlPir7KnaGYHfSOxT2XpY
 py+FIdy8mhQLRMXy648t7yDPN5SiGXo1yOKNOBLV0ALR0ZaP6KJ9uRVuRWaozyRoqda9
 4zDys3LOypuaUjmq/rx3ivCt51rgjed2DN8UENW8vzqtT4CKG0Bnk/GghbWyAgA0/Tcv
 3KddFK2q/DjIo/q7i/vzKRqPTd5FSSt+nMuWcFuaJyPG7HOBhzt0iJm6dvgs0F9wJtEl
 ZJVZgSr3NSGFcA8x8pNMuAJy4lrAS7YbQvND2NkeeBQs5pGxPuJD4X0dsl9eLqkopc1n
 u/ZA==
X-Gm-Message-State: AOAM531dGbYrtPhjIEoH8mE8h62jV8BPLKKyx7eljNGikXl7wyKrUCz6
 SPbPHdMRTQI+qroMfSiWnqZH2kD7x1Jb4O0E
X-Google-Smtp-Source: ABdhPJxMZbIPOS7hJs33mdRUE7Vw6BgLifdxbhA1awemS2b+8oG3O7DIe68ISQ+Z/TBib1A21rLEyg==
X-Received: by 2002:a1c:4b13:: with SMTP id y19mr3968616wma.102.1621950300074; 
 Tue, 25 May 2021 06:45:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t7sm15794460wrs.87.2021.05.25.06.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 06:44:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] tests: Fix some minor Coverity issues
Date: Tue, 25 May 2021 14:44:52 +0100
Message-Id: <20210525134458.6675-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have a backlog of Coverity issues in tests (because we only
started running the scan on test code when we switched to meson
and started building the test code in "make" rather than only
in "make check"). This series fixes some of the easier ones.
There's nothing exciting here, it's all little nits.

thanks
-- PMM

Peter Maydell (6):
  tests/qtest/bios-tables-test: Check for dup2() failure
  tests/qtest/e1000e-test: Check qemu_recv() succeeded
  tests/qtest/hd-geo-test: Fix checks on mkstemp() return value
  tests/qtest/pflash-cfi02-test: Avoid potential integer overflow
  tests/qtest/tpm-tests: Remove unnecessary NULL checks
  tests/unit/test-vmstate: Assert that dup() and mkstemp() succeed

 tests/qtest/bios-tables-test.c  |  8 ++++++--
 tests/qtest/e1000e-test.c       |  3 ++-
 tests/qtest/hd-geo-test.c       |  4 ++--
 tests/qtest/pflash-cfi02-test.c |  2 +-
 tests/qtest/tpm-tests.c         | 12 ++++--------
 tests/unit/test-vmstate.c       |  2 ++
 6 files changed, 17 insertions(+), 14 deletions(-)

-- 
2.20.1


