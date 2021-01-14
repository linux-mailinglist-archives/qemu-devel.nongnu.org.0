Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B112F67DD
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 18:37:19 +0100 (CET)
Received: from localhost ([::1]:54654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l06Yg-0000iU-9O
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 12:37:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l05wS-0003lL-T8
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:57:48 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:44195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l05wP-0004x7-2W
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 11:57:48 -0500
Received: by mail-wr1-x42a.google.com with SMTP id w5so6502987wrm.11
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 08:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cK36DUSESUFYG2mS8m3sG9HUfen5RieNPUd0SHAt10g=;
 b=S+CdhR44vCEo42mc24u2WJyi6iPtDhcLlStNeRRYH2Tn9nSePxZ1Qom2f9fMJKhvMn
 zPmW+aNrbaQw6rR9I0ad/laAhW7K61SDrf7tWdTyPtRmqjVZk2YK2OZ90mezIme4a/FT
 aBnqIAdnPgUSNe8+zJms5g2FugSHYNulZU9IClBS08GBLa43BZyVx8GHBixDS4Ck1f0+
 Ssi4aEYR3oyVYXwulX5XR243Y6GyzZ9ue1rJQ4E3D1NRyf/6uRvXBvLvXYZjFciXlDbh
 vrx8agrYliQjZJEFpW6/hM+MtFOp79wLLRd7DoHBNv0ch9QOl8w3vf76EQSG/gWIwBdN
 TOAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cK36DUSESUFYG2mS8m3sG9HUfen5RieNPUd0SHAt10g=;
 b=eZiAqGpJ88AScfvS7GjBm69HLppFby17Ypmt9uaLrnL1osw5gaACc7CJC2Ke36F7cd
 3FmrfI8A1ygCGhqJOjxiFPy0UuY2F0ZvhSxQHczgnNxuOeF2VY4mYoUVlidCpAqKKitu
 u7m+Wn8DIi0BUedepvpABqfsh7QHGofyFGb19vdRPoObvzyzDCmNJCnYtNpq+CsZvHh1
 rVVLnpoF1NDehui5sVKVTDF0YhjFHDyuucVthFq6DyERY9YZV6fVPD1RgfspUgJ26o//
 Non1Wgvaum9zphQTQKRUiTN67E57QGN1c43K/A/mPshyF8/wT5wlm38gLVq10cCuhIm5
 TCKA==
X-Gm-Message-State: AOAM531NDviJq02x06cO41sdLTjzMYxQYFLDqB7swSQSCnm/tFZuaDBU
 7/cwSGNxZoRN38BunY4y9uwkeA==
X-Google-Smtp-Source: ABdhPJzKoIkk//UUV0qddZH4e3avAmeRHYVBJMf2UeXJnmW8Bgf1qPBrzBZsF++6ED/F9ytg/KwDWA==
X-Received: by 2002:adf:a1d5:: with SMTP id v21mr8893173wrv.24.1610643458670; 
 Thu, 14 Jan 2021 08:57:38 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v4sm11753539wrw.42.2021.01.14.08.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 08:57:35 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 71E111FF90;
 Thu, 14 Jan 2021 16:57:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 04/12] Add newline when generating Dockerfile
Date: Thu, 14 Jan 2021 16:57:22 +0000
Message-Id: <20210114165730.31607-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210114165730.31607-1-alex.bennee@linaro.org>
References: <20210114165730.31607-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: Alessandro Di Federico <ale@rev.ng>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alessandro Di Federico <ale@rev.ng>

Signed-off-by: Alessandro Di Federico <ale@rev.ng>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <1610080146-14968-36-git-send-email-tsimpson@quicinc.com>
---
 tests/docker/docker.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index 36b7868406..884dfeb29c 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -332,9 +332,9 @@ class Docker(object):
                          (uname, uid, uname))
 
         tmp_df.write("\n")
-        tmp_df.write("LABEL com.qemu.dockerfile-checksum=%s" % (checksum))
+        tmp_df.write("LABEL com.qemu.dockerfile-checksum=%s\n" % (checksum))
         for f, c in extra_files_cksum:
-            tmp_df.write("LABEL com.qemu.%s-checksum=%s" % (f, c))
+            tmp_df.write("LABEL com.qemu.%s-checksum=%s\n" % (f, c))
 
         tmp_df.flush()
 
-- 
2.20.1


