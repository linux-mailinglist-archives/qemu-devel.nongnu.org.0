Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C0E3C178E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 18:58:38 +0200 (CEST)
Received: from localhost ([::1]:56584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XMD-0007B7-TJ
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 12:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X5F-0001jZ-Eb
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:05 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:41725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1X59-0008Bq-Ve
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:05 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 oj10-20020a17090b4d8ab0290172f77377ebso4192803pjb.0
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J78iIrV/uBjFzK3bTpbLy3S7PgpqgxUhkktjGy5U398=;
 b=S3bF7FIBZQHgma3p/JJR7Chp8QnFhYXAAkZNJ3AWB36kOkETWPE08AYruXCHE8QICh
 zsRlZ22uCJNTy1ZjXc+AvdB5Zg4wTaVE0cFdi7tg67huk/7VZBDlz6vQQO8CVrQFKmca
 +AiI6GbA1JKZNQoS1EhgOy7syfVedZIuQXKxDF78yeqn5VlvvnRSl/tVn8j0pI4+1EZw
 WqJS5vWfDf2CxzwjiiOfpvFr5yBYzP2UHMjLEM/mhv5Fk1QmDES0w5f99SdRgADAYvQH
 EA0eSo6QmbcqvgKR+mWCNycoJrqAcJhT/CdNzKiJMtENhCCaeSJv3qd5XgnBsMy6bZjt
 m1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J78iIrV/uBjFzK3bTpbLy3S7PgpqgxUhkktjGy5U398=;
 b=gja+IXmrGAocWkdVlAV2ZFYK1q0m8JgotkWmYbAW+XXLh7YwPfZ5tzyXhbWewkRmVN
 XDq9Xt+kTxTzRktIoULSeyIf3AVK/djf9j+yXUPLEhZ0G8tknr74CQTMzzcG/tKSqvWR
 ykk4TQDNFx4SPTsbQvTG9AePjverSGumkeQRDt/k/FoTEVYDqMz/StTSBMYsC+whpuPm
 GX7FzqhJdH8f/GDOPSXjFhEH09qQzuaffWjMpIYKGvABzNu5lD/s2yfEvtiR0wf2DJVY
 EISiFOenDuTkOWK1hrukwFykD29r6gEz2WTJxx0xpKrCYbX+bpgyQ08DI4Vg6vrhHJDV
 QYEw==
X-Gm-Message-State: AOAM530lcIeCAAvzB8WY9XMn/z/0inYkkna5JWgB+aDXoAVfytGjim93
 ItOsQAqFgBzPizg43x4VIfZLLkbfglO3FA==
X-Google-Smtp-Source: ABdhPJxqRQ/+RZCNtRLXMlURHzpLtJqC0QK6lR1XNb6DBu2ib4aUd8ka+8G94OljV5ZekNDEichFvg==
X-Received: by 2002:a17:902:c40c:b029:12a:cb38:5f0a with SMTP id
 k12-20020a170902c40cb029012acb385f0amr1731259plk.73.1625762456066; 
 Thu, 08 Jul 2021 09:40:56 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j129sm3465678pfb.132.2021.07.08.09.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 09:40:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/28] target/avr: Mark some helpers noreturn
Date: Thu,  8 Jul 2021 09:40:31 -0700
Message-Id: <20210708164050.711967-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708164050.711967-1-richard.henderson@linaro.org>
References: <20210708164050.711967-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: Michael Rolnik <mrolnik@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All of these helpers end with cpu_loop_exit.

Reviewed-by: Michael Rolnik <mrolnik@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/helper.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/avr/helper.h b/target/avr/helper.h
index 8e1ae7fda0..4d02e648fa 100644
--- a/target/avr/helper.h
+++ b/target/avr/helper.h
@@ -19,10 +19,10 @@
  */
 
 DEF_HELPER_1(wdr, void, env)
-DEF_HELPER_1(debug, void, env)
-DEF_HELPER_1(break, void, env)
-DEF_HELPER_1(sleep, void, env)
-DEF_HELPER_1(unsupported, void, env)
+DEF_HELPER_1(debug, noreturn, env)
+DEF_HELPER_1(break, noreturn, env)
+DEF_HELPER_1(sleep, noreturn, env)
+DEF_HELPER_1(unsupported, noreturn, env)
 DEF_HELPER_3(outb, void, env, i32, i32)
 DEF_HELPER_2(inb, tl, env, i32)
 DEF_HELPER_3(fullwr, void, env, i32, i32)
-- 
2.25.1


