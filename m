Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B235F6C81CE
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 16:51:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfjT7-0005dF-W1; Fri, 24 Mar 2023 11:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pfjT5-0005aR-Hw
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 11:36:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pfjT3-0001mL-Er
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 11:36:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679672196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=31+sFdvk3T2LqvNQqf82KZSx1MApDouQy3BZTS1lZR4=;
 b=Zggh8g1a6kLagvVryXRK4tjz452dzd/xgRoqMc180kCcAQCqaLhK3u8kXWzqKEsD9sG6+D
 nvrpsju5XtR5B2xExyWKW/sq16I1Nj5exbnmOVXDReaUMD+j8UiVouSMaioVOOoCzAtzjQ
 rLBk2FWLrPC6DXDV5p55TCw7uZ1GBKI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-304-VsP5G-V_O7aVp5pj1OHrkw-1; Fri, 24 Mar 2023 11:36:28 -0400
X-MC-Unique: VsP5G-V_O7aVp5pj1OHrkw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54A812A59553;
 Fri, 24 Mar 2023 15:36:28 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 29E83140E950;
 Fri, 24 Mar 2023 15:36:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 7/8] cirrus-ci: Remove MSYS2 jobs duplicated with gitlab-ci
Date: Fri, 24 Mar 2023 16:36:09 +0100
Message-Id: <20230324153610.224673-8-thuth@redhat.com>
In-Reply-To: <20230324153610.224673-1-thuth@redhat.com>
References: <20230324153610.224673-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

- Various developers are reluctant to git Cirrus-CI the permissions
  requested to access their GitHub account.

- When we use the cirrus-run script to trigger Cirrus-CI job from
  GitLab-CI, the GitLab-CI job is restricted to a 1h timeout
  (often not enough).

- Although Cirrus-CI VMs are more powerful than GitLab-CI ones,
  its free plan is limited in 2 concurrent jobs.

- The GitLab-CI MSYS2 jobs are a 1:1 mapping with the Cirrus-CI ones
  (modulo the environment caching).

Reduce the maintenance burden by removing the Cirrus-CI config file,
keeping the GitLab-CI jobs.

Update Yonggang Luo's maintenance file list to the new file, which
use the same environment shell.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230322135721.61138-3-philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS |   3 +-
 .cirrus.yml | 111 ----------------------------------------------------
 2 files changed, 1 insertion(+), 113 deletions(-)
 delete mode 100644 .cirrus.yml

diff --git a/MAINTAINERS b/MAINTAINERS
index 9b56ccdd92..34b50b267c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3818,8 +3818,7 @@ W: https://cirrus-ci.com/github/qemu/qemu
 Windows Hosted Continuous Integration
 M: Yonggang Luo <luoyonggang@gmail.com>
 S: Maintained
-F: .cirrus.yml
-W: https://cirrus-ci.com/github/qemu/qemu
+F: .gitlab-ci.d/windows.yml
 
 Guest Test Compilation Support
 M: Alex Bennée <alex.bennee@linaro.org>
