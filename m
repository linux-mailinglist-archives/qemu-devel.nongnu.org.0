Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBB319A8E4
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Apr 2020 11:51:06 +0200 (CEST)
Received: from localhost ([::1]:57274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJa1Z-0000yz-HU
	for lists+qemu-devel@lfdr.de; Wed, 01 Apr 2020 05:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38417)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jJZyi-0004CN-44
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 05:48:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1jJZyh-0002AM-3i
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 05:48:08 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:34010)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1jJZyg-0002A2-UH
 for qemu-devel@nongnu.org; Wed, 01 Apr 2020 05:48:07 -0400
Received: by mail-wm1-x344.google.com with SMTP id c195so3074429wme.1
 for <qemu-devel@nongnu.org>; Wed, 01 Apr 2020 02:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9yYReGEoMkqsfZWblGMzvHlMGSzTNisl1Y211B1bnEY=;
 b=j6sWA4nNgPVM/bSVLmGG5O2gtvhTYDfqDA0C+LlOVSrqp8t0byDDQil33CI2GOmg3v
 gl06TrqhRxBn/nILqnTdipdP7NWc5BzoeItytGHxKtELRAjpJQNtZbtSxLIWSpekNDR/
 FUAz6QvFFfRCp8UnZ7UQoPcpaEHk6iUd0Em+9myNf1di+K+K9vvnUtulILGHsmxKFi4Y
 lpWRAoUBVVBoGrKJ65200K/F8jrxUIrycZ9w3XiZQgwkRt762UmKOFNpnU/IoYI5xVVk
 XqQvdDxn5YY0lWGsbOWdavw/xIAIn5EPv4W5Eqm9TCLXxB+Bjp87wTcHLXl2it+HxKDI
 pRcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9yYReGEoMkqsfZWblGMzvHlMGSzTNisl1Y211B1bnEY=;
 b=rP00t/HiNvOl00J3ZT90lO9bEk017LmezGww0lFzUWq+ZMOYIqq/g3DUPVHeedi9zy
 lrDWEMWhrHFI2trnUAhoti/koIoD3y66C9cP11JUyLj3anZC9HfH6b1kzIBeIkzziadE
 1SYcyxFLvLfzfmMkf2isd5OacNFPD4n88+ObHrRprPIxN2y5aCgA4hvUWfyBCMWj3TKI
 mNClm48toxfSJOjw/lNmznit4SZ1O08I0WQGLdeub2Ydd9mGTgW39MZZUJX59J3MVUAy
 1L99PlH9PGGD7NtonmFqs4Vr9I96OJ4edA4hN91EIZQyxw/XkXEw9/y1h9JP5niMczIX
 6IJQ==
X-Gm-Message-State: AGi0PuYtOq/FT0MfnUScwBS9ErvACbKQVxRchstDaKfL95vwSSXzlg5f
 gpr3BXMnDsTYV9QZGOm6wHE4gQ==
X-Google-Smtp-Source: APiQypLINN434d6iUSDES7A39dwlzFbgLy3RDmTDIyKH9QRLOsStR4rPZPAlk/dnqbdOzmjkgipUgQ==
X-Received: by 2002:a1c:b60b:: with SMTP id g11mr3572353wmf.175.1585734485869; 
 Wed, 01 Apr 2020 02:48:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w81sm1988288wmg.19.2020.04.01.02.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2020 02:48:03 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 251891FF8C;
 Wed,  1 Apr 2020 10:48:00 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 02/10] linux-user: protect fcntl64 with an #ifdef
Date: Wed,  1 Apr 2020 10:47:51 +0100
Message-Id: <20200401094759.5835-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200401094759.5835-1-alex.bennee@linaro.org>
References: <20200401094759.5835-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Riku Voipio <riku.voipio@iki.fi>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Checking TARGET_ABI_BITS is sketchy - we should check for the presence
of the define to be sure. Also clean up the white space while we are
there.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 5af55fca781..b679bc6b136 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -11331,11 +11331,11 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
            This is a hint, so ignoring and returning success is ok.  */
         return 0;
 #endif
-#if TARGET_ABI_BITS == 32
+#ifdef TARGET_NR_fcntl64
     case TARGET_NR_fcntl64:
     {
-	int cmd;
-	struct flock64 fl;
+        int cmd;
+        struct flock64 fl;
         from_flock64_fn *copyfrom = copy_from_user_flock64;
         to_flock64_fn *copyto = copy_to_user_flock64;
 
@@ -11346,7 +11346,7 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         }
 #endif
 
-	cmd = target_to_host_fcntl_cmd(arg2);
+        cmd = target_to_host_fcntl_cmd(arg2);
         if (cmd == -TARGET_EINVAL) {
             return cmd;
         }
-- 
2.20.1


