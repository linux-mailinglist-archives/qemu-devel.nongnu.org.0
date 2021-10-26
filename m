Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B662D43B07A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 12:48:21 +0200 (CEST)
Received: from localhost ([::1]:37574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfK0C-0001xD-HK
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 06:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJra-0005wi-OP
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:39:26 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:33578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJrW-0006V3-BL
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:39:25 -0400
Received: by mail-lj1-x234.google.com with SMTP id d13so14116555ljg.0
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 03:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vX3anCL7p/sqIpPM9TjWKfgkBjpmlyBhYjlGB6uRLsk=;
 b=qVJnSN5DJNo++fpnFHeu5Uoe1o/CE8BzmFpMkIyu7ECVPbDrQlhvB4ytpzECzqD4lB
 mejM7rfjcVjPMawX9atW8uMjfhOLYRyp0o6qRikOoFTIqA4NkKAwnJwbo+Sad8FCq0BN
 EnJX7FipgFdqRGzKMDHgIAoy5oL+tLYDrsec8I4QFpOsumNQraZkHwny/B8zbX+jQNOf
 wG8CemtNJYbNF78UaIcY5vARYOX0j2Opt5zBSsEpkMbPW+Esna1OH8rZrU7eYmkooNz9
 N0Th0kPrgV7ZqjDalLsIGWWyCqBj96I2wBpivP4M8pHOks/LQmbnk+MhY11ADHd28BPY
 RVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vX3anCL7p/sqIpPM9TjWKfgkBjpmlyBhYjlGB6uRLsk=;
 b=lhfjy579Gl6rqq0r87qhy4RpWfkepaR2NGe6wyvyECGv/x2JVZhJykqUi1XCbQlqjp
 Lzgu0fmu2Gw+0Y6yheJG76zlu915v8HQBKrbVXUw8AbqAa8rBGhOJ1g30/mWsCtSfEWe
 1u37cE/laYBem8GjOA2QDSIiHuGbhCbTtFH6Lp1QOeoTI6r8I2E/wGR7LvhCbBcXNobH
 mT/gUTdq7ab37hLplvWXylF8VdfNjumRgC750bzlFAe89oe5uOXr8jX/+VnjaolcFPKW
 c3nt4YeCCjq7Z2cUB6BGhCV25ReRjbYrNxz+N54XQCA9BOFcRs97KxqRdsy33V7dJdpm
 eHKQ==
X-Gm-Message-State: AOAM531qOSWU31/G7DDBpnRP+Q6TyrtM1xzpn5H3Xt1RDUByMs+cU624
 183WCgYZnTqG9r2ErdILietIrw==
X-Google-Smtp-Source: ABdhPJzuEWr4yz+lb0bMm+2iqvux5RiRYkC5HWNt/wydY5G/a9wY/qohMNoMYFtvVtNG1oQy88rMQw==
X-Received: by 2002:a2e:b88f:: with SMTP id r15mr25556345ljp.474.1635244760373; 
 Tue, 26 Oct 2021 03:39:20 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e7sm713149lfr.294.2021.10.26.03.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 03:39:19 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A2B8F1FFB7;
 Tue, 26 Oct 2021 11:22:36 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 21/28] docs: remove references to TCG tracing
Date: Tue, 26 Oct 2021 11:22:27 +0100
Message-Id: <20211026102234.3961636-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026102234.3961636-1-alex.bennee@linaro.org>
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=alex.bennee@linaro.org; helo=mail-lj1-x234.google.com
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
Cc: fam@euphon.net, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 Luis Vilanova <vilanova@imperial.ac.uk>, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Users wanting this sort of functionality should turn to TCG plugins
instead.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Luis Vilanova <vilanova@imperial.ac.uk>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
---
 docs/about/removed-features.rst | 13 +++++
 docs/devel/tracing.rst          | 85 ---------------------------------
 2 files changed, 13 insertions(+), 85 deletions(-)

diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 9d0d90c90d..641aa22112 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -594,6 +594,19 @@ the upstream Linux kernel in 2018, and it has also been dropped from glibc, so
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


