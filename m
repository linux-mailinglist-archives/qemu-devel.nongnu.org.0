Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE283D3E40
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 19:13:02 +0200 (CEST)
Received: from localhost ([::1]:32798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6yjN-000104-9n
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 13:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6ybC-0000EN-Pf
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:04:34 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:53020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m6yb9-0005Xt-PL
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 13:04:34 -0400
Received: by mail-wm1-x333.google.com with SMTP id n11so1201390wmd.2
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 10:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zMe5H1a+/C1TAikKZLajf0ozQCEH2WafWwjdB2KPJ2c=;
 b=FH9bXPKqQD0FFpETGHmmXk6rhkJfMIG4rmz1o5jnIUKDdb++C9VHrzqSpvd1rbZ/Sf
 1Xs08E8zbedwbRxAUVl+xVMuKaOkfkcxQfBoYN6eSREvD/6GPtz0ujxfpgEgpbpRfkpv
 Q7LuZoJpdCQBpiWGHgSSkf7jF9xP4jQ4dBIkLtTmAvgRHZsThOc3GLGIOHYK00kKA4MC
 tsnStA/mO0Ic6GLD/dzBRbFvQ3UJ91+/gPdQyvdMf68TLhBsWDNtgEhwbYfwMuCIDVZl
 cIIFpZWJ8Rf2LhOygP7S/t0NNK2VibW96CwNAvm/eSINl5UAEWLikEM5dT1FNey8ASGb
 FapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zMe5H1a+/C1TAikKZLajf0ozQCEH2WafWwjdB2KPJ2c=;
 b=aDEHpOd7lEtxfC7irEChrzo3KtmNkdICyXZdSwgekvqPHQaqNf4NkZ+RohwDJ/j6ZI
 6e2jkTN2k8WcVfIV7wcfUCcC5WnbuLxKaPNC1kt+ARR9ZspQpbxm8wNBVnCw0kqOxIrX
 9LoZTSB++n/P5CiK5FVDf9ltuELw4sfWES+6GAysnsuEeUsDCculuxdYIkMOTbeJR3Kp
 Iv0bG+EoxNov6qanEacNsse7kKq6Ex2vT2BnnLUcSH/+SPEMgwvHIAyvKOcNbeEOHVbM
 S8QWLHa9IViMgsHfUNtq26Po45RnmcmLbFKeLvGDHyP3UknKmda9xG3LQbgmBq+QrTw3
 fpoQ==
X-Gm-Message-State: AOAM530A6PatBe7yWN7FdgIPDj8s/gap63pC04duvehFgIuXVeJi7fJu
 wuAKWS3O4TXx5z2MbuprTzjLTQ==
X-Google-Smtp-Source: ABdhPJyLZ7ynEv77JWsUNZis9uGcZKCXb23N8/6H52KILQVJYeCGJe/EqiqxcHcEBLH8/SX3xW1BYQ==
X-Received: by 2002:a1c:4d14:: with SMTP id o20mr14395947wmh.89.1627059870514; 
 Fri, 23 Jul 2021 10:04:30 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r19sm35877896wrg.74.2021.07.23.10.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 10:04:30 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DE7451FF93;
 Fri, 23 Jul 2021 18:03:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 07/28] contrib/gitdm: add domain-map for MontaVista
Date: Fri, 23 Jul 2021 18:03:33 +0100
Message-Id: <20210723170354.18975-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723170354.18975-1-alex.bennee@linaro.org>
References: <20210723170354.18975-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Corey Minyard <cminyard@mvista.com>
Message-Id: <20210720232703.10650-8-alex.bennee@linaro.org>

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 0074da618f..efbbb15643 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -18,6 +18,7 @@ igalia.com      Igalia
 intel.com       Intel
 linaro.org      Linaro
 microsoft.com   Microsoft
+mvista.com      MontaVista
 nokia.com       Nokia
 nuviainc.com    NUVIA
 oracle.com      Oracle
-- 
2.20.1


