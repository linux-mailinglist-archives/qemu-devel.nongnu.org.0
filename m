Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEB5363203
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 21:43:54 +0200 (CEST)
Received: from localhost ([::1]:37784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXqrB-0001MT-Aq
	for lists+qemu-devel@lfdr.de; Sat, 17 Apr 2021 15:43:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXqpb-0007vV-L1
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 15:42:15 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXqpX-0008C1-Iy
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 15:42:15 -0400
Received: by mail-wr1-x42b.google.com with SMTP id c15so20997969wro.13
 for <qemu-devel@nongnu.org>; Sat, 17 Apr 2021 12:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X+yX84qon75IWnfGBV9DoIC7IAiy08A30WrHnxDcNWA=;
 b=mDbxqx9JoIiNtPO0HHXqoQjuCUGAk4XWnDx81AURiK98JIvzmcGbjzojgLh/wndUGk
 T++17PQRxN90walHNLvZKA6EjtKTa/KtlXXRpnjPWdZtyZ89pQAWeZg7Z6j4RPFNaAlb
 //gp4dVr1/zj2SKj4mf+RbvB/Tvh+3x/mi5/VBPFOHAr4KZxBK1xryDBJWjrI8YljZ31
 azBboIErl3ZBoAvLlsmZwNAyH5McXZFSgkz1MYOBth2A9UuJymEaGkyN5YNGHrpviyi/
 KGGYMWw85rHzMswwoqJgRG/mcpR+pGx7BDQuaO9iuKfPHy5oYCTxCtZVr6gDvXhI5nrx
 YPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X+yX84qon75IWnfGBV9DoIC7IAiy08A30WrHnxDcNWA=;
 b=sVEJeY/L8Y//VOeQZn7o7pYoaJkpgYzibtA0DeigcFhUX46guYXZYfypdbtVKn33fB
 TpQaf+dm/I9cR0rtYK7xsEU7Bcni0e/F/4GPswtGj6RXcj8v5ycOsNHRTceWcQQaLquF
 CWtuRVWGSrFr1WC53r4jKadrWjscByRdHICwEtUcrEq/9LEaqEO2a0XCwLeEWQQUqrNU
 NgXAS0ThdyYXnEzLuMzoO4TKCJO82jMdFYUven65frdTnU/FmE8y2sgF5R3Htqfi3yhc
 cfQkkMx2PE3ZBMjDU7q+XzxPcUMTKseq9uISaDrQFyKv0HSWVqAt50cN0eO/ubiL9MQc
 7OyQ==
X-Gm-Message-State: AOAM530XMEOk+Qdorpih+wQxOqrjyfCG0SYOaDFoKODwf7grk62tOIFC
 Y1MmaR/joCyzI/eImTHqXvt8khtn/ivnjoYG
X-Google-Smtp-Source: ABdhPJwjrbc+5Dy0dnoaaNo0SfncUHuQC02KKga6dqmIbldFdoAFzRfFKLiYZdS/HZ+GF8Qkiu6n8w==
X-Received: by 2002:a5d:4c88:: with SMTP id z8mr5692000wrs.154.1618688530097; 
 Sat, 17 Apr 2021 12:42:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c12sm17304374wro.6.2021.04.17.12.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Apr 2021 12:42:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 3/7] include/qemu/osdep.h: Move system includes to top
Date: Sat, 17 Apr 2021 20:42:01 +0100
Message-Id: <20210417194205.17057-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210417194205.17057-1-peter.maydell@linaro.org>
References: <20210417194205.17057-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mostly osdep.h puts the system includes at the top of the file; but
there are a couple of exceptions where we include a system header
halfway through the file.  Move these up to the top with the rest
so that all the system headers we include are included before
we include os-win32.h or os-posix.h.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210416135543.20382-4-peter.maydell@linaro.org
Message-id: 20210414184343.26235-1-peter.maydell@linaro.org
---
 include/qemu/osdep.h | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 6d8562eaf40..cb2a07e472e 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -104,6 +104,15 @@ QEMU_EXTERN_C int daemon(int, int);
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
@@ -111,6 +120,10 @@ QEMU_EXTERN_C int daemon(int, int);
 #define WEXITSTATUS(x) (x)
 #endif
 
+#ifdef __APPLE__
+#include <AvailabilityMacros.h>
+#endif
+
 /*
  * This is somewhat like a system header; it must be outside any extern "C"
  * block because it includes system headers itself, including glib.h,
@@ -130,10 +143,6 @@ extern "C" {
 #include "sysemu/os-posix.h"
 #endif
 
-#ifdef __APPLE__
-#include <AvailabilityMacros.h>
-#endif
-
 #include "qemu/typedefs.h"
 
 /*
@@ -469,7 +478,6 @@ void qemu_anon_ram_free(void *ptr, size_t size);
    /* Use 1 MiB (segment size) alignment so gmap can be used by KVM. */
 #  define QEMU_VMALLOC_ALIGN (256 * 4096)
 #elif defined(__linux__) && defined(__sparc__)
-#include <sys/shm.h>
 #  define QEMU_VMALLOC_ALIGN MAX(qemu_real_host_page_size, SHMLBA)
 #else
 #  define QEMU_VMALLOC_ALIGN qemu_real_host_page_size
@@ -549,8 +557,6 @@ struct iovec {
 
 ssize_t readv(int fd, const struct iovec *iov, int iov_cnt);
 ssize_t writev(int fd, const struct iovec *iov, int iov_cnt);
-#else
-#include <sys/uio.h>
 #endif
 
 #ifdef _WIN32
-- 
2.20.1


