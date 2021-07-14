Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4AF3C8B09
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 20:35:57 +0200 (CEST)
Received: from localhost ([::1]:54648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3jjg-0006eA-8R
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 14:35:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jVU-0003sX-JY
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:21:16 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jVS-00027Q-Q9
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:21:16 -0400
Received: by mail-wr1-x42e.google.com with SMTP id k4so4354872wrc.8
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 11:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HtD8Ct71Em353AdTEf41RlffhcMm3UNFvY30/YQQ3KI=;
 b=bSb2VDd3xQdpBerh0WYzHY/V6GzMKU7LjYcnDp/g9QVPg6B8vW9mtxeE+V3XUvbPje
 vBUUvrn7Fg3PqB/JV6X/aH4UdCyhYYUVvQF1t1hzq0d8Zlg7BDsdt+BCzIG8nl5vowlS
 dSPOYH6bRqc9Wgjpv0+s9IlDc2o3y8JrEW6ih1H5P/mSwAoo1AJVq/obGvfNb8KY/GbC
 uv0oQ5lVe+R6NxW36/tSiGq7uUgHWGm71IzFfmkXl1rYcYGv8RsBQeElKTWC+AviEpWq
 +99N0rzkQPig9bualOz+RPHEAIjfZOOZDKvonC738DhchddcEbDppA4c6GPeDseP31kH
 fhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HtD8Ct71Em353AdTEf41RlffhcMm3UNFvY30/YQQ3KI=;
 b=hbluYcg5D1xvOcFNk68vOF5TOpr1bpv4ak7iaQtvHPybESlZmxZ/xKlRgYmB7r38j/
 txnpCqD/gzqPXhgR/Ou0ItqFs+c6NHvibSS298ygVssmxg3zGn6SkTuMQNGa4CSZ9If0
 +n/xCyyGSXsNgt8Z7NEFacXBGHsskQIqmWjoP4oIG+QMpEjGeK35CjXIK8D8KhudvGbE
 ODC0L6pCH8A7ZVoKeFSAuVEInGkLJSZU1ljdQcxIGJtveO3bAhzAb85D0iEPRYJFhaXG
 ceq+evY0Cc+c3lJqy3p9rtzF/tatCfVjb8s5/pp4oxzwwuZMBy05nKJbcjTVfXCurv+i
 94lA==
X-Gm-Message-State: AOAM532Zjvp3ZrRWoe7K7zn/4aqaBOT4nE/BSq9Ik52c/ILTPkkAT9Y1
 I0HVV4cuQvlFVuzok5Iy+vkp5A==
X-Google-Smtp-Source: ABdhPJwq4c/z4jymP3pcp7MfXtx28dZt9Noy5NeZeJckEgSwQWHHfg7VyazXLuakwqtPGEttTRSy7A==
X-Received: by 2002:a5d:4e0d:: with SMTP id p13mr14718310wrt.372.1626286873395; 
 Wed, 14 Jul 2021 11:21:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j10sm3507715wrt.35.2021.07.14.11.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 11:21:06 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AA3AD1FF9A;
 Wed, 14 Jul 2021 19:20:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 11/21] contrib/gitdm: add domain-map for Eldorado
Date: Wed, 14 Jul 2021 19:20:46 +0100
Message-Id: <20210714182056.25888-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714182056.25888-1-alex.bennee@linaro.org>
References: <20210714182056.25888-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: Bruno Larsen <bruno.larsen@eldorado.org.br>,
 Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Cc: Luis Pires <luis.pires@eldorado.org.br>
Message-Id: <20210714093638.21077-12-alex.bennee@linaro.org>
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


