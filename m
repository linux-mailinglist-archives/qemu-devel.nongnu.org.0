Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6C62856E8
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Oct 2020 05:14:26 +0200 (CEST)
Received: from localhost ([::1]:36170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPzuL-0001rJ-Oq
	for lists+qemu-devel@lfdr.de; Tue, 06 Oct 2020 23:14:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kPzsF-0000TZ-Md; Tue, 06 Oct 2020 23:12:15 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:32786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kPzsD-0005lY-Lg; Tue, 06 Oct 2020 23:12:15 -0400
Received: by mail-pj1-x102f.google.com with SMTP id t23so2193376pji.0;
 Tue, 06 Oct 2020 20:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ti82CZTFz3EhPzRXs4Twux3NzJ56A37z948Ppkw4Evw=;
 b=Wjc5u9crHCBTUzjT0wiTxspQ42JCtdjFStdZCMRsP17MBzEHJt3AiDKnoNx8TakhAj
 4/PHQlP3jXd8hwOd49WIA1kWFqvkP0Lg0DiC94a2JNfnoTqCVEW+hnoXpUD1kPWYKZ7T
 Dw7Qzfr1aLuaQhTLWCb/cHqeCBtFH+x2h7+Cm0VK+dU+jIAqV4voT9a9nVdwsT56ZBz5
 GX1mfjIgYFFw2cQEXQfN8haMcb3rlqTTTohG1up8yDrVQJXluLsXlvk4dCQDePNxusd3
 w7j9lwNQgXw/mBHHM3R9h97DEVfDBH1ZddlhoaumR39rLJiCjDlKeW8xEa4ipno+AYQt
 IW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ti82CZTFz3EhPzRXs4Twux3NzJ56A37z948Ppkw4Evw=;
 b=fSNdj0opVqxPJz+g9MliQbnm/34t0de/Rofs+DciFnMRTaAbwSNhuiEpzOu1Weqkzw
 du5LiojY4wYfLZ11Aj/+AqYz14ONwa8T4BTmKRrz8g7L4vYiUPoafUUH0fLSUd0fhBku
 eC1xEwaul/c15hNGXt1hlG7HG29NU40+Qm3eWVN2hHCjCtntldtHp85fi0+yLN1kry/x
 MmzBTeVirvtEbJJLDsYFPDaaPooGP3vBFmryJ6A5H72KpnRWhsdFFGjG/a3/5reJMmuG
 ZF77WAzGXarBdm/lzEJLbqnGMmkbCP7ZTJtw21+F6kMmj6Nrtvk+CFJ1oiu7vm+y1802
 v3zw==
X-Gm-Message-State: AOAM530bnmPoWh+cft1XR0kgFURLGptYyVP9aKRRidJdMoK0pXFgzq47
 1BQhfXQhHrlY/27tsMPf1Ii6ui0aqXDrmw==
X-Google-Smtp-Source: ABdhPJzd333it522tIKmKwoFZc1B87iN5dN6XqRBriR724uaindA+1KOnil8v23BkQMVG23eJSLAlg==
X-Received: by 2002:a17:902:8509:b029:d3:89e2:7931 with SMTP id
 bj9-20020a1709028509b02900d389e27931mr947151plb.51.1602040331263; 
 Tue, 06 Oct 2020 20:12:11 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id cs21sm9001614pjb.0.2020.10.06.20.12.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 20:12:10 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] cirrus: Fixing and speedup the msys2/mingw CI
Date: Wed,  7 Oct 2020 11:11:48 +0800
Message-Id: <20201007031148.232-3-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20201007031148.232-1-luoyonggang@gmail.com>
References: <20201007031148.232-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj1-x102f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yonggang Luo <luoyonggang@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using a prepared https://github.com/lygstate/qemu/releases/download/v5.1.0/msys2-x86_64.tar.xz
for speed up the msys2/mingw prepare speed on the cirrus CI.
This file are generated by the msys2.docker

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 .cirrus.yml | 58 ++++++++++++++---------------------------------------
 1 file changed, 15 insertions(+), 43 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index d58782ce67..6fd884db7a 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -47,58 +47,30 @@ macos_xcode_task:
 
 windows_msys2_task:
   windows_container:
