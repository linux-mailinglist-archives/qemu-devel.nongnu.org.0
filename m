Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9473C2626
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 16:42:42 +0200 (CEST)
Received: from localhost ([::1]:43040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1riD-0007sf-IN
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 10:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rdL-0004jJ-OB
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:37:40 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:45643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1rdF-0000By-Ig
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 10:37:39 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 u8-20020a7bcb080000b02901e44e9caa2aso6441152wmj.4
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 07:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KOHjsPYSbu3jA24kyzt0tq90eAKTZSBrFYknNG6hTgw=;
 b=EOH9m7u7AGxea1QqIhmJ4V5d+qz2dibjtXh37z0Ir66BGyXyF3HGVy4kwyUvHITM0t
 F6SHOFb3IhSOycasXIuHLQbHUnyrCcUMWsS1ExwfPQwpiguE5TjfdnZ1Mmk7VCgjkrt0
 hfi69NKRsJKlcgL5jl0l3h4ioMs2J2lzIMz5b1lASIACWW1qM94vPPR3bWcQitLUl6/U
 5GQ9GtLfA1i+tME2zrhXKeL/CLyolmWhkhZeigQjFJOwQQAAuJkKTcj60hIBTi7dDMbD
 c5vo+qwF2FCFEqpTc/Hd41pv46v93r/3yEn+coe9RFdK3bbxiGU/yJJw1w4X8sr3h7vX
 pMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KOHjsPYSbu3jA24kyzt0tq90eAKTZSBrFYknNG6hTgw=;
 b=hpAukXu6xdWflxEC5cXMelULP9g1WNDz9wGrDs7xOugizihL+qoBjV308ouRheTvsX
 ktUOMeyhv1o5fjo9j/UL6+25Zjl0ujn2vS3Y7RLzZZgKxGZr62x2TFXE7Rkg+LulhlDU
 cqb2qBQ7vFPnDCmMLS+7GkvTRBhL9J819Hr+D/jVmZRshV05xD9XhOiBwoyJSWFsvCq2
 ocy01BPZoqPwMwNMIFM7ME8zS/nzRetpKde/PH3rv3+eu0eS7fbPu52axC9ATBJfruWZ
 34mNmHuAYon6bAIqDWNxBPngeX2TDKkw0eZ3Wz55jzOmzpYMHx9SmgRSyX4P1N0B/zdC
 cuPQ==
X-Gm-Message-State: AOAM530r+8tH3c3EoTjyB5ASHpUfjyDjNAjsInOwWF+DgoilY5Oepny6
 GecpJFirEsIxgo9FN1xQHJ/Hyw==
X-Google-Smtp-Source: ABdhPJwC4215T8J5n1zrxRSbHlpGDYuLHWh8+DJK4oU45//plxqS+NqHHqURSdr73tqqdcnCIF1l+g==
X-Received: by 2002:a05:600c:154a:: with SMTP id
 f10mr12064311wmg.26.1625841451337; 
 Fri, 09 Jul 2021 07:37:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q5sm4901001wmc.0.2021.07.09.07.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 07:37:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 574671FFB1;
 Fri,  9 Jul 2021 15:30:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 28/40] meson.build: move TCG plugin summary output
Date: Fri,  9 Jul 2021 15:29:53 +0100
Message-Id: <20210709143005.1554-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210709143005.1554-1-alex.bennee@linaro.org>
References: <20210709143005.1554-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
 kuhn.chenqun@huawei.com, Richard Henderson <richard.henderson@linaro.org>,
 f4bug@amsat.org, robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's put it with the rest of the TCG related output with the
accelerator.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index ff7a9f8b4f..ba680addda 100644
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


