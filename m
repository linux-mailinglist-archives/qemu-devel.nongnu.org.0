Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E66893728B7
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 12:20:28 +0200 (CEST)
Received: from localhost ([::1]:55896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldsAF-0006He-Vy
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 06:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrzm-0002Uh-SH
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:09:39 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrzi-0006m8-Rx
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:09:36 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d4so8734359wru.7
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 03:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5Fgd5AuHBvzHDNyp+2NAevLOgBMdJOfM03jnWADviJw=;
 b=MgUko09XnAkL7cAS59TsHU5UyW1zBzKH0CrL7B0WV1IWHdumUeyneYYCKbdtth235I
 Zaei3PG/yp42YROwaxHs1xHrvJVdnN4YLU8VFld8kmUsL6qKo7EnQyzVJLIXndvNVSVQ
 pBMY8qTHcrlNJuRsA9scUk9/74aXs25zmiFHQkBTDdijhX0f8Jm+J6KIkIQYbGDVVYYt
 uCRtksHZ+T9MLHnkohbP6MMkKT1YoqNHx52shQMcRIIKuYKYAdPMxgiP0XA5cLpK6vdt
 9yrW1vFkMw0vVi4P+zGXBIFkx0FKhKRrAokcMPtJuehXjPAtYeOSV+surOk97V/lhumJ
 FUcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5Fgd5AuHBvzHDNyp+2NAevLOgBMdJOfM03jnWADviJw=;
 b=EM3nSz/CVpHau4eI90Kk+h+MPqf+8XderDuDp9XSCqogRjGrm79vNKDecl4iGULUj/
 mG5c4r/P1lXooZ0uUEOlbXA2cO5MonoUVnELmlHGDHgGMFvWupomAGklsP6XdUC+XYiH
 EUSVY/DX1R/DBSL/xFqL0tYVgy+bOlX42eC3MUxavqs/SjZK7aCBZE3XO039HapjLjEW
 eYJBa+KqWnVNtQZfLdImpt69M/ftIqk7VvZJqR12TiCus1CU7RGbAMzFZCrRD6D+cL8F
 JAAvL1OGRo4ShCA2AG4baIAQ0N2IK8n2pEtEKHxwUpppKkMUfcgTN5wWfuULbvkARZT9
 48rw==
X-Gm-Message-State: AOAM533/KAFCXJSjlbvJ70puz07vXqgzhucansS/AFpYM4L+c0Jmrr1u
 x3+1kJ+/xdeXwlaXE2tfFTmyNQ==
X-Google-Smtp-Source: ABdhPJxbad87h2ANVj4O2/HmUKUzY2KXOOXrPuuCccdu3f5bfsIFgG4oSZxZAE+g25PaqosUYPYYEQ==
X-Received: by 2002:adf:f192:: with SMTP id h18mr29942150wro.270.1620122973577; 
 Tue, 04 May 2021 03:09:33 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k11sm2164615wrm.62.2021.05.04.03.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 03:09:30 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B245D1FFB5;
 Tue,  4 May 2021 11:02:26 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 29/30] cirrus.yml: Fix the MSYS2 task
Date: Tue,  4 May 2021 11:02:22 +0100
Message-Id: <20210504100223.25427-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210504100223.25427-1-alex.bennee@linaro.org>
References: <20210504100223.25427-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 f4bug@amsat.org, Ed Maste <emaste@freebsd.org>,
 Yonggang Luo <luoyonggang@gmail.com>, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The MSYS2 task in the Cirrus-CI is currently failing with error messages
like this:

 warning: database file for 'ucrt64' does not exist (use '-Sy' to download)
 :: Starting core system upgrade...
  there is nothing to do
 :: Starting full system upgrade...
 error: failed to prepare transaction (could not find database)

Seems like it can be fixed by switching to a newer release and by refreshing
the database one more time after changing the /etc/pacman.conf file.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210427185524.281883-1-thuth@redhat.com>
---
 .cirrus.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index f53c519447..f4bf49b704 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -67,7 +67,7 @@ windows_msys2_task:
     CIRRUS_SHELL: powershell
     MSYS: winsymlinks:nativestrict
     MSYSTEM: MINGW64
-    MSYS2_URL: https://github.com/msys2/msys2-installer/releases/download/2021-01-05/msys2-base-x86_64-20210105.sfx.exe
+    MSYS2_URL: https://github.com/msys2/msys2-installer/releases/download/2021-04-19/msys2-base-x86_64-20210419.sfx.exe
     MSYS2_FINGERPRINT: 0
     MSYS2_PACKAGES: "
       diffutils git grep make pkg-config sed
@@ -130,7 +130,7 @@ windows_msys2_task:
         taskkill /F /FI "MODULES eq msys-2.0.dll"
         tasklist
         C:\tools\msys64\usr\bin\bash.exe -lc "mv -f /etc/pacman.conf.pacnew /etc/pacman.conf || true"
-        C:\tools\msys64\usr\bin\bash.exe -lc "pacman --noconfirm -Suu --overwrite=*"
+        C:\tools\msys64\usr\bin\bash.exe -lc "pacman --noconfirm -Syuu --overwrite=*"
         Write-Output "Core install time taken: $((Get-Date).Subtract($start_time))"
         $start_time = Get-Date
 
-- 
2.20.1


