Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D10A5FB01C
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Nov 2019 13:02:24 +0100 (CET)
Received: from localhost ([::1]:43368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iUrLr-0006Xs-KY
	for lists+qemu-devel@lfdr.de; Wed, 13 Nov 2019 07:02:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33087)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iUrJZ-00052p-MS
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 07:00:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iUrJY-0004Ej-G7
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 07:00:01 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:38302)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iUrJY-0004EI-AH
 for qemu-devel@nongnu.org; Wed, 13 Nov 2019 07:00:00 -0500
Received: by mail-wm1-x341.google.com with SMTP id z19so1708516wmk.3
 for <qemu-devel@nongnu.org>; Wed, 13 Nov 2019 04:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hHy+s1GjJ2Pj+MpNXAGF+PVR24txIcWOxbNUbbYLGfQ=;
 b=eVPQ0Y9WRTXYDIfJ8BZ5JDLy10VSWn1LR/H7bqSNCvQ7fQps7Uv7U7CFrqYkbH0eBS
 mlgJ7hcQgFGr22pq/Avy1TGMF3KGQPsGmEcJv+KndGM42thnxgrMG6TCsKcnn8qZ0SRU
 K/vFAPQaBdZ8J3bQwX3FhSqEnISwxrFI0BLwKP3kyUhWxjj6BGeNjPQQvSi89sygcHV1
 SRoPFI8nhiZNzY0sULLPLIuVd0WZse8Tae/sWxCVJZFLdevQzuJ9sJGhYLu6AyDKt/BL
 c69wKSZnaaH2+9wy8KpvhwDpc9ockG3gyi5mcpsN5Y+fpAt2cSHwJ/EXB3ITJ5I0F2Pc
 8IPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hHy+s1GjJ2Pj+MpNXAGF+PVR24txIcWOxbNUbbYLGfQ=;
 b=ScAFDyeWHtbuHN2xr90DVJVCcRGoMQhJwvvehS1/vKS555IpGISsCjZWxChQw5AYW7
 WLgreDxm9AEp1TAuK+GySEChDQowWrpIAiE0xIXzz8ZIKOhPuJi1L/SoubT7XUQtaNnE
 OhfGzHgEqaCr2xZhzrIVrkwe4NGH28Wt7uIOZbPd1l9nkCuJOJofktLPcuPfcljFesoX
 HiksNV4l5h2dXBJXdhHUQgBuccgYtXWlsPK4AFWJC3ll0SmWKDJmrSHeHKJ6PJpv2SsG
 NiYsUb0IxmwdigO7tgTOYds2frJFKaQ7FyDGfSKOD8AJSwgWsBY0rrDkz6AQ3VCHY6ZF
 MGOg==
X-Gm-Message-State: APjAAAUoZKc0pFnKQ9hfjOdkhZT7OPI+lts6bi0LK8+nZpOc9fNE6LM9
 1uD2d1nNRS9upEAZKixLhCebsA==
X-Google-Smtp-Source: APXvYqxyHMHZS0VXykLM0bZtp1uuPdIkgaCPZpMqf14Mw9nIRWQggtVjew7X1s9k6cqu7nam+EXwcw==
X-Received: by 2002:a1c:9dd3:: with SMTP id g202mr2539263wme.43.1573646399143; 
 Wed, 13 Nov 2019 03:59:59 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h140sm2475558wme.22.2019.11.13.03.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2019 03:59:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9BD381FF92;
 Wed, 13 Nov 2019 11:59:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 5/5] .travis.yml: drop 32 bit systems from
 MAIN_SOFTMMU_TARGETS
Date: Wed, 13 Nov 2019 11:59:52 +0000
Message-Id: <20191113115952.775-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191113115952.775-1-alex.bennee@linaro.org>
References: <20191113115952.775-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, cota@braap.org,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The older clangs are still struggling to build and run everything
withing the 50 minute timeout so lets lighten the load a bit more. We
still have coverage for GCC and hopefully no obscure 32 bit guest only
breakages slip through the cracks.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .travis.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.travis.yml b/.travis.yml
index b9a026c8eeb..c09b6a00143 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -79,7 +79,7 @@ env:
     - BASE_CONFIG="--disable-docs --disable-tools"
     - TEST_CMD="make check V=1"
     # This is broadly a list of "mainline" softmmu targets which have support across the major distros
-    - MAIN_SOFTMMU_TARGETS="aarch64-softmmu,arm-softmmu,i386-softmmu,mips-softmmu,mips64-softmmu,ppc64-softmmu,riscv64-softmmu,s390x-softmmu,x86_64-softmmu"
+    - MAIN_SOFTMMU_TARGETS="aarch64-softmmu,mips64-softmmu,ppc64-softmmu,riscv64-softmmu,s390x-softmmu,x86_64-softmmu"
     - CCACHE_SLOPPINESS="include_file_ctime,include_file_mtime"
     - CCACHE_MAXSIZE=1G
 
-- 
2.20.1


