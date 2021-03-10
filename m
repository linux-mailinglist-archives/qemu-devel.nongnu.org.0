Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3112033481A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 20:38:03 +0100 (CET)
Received: from localhost ([::1]:38610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK4ef-0000Lg-TS
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 14:38:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK4R0-00066D-Ho
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 14:23:57 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:34497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK4Qk-0002ho-8A
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 14:23:50 -0500
Received: by mail-ed1-x52c.google.com with SMTP id b13so29865179edx.1
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 11:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3jUznPzvzYHkJS30t4l+mHbEcaUIGUHIWC+isF9wstk=;
 b=NFppSKFR5tBvZUuxHJO9GZsywQfrnscL+lhc6vVu6/SHl/of46KwTVpuzSV5OxSnCM
 nIwncC9D74BLo14Nl+CN+YBx1Ysdw/Fg2zZq9GCBe0lNoutebrGZlwP110ZXEdRNjP/e
 S84KgADjYAQzFG5ZYHFoxRFve0fRH6+mUckzR4me127tU0xM8zqJtLA+v+sMR3Ey9ZCI
 l8C79/bJSu/4+NHXtPA5do2yvo+np5lew4pqDX/e02CNXhtCmSvCJCDVB6t/nfLl6Yni
 BXYvTCYOcc5JuVbzGYhdYK+mp25sjzxsng15k50ldq1pkWcJ9WIupU2q51YYGp0VZchM
 E1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3jUznPzvzYHkJS30t4l+mHbEcaUIGUHIWC+isF9wstk=;
 b=FhG+x5KXDEOGuXM0nX4wn55iegorQUdRbDxtSxFCPHa/lurJxfmOMreTqbU/SUrLvr
 Kea8AqJ7Xu8UmU6WKkCVsD8LkBiJRX6IEm9DFC8Y9z3GdJl9kfkGud/B0/oCgaA5BFW7
 mIBCQz3cj2oPU35RiVTFXaqocv0I/4wHLGV1qIvD35lkkM+lZfJr04AskTRJcH0lGZh/
 XJRtkQDq6tKM9xfb0ljf4VkIv3JgDnFHvjivAw3oWfkRZqr2dLItEU85/KQiIuP9OExr
 IzUMdwsKwuNpYC2UPb7Ha8JJLsjulCqVcld6DcpxdZCzT7YVSd6NyG0CkfjjwlVhb1sf
 Gr/Q==
X-Gm-Message-State: AOAM5335RT2vXLw8u8C5NdfEZA76RsbjGyGdEK7JyTaNcP+8v5ZtQQOr
 1BJZIckXfPOfFCUt3MBsGBg1vA==
X-Google-Smtp-Source: ABdhPJwSOoRxprM8ptVtIbNXSxNaYZf/kOlXatnYfdU7R2mCwKD13pTa9uSCA44CU08kK4anFJ3dyg==
X-Received: by 2002:aa7:c618:: with SMTP id h24mr5011854edq.358.1615404213746; 
 Wed, 10 Mar 2021 11:23:33 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g1sm119321edh.31.2021.03.10.11.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 11:23:32 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E8BAB1FF87;
 Wed, 10 Mar 2021 19:23:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 1/7] tests/docker: fix copying of executable in "update"
Date: Wed, 10 Mar 2021 19:23:25 +0000
Message-Id: <20210310192331.29284-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210310192331.29284-1-alex.bennee@linaro.org>
References: <20210310192331.29284-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have the same symlink chasing problem when doing an "update"
operation. Fix that.

Based-on: 5e33f7fead ("tests/docker: better handle symlinked libs")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/docker.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index d28df4c140..0435a55d10 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -548,7 +548,14 @@ def run(self, args, argv):
         libs = _get_so_libs(args.executable)
         if libs:
             for l in libs:
-                tmp_tar.add(os.path.realpath(l), arcname=l)
+                so_path = os.path.dirname(l)
+                name = os.path.basename(l)
+                real_l = os.path.realpath(l)
+                try:
+                    tmp_tar.add(real_l, arcname="%s/%s" % (so_path, name))
+                except FileNotFoundError:
+                    print("Couldn't add %s/%s to archive" % (so_path, name))
+                    pass
 
         # Create a Docker buildfile
         df = StringIO()
-- 
2.20.1


