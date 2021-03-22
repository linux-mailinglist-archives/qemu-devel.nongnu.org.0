Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD847344868
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 15:59:51 +0100 (CET)
Received: from localhost ([::1]:51822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOM22-0008Mr-UI
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 10:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOLQz-0000uh-H7
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:21:33 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:44943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOLQo-0007SS-Jl
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:21:28 -0400
Received: by mail-ej1-x630.google.com with SMTP id e14so3373153ejz.11
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 07:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oDq1IMBEFkt8p8P0xZzdYQb6WinJ/O7r1P0SbeEQonc=;
 b=mIPgiGh/ykIiC6A7ukpGFFBw9YM/wkCXHr68i5WIs+mzbChi4YlAn6r0l6M+cRf/up
 FuWuyvcOgDplxRFHH9UXqyxLIa4CjayjFMH+3e/KIJ6w/T+gLTMKscWlPGqmwpXItOPq
 t12dUEtkw2KCoiOc804b8KaFWc8btRuNosmbDAnQlYlvctVZXzG5BX1XwcN/M9/oVUIw
 L1steZgvtJpzUAXVxu8hLK8CAjgbMJx/RvRVuM/BieiSim5Gj/Iw6oXjUBc+P/vSXVy9
 kLtheQeAvV34ONhw0G3JrN/FiFaHpFZcsrNDeMjFwf1DQDZmUSXw+WE/4gWNGA154pDj
 IAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oDq1IMBEFkt8p8P0xZzdYQb6WinJ/O7r1P0SbeEQonc=;
 b=FSY/H0GgBl2rUaEcFWvKm4gGQr+890dE7GF+GSACMHr1HuBjRCO8J7A8FTGxiXOa9E
 PcvjtE0O2MqNUFuX+Moi9nqzkUIzwjRp0Hm2jJB2NM5vnuL3E20ryYjZcv4NM9+gM4as
 H6R2c7Z7YqlmllfBBh87Q18WJuoJUciSO9SHfbolPx+/+Tb1NsV+1Fq4rY+DrOrOKu9I
 K9SqF6As6Tm9EzNvZ89tZ1SnGItYJc97AELST8vkjohpdCVyQLFoAf02X24CktchROgJ
 W0dSPtlTYBRtqaN0jyfP2g66e0HMN2BB1q3XPXUi/stsOxxOjQLIyiHH7YmBcQtEvGP2
 er6w==
X-Gm-Message-State: AOAM533rdU2MwqehJQPGkY7N34QGihVXRhCqeasg7KykDQ9Nj+Pn9TXw
 x7SQHELyK4XU+/y/DIYiZ4wndg==
X-Google-Smtp-Source: ABdhPJxToWuDLiHkhU+YASddQQ7BqF4Jmwc7jBlEh9Yui9BlX0ys9H+VwXbHW8EWTebfnOgLOmPzQw==
X-Received: by 2002:a17:906:95d1:: with SMTP id
 n17mr19119950ejy.394.1616422880548; 
 Mon, 22 Mar 2021 07:21:20 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l10sm11531668edr.87.2021.03.22.07.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 07:21:19 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 928681FF7E;
 Mon, 22 Mar 2021 14:21:18 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] gitlab: extend timeouts for CFI builds
Date: Mon, 22 Mar 2021 14:21:10 +0000
Message-Id: <20210322142110.4766-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 dbuono@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These builds are running very close to the default build limit and as
they are already pared down the only other option is to extend the
timeout a little to give some breathing room.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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


