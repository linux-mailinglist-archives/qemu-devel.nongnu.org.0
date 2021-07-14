Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DDD3C869A
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:06:37 +0200 (CEST)
Received: from localhost ([::1]:59774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3gT6-0000Mx-Cm
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:06:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gNY-00079s-8j
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:00:52 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:42675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3gNW-0007UV-Cs
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:00:51 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 l4-20020a05600c4f04b0290220f8455631so1642247wmq.1
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7QlwsDUzHRky2/jFVyHRCsmVdgTIo09E0XCwj4H/aaU=;
 b=tiGNv0CRuJcAGEFuEJtYQEigvp2UlYc59hBbf1Pg8ON8z6x38/jUnvQEgWOiJvIENW
 CtECJK751xJsHNJPz+A5h61avDQson7y/nCXUkbVhFUA+s77DaGxFvK3AabNvQH8kkEm
 OJeQ2JlCat2FGUbqrsdf7KXZwGrt9v7LUJHn3f3MUA64S9nuDY+5PbQPuMEfSQuiK0ZD
 x8gjvbr+lZZDZ4OtRNqMlF/8dFm9UKMrJpQouPKJk7rX4VDqzjsj7bdl4oCM74CkRyFy
 BJdwPwPzV2XAggL1wQfUqXrf0h4LZA7xPl3xcrXEHT0W8Btt3Vb4y55Yk6ASkrtGQQ3x
 URrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7QlwsDUzHRky2/jFVyHRCsmVdgTIo09E0XCwj4H/aaU=;
 b=GAbGITNySZ7MkZ5GyzIJQ/GRpPOrHjRG+rJP3dm1jEAHSRXb0gzn+DCWSTHr+iZJY4
 fL0AI8Mqiox4AD9vt3vKtR69sgy1d4V9ozwtHNn6U3/DdNu7cgTX6B51RSnmb2v19yhM
 jz5ekOC5jYrEjudnvAB/7VdqRznD81JFmtuOm/3vAmIpGqKmA3Rt+PNV1c/3B1RA1fnL
 axTuuguLWMjrIcsisAiBxN0KWg3wdeKq95n1ut6cE8by++JtMnHXI3bPEwiaGB/pu+JV
 k3f5iQb8cD2narpjCmIpkjo8Xdwn6iTzrKuAqWvW019qEIaAxFJeMroA5L8BUYfnuvIA
 ENbQ==
X-Gm-Message-State: AOAM531Q4Tv7B1okJteTPY7TG7lR5tYYvc+vZ85HfRdbYCvVImw9qosj
 34V5Cfo08JH5mCWMaEfyAqS4nQ==
X-Google-Smtp-Source: ABdhPJxr+XsnDraYWPz4vDjYUvcHDJggezpLXw4i4asJJz1IYBOU1Lr81zYmj6DPQmvQTY3R99/0Qw==
X-Received: by 2002:a1c:1bd0:: with SMTP id
 b199mr11521091wmb.108.1626274849072; 
 Wed, 14 Jul 2021 08:00:49 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s6sm3555423wrt.45.2021.07.14.08.00.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:00:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6D0F81FF93;
 Wed, 14 Jul 2021 16:00:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v5 07/44] disable modular TCG on Darwin
Date: Wed, 14 Jul 2021 15:59:59 +0100
Message-Id: <20210714150036.21060-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714150036.21060-1-alex.bennee@linaro.org>
References: <20210714150036.21060-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Accelerator modularity does not work on Darwin:

ld: illegal thread local variable reference to regular symbol _current_cpu for architecture x86_64
clang: error: linker command failed with exit code 1 (use -v to see invocation)

Fix by avoiding modular TCG builds.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210712122208.456264-1-pbonzini@redhat.com>
[AJB: manually merged typo fix]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/meson.build b/meson.build
index b0e2b9a8a0..512ee2e926 100644
--- a/meson.build
+++ b/meson.build
@@ -92,7 +92,11 @@ if cpu in ['x86', 'x86_64']
   }
 endif
 
-modular_tcg = ['i386-softmmu', 'x86_64-softmmu']
+modular_tcg = []
+# Darwin does not support references to thread-local variables in modules
+if targetos != 'darwin'
+  modular_tcg = ['i386-softmmu', 'x86_64-softmmu']
+endif
 
 edk2_targets = [ 'arm-softmmu', 'aarch64-softmmu', 'i386-softmmu', 'x86_64-softmmu' ]
 install_edk2_blobs = false
-- 
2.20.1


