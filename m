Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87849453799
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 17:34:37 +0100 (CET)
Received: from localhost ([::1]:57666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn1Po-0008Sj-LP
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 11:34:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mn1Gv-0004dE-5n
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:25:25 -0500
Received: from [2a00:1450:4864:20::32e] (port=39876
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mn1Gt-0004CZ-6N
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 11:25:24 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso2460760wmr.4
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 08:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1WDIBwbb+pbmjdFoltQ0K0xm+LnAIzLLTJI2QcLMIy4=;
 b=Wmb3iL4BNxUtuXr6Uza7awe0m5etmLgwDmOycKsvenoR1U645tE6GBy6hjl/vuXPV4
 +TOLHwD/7XkVedTHjjPL+WjcuZdsvChkaI9Lqpcp6JapW+TpfQe9lEY5QSLawr0GwHeF
 CXiZZCqTaXyH6Wl3wFQtyvz+p20jRMR9or44LAbxMoI8ER+7fBf1tVHJaZAF3kfXRlCc
 5zM3rIpyzc4xlpgjDpH63c5wLqZjq7pOGQCuX86v1tY72dqCK1XHBU4gbubcK9oENQMX
 zrAUiUeHxXl32Iqs60PyQjEhNMSS35ufYiydEMtemJzOu7SsTni3Tmc15sv8xX7KMg/f
 zzYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1WDIBwbb+pbmjdFoltQ0K0xm+LnAIzLLTJI2QcLMIy4=;
 b=WhOZ91ShXJDYaS+IFQ0w8rDfVuWoco/6F93/nLi6S78CWagvX00IBEfe2WUfd6HIka
 KPjISop9IDEw5P/jC48Iqpyzl9EKNYrPLsV00usO8LWyEpCtXx6xLrV0p6+4eNe0/1g6
 Q104x8QM6sm5Frv6uJoBIp0uv1LY+G0BUcL5tK1rmdv43d0J/1iLkpRO3jQOtUYw3kwW
 50jjYpS4B07r88tl+ecp3MTQ0W3hnL8D8vD05/ipk0k/PH0dSKM9WbFxDcrsHHkMe7Fx
 9zvnr37RHzrGRQD1uNlIcQJ+3/ip381ktFZNaTyUDLzqv28+9cBDZWPVEjH5GE7Umpf3
 jjHw==
X-Gm-Message-State: AOAM533BsRFiZNXw7TJJFaZ64XipB1rJkIjsDOY04242R1yhZxm5Wcbh
 gKSwhPv3su1mzOD7xPNVrxeXOu/RgeYdtQ==
X-Google-Smtp-Source: ABdhPJz01sZwbugs3jzXGtcfkMU7Z0kj96g/Y1XLy+wqedQDt7Ne6HfO16y9d1dLwNoL7x1l5fD5Zg==
X-Received: by 2002:a1c:4d0b:: with SMTP id o11mr9093447wmh.68.1637079921713; 
 Tue, 16 Nov 2021 08:25:21 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e12sm21561230wrq.20.2021.11.16.08.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 08:25:19 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B2B791FF9B;
 Tue, 16 Nov 2021 16:25:15 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Subject: [PULL 4/7] meson: remove useless libdl test
Date: Tue, 16 Nov 2021 16:25:12 +0000
Message-Id: <20211116162515.4100231-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211116162515.4100231-1-alex.bennee@linaro.org>
References: <20211116162515.4100231-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

dlopen is never used after it is sought via cc.find_library, because
plugins use gmodule instead; remove the test.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20211110092454.30916-1-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211115142915.3797652-5-alex.bennee@linaro.org>

diff --git a/meson.build b/meson.build
index 2ece4fe088..baeaee4522 100644
--- a/meson.build
+++ b/meson.build
@@ -566,13 +566,7 @@ endif
 spice_headers = spice.partial_dependency(compile_args: true, includes: true)
 
 rt = cc.find_library('rt', required: false)
-libdl = not_found
-if 'CONFIG_PLUGIN' in config_host
-  libdl = cc.find_library('dl', required: false)
-  if not cc.has_function('dlopen', dependencies: libdl)
-    error('dlopen not found')
-  endif
-endif
+
 libiscsi = not_found
 if not get_option('libiscsi').auto() or have_block
   libiscsi = dependency('libiscsi', version: '>=1.9.0',
diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
index 137a1a44cc..7a0a79d731 100644
--- a/accel/tcg/meson.build
+++ b/accel/tcg/meson.build
@@ -10,7 +10,7 @@ tcg_ss.add(files(
 ))
 tcg_ss.add(when: 'CONFIG_USER_ONLY', if_true: files('user-exec.c'))
 tcg_ss.add(when: 'CONFIG_SOFTMMU', if_false: files('user-exec-stub.c'))
-tcg_ss.add(when: 'CONFIG_PLUGIN', if_true: [files('plugin-gen.c'), libdl])
+tcg_ss.add(when: 'CONFIG_PLUGIN', if_true: [files('plugin-gen.c')])
 specific_ss.add_all(when: 'CONFIG_TCG', if_true: tcg_ss)
 
 specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
-- 
2.30.2


