Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5553C8AF4
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 20:30:00 +0200 (CEST)
Received: from localhost ([::1]:41112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3jdv-0005oM-Ve
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 14:29:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jcC-0002ob-TA
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:28:12 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:33390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jcB-0006bU-90
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:28:12 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 g8-20020a1c9d080000b02901f13dd1672aso3930503wme.0
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 11:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jYaBi/XiZB5JkqDxgSTsu4+BTdKL38Q98SeKr6ohLVI=;
 b=itMG77oFQIVQ78nnHMak6YYfSno7hTEl0inVv2O8RSXGghVHnU175IH3AarzjqoBth
 Jd5ny1Pvfuv9NGAO83MTVQBAaPuNGiBlc0H6NEzxd5/CIfpp+t1+eRnO+JXzI2CHER/Q
 li2vuuZ/GD54j+Iw2D8ZJ3Auv8UVX4tRxFWt54mf3oCOQN9K/SgJ/iNtkXJuuDJFevaM
 aDA+pRRdN9Zic94T3VOrj8GQswgMFwqDIpHH695KseTp7cctH8gZv5px8oXb653Cye02
 FLgAIwQR6WL9gtP0gyZbsOtjb645DWamtpQZhiV0EK5ppfXofsGLE4jCOtuN2XKENztw
 OSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jYaBi/XiZB5JkqDxgSTsu4+BTdKL38Q98SeKr6ohLVI=;
 b=WR1OGlUGzdbjHKrMQJUX9ViBcgwZMpBwRz/1e/BWzDoxZIkhaN/E40SwQ337MchKAC
 1EgxHzYgVMkABxs9VjWyfvCWkR802zvyGli6b3+Ie02/GQzAFTZqPjDb7/UyjQkPsAI+
 ar7iFlpn8oV2EtaDVv1BENfUzbfO2avC9bBpEPfL1UaJoWmvb4xqt9zt2xushIXygWji
 HEL/rc8zCNoy9BYbIZSalxGpiHmB5ZTxfcW9glre05gubqsnkkyXW3A3U5WGNHtpRPhI
 U0WAMkXufoTq6XLOuNVw3DqsH9wOKMGkxgCt14ZcblJay0v89JyrTscK0FMRjPdNSdfD
 csvw==
X-Gm-Message-State: AOAM530GgbnMe6pmjjPPz+n/XZPrpYVWT4Il3SBWhX0YCI0bI1PdPlGF
 ZjzzToMPzr8U+1aMp7DJIONVTQ==
X-Google-Smtp-Source: ABdhPJyY+VfzQ+UfcYmCyQkdTwpDUGd2mk7vE5MYqK0SZT9h8Cmyaf6h/jx2hgn4LQDTJitly8M6Mg==
X-Received: by 2002:a1c:f616:: with SMTP id w22mr12452126wmc.131.1626287289358; 
 Wed, 14 Jul 2021 11:28:09 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z7sm3407449wrt.47.2021.07.14.11.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 11:28:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D8BFC1FF9C;
 Wed, 14 Jul 2021 19:20:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 13/21] contrib/gitdm: un-ironically add a mapping for LWN
Date: Wed, 14 Jul 2021 19:20:48 +0100
Message-Id: <20210714182056.25888-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714182056.25888-1-alex.bennee@linaro.org>
References: <20210714182056.25888-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I think this mainly comes from kernel-doc stuff imported into the QEMU
tree.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Message-Id: <20210714093638.21077-14-alex.bennee@linaro.org>
---
 contrib/gitdm/domain-map | 1 +
 1 file changed, 1 insertion(+)

diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
index 27b8fbdf8a..5ac8288716 100644
--- a/contrib/gitdm/domain-map
+++ b/contrib/gitdm/domain-map
@@ -18,6 +18,7 @@ ibm.com         IBM
 igalia.com      Igalia
 intel.com       Intel
 linaro.org      Linaro
+lwn.net         LWN
 microsoft.com   Microsoft
 mvista.com      MontaVista
 nokia.com       Nokia
-- 
2.20.1


