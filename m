Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B23615846D3
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 22:07:51 +0200 (CEST)
Received: from localhost ([::1]:35326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH9nS-00066y-PH
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 16:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1oH9kP-0002sT-8H; Thu, 28 Jul 2022 16:04:41 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:51056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1oH9kN-0003Vu-58; Thu, 28 Jul 2022 16:04:40 -0400
Received: by mail-pj1-x102f.google.com with SMTP id f7so3031588pjp.0;
 Thu, 28 Jul 2022 13:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m0zl3TeCn86IKoa6p7FYTXNlI7C9XKjHCM/vPgbzrgU=;
 b=kcmmSn6I6BoCMN8O/SMnUGiwxrtdj1VxdZlZjOPOLyNkaiD5jx3E4GNEF/yTf6qn7v
 eKGDBa6KAz4uVyaCPVGMstSB+WNaPSzQNLPENGTbb5cI/CpCmMI9kLbNCn3oO8Limt2M
 MH6abTF5c/NRXnzdTNY/bxA+IpbcxR0HOD7cKbHqvJTsLeksDdrxLkbcvl/qgYAkQx8d
 CKT7EGaSLM1RjmCgD7J8k148wg0fTKkLQeSiZihFgYIJ3v6FYa/5zsl6zniNT7EZ7WEs
 d4zX1h4Gdf4zqxrYBScs6WwwQNQ8smyM3JkGZiaFH5lej6+73mjwi0W56vmv/t929daQ
 L+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m0zl3TeCn86IKoa6p7FYTXNlI7C9XKjHCM/vPgbzrgU=;
 b=Dufa1s1YnVjdZ7ghob3sFLtjGCGTZqKo0yJTMY4URm+F/yJMaW7MpPGQ3yl+Rt+bHv
 PgCnSsM7AnhFHzP4JrLpzOX3voTLRV2SMJ5AinpZxu0P6++CQt0UikDDLfcZ6fb9kJSt
 OKdiEApYfsST7t2inlPyuXnXEavmabvb7uvMvRQGPN7pxJu0/5HTxDCnjCgtFjp+x7Hi
 PMbaAlOA8ESY0mZyWgiTtyZVW92JH/sL3JEyUDl9YIoG6vcFqLMGmfPd5S4787zcr52Z
 PFrGJe5rkFtbLld1JMWwN6nEV3Bh9SjTWRTK8C5b2qqaAkgo++504+d7zfRYOa+tfvxQ
 2Fyw==
X-Gm-Message-State: ACgBeo1oAbkyCD/PQqyHGZBqTokWrDbgYJ1127zUMq8U+YSIah4ffIdc
 Sa7oHAc5fmPQkxH/8l4/FjJCSryI3lY=
X-Google-Smtp-Source: AA6agR5EanLwdaMOmctLgr3jMTgbOjnDYK+mcAw0boLSCromj8CnuXQ1T034lrMrW2K5M7a0YbZVIw==
X-Received: by 2002:a17:902:ecc2:b0:16d:66eb:bb65 with SMTP id
 a2-20020a170902ecc200b0016d66ebbb65mr445369plh.97.1659038676974; 
 Thu, 28 Jul 2022 13:04:36 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 p10-20020a170902780a00b0016d1c771031sm1632720pll.242.2022.07.28.13.04.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 13:04:36 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Yonggang Luo <luoyonggang@gmail.com>, Thomas Huth <thuth@redhat.com>,
 qemu-trivial@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v2] ci: Upgrade msys2 release to 20220603
Date: Fri, 29 Jul 2022 04:04:22 +0800
Message-Id: <20220728200422.1502-1-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.36.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj1-x102f.google.com
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

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 .cirrus.yml              | 2 +-
 .gitlab-ci.d/windows.yml | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 20843a420c..4ffef6105b 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -12,7 +12,7 @@ windows_msys2_task:
     CIRRUS_SHELL: powershell
     MSYS: winsymlinks:nativestrict
     MSYSTEM: MINGW64
-    MSYS2_URL: https://github.com/msys2/msys2-installer/releases/download/2022-05-03/msys2-base-x86_64-20220503.sfx.exe
+    MSYS2_URL: https://github.com/msys2/msys2-installer/releases/download/2022-06-03/msys2-base-x86_64-20220603.sfx.exe
     MSYS2_FINGERPRINT: 0
     MSYS2_PACKAGES: "
       diffutils git grep make pkg-config sed
diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index 1b2ede49e1..da80fabe2c 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -17,7 +17,7 @@
     }
   - If ( !(Test-Path -Path msys64\var\cache\msys2.exe ) ) {
       Invoke-WebRequest
-      "https://github.com/msys2/msys2-installer/releases/download/2022-05-03/msys2-base-x86_64-20220503.sfx.exe"
+      "https://github.com/msys2/msys2-installer/releases/download/2022-06-03/msys2-base-x86_64-20220603.sfx.exe"
       -outfile "msys64\var\cache\msys2.exe"
     }
   - msys64\var\cache\msys2.exe -y
-- 
2.36.1.windows.1


