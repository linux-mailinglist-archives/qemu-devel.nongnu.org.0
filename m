Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 213A117625C
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 19:21:04 +0100 (CET)
Received: from localhost ([::1]:36907 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8pgd-0004X2-4F
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 13:21:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43576)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1j8pfD-0002W9-36
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 13:19:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1j8pfB-0001D2-Ty
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 13:19:34 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:35331)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1j8pfB-00019u-O6
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 13:19:33 -0500
Received: by mail-wm1-x331.google.com with SMTP id m3so100420wmi.0
 for <qemu-devel@nongnu.org>; Mon, 02 Mar 2020 10:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x+xzICjnYoZ7kFe0us/GQm6SY8Zr24nak+KbUFj0hp8=;
 b=cBcVfexSFHIorNR7WzVAEXvpXrC3SRLxsPcFM0Pt278BKNF8arXVz7AIAb2JX0ENZv
 zsfSufMu8rkPY2AygRBvFvn47TsGqSweFmXz5HOp1j1uT3smay4A3RF0qchbhslaJICQ
 E/B7qZUyeh7/on2owCdOf3y6LWWjEpfGiqAjuYn7zHXGh1ubaXGBWFhL08qqtKr7RC18
 S5vO8pcQArDUfD3ytqeZd2fzbRTljSzzwPkzY1ht4nrZqCQGcKLxHBvBDwjafuIilri7
 sqitM85OAVrn2CLkTFuRyHaos5n4xQmwW2Ei6CjMsAAFHvqPuhovJHOnLnv10gAaUJZt
 wDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x+xzICjnYoZ7kFe0us/GQm6SY8Zr24nak+KbUFj0hp8=;
 b=A9vC6jxOMLImF4TBTWXLHM3LWZhhItLy2UXjYv3lSR9NHpBmpYaSX0qRmnu9ooL2pj
 rHpUSCdtWrrVsJHmWsYx8s5soMkOxUgHpfrLNS6gOZqwRKt8R2S3r1TJ5SeilmzXI6wO
 yPwV8+KYeZnGGk4VwQMHdC0l4eTpBsuJaPUEyNFWQhovcgl+RmElRUa/weA9FBodAX0k
 MFBZc7ktkRAgnlsYkC9JEC3j6Ye+92IxfjT62llmoXhfkj2RIFiAlpB7QgSTSqA3Hfq2
 ScSO/ekKGGj3ONcYnrXmXW4ZZA/quD9KEri9cvzLnWBUewK3p01ipXp8ss/wPaIPwXxk
 VDFw==
X-Gm-Message-State: ANhLgQ2M4s0veVWVQEQ3DJyYaVj+kVOtc37fa6O6jLZEfhcmu390HFuI
 vr2t5bO2Sp+xtx6aQt4q/jYk4Q==
X-Google-Smtp-Source: ADFU+vsy+Cw0ADx1w+Zh5rhwzPgKlf/DEmpUpJz1O0STlKZuRzxCzBIewKT1maLOVwh7qgxH4gQ2/A==
X-Received: by 2002:a1c:ba87:: with SMTP id k129mr113188wmf.102.1583173154654; 
 Mon, 02 Mar 2020 10:19:14 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i7sm335893wma.32.2020.03.02.10.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 10:19:10 -0800 (PST)
Received: from zen.home.arpa (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 12CFB1FF93;
 Mon,  2 Mar 2020 18:19:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 06/10] travis: enable tools build on OS X
Date: Mon,  2 Mar 2020 18:19:03 +0000
Message-Id: <20200302181907.32110-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200302181907.32110-1-alex.bennee@linaro.org>
References: <20200302181907.32110-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::331
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
Cc: Laurent Vivier <lvivier@redhat.com>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

As we can build tools on OS X we should check we don't break build
when we submit new codes.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200302154630.45620-3-lvivier@redhat.com>
---
 .travis.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.travis.yml b/.travis.yml
index 9867272177d..70a24bf2fc8 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -273,6 +273,7 @@ jobs:
 
     - name: "OSX Xcode 10.3"
       env:
+        - BASE_CONFIG="--disable-docs --enable-tools"
         - CONFIG="--target-list=i386-softmmu,ppc-softmmu,ppc64-softmmu,m68k-softmmu,x86_64-softmmu"
       os: osx
       osx_image: xcode10.3
-- 
2.20.1


