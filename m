Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA993342D1D
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 14:39:58 +0100 (CET)
Received: from localhost ([::1]:49270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNbpd-0004lb-OT
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 09:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lNbn5-00032j-Hu
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 09:37:19 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:38476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lNbn2-0004Ew-92
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 09:37:19 -0400
Received: by mail-ej1-x636.google.com with SMTP id r12so14060965ejr.5
 for <qemu-devel@nongnu.org>; Sat, 20 Mar 2021 06:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZwBf9UIhW9LVVf2kZJVAVnDApoNAfLOpIH7Z6bvZYNw=;
 b=p4TgbYR9DA+frXqzZiviPpxgOxbbTsswR/yerONWvcspDzOIrslPW5NmsvVQEJPKOX
 yW01BNYnKbn0pFfRlyfdmm4k/J+t5XeaByqI4Sy3zQcFLlor9+92Ee5ZAxPjiQiEbk8V
 8m6pjcOZFzzunwFPQytBwF2PkhOojHn4oWAMiq7vgeShgyfoCUuZwyJEtzlkwkABbw8L
 TXMb/rI42IAf6Z7z0UQ6WJfeqAtUo7XuvmeWoFCO4byKWkrqeEb/XP8dID8Q93J/11O/
 ILd9avknqYiZZ1SR+h6JE1ZyDOs+/nXOWTN6aV922FVZyfFQDb7AtZuLxqAD8OVD89eO
 T1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZwBf9UIhW9LVVf2kZJVAVnDApoNAfLOpIH7Z6bvZYNw=;
 b=mk6GzFH/BSvd8QHWpuW15xQx7HEY5eI0x8M0L4PoBWi50kqFgasB8QLQLVD5J5LkWh
 NBR8k5aUH+u5yuc69IOHSN6S3mXlD9QD0Guve9codEqIkZ/dNT1z8Ph0GKz739HyReOz
 ENTmz77kWNwounuJ2JLGecbmYwJcvAFbu49NRp+Z8NFUuSAjCn9kLGYXX55ij0Jq26wm
 H8cvwiwvBzQMd4PkU/1Axu8jknnW1n1E1WRrNdwU/fAQe5qcG8FwjCo37iMNjysf445f
 9UKGeAoQtnRw93kJscIv3YNVRXg/1/FfGg5X8YNa0ZfteBRbyO3BHkjMw5K7Bz1VkONg
 qeWw==
X-Gm-Message-State: AOAM5311xm/nu2QA6SHAoX3F3J8ZInvEmU20w3kbqSXEQNeAgTda66/G
 7r7u+u52flT/Qtu7++HS+Kjf+w==
X-Google-Smtp-Source: ABdhPJzRd0Y4UV/IuARYSS2gHFkNAiUKGKomDWJj1nubnFYQzPIRU4wR/SCgbGilgvS2Vm68rWvkiA==
X-Received: by 2002:a17:907:3da3:: with SMTP id
 he35mr9668684ejc.148.1616247433691; 
 Sat, 20 Mar 2021 06:37:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c20sm5375265eja.22.2021.03.20.06.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Mar 2021 06:37:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 162801FF90;
 Sat, 20 Mar 2021 13:37:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 04/14] tools/virtiofsd: include --socket-group in help
Date: Sat, 20 Mar 2021 13:36:56 +0000
Message-Id: <20210320133706.21475-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210320133706.21475-1-alex.bennee@linaro.org>
References: <20210320133706.21475-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x636.google.com
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
Updates: f6698f2b03 ("tools/virtiofsd: add support for --socket-group")
Message-Id: <20210318100911.16261-1-alex.bennee@linaro.org>
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


