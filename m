Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF70237BB02
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 12:42:37 +0200 (CEST)
Received: from localhost ([::1]:37600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgmK4-00084l-Hn
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 06:42:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgm8Z-0000hx-VV
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:30:43 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:41523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgm8S-0000au-Fn
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:30:43 -0400
Received: by mail-wr1-x432.google.com with SMTP id d11so23064431wrw.8
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 03:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iUZ/64GAc8Lit9olujLXGNkyl4h3hJob2ZVlurCRzXw=;
 b=wRLVGwY1Ur0E3lAJkd0WAzX2904fxUXJcANhjcrL0pVX3YprKtS7SS81YvmNTFVo7v
 b3r/JAxR6Tsq6bY7WNNMyks5zA7GlCvChjRHd3y2TWKcItaJ75X6WxDQMHxT7NncNCiS
 ozqpF5mOMJwSa+krDLtK4aTaD2oWpZryPu2w6TaI5tclV4pZ6wTPwmSKOeJuixVkAYUn
 rUlKx1fA9MRfk/MhNTpvknAoSjyn4lpgP3phMwUisItHLT2rIW/3FvVbBCMCzHNFY90w
 WgGdoBfCTwUpMOg9ZxK9oDNrZ0Quo3dPUgQfc5zK1LfEFMtZOxsPqdQWqRbMApleQpAK
 U+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iUZ/64GAc8Lit9olujLXGNkyl4h3hJob2ZVlurCRzXw=;
 b=tUc6AgAT7zOmvh4NiXqcBmSZwIvcuK6vtELPStYyF6z+e7ciJMKbrcqfW+S8zD8En1
 SNbVGx7dFYbTwtgaxmWskzjvmAYag0qgQATr3JJjMo/DQnB41lgMkNz4DXv+vvpv06s2
 iygxeb8m+lzuv1X+SO3ogLfsNTaug7ltcoog/x52Hz9u1Bx5PzJlWoKoMUtkL+Z14hzj
 j0Py8x5VpYIjYlkRuw88PcsLijKXvrOSQhKz987XuOQIdDvxCNr0ELTEgs0kDI6oVOPP
 ACoa9w37VKWSlHAFw2ni5jj+iTcFavm6tC8K5f3vwX2Wk7Unp/OArxArImtoStBQHtW/
 ih9g==
X-Gm-Message-State: AOAM532hDNZeNrFxkzdO6h/BHKrU+4lLoH9Jn+T+T10iyvdguc1M/yV7
 FNBqrW0VaVrHlFNcycwLcTtAVw==
X-Google-Smtp-Source: ABdhPJwud0XXgACPZ7G6ESXOiYbmDOZ359RpkRQSI3xzFkit4of2+9JZc1+vNuRxMuVQBBqzSEwl1A==
X-Received: by 2002:a5d:4351:: with SMTP id u17mr43671640wrr.47.1620815435038; 
 Wed, 12 May 2021 03:30:35 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n3sm25893479wmi.7.2021.05.12.03.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 03:30:29 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 08E571FFB4;
 Wed, 12 May 2021 11:20:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 28/31] cirrus.yml: Fix the MSYS2 task
Date: Wed, 12 May 2021 11:20:48 +0100
Message-Id: <20210512102051.12134-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210512102051.12134-1-alex.bennee@linaro.org>
References: <20210512102051.12134-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Reviewed-by: Yonggang Luo <luoyonggang@gmail.com>
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


