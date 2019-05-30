Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C183230121
	for <lists+qemu-devel@lfdr.de>; Thu, 30 May 2019 19:39:50 +0200 (CEST)
Received: from localhost ([127.0.0.1]:57208 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWP1p-0000od-Mp
	for lists+qemu-devel@lfdr.de; Thu, 30 May 2019 13:39:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44079)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hWP0h-0000Qz-8j
	for qemu-devel@nongnu.org; Thu, 30 May 2019 13:38:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hWP0Z-0000ge-NA
	for qemu-devel@nongnu.org; Thu, 30 May 2019 13:38:35 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:40714)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hWP0X-0000dJ-JA
	for qemu-devel@nongnu.org; Thu, 30 May 2019 13:38:29 -0400
Received: by mail-ot1-x343.google.com with SMTP id u11so6431095otq.7
	for <qemu-devel@nongnu.org>; Thu, 30 May 2019 10:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=NlfGiAAlPDQtelzDRN9s5s54Y74DMuOJ6VJbYlSv7zo=;
	b=SgD79CyqD8o2D+fOKp0hfXAazxGXFauY/FcGUCiFJ4Xr3IA6yKF5cuPKncSk19Yz8A
	DOKjJ8ijd2/cVBtMMRR+HjMKjJbVdpsanlh5GQ0TXuedE1gitY9r9ERlCGrOjv+mh3bl
	YW8rkHJQs0wZl1ynTUb5uSqpLVyMQF9q6uDweM/ktNCtiY0H9BjWKb3ViKrzQ4Nna3Gw
	wsMvVxAmriZFGLweM65amhcOWDLh9OQrqKeRyO96Va2D1v7rd3RV5TJAifwg1sFjhGyS
	5efmvy3XTIG/LWDvpE8AY2DQrVm8Ng9mK5Fj4r43bbPBv7nXgWQiUKJYgSFTwlG3xJQd
	Nong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NlfGiAAlPDQtelzDRN9s5s54Y74DMuOJ6VJbYlSv7zo=;
	b=RHsoQhbfwEYBG67nGz4KcPNatyKyYjzLqyLvJGaqGLkqfEsDA3W6phz9rn+GEfIBzi
	4X5nD+eFfSyJRpuNEC0SR4Uj6iQ7aWfjd9/6Isq+O7kEbQMbZul/6vhfPYxOGZXNipi7
	ttlv4gukcNIbkFg8uvjWCzKCU12Xsb9tBrE9RyfWYmUV+p49E2/PAnHUm+neV/HALTA6
	H4heWMdPFyBQbcSX/vGPCMm7xMV//tT0lr70qXKWKsRiU+lei/xw2dDfiTxJsIKswXWA
	bYYYGi9MEwbzqIWe/9NKn4GjZ3TDnp0mdlpVZMoZD92gcl6hshicxca4AJwf0yq/X3jO
	8aLw==
X-Gm-Message-State: APjAAAUi3IGG95WyCsY2tFoMdTz6jMgID7IHWcNmIpzjGCz95zxu6YCi
	/VDW1ECYwKDCX991G355zJIaMGV+umdltw==
X-Google-Smtp-Source: APXvYqzgjBZv+L3ZfNk9vTxuurkKGvmM/EYYknR2zNcbu19ghGWkZVIyewk/Jawj8P9DdaP6BU2lag==
X-Received: by 2002:a9d:694a:: with SMTP id p10mr3649933oto.61.1559237908397; 
	Thu, 30 May 2019 10:38:28 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
	[189.204.159.168])
	by smtp.gmail.com with ESMTPSA id i12sm1124466otk.2.2019.05.30.10.38.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 May 2019 10:38:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 30 May 2019 12:38:24 -0500
Message-Id: <20190530173824.30699-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: [Qemu-devel] [PATCH] util: Adjust qemu_guest_getrandom_nofail for
 Coverity
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Explicitly ignore the return value of qemu_guest_getrandom.
Because we use error_fatal, all errors are already caught.

Fixes: CID 1401701
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 util/guest-random.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/guest-random.c b/util/guest-random.c
index e8124a3cad..00a08fd981 100644
--- a/util/guest-random.c
+++ b/util/guest-random.c
@@ -56,7 +56,7 @@ int qemu_guest_getrandom(void *buf, size_t len, Error **errp)
 
 void qemu_guest_getrandom_nofail(void *buf, size_t len)
 {
-    qemu_guest_getrandom(buf, len, &error_fatal);
+    (void)qemu_guest_getrandom(buf, len, &error_fatal);
 }
 
 uint64_t qemu_guest_random_seed_thread_part1(void)
-- 
2.17.1


