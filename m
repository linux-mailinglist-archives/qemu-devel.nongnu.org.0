Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4453BDA55
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:38:54 +0200 (CEST)
Received: from localhost ([::1]:38172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0n9x-0007q5-Lk
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:38:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mp7-0002QN-UC
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:17:22 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mop-0004sn-So
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:17:16 -0400
Received: by mail-wr1-x42a.google.com with SMTP id q17so6122491wrv.2
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 08:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P9Upb7I6HMRjCcJjpxGvstVHkB7w6Pb+oVKK25wH7Y4=;
 b=xbd43Pk52PsokX/c1MFMChCGHn58nclzeHXQ6KjlU1U0A5wNRxPi3910ekQrO3zsBf
 6B0ic89Egk5xgpsqr/nwNao1Jok+zD59DgdFqXc9yEgXmnESfaDljE/FBOW7R/G+sjjh
 QiEO3o8l2SlmpZEEs1IQqONPcY4cO3fcvayz/6oNIYT07z7inYTRHQYl1kSK9ur/gRFG
 X8mM3EP5PNn+8DB/bPjX5q/D1gXbAqrjZAwLjykLS00PJSso0GxeVjU3LgKb0KDyKw0k
 zykkkO8XtUn9zeq9vpGQ2wJu3tYok2FJskuF22h4cdFY+wcVjWDBAsOfsNOSh+tj8Yia
 r5tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P9Upb7I6HMRjCcJjpxGvstVHkB7w6Pb+oVKK25wH7Y4=;
 b=FglaToSw5k5DTewORu04MYzwz6mEtCk1Qi74g52b5iyrXj4r2nNH0sbWbYF8F12cZc
 bjzA5tl80WF0nC4gQUcU8hnBkwZSVOIxTtKvh5XkaYMcQGnbsBTvoGzQnf59UcGq4/ky
 d5HENPKZgDecnXUuXJJojd53IRatx3ywce2R4wFb9JWfpEUES1dJ3x2MvlfLF0X9Qbn7
 V+1EUhxu0zKU0dNm4aTQCDEV4OIZ71LHDr8c4L7d1FcFrdsc+5bR0OrW+G4Pv2Rfa6YC
 ELjfZHG3ds0JUVCrF3tFbNVXD6hhXEnLoVd9t/6Z+X0244nCzKXYEmNUgr2rwS7LH3tt
 Qmcw==
X-Gm-Message-State: AOAM530Etkr9IROuNY2MEjUJmuwgLEcp/iS8m5EARW+/JnelazQ5u2mA
 S3Dh0FBwAZ99nU7cDW82n5bfSQ==
X-Google-Smtp-Source: ABdhPJynr/yZTk/3jGQVjE5b9AdYxMwsKEPbSOrey0i6AJt3XHl0DMYHU/Cth8pJ18XCZeGoAWQbMA==
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr20888424wri.101.1625584621818; 
 Tue, 06 Jul 2021 08:17:01 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c10sm15617088wmb.40.2021.07.06.08.16.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 08:16:55 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DD5961FFA5;
 Tue,  6 Jul 2021 15:58:19 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 18/39] tests/docker: remove mingw packages from Fedora
Date: Tue,  6 Jul 2021 15:57:56 +0100
Message-Id: <20210706145817.24109-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210706145817.24109-1-alex.bennee@linaro.org>
References: <20210706145817.24109-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

There are dedicated containers providing mingw packages for Fedora.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623142245.307776-11-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/fedora.docker | 27 --------------------------
 1 file changed, 27 deletions(-)

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


