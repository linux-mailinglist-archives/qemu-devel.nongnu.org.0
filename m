Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A9F2FBEE9
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 19:27:32 +0100 (CET)
Received: from localhost ([::1]:45248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1vj1-00044s-Ef
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 13:27:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l1vAw-00010I-Le
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:52:19 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:44521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l1vAr-0003md-DY
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 12:52:18 -0500
Received: by mail-wr1-x42d.google.com with SMTP id w5so20583092wrm.11
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 09:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z1pwI3vYS5zF+thwL7KFBLXWBDqCuQgrG7iqQ6JY8Jc=;
 b=fvUyUXdWTL6Sfy0frqKvjv8x3iXRZ1sJQ+Q4umsxsbdaML8RXBYwGrpsFkpb60pxnC
 0+r74lqCa6nInAV+6ceAHfxcIpjN/jF+50NJ2olwuktn3biVLA6aJKB0ksgTrOhx9h0H
 wRjjK1OIzCG9iDSCXwmiWDbFNTWeBYDu+eyo7aXP0Y33morZBTpZTEagSkT5gz3O8P42
 6HqeIvtXN8obsNEu1dXADZpkenHuDn1SgaVziqGPESdZj1X6iLbFonu5/kfFoYHHTdj6
 Wwgv2Ou3SrjzTHcVigpK5nxapawpIS5nnAlMGQLN9IZHkvlAwv5Y7N3Dka1rlQe8iLXZ
 43Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z1pwI3vYS5zF+thwL7KFBLXWBDqCuQgrG7iqQ6JY8Jc=;
 b=NghsJJtooxPUv8fzXy2LqQ8O1Pylhel4lCQpVnVIGBVJ6WE8WKoYPcqYEyvqkRdGNW
 rOwb9LQkRYSysLV5adfRlKoUYpI9qD8oIS7UKvdyarMEi0W8tbfZcB9Ip1HxRZHu7LAS
 i/Nrw8tY6Sk5AWQ0jrG/LZD4XzZlr12spqubVKF67cZaf46+keMF436FRmB7tJ6LboVc
 Fk0iGiJB0tyi6+jVjhTmgWGFpoVZ8HSQes2m348iXx+M33UjmgPDmTH2SpulQZ2eIrYF
 diBXC44rijr6BwQhMmRkpRepdM5kSYI10KViY3UmKllA1SbNC0pseOev6k+DtqqQZIJ2
 VUlg==
X-Gm-Message-State: AOAM530J0UahrHMdzyRANqYcMHYTxyJhr63DMsvPs/FD0pHmHuZu/PLj
 +R2pp/Rt74aYRamEH4ce9+Lvng==
X-Google-Smtp-Source: ABdhPJwYGhuBcvF5oLnpe5pfVfpvTLwwL6cp1TM87aXKHo8HpQJbil47RqC9Grc/jKMsKRmqM5fHjw==
X-Received: by 2002:adf:b1db:: with SMTP id r27mr5557681wra.125.1611078730922; 
 Tue, 19 Jan 2021 09:52:10 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n6sm5516896wmi.23.2021.01.19.09.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 09:52:08 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 21A8A1FF87;
 Tue, 19 Jan 2021 17:52:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/6] tests/docker: Fix _get_so_libs() for
 docker-binfmt-image
Date: Tue, 19 Jan 2021 17:52:02 +0000
Message-Id: <20210119175208.763-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119175208.763-1-alex.bennee@linaro.org>
References: <20210119175208.763-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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


