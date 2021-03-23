Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7796834670F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:59:13 +0100 (CET)
Received: from localhost ([::1]:35622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOlJA-0002SU-6c
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:59:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkN4-0007Lt-0i
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:59:10 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:46795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkMw-00060P-92
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:59:09 -0400
Received: by mail-ed1-x52a.google.com with SMTP id h10so24235096edt.13
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 09:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4xrQH7esbMfiiZ+dFgNuGnNZQNjghRSg7ZJWrQGy1Gw=;
 b=ia7argiWDwmLuhtfUn1+kUi2qWewm9NXbpM6i9PBemhoo3UpkrV2Aa1SbbhIfgXE2d
 jS+JqpN/z/CzEIFfqvANthleW/uje+w0V6DjVFKZO0MyTWz1aGWDGx6I2KaSqwVWO5mw
 GcCZppJ/28eICcPsffLac3Z8e2zceQmcNDw752c7mILd8HHTcmuj76B57kTBasFuyC2H
 AFAyVySMk0HP5IZEIT12Xxy9ybBINfwp9OS7LLlP0qm40yTuYZqWU668yezpG8G+ipGh
 LdUq6au2tqJebQsGaNdyQzasNMM6Iju0v5KzISbcrJdRvvWUJ+XPpRvSVkcoZGJlGdkp
 unrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4xrQH7esbMfiiZ+dFgNuGnNZQNjghRSg7ZJWrQGy1Gw=;
 b=L6DzXwEKhkIDiQebWif4yyz2tRsnpXijsVzI6WjQZZg3GKb72JBSPk/AZ5tOzB7dxm
 HJd7xHoxCARM6zuRQMZOkpFsbUJlAkZDud/x92cmfR8baqrsythzYIkJjmdDyVTKyGfe
 3swCF8NLHzgvljtpCWlHhE3QEWUUPtx5oF2DwaBLH+tsrBy/SPROkYvrt/WS3yg64XLF
 vftHZ6ukRfdM5L1RVORe24z2hT2UwVgDf+ngRb0Fj72oKiw4pP6g/rUw9XwUnzJhli7z
 Ihp5/QjbSsOhfJFVQsvjwAsfisFzmiAd3A0YByhZnXF2LSsfY6BB0jy/TQsDqvzZE5A9
 lmcg==
X-Gm-Message-State: AOAM531AXiHiR6yzNGydC/3AyvVRujKh8K+GCBp9bDAwFIG/6Em2Ykpm
 P+K51r8ckb8pkYNudqhMR+WDJA==
X-Google-Smtp-Source: ABdhPJyXzYi6Hpgq9cjzcP3aeE4GxZSWo/fUwNK2NevHrWbZ3X/DC3tuGMfDaMwK42AC6uy/muLuqg==
X-Received: by 2002:a05:6402:34d5:: with SMTP id
 w21mr5533172edc.14.1616518739590; 
 Tue, 23 Mar 2021 09:58:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g26sm11272138ejz.70.2021.03.23.09.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 09:58:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7A5B61FF9C;
 Tue, 23 Mar 2021 16:53:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 15/22] gitlab: extend timeouts for CFI builds
Date: Tue, 23 Mar 2021 16:53:01 +0000
Message-Id: <20210323165308.15244-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210323165308.15244-1-alex.bennee@linaro.org>
References: <20210323165308.15244-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These builds are running very close to the default build limit and as
they are already pared down the only other option is to extend the
timeout a little to give some breathing room.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210322142110.4766-1-alex.bennee@linaro.org>
---
 .gitlab-ci.yml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index f746d5fbea..9ffbaa7ffb 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -502,6 +502,7 @@ build-cfi-aarch64:
       --enable-safe-stack --enable-slirp=git
     TARGETS: aarch64-softmmu
     MAKE_CHECK_ARGS: check-build
+  timeout: 70m
   artifacts:
     expire_in: 2 days
     paths:
@@ -538,6 +539,7 @@ build-cfi-ppc64-s390x:
       --enable-safe-stack --enable-slirp=git
     TARGETS: ppc64-softmmu s390x-softmmu
     MAKE_CHECK_ARGS: check-build
+  timeout: 70m
   artifacts:
     expire_in: 2 days
     paths:
@@ -574,6 +576,7 @@ build-cfi-x86_64:
       --enable-safe-stack --enable-slirp=git
     TARGETS: x86_64-softmmu
     MAKE_CHECK_ARGS: check-build
+  timeout: 70m
   artifacts:
     expire_in: 2 days
     paths:
-- 
2.20.1


