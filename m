Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8B8334273
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 17:08:23 +0100 (CET)
Received: from localhost ([::1]:34392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK1Nm-0000sR-Ht
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 11:08:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK1G0-0004Z3-A5
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:00:20 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:38283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK1Fw-0002eC-Pl
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:00:20 -0500
Received: by mail-ej1-x62d.google.com with SMTP id mj10so39694647ejb.5
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 08:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a0BK8ypBSXh0RbNv4uKgBtQr0GJ8Tge8/vqHvw7yHfo=;
 b=JR6F2PaswOUuR0oVd1vaMVYrDlKr0q1k1PUxQQ7HZU+v1DUSbk2QWrXcNvOCYDIrem
 J7U5gG+hL60bD+6dwocZvWRaRPoecfw12Zddo654QNIMp2fd+l3Gvb2HlLqTIBS0SqY/
 wjDK7nmOY+uC+veGWSek62a8JllfdQUArdRXyAZgAAJ5rfdBhXQdRgt6vCD1c/MG+aK0
 JDClYVBA8RYMR3YtggveOllLeSfNUYDrULXyh87711M26PYj6m/NGOjYeqzY2HFQEIGO
 VeDO/COWNkrSb+YVQzHGHrnUqq2crhWSe2Te53q1rlk8Tae1n1Psl1HdF0CNZVjt3+VW
 ugdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a0BK8ypBSXh0RbNv4uKgBtQr0GJ8Tge8/vqHvw7yHfo=;
 b=Sc+kIIw0ygxgSzdYLj/HVBLJk+gO5fyQy82gXZGQpOEdE7rpaTMizFcPnHUHse0Wrt
 Ti7phVXe5uNk6RjsHPIHvTGxO3w9fAglqjcbGwaF/HP8sh6KQAOkuPRobvVCx8GhxuA9
 USgIu/lAz5wWmF302FXWfCRaM7b++2lFy7sKCijD+/Y8HXlXIUeag2qkiSYgdzdF+EZm
 vNluuSEjlbwYT0dox7OF09o2u0yj8KyjHku7jWUn21bJrKI/bqbqACDG8BiKR4i/npas
 cJOfcNi6uE7qt3qil1/IlZXdjY0S/9yCJj7zyEmrW4MYR+SXL44uWWdIhSG3xSw+Eedq
 07tg==
X-Gm-Message-State: AOAM530gTXPw09juf0Tcz5YMc9OsSDfG60+LdNdP2kzupSxUTC1keQ6X
 x/WW9aWRbBPdmBXWgg4GhgFWRnVmS8sn2w==
X-Google-Smtp-Source: ABdhPJyNZAItwzzFvUOYQUFsxyZLa3rtvMWSGT5XXMJEA/msk58vWjr+KqzzFuXHurp/SQ+k5bRrQg==
X-Received: by 2002:a17:906:c0c8:: with SMTP id
 bn8mr4345764ejb.445.1615392012838; 
 Wed, 10 Mar 2021 08:00:12 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r17sm9185287edx.1.2021.03.10.08.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 08:00:09 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0BFAC1FF91;
 Wed, 10 Mar 2021 16:00:03 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 05/15] tests/docker: Use --arch-only when building Debian
 cross image
Date: Wed, 10 Mar 2021 15:59:52 +0000
Message-Id: <20210310160002.11659-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210310160002.11659-1-alex.bennee@linaro.org>
References: <20210310160002.11659-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Christian Ehrhardt <christian.ehrhardt@canonical.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

When building a Docker image based on debian10.docker on
a non-x86 host, we get:

 [2/4] RUN apt update &&     DEBIAN_FRONTEND=noninteractive eatmydata     apt build-dep -yy qemu
 Reading package lists... Done
 Building dependency tree
 Reading state information... Done
 Some packages could not be installed. This may mean that you have
 requested an impossible situation or if you are using the unstable
 distribution that some required packages have not yet been created
 or been moved out of Incoming.
 The following information may help to resolve the situation:

 The following packages have unmet dependencies:
  builddeps:qemu : Depends: gcc-s390x-linux-gnu but it is not installable
                   Depends: gcc-alpha-linux-gnu but it is not installable
 E: Unable to correct problems, you have held broken packages.

Fix by using the --arch-only option suggested here:
https://bugs.launchpad.net/ubuntu/+source/qemu/+bug/1866032/comments/1

Suggested-by: Christian Ehrhardt <christian.ehrhardt@canonical.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210223211115.2971565-1-f4bug@amsat.org>
Message-Id: <20210305092328.31792-10-alex.bennee@linaro.org>

diff --git a/tests/docker/dockerfiles/debian10.docker b/tests/docker/dockerfiles/debian10.docker
index 9d42b5a4b8..d034acbd25 100644
--- a/tests/docker/dockerfiles/debian10.docker
+++ b/tests/docker/dockerfiles/debian10.docker
@@ -32,6 +32,6 @@ RUN apt update && \
         psmisc \
         python3 \
         python3-sphinx \
-        $(apt-get -s build-dep qemu | egrep ^Inst | fgrep '[all]' | cut -d\  -f2)
+        $(apt-get -s build-dep --arch-only qemu | egrep ^Inst | fgrep '[all]' | cut -d\  -f2)
 
 ENV FEATURES docs
-- 
2.20.1


