Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4204A3FF81D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 01:53:45 +0200 (CEST)
Received: from localhost ([::1]:53296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLwWe-0006VY-87
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 19:53:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwQy-0006Py-HC
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:47:52 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:34371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwQw-0002rr-Ol
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:47:52 -0400
Received: by mail-io1-xd33.google.com with SMTP id y18so4751212ioc.1
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 16:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=okxKdJbOUcfEuQyncikhmmKgqqr7aQZgUfGvRlvwHSo=;
 b=UZ6S+RbMrNqWRoRYrUWyxEqjbVSOOP/5xIS+dRipD1liz04qH8Nxkw9LN7kl8fEFfn
 eFTjFLvJFngPr/85PTmR4qzRaqZxSC00BVR9uUE9QKXCJsYMf3tY1RRJAtSaJaCWtMsx
 gFiWir/nZ1xUAjGQGMk9xrHlBjKk8xvbbEbtLtd83plfCAr6VQZu5X1T6sixmfOaNIMn
 mAhOrgdqOFgw4GZjGmAQSNG3ZVLOlxLvNVg4m8qMIOJ/918MyH1T38QOtA2SbLrAkJ8F
 zH+2bN1n/YEPdXfbs2hqv9HkudIcqqrywxLlWIrt5TU5ka9suQQozNFQ9zUSqrg6XLDn
 9Lrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=okxKdJbOUcfEuQyncikhmmKgqqr7aQZgUfGvRlvwHSo=;
 b=VfkkIrexw16ghDbi51InHE9lgwRgJx0ob0U4dnMq7tHeyn0U5yBcgXWe2ZOEYV2VIZ
 iCHxzsKVTXRr+NmXGEZ9/l3uvEb7dfo878u2VwfhaN1EvY9/5zKMMaOEZ2By8e894qnp
 XJ6d6fzO/ZmUr0heNt6UxEA2USZE3BS6LWmPHXsV3BpCS6FJzhpSSE//+ovDSkoekCas
 8Mn/7soZ57zB2m4u4P21eafigpPJeHD9f47jxTovhF3ZcLX90lFBko0EDN8kyAEzHZRg
 jZoXIj5c2T2QPUt83FjcCFC09wEw15/Ehvq3eJ8xbJmsgp39tTga+gk/Bu000dh9mOaH
 yqZg==
X-Gm-Message-State: AOAM532K8Jw3IVkXZqlgvOhN9U5nfJJLyqZsombb5+7jxiP7AFYL+DRI
 uOHo5VjeP540IW5fsurtf78OVdJxAH6oAQ==
X-Google-Smtp-Source: ABdhPJzrSKv1CueKm97uaDAeag2bY8K3w4E69bAIe0SrqkXycm578buTWUr5CU1OTWKWbqI3+prWkA==
X-Received: by 2002:a6b:f203:: with SMTP id q3mr757644ioh.32.1630626469559;
 Thu, 02 Sep 2021 16:47:49 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm1740502ilg.15.2021.09.02.16.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 16:47:49 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/43] bsd-user: style nits: bsdload.c whitespace to qemu
 standard
Date: Thu,  2 Sep 2021 17:46:51 -0600
Message-Id: <20210902234729.76141-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210902234729.76141-1-imp@bsdimp.com>
References: <20210902234729.76141-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d33;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd33.google.com
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


