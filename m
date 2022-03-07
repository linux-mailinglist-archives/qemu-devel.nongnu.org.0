Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 030494D048B
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 17:51:16 +0100 (CET)
Received: from localhost ([::1]:44570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRGZn-00011B-3p
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 11:51:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGVy-0001QQ-Db
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:47:18 -0500
Received: from [2a00:1450:4864:20::431] (port=33631
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGVw-0007jF-Ks
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:47:18 -0500
Received: by mail-wr1-x431.google.com with SMTP id j17so24366977wrc.0
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 08:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xpC06DHhxVDLscz6Xo2CkegCEhzKYUxBYFFVOWGgdvk=;
 b=SIqeN4AtLpG9QCpuK4KlXzRTsmeuUtwHAJ6m5pZMNg/XPLrpK6p7G2BkS6MsYsIHso
 S+/2NuSTbjQ2PPEg3Bv1JxgpR+G36OReOaV/fN6GLwR3LGcSWoeuMUlSGO8WeXky1QNG
 f9OojReDk8Z5KMd+0ZcuwBtPD0yR8VXexKXLCYvYvOB4g8vMCl6iEB5Hh2XDPuftoWk4
 TN4IKmh3BRHulQ+uIRiTv+YgA+/h1dLJojTAyGHCbkXA8W02/fW4MDwmBxJN8bJ98Kuy
 A8g3v+jQvLhIFCJ4nRGKwWSdH2DbYqHjM4362bmLzASgDhh4CtYv4Lg1/hgI1P34hDqj
 +upw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xpC06DHhxVDLscz6Xo2CkegCEhzKYUxBYFFVOWGgdvk=;
 b=CboB/6hH3jH0eK6wygrIGkiRsnyHCB8ChNYDdPrzZ6rKlIEjDw61A52uJWY19cE7rP
 l1iHOm6LaeUQlNQaBZudL9O4L6/q0aN2wVW7o6yi+CsSgWjkE2lCoAfcUUYpZhjv0SIf
 yhLG56oJ4t1uwGCJlpGydO8TAXFai86ZN32Clam/pu+GzgHshhch1xCkj9D3Sgi9rftw
 r7b7AFiBeLjA7U/MfIcfRVXIaroJ56iWCcUxyWlLH5u9ncLVjl6HrWy156QMVZSIgNEY
 zZOlA+UX0iRIDfDCk0fpS9+zamW4cLlVD0ABgoFF5et56CGY88xubl0Ng2lH/PUu8x0i
 mtSQ==
X-Gm-Message-State: AOAM533TpExL7ayCcS3t3tqhp2CxBmlF5EdtcfXrt89DgegwrBD90sXL
 GnGdvoj0ztDQiLMdj1m/I0fW1RQvP/Fj5A==
X-Google-Smtp-Source: ABdhPJyYqX89o75e8QOpUWCcB9fnjQTBtGK+ibx/acEvRqrWCafg8M7GE+ejesMPyjQL1e+HtJzhgw==
X-Received: by 2002:adf:f1c1:0:b0:1e3:1381:7bd5 with SMTP id
 z1-20020adff1c1000000b001e313817bd5mr9076519wro.450.1646671635234; 
 Mon, 07 Mar 2022 08:47:15 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v188-20020a1cacc5000000b00384b71a50d5sm13806652wme.24.2022.03.07.08.47.14
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 08:47:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/18] meson.build: Don't misdetect posix_memalign() on Windows
Date: Mon,  7 Mar 2022 16:46:55 +0000
Message-Id: <20220307164709.2503250-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307164709.2503250-1-peter.maydell@linaro.org>
References: <20220307164709.2503250-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently we incorrectly think that posix_memalign() exists on
Windows.  This is because of a combination of:

 * the msys2/mingw toolchain/libc claim to have a
   __builtin_posix_memalign when there isn't a builtin of that name
 * meson will assume that if you have a __builtin_foo that
   counts for has_function('foo')

Specifying a specific include file via prefix: causes meson to not
treat builtins as sufficient and actually look for the function
itself; see this meson pull request which added that as the official
way to get the right answer:
  https://github.com/mesonbuild/meson/pull/1150

Currently this misdectection doesn't cause problems because we only
use CONFIG_POSIX_MEMALIGN in oslib-posix.c; however that will change
in a following commit.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220226180723.1706285-6-peter.maydell@linaro.org
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 038502714ab..b541506c1c5 100644
--- a/meson.build
+++ b/meson.build
@@ -1619,7 +1619,9 @@ config_host_data.set('CONFIG_CLOCK_ADJTIME', cc.has_function('clock_adjtime'))
 config_host_data.set('CONFIG_DUP3', cc.has_function('dup3'))
 config_host_data.set('CONFIG_FALLOCATE', cc.has_function('fallocate'))
 config_host_data.set('CONFIG_POSIX_FALLOCATE', cc.has_function('posix_fallocate'))
-config_host_data.set('CONFIG_POSIX_MEMALIGN', cc.has_function('posix_memalign'))
+# Note that we need to specify prefix: here to avoid incorrectly
+# thinking that Windows has posix_memalign()
+config_host_data.set('CONFIG_POSIX_MEMALIGN', cc.has_function('posix_memalign', prefix: '#include <stdlib.h>'))
 config_host_data.set('CONFIG_PPOLL', cc.has_function('ppoll'))
 config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
 config_host_data.set('CONFIG_SEM_TIMEDWAIT', cc.has_function('sem_timedwait', dependencies: threads))
-- 
2.25.1


