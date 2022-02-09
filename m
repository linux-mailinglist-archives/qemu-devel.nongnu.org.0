Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15ECC4AF6BD
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 17:31:44 +0100 (CET)
Received: from localhost ([::1]:51316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHpsc-0007sw-Mh
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 11:31:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHnu1-0000Xg-U1
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:25:01 -0500
Received: from [2a00:1450:4864:20::42f] (port=44865
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHnu0-0001Lz-A7
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:25:01 -0500
Received: by mail-wr1-x42f.google.com with SMTP id k18so4311395wrg.11
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 06:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BVs06yq2xpLk3BuTgn2wEdh+5ZuM90acH+yY+MF8S6E=;
 b=ql6mey++FoZoqkvO+AwzeoCjVqUj7ykQuVMbYU2TII7QzELZwxXEHjn8q4m2r9NTmm
 JZYgEZ8WqUhfqaTXZoxQKn0LuTAHCCNJAtzJpv2vxfw61nVCsoqPcbJ1jGXIZOnR7PFJ
 BaXTNT8VQhbSzoSNlwaliussvSDrm4JqlEZfqXYaPw+MmzVcuIsZpIzCE4Rzr1rkaUsr
 MEdDAYnnPv9LkoEovhW3IwO3xLqgGuO/Q98lK5d0L4U+S1pnnf71CEL0h6OT6zGHKik+
 QCym902Bt9FQ6Hf9Dh6FusR/hvyfyhdOusuulDQ+h9GiUlemD28uQ2PoBln2TFrwx4YG
 UEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BVs06yq2xpLk3BuTgn2wEdh+5ZuM90acH+yY+MF8S6E=;
 b=OEMpvJeyZhlDZ0kyEBcQJ8CGEyBZVfVah4rNCa9rUWVGi/gNvZ5Z1CUuB72iWYRXZI
 fNkQkrRG5YAHoOuItUXE4KBBgcg6EbDz4r0uxCeznWRR78kaWViNDe3cC0wB2pnECkll
 VbS9uA7tIqJFyrxuvoJWuUwaWllRF6YBozeu8X1qfevH5akOIbKWaxEanrNq8grZQBf0
 XoHEq0EPZMjKJilQuXMfA45xeH/yHBRydFm5eCRQ+u902+X4TKZ9BKPTSaasd2vezx+m
 0uAyLSXn7Vlv6kyi6V/K4Kb0rt1qKVMuowI8PdVNVIlJwyAFU3yDhMheyKHvj0xA/3zx
 f9bw==
X-Gm-Message-State: AOAM531GDpuFZDY1XC59oJs9nsbEK5kkP79pbTO2f7n36/74dhbq4IRE
 S+ma2DBn5f7TjJOpLMY/xvijuw==
X-Google-Smtp-Source: ABdhPJxKLpru26ShLbnyxe1EN1Irq3rfwiFjD5xsWG0QuT95ZeZ7UevfAYStd2t0sYOG7bxyhyqFkg==
X-Received: by 2002:adf:b610:: with SMTP id f16mr2293317wre.627.1644416699030; 
 Wed, 09 Feb 2022 06:24:59 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b2sm17623041wri.88.2022.02.09.06.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 06:24:57 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 01B2C1FFCB;
 Wed,  9 Feb 2022 14:15:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 19/28] tracing: remove the trace-tcg includes from the build
Date: Wed,  9 Feb 2022 14:15:20 +0000
Message-Id: <20220209141529.3418384-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209141529.3418384-1-alex.bennee@linaro.org>
References: <20220209141529.3418384-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Luis Vilanova <vilanova@imperial.ac.uk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Cc: Luis Vilanova <vilanova@imperial.ac.uk>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220204204335.1689602-20-alex.bennee@linaro.org>

diff --git a/include/exec/helper-proto.h b/include/exec/helper-proto.h
index ba100793a7..c4b1bda632 100644
--- a/include/exec/helper-proto.h
+++ b/include/exec/helper-proto.h
@@ -38,7 +38,6 @@ dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), dh_ctype(t3), \
 #define IN_HELPER_PROTO
 
 #include "helper.h"
-#include "trace/generated-helpers.h"
 #include "accel/tcg/tcg-runtime.h"
 #include "accel/tcg/plugin-helpers.h"
 
diff --git a/include/exec/helper-tcg.h b/include/exec/helper-tcg.h
index 16cd318b83..3933258f1a 100644
--- a/include/exec/helper-tcg.h
+++ b/include/exec/helper-tcg.h
@@ -59,7 +59,6 @@
     | dh_typemask(t5, 5) | dh_typemask(t6, 6) | dh_typemask(t7, 7) },
 
 #include "helper.h"
-#include "trace/generated-helpers.h"
 #include "accel/tcg/tcg-runtime.h"
 #include "accel/tcg/plugin-helpers.h"
 
diff --git a/include/trace-tcg.h b/include/trace-tcg.h
deleted file mode 100644
index da68608c85..0000000000
--- a/include/trace-tcg.h
+++ /dev/null
@@ -1,6 +0,0 @@
-#ifndef TRACE_TCG_H
-#define TRACE_TCG_H
-
-#include "trace/generated-tcg-tracers.h"
-
-#endif /* TRACE_TCG_H */
diff --git a/trace/meson.build b/trace/meson.build
index c4794a1f2a..29f3bffd5a 100644
--- a/trace/meson.build
+++ b/trace/meson.build
@@ -67,7 +67,6 @@ trace_events_all = custom_target('trace-events-all',
                                  install_dir: qemu_datadir)
 
 foreach d : [
-  ['generated-tcg-tracers.h', 'tcg-h'],
   ['generated-helpers.c', 'tcg-helper-c'],
   ['generated-helpers.h', 'tcg-helper-h'],
   ['generated-helpers-wrappers.h', 'tcg-helper-wrapper-h'],
-- 
2.30.2


