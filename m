Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 179603C8742
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:22:37 +0200 (CEST)
Received: from localhost ([::1]:60998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3giZ-0005I9-RR
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:22:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3geO-0004wI-7Y
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:18:19 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:34773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3geL-0002J3-Pg
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:18:15 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso3615795wmc.1
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CEDjAxXaPZHE20IWlZ0aIK/7kfTArvdaA8AvTGvPrno=;
 b=zp4beF7JVLpN+OVfMLZ1HlVgWLdvM7IU7EM5DkN8EUKl/ybtxeJY8lYkrEqkfsEF/4
 IluOQqVv9i2QK0LYmtz1eMavaXUwrvy1EYj/dCe8JjFU4RDsY5IUeyYI0tpzS0LtalNS
 ASVTJvXCxorR+umvwwL8MAYIOjzhPz0jIn7muxRnQEijMqOCO53n/v+wtfrqaqi5q3na
 DbiW0YIsRJoxQ9Qiwm3DN+b+o+MgYgfu9qBXHY2jR8XF2PoQNOKrSUQwsrLiZm1kuEJL
 x0qEiosiNtvhNDellprhWU9bVsblKVQOtnTYchtemkK/yCMo32Wif+NfuHPtB6rVIPiu
 NYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CEDjAxXaPZHE20IWlZ0aIK/7kfTArvdaA8AvTGvPrno=;
 b=rVZwtsBr1meceR/OXMswTiPHgNh4t0pPcAQ8NevFnIF91S4ycBhQNbCalhey50zpYO
 dU6/M9MYhb6hPsmNUWAAMqwvvoQJzFh7as7pJXsmXCsqWS0JHNIDp1d6xbqtYjNdFYBf
 qbSLf4cIdWLwGWm44EZ30/llQqxqtT1KjGcTir5B+hIt88YaFdZnHYi1EmpRBtz5Iu7+
 Uw3VcGacM8sUbAwKEHJ8B2F9ybBeSdcyE2zbdBKJts5oPG5w2BPuVQhTGgVaMZYD6ABJ
 tC09Elp4daxS46TTyqxawIgo0v7GQhI1hOBolj4IhLe5AKTvAQKYMTE8FKhto1ZY3DlR
 d0Hg==
X-Gm-Message-State: AOAM530lz5UN/zgznCdkwzHmRSHKlmlpJGXavxrQuBpPAcuzAoSSnrUd
 Xsu4uI6e40RpifF6hNBOtY4weA==
X-Google-Smtp-Source: ABdhPJzwopGgkdkkwMZc64S84q7F4DknTNl4fwJJAcZMroMKrOiuOUg+XrCS1JoRQRk66M2uaAAQuQ==
X-Received: by 2002:a1c:4c0a:: with SMTP id z10mr12063813wmf.24.1626275892495; 
 Wed, 14 Jul 2021 08:18:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o14sm5465585wmq.31.2021.07.14.08.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:18:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D4B051FFA6;
 Wed, 14 Jul 2021 16:00:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v5 18/44] tests/docker: fix mistakes in fedora package list
Date: Wed, 14 Jul 2021 16:00:10 +0100
Message-Id: <20210714150036.21060-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714150036.21060-1-alex.bennee@linaro.org>
References: <20210714150036.21060-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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


