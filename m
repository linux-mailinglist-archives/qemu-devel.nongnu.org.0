Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AD74994B2
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 21:55:30 +0100 (CET)
Received: from localhost ([::1]:35564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC6N7-0007D2-Mx
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 15:55:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5rp-0005F8-Kd
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:23:09 -0500
Received: from [2a00:1450:4864:20::52d] (port=39604
 helo=mail-ed1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5rn-0004Ja-M0
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:23:09 -0500
Received: by mail-ed1-x52d.google.com with SMTP id u18so44385438edt.6
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 12:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cyzZ0jkQjwfMeD7GLwLYcz/E1ft7Z71kh0B/0OrXw+Q=;
 b=WN1MBalOshkt8u8LMLtzg8FAMepgL+0Q0DFnVzCzDm1/SfdD+pjItXImDn4noHURfl
 JJg+CJcShoGXymPq901mtlVm3M4Syc7LEWHBwuoAnwCbVn3DTfORWRy9Lk47A4VlG5UD
 UsYsGqEUX/oK5+Op0jEUk2dbJc9cyLoR9NTlyDB+qk4d5WlVrmF1p6LwcGjzaNfPlofz
 bDRFOJdlwqbjA65wfaGzUOA6RscY7DoOhFEtiJ2mAB7BSnnUaqM6jQkRTly62oZqZZt6
 z8kOQfnq045hNMLNLCHuOnV3ChBYWS3s2CRLJAESYLgKLgxreGjI8CiqwK6py84SNsCp
 NXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cyzZ0jkQjwfMeD7GLwLYcz/E1ft7Z71kh0B/0OrXw+Q=;
 b=CdP6YfX6Yb3Z/KMP/7CJMsNI/+VV4jlp+ityqzfiyZ484W5EHtHsa2CumbDFUAUOd1
 v6dwEfUen0uYDd6CiOrMBKUw+ng7q2G/LJnG324qg2indAwlnyl0Mx66PBigs//KRQEK
 Lsvwv5FMHrzfkO8MgkC5lW3IqX8zR6qw6rT4hNG+Q5SuQjMsKBcbQKjGtz5fdgc+pFcz
 ildxoi60QTLOHW5FfCNtvS5hydNVaBAwxIqIT0jj4yN0t6emSV7biFsrGDIMIA3vz1wE
 RG4SeSbxvNBVQbOmEr9Bjyowsz+w5GI7ROo8CgzZI7mQjQN5s2RpGDFeuguL+JOGhBOk
 JSfQ==
X-Gm-Message-State: AOAM531tmiwc4OGEGXtAtk6xC1dcx2ExxfCRLosyJ/Fi3YICGeC5/fB0
 NNp90jjzpxRSkL+0sCqC6937KQ==
X-Google-Smtp-Source: ABdhPJz9cESxO8IdToGEBrWCXKAZwJupyfyrxMSKLXMXlxAlLGNXQ/KKFKm08uO3zTcJjd8n8Putxw==
X-Received: by 2002:a05:6402:1c94:: with SMTP id
 cy20mr14308418edb.154.1643055785754; 
 Mon, 24 Jan 2022 12:23:05 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m12sm7101443edq.40.2022.01.24.12.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 12:22:58 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CC3121FFC5;
 Mon, 24 Jan 2022 20:16:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 13/22] docs: remove references to TCG tracing
Date: Mon, 24 Jan 2022 20:15:59 +0000
Message-Id: <20220124201608.604599-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220124201608.604599-1-alex.bennee@linaro.org>
References: <20220124201608.604599-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, aaron@os.amperecomputing.com,
 robhenry@microsoft.com, Luis Vilanova <vilanova@imperial.ac.uk>,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Luke.Craig@ll.mit.edu, kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Users wanting this sort of functionality should turn to TCG plugins
instead.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Cc: Luis Vilanova <vilanova@imperial.ac.uk>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
---
 docs/about/removed-features.rst | 13 +++++
 docs/devel/tracing.rst          | 85 ---------------------------------
 2 files changed, 13 insertions(+), 85 deletions(-)

diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 4c4da20d0f..b0156e0f25 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -601,6 +601,19 @@ the upstream Linux kernel in 2018, and it has also been dropped from glibc, so
 there is no new Linux development taking place with this architecture. For
 running the old binaries, you can use older versions of QEMU.
 
+TCG introspection features
+--------------------------
+
+TCG trace-events (since 6.2)
+''''''''''''''''''''''''''''
+
+The ability to add new TCG trace points had bit rotted and as the
+feature can be replicated with TCG plugins it was removed. If
+any user is currently using this feature and needs help with
+converting to using TCG plugins they should contact the qemu-devel
+mailing list.
+
+
 System emulator devices
 -----------------------
 
diff --git a/docs/devel/tracing.rst b/docs/devel/tracing.rst
index ba83954899..ef67bc9d70 100644
--- a/docs/devel/tracing.rst
+++ b/docs/devel/tracing.rst
@@ -411,88 +411,3 @@ disabled, this check will have no performance impact.
         return ptr;
     }
 
-"tcg"
------
-
-Guest code generated by TCG can be traced by defining an event with the "tcg"
-event property. Internally, this property generates two events:
-"<eventname>_trans" to trace the event at translation time, and
-"<eventname>_exec" to trace the event at execution time.
-
-Instead of using these two events, you should instead use the function
-"trace_<eventname>_tcg" during translation (TCG code generation). This function
-will automatically call "trace_<eventname>_trans", and will generate the
-necessary TCG code to call "trace_<eventname>_exec" during guest code execution.
-
-Events with the "tcg" property can be declared in the "trace-events" file with a
-mix of native and TCG types, and "trace_<eventname>_tcg" will gracefully forward
-them to the "<eventname>_trans" and "<eventname>_exec" events. Since TCG values
-are not known at translation time, these are ignored by the "<eventname>_trans"
-event. Because of this, the entry in the "trace-events" file needs two printing
-formats (separated by a comma)::
-
-    tcg foo(uint8_t a1, TCGv_i32 a2) "a1=%d", "a1=%d a2=%d"
-
-For example::
-
-    #include "trace-tcg.h"
-    
-    void some_disassembly_func (...)
-    {
-        uint8_t a1 = ...;
-        TCGv_i32 a2 = ...;
-        trace_foo_tcg(a1, a2);
-    }
-
-This will immediately call::
-
-    void trace_foo_trans(uint8_t a1);
-
-and will generate the TCG code to call::
-
-    void trace_foo(uint8_t a1, uint32_t a2);
-
-"vcpu"
-------
-
-Identifies events that trace vCPU-specific information. It implicitly adds a
-"CPUState*" argument, and extends the tracing print format to show the vCPU
-information. If used together with the "tcg" property, it adds a second
-"TCGv_env" argument that must point to the per-target global TCG register that
-points to the vCPU when guest code is executed (usually the "cpu_env" variable).
-
-The "tcg" and "vcpu" properties are currently only honored in the root
-./trace-events file.
-
-The following example events::
-
-    foo(uint32_t a) "a=%x"
-    vcpu bar(uint32_t a) "a=%x"
-    tcg vcpu baz(uint32_t a) "a=%x", "a=%x"
-
-Can be used as::
-
-    #include "trace-tcg.h"
-    
-    CPUArchState *env;
-    TCGv_ptr cpu_env;
-    
-    void some_disassembly_func(...)
-    {
-        /* trace emitted at this point */
-        trace_foo(0xd1);
-        /* trace emitted at this point */
-        trace_bar(env_cpu(env), 0xd2);
-        /* trace emitted at this point (env) and when guest code is executed (cpu_env) */
-        trace_baz_tcg(env_cpu(env), cpu_env, 0xd3);
-    }
-
-If the translating vCPU has address 0xc1 and code is later executed by vCPU
-0xc2, this would be an example output::
-
-    // at guest code translation
-    foo a=0xd1
-    bar cpu=0xc1 a=0xd2
-    baz_trans cpu=0xc1 a=0xd3
-    // at guest code execution
-    baz_exec cpu=0xc2 a=0xd3
-- 
2.30.2


