Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F543BD9D8
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 17:13:35 +0200 (CEST)
Received: from localhost ([::1]:37314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0mlS-0001Xy-1C
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 11:13:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mf7-000579-6q
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:07:01 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:36523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0mf5-00072h-6x
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 11:07:00 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 t14-20020a05600c198eb029020c8aac53d4so5372667wmq.1
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 08:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R6IU1p4TeEKJjoh2orwJx/m6ECV4RVPwTG8bCIFZfuI=;
 b=sXKlS7QMjSJftIpdVRMAQM1orzJ5oKvcGPZFGNBrOmKMfvQRqe9QNT+00dmRx27kks
 j9jCd+OcwNbW3BaPRYDrThxiXBcjoyLBgo1iK9rUKz6ztNd8uIgsIoyWeF7k+1EM0zlj
 EEPr8G1For7VGTKNggDPXsOt5kPd4WsugoTMxZE9W1vYlgzhgjRcAh0UZM42P3eSvbw5
 mohAH7pjhLZHflfeMeOlmaF69eFjhk9c+rziZ7/hHcE3RlDB6zJmwDDEGLmA4EHQz98s
 4c2yj/yLZAe0GY5aLdFxZT8nABbpP7td0H91goIuZMPA3Ib1Pw23uTWCzoOaN4WefvKF
 Qo4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R6IU1p4TeEKJjoh2orwJx/m6ECV4RVPwTG8bCIFZfuI=;
 b=d/9vEGXHlKWGgw+YxIAMpiQbC52u4wV5gV21V3J4aK1Tbr7AVNvEoAa42iNNx8Ekqv
 l/owx9Jlvt/8l1zLWJSwC9R/9aqNWT966Wlvv7IesfY78MwN21hsZA2HDBFzK7hfxYFk
 LtPluKQ/SJiG3xQnutY/fnwwdP+pyRnbjTVXrU+NlPbAbpOz/P6S4HNT2DB3zOKAxnu5
 Ep8aPT+wLUt0gXTtw9C1yYALtBlIo9S0JHRP0KTOEFjzySHATM4XnTxCqaq4b33rSiOW
 IxUYCf71KdWKYwR70ze5VdROVagNk0AZazpOAbCi4Srvxt4tSX8Qut1yClpgCtAoXlp5
 BCXQ==
X-Gm-Message-State: AOAM530r3NL+VCpAK6sC/wpPwavYmfgofvbC1Cy6AJ+kCxxohXWw3mh/
 Gnad9I43fNbcuwobcMMSSY21oA==
X-Google-Smtp-Source: ABdhPJyNxv4hsHIY/LADbXx9dVfxKJhwPnXo1I8LKHSGvY0zyUkLrvHyAD3IL8Qu0RX0hZL9gJbfkQ==
X-Received: by 2002:a7b:cb53:: with SMTP id v19mr20605224wmj.127.1625584017818; 
 Tue, 06 Jul 2021 08:06:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h15sm16525030wrq.88.2021.07.06.08.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 08:06:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3A8011FFB8;
 Tue,  6 Jul 2021 15:58:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 32/39] contrib/plugins: enable -Wall for building plugins
Date: Tue,  6 Jul 2021 15:58:10 +0100
Message-Id: <20210706145817.24109-33-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210706145817.24109-1-alex.bennee@linaro.org>
References: <20210706145817.24109-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
 crosa@redhat.com, pbonzini@redhat.com, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Lets spot the obvious errors.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/plugins/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
index b9d7935e5e..17e6e2ec4f 100644
--- a/contrib/plugins/Makefile
+++ b/contrib/plugins/Makefile
@@ -24,7 +24,7 @@ SONAMES := $(addsuffix .so,$(addprefix lib,$(NAMES)))
 # The main QEMU uses Glib extensively so it's perfectly fine to use it
 # in plugins (which many example do).
 CFLAGS = $(GLIB_CFLAGS)
-CFLAGS += -fPIC
+CFLAGS += -fPIC -Wall
 CFLAGS += $(if $(findstring no-psabi,$(QEMU_CFLAGS)),-Wpsabi)
 CFLAGS += -I$(SRC_PATH)/include/qemu
 
-- 
2.20.1


