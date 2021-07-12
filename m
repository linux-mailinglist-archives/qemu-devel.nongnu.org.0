Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2023C5C9B
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 14:51:02 +0200 (CEST)
Received: from localhost ([::1]:52576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2vOn-0004Ih-8Y
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 08:51:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v7T-00052o-Ov
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:33:08 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v7S-0002Me-Bv
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:33:07 -0400
Received: by mail-wr1-x432.google.com with SMTP id p8so25389561wrr.1
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 05:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CEDjAxXaPZHE20IWlZ0aIK/7kfTArvdaA8AvTGvPrno=;
 b=kpOD6exWcoQrovYxsqhSaSFW53Efl1dYqtEaEBUkzgAWBZrDVuhiUqJ+6TzQydHzXp
 mYr81Wb5xFCXf1iLaWyesigmHncXATmT4ro/Ksfj77TOjchk3F6GkdLQjaV28gHEI9Ph
 Vxlh6KEdiKJawRJOtqj5NZ/0Rj8npp3/KP3U2vfGVT/Lr5zICuhGOmrZrLb7cyP1crHW
 1fQmYPAvmILzFKbnZ6nBmfAYWgbwTvVtIKFEihRPoYJ9FFBp99PHOGu/U3KkBGuDVh5q
 CkTq9LixtsUr2KxwnUZh/h4cDHEEKedvJzS8yN84yBMYN2mnQGfvwLGBVPYRyK4aFN56
 HM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CEDjAxXaPZHE20IWlZ0aIK/7kfTArvdaA8AvTGvPrno=;
 b=GhRogVspOcuP1Sy+zP8Lw+JfbcCdJ0pIS5MVAttmG9qnO572oJBaq6LJ3+EfDXMHbE
 bBbGkF38Djfh1ZIWosAx/Bv8fUSDdiobJwZUodDRzLWpE6+uDr2iwZiGguxw156eVaaq
 H5di3mmGg2HmA8UTUYz2HyhFJ31PbhYVY+veoOOeDS9mqRLz/V8zL1VVbLCS4EFyQhhd
 L0CcMHaeI5H/NprtnXDD6h77Z0iS+MqZcyVotmIfC07B+BaYa35JuUaFeELy6WBFsaoE
 1XvjW5XGb9KGDQesz/fMb9hIPku0Dts7STDSqDtZoUTf5wRcgtcWfphSh9jYv5oyH5Pt
 mWLQ==
X-Gm-Message-State: AOAM530jr44L6CCJ8HitTR/nz/5udSsGNi4HHECBAkwlvkJ3eWxo8YQ9
 Rxvl5XjNkQRS5vgBG+RrUG0dng==
X-Google-Smtp-Source: ABdhPJzBUL9frJjjQlymlO0SOj7cMndc651JtnDNphc8euHtnb5lFDwLXkocKUEQi3pfXICvRfwayQ==
X-Received: by 2002:a5d:4e43:: with SMTP id r3mr58292102wrt.132.1626093184980; 
 Mon, 12 Jul 2021 05:33:04 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l2sm3242014wms.21.2021.07.12.05.32.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 05:32:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A4F961FF9F;
 Mon, 12 Jul 2021 13:26:55 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 16/40] tests/docker: fix mistakes in fedora package list
Date: Mon, 12 Jul 2021 13:26:29 +0100
Message-Id: <20210712122653.11354-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210712122653.11354-1-alex.bennee@linaro.org>
References: <20210712122653.11354-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

libblockdev-mpath-devel is not used by QEMU, rather it wants
device-mapper-multipath-devel.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210623142245.307776-9-berrange@redhat.com>
Message-Id: <20210709143005.1554-17-alex.bennee@linaro.org>

diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 4a0a84eb43..f667f03cc5 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -28,7 +28,6 @@ ENV PACKAGES \
     libaio-devel \
     libasan \
     libattr-devel \
-    libblockdev-mpath-devel \
     libcacard-devel \
     libcap-ng-devel \
     libcurl-devel \
-- 
2.20.1


