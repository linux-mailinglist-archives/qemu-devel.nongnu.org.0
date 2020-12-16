Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1484A2DC4C8
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:56:34 +0100 (CET)
Received: from localhost ([::1]:48576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpa6L-0008OS-3p
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:56:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpZyl-000870-W6
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:48:44 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpZyk-0002P6-FK
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:48:43 -0500
Received: by mail-wr1-x42a.google.com with SMTP id r3so23874982wrt.2
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EOE6lMtpdtX8yCY0FVrCGb12yJtAwMVTaHa0nn1C+LY=;
 b=zDkZ7YEZEsJWqGNlL1/xKKJG2sk9WcVMjSTOVlPqhG7gwSd9t/7vEjyWjTUQZVHwAM
 iaSm5ylYqJS4tHnSGK3B3PWkeju0HErggNXvpHQNZ0SFUD2kV0cI0jJeN48b0QdI1Kik
 R5ErAPvseP6NeoSl8znMZ2gCuRtfXotvkcc5itEfevLn6V0EGpIkPZnRWwNIkxHuYyIo
 TafSRCdjv2+e2Ex7R5E6dBGREkRx7JILH3Use7gQ1634RKiR39hjBKa6TCVtmBFIpqdh
 0EH20cckHxto5JNa6MlHLpkhmQ3uJMRLhvrPYR4xdetQQUCYrLXj51UokODnpWjlm870
 EF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EOE6lMtpdtX8yCY0FVrCGb12yJtAwMVTaHa0nn1C+LY=;
 b=CUcmcSKM5yvJe34S5Z+c5ukiB3pteLNNXqIPBBxW1C7SI6mZxaQ/9ocmpZ5YzgK3Iy
 YYFT/QO8dS07OImrOAzgHKMwwqKyU1ZmTsbmfwDT/HdoPfe89qa16yIKmGxOJ1ZHkAUo
 GgxHXL7oMFeBH95NRgW7bunEz3zHxBQm4axNA4W1551z6lsMjk8JUx6bTKrWqqeUvkte
 Cb0gtJX2qhoBKbnD5cBaMsEVREfjThz7K8xgfVjZBhEBkOLgZFHktwUkgxnj+rkM45Lj
 AQGKLZCbuV/pJl1aLf/wiXCP5CMoh2pkpHy7smwRtMGJ8KlG61d5j0ezDpd6QByRFNLU
 t58w==
X-Gm-Message-State: AOAM531suXczKjJLRk701lWP8G1TMe34X3nlGjeUtfarxILeAI9uvyPZ
 wwJu4PxHeWDizfM1WuyVXuXpnA==
X-Google-Smtp-Source: ABdhPJz4hVGJleYxr6o2dQHJApQVKpR7qihWugriz8KXya0H05iqe5uO6cXvANyBD/Ud4BGWj/qRVQ==
X-Received: by 2002:a5d:6751:: with SMTP id l17mr39194176wrw.73.1608137321151; 
 Wed, 16 Dec 2020 08:48:41 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h9sm3810620wre.24.2020.12.16.08.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 08:48:35 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 811261FF93;
 Wed, 16 Dec 2020 16:48:28 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 07/11] gitlab: add --without-default-features build
Date: Wed, 16 Dec 2020 16:48:23 +0000
Message-Id: <20201216164827.24457-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201216164827.24457-1-alex.bennee@linaro.org>
References: <20201216164827.24457-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SPACE_RATIO=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20201210190417.31673-8-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 2134453717..229545bc03 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -521,6 +521,13 @@ build-without-default-devices:
     IMAGE: centos8
     CONFIGURE_ARGS: --without-default-devices --disable-user
 
+build-without-default-features:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: debian-amd64
+    CONFIGURE_ARGS: --without-default-features --disable-user
+    MAKE_CHECK_ARGS: check-unit
+
 check-patch:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
-- 
2.20.1