diff --git a/.cirrus.yml b/.cirrus.yml
deleted file mode 100644
index 5fb00da73d..0000000000
--- a/.cirrus.yml
+++ /dev/null
@@ -1,111 +0,0 @@
-env:
-  CIRRUS_CLONE_DEPTH: 1
-
-windows_msys2_task:
-  timeout_in: 90m
-  windows_container:
-    image: cirrusci/windowsservercore:2019
-    os_version: 2019
-    cpu: 8
-    memory: 8G
-  env:
-    CIRRUS_SHELL: powershell
-    MSYS: winsymlinks:native
-    MSYSTEM: MINGW64
-    MSYS2_URL: https://github.com/msys2/msys2-installer/releases/download/2022-06-03/msys2-base-x86_64-20220603.sfx.exe
-    MSYS2_FINGERPRINT: 0
-    MSYS2_PACKAGES: "
-      diffutils git grep make pkg-config sed
-      mingw-w64-x86_64-python
-      mingw-w64-x86_64-python-sphinx
-      mingw-w64-x86_64-toolchain
-      mingw-w64-x86_64-SDL2
-      mingw-w64-x86_64-SDL2_image
-      mingw-w64-x86_64-gtk3
-      mingw-w64-x86_64-glib2
-      mingw-w64-x86_64-ninja
-      mingw-w64-x86_64-jemalloc
-      mingw-w64-x86_64-lzo2
-      mingw-w64-x86_64-zstd
-      mingw-w64-x86_64-libjpeg-turbo
-      mingw-w64-x86_64-pixman
-      mingw-w64-x86_64-libgcrypt
-      mingw-w64-x86_64-libpng
-      mingw-w64-x86_64-libssh
-      mingw-w64-x86_64-snappy
-      mingw-w64-x86_64-libusb
-      mingw-w64-x86_64-usbredir
-      mingw-w64-x86_64-libtasn1
-      mingw-w64-x86_64-nettle
-      mingw-w64-x86_64-cyrus-sasl
-      mingw-w64-x86_64-curl
-      mingw-w64-x86_64-gnutls
-      mingw-w64-x86_64-libnfs
-    "
-    CHERE_INVOKING: 1
-  msys2_cache:
-    folder: C:\tools\archive
-    reupload_on_changes: false
-    # These env variables are used to generate fingerprint to trigger the cache procedure
-    # If wanna to force re-populate msys2, increase MSYS2_FINGERPRINT
-    fingerprint_script:
-      - |
-        echo $env:CIRRUS_TASK_NAME
-        echo $env:MSYS2_URL
-        echo $env:MSYS2_FINGERPRINT
-        echo $env:MSYS2_PACKAGES
-    populate_script:
-      - |
-        md -Force C:\tools\archive\pkg
-        $start_time = Get-Date
-        bitsadmin /transfer msys_download /dynamic /download /priority FOREGROUND $env:MSYS2_URL C:\tools\archive\base.exe
-        Write-Output "Download time taken: $((Get-Date).Subtract($start_time))"
-        cd C:\tools
-        C:\tools\archive\base.exe -y
-        del -Force C:\tools\archive\base.exe
-        Write-Output "Base install time taken: $((Get-Date).Subtract($start_time))"
-        $start_time = Get-Date
-
-        ((Get-Content -path C:\tools\msys64\etc\\post-install\\07-pacman-key.post -Raw) -replace '--refresh-keys', '--version') | Set-Content -Path C:\tools\msys64\etc\\post-install\\07-pacman-key.post
-        C:\tools\msys64\usr\bin\bash.exe -lc "sed -i 's/^CheckSpace/#CheckSpace/g' /etc/pacman.conf"
-        C:\tools\msys64\usr\bin\bash.exe -lc "export"
-        C:\tools\msys64\usr\bin\pacman.exe --noconfirm -Sy
-        echo Y | C:\tools\msys64\usr\bin\pacman.exe --noconfirm -Suu --overwrite=*
-        taskkill /F /FI "MODULES eq msys-2.0.dll"
-        tasklist
-        C:\tools\msys64\usr\bin\bash.exe -lc "mv -f /etc/pacman.conf.pacnew /etc/pacman.conf || true"
-        C:\tools\msys64\usr\bin\bash.exe -lc "pacman --noconfirm -Syuu --overwrite=*"
-        Write-Output "Core install time taken: $((Get-Date).Subtract($start_time))"
-        $start_time = Get-Date
-
-        C:\tools\msys64\usr\bin\bash.exe -lc "pacman --noconfirm -S --needed $env:MSYS2_PACKAGES"
-        Write-Output "Package install time taken: $((Get-Date).Subtract($start_time))"
-        $start_time = Get-Date
-
-        del -Force -ErrorAction SilentlyContinue C:\tools\msys64\etc\mtab
-        del -Force -ErrorAction SilentlyContinue C:\tools\msys64\dev\fd
-        del -Force -ErrorAction SilentlyContinue C:\tools\msys64\dev\stderr
-        del -Force -ErrorAction SilentlyContinue C:\tools\msys64\dev\stdin
-        del -Force -ErrorAction SilentlyContinue C:\tools\msys64\dev\stdout
-        del -Force -Recurse -ErrorAction SilentlyContinue C:\tools\msys64\var\cache\pacman\pkg
-        tar cf C:\tools\archive\msys64.tar -C C:\tools\ msys64
-
-        Write-Output "Package archive time taken: $((Get-Date).Subtract($start_time))"
-        del -Force -Recurse -ErrorAction SilentlyContinue c:\tools\msys64 
-  install_script:
-    - |
-      $start_time = Get-Date
-      cd C:\tools
-      ls C:\tools\archive\msys64.tar
-      tar xf C:\tools\archive\msys64.tar
-      Write-Output "Extract msys2 time taken: $((Get-Date).Subtract($start_time))"
-  script:
-    - mkdir build
-    - cd build
-    - C:\tools\msys64\usr\bin\bash.exe -lc "../configure --python=python3
-        --target-list-exclude=i386-softmmu,ppc64-softmmu,aarch64-softmmu,mips64-softmmu,mipsel-softmmu,sh4-softmmu"
-    - C:\tools\msys64\usr\bin\bash.exe -lc "make -j8"
-    - exit $LastExitCode
-  test_script:
-    - C:\tools\msys64\usr\bin\bash.exe -lc "cd build && make V=1 check"
-    - exit $LastExitCode
-- 
2.31.1


