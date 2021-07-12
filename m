Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E21F3C5CFA
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 15:12:01 +0200 (CEST)
Received: from localhost ([::1]:36622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2vj6-0001hO-2o
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 09:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2vGy-0007JD-HP
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:42:56 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:50946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2vGx-0006G4-1A
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:42:56 -0400
Received: by mail-wm1-x331.google.com with SMTP id l6so3028148wmq.0
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 05:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8bCBhKBxzb/qFxkz11jaikGPG2zqXOY5uZnEdjQKerk=;
 b=nixLLqER5kBtTMoZ/nYDOsTXNFXYUDhbGRq27rBTfOLJ+C7lk663jQM8eDiQkJd83O
 H27sYPf8AZqrSmj2JhGOV3rOmSRKtmG3wGSzX+eTlkYFjvjsG1N8/Qg2s2zomCG6M9pQ
 Pc9LJgDiKBl0+rmWxjO3NanFKcmejlucriYAjD2C5+91/eQXkC+eFlMKTGLXJHUairtv
 QzLJqEZW4kMf7kXP73EMMg48STtZJtQSy+ZLKiRspApQnbqSOTHU0FD57pCCAgQqGv16
 9nuc7ObOtis3TksPOealaqwiKJxl1nbdI9JFWZ+EPOzS26Tl5BwVZSgCq86e5tySqYzc
 /h5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8bCBhKBxzb/qFxkz11jaikGPG2zqXOY5uZnEdjQKerk=;
 b=JKL3GV1omcWMSB3Okk2xIKknJv/2YQ/mIq/6ssAsLpmDsgAve04WSAvJ/NFcY69EEa
 GImcwtsG2v6IxU5x6zBLTCd4VGDgOzSI6km3EbCQQVoBP0FOByEKHpodNocxFUob54gJ
 U2/58SQ8VWIGddJmBRztLyEDGl4PLTQXzPme2HcqB2ZfM+g7iwgdiiCdBHJyUcVbsmE5
 ULNpzi2qyrnidLtLkCzsrtNOZRFg2KlefPDRXMqPnV8SGz9hgELXgqlcbNZtwQrPjrMW
 pJTIGOVrZp8SE4WMrsUdIZ9aBh49X2uGqP2k033z+f9JUvR9L6CMPowFhTb9Twr6VtS6
 X9Vg==
X-Gm-Message-State: AOAM530YQg9PdhyVm0T2g5qCS6MQk/6k5hF4S7Fust1GNZ66YRu4tEAh
 NN5nLDIKQ8QFB+sgGTDNW3SlAg==
X-Google-Smtp-Source: ABdhPJzypAczKcjYiH6ZFKiXD/ZVQ028ukohdP7jtw7fSB0B45Ln85h+4pIbhrUwfp7J1m7M6RWE/A==
X-Received: by 2002:a1c:ed08:: with SMTP id l8mr53883589wmh.38.1626093773649; 
 Mon, 12 Jul 2021 05:42:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f15sm5896610wmj.15.2021.07.12.05.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 05:42:49 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CEAA11FFB4;
 Mon, 12 Jul 2021 13:26:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 28/40] meson.build: move TCG plugin summary output
Date: Mon, 12 Jul 2021 13:26:41 +0100
Message-Id: <20210712122653.11354-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210712122653.11354-1-alex.bennee@linaro.org>
References: <20210712122653.11354-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's put it with the rest of the TCG related output with the
accelerator.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210709143005.1554-29-alex.bennee@linaro.org>

diff --git a/meson.build b/meson.build
index cea8196e53..ef0d54bb75 100644
--- a/meson.build
+++ b/meson.build
@@ -2740,7 +2740,6 @@ summary_info += {'module support':    config_host.has_key('CONFIG_MODULES')}
 if config_host.has_key('CONFIG_MODULES')
   summary_info += {'alternative module path': config_host.has_key('CONFIG_MODULE_UPGRADES')}
 endif
-summary_info += {'plugin support':    config_host.has_key('CONFIG_PLUGIN')}
 summary_info += {'fuzzing support':   config_host.has_key('CONFIG_FUZZ')}
 if have_system
   summary_info += {'Audio drivers':     config_host['CONFIG_AUDIO_DRIVERS']}
@@ -2856,6 +2855,7 @@ if config_all.has_key('CONFIG_TCG')
   else
     summary_info += {'TCG backend':   'native (@0@)'.format(cpu)}
   endif
+  summary_info += {'TCG plugins': config_host.has_key('CONFIG_PLUGIN')}
   summary_info += {'TCG debug enabled': config_host.has_key('CONFIG_DEBUG_TCG')}
 endif
 summary_info += {'target list':       ' '.join(target_dirs)}
-- 
2.20.1


