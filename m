Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FCA2B6BEE
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 18:40:15 +0100 (CET)
Received: from localhost ([::1]:60458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf4xi-0006k5-Lr
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 12:40:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kf4uO-0001qX-0D
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 12:36:48 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:45040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kf4uM-0006O9-6V
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 12:36:47 -0500
Received: by mail-wr1-x434.google.com with SMTP id c17so23995072wrc.11
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 09:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ei6m6g24qzbcjxbzjmWWksZvgukx3CamFhIUp7GgYoc=;
 b=g5N5Lrp0KMD71fbF2iCZ0qk9FPwvALBqs7nWnHFM0Ty+TGJ1Gvifp7MXVsiSTQDDIj
 5ysgFkdsVP/Z3aV6GKE06LiQ1skXl9HRJa5fpDyCVTdY9bfxP/t3/OatpMXqKc//xk66
 Q77fyaorT6nQ0PzpJrlcDVd8aP/mSnCD5dWyS+QpAYpbjL4RJZPi5q+scwkt9yIIpMXj
 mZ4KhhNEMpTqrbrZp3qnRtv8WD/zh74+5vndthBCnaou+PF0f7xq6TAv2My6ffSMgHDg
 nOslQF0qBNGRea1dH8Bps8x0X/nqgMzu84S2/xqAxQYKbPv7VtHDai8p722e7IhnUk4u
 IXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ei6m6g24qzbcjxbzjmWWksZvgukx3CamFhIUp7GgYoc=;
 b=caA2rX2mWs4hwqstXIaBGZVB0/80Nt6TxOj9s3SBI/lEzfTnwVkctM6pHsusmSrW3r
 KBUP9OFDiRhorglcVc8e8txuUhGlN9daF9gm6+WpLFQlQKaGrQP7vZ65DLnwe23ZcTnU
 do4LVg1apRXqP2FiLQt5JzvTlQGwYXnIv8s038ZsVvgLR+Qgkrk0B1tGuKIyqJRVnhjx
 XjIaZRDD8jLymiJEJlCEDI3YweSEAdWvxnm30sJDmT6MZ4ltZ7hjVYb01/LAKt5XsHy7
 f+pbgAZP4WVtuHHM5gkQSxtsmr/++GWvJ6xt41f2VTzGI1M0QgwvhWqjlabOoVxDZd4n
 /tRA==
X-Gm-Message-State: AOAM532gtHO/7zAS5vhNZ3lNKImeu5K1Rp0vJVkWRImdGfYoz6ZKUYL4
 UAw3QL7aOYgWrD5QzS1D2v9D9A==
X-Google-Smtp-Source: ABdhPJzxn/OByqFD8rUlEMBXeTRUFSZkn8Jwt+FZX5up+Th/8iutZe1MrMpYtiBmyHjoel8mZMEpvQ==
X-Received: by 2002:adf:eacb:: with SMTP id o11mr682061wrn.208.1605634604875; 
 Tue, 17 Nov 2020 09:36:44 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n23sm4340595wmk.24.2020.11.17.09.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 09:36:42 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D62921FF91;
 Tue, 17 Nov 2020 17:36:35 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 5/6] tests/docker: Install liblttng-ust-dev package in
 Ubuntu 20.04 image
Date: Tue, 17 Nov 2020 17:36:34 +0000
Message-Id: <20201117173635.29101-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201117173635.29101-1-alex.bennee@linaro.org>
References: <20201117173635.29101-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
 peter.maydell@linaro.org, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Install the liblttng-ust-dev package to be able to
build QEMU using the User-Space Tracer trace backend
(configure --enable-trace-backends=ust).

Suggested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201111121234.3246812-2-philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/ubuntu2004.docker | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 355bbb3c63..ae889d8482 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -23,6 +23,7 @@ ENV PACKAGES flex bison \
     libiscsi-dev \
     libjemalloc-dev \
     libjpeg-turbo8-dev \
+    liblttng-ust-dev \
     liblzo2-dev \
     libncurses5-dev \
     libncursesw5-dev \
-- 
2.20.1