-    image: cirrusci/windowsservercore:cmake
+    image: cirrusci/windowsservercore:2019
     os_version: 2019
     cpu: 8
     memory: 8G
   env:
+    CIRRUS_SHELL: powershell
     MSYS: winsymlinks:nativestrict
     MSYSTEM: MINGW64
     CHERE_INVOKING: 1
-  printenv_script:
-    - C:\tools\msys64\usr\bin\bash.exe -lc 'printenv'
   install_script:
-    - C:\tools\msys64\usr\bin\bash.exe -lc "cd /c/tools &&
-        curl -O http://repo.msys2.org/msys/x86_64/msys2-keyring-r21.b39fb11-1-any.pkg.tar.xz"
-    - C:\tools\msys64\usr\bin\bash.exe -lc "cd /c/tools &&
-        curl -O http://repo.msys2.org/msys/x86_64/msys2-keyring-r21.b39fb11-1-any.pkg.tar.xz.sig"
-    - C:\tools\msys64\usr\bin\bash.exe -lc "cd /c/tools &&
-        pacman -U --noconfirm msys2-keyring-r21.b39fb11-1-any.pkg.tar.xz"
-    - C:\tools\msys64\usr\bin\bash.exe -lc "pacman --noconfirm -Sy"
+    - |
+      Write-Output $env:PATH
+      md C:\tools
+      $start_time = Get-Date
+      bitsadmin /transfer msys_download /dynamic /download /priority FOREGROUND https://github.com/lygstate/qemu/releases/download/v5.1.0/msys2-x86_64.tar.xz C:\tools\msys2-x86_64.tar.xz
+      Write-Output "Download time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
+      $start_time = Get-Date
+      cd C:\tools
+      choco install -y --no-progress 7zip
+      cmd /C "7z x msys2-x86_64.tar.xz -so | 7z x -aoa -simsys2-x86_64.tar -ttar -omsys64"
+      Write-Output "Extract time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
     - C:\tools\msys64\usr\bin\bash.exe -lc "pacman --noconfirm -S --needed
-        bash pacman pacman-mirrors msys2-runtime"
-    - taskkill /F /IM gpg-agent.exe
-    - C:\tools\msys64\usr\bin\bash.exe -lc "pacman --noconfirm -Su"
-    - C:\tools\msys64\usr\bin\bash.exe -lc "pacman --noconfirm -S --needed
-        base-devel
-        git
-        mingw-w64-x86_64-python
-        mingw-w64-x86_64-python-setuptools
-        mingw-w64-x86_64-toolchain
-        mingw-w64-x86_64-capstone
-        mingw-w64-x86_64-SDL2
-        mingw-w64-x86_64-SDL2_image
-        mingw-w64-x86_64-gtk3
-        mingw-w64-x86_64-glib2
-        mingw-w64-x86_64-ninja
-        mingw-w64-x86_64-make
-        mingw-w64-x86_64-lzo2
-        mingw-w64-x86_64-zstd
-        mingw-w64-x86_64-libjpeg-turbo
-        mingw-w64-x86_64-pixman
-        mingw-w64-x86_64-libgcrypt
-        mingw-w64-x86_64-libpng
-        mingw-w64-x86_64-libssh
-        mingw-w64-x86_64-libxml2
-        mingw-w64-x86_64-snappy
-        mingw-w64-x86_64-libusb
-        mingw-w64-x86_64-usbredir
-        mingw-w64-x86_64-libtasn1
-        mingw-w64-x86_64-nettle
-        mingw-w64-x86_64-cyrus-sasl
-        mingw-w64-x86_64-curl
-        mingw-w64-x86_64-gnutls
-        mingw-w64-x86_64-zstd"
+      mingw-w64-x86_64-python-sphinx"
+
   script:
     - C:\tools\msys64\usr\bin\bash.exe -lc "mkdir build"
     - C:\tools\msys64\usr\bin\bash.exe -lc "cd build && ../configure
-- 
2.28.0.windows.1


