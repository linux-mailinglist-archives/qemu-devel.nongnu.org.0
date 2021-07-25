Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AF43D4D5E
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 14:29:10 +0200 (CEST)
Received: from localhost ([::1]:52810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7dFl-0003oH-UH
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 08:29:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7dBG-0000fL-8Y
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 08:24:30 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:38537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m7dBE-0003oZ-Sj
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 08:24:30 -0400
Received: by mail-pl1-x636.google.com with SMTP id e21so3904719pla.5
 for <qemu-devel@nongnu.org>; Sun, 25 Jul 2021 05:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zE5MTjUi9y133mTU7/pQadmSuW4/bah/7+NERAt/57k=;
 b=uQ/dHF1fncyUiNaFC5Cvg2GRealO8bbRMDMxRDICmId94PvmwllRT+XZN4u+4ig5Fi
 H2cDcuqNLdkhrndkcjtHFGBhky3w/TdR9RUiC1FE2LmMG0whzOtLmuZ/5Wu99aTBCoY1
 9Xj8rHv6IBhge9EEzadF8RCRuZ1yo//UN3hl2oyrnTxx7Ypd6fTe9ibG9LWowTYYcsUl
 N+vFPPlC1CP5w+1IExUlVfBq8pFqkb2/C4Tf7TeKlVLXXmVLesQbZOvlzUKQoCZewgFF
 ddMd2f81YgRS+yE4nBlV7d2YHeM2E5J9q1lBr9CW69p4ERh4UwxPTAuPd2W3JdPBhv0v
 IK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zE5MTjUi9y133mTU7/pQadmSuW4/bah/7+NERAt/57k=;
 b=cVar8wyR5e3hHpof6D3J7NKAHgv8/Ed/0xuoR2GbQoyZKk4Bqi46JcFMNE+Z3Y4zQ5
 2E2xN3cnpnlFRgcxVKmf/gIsTK2VuiCdlKUnYjh1nQ4ufMQSYd0W3OWNTmvvJwf4T4P/
 Jc1WuiapmEc618O80PfbSK7IsDy2eEmU39p4kmqrqfTCKhsE9VKDjr7GAOyvL+PbHV8p
 BUe8pmYMy6rO72KtnJbSo59c3QHJJrm/6Nlod8InQddM6mf9oOQe3WfUYESxm5lrgbZF
 SwrYZf7wpCol5Fi8B1c5bDfqt4u60EezW0Rrr9HjTjoEzGotIP8AC1+ZgF7xdd3IYIMI
 1jHw==
X-Gm-Message-State: AOAM532t3jSOhb2MUJUi7MTnbHEgAWIximgL6o8qUxpDzBn/Ovx0uugX
 FUurQtiXuh5CEy+z5nYESKtei90Z1k0YzA==
X-Google-Smtp-Source: ABdhPJwu6Prz4x/QO+VqpdpGAiodLhud7h1cOkSJNBZqTRY+YAOERN8ClfQYcU4J1JGYkbE9jD5SPw==
X-Received: by 2002:aa7:98c6:0:b029:32e:608b:7e86 with SMTP id
 e6-20020aa798c60000b029032e608b7e86mr12996753pfm.68.1627215867699; 
 Sun, 25 Jul 2021 05:24:27 -0700 (PDT)
Received: from cloudburst.home
 (2603-800c-3202-ffa7-497b-6ae4-953c-7ad1.res6.spectrum.com.
 [2603:800c:3202:ffa7:497b:6ae4:953c:7ad1])
 by smtp.gmail.com with ESMTPSA id k37sm15005093pgm.84.2021.07.25.05.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 05:24:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1? v2 8/9] linux-user/syscall: Remove unused variable
 from execve
Date: Sun, 25 Jul 2021 02:24:15 -1000
Message-Id: <20210725122416.1391332-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210725122416.1391332-1-richard.henderson@linaro.org>
References: <20210725122416.1391332-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From clang-13:
linux-user/syscall.c:8503:17: error: variable 'total_size' set but not used \
    [-Werror,-Wunused-but-set-variable]

Acked-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 376629c689..ccd3892b2d 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8364,7 +8364,6 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
             abi_ulong guest_envp;
             abi_ulong addr;
             char **q;
-            int total_size = 0;
 
             argc = 0;
             guest_argp = arg2;
@@ -8396,7 +8395,6 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                     break;
                 if (!(*q = lock_user_string(addr)))
                     goto execve_efault;
-                total_size += strlen(*q) + 1;
             }
             *q = NULL;
 
@@ -8408,7 +8406,6 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
                     break;
                 if (!(*q = lock_user_string(addr)))
                     goto execve_efault;
-                total_size += strlen(*q) + 1;
             }
             *q = NULL;
 
-- 
2.25.1


