Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B46A954B
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 23:39:28 +0200 (CEST)
Received: from localhost ([::1]:40342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5czv-0005Kp-5g
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 17:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54133)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i5cDV-0001uy-W7
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 16:49:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i5cDU-0002Qq-OM
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 16:49:25 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:38990)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i5cDU-0002QH-IA
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 16:49:24 -0400
Received: by mail-wm1-x331.google.com with SMTP id q12so255804wmj.4
 for <qemu-devel@nongnu.org>; Wed, 04 Sep 2019 13:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=shdEgCVsEVOTDp+jCd0tUk+kAdVtVP18WfvdQSOvOYE=;
 b=tINgPuPL+iaIB2ahUfBaaN0yzZQMa0m77Nn06PM+xqZPmDSJLhWACVSe2klWID5HTe
 IrOWj8ywF+z1jukjUocj3ZtHQWZxkuBAyA+lsyIyXUXLW2KQh6UnkI1cty28cjd8jsW6
 9d018mApjtgz+/jcyQ8K64Oat3Ydq1gOfUwpFaPN5VyY2jHBg5QE1FBDyRo4gvJuDU06
 cpgDRNhXDcxDn5aAqYaZzstphDS4CVtoKxgbunsT1J5Dy1r3kTx5vJaz0IN/J+KFTiEr
 fd4LG0bBUGKig+2xWc3jOh9NboG3fmWzmEFaxFPySU56PCBcaNjZkCjHjZKY2Bf09OXR
 fLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=shdEgCVsEVOTDp+jCd0tUk+kAdVtVP18WfvdQSOvOYE=;
 b=me/EcPZ1jx97Pkos0gejeYY9+HABwgjJFUbJP4bhsRuLecq5eiiu3qELSUX9o3ivr4
 LU6xKUO6+ETXp17XYNmzRrr5lemn2kvPOv7x94wOTo47Z4KzMhn7fcL/MAbItZiTcIlK
 /8lIeqMpHlD6kmSHlB4CCTz3MaUYFid1jrqRZ97Nkf9rVilGsWs9KMTD1ss1iNBvUVdw
 yYHqvemwpCDvvK0Ld7FtCVcyjo39bd0phOzBB7MZoPGYWeMJNV8tKnwC9ArlTIek1fXu
 3aTXjq4f8MGvnzXRvHPU8Wb2Hnyy+laAWL3PAfi+CXFvXpmi/cYOsR10j7HX2Q7PCo3y
 4sBw==
X-Gm-Message-State: APjAAAXsoEBpcInhdzZ0Can8l8bCKruadR9c2IppBt8RmYEhffyGsrU1
 CJ0fEoq+v+oO8D9FZ3Lt5HGrfQ==
X-Google-Smtp-Source: APXvYqw4cZbtx7wMbk9ZKaz3Swq5QHgdgEe2XGESwNtjgnCasaS6xcWNak/jrEADQBeLiRh2KL/ewQ==
X-Received: by 2002:a05:600c:cf:: with SMTP id
 u15mr158427wmm.168.1567630163382; 
 Wed, 04 Sep 2019 13:49:23 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d18sm31841389wra.91.2019.09.04.13.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 13:49:22 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 44A2E1FFB7;
 Wed,  4 Sep 2019 21:30:16 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 21:30:02 +0100
Message-Id: <20190904203013.9028-32-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190904203013.9028-1-alex.bennee@linaro.org>
References: <20190904203013.9028-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::331
Subject: [Qemu-devel] [PATCH v1 31/42] .travis.yml: Increase cache timeout
 from 3min to 20min
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, cota@braap.org,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

We are going to cache few gigabytes, increase the cache timeout
to avoid build failures when uploading our cache.

See https://docs.travis-ci.com/user/caching/#setting-the-timeout

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .travis.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.travis.yml b/.travis.yml
index 612caabc6cf..8c376d22239 100644
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


