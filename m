Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A528F4E7A87
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 20:57:25 +0100 (CET)
Received: from localhost ([::1]:54924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXq3o-0001L3-NN
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 15:57:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nXpzX-0001u0-Uo
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:53:01 -0400
Received: from [2001:4860:4864:20::32] (port=40227
 helo=mail-oa1-x32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nXpzV-0008Nq-Dz
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:52:58 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so9130865fac.7
 for <qemu-devel@nongnu.org>; Fri, 25 Mar 2022 12:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pd5+yLliVhBXIEFxiOo2I5aLF4BKy2rSqhZkhW/VVIE=;
 b=HqTOEex19f9eg2CPws+PeKIo8oI/qdODhxVQd0l4iiSE+7I+Mc6+eFDjM6mdWhWJRi
 4V4ncuhjzw60bcDG+TM7/XJP3miKO8qa1v/lxKa7DpHzxZIXSfY0VsmSlp/NAjzTq3OX
 u3j7aVoW/Z6oQcm9oW3sfE2AUMAOWPGl1nTAIvkx7s6cVEy1kb8qMc5roKYC8hL/cDUX
 rFPH85PXJ+PLV6D0Y9zrPu/A06vsUniNHumJ0F3Ptyw7Hrkr6QX+J7/fGzw7qrqX3Ljr
 ulJygk4WugjZ5cS5BiNSHU3DVC61kNwtD12HMkl+867bVKUrniHbuUVBlDNoUH1r71E8
 zfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pd5+yLliVhBXIEFxiOo2I5aLF4BKy2rSqhZkhW/VVIE=;
 b=I49erSgg8SaE8PVEh6stqpbJVnWsEbDJmHlPTkTyaxA88Sm/+kP3cZ9Rx2WnES2a8H
 M/8az5jR31mcwYyDBxVz5UNZqazq0M08CLKsWDL+Jf4Hv+otr2CKi+kQEtCfDPI54XLO
 ThGFOogcQyTIFV8L3a07WEtHexVOhA9LL5zJqNd64BErPXHIcGXd5PMHFVwNcUJ6Et+s
 t0crvbTh4wPqNfuQ+CSIueWTs1mF51eK5Jje1wNrRyQFeHEJ/5KhnkDP3C00y2QSR9LM
 4hSxeiDeHI0tBxHvv+VJJsjm/QT4qz5057Fy5Ij8MfTELdAkgaxHWVwC5q5a7b6hDQZM
 Ezsg==
X-Gm-Message-State: AOAM531YfbB6ts/5XqvQ97CocM7RyUojgUS4s/u9HB9iFw7R75S2aqUq
 pQu2rEELINjNTkReT9oYtCfmr/Fy1dOb4dLibuY=
X-Google-Smtp-Source: ABdhPJwRVgFn9twwYI5vKMk/Ho1o6MChMwkxggnJlNOqNBq6m/JZO8b7HQak1zudjqbon0nmAEHSmg==
X-Received: by 2002:a05:6870:15d3:b0:da:c49f:9113 with SMTP id
 k19-20020a05687015d300b000dac49f9113mr5721188oad.91.1648237976347; 
 Fri, 25 Mar 2022 12:52:56 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 ep36-20020a056870a9a400b000de98fe4869sm2153730oab.35.2022.03.25.12.52.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 12:52:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/8] linux-user/nios2: Drop syscall 0 "workaround"
Date: Fri, 25 Mar 2022 13:52:45 -0600
Message-Id: <20220325195250.386071-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220325195250.386071-1-richard.henderson@linaro.org>
References: <20220325195250.386071-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::32
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x32.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Syscall 0 is __NR_io_setup for this target; there is nothing
to work around.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Fixes: a0a839b65b6 ("nios2: Add usermode binaries emulation")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/nios2/cpu_loop.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index 2768ae61dd..a285781fc5 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -55,10 +55,6 @@ void cpu_loop(CPUNios2State *env)
                                  env->regs[7], env->regs[8], env->regs[9],
                                  0, 0);
 
-                if (env->regs[2] == 0) {    /* FIXME: syscall 0 workaround */
-                    ret = 0;
-                }
-
                 env->regs[2] = abs(ret);
                 /* Return value is 0..4096 */
                 env->regs[7] = ret > 0xfffff000u;
-- 
2.25.1


