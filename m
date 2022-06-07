Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6495541F3D
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 00:56:09 +0200 (CEST)
Received: from localhost ([::1]:57474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyi7M-0001J3-L0
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 18:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg97-0005mF-7W
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:49:49 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:40938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg95-0001pv-Jj
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:49:48 -0400
Received: by mail-pl1-x62e.google.com with SMTP id i1so15825162plg.7
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZnhIt8ADFMZnFjwBm8rc3u5aYULCDVuExy2ptaewy0A=;
 b=VrzAXEL6JOj9NnR+wf+RbiyFES8FJb9eWDQP2beFmC61Tlf1Ps2OQ8PooZTS2hQb90
 qiu7S+/w0eRoqOEZAlSjPcTDE30MNk2TyBa9lhUxjSdSiuzeQCwTkabEyOSEoJRJQ0ci
 ZgnMvDbsAP/c01m7yBfxGTtu6rWYuqM5GEFvSsRuJu9TiwrP11VciNCedwNzGF0HLF8W
 OpU0VBfIJ4ORb8G11BFoLO+Xr8Q+VySyFBvGBuVtM/Qx0mLpmkneyi9GkpJmvNM3AwGZ
 C/smE6f8fdcCuLU6o+URzZKdTpm1FJYpSB3KqO3D3m9pB7JW1IpFSo8LYHwK9Wo5vUW8
 7riw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZnhIt8ADFMZnFjwBm8rc3u5aYULCDVuExy2ptaewy0A=;
 b=5Mfjds0IVlDPyeXkRQJEtg8kHYEoAwBl9ZgHujaI3Ra2caCwqbhrQ0TtBiN9XLQNNi
 vNdnNyWXEABOJ2MDb4u1qJIBkx/tgejBUHnQ50FCVQ6Rdv2XFFHplQboUXNCPn24qXfM
 g0TM1bTYUI906U2RMyUo0BQSEsbcG0wByWSkExm4v3P67E7wVe0Dxd20Gs8va3keOryq
 j4YWfF2UbwmIS5xYJdHWb/iOknCNaQk9jQRPI3f7zxC0peY28snJ5ptOk/cCOOIZE4fn
 s7EZdkMz1Irp8eAO5hN76+/9GEx+8VtrLpxHVvcq4aRal3JW8unfAJBLKVrkio/rGkhk
 rpdA==
X-Gm-Message-State: AOAM531hFx1AjQ0bPgn6bET59OrgVPoklwJSfh00hZgdTc0wGj+STh19
 2nFwog/mg4VXXjYd/sGo/0Q7SP8UtKs+vA==
X-Google-Smtp-Source: ABdhPJzGUaAVikU5bCgRSUfHpkWJwkrZEL+Txd0PD7gxe/qche9QjZLPzbcpJOJE19Rdms+pjh4e+w==
X-Received: by 2002:a17:902:c403:b0:167:4a9f:2785 with SMTP id
 k3-20020a170902c40300b001674a9f2785mr23687085plk.67.1654634984720; 
 Tue, 07 Jun 2022 13:49:44 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 128-20020a620686000000b00518b4cfbbe0sm13152327pfg.203.2022.06.07.13.49.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:49:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 51/53] semihosting: Use console_out_gf for SYS_WRITE0
Date: Tue,  7 Jun 2022 13:45:55 -0700
Message-Id: <20220607204557.658541-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index dea5b2de8d..21b6bc3a0f 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -436,8 +436,15 @@ void do_common_semihosting(CPUState *cs)
         break;
 
     case TARGET_SYS_WRITE0:
-        ret = qemu_semihosting_console_outs(env, args);
-        common_semi_set_ret(cs, ret);
+        {
+            ssize_t len = target_strlen(args);
+            if (len < 0) {
+                common_semi_dead_cb(cs, -1, EFAULT);
+            } else {
+                semihost_sys_write_gf(cs, common_semi_dead_cb,
+                                      &console_out_gf, args, len);
+            }
+        }
         break;
 
     case TARGET_SYS_WRITE:
-- 
2.34.1


