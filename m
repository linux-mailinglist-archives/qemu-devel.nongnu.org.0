Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 545E7268204
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 02:06:45 +0200 (CEST)
Received: from localhost ([::1]:43328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHc16-0000IE-Df
	for lists+qemu-devel@lfdr.de; Sun, 13 Sep 2020 20:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kHbwX-0002Ux-4D
 for qemu-devel@nongnu.org; Sun, 13 Sep 2020 20:02:01 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:36974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kHbwV-0004Bc-GX
 for qemu-devel@nongnu.org; Sun, 13 Sep 2020 20:02:00 -0400
Received: by mail-pf1-x442.google.com with SMTP id w7so11057360pfi.4
 for <qemu-devel@nongnu.org>; Sun, 13 Sep 2020 17:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UsRV3idEmZ+/7qjR3Tg+F66rL9CHGtYoIl+nOlZddzg=;
 b=S1ejjA33gC3ItQhoOI6s3TmYQmyP0giAf0zZldU7vpqPM9Ni9tX6pfMz+OUy1BKFtV
 lsJnIP605SDMPPjuBznP2iI1i7WT46tnJ2YCEF+1kO4U4y9DplvfkZZktR5gDjgIidN7
 E15L8E++ooaubWkE09UaZMKlkD9pMFQGKaR4ztb04l1j5YIL9zcGU4A59LIusOOOWEpF
 QnnqqLAznEZ5jWYqjnq+eiMbIjTYTppVnqOI0de02sfmulWjtEET89nJYuASMcynQjv5
 ONYxfge13Q05qgvFqvrnHpKjiXHg317Ko6JjXgnN+wtpUXDkoAS3+DnAlb7frw+AAyQV
 sGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UsRV3idEmZ+/7qjR3Tg+F66rL9CHGtYoIl+nOlZddzg=;
 b=C32cx7L1ToP0bLwX5gZtnF7ppjPclWWADnYGg+0BjrEdonM/kmpxNzGMtFZ8CpnPgm
 y+FTalKAzefUWBd/rGYRTPuRdD8l+8XXblmMw2cFJjgbz+5mKES9A83DQqTInqqivUTH
 bRk5DiyDUGCCH9mp47hbsWYhzSXFPxOmegblTd+8Mos0ufei94sXsJVGeQn2cpiBChPP
 u7C7cTXUmNCgFRbNY6GJNflpZGWdTc2MaKddTyZTiFD31KUeSGD3cpYK/DpNKR4BaNxN
 hUkSRCz6LgEAEsL1iXXYfsHsD0iQkwRnOgC0VcwCKHE+6UGa3xFHiYjzHeHyyxtrOerH
 tNyA==
X-Gm-Message-State: AOAM531xwGv3sZEiOjLZ86zYuycn6K43hbn5f2gCy5abSV7uV3drCd5Z
 dbnOlznhe1KPj05EFMW1m8Pjl8Mx/kAc/Q==
X-Google-Smtp-Source: ABdhPJyZ6mtjEgnGri46aRmccinbdJrIjU28EK7rvV++7PNcKEnbODN/0NxwM34K6v9wxxycNjNSFA==
X-Received: by 2002:a63:4cc:: with SMTP id 195mr8937776pge.376.1600041717778; 
 Sun, 13 Sep 2020 17:01:57 -0700 (PDT)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 31sm6538252pgs.59.2020.09.13.17.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Sep 2020 17:01:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/11] capstone: Update to upstream "next" branch
Date: Sun, 13 Sep 2020 17:01:44 -0700
Message-Id: <20200914000153.1725632-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200914000153.1725632-1-richard.henderson@linaro.org>
References: <20200914000153.1725632-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: luoyonggang@gmail.com, alex.bennee@linaro.org, thuth@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This branch contains a number of improvements over master,
including making all of the disassembler data constant.

We are skipping past the 4.0 branchpoint, which changed
the location of the includes within the source directory.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 capstone    | 2 +-
 meson.build | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/capstone b/capstone
index 22ead3e0bf..f8b1b83301 160000
--- a/capstone
+++ b/capstone
@@ -1 +1 @@
-Subproject commit 22ead3e0bfdb87516656453336160e0a37b066bf
+Subproject commit f8b1b833015a4ae47110ed068e0deb7106ced66d
diff --git a/meson.build b/meson.build
index 4417de1e14..00e2b8cc29 100644
--- a/meson.build
+++ b/meson.build
@@ -668,6 +668,7 @@ else
       'capstone/arch/X86/X86DisassemblerDecoder.c',
       'capstone/arch/X86/X86ATTInstPrinter.c',
       'capstone/arch/X86/X86IntelInstPrinter.c',
+      'capstone/arch/X86/X86InstPrinterCommon.c',
       'capstone/arch/X86/X86Mapping.c',
       'capstone/arch/X86/X86Module.c'
     )
@@ -692,7 +693,7 @@ else
                                c_args: capstone_cargs,
                                include_directories: 'capstone/include')
   capstone = declare_dependency(link_with: libcapstone,
-                                include_directories: 'capstone/include')
+                                include_directories: 'capstone/include/capstone')
 endif
 
 # Generators
-- 
2.25.1


