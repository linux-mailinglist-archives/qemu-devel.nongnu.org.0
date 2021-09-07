Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F89403095
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 23:58:54 +0200 (CEST)
Received: from localhost ([::1]:39040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNj7F-0005ls-TV
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 17:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2H-0005WU-Aj
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:53:45 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:37514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2F-0000iM-NC
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:53:45 -0400
Received: by mail-io1-xd31.google.com with SMTP id b7so472026iob.4
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 14:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=okxKdJbOUcfEuQyncikhmmKgqqr7aQZgUfGvRlvwHSo=;
 b=fvbmt0/KgZdk5BI8LuSE+LA35revyjxtISv/IBgFwURxWkdOMpZUwtY8yUcY5+drC5
 LL9jv+wlrSiVEggNF3lOOvuu0I1WAkB58ijgj/9COjGQtFD7fSaQolSbFNO3e7r4SOvb
 S0wbeH33DheNCMWAlQcple2BUfauqaKe+PqOFLxNeiDoJ7Z6jI1OEL+0r5rVG3fY+hN5
 OeUv1y6UvxlnXmOzetbXsi9eJF+5qmcFNwzyMPhBjgUTmCjNNjWeInCpav9x8d2vqx97
 eUv18JbyW6P/xE4Gclre0dYIH6uT6BDu1eTJRGFfMGtdk7VgwGEaU/todKHtllBQ6xd9
 lWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=okxKdJbOUcfEuQyncikhmmKgqqr7aQZgUfGvRlvwHSo=;
 b=HhhqEVIX06cEiTg2CjG+V9aBPPXnnD0sNNP53b6JmMqQc8tvsKlyPbNZ0DYaJsOIDg
 GUxhwuQFSLnaDWcm9Z6rPH6fE87ImCpxZVHWS3UTuIOoJIl+qvso2DZdJvyiPtJRcZ5+
 zdU0bU4iGgiqR4sM4/NxGCEG1vCJfzqDvspkaiyPG538EZQbwl/zned5Y6V+9DjPMBGA
 a0ZQqDux1U+AOtXQ9GXtVydL0VINqJ+uNYMRrWotZFiSrZu6UZIq3pzvqjkiysvPe66/
 SQGU9JNr1V3X4TVhLeBUykIf+8TXuIQMyJ7wsMkna1XbP+gGlKa7jTLi4Dgo4rg7F7/Q
 L+aw==
X-Gm-Message-State: AOAM530EcFlZO15aRDZRVhhLiGR7SE41GCU0xF4iVlobeiysyxgbnOvt
 KngkFZH8FruKBoYf3RtyqTyFpczUbr0NUvkT5Aw=
X-Google-Smtp-Source: ABdhPJzdSMIaQlYOHGhWbO0799BbqZ6hbYDZRrgWs0XP1xaUEm0fN7i3qwABESI2/tpr2jVHaoNvsA==
X-Received: by 2002:a02:6a55:: with SMTP id m21mr467307jaf.74.1631051622494;
 Tue, 07 Sep 2021 14:53:42 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id t17sm192477iln.24.2021.09.07.14.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 14:53:41 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 05/42] bsd-user: style nits: bsdload.c whitespace to qemu
 standard
Date: Tue,  7 Sep 2021 15:52:55 -0600
Message-Id: <20210907215332.30737-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210907215332.30737-1-imp@bsdimp.com>
References: <20210907215332.30737-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@bsdimp.com>

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/bsdload.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bsd-user/bsdload.c b/bsd-user/bsdload.c
index 0ade58b9e2..ec71c5e923 100644
--- a/bsd-user/bsdload.c
+++ b/bsd-user/bsdload.c
@@ -140,7 +140,7 @@ abi_ulong loader_build_argptr(int envc, int argc, abi_ulong sp,
 }
 
 int loader_exec(const char *filename, char **argv, char **envp,
-             struct target_pt_regs *regs, struct image_info *infop)
+                struct target_pt_regs *regs, struct image_info *infop)
 {
     struct bsd_binprm bprm;
     int retval;
@@ -148,7 +148,7 @@ int loader_exec(const char *filename, char **argv, char **envp,
 
     bprm.p = TARGET_PAGE_SIZE * MAX_ARG_PAGES - sizeof(unsigned int);
     for (i = 0 ; i < MAX_ARG_PAGES ; i++) {     /* clear page-table */
-            bprm.page[i] = NULL;
+        bprm.page[i] = NULL;
     }
     retval = open(filename, O_RDONLY);
     if (retval < 0) {
-- 
2.32.0


