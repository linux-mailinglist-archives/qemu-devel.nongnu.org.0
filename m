Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0898F465CF
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 19:35:55 +0200 (CEST)
Received: from localhost ([::1]:53808 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbq7G-0001zR-5b
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 13:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58589)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hbpqh-0005an-1Q
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:18:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hbpqe-00076L-2C
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:18:46 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:46442)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hbpqd-0006lK-KH
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:18:43 -0400
Received: by mail-wr1-x444.google.com with SMTP id n4so3294445wrw.13
 for <qemu-devel@nongnu.org>; Fri, 14 Jun 2019 10:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SFB1HgIcrBt0RkgATkeUJ3aZb9a2tJWQOmU7kxrdIe0=;
 b=l8S3E/KjqL5INvVWbMbz5IYnMh00JOjVVAdagGk6gmhn5DWF2R0bC6RzcL4BxAbH+k
 fbuh75eEUoKiCsVSoyjpbxpvwIPRhTIMbuVJcKWW4DzgsaXtINPf0wv5Dzb3lAZ+d4bv
 Vtycr/GGM6Iy+44UrlYTPM/s6cPbsA5P2YfRb1JHQ1HBeFHt72F4aI30qRJx3xgR9DUc
 38qKJKtyU4JmBBCVYfDpZR9+2xk9i12rugYKwZIHK2oduvP5X39lmqgNtc2iN4U+Jsxf
 WeCeY0A96w0giXvj9iEOBj8DTS5s1miW3OPKbtpTn4pGy+yMpFoT0PDO6+d61bnR22vB
 rHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SFB1HgIcrBt0RkgATkeUJ3aZb9a2tJWQOmU7kxrdIe0=;
 b=FzoDP2nVbNiiyoIJSHT+07m1U1wFUFblXP1gTg0WUHo7SzWTaNHq5hDALGtABYj3gg
 zueX4Br+VWolSQqzu5QJVSTRdPt0KltMmtW13aO+0rFK6ZUvbT7WomaJ/IICsf1NXaXN
 2ptLUJFkOaXbu3seQGDy88ZJA5eyK6gmjBRaBxxGRSS69hGjmgV4yXs9sVBOilgN02mj
 CsZ2NSnP7Q32oV+7iz0FATo1g66JIEth4f2GupwX7K3CdDi2kjzFIzCwTUWOXXYXOGie
 rS1XaZHMdT2zNvEiDwNsBXqJqB0dTNzGwSiI+Gb1INXewU9avitFkGZ6WvJRkD02tXir
 CC7Q==
X-Gm-Message-State: APjAAAWfP5EsP1hW8dCRZ3SBc0tsAJWvPfZJio+ziEpnG75vDoimVLO2
 fHWKrOukZHP6758jvkcIp6DR7A==
X-Google-Smtp-Source: APXvYqyAz1Gz5gpkj41geb6NiTLQDJcGS7+JEZA3h73+iBD7JdShC/Xgt8ZhrpYgBfpS165Spmlu3A==
X-Received: by 2002:a5d:6b52:: with SMTP id x18mr41998034wrw.341.1560532714312; 
 Fri, 14 Jun 2019 10:18:34 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id j7sm4617015wru.54.2019.06.14.10.18.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 10:18:29 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6B7E01FFA9;
 Fri, 14 Jun 2019 18:12:02 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 14 Jun 2019 18:11:31 +0100
Message-Id: <20190614171200.21078-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614171200.21078-1-alex.bennee@linaro.org>
References: <20190614171200.21078-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-devel] [PATCH  v3 21/50] *-user: notify plugin of exit
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
Cc: Riku Voipio <riku.voipio@iki.fi>, "Emilio G. Cota" <cota@braap.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 bsd-user/syscall.c | 3 +++
 linux-user/exit.c  | 1 +
 2 files changed, 4 insertions(+)

diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
index 1ee6195d9f..84a983a9a1 100644
--- a/bsd-user/syscall.c
+++ b/bsd-user/syscall.c
@@ -332,6 +332,7 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         _mcleanup();
 #endif
         gdb_exit(cpu_env, arg1);
+        qemu_plugin_atexit_cb();
         /* XXX: should free thread stack and CPU env */
         _exit(arg1);
         ret = 0; /* avoid warning */
@@ -430,6 +431,7 @@ abi_long do_netbsd_syscall(void *cpu_env, int num, abi_long arg1,
         _mcleanup();
 #endif
         gdb_exit(cpu_env, arg1);
+        qemu_plugin_atexit_cb();
         /* XXX: should free thread stack and CPU env */
         _exit(arg1);
         ret = 0; /* avoid warning */
@@ -505,6 +507,7 @@ abi_long do_openbsd_syscall(void *cpu_env, int num, abi_long arg1,
         _mcleanup();
 #endif
         gdb_exit(cpu_env, arg1);
+        qemu_plugin_atexit_cb();
         /* XXX: should free thread stack and CPU env */
         _exit(arg1);
         ret = 0; /* avoid warning */
diff --git a/linux-user/exit.c b/linux-user/exit.c
index bdda720553..a362ef67d2 100644
--- a/linux-user/exit.c
+++ b/linux-user/exit.c
@@ -35,4 +35,5 @@ void preexit_cleanup(CPUArchState *env, int code)
         __gcov_dump();
 #endif
         gdb_exit(env, code);
+        qemu_plugin_atexit_cb();
 }
-- 
2.20.1


