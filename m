Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F58651E7A3
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 16:06:12 +0200 (CEST)
Received: from localhost ([::1]:56164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnL4U-0008IC-Tg
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 10:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jinyilingjyl@gmail.com>)
 id 1nnGye-0003oJ-1t
 for qemu-devel@nongnu.org; Sat, 07 May 2022 05:43:52 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:38511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jinyilingjyl@gmail.com>)
 id 1nnGyc-0003Rq-Nb
 for qemu-devel@nongnu.org; Sat, 07 May 2022 05:43:51 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 cx11-20020a17090afd8b00b001d9fe5965b3so12887548pjb.3
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 02:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=frLqeTqJNZEXSzaeBxZPzE4w2mT19zhYG5NKSJcgW8M=;
 b=M/6j3ArfRcyAK+LEzYyx42ZBqpDJzVAdlwmJ/DEhXk8ZOb6UTqlIuZ92WQ+XICesxc
 G3pILJZjpo7dCJGoTmimdDfqXuwDPvVUVikdh2cpgbpOZrmBAnU5MVuoyHPZtp0RVG4i
 y5PcO1qvKZPLzKTW8VoE329bb6YwSAxC+qLfX9fpaKrH2Ni4X15Vmr3SaLZuAL4WHd3X
 2fDctOiepOXbzoK9apMx21DdxhWLc6CDXiJFHNlVUNtr1QMm6c/7MOFnSFi6UKt6huZs
 0ZOEoCJqcizjo48V4iZolQzJVUs6XxCIWxwNOnNhVPmKr2u4NFL5H4lyXq7GpaQ8hPVn
 wzDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=frLqeTqJNZEXSzaeBxZPzE4w2mT19zhYG5NKSJcgW8M=;
 b=DdjimofLC6PMa2egdwSn2KJXgFVGck8yYjQOFRkbiCsq+UHFlFAyWjf+BGSPtxkj3V
 cJ2jcXPGchefyx/OLPqOQHVfMKNd702Bhaw2WI1AEMDhjrqsP7N/njcZU152+tLztvpI
 SV1+PEFUOaQFbJ8iE1EmfKfRWJY8kUk3mP0YUqvUDSTIlVQznn8i5dDLXigaEiKooVzc
 nqOIRXYJU23QINVD6gtnyjzOeEKYAJeMa4YTKzAr4wWRkGrZsSxbY6RVztUNYggqdOWj
 LKenVqEIKG3fmnOE4FzfM8I5fR45wNECqQOZhmtgWlQ9wDw+Zite2dEfmKI/8S9JPhQz
 ooqw==
X-Gm-Message-State: AOAM531vrzr7HrTJ9yLQvqrIF/AXJOysi3pc99RCaaaWBhjBOkz6ujgW
 vkHEQQ7MT+enlvnUtshZ46M=
X-Google-Smtp-Source: ABdhPJzhECXGgIqbdNE1Kvp3pTSkBCUFvXXddwoHoFgaBJn9ipI45xy5PCr3qXxp8JOguBEPYW/ElQ==
X-Received: by 2002:a17:902:748b:b0:15c:3d1b:8a4d with SMTP id
 h11-20020a170902748b00b0015c3d1b8a4dmr7794592pll.85.1651916628905; 
 Sat, 07 May 2022 02:43:48 -0700 (PDT)
Received: from localhost.localdomain ([43.154.6.249])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a170902d70400b0015e8d4eb1bfsm3266409ply.9.2022.05.07.02.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 02:43:48 -0700 (PDT)
From: jinyilingjyl@gmail.com
X-Google-Original-From: <yilingjin@tencent.com>
To: pbonzini@redhat.com
Cc: qemu-devel@nongnu.org,
	yilingjin <yilingjin@tencent.com>
Subject: [PATCH] cpu-throttle: reset throttle_thread_scheduled when
 throttle_percentage is 0
Date: Sat,  7 May 2022 17:43:40 +0800
Message-Id: <20220507094340.33700-1-yilingjin@tencent.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=jinyilingjyl@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 07 May 2022 10:04:51 -0400
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

From: yilingjin <yilingjin@tencent.com>

The throttle_thread_scheduled flag is set to 1 in cpu_throttle_timer_tick()
when throttle_percentage isn't 0, and will reset back to 0 after sleeping
in cpu_throttle_thread(). Given that throttle_timer may tick with a slight delay,
the throttle_percentage may reset to 0 before schedule cpu_throttle_thread().
This results on cpu_throttle_thread() to return immediately without reset
throttle_thread_scheduled flag back to 0, so there is no longer any chances
for vCPU thread to sleep in cpu_throttle_thread().

Signed-off-by: yilingjin <yilingjin@tencent.com>
---
 softmmu/cpu-throttle.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/softmmu/cpu-throttle.c b/softmmu/cpu-throttle.c
index d9bb30a223..7c2fd26072 100644
--- a/softmmu/cpu-throttle.c
+++ b/softmmu/cpu-throttle.c
@@ -44,6 +44,7 @@ static void cpu_throttle_thread(CPUState *cpu, run_on_cpu_data opaque)
     int64_t sleeptime_ns, endtime_ns;
 
     if (!cpu_throttle_get_percentage()) {
+        qatomic_set(&cpu->throttle_thread_scheduled, 0);
         return;
     }
 
-- 
2.27.0


