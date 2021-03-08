Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D86331068
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 15:10:22 +0100 (CET)
Received: from localhost ([::1]:39568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJGaT-0005aA-64
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 09:10:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJGI0-0006Sn-TW
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:51:16 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:32932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJGHz-0001Bn-3i
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:51:16 -0500
Received: by mail-wr1-x42c.google.com with SMTP id 7so11566357wrz.0
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 05:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a0BK8ypBSXh0RbNv4uKgBtQr0GJ8Tge8/vqHvw7yHfo=;
 b=GFqA4j/t8CfChKj1RTNJoT3VZIPIHTHjzEgQDu/VQOutDN8clhNER9g3zt3RL5mXnE
 1GvFGNyVQXu1Lm5bFEgtW1DC6HrNdrrHlvN6e3h7XpsGD60KZY/xizrvTGg7kj2cCDKX
 js3mIt5EXYq7Rh5xMW2jlmz8Zd3ZcHWxsQJtXrFbjDMHYdoRZexuN0rza8UpgkrtjvNO
 bWPs9yp2b9LHeZowap7OmnmEo8GON1tErU3vMFHGETjLJqNOsWdFI36+rTJkRSVWfUno
 Q5hRs5j7BDKpmkKhz6il8nl7u2/Z72FxAXVmnRseJQfjpETtXPopoAWbo5aEiFgXuc0S
 4WIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a0BK8ypBSXh0RbNv4uKgBtQr0GJ8Tge8/vqHvw7yHfo=;
 b=CS7H0Q1inJ9Jwn9PfKBrS8XY8VHGAdMiVRM9stdHScpHRyxJRDoJMQ/GX981YMxdpk
 CSQOjEliiuCcWPPVXoszLf0bBrCewUy8pxR+7kyYNN2nS98cFVHuDKY1lOVqGFf21EcL
 y+/49Q+cPF3QAUMa2zSWm3M3CeltRwBAq3870BHwhO9VbuiCdHJNA1BYgE4RQtAY8cMt
 VSCoJHTnkJLTmK5cTingo79gQPa6YV3N/GDkyCB7ORzi5zK5wFs+DJjXAkiQHfWhAD7C
 /aqWozAFi2E33LpIN4PliiCVicjero8auK6Zg+hrQg3I5jVxkVaKexv/viAYHOn68mui
 hD8g==
X-Gm-Message-State: AOAM5309dwj9/kVigSZMALAy+wcKKzvEaE+kzKrl7ADV8Rfk0CdmPd/J
 5bWMupe4ExYA33MtvlMq6F5yXQ==
X-Google-Smtp-Source: ABdhPJyICtTdVFHJfwpYZS+w/m750eREdZKMJ2qQkTZo9Dy3p8ZZz5mhwGl3peykz9ZV0uFnAAPgAQ==
X-Received: by 2002:adf:d205:: with SMTP id j5mr13364798wrh.211.1615211473691; 
 Mon, 08 Mar 2021 05:51:13 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y18sm11344072wrw.39.2021.03.08.05.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 05:51:08 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 86CB71FF96;
 Mon,  8 Mar 2021 13:51:05 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 08/18] tests/docker: Use --arch-only when building Debian cross
 image
Date: Mon,  8 Mar 2021 13:50:54 +0000
Message-Id: <20210308135104.24903-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308135104.24903-1-alex.bennee@linaro.org>
References: <20210308135104.24903-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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


