Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E5F346682
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:37:49 +0100 (CET)
Received: from localhost ([::1]:45496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOkyT-0002Ra-0O
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkHN-0006s3-5D
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:53:17 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:35561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkHL-0002od-AF
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:53:16 -0400
Received: by mail-ej1-x633.google.com with SMTP id jy13so28214927ejc.2
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 09:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=adoaEeyH702QtvflbrtFYg4Hiq6sgiikmEwdr9S2R+w=;
 b=E7wOd8lzFx0xMtDK+PuNP8FTlMU8GwMHVkOY+OX2Mqvbg72wogmApFrA/WNk30S5Fo
 fNQmq7tODBAUkOV2sM5wqba+7zvbF9/Mx58QQ8kbPNoOYBPL9BR2WHB6e/UQ+f5ZfnX3
 i7nrZ3De19ElS3ma3zOZLKy/Yh47tMa+AjJrdylxL3TAbAkGu2a9VpqoZIttJHBFq38y
 4E2qNhm98GD9/aik2ffNPSCVL3+4+HGwIXbgO79+uev1zKbLT3KFDWYBraha5Nr8lgQo
 IrDaQUU4Hp3MguTr91Lo57q2zPv6KHxWJxYb0rbQIxszUr0b2uotknqkta7bkseOWBAa
 io8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=adoaEeyH702QtvflbrtFYg4Hiq6sgiikmEwdr9S2R+w=;
 b=AaYH6FIqj7KT7zJExd9TNXS4g6pFtAbkhKWX3cuKRdhooIoN8Ci68pk1Uv1vugHEIN
 IErp6PuKLwlJiUYHRc1A98e1zUDz+IdqdocE2zslqUMSZ9q197yY4B1mqwyFvK5I1iF4
 jSS9tyulhS/IZ4Hf6QrkY0zb/xBGM8pPNKIP0Tws626tsbEJdPHueE2UKIIDrsO75aJ3
 N8e5ffujF3bsZuoF7KFggvAohgQCBun8wj/qI9GPQ37KyIwgQSMtFOx4i9MOUOFf+Fa9
 6aG65rHLanW6o9epTyIegjKchr17rODwak+7EX3F5pIdFfTec7eN4xdXdMHsU5Y+PkDG
 YF6g==
X-Gm-Message-State: AOAM53374UOrlRQ/OraJ8KCnhXCQCqWGm8mgxcrj4ovZP9mzuv5OT68h
 fYpKzVnMfULStLAwKAnPLVzvTQ==
X-Google-Smtp-Source: ABdhPJzvbo4S0L4XYx8ciG2SEHqYDRjrIeEhg1NrhQtNEte6jmKouQS1HPiIGfUVfYQ912Ew8WNBDw==
X-Received: by 2002:a17:906:379b:: with SMTP id
 n27mr6022199ejc.182.1616518393581; 
 Tue, 23 Mar 2021 09:53:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m7sm12858471edp.81.2021.03.23.09.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 09:53:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 432011FF90;
 Tue, 23 Mar 2021 16:53:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 04/22] tools/virtiofsd: include --socket-group in help
Date: Tue, 23 Mar 2021 16:52:50 +0000
Message-Id: <20210323165308.15244-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210323165308.15244-1-alex.bennee@linaro.org>
References: <20210323165308.15244-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I confused myself wandering if this had been merged by looking at the
help output. It seems fuse_opt doesn't automagically add to help
output so lets do it now.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Updates: f6698f2b03 ("tools/virtiofsd: add support for --socket-group")
Message-Id: <20210318100911.16261-1-alex.bennee@linaro.org>
Message-Id: <20210320133706.21475-5-alex.bennee@linaro.org>
---
 tools/virtiofsd/fuse_lowlevel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowlevel.c
index 1aa26c6333..58e32fc963 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -2450,6 +2450,7 @@ void fuse_lowlevel_help(void)
     printf(
         "    -o allow_root              allow access by root\n"
         "    --socket-path=PATH         path for the vhost-user socket\n"
+        "    --socket-group=GRNAME      name of group for the vhost-user socket\n"
         "    --fd=FDNUM                 fd number of vhost-user socket\n"
         "    --thread-pool-size=NUM     thread pool size limit (default %d)\n",
         THREAD_POOL_SIZE);
-- 
2.20.1


