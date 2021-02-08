Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1075313E4A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 20:00:15 +0100 (CET)
Received: from localhost ([::1]:57396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Ble-0000m8-PF
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 14:00:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l95p3-0003eQ-8j
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:39:28 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l95oT-0007iN-0G
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 07:39:06 -0500
Received: by mail-wr1-x434.google.com with SMTP id 7so16965163wrz.0
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 04:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yqbd1kuQwaJRIQ4c7pGQEKdHV/g/Is0sgX7tD793D3A=;
 b=DyeOTSOeFQlfdboHaYFuHO054L99u9UvKu2rRke+TPZtJarQEiA0wG13cgwgqmIXaq
 X7MTSJbguN3TzuPRgPH0zXdNae26WHKDYX51E0/91+1KBsu3Hdy0GaNyySW3Tzd7WDUV
 XIBHkr7Lh5c77y/20zp3yFSeaXHVUYZVYaKG3eJ4HhJGgTlrtGGuMO4XhCNOWiA179/f
 lIOXOn9AdAocV30GIE+6jCcjyS61yk7SssUqJCBi+xH+dji+mlWcA6NRNu/XXK+IFajs
 QblDim/cKTo0hCxVU6XezXjBznu5KGAg7rz87+cTMPOGXG43AGCuHlRjcyDIR9qPZrXj
 vQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yqbd1kuQwaJRIQ4c7pGQEKdHV/g/Is0sgX7tD793D3A=;
 b=I4QWbYerT0VDhGdQuLTjMLcyKmF4CPQlTbyMfm7bLZOn0niRA6oU0f6CVfElSopN3q
 MYAj/ePl3CCPM/Lp4V8pUs9LtJOrZXruEkQ2yq2mHVZNBcg+pCv7MuPR4sEn4y21O7Uh
 eC4V72ALJLDuXarzAY5jWLLmAg1wFoCKO420aIlV9XtMOSLb+Ag09o+y9HMADSXGiBEi
 OPQK4hK7aClyzOle0AyhGR0T2El+qZcqzcd+Mj25Tzt+VYmCNNs7K+6rwGjPwAElZ9vD
 AgndIOW/lU7WfGkHHu4InOOiqkVVK6iTJMX0urFjc4DooTEWHZ/6owDZfzIKueV9w4OI
 XLEg==
X-Gm-Message-State: AOAM5338yEeY6HAFa/1JBKKuM6sC5Hd2tOgMYXJemJEsd/gUsmwBnLp/
 XS3CHErlOCZHk685G53FLsku+A==
X-Google-Smtp-Source: ABdhPJwSGIsXZmwMOqp6c6uSYS0gdSftXTUGahW4AlvNai6ABoZKZDTBGcbRFOUE3DjGEOmc201vDw==
X-Received: by 2002:a5d:690b:: with SMTP id t11mr19854538wru.12.1612787906817; 
 Mon, 08 Feb 2021 04:38:26 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h9sm4475291wrc.94.2021.02.08.04.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 04:38:23 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E01791FF8C;
 Mon,  8 Feb 2021 12:38:21 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 02/16] tests/docker: Fix _get_so_libs() for docker-binfmt-image
Date: Mon,  8 Feb 2021 12:38:07 +0000
Message-Id: <20210208123821.19818-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210208123821.19818-1-alex.bennee@linaro.org>
References: <20210208123821.19818-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
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
Message-Id: <20210202134001.25738-2-alex.bennee@linaro.org>

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


