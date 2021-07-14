Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FB93C87C3
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:34:25 +0200 (CEST)
Received: from localhost ([::1]:45566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3gu0-0007sO-OK
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3geT-00050P-FF
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:18:21 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3geR-0002Ls-5w
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:18:21 -0400
Received: by mail-wr1-x42f.google.com with SMTP id i94so3694649wri.4
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/lMniXsogkugA8ZDZhDsdubmKkZI/PlOffMKgu4hGm0=;
 b=Nwn4JYD6MNBUh4iAGR8551J1DNBcKLrbzbruJQQr35uwilYqOgXt/Dq1OX+AZoXjnL
 RL8KFOXEC80YiiepZdhQ4RaiMHIJvxDyFICmH2NYnNd0novtFK6IbvlKEGvc5czsGGyt
 619RfRnjNiIKCWn/WlJfY7/uGo2jNj3aMcD/o7/1OpMIaupo8TrULJtOmntPlu580xAG
 7tRsEcNcQUUcXaIkuasJebiJGsxF5wUucWSVmNU0+6vf35eV+uQRUjmfcVq0W6dOMC8s
 FBpNoqwMPP0Q2WEjFoEIjq4AwogsTbTVVTpWAWtW+u1ekfXGlWbiS2pYJycHvj/nKlW2
 LQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/lMniXsogkugA8ZDZhDsdubmKkZI/PlOffMKgu4hGm0=;
 b=Y0k5aXPP9tDRo1sjPrnkqMsAz11NH0ProrQ6P/yXlGe69x74IheUNurT2T040QmrqB
 zQkyQ9HRA/xZzCim50KCAEX5pA1HTQYD0Fd6y+rY1z2QDSR8jRnLb6X5pVXt8caTlyZp
 dY85n72FdV2FR4Cd+ayc5K2nnd5e5jES4YmQbLSGCoLt5fb0VtBAF8uUnKG1WWktwa+V
 SNnzWncm+1cF6O6KmLjMVh7wTValIu73Xs4+kFgv34fKSSi/iy1Nz8kLCkIXNnyLubtm
 spfXMzwfxfK55LMvBz+z0KzaLcMqponTMjuKhATpFzZjHuX1fjpyVqQtXhT01aM9O0cP
 yCvA==
X-Gm-Message-State: AOAM533ap2FFP0IoP+5t09cJ9X5LsJyHbcPBurUz1etXxqfigx8eQcWy
 X/af6KCkH0JK2uK3jYUPj6gxQg==
X-Google-Smtp-Source: ABdhPJw34NVG75buMAW67iz3kcXhXkSnIjsYwVRAdU9QvOdsFL0VFYW5zVxfRJpJwCcBj9fP9st98Q==
X-Received: by 2002:a5d:6506:: with SMTP id x6mr13406330wru.86.1626275896155; 
 Wed, 14 Jul 2021 08:18:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s1sm5718430wmj.8.2021.07.14.08.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:18:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2F7461FFBA;
 Wed, 14 Jul 2021 16:00:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v5 32/44] tcg/plugins: remove some stale entries from the
 symbol list
Date: Wed, 14 Jul 2021 16:00:24 +0100
Message-Id: <20210714150036.21060-33-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714150036.21060-1-alex.bennee@linaro.org>
References: <20210714150036.21060-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The OSX linker is a lot fussier about these missing symbols.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210714101623.17046-1-alex.bennee@linaro.org>

diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbols
index 4bdb381f48..40b4ff3821 100644
--- a/plugins/qemu-plugins.symbols
+++ b/plugins/qemu-plugins.symbols
@@ -8,9 +8,7 @@
   qemu_plugin_register_vcpu_insn_exec_cb;
   qemu_plugin_register_vcpu_insn_exec_inline;
   qemu_plugin_register_vcpu_mem_cb;
-  qemu_plugin_register_vcpu_mem_haddr_cb;
   qemu_plugin_register_vcpu_mem_inline;
-  qemu_plugin_ram_addr_from_host;
   qemu_plugin_register_vcpu_tb_trans_cb;
   qemu_plugin_register_vcpu_tb_exec_cb;
   qemu_plugin_register_vcpu_tb_exec_inline;
@@ -32,7 +30,6 @@
   qemu_plugin_mem_is_store;
   qemu_plugin_get_hwaddr;
   qemu_plugin_hwaddr_is_io;
-  qemu_plugin_hwaddr_to_raddr;
   qemu_plugin_vcpu_for_each;
   qemu_plugin_n_vcpus;
   qemu_plugin_n_max_vcpus;
-- 
2.20.1


