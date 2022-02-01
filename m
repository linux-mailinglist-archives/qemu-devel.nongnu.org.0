Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF7F4A677C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 23:02:49 +0100 (CET)
Received: from localhost ([::1]:46094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF1Ee-0007Wx-4e
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 17:02:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExnX-0008Cq-4k
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:22:36 -0500
Received: from [2a00:1450:4864:20::62c] (port=44713
 helo=mail-ej1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nExmZ-0000fL-Pt
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:21:41 -0500
Received: by mail-ej1-x62c.google.com with SMTP id ka4so56675180ejc.11
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 10:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RF5y4dzhS8bG68f7NLy4ZRBD5ccx4mYs0zSlmwkW1WI=;
 b=xyxrSKhNUyh+NMnKYYa2suYiu4kaXxRCx32UlgYvL3T3D3YdmjYzC7bKujkhU/2nav
 DQQJjnFHAqPWKxCTR0O6LAGYx7VINMB4KA4TSszadOeb3ymeWwpLo+A7tEONbRQ33baU
 dQJrVvLNs6c4m4PgCrKDrIymQGljTThhgFYaHPKtfLxEBtCpVbpsZg1ABnRc3nk2LROs
 3RqP88ZrZJ10KuchBsOtB465kPMFCsw9Q6EFC+a9QvwRsvsLuQj8raHjfr7CHktY2Txq
 n9hnjdhzuNIg/fsyvdRyJMsqzK5Z4lOUETMI2m5O2PFdh24Q4a2CLDXlp1QOXa0a1GFI
 39eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RF5y4dzhS8bG68f7NLy4ZRBD5ccx4mYs0zSlmwkW1WI=;
 b=ezNORb95UM/QVpkpi+uXbplvA4a1gKGPL392IxS7r2eQvSpNs6kyIUVewb2Dt4RIEP
 3wmyJdRLbMMdqcsM5FGkYRpz86cDFdnMBPBArlpDE19qdry/Q0ZjkGr9AnAXuvsm9Rmk
 o0I356oPFd1X6K4tLsU3PyCrdo8M+3dcPWf7mI2rmiDsg4CpSai2aFvrYThTOYkyK5db
 1BIGM5Pu6YwR/yoM8TwaJeMmU4SHYH/g5Ggw19oP+7+OjV0Hv7RMknHqxHN7Mn3+EZJB
 hCo46lRmFw+U9+ni9NifuRawKGZllvP9Pq/Mw1ks3NxZHgc0137KfPFLhaElVH44qLCJ
 ESVQ==
X-Gm-Message-State: AOAM532DFIliWBeqK6OFINEK1llDWXAEzkYfXlNmB7d68GqiXNLzgJ/9
 lPjJnUiUwpVkko+d+z4psH1evw==
X-Google-Smtp-Source: ABdhPJzZgZlPVxalo/dypQeWv4Cwppyshto4X+oJyhUotLChHHAfc/2T7uQBH4Jll0VagBpYCxynwA==
X-Received: by 2002:a17:907:1623:: with SMTP id
 hb35mr22011728ejc.209.1643739674758; 
 Tue, 01 Feb 2022 10:21:14 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id ry6sm6601713ejc.45.2022.02.01.10.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 10:21:08 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 391C01FFC8;
 Tue,  1 Feb 2022 18:20:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 16/25] docs: remove references to TCG tracing
Date: Tue,  1 Feb 2022 18:20:41 +0000
Message-Id: <20220201182050.15087-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220201182050.15087-1-alex.bennee@linaro.org>
References: <20220201182050.15087-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, aaron@os.amperecomputing.com,
 robhenry@microsoft.com, f4bug@amsat.org,
 Luis Vilanova <vilanova@imperial.ac.uk>, mahmoudabdalghany@outlook.com,
 minyihh@uci.edu, cota@braap.org, Luke.Craig@ll.mit.edu, pbonzini@redhat.com,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Users wanting this sort of functionality should turn to TCG plugins
instead.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Cc: Luis Vilanova <vilanova@imperial.ac.uk>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20220124201608.604599-14-alex.bennee@linaro.org>
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
index 4290ac42ee..ec9a687cfd 100644
--- a/docs/devel/tracing.rst
+++ b/docs/devel/tracing.rst
@@ -413,88 +413,3 @@ disabled, this check will have no performance impact.
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


