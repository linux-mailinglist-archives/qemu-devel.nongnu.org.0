Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B263C19F4
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:38:50 +0200 (CEST)
Received: from localhost ([::1]:47412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ZrF-0000L4-80
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZWV-0002Le-3r
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:17:23 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:41844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZWT-0007VV-7m
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:17:22 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 a5-20020a7bc1c50000b02901e3bbe0939bso4749032wmj.0
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xE0TnieLHvCOXePCMLwmdgueEmPs2D/V6rLGpH6wEAg=;
 b=azYmKppuhCB+MOQfzl4y+i0BvKDcBKy/7cc6G7HWV0tuB6PdBFaJZJv8Ab47PTh7RT
 8j4wJjIReIbabhigq+a/RmlRxeSfGQNU7jlW7uAtbIANN//3+/yzxwxFKS8vDhXNdrdU
 NgyacgpK40CChRW1rNYuSw+tWjPjoc4hDldujUUf0fRDO5JV/J06lPUGzjZZa17w5Zq0
 iRKjMy0ZSyfUAzNI6YSVj40Fet+OsADRYIoIBEGAstm1ecI3gFkCbdqHGlSBxMmNjbwj
 /MtaCAz7eF54+xu6FmUlAvm4cSSx1cjD/wSVjIkwSoLzprZaMAt45kmvKhyxsbU9IApL
 CllQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xE0TnieLHvCOXePCMLwmdgueEmPs2D/V6rLGpH6wEAg=;
 b=KxqtypeczlNb7X218G31gcNiMnFw0NEzd+Gu6A3QmwAx3jzRoplCAvNgygtgvMGrKY
 +3TQW1HSjVMvyiLeCExNOtqvdxp94QSKT8EXiU5uQu7yfWhjEoOuL+EVNSpqicINc806
 EkgoeQjKLstr4mLMqOmz8UF4LGlO2nFYvlBJsY92bXo97ReEWjeBSRb/j3vLcjwbppOm
 3RomIuMlmE8uqlyGqqHuksr16y78pCG/MIktnm/BImWNib7LfSH+dAkA+25WLjc8YqtU
 I6DoJ1/d+IOdkdbVyR3JLAsGxfWPYwTBjMjg1Zl08CGHtyKsrQn/V0FOjzXfYPsLoism
 TY9Q==
X-Gm-Message-State: AOAM531pRsvvXcoHAKsVaNL0IY0vTX7bt7Cdq8fPlm+KpUuMYRXLW7wt
 RJ5Lb8EPewtStGgdeLieURi1Rw==
X-Google-Smtp-Source: ABdhPJxJ7nG5R3Z8cf5sactrN8+QHv2U7VsBvhEW5s7TyaPcvD6Z0e/cZ5Szlh1OAWl6RtiWoMmYBQ==
X-Received: by 2002:a7b:ce05:: with SMTP id m5mr7262266wmc.64.1625771839903;
 Thu, 08 Jul 2021 12:17:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r18sm3334531wmh.23.2021.07.08.12.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:17:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0BBD01FFB3;
 Thu,  8 Jul 2021 20:09:45 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 28/39] meson.build: move TCG plugin summary output
Date: Thu,  8 Jul 2021 20:09:30 +0100
Message-Id: <20210708190941.16980-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708190941.16980-1-alex.bennee@linaro.org>
References: <20210708190941.16980-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's put it with the rest of the TCG related output with the
accelerator.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 2748721d71..9b5d53b6d0 100644
--- a/meson.build
+++ b/meson.build
@@ -2737,7 +2737,6 @@ summary_info += {'module support':    config_host.has_key('CONFIG_MODULES')}
 if config_host.has_key('CONFIG_MODULES')
   summary_info += {'alternative module path': config_host.has_key('CONFIG_MODULE_UPGRADES')}
 endif
-summary_info += {'plugin support':    config_host.has_key('CONFIG_PLUGIN')}
 summary_info += {'fuzzing support':   config_host.has_key('CONFIG_FUZZ')}
 if have_system
   summary_info += {'Audio drivers':     config_host['CONFIG_AUDIO_DRIVERS']}
@@ -2853,6 +2852,7 @@ if config_all.has_key('CONFIG_TCG')
   else
     summary_info += {'TCG backend':   'native (@0@)'.format(cpu)}
   endif
+  summary_info += {'TCG plugins': config_host.has_key('CONFIG_PLUGIN')}
   summary_info += {'TCG debug enabled': config_host.has_key('CONFIG_DEBUG_TCG')}
 endif
 summary_info += {'target list':       ' '.join(target_dirs)}
-- 
2.20.1


