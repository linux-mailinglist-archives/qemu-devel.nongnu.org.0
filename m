Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1AE30BFBD
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 14:42:15 +0100 (CET)
Received: from localhost ([::1]:37966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6vwc-00052p-6z
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 08:42:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6vub-0003LB-MH
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:40:09 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6vuX-0007BE-7m
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 08:40:09 -0500
Received: by mail-wr1-x436.google.com with SMTP id m13so20505619wro.12
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 05:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z1pwI3vYS5zF+thwL7KFBLXWBDqCuQgrG7iqQ6JY8Jc=;
 b=u1klnQGSTEo6hf4byB6sBvfA1jNAEh3AOlKowF/p1/WbwFwX1nBJX4JDnjv81+2L1P
 zEZGhuIi1pX+OIXh/ZwJqNAEj/AMFFSfxPTQGzFhiBwM6f6dJ1IIo/KfoCriNpGhhof6
 INsl0uyC4xgVYfFUXnDh/KzRmci99PSt7YVfFnloMM7r5Ji2lzNSm0WfQEOb7U3YL9YG
 hRjujl3jOZ6U64xaQc1H30kVBQcivbJ54j1JoUxpT58MsqhB9luq5oevLJMEV0OfyGYH
 MTJbNHvtiLOAFbu6AbHVUAxj+5SNNzD1m9Wje0TOfT1TGCaa3ePrDvY14NHZV8dLMye7
 Vl+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z1pwI3vYS5zF+thwL7KFBLXWBDqCuQgrG7iqQ6JY8Jc=;
 b=Ep6dBXgtXxNnYBqD9osgFFk2qgBQcOfHSmiW8RMy6367r/MeNkFwsNtWdZoGuf2OfD
 FlnBObasrG2hwW2hWxN8wSUh011wvhppEWj5JB2NVS+0c9j5yJ5UptVQ/wIphvyGST+E
 k7UaWX9V71KXF16B3ZQshdXVq9Kw0ihdcMaPsO1ylrmi8S3mdf8SJjywfUXv3dVPjAzn
 mig42fFnnBpOGrl7BKVH9F98Sf7sfDrHLv4YA0dHMUxq9XS6xjXiwd536t+r+EVA2EeB
 qh2DFNMaMxjXeJAhZ6zW7iQWjMtCF88m7TOpN9s4cN9sx5ztlXVCloaFwANow8iTrwf3
 gW4g==
X-Gm-Message-State: AOAM530Nm/aTUrWtfGwKq/wNNkZYbc63ADXdgu/G/KK9SufuxqAtze0w
 kwCaMKPE1BLfxmYJGW3BgZvuqA==
X-Google-Smtp-Source: ABdhPJziRGZznxXdte3maf/AueRA0V/eJQgns3xqzqt3SE3E2J/xZ2YgPPYic008KvdRJWSbyl0hMg==
X-Received: by 2002:a5d:44ce:: with SMTP id z14mr9095707wrr.330.1612273203808; 
 Tue, 02 Feb 2021 05:40:03 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l5sm31236666wrv.44.2021.02.02.05.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 05:40:01 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 28AEE1FF87;
 Tue,  2 Feb 2021 13:40:01 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 01/15] tests/docker: Fix _get_so_libs() for
 docker-binfmt-image
Date: Tue,  2 Feb 2021 13:39:46 +0000
Message-Id: <20210202134001.25738-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210202134001.25738-1-alex.bennee@linaro.org>
References: <20210202134001.25738-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Fix a variable rename mistake from commit 5e33f7fead5:

  Traceback (most recent call last):
    File "./tests/docker/docker.py", line 710, in <module>
      sys.exit(main())
    File "./tests/docker/docker.py", line 706, in main
      return args.cmdobj.run(args, argv)
    File "./tests/docker/docker.py", line 489, in run
      _copy_binary_with_libs(args.include_executable,
    File "./tests/docker/docker.py", line 149, in _copy_binary_with_libs
      libs = _get_so_libs(src)
    File "./tests/docker/docker.py", line 123, in _get_so_libs
      libs.append(s.group(1))
  NameError: name 's' is not defined

Fixes: 5e33f7fead5 ("tests/docker: better handle symlinked libs")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210119050149.516910-1-f4bug@amsat.org>
---
 tests/docker/docker.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index 884dfeb29c..0b4f6167b3 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -120,7 +120,7 @@ def _get_so_libs(executable):
             search = ldd_re.search(line)
             if search:
                 try:
-                    libs.append(s.group(1))
+                    libs.append(search.group(1))
                 except IndexError:
                     pass
     except subprocess.CalledProcessError:
-- 
2.20.1


