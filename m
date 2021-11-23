Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D36C45ADB7
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 22:00:09 +0100 (CET)
Received: from localhost ([::1]:36892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpctc-00059a-9Q
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 16:00:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mpcrI-0002Je-V9
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 15:57:44 -0500
Received: from [2a00:1450:4864:20::42b] (port=42617
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mpcrG-0006OE-T2
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 15:57:44 -0500
Received: by mail-wr1-x42b.google.com with SMTP id c4so173794wrd.9
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 12:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tVBYX0xCVJBO6/TWHd6rZqnYoCc7L/iFtDi/gZndAeI=;
 b=K2rd8A+Fy4kiHDbFxPcg44AivZnyFa0NI+yCg+1qEyLBwoMoBvMi8X/6wuEz/8dMI7
 RBZea6gSQBOdtnELgEpA+mREH7wvlpDrvzO0n+cRnBgFCa7Fi1ZjGHejmXMydnfPInt+
 CVF17/2jg6VhR210d1yTLvpzskO5JQQ8z530AYzFopEGbzOn6wRDCRQTXtcu4mJwEIPD
 ChJ53FwFiSnTL1l6jyfLAOUpyfnwMbpbTUIrEqN8+MQnOf+eXyfjLRkN8FJcRPZ8Jege
 DXo9kIJX5JUURd+1ZJuTSALYiklwd7nW57Kmv1AbCGzoCk92mSWA1oajeIFScAobIPmw
 T2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tVBYX0xCVJBO6/TWHd6rZqnYoCc7L/iFtDi/gZndAeI=;
 b=6tA29arcll9hcyYQiQto/m6EVWlZ6MsY9t2H1iEVKxtNwW14E2DO4l35t2/Q7xo4bY
 jVPaR0YV/J70juLt+z60qBusntb5i32ESb6JVj+ou5IsrYRWqevBcGCS7x+Mw93EzKJK
 xLzWuai834M6V0PUkP9AJzcmOOx8LQY4y4rYhyvVP0ghk5tdB6sKCt0DIKNwMi4CATP5
 Mo6UodX9wDhRNuhopge4OIRRH8D0eeJrWV6EMJ4i1f2PA/pG/BqnYJLsUpDQ8ur1cDNF
 cCmXxRHXJHgJkPy+gjOMZZ+93wS9IMh1UGBqWwzSo1u0dQ1JbDZbIatVdauAfh9pV9xP
 4jWQ==
X-Gm-Message-State: AOAM5331s2mvCb8nkVKL+xrIKuZE7NNe/hAaqjMSoGpcD5Po6ubrA3Ii
 a6ej3vh61/kGdpE4roDtoS+NvQ==
X-Google-Smtp-Source: ABdhPJw5rNZsDK23WH8F57i5t9cGL7xzZrjdgB15K9wVDtYxqNZS62pefo6jywv34fNRbm6iI4JTvQ==
X-Received: by 2002:a5d:5850:: with SMTP id i16mr10906620wrf.197.1637701061607; 
 Tue, 23 Nov 2021 12:57:41 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y6sm2187526wma.37.2021.11.23.12.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 12:57:37 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8FB861FF9D;
 Tue, 23 Nov 2021 20:57:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 6/7] MAINTAINERS: Remove me as a reviewer for the build and
 test/avocado
Date: Tue, 23 Nov 2021 20:57:28 +0000
Message-Id: <20211123205729.2205806-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211123205729.2205806-1-alex.bennee@linaro.org>
References: <20211123205729.2205806-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, f4bug@amsat.org,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Willian Rampazzo <willianr@redhat.com>

Remove me as a reviewer for the Build and test automation and the
Integration Testing with the Avocado Framework and add Beraldo
Leal.

Signed-off-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
Message-Id: <20211122191124.31620-1-willianr@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d3879aa3c1..8f5156bfa7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3469,7 +3469,7 @@ M: Alex Bennée <alex.bennee@linaro.org>
 M: Philippe Mathieu-Daudé <f4bug@amsat.org>
 M: Thomas Huth <thuth@redhat.com>
 R: Wainer dos Santos Moschetta <wainersm@redhat.com>
-R: Willian Rampazzo <willianr@redhat.com>
+R: Beraldo Leal <bleal@redhat.com>
 S: Maintained
 F: .github/lockdown.yml
 F: .gitlab-ci.yml
@@ -3507,7 +3507,7 @@ W: https://trello.com/b/6Qi1pxVn/avocado-qemu
 R: Cleber Rosa <crosa@redhat.com>
 R: Philippe Mathieu-Daudé <philmd@redhat.com>
 R: Wainer dos Santos Moschetta <wainersm@redhat.com>
-R: Willian Rampazzo <willianr@redhat.com>
+R: Beraldo Leal <bleal@redhat.com>
 S: Odd Fixes
 F: tests/avocado/
 
-- 
2.30.2


