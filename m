Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7DD36A1F5
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 18:11:50 +0200 (CEST)
Received: from localhost ([::1]:36614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laKsn-00013S-Jk
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 12:11:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKiC-0005al-Cu
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:00:55 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:42993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1laKi0-0004Ei-Eu
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 12:00:52 -0400
Received: by mail-io1-xd35.google.com with SMTP id s16so46514569iog.9
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 09:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jwn0jq9vw81KUNjF09Db7kJARnyiJOCQ0KsTJG3SzFQ=;
 b=xVAT+wEskcNxqdAE//G8XpJkpLy0FmYZoXS9GHj9cl/h50RIyrwyW31PcXomi4WL0q
 fP3H3WAnty2lVpPIHiRlrUr/7D1k9mLtKBUxDgaayDqIq7mHHoLx+J169rP7BD7Dhh2V
 gy8ppSHsLFheBfKOwICMoko/NGFyDe6hGz8zAT99pfPt69JHBCQe+u3zN1KFEzmT/ICi
 8d1kdHAlc/Nk639Yc5naw1yYLX6Em1u8ResQYXAjLftgZqha/gWM5eDqqEDqBU8Axqry
 l+IMdTo0VWp3HbMiV8qkCeQ3e/JLYctxS/cQVEKmcrA3ZDXHXUPr5g3xyYyY/hO81RMS
 K3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jwn0jq9vw81KUNjF09Db7kJARnyiJOCQ0KsTJG3SzFQ=;
 b=LuXYLd53dPhc4Ism9Wn1qEaNncvTvhaD7jv46FgacLMWNjSnhg03qyyWvZnF8pUUw/
 ny+KgFGmk06SaHAGps0cDhNqTqjKFp/yFopU0CHZZu6olZXd3SYvIK1q5Giv8zvYiXar
 dunIFrbjv9D5g8+X1hmxjqu57oydMYhP1NhPE3o8efe8eFBnQgoNrnN924hOWH2wfbL2
 AV3XUUfTFG+89DOI0VFNSvvEAPutGXfBum2mToREswk91/tGtD3TFSox3GgMjOKNmI4B
 AAeOqDzgA2iaJImtOdegjDV4AAstSUr4YxUTPaAyg/pxUGWNo5OCzFui62eh+y8CthKV
 gL4A==
X-Gm-Message-State: AOAM532OYVp6qvsQsrdC0cPWeAWvI6d7iutUSDXkwwSlm9ObUZf87PB6
 7p2OPy2Mdi1CVuTalo49fre7erCxBAV+7RsN
X-Google-Smtp-Source: ABdhPJzWX60rXZP8DF4juUK28lQYeqv+TEUshHj7WALRTCfaHGaiQ8YL6LUUCH4GXdyrLbCi/FnVsg==
X-Received: by 2002:a6b:9186:: with SMTP id t128mr7211987iod.43.1619280039167; 
 Sat, 24 Apr 2021 09:00:39 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h4sm4055901ili.52.2021.04.24.09.00.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Apr 2021 09:00:38 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/48] bsd-user: style tweak: return is not a function,
 eliminate ()
Date: Sat, 24 Apr 2021 09:59:43 -0600
Message-Id: <20210424160016.15200-16-imp@bsdimp.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210424160016.15200-1-imp@bsdimp.com>
References: <20210424160016.15200-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, arichardson@freebsd.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/bsdload.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/bsd-user/bsdload.c b/bsd-user/bsdload.c
index 546946b91d..fd14ffa4cd 100644
--- a/bsd-user/bsdload.c
+++ b/bsd-user/bsdload.c
@@ -28,7 +28,7 @@ static int count(char **vec)
         vec++;
     }
 
-    return(i);
+    return i;
 }
 
 static int prepare_binprm(struct linux_binprm *bprm)
@@ -38,15 +38,15 @@ static int prepare_binprm(struct linux_binprm *bprm)
     int retval;
 
     if (fstat(bprm->fd, &st) < 0) {
-        return(-errno);
+        return -errno;
     }
 
     mode = st.st_mode;
     if (!S_ISREG(mode)) {        /* Must be regular file */
-        return(-EACCES);
+        return -EACCES;
     }
     if (!(mode & 0111)) {        /* Must have at least one execute bit set */
-        return(-EACCES);
+        return -EACCES;
     }
 
     bprm->e_uid = geteuid();
@@ -75,10 +75,9 @@ static int prepare_binprm(struct linux_binprm *bprm)
     if (retval < 0) {
         perror("prepare_binprm");
         exit(-1);
-        /* return(-errno); */
     }
     else {
-        return(retval);
+        return retval;
     }
 }
 
@@ -169,5 +168,5 @@ int loader_exec(const char *filename, char **argv, char **envp,
     for (i = 0 ; i < MAX_ARG_PAGES ; i++) {
         g_free(bprm.page[i]);
     }
-    return(retval);
+    return retval;
 }
-- 
2.22.1


