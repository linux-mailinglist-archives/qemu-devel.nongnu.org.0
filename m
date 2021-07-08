Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 840D53C19E6
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:36:20 +0200 (CEST)
Received: from localhost ([::1]:38752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Zop-00032q-IG
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:36:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZWR-0002F0-Tz
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:17:19 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZWP-0007UJ-KS
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:17:19 -0400
Received: by mail-wr1-x42b.google.com with SMTP id f9so3205687wrq.11
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P9Upb7I6HMRjCcJjpxGvstVHkB7w6Pb+oVKK25wH7Y4=;
 b=ZI7/neLn1UJ5Z8OJ/iY5p9eTzccIi/mfG5ZMx53UZiQUmZqbRP+uexrR1R+uBDHxHm
 azuLyktkh31vDFXANl3TqxaQ99KoeWXnJx9XJXcHEULr9ambSMjgFUwHqS96D0cUtr9e
 vWT5MdcA16O4afhLgK7E3DX2XuDGjQOF7jKox2DPNbFYEIv2zTW/jwoqRL61GBUHu6YF
 dFmJfK9b8IsSxfzUrvQpQunNgK0efiUhBsBN71+isIqmD9HOYvLSfiK+GAyLZbzgYxzo
 vC/hdQRwtXLfseaweJxZzdxtE1gIak4sW1H4liF2Og7IupxoQy1JgBYHNQdBcRsWLrXE
 8kSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P9Upb7I6HMRjCcJjpxGvstVHkB7w6Pb+oVKK25wH7Y4=;
 b=bEwx8LMidQbzaljFfedNbvkVijtWPF3P0leSSogzS/fW+O5E1wZkEvMGvdZsE8M4xP
 afw/5e9G2lChIGZS9rKiXM+n9xz/cj3QG/XCi0zE5Zn6zvDQgA5ORPPM9aZNiWh/NC/L
 rUHL+Sbnq2i4yemqby66snBa3IsO/u+4tY1MFgz02+Hdn867mDLdOCi0zkTxvQa83yA4
 z2N/Y7gJjZ9hrIbFdn71ka9XypznM5f96VTKM88mOP9WdUZNC0XAKwaI6fQMNrrpUtOz
 wqHJi5RoHn9nSxIUeM3akQ47a/zIduuN9fgzuwj9PZw8yOG6kXpgoU+cGHRKODc4Qga2
 jmUg==
X-Gm-Message-State: AOAM531nqthhF7yl92SKYm7kvJMJ7jOUDK8ixwK597WXziz6iUsDF7yq
 0L0ThT3W0o9IsI5OWK6NRTccsw==
X-Google-Smtp-Source: ABdhPJzDnqE4v3cfSxnXuLUZHPSNfnQMiwAs2Cf532lBkiz9EZtlWRZ7LYIIdaicfW9pPm53V/fJtQ==
X-Received: by 2002:a5d:64ee:: with SMTP id g14mr38180281wri.66.1625771835958; 
 Thu, 08 Jul 2021 12:17:15 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f7sm510425wml.35.2021.07.08.12.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:17:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 13A0E1FF9F;
 Thu,  8 Jul 2021 20:09:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 18/39] tests/docker: remove mingw packages from Fedora
Date: Thu,  8 Jul 2021 20:09:20 +0100
Message-Id: <20210708190941.16980-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708190941.16980-1-alex.bennee@linaro.org>
References: <20210708190941.16980-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, minyihh@uci.edu,
 berrange@redhat.com, kuhn.chenqun@huawei.com, f4bug@amsat.org,
 robhenry@microsoft.com, Willian Rampazzo <willianr@redhat.com>,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
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


