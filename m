Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B952DE20F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 12:36:19 +0100 (CET)
Received: from localhost ([::1]:59558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqE3W-0000Uk-FA
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 06:36:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kqDus-0006zj-8z
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:27:22 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:39779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kqDuq-00036l-HP
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:27:21 -0500
Received: by mail-wm1-x336.google.com with SMTP id 3so2182625wmg.4
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 03:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bivVxysPoShSEEWKqw3fiXD1Ck9vv/6yITEBjJAWoPE=;
 b=r6unnJUbLZtCcIZnGe+vkmUZMkDFaSYYlNRZI+GNlccI/7hh3C1SrX5WeCQXY5LNUQ
 7ksJllMSVLUrnKP4zq6WBvBQ+/a/VNUu7P/FlWER1fDmPI/CkFysFnR6QhKpOO48mpAe
 ZG9U+/3iG4yc/1zybZk4lBGorbSmDcKrmsWkzfPuwQj+ej9SXTagKsPcgrvuUJYTBDfL
 pUl/MA3D+kCP+EvJPv8ljyKGd0SRjZIJD46DNdA5j1t1f310ojK1oivFcgb6Anc3LVvr
 0dBDfJTRObwC6z4StQMVWeqlZbI6f+JN29phP5llITZ/o+A4+c1JKIXJHx2JUrK48OVU
 y9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bivVxysPoShSEEWKqw3fiXD1Ck9vv/6yITEBjJAWoPE=;
 b=nggGmrmyzN9vgh3aS5y/VVcvuVTOAieg1ABah+sX31VRN/LTc2RXyUvFyR85Xg+dSe
 lAf9HPwZkoMeVY6ApWarf8qhgJo2phSyw/7X9dyLQ2jHirGIaNK7VAsxhrpYxOMXxws+
 kAxPM45225JXO2ZYQ0/ztFj8cObi8fN133BYncL4jcMMQvM2/Z6X7gSSUD0flQoJlaEx
 n073S7aDxx6iWFx1/uwoozQkk7PfAnj+6duIn7C0tHDNnX0IkUkIw6QzA0s2tjvax5Ue
 p6Q0jxWiQMo0FzzSvWFtDkwJgRA9t+8FJrfMPRHefVTSosxfYuvpmtjiOnJox/qkZfeH
 +hhg==
X-Gm-Message-State: AOAM532p9SnM0Keu1v6aiCA6uYiW8LhbrS/s0mMp845YlpEb0mKKXPeX
 +S1olQDA+bC+9Qd0exvZsKSfsbGJIKfF/A==
X-Google-Smtp-Source: ABdhPJwFdhr8lmdbpfqGhDc7ecrds4IuT4FTzJemIXF28TVfzeko8IPeNwD8FvPZIzxbO+BxiSM+dA==
X-Received: by 2002:a1c:3b02:: with SMTP id i2mr3682481wma.141.1608290838066; 
 Fri, 18 Dec 2020 03:27:18 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o8sm12958307wrm.17.2020.12.18.03.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 03:27:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 78AE01FF96;
 Fri, 18 Dec 2020 11:27:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 8/9] gdbstub: ensure we clean-up when terminated
Date: Fri, 18 Dec 2020 11:27:06 +0000
Message-Id: <20201218112707.28348-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201218112707.28348-1-alex.bennee@linaro.org>
References: <20201218112707.28348-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If you kill the inferior from GDB we end up leaving our socket lying
around. Fix this by calling gdb_exit() first.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201214153012.12723-7-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdbstub.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index bab8476357..8c301edf32 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -1978,6 +1978,7 @@ static void handle_v_kill(GdbCmdContext *gdb_ctx, void *user_ctx)
     /* Kill the target */
     put_packet("OK");
     error_report("QEMU: Terminated via GDBstub");
+    gdb_exit(0);
     exit(0);
 }
 
@@ -2539,6 +2540,7 @@ static int gdb_handle_packet(const char *line_buf)
     case 'k':
         /* Kill the target */
         error_report("QEMU: Terminated via GDBstub");
+        gdb_exit(0);
         exit(0);
     case 'D':
         {
-- 
2.20.1


