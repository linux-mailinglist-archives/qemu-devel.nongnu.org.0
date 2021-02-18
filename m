Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEA231E82B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 10:58:18 +0100 (CET)
Received: from localhost ([::1]:60472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCg4f-0002gy-B0
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 04:58:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfu8-0006lt-7q
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:47:24 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:46099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfu6-0007En-Kl
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:47:23 -0500
Received: by mail-wr1-x429.google.com with SMTP id t15so2121841wrx.13
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 01:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AkfrVrYw2C9vmidmEBhY6XyexZR6Isj5PdFC64t5PyU=;
 b=eJEro47341UJl1NuK5X+r6MmO6teKHOYJQp+3UxrgOxMwvB3zrhn7ULyDFC7j5HAdT
 ie3IDuayxIH/H3rvfWrhdkUA5SJ2kexfPw0k8JDcx27+l0ef5MjWJG4gAVrR07I7YkOB
 R7V8CAWK2FL/7FwgAbfzMwH1Vg9qfHPGydCZ1LaRCDH0SZyTJ6NuXn/PJweU4SYtxUgP
 afh7CVh9qGR4I7+oJXA8JefAPB7ASCrcQ81Me2TCLyFRJahWqxr9qw41cpAdnEL54eLJ
 xnYxT/c3vQ8X598MZBJITAwCpqTvu1H6DXLVg9nI0f2NfPZpEjbPqqiV6VVe1PTE028v
 J3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AkfrVrYw2C9vmidmEBhY6XyexZR6Isj5PdFC64t5PyU=;
 b=LWxkDfztJKtrvSoaPhU7bJgHfZlQdqzoDf+wZB1fKTCZmWsnWj27jOWKJc0OiDwiTr
 WFFT0yMvpETqaxpvsa05BLEB0Wv5kg0uNMj9PTzUlsXWspUv3B8YUVaS2FIjvIaCE/OM
 4B2aCSMjogjI7PMsqnTONrKf4YUJeo9wnmRMPSgZQv1nciEAr4Y/8b24K32BocS5+s+X
 woF9CDcOUWv7CcV4xmlXAYddpDqmOTmcGVgz5piq6BTb0sZpUD/nbdqOGl6A8Yq9qjOY
 KVDkaSB3+TmLgFkWMiKqv+7CoPI51tDFN4Iy4vvnVpPc03IYoYYB+0bWVZHYo3q8t6jY
 2JLw==
X-Gm-Message-State: AOAM532AGN0Z4nlYyzMv0Bxj2SjBEBar58Mqt1jXtxchmNZC7CWadKlB
 5KjS5L20VvdSQ1YDZDFPWlfgzA==
X-Google-Smtp-Source: ABdhPJwxDjc19Ezo0jeInKbKNrf6eXrho2Zyh48DptJLfVFRJ22GYU5xmNEd4o6eaqLC25wBvsFdMw==
X-Received: by 2002:a5d:4ad0:: with SMTP id y16mr3407219wrs.399.1613641641313; 
 Thu, 18 Feb 2021 01:47:21 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s23sm6355422wmc.35.2021.02.18.01.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 01:47:15 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 696B51FF91;
 Thu, 18 Feb 2021 09:47:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 05/23] contrib: Fix some code style problems,
 ERROR: "foo * bar" should be "foo *bar"
Date: Thu, 18 Feb 2021 09:46:48 +0000
Message-Id: <20210218094706.23038-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210218094706.23038-1-alex.bennee@linaro.org>
References: <20210218094706.23038-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, zhouyang <zhouyang789@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: zhouyang <zhouyang789@huawei.com>

I am reading contrib related code and found some style problems while
check the code using checkpatch.pl. This commit fixs the issue below:
ERROR: "foo * bar" should be "foo *bar"

Signed-off-by: zhouyang <zhouyang789@huawei.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210118031004.1662363-3-zhouyang789@huawei.com>
Message-Id: <20210213130325.14781-6-alex.bennee@linaro.org>

diff --git a/contrib/plugins/howvec.c b/contrib/plugins/howvec.c
index 6e602aaccf..2f892da17d 100644
--- a/contrib/plugins/howvec.c
+++ b/contrib/plugins/howvec.c
@@ -235,7 +235,7 @@ static void vcpu_insn_exec_before(unsigned int cpu_index, void *udata)
     (*count)++;
 }
 
-static uint64_t * find_counter(struct qemu_plugin_insn *insn)
+static uint64_t *find_counter(struct qemu_plugin_insn *insn)
 {
     int i;
     uint64_t *cnt = NULL;
-- 
2.20.1


