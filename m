Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E503C8244
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:59:22 +0200 (CEST)
Received: from localhost ([::1]:33264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bfm-0007Vv-0z
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:59:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bQF-0005G9-Ba
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:43:19 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:33657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bQD-0000D7-TV
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:43:19 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 g8-20020a1c9d080000b02901f13dd1672aso3104175wme.0
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v1e1YqeV5XOXZA0y11isaIRg/PKZ8B95bCMqrO9Bx/o=;
 b=Q26kbp2Im4onNhoA8/prEbWL1KRGhk/CCD2bVIhOTEVgm6jgeMwsuBZuwm8Knwa3KT
 zsw0imNjwkSo1aYhb5VVedrpwnaxUSUjYaHMGM1JM9cxPCtfZAHpKKgcyERAEkDFIJS0
 /9orqArLVpbHjpX5wGOVZO+MZZS86gwhJSeoN8TCdEzos1ZGZeLDD7CoICHB63WV7VCX
 FwS7JzWejXEKC/JJes6wHyzN//1h+5ZkM809sBaLhOWHLEio9qazpgZ3OJOW7fpJhIyD
 FI0VQflUr5AYsWZ0+GdL6lMTkf4g/aN2Xp2UIWT9+NMpIcza5ZALQwPXkclJrk45aYpM
 LPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v1e1YqeV5XOXZA0y11isaIRg/PKZ8B95bCMqrO9Bx/o=;
 b=SglQJiu7rYVlkMRZIcRUDsY5qK08979QyyIx2LNTGNJms549bLvW9/XMUYVZxjowfe
 nADj2cmVp/RRf/Fh2HV4Tup8vR8ljOl4rDZbIFr2smwqmOGpH64uIkbWP+TbqQfRGPl5
 o+gvIt4re+q41KsQ6ywPhfJjgmcqmowR2zc6YD06QB96gQGOvFNfGU/lTjLe1VIeptBq
 hc+fsyqVyI7EPE1/9WRw7Fg+sr5a1J38xqf3NpzPfvspAPD2QBVswX5cP22RoA40IfHm
 LPUWG6KDEtlVeJddrgbxofwmnFX3HcPp1YpMULUiZYii8yQbsT1yz68pM7GYWQYu1XVV
 oltQ==
X-Gm-Message-State: AOAM532wW/hAauP0uNz11TZo4Bi82vg+2mEOGOJgWdIsAeWwZMn8xsZN
 tzwPUTmECyzVo/lJatfpTShemg==
X-Google-Smtp-Source: ABdhPJyrdkqzURyM3YnifCmpUgMv8hUDCamqdrbz6QYuQ2JYq0kDCEBOWnhMCAcmnJ6i2CkQebW+FA==
X-Received: by 2002:a7b:c40c:: with SMTP id k12mr3093668wmi.166.1626255796749; 
 Wed, 14 Jul 2021 02:43:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f7sm1885158wru.11.2021.07.14.02.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:43:13 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E6D8C1FF9A;
 Wed, 14 Jul 2021 10:36:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 11/21] contrib/gitdm: add domain-map for Eldorado
Date: Wed, 14 Jul 2021 10:36:28 +0100
Message-Id: <20210714093638.21077-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714093638.21077-1-alex.bennee@linaro.org>
References: <20210714093638.21077-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Cc: Luis Pires <luis.pires@eldorado.org.br>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index beeb24341e..41875c9e75 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -9,6 +9,7 @@ baidu.com       Baidu
 bytedance.com   ByteDance
 cmss.chinamobile.com China Mobile
 citrix.com      Citrix
+eldorado.org.br Instituto de Pesquisas Eldorado
 fujitsu.com     Fujitsu
 google.com      Google
 greensocs.com   GreenSocs
-- 
2.20.1


