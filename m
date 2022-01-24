Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A441F4992CA
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 21:29:39 +0100 (CET)
Received: from localhost ([::1]:43886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC5y6-0007o4-Oa
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 15:29:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5ro-0005D7-2Z
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:23:08 -0500
Received: from [2a00:1450:4864:20::62d] (port=42914
 helo=mail-ej1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5rl-0004JP-MG
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:23:07 -0500
Received: by mail-ej1-x62d.google.com with SMTP id m4so24734304ejb.9
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 12:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uGJA3TY/aTTlz7qnu3uqNbW+4kPxLuwEw7s9yABXdK4=;
 b=LvkHCl3ivmYkExyB3BLaJPnwdxhm4T/Ude2JckvdSEkh+X+OseqIFh2Yp7xcWTv6QC
 0rSNmLAEFf52KWKMzGwRpwTZYCgvsQN/SYmyO/5J7gEJx0KAHTiwtPc6qvY7rUxl+w4f
 k8dgpRS2wSKpmnVX4KorfehZ0fuVOsP3Yxg6LB8PrmKBqUVAmsdLZGyHKikD1+b7qywZ
 yBqBeZKXzYBd+fSt5025W2Ot1H/J10EE8LliTs95NccTud04BFutCLbtZWc8EIh3LOgC
 VIie6jUtiNIF2SYkOTHjmdpeZ0EqC0JObIM0lsz/1LUStrtwlcIDd6ywB5Auq9kCIdRP
 iCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uGJA3TY/aTTlz7qnu3uqNbW+4kPxLuwEw7s9yABXdK4=;
 b=cG5wVQhwgHSfzj7UaZ7kC+U81U/s8uEuttsEE8vU62yREdKFmKGomt3JudsE4Nuq0d
 zmFM5TL/8pQFz8ua3qTHWJxDlsvvyFpNn1Vcv9sGNQzlhx5CZRIhFNm5ocw9LitIYmRM
 XjnHeVthktWZ1SviMWtVur913jOVVvy0eKEr4tKb/U7TNaqUdGXfceL+O11hAdBW7pIP
 ncVB6HnFmmRFY4Xydbh5dbgKkZfnpd7ipW07LaDlbuPSPJe7aNQqcEyvfa5JqG5Ab6YH
 3/G5S5iFWxvyg6NVYp49KgYuZe/NNFyImnZdWjYAv9EXbPHKQcRCE/DL0bB7z7ss8i4c
 MnSg==
X-Gm-Message-State: AOAM532Mt2T0b3h2vwjcxT40a91pQcBR+jQoYUH9uACUlqzRAP4E2Jlv
 bCefnPZgI43QKhDej0T9JiqVQw==
X-Google-Smtp-Source: ABdhPJwJ59XNoGe2rLuRp+SmnnHaQMh4qo/a4ZGwPboPQv5U0c/dextn9jkthz3Qc2hXp5hGTJpH+A==
X-Received: by 2002:a17:907:2704:: with SMTP id
 w4mr13625585ejk.134.1643055784125; 
 Mon, 24 Jan 2022 12:23:04 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w22sm5279816ejj.64.2022.01.24.12.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 12:22:58 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1C06E1FFC7;
 Mon, 24 Jan 2022 20:16:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 15/22] tracing: remove the trace-tcg includes from the build
Date: Mon, 24 Jan 2022 20:16:01 +0000
Message-Id: <20220124201608.604599-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220124201608.604599-1-alex.bennee@linaro.org>
References: <20220124201608.604599-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
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
 Luke.Craig@ll.mit.edu, Paolo Bonzini <pbonzini@redhat.com>,
 kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Cc: Luis Vilanova <vilanova@imperial.ac.uk>
Cc: Stefan Hajnoczi <stefanha@redhat.com>

---
v2
  - dropped includes here instead of next patch
---
 include/exec/helper-proto.h | 1 -
 include/exec/helper-tcg.h   | 1 -
 include/trace-tcg.h         | 6 ------
 trace/meson.build           | 1 -
 4 files changed, 9 deletions(-)
 delete mode 100644 include/trace-tcg.h

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
index 573dd699c6..e279e33d4d 100644
--- a/trace/meson.build
+++ b/trace/meson.build
@@ -62,7 +62,6 @@ trace_events_all = custom_target('trace-events-all',
                                  install_dir: qemu_datadir)
 
 foreach d : [
-  ['generated-tcg-tracers.h', 'tcg-h'],
   ['generated-helpers.c', 'tcg-helper-c'],
   ['generated-helpers.h', 'tcg-helper-h'],
   ['generated-helpers-wrappers.h', 'tcg-helper-wrapper-h'],
-- 
2.30.2


