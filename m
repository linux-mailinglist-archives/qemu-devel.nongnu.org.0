Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2803C5CB4
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 14:56:31 +0200 (CEST)
Received: from localhost ([::1]:38114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2vU6-0005XY-91
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 08:56:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2vGv-0007Do-GQ
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:42:53 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:46908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2vGu-0006FB-11
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:42:53 -0400
Received: by mail-wr1-x433.google.com with SMTP id d12so24791650wre.13
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 05:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gwRw1ob/qac5/FqzuOGenSxZqRN/B2GFmh5qC/YLlU8=;
 b=wvKdg8x+R0d8HM6PpRLWZyWX+9mMlLKRohz1oRgDXwet5ayQcVaFGmpOn6Vmo5+UQP
 UfZT77C8QXTjvVRMGqowZ6hiJUa4QfDs8Ct2sjMGau9A6xyQZgZ+HWNpUAAREbwL6wb9
 O3CqPCiw5PxRDUcVKiiCxUJ6fs5ramDbAG8a/nj6PlSmLtjBx8OD8SsAYCXCU6XAUjGr
 xTXwxgWp10jpbK4OhIGGaN12nIIWtNMTumZJAIGksiDDFw5/vxv28XzLLOgQGqeuzjfg
 IC4oMwsDfP0hNyf8iAzVIZvz1npq3q+zeu7Ju+V3YdXftGtK3qo6Ow7/aLo0CSJe9R8x
 GEIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gwRw1ob/qac5/FqzuOGenSxZqRN/B2GFmh5qC/YLlU8=;
 b=REQtRENdM0CVunpdkDmZlHVjKGnH+i72T9GSuWZCGNdtFxdGsjeflI7L9YLOfVhBrG
 KpW9yahmIDyNYFm5tEUt1ii3e9sjXAa8zC3xxFvNeajCXQSR6yQBMsZ4eyo98vfWCiId
 vOW/WV4+y35GUYon9z6Uko6v1QPQkDKKLT4q03d+Xy3ABuIbM+I/QxFdQRglC9UMMi/b
 p2/peHEskP8oFn55afrBb/0WpdETMcTrggxBOgfAOwhD+HD6ReiLnV2hSU/gPCBn9RH3
 w/g9Em4zdx+kzyZncvETUVw2R9oF23hNmDQu6coI24InUjDdWDDUj70sZuvjgQgWN+t9
 04+w==
X-Gm-Message-State: AOAM531mgYu1TpBF3EV5FRCI22jN4ddxgJpmPWHNCe2ZF/G5tx2GwloW
 wqINGAo6rY2IKeqUPOEPYSLc5w==
X-Google-Smtp-Source: ABdhPJww8iH+dnUWq1cpI40JBalwVSC5UxMBAcy8Pq/XWK7j2lExY4mjDoqrApZYI+VJJJ8ILZ15RQ==
X-Received: by 2002:a5d:5989:: with SMTP id n9mr3183238wri.8.1626093770399;
 Mon, 12 Jul 2021 05:42:50 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k5sm13437493wmk.11.2021.07.12.05.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 05:42:49 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D1F661FFA6;
 Mon, 12 Jul 2021 13:26:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 18/40] tests/docker: remove mingw packages from Fedora
Date: Mon, 12 Jul 2021 13:26:31 +0100
Message-Id: <20210712122653.11354-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210712122653.11354-1-alex.bennee@linaro.org>
References: <20210712122653.11354-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

There are dedicated containers providing mingw packages for Fedora.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623142245.307776-11-berrange@redhat.com>
Message-Id: <20210709143005.1554-19-alex.bennee@linaro.org>

diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index f667f03cc5..5849ea7617 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -52,33 +52,6 @@ ENV PACKAGES \
     lzo-devel \
     make \
     meson \
-    mingw32-bzip2 \
-    mingw32-curl \
-    mingw32-glib2 \
-    mingw32-gmp \
-    mingw32-gnutls \
-    mingw32-gtk3 \
-    mingw32-libjpeg-turbo \
-    mingw32-libpng \
-    mingw32-libtasn1 \
-    mingw32-nettle \
-    mingw32-nsis \
-    mingw32-pixman \
-    mingw32-pkg-config \
-    mingw32-SDL2 \
-    mingw64-bzip2 \
-    mingw64-curl \
-    mingw64-glib2 \
-    mingw64-gmp \
-    mingw64-gnutls \
-    mingw64-gtk3 \
-    mingw64-libjpeg-turbo \
-    mingw64-libpng \
-    mingw64-libtasn1 \
-    mingw64-nettle \
-    mingw64-pixman \
-    mingw64-pkg-config \
-    mingw64-SDL2 \
     ncurses-devel \
     nettle-devel \
     ninja-build \
-- 
2.20.1


