Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D27300B09
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 19:24:17 +0100 (CET)
Received: from localhost ([::1]:47974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l316W-0005nw-UH
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 13:24:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l311Q-0007VZ-Qv
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 13:19:00 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:37138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l311P-0006qI-A9
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 13:19:00 -0500
Received: by mail-wm1-x336.google.com with SMTP id c128so5150183wme.2
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 10:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z1pwI3vYS5zF+thwL7KFBLXWBDqCuQgrG7iqQ6JY8Jc=;
 b=qjMKYb+ClrN97Yndcd74T/PxkgWG7GskeMe6oJTx/R0KZUOlJC2j7hQbtb/4JgMneV
 BaJm0KSJE4a1uy39X742wCcW1FPWPRoby3gAQ8o7ArJLXtYTXTCsJlxiqAyn6tSLlFVK
 htFcAQcghQot6O3fQVVrWbrCY2poG42j68SHAjFfz1qQB7T0ZXZeKoeEiVnZErLHpV2m
 ABUxFfHQMYKUSoLg4GWEfqZ5vbpjDk2KR0WK1ZPCg+3o4hcmOUIUD95ZV+7+AFJgYlWf
 eV579ihJ1fwr50xpQjM/3+Zo/t2bhHHANURM7Qr3P0Nip9C6ktpUi53Wnw8Qq45WIv4r
 ijlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z1pwI3vYS5zF+thwL7KFBLXWBDqCuQgrG7iqQ6JY8Jc=;
 b=JhfhK9e1RUXijGkBrPu/a7zWS/WSgtHw7V6Xg9yjB/RAbQYWj51kNIfXOIlwFc85bc
 02Gs0EKh76FrHY7oTpqsRokqInlddKRaTKtwQ46vftKiW7e0BqCQom+3nv3quiTNQ6gC
 bt+RZQQVnstweimX6i2Ei151eGmW6mNwTSSoWQnpUk3OnWmVzbhK2q4j5kbIISDgxmxM
 mv4XydiaRu3wygnkL109HjqcB1ti1ejjASz8pER41GGlawO/cZeDSlfr6XXLnRhxVOiO
 y+o7Fuq1ZuUCRzCQ8yZg0dRAVS26wRJXGA2Q6EKbTarDlDvZary1CjcmebYJULIGVr6S
 pWMA==
X-Gm-Message-State: AOAM530gUiWP8Jq4YQXmJjTQjAAzh+UMGiYcAgrD85a36HfL7KGTxjDk
 bKP1495nfUURDs0N4Wlf7dShSA==
X-Google-Smtp-Source: ABdhPJzxniy1Wr56RyX52X45sQr4iD/xdekcRrDf0wabRPBxTPViQ5rPsoH0LXmCQa78x2JGSNW/Cg==
X-Received: by 2002:a1c:bb07:: with SMTP id l7mr5235147wmf.102.1611339537478; 
 Fri, 22 Jan 2021 10:18:57 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l1sm5833353wrp.40.2021.01.22.10.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 10:18:55 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B89901FF87;
 Fri, 22 Jan 2021 18:18:54 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/8] tests/docker: Fix _get_so_libs() for
 docker-binfmt-image
Date: Fri, 22 Jan 2021 18:18:47 +0000
Message-Id: <20210122181854.23105-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210122181854.23105-1-alex.bennee@linaro.org>
References: <20210122181854.23105-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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


