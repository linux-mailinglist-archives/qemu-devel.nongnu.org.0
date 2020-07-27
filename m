Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C69B22EC17
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jul 2020 14:27:13 +0200 (CEST)
Received: from localhost ([::1]:52368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k02Do-0003VD-2t
	for lists+qemu-devel@lfdr.de; Mon, 27 Jul 2020 08:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1k02Ao-0006sX-5t
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 08:24:06 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:40784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1k02Am-0006Q2-Io
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 08:24:05 -0400
Received: by mail-wm1-x331.google.com with SMTP id k20so6899922wmi.5
 for <qemu-devel@nongnu.org>; Mon, 27 Jul 2020 05:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RdPhdnzXcxoBzSFWnxkcl0n4uuKjKBt4ReAJhvFqFBI=;
 b=WtLVazLlyGxLumWMvSSxOsNXsmQ0Lh/G+iOj3NWwWumK0qlSskgMd7Y2wwn13xk4JV
 lBKkbt2YGwpH7FFBT/Rd0V+hjBJ0SLGZ7GgJUGUvaT+PZCMg53eGMFPxtHXZUPlGN6os
 fqA7Osuszb7+DF8AnhDqzrZ6iWJ37RMRAWL4YFQxWoWrY6mdqgrhZckRJYxUONsutzGs
 564kCea/6yhTubf+CrO7v/TB20fjeJO01NlE5BCcLEaoE2KDWfm5kB5k/oe1m4eSYns0
 fGC9eGtbaouRslv/MK8L/xQsWZqLM4wTDLNKp4oe5ldUMkgF9GG/n/rHq2BJDDpvufp4
 n6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RdPhdnzXcxoBzSFWnxkcl0n4uuKjKBt4ReAJhvFqFBI=;
 b=adW/5NZ4/7L+yuSzbS7ET34BpxZ187vu/iJ6Tkhu+TZjpS3TWV04vBVqquk8uAyan/
 uXT7OZuns0usRX5bVs93ld1EKOzRWos0uVx7adzWUEXxT0hG+yYtv75ZSvifc6llA3EY
 KLxqO6yYnV2zhjLEGZEUAAy2bL6bD2S7O4V+n3PsdDE6++u1vP67I+wXLisKMeLEJfB6
 U2E2/MFJFuFc0KR41IdqxhZDhlLYZejnYl9iiLZ07/nnMJcnSFSaDwywOYzATJw8GGNR
 Jvefai2Se/rqfgLvTHFuoVcXb/IdBymXN9n0fHvBJTGyLFWFFzgk+9fMHl/nqppPEiue
 IXcQ==
X-Gm-Message-State: AOAM5330jX35PmI1xudCPL9AbYGeFDFSi7DObSgj4JcJCo8OAEd+kcOp
 ChWZXj+6ETGN+0w1RRJyNVOptQ==
X-Google-Smtp-Source: ABdhPJznjYo24E4KRt0QIDPw4G1hfUPmwblk1Jq3wwGCaubVByvjpec3h++ZD3LN3xRaoArXHM+WPg==
X-Received: by 2002:a1c:19c4:: with SMTP id 187mr21077590wmz.100.1595852642942; 
 Mon, 27 Jul 2020 05:24:02 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c10sm12649159wro.84.2020.07.27.05.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 05:24:00 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A2E0F1FF8F;
 Mon, 27 Jul 2020 13:23:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 03/16] semihosting: don't send the trailing '\0'
Date: Mon, 27 Jul 2020 13:23:44 +0100
Message-Id: <20200727122357.31263-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200727122357.31263-1-alex.bennee@linaro.org>
References: <20200727122357.31263-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: KONRAD Frederic <frederic.konrad@adacore.com>

Don't send the trailing 0 from the string.

Signed-off-by: KONRAD Frederic <frederic.konrad@adacore.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1592215252-26742-2-git-send-email-frederic.konrad@adacore.com>
Message-Id: <20200724064509.331-4-alex.bennee@linaro.org>

diff --git a/hw/semihosting/console.c b/hw/semihosting/console.c
index 22e7827824a..9b4fee92602 100644
--- a/hw/semihosting/console.c
+++ b/hw/semihosting/console.c
@@ -52,7 +52,9 @@ static GString *copy_user_string(CPUArchState *env, target_ulong addr)
 
     do {
         if (cpu_memory_rw_debug(cpu, addr++, &c, 1, 0) == 0) {
-            s = g_string_append_c(s, c);
+            if (c) {
+                s = g_string_append_c(s, c);
+            }
         } else {
             qemu_log_mask(LOG_GUEST_ERROR,
                           "%s: passed inaccessible address " TARGET_FMT_lx,
-- 
2.20.1


