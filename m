Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC2739DEDC
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 16:34:58 +0200 (CEST)
Received: from localhost ([::1]:40198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqGLB-0005iU-A6
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 10:34:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqGJV-0002yq-Pp
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 10:33:13 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:38662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqGJT-0000Ld-SB
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 10:33:13 -0400
Received: by mail-wr1-x436.google.com with SMTP id c9so9201982wrt.5
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 07:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PP68Do5QSeD/5zyGX2xofOgTOB6AlQQTS51+z1GqTzg=;
 b=qEiaTXyMydU441xSzvH5B6hY6Dr7ykb1MPWcA27AMV/PJzGMHwuwxkP5HvdDh/e06z
 UVg4FI6b45t3p6128T71iQWMC1hPr8Jzdf6DMRaSC2T/Sw9CbgJNpwPWKHu2Wq32Z0lf
 ImraOL1K4cCHmbI6gjPFR0NDpdvr/qacTTmO0Yfn5Qhw8r9VyCKsNXUlEXcrlsf7Ihv0
 zOnEu7HxZRGrmVVxwsCx8ABrW8yZGyYZEhA6ZW21mEkjz3ix9MPy7o0O6KygTW3B2zk0
 6GbuNIwv0hYLTJNNYnA5dpyxOQS+yP4gI9JlL+hJFVmrfXpkdl1QIXmbF43uIeCOliWJ
 ytFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PP68Do5QSeD/5zyGX2xofOgTOB6AlQQTS51+z1GqTzg=;
 b=glHNzToZcP6RdWvfsZ8SCqAZJPP6gxg6+dDhn+T1sKFf8WYIYkkB0nLdBhQsCJp9wU
 jq8XQgidXTiYFaCp4K26V6xAkLwMiwh9qHhFh5wMc4dwMzWFYVzRGb4VPyKv68N/Tz2B
 cPbmsVW0QS6oWP/8FWKEMkGQC08uBz1mYoO26Mk9jLzM3tiACJ0nmGhgVebtsY4FiHnH
 6Z2XBqlk2SeCBa5UzPn6/Q+uyF/Ht7Ih9+66p5ZV0E/7/n4+011CWoMNoN+mks2a/Hls
 dULLT+C1sV4ST7eBCmakP6ocxc+r0WlFm3HV0krcdc5qgTDL34pJlrWInbk4e/Ax0Po6
 iVoA==
X-Gm-Message-State: AOAM532cAfWVp8q5qEHi8F2uuLAz8Xmc1WpNNcNXr1qm5NPWEZ1i9yJV
 WLzjxhTUadNwr/Mk8i2rSrMVvQ==
X-Google-Smtp-Source: ABdhPJy+1HqydR/jH407JnNG/ygnS7Y/ccb0tcCW9UUmCKT3vWTXJ8wb7SXOEcFBZMRAEXzsIz6RVw==
X-Received: by 2002:adf:d1c3:: with SMTP id b3mr9220981wrd.110.1623076388877; 
 Mon, 07 Jun 2021 07:33:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o20sm6724108wms.3.2021.06.07.07.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 07:33:04 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BDB1F1FF8C;
 Mon,  7 Jun 2021 15:33:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 2/8] meson.build: fix cosmetics of compiler display
Date: Mon,  7 Jun 2021 15:32:57 +0100
Message-Id: <20210607143303.28572-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607143303.28572-1-alex.bennee@linaro.org>
References: <20210607143303.28572-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If you specify something like --cc="ccache gcc" on your configure line
the summary output misses the rest of the cmd_array. Do some string
joining to make it complete.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210527160319.19834-3-alex.bennee@linaro.org>

diff --git a/meson.build b/meson.build
index 626cf932c1..d2a9ce91f5 100644
--- a/meson.build
+++ b/meson.build
@@ -2537,15 +2537,15 @@ summary(summary_info, bool_yn: true, section: 'Configurable features')
 summary_info = {}
 summary_info += {'host CPU':          cpu}
 summary_info += {'host endianness':   build_machine.endian()}
-summary_info += {'C compiler':        meson.get_compiler('c').cmd_array()[0]}
-summary_info += {'Host C compiler':   meson.get_compiler('c', native: true).cmd_array()[0]}
+summary_info += {'C compiler':        ' '.join(meson.get_compiler('c').cmd_array())}
+summary_info += {'Host C compiler':   ' '.join(meson.get_compiler('c', native: true).cmd_array())}
 if link_language == 'cpp'
-  summary_info += {'C++ compiler':      meson.get_compiler('cpp').cmd_array()[0]}
+  summary_info += {'C++ compiler':    ' '.join(meson.get_compiler('cpp').cmd_array())}
 else
   summary_info += {'C++ compiler':      false}
 endif
 if targetos == 'darwin'
-  summary_info += {'Objective-C compiler': meson.get_compiler('objc').cmd_array()[0]}
+  summary_info += {'Objective-C compiler': ' '.join(meson.get_compiler('objc').cmd_array())}
 endif
 if targetos == 'windows'
   if 'WIN_SDK' in config_host
-- 
2.20.1


