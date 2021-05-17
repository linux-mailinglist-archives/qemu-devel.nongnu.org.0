Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E1C38396B
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:15:24 +0200 (CEST)
Received: from localhost ([::1]:45194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liftq-000880-U0
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:15:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifp8-0007GC-HN
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:10:30 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:43774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifp5-0005q1-1N
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:10:30 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 b19-20020a05600c06d3b029014258a636e8so3929981wmn.2
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 09:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xSw+oi8MLoOzgRk09Ky3eK57lKOiggJ0N972/xwvHIQ=;
 b=JN1KAQLaTNP151E9NIl4mWhbWmcj2ADi2gvAX9S/8hwKRM21YmgfMZ80G0oj/ky9X9
 gfMKy/Ltewne+pZbftRWIEEVnsbQ25ahAbPLhitsp2i62WkVLkinVtkR5WVwaQkUga4s
 DVVVem52/MQgckqrXogbpvAYbZERwkOZbOEndm9tZaCMsTy/fRWjjm3kMe9zZfUCV53E
 SHEPRW1ZCkNWN2efbx+KwLgmuNhLRNsb+dTk/SrgEzH6WCAeWtj8z40Inaj140qR2qdP
 K1DGByfAYTSZNmmR4DFB9ZnBBfQnlbIlbcvp5Hk3ahgqyEp6+zoBrz/4KBtyyk3KebvN
 GhbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xSw+oi8MLoOzgRk09Ky3eK57lKOiggJ0N972/xwvHIQ=;
 b=Jm5AWkekvY+SLXKUwZlK4DV1PCyR/ocobEP4aPPRkApfyBVWhOplAOz2LxrQCIFNUm
 hNGrNmXKjVyWW9h47kyIvgDiQy9OEmmTjVFRvC/jPgjBb8uCM4Qh3i6puqrYg+g3+AQq
 y5hRX2EurXEwUEF+jurCQ4yeiV3kRmjXD2UtKusD/4GcZ6ri4AAElOMwXE8OEtjGGlpc
 C7mdZu3U8Qns1YgyoWktOeSeM4ath4FQ1vNDcXirvaJt46voKZDzckPzFeE005DRkXIK
 OsyNo1JFGTGlxeX+L12hlLuVpXnUl7DiCwqZo1RFJY9yjSKWu2fFmDMl868WputKtcZa
 eXSQ==
X-Gm-Message-State: AOAM531YJhH8ntqcUJnJdBhlRdfrqOkfahob1LJzJJOUPYcE9pUQpCTE
 7inBiSFfQpnSDnb4p2nPCAGIXw==
X-Google-Smtp-Source: ABdhPJzxzlBmyozwi5uezuF0Pb8haN3IxZornQMrkZWrNSWfaYbwdagX3ojOxt0h1dKW06c3eDAhyQ==
X-Received: by 2002:a7b:c091:: with SMTP id r17mr647836wmh.85.1621267825395;
 Mon, 17 May 2021 09:10:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o11sm3613813wrq.93.2021.05.17.09.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 09:10:23 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1DB201FF87;
 Mon, 17 May 2021 17:10:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 01/29] tests/docker: fix copying of executable in "update"
Date: Mon, 17 May 2021 17:09:54 +0100
Message-Id: <20210517161022.13984-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210517161022.13984-1-alex.bennee@linaro.org>
References: <20210517161022.13984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have the same symlink chasing problem when doing an "update"
operation. Fix that.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Inspired-by: 5e33f7fead ("tests/docker: better handle symlinked libs")
Message-Id: <20210512102051.12134-3-alex.bennee@linaro.org>

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


