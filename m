Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6955D35FAE5
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 20:44:42 +0200 (CEST)
Received: from localhost ([::1]:36182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWkVF-0004aQ-Hl
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 14:44:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWkUO-0004AX-ON
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 14:43:48 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:46887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWkUM-0008Ve-OE
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 14:43:48 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 z24-20020a1cf4180000b029012463a9027fso11049824wma.5
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 11:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PKw0TOC1A/5uTX7enzJxwvXlZy0iXKLLrfg82ieLYqM=;
 b=bWO4vHPGzGDXMTLV2pj2W7L4vQjw7lQDvOjve+YZCN7fwL17gGWWoXVj4lJqYyCsCw
 7bCxQfJx56nIU5jPliHyPSpaecwsyw5J/IS3RfNBnPRGi3kpw0EUWKPwcC/l6a/+mFvD
 ni1GTiI66DuAVhpuZKrcxM1/SaKxi0SJRoG9pQiQ2crx1daR6AxzDIun4tuDZpHuvz95
 oYR66HiZo7Qr1tnlTpkpbP22uC19r5PnIREzh3EWNj63ItKepHeuNIg1wL1IVPgjFta5
 l44M1a+V+YgMfGanDAymtSZVNFLRZoWTNoxyz30NR4HcXlRayCZ8SWDD7NuQyKyjRAq9
 UllQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PKw0TOC1A/5uTX7enzJxwvXlZy0iXKLLrfg82ieLYqM=;
 b=Nu7JcKioLOA4A38nfv+UP0AupMs1a8r4rMUoiIWNNujyqNGesPIlRGGo1A1ftRCy/f
 CIYyKe8o9hYXX3PkpMrV1w6Com8SXihWZ/ssbXs6Cm+G7GO6jdL2KQ9eEMLZehdi4iX6
 Qg9a/y2ti6+2/QV/tXf12QzFp4rza+fwOh6V5hvnxWDnN8woUccEyIhZq8+V5eEVyCWm
 s23TjmXyXEGFfn1QymGXzO41pkvo41nMwiOygaDCDEJGU1srux3eN9KIHSi+nrrzKyNv
 KB+xlL7JfHH8aHhysCqcNjnIGgQayihMEau+tUXsQECkfOqEmvCLcxaYFz3DKY9l/vLi
 WkLw==
X-Gm-Message-State: AOAM530MwPcPpikbM0Wdl7UvCdvMk666UiBxJhq1JDrM3XANntrb6Hsf
 Bh8X3b/QO7uYVs3p70ISFl2RYU9SrSnsX+1k
X-Google-Smtp-Source: ABdhPJwoV7iMo7LDXkL+jrt/dovVY+fk39GYaiRfaAelWuNNjFoiV8bNkhAivJRMNMX2d+iH9z6/zA==
X-Received: by 2002:a1c:35c6:: with SMTP id c189mr3044872wma.127.1618425825332; 
 Wed, 14 Apr 2021 11:43:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a2sm236331wrt.82.2021.04.14.11.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 11:43:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] include/qemu/osdep.h: Move system includes to top
Date: Wed, 14 Apr 2021 19:43:43 +0100
Message-Id: <20210414184343.26235-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mostly osdep.h puts the system includes at the top of the file; but
there are a couple of exceptions where we include a system header
halfway through the file.  Move these up to the top with the rest
so that all the system headers we include are included before
we include os-win32.h or os-posix.h.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/qemu/osdep.h | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index ba15be9c569..38c96c72db2 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -104,6 +104,15 @@ extern int daemon(int, int);
 #include <setjmp.h>
 #include <signal.h>
 
+#ifdef CONFIG_IOVEC
+#include <sys/uio.h>
+#endif
+
+#if defined(__linux__) && defined(__sparc__)
+/* The SPARC definition of QEMU_VMALLOC_ALIGN needs SHMLBA */
+#include <sys/shm.h>
+#endif
+
 #ifndef _WIN32
 #include <sys/wait.h>
 #else
@@ -111,6 +120,10 @@ extern int daemon(int, int);
 #define WEXITSTATUS(x) (x)
 #endif
 
+#ifdef __APPLE__
+#include <AvailabilityMacros.h>
+#endif
+
 #ifdef _WIN32
 #include "sysemu/os-win32.h"
 #endif
@@ -119,10 +132,6 @@ extern int daemon(int, int);
 #include "sysemu/os-posix.h"
 #endif
 
-#ifdef __APPLE__
-#include <AvailabilityMacros.h>
-#endif
-
 #include "glib-compat.h"
 #include "qemu/typedefs.h"
 
@@ -459,7 +468,6 @@ void qemu_anon_ram_free(void *ptr, size_t size);
    /* Use 1 MiB (segment size) alignment so gmap can be used by KVM. */
 #  define QEMU_VMALLOC_ALIGN (256 * 4096)
 #elif defined(__linux__) && defined(__sparc__)
-#include <sys/shm.h>
 #  define QEMU_VMALLOC_ALIGN MAX(qemu_real_host_page_size, SHMLBA)
 #else
 #  define QEMU_VMALLOC_ALIGN qemu_real_host_page_size
@@ -539,8 +547,6 @@ struct iovec {
 
 ssize_t readv(int fd, const struct iovec *iov, int iov_cnt);
 ssize_t writev(int fd, const struct iovec *iov, int iov_cnt);
-#else
-#include <sys/uio.h>
 #endif
 
 #ifdef _WIN32
-- 
2.20.1


