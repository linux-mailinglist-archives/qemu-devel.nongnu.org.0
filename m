Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB665AE6C2
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 11:23:21 +0200 (CEST)
Received: from localhost ([::1]:36456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7cMq-0007Eo-Jk
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 05:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38910)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i7c0W-0004We-56
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 05:00:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i7c0U-0004ll-MC
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 05:00:15 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:41472)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i7c0U-0004ko-Ei
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 05:00:14 -0400
Received: by mail-wr1-x429.google.com with SMTP id h7so17457412wrw.8
 for <qemu-devel@nongnu.org>; Tue, 10 Sep 2019 02:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5ij3XJtRxqrxISqOpJPlpOvdH/pBrN9UdyUObo+VQnA=;
 b=x2cr6ZYEzQzHaSpl9TP2CZaPNiurgZYQXsQ8ocaqA8CqpJb10BBkJDc9eSs/pvVFSt
 YSYDgj7fXGSnIgpmMDEc+XwRAk3qVwRVPwvRu/551Dpgi6lLtqvQDP0/i9UC+uhZnJhF
 6rF6YQNTkM9DoT/NFPf7RI9qFTTZQGjwk8meH/4dWu7s0MY3oyVC/vgZ/AR5QPFsOFV3
 tjblseenzd/n1gXDl6lQ7uEpgdRsTW6Mxvz6huHFWCF/gcPhPqyHxAfptnxl9/X/kebv
 z3oD0GNLz/UdxxkZk20kxtfQgegI4TRGoO+udSmWN1A8ArafNSrfsKKQXqUyaV40ki0d
 RctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5ij3XJtRxqrxISqOpJPlpOvdH/pBrN9UdyUObo+VQnA=;
 b=Ux3vICjYgN/1zsbsH3bX+yNUWh7NjHNiKSR9c8F5rZ/7uCZdFd8GyoOiVWGOR9h9vn
 G0Zn8fj2FbiAvh7KF4nCZKG8zMk6RjHPhgEH+/pjv1biuBWqg28vRe14jT1bvmNaj/SZ
 JQqgIeKVxXp+WNxFnRmNphYvpjreWgIQpzmikYV+/9+66/3KqbqvUeoM5skxSnsiRqoH
 YIA3KaQud5lACPECzR8b14qAoCHzlvpk+3vgBuIeYBEsSy7AFHuktR6GlBJgtBSv9cok
 fKRXs5FxWQwKrn2e+rrzb9Hha+1un7HDlzeDSy4UEUeP64uVOX+dzXorEF/kY8lH74WU
 Vn+w==
X-Gm-Message-State: APjAAAXNsRIbnCzXoJv17u1bMwrobaSxXxNOcoMUm9k0vCrufBW5cCnU
 fIcIf0dFczVcuNtZ7UPpyYw9HQ==
X-Google-Smtp-Source: APXvYqyTupUcSwQS88D/ByKJ108l32Ccn3NXndM2bhYFDVrIE685z9zcBnKRfibxJ1uAUF3g7a1I2w==
X-Received: by 2002:adf:f00b:: with SMTP id j11mr24191352wro.298.1568106013468; 
 Tue, 10 Sep 2019 02:00:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s12sm7894666wrn.90.2019.09.10.02.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 02:00:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CD6961FFBB;
 Tue, 10 Sep 2019 09:43:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Date: Tue, 10 Sep 2019 09:43:39 +0100
Message-Id: <20190910084349.28817-36-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190910084349.28817-1-alex.bennee@linaro.org>
References: <20190910084349.28817-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::429
Subject: [Qemu-devel] [PULL 35/45] .travis.yml: Increase cache timeout from
 3min to 20min
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

We are going to cache few gigabytes, increase the cache timeout
to avoid build failures when uploading our cache.

See https://docs.travis-ci.com/user/caching/#setting-the-timeout

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/.travis.yml b/.travis.yml
index c60cf2ec135..7ae55dc41d9 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -6,6 +6,7 @@ language: c
 compiler:
   - gcc
 cache:
+  timeout: 1200
   ccache: true
 
 
-- 
2.20.1


