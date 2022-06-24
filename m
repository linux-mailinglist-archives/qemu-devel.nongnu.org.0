Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A05E559FB9
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 19:49:49 +0200 (CEST)
Received: from localhost ([::1]:51344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4nRE-00080D-3Q
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 13:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o4nCT-0005nG-72
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 13:34:33 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:41538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o4nCR-0002AV-LI
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 13:34:32 -0400
Received: by mail-pf1-x429.google.com with SMTP id i64so3135750pfc.8
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 10:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=so1aZRcDpyrdxlBJDv3CBb5TATsqmUYPZ6aYDaBQuyc=;
 b=NJUgsrMiRb5EKbskDmM6FdKa23Z6rduxWJkD3GLwwNBqGUkUSt0xPuatN2lptVyKBR
 zkCOT4spfbAf+EXdbRabdRBvVWrnLy68lNJj8uHgELsPup8L9hdGkDqqSMuTEFQfJtWK
 FY+ZFNQFr87Rdi3jUW6b1lfhWffcJg1iEMEJ9NOZcVMGPHFX2ftXUoeAUU6Zn//dLjFq
 4dWT5cYJYvNRstlTs30rt0FD6aDpXHzTToimKXgn7x6Jn0e73Pz6ZJpwwaV5/j0Yd8hU
 HkIblG4CZ9RlKTuqx86+sNTnC4QI7cWTrZyy014l0a+7v9WpYpBp1JGqAI6o4gWvj29B
 GbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=so1aZRcDpyrdxlBJDv3CBb5TATsqmUYPZ6aYDaBQuyc=;
 b=2oMIUUHPYOYo72oHvaqZEArgNAlqKjJ4t2IVIE9DcPnVFxf3qV/N0syW2qYzbHIIdU
 x2T9nPEjb0NmQebZyn0x8IV/ZSYckeHslQjnx+Hx33sujvnMY+9kqY1LVHAwRiqnvNeF
 wWffl7yjCGDloS6zSViWawetzhQV/b0BZbKkpu9u1QM5Qr5arVpBToDb7tImkVhZxdi+
 xzjDq0XJjRMxQIKSJUcO89ajGw9cia1PVs7diJj/UzOt0ztJlkooquUKRcd/5OI6Vqzw
 Wyn00Dn0Al1uyYRJe8purPJ9ZXtShq7FqEWoiMerCoijMPcmoU5eGHEBegsE30Tylk4O
 bC/A==
X-Gm-Message-State: AJIora9kBhVsZJOdilAoFc4UHg7xAQeXKNN00qafbNnBF+pN8Bxm6Gdw
 M6eYP6Hkreox1Kf/IzMztZlzb2EzUkQ=
X-Google-Smtp-Source: AGRyM1v7aAe8NvSJwB/IV8Lx6ONGWdQYTzqsSzt10GikmEEbwUOPLby7/M28K6tBIecNZwkqBeofNA==
X-Received: by 2002:a63:ef0b:0:b0:40d:287d:71e1 with SMTP id
 u11-20020a63ef0b000000b0040d287d71e1mr3301pgh.330.1656092070442; 
 Fri, 24 Jun 2022 10:34:30 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:80ba:2fd0:a1d1:c891])
 by smtp.gmail.com with ESMTPSA id
 mv24-20020a17090b199800b001d954837197sm4269406pjb.22.2022.06.24.10.34.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Jun 2022 10:34:29 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v9 4/4] module: Use bundle mechanism
Date: Sat, 25 Jun 2022 02:34:05 +0900
Message-Id: <20220624173405.85131-5-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220624173405.85131-1-akihiko.odaki@gmail.com>
References: <20220624173405.85131-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Before this change, the directory of the executable was being added to
resolve modules in the build tree. However, get_relocated_path() can now
resolve them with the new bundle mechanism.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 util/module.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/util/module.c b/util/module.c
index 6bb4ad915a1..8ddb0e18f51 100644
--- a/util/module.c
+++ b/util/module.c
@@ -274,7 +274,6 @@ bool module_load_one(const char *prefix, const char *lib_name, bool mayfail)
         dirs[n_dirs++] = g_strdup_printf("%s", search_dir);
     }
     dirs[n_dirs++] = get_relocated_path(CONFIG_QEMU_MODDIR);
-    dirs[n_dirs++] = g_strdup(qemu_get_exec_dir());
 
 #ifdef CONFIG_MODULE_UPGRADES
     version_dir = g_strcanon(g_strdup(QEMU_PKGVERSION),
-- 
2.32.1 (Apple Git-133)


