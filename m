Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1893BDA0C
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:22:19 +0200 (CEST)
Received: from localhost ([::1]:35078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0mtt-00024m-4R
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:22:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mfE-0005HR-03
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:07:08 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:39560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mfC-00077j-0h
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:07:07 -0400
Received: by mail-wr1-x433.google.com with SMTP id f17so1875580wrt.6
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 08:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xE0TnieLHvCOXePCMLwmdgueEmPs2D/V6rLGpH6wEAg=;
 b=ya+TBbNbb8CqVpGPyP0rhz/m/cYtPoevzikVbePStoKnagVdAJNopA4ZICqTRfIpt3
 xDep0Bx0kTpNVbZRlTuMdQANpG/iakrjtc+U0xZvJukf4LTh+lGmFTCnnanbc717i0KF
 twtJiqHHxyROlF8h+fl/FVRqZ9jj9W6FYxQ+PSdA9OD0mhBaVNLbyOWuWwkMIVHiLJCi
 Aj33W6XajAaNWSYWTPj58z0/piwHW4/cT/ZtGHiFkt0jAC2KtlwPKwy1RRBe+3yg/Q4G
 XfNu4NsEfMChPomCPwZB3tCcK5A+lJVI6v+tHhkxBwjDoAG9xh1Cut3arVWLIxXrsSFG
 0FCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xE0TnieLHvCOXePCMLwmdgueEmPs2D/V6rLGpH6wEAg=;
 b=EWy2vID/FQHPQVSglKASeinQpWb1EZqOkMEknrlXFgjM+ZL4MMT00ED7BqSJy49xOe
 fqEtTJRs4l9QVsIe/b5EokWo7hnXwFeNvmLcAkN5uoLduygvaEAivFyV9g1JLWA4CU2t
 T3lmpEJv2LrkEsepoT8MS1LxD0AKQJ95i3H+tesz7kUmrzRzqxi72deDCo7hpy82TPqG
 pOWlbSykC2Gct4c00BDUs7JjQSITxHgw0eftAIat2WYYAfr1QjG22qCXlfpjyO43Qlr8
 tpYvkdQHBjBQF3bgWXWsK1GFuP2x+XDIB7/gtKzw4ltlHaestNdoR2aSF3IbSS4Q4frC
 VT7w==
X-Gm-Message-State: AOAM532gaYZzkHjIBFWgRLJuPAU+CLO3OEdCM/eieBSOT/gDReHDQGVe
 5AqrtoLH6qMO6qZLB1yi09cgZQ==
X-Google-Smtp-Source: ABdhPJzGXWdELpfuNNnU0rjnGFYLDtdTaEBrRcgl4ArUQ9qXqOExDzdQvfzFw4by01JT28sEhMkdGA==
X-Received: by 2002:a5d:5043:: with SMTP id h3mr22431888wrt.333.1625584024623; 
 Tue, 06 Jul 2021 08:07:04 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s7sm17518597wrp.97.2021.07.06.08.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 08:07:02 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D40931FFB3;
 Tue,  6 Jul 2021 15:58:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 28/39] meson.build: move TCG plugin summary output
Date: Tue,  6 Jul 2021 15:58:06 +0100
Message-Id: <20210706145817.24109-29-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210706145817.24109-1-alex.bennee@linaro.org>
References: <20210706145817.24109-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
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


