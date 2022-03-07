Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DA34D047E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 17:48:58 +0100 (CET)
Received: from localhost ([::1]:35904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRGXZ-0003ls-F8
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 11:48:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGVv-0001Kw-RH
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:47:15 -0500
Received: from [2a00:1450:4864:20::429] (port=37874
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGVu-0007il-9K
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:47:15 -0500
Received: by mail-wr1-x429.google.com with SMTP id q14so8727891wrc.4
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 08:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=khb2dSFPApkPaahIP5O1Jg4lPgEuKg6KdJgWB44Ysm4=;
 b=mOzqoQYNMgc1nA+71FFmo27RsIKW294IW0QHrhL0EAbzL9K08ZjeIofxkiChLbJdh8
 szVPjBkIjgzs3wQJjJZGa5CMBpnUmlcER8clYcBzTUdek7WjhFXBYEwv4p+VETkgarX6
 b+hRC7EJyCuJwsEFAOUG+Vxms2VJewM9X42vq5rZn1Fnps4UfhP8H4Q7imuzmsa9Z3HM
 gCrKLIgKG/fdqSYEai6A63uCN/XVnsh1zZJFuEVpCJSDkoAmEOuCXxe+XyBCeq+AEsjf
 JLRybn0lRGuR0ubhkY35dV00VbHkS8B07fYNBq/k3mQhfhIS3kyhlJjKymy/+qGViWC9
 abNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=khb2dSFPApkPaahIP5O1Jg4lPgEuKg6KdJgWB44Ysm4=;
 b=i7mev0D5nd5eseQGSqJte/+ZqWza7k+UyGWBzpqwFJ00xQFcn1lx9J+K6gP3olNEM+
 ReLRyWm0hAs+6MZ00EBuWAH7iLbzZgGGvZJE3xpUePPSGcH5qH8JGh2NqBV5jel7h5Fe
 r0roYAJK+kGkO0tGUeAEso7Gvd/JXNi1g8hijBJqXHdDmF84zoSDddCJOXTmT43ZJ38+
 LSpqZe1Z8tCcaYRYmANzrrYguQuM3CmVtuFoHerYmToWdd815Gn2zMdfCseTHyxxtMDB
 dO5epTYveuBdrQoPBSi3m/RmbUNJuGw9JL7/ElFZpcX0J4yPRcGVcf4mf/D4rAEHlPzR
 5qbw==
X-Gm-Message-State: AOAM531rZrcxfj8JQHo83Ee1rSB7GulTpeOzzbOnTuzG4MUoFStaruFY
 sp+CMEzXqz3+sBreU4uTG+s08EcGLTnK7A==
X-Google-Smtp-Source: ABdhPJxV4awvBFCDp+xlBF9dTne0rWTfPfpp+Rg7Dmp8mzxh5LjBoK3qN8lE3xt7sxfTfIbQ0DB1hQ==
X-Received: by 2002:a5d:6f0d:0:b0:1f1:f897:9dc with SMTP id
 ay13-20020a5d6f0d000000b001f1f89709dcmr4229874wrb.32.1646671632741; 
 Mon, 07 Mar 2022 08:47:12 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v188-20020a1cacc5000000b00384b71a50d5sm13806652wme.24.2022.03.07.08.47.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 08:47:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/18] util: Make qemu_oom_check() a static function
Date: Mon,  7 Mar 2022 16:46:52 +0000
Message-Id: <20220307164709.2503250-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307164709.2503250-1-peter.maydell@linaro.org>
References: <20220307164709.2503250-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The qemu_oom_check() function, which we define in both oslib-posix.c
and oslib-win32.c, is now used only locally in that file; make it
static.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20220226180723.1706285-3-peter.maydell@linaro.org
---
 include/qemu-common.h | 2 --
 util/oslib-posix.c    | 2 +-
 util/oslib-win32.c    | 2 +-
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index 68b2e3bc109..8c0d9ab0f77 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -26,8 +26,6 @@
 int qemu_main(int argc, char **argv, char **envp);
 #endif
 
-void *qemu_oom_check(void *ptr);
-
 ssize_t qemu_write_full(int fd, const void *buf, size_t count)
     QEMU_WARN_UNUSED_RESULT;
 
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index f2be7321c59..ed5974d3845 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -199,7 +199,7 @@ fail_close:
     return false;
 }
 
-void *qemu_oom_check(void *ptr)
+static void *qemu_oom_check(void *ptr)
 {
     if (ptr == NULL) {
         fprintf(stderr, "Failed to allocate memory: %s\n", strerror(errno));
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index af559ef3398..c87e6977246 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -44,7 +44,7 @@
 /* this must come after including "trace.h" */
 #include <shlobj.h>
 
-void *qemu_oom_check(void *ptr)
+static void *qemu_oom_check(void *ptr)
 {
     if (ptr == NULL) {
         fprintf(stderr, "Failed to allocate memory: %lu\n", GetLastError());
-- 
2.25.1


