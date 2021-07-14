Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C17023C8AD0
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 20:25:44 +0200 (CEST)
Received: from localhost ([::1]:53184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3jZn-0003Fj-Qk
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 14:25:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jVH-0003PI-Ko
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:21:03 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:42855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jVE-0001x0-Sq
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:21:03 -0400
Received: by mail-wr1-x430.google.com with SMTP id r11so4351724wro.9
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 11:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CrQjb6Pxtv945NaahMUAJsjTn5MQ/UC9n5iDlWijfEY=;
 b=nazXEyalg9WImnRDr/2wNkn2SMzggIGDIINW8l2XXl4FKH20G1TUeMT91H+JmEuZ7s
 63L0D/QcR0oPVkpoz45vssF9q0sAePZbHZ4fNcLFRm2yUcnNsTrjEqwS9xXPYUEisee7
 qBr92lA0MCMxAHgnV2DFxzxHcEKfPH8r7HU0OmUYtOakpjSIejh+fq8D4dAdQl1ysVCM
 3ZxjYGt1xX4wC1Mrklz/RvtDBy5cf2ORqDG6FAgakoF4zBfBBLaDmc7NDFFKyIQKJqO1
 ZwrUWKKsG07fhk/7k5LTxMGlkwTDHAUukoMbBsqxK76N9AlVVx9/IJxdKk5RffHGTPsX
 HgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CrQjb6Pxtv945NaahMUAJsjTn5MQ/UC9n5iDlWijfEY=;
 b=Bvu+i4kfACsPalpmNDBOj+cR4swTnnWEEIPGTVjtzCPeqz3oQOfipxs2Juq4cigtoW
 ekopP7Af/LcFuBWt/TxpJHe4ihuiomOjSR+ckMPY4BjTC0c9p9x/+R45F+YTbuEbfRYa
 OIGVe7eu/6aUnSh24YGvDWkum3tszyWmtIhYSOK3RfEnuVepjSbpTsDxtKfS2KMHpp+7
 vvYDN1t2bzuHGKGD8niEYbk8RmH2hr9QaDmOk8PzaKJHJMea4t7UA4NLlR/KcFEOnsq+
 WzZlMjDpgdJ1/Il/IXh0tTPHByou00Z5LK1o8wJNG7mJIs/KUlU/auwNzDakhMtjH0UI
 J+vw==
X-Gm-Message-State: AOAM5323fqCZSNYm/tTHSqbPOxnDJq8dlKb5O69/TexI/ImLLxLqqO8E
 3XIWhqodGJnLD7Rcqu4WlP/MeQ==
X-Google-Smtp-Source: ABdhPJwSo2NkAAN0DjAJDXMh3XLfMC6I01aAIhp1VEPPSljYKoQQLrwTVBJpHOWwM9D02G0F8HqCfw==
X-Received: by 2002:adf:e78c:: with SMTP id n12mr15116500wrm.382.1626286859161; 
 Wed, 14 Jul 2021 11:20:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m5sm5799238wmq.2.2021.07.14.11.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 11:20:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B3C901FF87;
 Wed, 14 Jul 2021 19:20:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 01/21] gitignore: Update with some filetypes
Date: Wed, 14 Jul 2021 19:20:36 +0100
Message-Id: <20210714182056.25888-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714182056.25888-1-alex.bennee@linaro.org>
References: <20210714182056.25888-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Viresh Kumar <viresh.kumar@linaro.org>

Update .gitignore to ignore .swp and .patch files.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <79262dbe1f7888eb02e1911501eebafa6f2f6400.1616583806.git.viresh.kumar@linaro.org>
Message-Id: <20210714093638.21077-2-alex.bennee@linaro.org>
---
 .gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.gitignore b/.gitignore
index 75a4be0724..eb2553026c 100644
--- a/.gitignore
+++ b/.gitignore
@@ -13,3 +13,5 @@ GTAGS
 *~
 *.ast_raw
 *.depend_raw
+*.swp
+*.patch
-- 
2.20.1


