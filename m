Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E529218F98C
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Mar 2020 17:21:36 +0100 (CET)
Received: from localhost ([::1]:36648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGPpX-00012b-UD
	for lists+qemu-devel@lfdr.de; Mon, 23 Mar 2020 12:21:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35389)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jGPjd-0000xD-9B
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 12:15:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1jGPjc-0002TL-63
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 12:15:29 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:34365)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1jGPjc-0002T6-0L
 for qemu-devel@nongnu.org; Mon, 23 Mar 2020 12:15:28 -0400
Received: by mail-wr1-x434.google.com with SMTP id 65so1130943wrl.1
 for <qemu-devel@nongnu.org>; Mon, 23 Mar 2020 09:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a+eVpTg0MHn6LPO3owiIyrC48R6QnWbQHBq+aT77u9Q=;
 b=KuzNJvRY8aDQksVDqXpFWMFM/qqc8ok5YONYmRLmZ0UIxCVoIX2UGDm9QS6HMJ2tIn
 lkTL7tuFlTxXTEKTAlP3kdAYfaZzNlRAjSMOQYg4aph0MHjZ7U0sAKuQ5VUnkTPYkIm0
 T47Xt0qfSQYSc4iUcqgl1ilk0XWXWu2T/0cSzi3+deOefYimf5TuoZP/xzIHtEX8eiTv
 u9OmGSReb4e7tfMuRT1GBPR5wsWaVAN4/U0bMvE6qVlGTgNmcVC79kmmhYA9Ig2nm5nt
 axM+OXLuTtH66iRd0QxgxGBHfZnS1ZMFdA1QUy/WXWsJbh5DTBkDZgIc2/PlMWr1ahbl
 jHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a+eVpTg0MHn6LPO3owiIyrC48R6QnWbQHBq+aT77u9Q=;
 b=T4+3KDe5WLWoCO3+NJc8OLWWXCQCybfuzg1g3F6Xq7+6Bb1l0oQywPfr5zmz4W45UL
 6NwjvVRBQa9LGgsjjlzwj2cm0LW/jFfFjdAKJpwXTKOsEVUK4s+e3CdXdGij+6NHLAh7
 UZOdVeOJG9CZMo6Ltw7Y/3wJcsDUpGqrBlEw8HLUB7qzUKyaZcJ8N17UphaWjHTQRmbw
 9QNfIDhNLCRGYzfXQXsf4ZIatFYvBYe17yACtY7P3hOdyGCV6dRngU1qQ0YR6sJnAuKD
 3rY4Q0rXr7SwTQwQiz03r9zRkZyUyES8PHG0OR6E3cLoGjfokroJ+zAB9qkL+46LL9mK
 d3nQ==
X-Gm-Message-State: ANhLgQ2BkKbzax58Jma4joFXV9Qm7ED22l+sd/L/tpqCkN1P+djjlkrC
 VNYb+bT8Zi2+6Gk2gm2PFJQbFQ==
X-Google-Smtp-Source: ADFU+vuxodmO3BYlh3ycQKxNxKHH3PUgE0BZyDccF3+bojAJEygiRCq7B4ITC99n/MnUtG7V8vF9sA==
X-Received: by 2002:adf:dfce:: with SMTP id q14mr32067901wrn.326.1584980126935; 
 Mon, 23 Mar 2020 09:15:26 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j2sm7899703wrs.64.2020.03.23.09.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 09:15:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2D9671FF96;
 Mon, 23 Mar 2020 16:15:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 08/11] tests/docker: Install gcrypt devel package in Debian
 image
Date: Mon, 23 Mar 2020 16:15:11 +0000
Message-Id: <20200323161514.23952-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200323161514.23952-1-alex.bennee@linaro.org>
References: <20200323161514.23952-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::434
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

In commit 6f8bbb374be we enabled building with the gcrypt library
on the the Debian 'x86 host', which was based on Debian Stretch.
Later in commit 698a71edbed we upgraded the Debian base image to
Buster.

Apparently Debian Stretch was listing gcrypt as a QEMU dependency,
but this is not the case anymore in Buster, so we need to install
it manually (it it not listed by 'apt-get -s build-dep qemu' in
the common debian10.docker anymore). This fixes:

 $ ../configure $QEMU_CONFIGURE_OPTS

  ERROR: User requested feature gcrypt
         configure was not able to find it.
         Install gcrypt devel >= 1.5.0

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200322120104.21267-3-philmd@redhat.com>
---
 tests/docker/dockerfiles/debian-amd64.docker | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/dockerfiles/debian-amd64.docker
index d4849f509f4..957f0bc2e79 100644
--- a/tests/docker/dockerfiles/debian-amd64.docker
+++ b/tests/docker/dockerfiles/debian-amd64.docker
@@ -16,6 +16,7 @@ RUN apt update && \
     apt install -y --no-install-recommends \
         libbz2-dev \
         liblzo2-dev \
+        libgcrypt20-dev \
         librdmacm-dev \
         libsasl2-dev \
         libsnappy-dev \
-- 
2.20.1


