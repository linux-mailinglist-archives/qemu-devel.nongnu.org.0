Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6552F4E4B
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 16:16:45 +0100 (CET)
Received: from localhost ([::1]:47790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzht6-00075L-Br
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 10:16:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzhqh-0005NQ-PC
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:14:15 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:35282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzhqe-0008R7-8o
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:14:15 -0500
Received: by mail-wm1-x332.google.com with SMTP id e25so1940354wme.0
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 07:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vQWOMznPD2cExFj9wpPJQCFomVI7plPwBnMAbJZFKA0=;
 b=iwIuHD0MndebiwTpUedZUt9iEngIRsiYvWHmNeKUfArZ4L9MjlD0x9/i/enjLC9fja
 oOwgEDpfs42HXm2dHfh01AFQZ0jluWyiTeb8BZ6u0Tqlrk9Q5N0Bk41UMR7kfwW3JKsO
 87yqMa/OQHOkMpNHtd4hk9qOJC+2lwD4VrkAYyJ8vJWHmqhZBG7UWGdH0kY85AooDev6
 aUrw9KsUhBS5ap1tNCoI3+HvM+BusiokaoAOdam2K0vBcTTgeRWm+f0NSId7t83lD2G1
 KB0qyfI4grksE4FmaBmzGa75o2hk9FbBe65sL5VpThNSlxuHxaQ3Sqo+c+Y3WCODXUqu
 1ZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vQWOMznPD2cExFj9wpPJQCFomVI7plPwBnMAbJZFKA0=;
 b=OxmnXbB7YI53eJ1EYN14LySkE6xm/O8uoSBGZFdHNcXWc3nAUff9QY+sMpMX5TSRDC
 tWH8MUYcE924NXxr2oH6+iWAFEdS2U8xxSdOgyGrepd74FZTAy/eYxj5yorIzSmoyGoA
 fLpBVDgVwrv8xT6h5FqArIPLQIdAS5BADkz1WDf7k1ekLz/jeGqBTxFeyW4qv2sgAsz9
 Jw/P4WERQ/0rUEcIoNZr0GjJpsNk813QmsJfoADIXWXIMMpjky4svJQB3UCtCkvll5en
 vCj87D6cF8hIYJXGfll0woRYM7UEfcVv7yVogHIhDfIvXfFZW0LtmKEk1QcokS2sT1uk
 6+cA==
X-Gm-Message-State: AOAM530HkGWrdjzPUmgbGTS4yLJw3LTCB3R7BlTWC8mU0aYZr1+vgtpf
 vKX29XLN3omnAYiUz3ArYseChw==
X-Google-Smtp-Source: ABdhPJyqFYjlmLgQ+idBhz6ObSwbNCSGuNfff8iZ5l3YiWzFXt6pwes3Xg9LBkqf7LK8RHPaWBAQuA==
X-Received: by 2002:a05:600c:2219:: with SMTP id
 z25mr2659541wml.27.1610550850379; 
 Wed, 13 Jan 2021 07:14:10 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s1sm3688009wrv.97.2021.01.13.07.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 07:14:09 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A75B01FF87;
 Wed, 13 Jan 2021 15:14:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 1/9] tests/docker: Remove Debian 9 remnant lines
Date: Wed, 13 Jan 2021 15:14:00 +0000
Message-Id: <20210113151408.27939-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210113151408.27939-1-alex.bennee@linaro.org>
References: <20210113151408.27939-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Debian 9 base container has been removed in commits
e3755276d1f and c9d78b06c06. Remove the last remnants.

Fixes: e3755276d1f ("tests/docker: Remove old Debian 9 containers")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210107072933.3828450-1-f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 tests/docker/Makefile.include | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index c254ac38d0..0779dab5b9 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -108,7 +108,6 @@ ifneq ($(HOST_ARCH),x86_64)
 DOCKER_PARTIAL_IMAGES += debian-mips-cross debian-mipsel-cross debian-mips64el-cross
 DOCKER_PARTIAL_IMAGES += debian-ppc64el-cross
 DOCKER_PARTIAL_IMAGES += debian-s390x-cross
-DOCKER_PARTIAL_IMAGES += debian-win32-cross debian-win64-cross
 DOCKER_PARTIAL_IMAGES += fedora travis
 endif
 
-- 
2.20.1


