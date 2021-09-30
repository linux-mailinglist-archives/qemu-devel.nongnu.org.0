Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D953941DF2A
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 18:38:47 +0200 (CEST)
Received: from localhost ([::1]:49046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVz54-0007QZ-SS
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 12:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVz36-0005NT-7V
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 12:36:44 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:46022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mVz32-0006BY-WC
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 12:36:43 -0400
Received: by mail-qv1-xf33.google.com with SMTP id x9so3934443qvn.12
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 09:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=77S8PHNNwp8gzL3C6UYKL3B8n68oD4JCUCVjCK3xRFU=;
 b=t6N83kY+hmB+kVaEZO5SVX7o9QiioHgylTMPIcSbF5ex665E6NpFgiSot9JeUuGDoA
 275YW4ikUiSoqwIacAbcIPb/hICsnqHlg/F+ZWN9FMXSev17XPKQM3+6Qpkfen6M7hca
 gm2tx741aBCXiw8xalf/O/rEzHe+b3KJ8C6LYDBccrMjVIM21pMKGiul7ta/I/pOSZ8f
 qDK/K5B9n1rfXbIpIAGx8noIIIM+i/fQsV40varOqwEZedcpt1nqlFwuJ9YD52dexYgM
 vRob1zChBySvLRFKsFziQ82jEjLd7wD82eRa37XlmILk3ninb/Oj2AiJy9jafDixxJBj
 E7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=77S8PHNNwp8gzL3C6UYKL3B8n68oD4JCUCVjCK3xRFU=;
 b=VovqlEp6xXgkTzND3Q+Q0VgZGD/zoXd56Od717q4d2c0pJ2iv+rru7D0ymgbEWHatg
 WQHk/gcixRfQkYRJWFQnjHI8+uK2l4rUPUYLFG3OHRiM+p6QklLAmCE2C/7ZAUJkSbe8
 PZ/gSsJVu3yyVvP8dokAr8vLNLcYYeLU1QQjK0v15l+Pne8tsTVBg8k/7+Z7o+BTrAaX
 jSq3H9a7BVvnjWddjnjStQz4+HMOCS54LAzIU43RHGFjKOOicnNyOZmui8l6WK/3gZyE
 Fb/BnOzduFCTAsB4fuZ59Y378dL6/oFVRPbRL6UOhFTXTwo++umPIjzg6aVyMHNE8chH
 mSUw==
X-Gm-Message-State: AOAM530+EYQitqRUVvR8dc2KSF6DitdtwfhOJejJbeMfJpnvABdXsSDs
 AOUg02vH3rKc8EQl2qLdq8EKvTA0IYXz3A==
X-Google-Smtp-Source: ABdhPJxfzx83VQmcasuQ2BNrv4CxUDVXVj3VyzeMyzGprJcJQ6SY0nFrNqXwoBip+38co09QFlkMQQ==
X-Received: by 2002:a0c:c293:: with SMTP id b19mr4937108qvi.22.1633019800050; 
 Thu, 30 Sep 2021 09:36:40 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id q8sm1855781qtl.80.2021.09.30.09.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 09:36:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] tests/docker: Fix fedora-i386-cross
Date: Thu, 30 Sep 2021 12:36:36 -0400
Message-Id: <20210930163636.721311-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210930163636.721311-1-richard.henderson@linaro.org>
References: <20210930163636.721311-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf33.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

By using PKG_CONFIG_PATH instead of PKG_CONFIG_LIBDIR,
we were still including the 64-bit packages.  Install
pcre-devel.i686 to fill a missing glib2 dependency.

By using --extra-cflags instead of --cpu, we incorrectly
use the wrong probing during meson.

Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Richard W.M. Jones <rjones@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/docker/dockerfiles/fedora-i386-cross.docker | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/docker/dockerfiles/fedora-i386-cross.docker b/tests/docker/dockerfiles/fedora-i386-cross.docker
index dbb8195eb1..820740d5be 100644
--- a/tests/docker/dockerfiles/fedora-i386-cross.docker
+++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
@@ -17,12 +17,13 @@ ENV PACKAGES \
     glibc-static.i686 \
     gnutls-devel.i686 \
     nettle-devel.i686 \
+    pcre-devel.i686 \
     perl-Test-Harness \
     pixman-devel.i686 \
     zlib-devel.i686
 
-ENV QEMU_CONFIGURE_OPTS --extra-cflags=-m32 --disable-vhost-user
-ENV PKG_CONFIG_PATH /usr/lib/pkgconfig
+ENV QEMU_CONFIGURE_OPTS --cpu=i386 --disable-vhost-user
+ENV PKG_CONFIG_LIBDIR /usr/lib/pkgconfig
 
 RUN dnf install -y $PACKAGES
 RUN rpm -q $PACKAGES | sort > /packages.txt
-- 
2.25.1


