Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7136F28879B
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 13:11:17 +0200 (CEST)
Received: from localhost ([::1]:36044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQqIu-0005KL-DH
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 07:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kQqGG-0003Ms-7C; Fri, 09 Oct 2020 07:08:32 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:42843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kQqGE-00080Z-Fs; Fri, 09 Oct 2020 07:08:31 -0400
Received: by mail-pl1-x644.google.com with SMTP id c6so4292542plr.9;
 Fri, 09 Oct 2020 04:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CfxDjHtrn5O00fJ1IvioOLeTqC6Mh44tAZ370lRy+RA=;
 b=APODdLwYeXpWO6/mLSMN4U67JNuac/M6VrhzLsGnFCq+VJSX34y50/CAQry1/O6csr
 mczFT8HW4NncTqEQnIg8Y7BEnh4GJ9f3sAtprqR9czClHlYtdT/9KCER4cG4gcF/nhdf
 gpkFX95rU+fkGizAJRe7jVw49SDktPGgrNA4UEXIYjoDZfo3GIYWSG/cjO2TndxULR+x
 uVDa0cLd4nf+INxQCJ70t9OBs0eD8XGlKRo9jq0LMA0X53QrE7T20L6FOHvH3HX+4KR/
 +0rHJ6tccRIUA8q23/dfIA5nhhBfJloOYO/mpZY7uSyeqONgXTSLhRM5Y9S4xDkxbDuc
 umug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CfxDjHtrn5O00fJ1IvioOLeTqC6Mh44tAZ370lRy+RA=;
 b=eHfScAn80sw18RGUR3gxvnkcTHjF0PInnGRmcWCIizUDi7gBwnHoonXduH5V3XAArw
 JbMMSjQiA7tIxKW53ss3IqbKElqjysG97uyA0VrWYg5bwm3pWrnq9f0wwMMZW7CGnf1h
 hUdxYdh46jDtBvnuq/+A1l6nd0bdT4hz7VbGo6VFRad0Hk9PaLxEdF62ZFm5kAgLfiA9
 07fgDYwT7BHRDoMlj5eBtdUHA8nCOrNx2oXOhkHUBU7Wfmj2hEyrCRDlUbFNyuCRyhbW
 X41Qq/iUXoivgax/80R0GiNcS8t3cmlAsHOfpO6UL+uLF1WAYiwivu2+8Ydzq9ZCC0eY
 VaRw==
X-Gm-Message-State: AOAM531/tEOyJhDVsKaE8JAkHqQOec3YBd31mmmsWxciZ1F1n83y89Q5
 tXYNY3/iEh8OZk0Q1lwXwux4NptYsbek4kkQ
X-Google-Smtp-Source: ABdhPJx73ya+67xcv4su9VZrQWy5DshPB855YDCMXA1Z9tgcWCHYE3nZzG9RAsuIA9eveYQPwFb3lQ==
X-Received: by 2002:a17:902:7589:b029:d2:686a:4ede with SMTP id
 j9-20020a1709027589b02900d2686a4edemr11889012pll.45.1602241708288; 
 Fri, 09 Oct 2020 04:08:28 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id v1sm2619462pjt.2.2020.10.09.04.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 04:08:27 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 4/4] cirrus: Enable doc build on msys2/mingw
Date: Fri,  9 Oct 2020 19:08:00 +0800
Message-Id: <20201009110800.432-5-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20201009110800.432-1-luoyonggang@gmail.com>
References: <20201009110800.432-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=luoyonggang@gmail.com; helo=mail-pl1-x644.google.com
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

Currently rST depends on old version sphinx-2.x.
Install it by downloading it.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 .cirrus.yml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/.cirrus.yml b/.cirrus.yml
index d1fe63b343..599fd299e3 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -110,6 +110,11 @@ windows_msys2_task:
           mingw-w64-x86_64-curl \
           mingw-w64-x86_64-gnutls \
           "
+        bitsadmin /transfer msys_download /dynamic /download /priority FOREGROUND `
+          https://repo.msys2.org/mingw/x86_64/mingw-w64-x86_64-python-sphinx-2.3.1-1-any.pkg.tar.xz `
+          C:\tools\mingw-w64-x86_64-python-sphinx-2.3.1-1-any.pkg.tar.xz
+        C:\tools\msys64\usr\bin\bash.exe -lc "pacman --noconfirm -U /c/tools/mingw-w64-x86_64-python-sphinx-2.3.1-1-any.pkg.tar.xz"
+        del C:\tools\mingw-w64-x86_64-python-sphinx-2.3.1-1-any.pkg.tar.xz
         C:\tools\msys64\usr\bin\bash.exe -lc "rm -rf /var/cache/pacman/pkg/*"
         cd C:\tools\msys64
         echo "Start archive"
-- 
2.28.0.windows.1


