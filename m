Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A11CA3D3E5D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 19:18:59 +0200 (CEST)
Received: from localhost ([::1]:56596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6yp8-00009P-NI
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 13:18:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6yg5-0005W7-Lw
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:09:37 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:36603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6yg4-0008CW-4u
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:09:37 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 l11-20020a7bc34b0000b029021f84fcaf75so3931287wmj.1
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 10:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IIFkc3IDhl2xdt4qYGTuRykEBsdkIzrzr3YT1MsJ7FM=;
 b=xODsi07utCA3nU9rc11KjW4A9r4QUjmG251IEThlQugBQmMl/iycCULVyOJgRCEj9F
 NBBZSLgoFr91LH11z3f4YiqbMxQkkiW5rV97wDZyHwJ3WJ73qc0zfD9CkqF13QNu7hrj
 MjC9nvcMBwzlaLMghAz5ZT9eEReYAJ6kq5xSqXyOOMrN0rHtPlcCoYqX+mIH4RXUgIOa
 JXnnkPQOTKZR6YSS1D6cMWzlNIE/VQ/d7yMM9pr4Hv9M8WQXLS99JKuDGtPQaY1GSCIn
 p1XL5l23/r/MacoNkpvOQtPHjhLOtrZwHR/8iygsFwwI9L4v6OzvsiSc0rJrUdx1f6DG
 8eSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IIFkc3IDhl2xdt4qYGTuRykEBsdkIzrzr3YT1MsJ7FM=;
 b=jY4AQpP3A0LSfRb02YAV3S39ji869B7JARBlId08xgAc2vuTaqrmxdgNqMcP/p4N8B
 1H3WrO/lOtdwd5ZSJskaFTKBjZExxUXM2QLb7YnteYGnio1nHU+bv1HqCMGOPaTHwS7W
 cfb+HyFpTap1APm6oTZp8S/pYRHPZEY0VQEITDoNg9WqHOcUPaztEzbrc4rl+4gEEC3D
 lqyykvEurIWYMsXCGAaLzFXOuEpw7K4qXx1XdSXHJqlwrJhPY3+viCxaeTBmtkVj8C6a
 tO4RTzr5I8yb3RJkuHSbYzetJucGo1fef0q/wFOK5+ltBLyJHE8mCoEWXrk66CaLF2pm
 v8eQ==
X-Gm-Message-State: AOAM531yWUq8RP0naZAYfQEfMbB5WU0LlHDR8wdweIUTuBUEogcVfOOa
 L8t54NlkZaHxELVKo54g+QCAqQ==
X-Google-Smtp-Source: ABdhPJyy4Y4CKTc9v7VCFGwdkGsLDwIYYfj0JZ3+LjZSORGooSUBV0vqbVyj2d8c6NQ3i15DHK+ILQ==
X-Received: by 2002:a7b:c4d9:: with SMTP id g25mr14596698wmk.108.1627060174817; 
 Fri, 23 Jul 2021 10:09:34 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u12sm34277432wrt.50.2021.07.23.10.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 10:09:30 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3F4F71FFAC;
 Fri, 23 Jul 2021 18:03:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 22/28] plugins/cache: limited the scope of a mutex lock
Date: Fri, 23 Jul 2021 18:03:48 +0100
Message-Id: <20210723170354.18975-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723170354.18975-1-alex.bennee@linaro.org>
References: <20210723170354.18975-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

It's not necessary to lock the address translation portion of the
vcpu_mem_access callback.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210714172151.8494-3-ma.mandourr@gmail.com>
Message-Id: <20210720232703.10650-23-alex.bennee@linaro.org>

diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index 4a71602639..695fb969dc 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -355,15 +355,14 @@ static void vcpu_mem_access(unsigned int vcpu_index, qemu_plugin_meminfo_t info,
     struct qemu_plugin_hwaddr *hwaddr;
     InsnData *insn;
 
-    g_mutex_lock(&mtx);
     hwaddr = qemu_plugin_get_hwaddr(info, vaddr);
     if (hwaddr && qemu_plugin_hwaddr_is_io(hwaddr)) {
-        g_mutex_unlock(&mtx);
         return;
     }
 
     effective_addr = hwaddr ? qemu_plugin_hwaddr_phys_addr(hwaddr) : vaddr;
 
+    g_mutex_lock(&mtx);
     if (!access_cache(dcache, effective_addr)) {
         insn = (InsnData *) userdata;
         insn->dmisses++;
-- 
2.20.1


