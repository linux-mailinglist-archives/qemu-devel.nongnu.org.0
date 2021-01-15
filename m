Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 984AD2F7D97
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 15:04:22 +0100 (CET)
Received: from localhost ([::1]:43324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Pi9-0004OY-KO
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 09:04:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0PEV-000168-QW
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:33:43 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:54061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0PET-00085N-VV
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:33:43 -0500
Received: by mail-wm1-x32e.google.com with SMTP id k10so7369012wmi.3
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 05:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TUlWKvVgHwLfbI3Cp8gI2bdX+EOS2lLxQJgbjb3aQz8=;
 b=FbASaw8t8feG3B4gcGo/GCQpaLOT/kdsWR9zbq2mKHfuT62pWIb3yKC0XieDVd/jhL
 CvmdUgn1v02qyIJ46vqNWFkGMiWYnRJ2cWYzqfQffqpya8LpP8HlDbKJcoxmZz4Mib/8
 epRcdfGHejG8yivMKFb7kYfG06w5Jn1H8yumI9hOt8P8DIlZGzfSd1ftWFXrMv88K6ig
 Nay4oKyx+mR2By2VLQJzZgJD01fmBIfHN6PprGGCsREISZb1LsAjp0jkOKKP0eS1f3gE
 Mmj2agibW+8qHzrdDtjbHFXJZNK2ADJfSl0nYvTAX8mU04/6JndFowz4If/9D2JFgXgS
 JoIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TUlWKvVgHwLfbI3Cp8gI2bdX+EOS2lLxQJgbjb3aQz8=;
 b=eLgc6CULoUHsPKROnqBZzSAqqybXzmKvuSvqAs+s7am9rkcJCOkqhtgcM0hn6V5rLP
 iuzC7VUeRXdnJPGyw5LehoQuF54DJDqWAlz/9MbhYPT00rdetXQQoo7d0/xlhfPP2X+b
 4FFpJWZnAgqP7zLSpqLUg9Tk33L1xEpL/pTfnIW8PGYjLc0PzBFGcTEvAxJwlnia3Bne
 5WR9mjGQ3hMMd2N4Y80rcr4IYPIJkA4Sazba7p9ryM/GTT7uwoyc2U3ruNs5J+hVAllb
 X9ExCzymTCMdOc5WGBziqc7KTrrq50CbU+M49ryVczUsDIb3uagye/c6939SXeEeq6vA
 5e3g==
X-Gm-Message-State: AOAM531vHzjuudzSMIeBHEfYucRerAbSorcfKCsc36A+bmZjdWjEEvMT
 rmnEaCcDKbupav3rNYPu3HwuGQ==
X-Google-Smtp-Source: ABdhPJymMEnCpH0GqjpDcXfwq81S+oRUNin/gO0uZtIPYYFdKAEs2GfGgyrQcqjLcXQT5MQcel1zgA==
X-Received: by 2002:a1c:df88:: with SMTP id w130mr2191739wmg.164.1610717620690; 
 Fri, 15 Jan 2021 05:33:40 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m17sm16047383wrn.0.2021.01.15.05.33.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 05:33:40 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 46AA91FF96;
 Fri, 15 Jan 2021 13:08:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 08/30] docker: expand debian-amd64 image to include tag tools
Date: Fri, 15 Jan 2021 13:08:06 +0000
Message-Id: <20210115130828.23968-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115130828.23968-1-alex.bennee@linaro.org>
References: <20210115130828.23968-1-alex.bennee@linaro.org>
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is going to be helpful when we want to both test the tool
integration and in the case of global generate a xref doc build.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210114165730.31607-9-alex.bennee@linaro.org>

diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/dockerfiles/debian-amd64.docker
index 55075d9fce..a98314757d 100644
--- a/tests/docker/dockerfiles/debian-amd64.docker
+++ b/tests/docker/dockerfiles/debian-amd64.docker
@@ -1,7 +1,7 @@
 #
 # Docker x86_64 target
 #
-# This docker target builds on the debian Stretch base image. Further
+# This docker target builds on the Debian Buster base image. Further
 # libraries which are not widely available are installed by hand.
 #
 FROM qemu/debian10
@@ -14,7 +14,10 @@ RUN apt update && \
 RUN apt update && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
     apt install -y --no-install-recommends \
+        cscope \
         genisoimage \
+        exuberant-ctags \
+        global \
         libbz2-dev \
         liblzo2-dev \
         libgcrypt20-dev \
-- 
2.20.1


