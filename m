Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B161B6191
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Apr 2020 19:07:38 +0200 (CEST)
Received: from localhost ([::1]:60462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRfK5-0003F9-J1
	for lists+qemu-devel@lfdr.de; Thu, 23 Apr 2020 13:07:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44570)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jRfIb-0000wO-RK
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 13:06:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jRfIa-0005S5-PQ
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 13:06:05 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:37338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jRfIa-0005Re-CK
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 13:06:04 -0400
Received: by mail-wm1-x341.google.com with SMTP id z6so7355876wml.2
 for <qemu-devel@nongnu.org>; Thu, 23 Apr 2020 10:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rec4lCI7C2I9ftVXhw3jnhwwniJ/OyIiNlpjw4I33hQ=;
 b=tExudrxB9vPk++NxCuVAo8EeZ109asjdxvLWGyve24NzSHb6Dg1N4A7vwp2xnIt+rI
 +TdPFVmhFYaMtMaPlCHSYd7hh12ZtaOPp4DPr1xvchNsZT39jZ8AdNfOBsB/K9AyQQak
 9EfK2aRwD9wOPURWocN59R4dS5IggtEsZrPNn93cjcLnHIvp/GkHVwKt9VtDFgJYrhrA
 iE5QaOYDiw++HdAqaLzUv10WT3gUHudZqsk9/KNUQY5jkP4wmzsVmba/olTS7r7TkYYI
 rTztF+WTblsJieNuUDZ47gWuHpRQjyHnRmwj5zbiifqf86qMILEGt3J4dJgLEovZd+cs
 udtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rec4lCI7C2I9ftVXhw3jnhwwniJ/OyIiNlpjw4I33hQ=;
 b=nlJXX1wMGOxJKDiVaK+JpLDZk92aW28FKWcY2+enUVa8U7UeewZ5sWWiIVxkbZOB5/
 g7OdrIdcLQjha6lWQ8qzo91F7oJzrgNDmdtFUPe2XMDN4GL6wFI5ENiWhnaznH2ajO7I
 26smaXWbXwLbKBeeMFp1T/DxfUuyd8dzJK86MA0ZWb1UMUbLzpj9kMT78L50otfOvZ3i
 Hr6xuNFi970SElo48umzZx7EOAN93ystVhOKNfCjVlzGBflT33O01l6OKoZwPX0q0iU5
 6I5/Xj75yLAbBTrgf8gUVaEdk5dlin/E4QhH2uIRvaZldWNUP3mjLA/foZllrm2LHLyx
 /AkA==
X-Gm-Message-State: AGi0Pubb+N4mEFvKOLSgpDGJlmPnpZfUlOfGsbJey9A2OrdkqeSLoeC7
 nqLarha/rggdFknF1CG//Ts+ZQ==
X-Google-Smtp-Source: APiQypIJCVINl5UI/D09wOeos0YtIIqD/mcpJQii3MCk6RXFSt3Rb6QGGnAWAJx/qBH11twcdDGFEA==
X-Received: by 2002:a1c:9cc6:: with SMTP id f189mr5051083wme.75.1587661562041; 
 Thu, 23 Apr 2020 10:06:02 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y40sm4854696wrd.20.2020.04.23.10.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 10:05:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 737861FF8C;
 Thu, 23 Apr 2020 18:05:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 02/14] exec/cpu-all: Use bool for have_guest_base
Date: Thu, 23 Apr 2020 18:05:45 +0100
Message-Id: <20200423170557.31106-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200423170557.31106-1-alex.bennee@linaro.org>
References: <20200423170557.31106-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/exec/cpu-all.h | 2 +-
 bsd-user/main.c        | 4 ++--
 linux-user/main.c      | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 49384bb66a..b4fb5832c4 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -159,7 +159,7 @@ static inline void tswap64s(uint64_t *s)
  * This allows the guest address space to be offset to a convenient location.
  */
 extern unsigned long guest_base;
-extern int have_guest_base;
+extern bool have_guest_base;
 extern unsigned long reserved_va;
 
 #if HOST_LONG_BITS <= TARGET_VIRT_ADDR_SPACE_BITS
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 770c2b267a..aef5531628 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -42,7 +42,7 @@
 int singlestep;
 unsigned long mmap_min_addr;
 unsigned long guest_base;
-int have_guest_base;
+bool have_guest_base;
 unsigned long reserved_va;
 
 static const char *interp_prefix = CONFIG_QEMU_INTERP_PREFIX;
@@ -828,7 +828,7 @@ int main(int argc, char **argv)
             }
         } else if (!strcmp(r, "B")) {
            guest_base = strtol(argv[optind++], NULL, 0);
-           have_guest_base = 1;
+           have_guest_base = true;
         } else if (!strcmp(r, "drop-ld-preload")) {
             (void) envlist_unsetenv(envlist, "LD_PRELOAD");
         } else if (!strcmp(r, "bsd")) {
diff --git a/linux-user/main.c b/linux-user/main.c
index 1d20a83d4e..90ad365b43 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -59,7 +59,7 @@ static const char *cpu_type;
 static const char *seed_optarg;
 unsigned long mmap_min_addr;
 unsigned long guest_base;
-int have_guest_base;
+bool have_guest_base;
 
 /*
  * Used to implement backwards-compatibility for the `-strace`, and
@@ -334,7 +334,7 @@ static void handle_arg_cpu(const char *arg)
 static void handle_arg_guest_base(const char *arg)
 {
     guest_base = strtol(arg, NULL, 0);
-    have_guest_base = 1;
+    have_guest_base = true;
 }
 
 static void handle_arg_reserved_va(const char *arg)
-- 
2.20.1


