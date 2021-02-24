Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FB3323BA1
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 12:55:28 +0100 (CET)
Received: from localhost ([::1]:44738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEslL-000452-J1
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 06:55:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEsfi-0005wp-Rv
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:49:38 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lEsfh-0002Vm-AG
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 06:49:38 -0500
Received: by mail-wr1-x429.google.com with SMTP id v1so1595731wrd.6
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 03:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y8B1vPXzRBogm2IsyqC82CLwOzScpQxFfMMP8XRknLE=;
 b=bJDuRvfuf51Z9ZDi8nNjGm1+uRGvjKsC6fNSsWZjSQ5ll79KqV6x2vRiBF8cx2w2Wj
 5Iy/cKUxlQbzGGtFOB6zx5NaOJZpDNgNFNibCEPG7XGSg7f+LIcCCkdgQvKrNU4sfUNv
 zsKCx0Lq2nwFVZH3HOwYyD0EvR9A++QfPjHevA5nMrMezFaBsyCExJtGFDSSafviWIIP
 d+0P9v0iDLNzoHioVFFb6hR6KcYVjeu17YtHg7ta/2Qpn1dSFbuhvrdRq3U9Dqut/MfD
 Z0HH9oqc2gR6zsy/1gizqYO3yArbGgzzRecsQqsadslWPJGOVFCa1bRrHOgQHffImvUs
 SdcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y8B1vPXzRBogm2IsyqC82CLwOzScpQxFfMMP8XRknLE=;
 b=YETiN7JKZIfeDJhC6vlGYhnIeo3hYd2X0Bb0D/FXtq9XhB2b4aT5+O9dC+YTjPtnaD
 GHJWUQnKCSCcju2LiPg1mdKGzd7NW0dUlPxkw2W0+FbsNqH40z4ZzQBqM58KHJhw72Pt
 uypOjLJoP5DOXqj8T3PscGM+aaH6Ba9GFQdX4LBDzSQi82EECdLTJ89hoFrgU39oG/Zz
 FhPRQ7F2X6ehw39Zq9De+OA+960WMIrU6eAra09rf/pbcM5m+4BmoQd0l+Ba6FRqraoI
 tr5so4ljXpIuVu5cK562FflCWPVN/ZYhk90mr8gKpOH3GS0PYsYbAvaYzWfx4UD942DE
 tw3Q==
X-Gm-Message-State: AOAM532BvfWEGW9E56rHhnjmfYM8HewZssFwCp6AWo4RYW9FpKV4CnEa
 hYBt+1pVvn2eO82sF5SPq0bi4Q==
X-Google-Smtp-Source: ABdhPJw67vsk6Xad5+soR50hhnYo8sV8jtMqZ1hrhxliVYwPQ9+ZI+4GFp/0vLJHR9ahVaqYkNW0uw==
X-Received: by 2002:a5d:6281:: with SMTP id k1mr4912114wru.405.1614167376061; 
 Wed, 24 Feb 2021 03:49:36 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w4sm2548314wmc.13.2021.02.24.03.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 03:49:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E8CE01FF92;
 Wed, 24 Feb 2021 11:49:26 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 6/7] docs/devel: add forward reference to check-tcg
Date: Wed, 24 Feb 2021 11:49:25 +0000
Message-Id: <20210224114926.6303-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210224114926.6303-1-alex.bennee@linaro.org>
References: <20210224114926.6303-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For completeness reference the check-tcg tests in the container
preamble text.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Message-Id: <20210222101455.12640-7-alex.bennee@linaro.org>

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index e57260478a..1434a50cc4 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -289,6 +289,9 @@ an alternative container runtime. Although the many of the target
 names and scripts are prefixed with "docker" the system will
 automatically run on whichever is configured.
 
+The container images are also used to augment the generation of tests
+for testing TCG. See :ref:`checktcg-ref` for more details.
+
 Docker Prerequisites
 --------------------
 
@@ -1011,6 +1014,8 @@ And remove any package you want with::
 If you've used ``make check-acceptance``, the Python virtual environment where
 Avocado is installed will be cleaned up as part of ``make check-clean``.
 
+.. _checktcg-ref:
+
 Testing with "make check-tcg"
 =============================
 
-- 
2.20.1


