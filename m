Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AD53FFCC2
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:10:42 +0200 (CEST)
Received: from localhost ([::1]:46938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5De-00066j-2T
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM56y-0005ym-Ip
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:03:48 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:44710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM56v-0005U5-BN
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:03:48 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so3085103wml.3
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 02:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6pTYsL1Hep9qUvvKYQw3eO5QWV8nz4ZZRsJUYLQf+Cw=;
 b=YUC7Fc2s3ATPv+tGHaSsck5CdaSX6/TE5v9dcgXQP8FbjFXGsznNMXAMK9wuuNcvBi
 8MfDuk/Tb2ml32Zo8YskASjUA8qN0FhOVTcxYfMvGPLXMAQ6JqPSGXiB7omrxSIP4Bl3
 OJUGKX/CNXPBMv5TzEJRrfWFD4WlIB2+MMvbL28LXsAo5PToxIsf6it8QZ0QOkcghOAJ
 MLwfK9Xkf5I5vRdI7mjnovmlgVeUIP7HrDl4Xa5T5Ilviw6oSUwRJ4fCkwIfsIptD8sF
 KYKpwnyaHEbEFOy+oiY/TfX2Qn2rD21L2Yr+UzYiukFdXiUAGSo/vBY7x5i585Ru9prO
 +J8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6pTYsL1Hep9qUvvKYQw3eO5QWV8nz4ZZRsJUYLQf+Cw=;
 b=RmCWHoZri0S31KJ1F9h5ZgQJ0hq8nTzPBxLP4aPOMzcBiGVW20Bp6TN2oHmnKyv8a3
 4IWN8T0o0wcAcyBeuAOQQndxR+BE0QqhnREa4y53NzzA7q5vZvL9ujr5FyM/ugv6ocO8
 a5/14tXao5K+29VCkvr0scxvB2RJol9qNwv22IAH6fx1oYLw/cYXleDAiaBps+c59M+T
 fPc48b4mQQaujDZuzcN0htoU9Cx3rZC9HoT8G4Je+sx9VRWknZVP95aBWd2v7YtU1tzk
 RWiboXoP/ruT1LR0gCTsVHzb+msiMIBEEk2DuUjsr+BF2fE32TTad7WOm/TBVMJpA7yX
 ekIA==
X-Gm-Message-State: AOAM531qvllayLwMNtUZ57SnIkSM0fTZ4b++1fmwy+N0DIzgWb2p3ySP
 HOW6RhDQ6XNW9CBtfT3F1LlYgQ==
X-Google-Smtp-Source: ABdhPJzA6ykm2PVboVuWfVhfF5YjhW8xt9U7MWcV+WVUKVJJm6h4WkZVK7wX8e7kJPHRWPNT6vna6g==
X-Received: by 2002:a05:600c:3641:: with SMTP id
 y1mr7220019wmq.181.1630659823158; 
 Fri, 03 Sep 2021 02:03:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c14sm4189740wrr.58.2021.09.03.02.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 02:03:40 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EEE0C1FF98;
 Fri,  3 Sep 2021 10:03:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 01/22] plugins/execlog: removed unintended "s" at the end of
 log lines.
Date: Fri,  3 Sep 2021 10:03:18 +0100
Message-Id: <20210903090339.1074887-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210903090339.1074887-1-alex.bennee@linaro.org>
References: <20210903090339.1074887-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210803151428.125323-1-ma.mandourr@gmail.com>
Message-Id: <20210806141015.2487502-2-alex.bennee@linaro.org>
Cc: qemu-stable@nongnu.org

diff --git a/contrib/plugins/execlog.c b/contrib/plugins/execlog.c
index 2de9f0d7d4..a5275dcc15 100644
--- a/contrib/plugins/execlog.c
+++ b/contrib/plugins/execlog.c
@@ -67,7 +67,7 @@ static void vcpu_insn_exec(unsigned int cpu_index, void *udata)
     /* Print previous instruction in cache */
     if (s->len) {
         qemu_plugin_outs(s->str);
-        qemu_plugin_outs("s\n");
+        qemu_plugin_outs("\n");
     }
 
     /* Store new instruction in cache */
-- 
2.30.2


