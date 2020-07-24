Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D280D22BE51
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jul 2020 08:54:04 +0200 (CEST)
Received: from localhost ([::1]:46086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyral-0001Pc-SW
	for lists+qemu-devel@lfdr.de; Fri, 24 Jul 2020 02:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jyrSU-0004JS-As
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 02:45:31 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:54037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jyrSQ-0000LY-RM
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 02:45:29 -0400
Received: by mail-wm1-x344.google.com with SMTP id j18so6950433wmi.3
 for <qemu-devel@nongnu.org>; Thu, 23 Jul 2020 23:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k0qObaslF7DMl08qf2Ikqb0eMymc3tJSTaDPkACMeck=;
 b=ctnrTEYicUVpwrQ7pLianFLKXCX2N46xqGI5CbxAaJZS4y02LLguBGtPTYYg/8wALJ
 3en7tR9aglucyHESPdTp1xMbTBzsw46V4ohg299Tk5rhZusVBsPW2rBlbxDwhlns3g8F
 z5y0EcG7Q0z5p78ZTvcj0veJq32BfYWLm9hv9TZaakpdH37kjIPFZ8L5Jcc81ZFTp0Jc
 Pxu1wn+e/I6Ora4f6kWi3JyE5g2/nxsFoNGNTWc5HkDk3A5jLSvQTQ27GoQlv1pTddK5
 lYBjz4UmfK7DEiwqfHRSTr3xRUYhY7Sg9CoBNu3AjHGuTw36j/oyl0ECG6801B7XtCMr
 DagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k0qObaslF7DMl08qf2Ikqb0eMymc3tJSTaDPkACMeck=;
 b=gMOfR9AVnl0f9Uwgkbz++YYAZpI1thEUfSbEzOabTR3G/PYVPmSM0lWhR7YtPGGnU2
 Pb42EdQpOM+05nXnkyUKnMS3/onE5GK3qge2Sf0va3m5a0rjXzz9Q6+LfXxBUieZF5pA
 1A3pkny3JUAKrSuC7sW+5l3pyj86SLt0yGedoL7X0B8zZBfC28FVvn1VAAQimI0QiP14
 fxAu2+iJzrzRyi8uhWUtrFilqLRd18szGnpz6O5Rtvd1aQrgODtrwsPPVDJl2h/nME+D
 SgKV2R5aK/RIO0cu9CGt8MSPiRZpUdmNDOTNs+tMgFygIjTnW6fL90rCgrFTG/K+BPLz
 wmpg==
X-Gm-Message-State: AOAM530eFnPpDjT3nF9sc5PP5BrMw6L6Oe7peuuY8vOFHJXD/sb+hmDG
 7gcmMNFc34nkpdZZCK6VEjATjA==
X-Google-Smtp-Source: ABdhPJydgqzOoSB1M1wBw+KpUspYOGDtsRUTbj/qVfKwCMQw7Hhi/v67lonNmWFAi1lwP8KCLJZe6g==
X-Received: by 2002:a1c:2e57:: with SMTP id u84mr7801546wmu.52.1595573125428; 
 Thu, 23 Jul 2020 23:45:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c188sm6231551wma.22.2020.07.23.23.45.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 23:45:21 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4BAF41FF9B;
 Fri, 24 Jul 2020 07:45:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 12/16] linux-user: fix clock_nanosleep()
Date: Fri, 24 Jul 2020 07:45:05 +0100
Message-Id: <20200724064509.331-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200724064509.331-1-alex.bennee@linaro.org>
References: <20200724064509.331-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x344.google.com
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
Cc: fam@euphon.net, berrange@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 Laurent Vivier <laurent@vivier.eu>, cota@braap.org, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <laurent@vivier.eu>

If the call is interrupted by a signal handler, it fails with error EINTR
and if "remain" is not NULL and "flags" is not TIMER_ABSTIME, it returns
the remaining unslept time in "remain".

Update linux-user to not overwrite the "remain" structure if there is no
error.

Found with "make check-tcg", linux-test fails on nanosleep test:

  TEST    linux-test on x86_64
.../tests/tcg/multiarch/linux-test.c:242: nanosleep

Reported-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200722174612.2917566-2-laurent@vivier.eu>
---
 linux-user/syscall.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 1211e759c26..43a6e283961 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -11831,8 +11831,14 @@ static abi_long do_syscall1(void *cpu_env, int num, abi_long arg1,
         target_to_host_timespec(&ts, arg3);
         ret = get_errno(safe_clock_nanosleep(arg1, arg2,
                                              &ts, arg4 ? &ts : NULL));
-        if (arg4)
+        /*
+         * if the call is interrupted by a signal handler, it fails
+         * with error -TARGET_EINTR and if arg4 is not NULL and arg2 is not
+         * TIMER_ABSTIME, it returns the remaining unslept time in arg4.
+         */
+        if (ret == -TARGET_EINTR && arg4 && arg2 != TIMER_ABSTIME) {
             host_to_target_timespec(arg4, &ts);
+        }
 
 #if defined(TARGET_PPC)
         /* clock_nanosleep is odd in that it returns positive errno values.
-- 
2.20.1


