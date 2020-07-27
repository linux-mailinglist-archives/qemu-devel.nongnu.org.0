Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFC422EC3F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jul 2020 14:33:33 +0200 (CEST)
Received: from localhost ([::1]:43916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k02Jw-0003Ew-L5
	for lists+qemu-devel@lfdr.de; Mon, 27 Jul 2020 08:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1k02Az-0007MK-KD
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 08:24:17 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:52690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1k02Ax-0006Rl-Sk
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 08:24:17 -0400
Received: by mail-wm1-x32f.google.com with SMTP id x5so13423788wmi.2
 for <qemu-devel@nongnu.org>; Mon, 27 Jul 2020 05:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RKEsFJMIWwY073toT6Xkvo3y6i6P51ZDeJuJoM8XuRk=;
 b=YEjmhsaengNg6bkktVpVNv8GJwUaknWjpM8E1sJXf/F4hwGIf6yrLPLSMSsdHWofSp
 8o/4Y57ZHg+6dC2uBPuIIRw5bwaNVxxX3+Ck2Dhe0B6JMxirr6ujhuYxq3FvIYXZ/pH5
 l+r3VjlxVFQlgEMPEmCws0YKGVdRCvkA4nWvdEKixEzF5zpq7CTl5ogR2gQH2aFWZTT/
 IGGpRtdAn7hTro+ra0JFipim49+gO7hIXgtfQbH2QWhSr9jAFuwROEt/+OhSo+77PU4m
 vHhHfmcf7mMkPes72JNLFKQHLapPCmJdMgNXYBdzOG/u1d6LoTlGBl5PjkbBSYw4rmWO
 Tj5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RKEsFJMIWwY073toT6Xkvo3y6i6P51ZDeJuJoM8XuRk=;
 b=ZlhX7Zyk+Hcu0/2HSI6VcRZGWTYJIAkk2GoJQjNtz9svC4LX4/CE6ukvfo47EXIyHr
 /yMpzrM8cMkzoZW4f3L+AuU3AJ8BVG7iQ24YLw5r4a/Wwt5GCp35/QWO8e7ANWfrerEa
 TQntqfexFYF05LdoMu0Fu4RFKoeC9KOUzQ4sKxZKzAWGj+EOTNg+/nVgzzAAPsH0V2ZT
 N6p1JYhKkHWVp9pLl4o4GlRezfg8lJ5/eiC+T0PAsyb9Zw1fqnW+TB7IbhoZ20BHS7ac
 QUUEed3VRiAMaWOH5XrB45r0mUEegbHqokGj90zEkGAWHDIYRqUiJy1ju9x13pIkDoLx
 LKOQ==
X-Gm-Message-State: AOAM532fxT3DTIkoUS819vc6Esj25Ka/ZRi/0eR3wx7v/uCaVECb0IgG
 /y/b+PXRcwCbgpR+w14F6NDZqQ==
X-Google-Smtp-Source: ABdhPJyEoRruEBhM623HPtWiDrx4wZ9e6Pvx0aNszoRKfyDtqFRuFuvbXcfpd8+02uyo4BxPHBvEDQ==
X-Received: by 2002:a1c:27c1:: with SMTP id n184mr21283442wmn.6.1595852654480; 
 Mon, 27 Jul 2020 05:24:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g3sm13638572wrb.59.2020.07.27.05.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 05:24:06 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3FA9D1FF98;
 Mon, 27 Jul 2020 13:23:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 09/16] tests/docker: fix update command due to python3
 str/bytes distinction
Date: Mon, 27 Jul 2020 13:23:50 +0100
Message-Id: <20200727122357.31263-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200727122357.31263-1-alex.bennee@linaro.org>
References: <20200727122357.31263-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Does this seem convoluted to you? It feels a little complicated to me.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200724064509.331-10-alex.bennee@linaro.org>

diff --git a/tests/docker/docker.py b/tests/docker/docker.py
index c9f20d8d093..356d7618f1a 100755
--- a/tests/docker/docker.py
+++ b/tests/docker/docker.py
@@ -24,7 +24,7 @@ import tempfile
 import re
 import signal
 from tarfile import TarFile, TarInfo
-from io import StringIO
+from io import StringIO, BytesIO
 from shutil import copy, rmtree
 from pwd import getpwuid
 from datetime import datetime, timedelta
@@ -541,13 +541,14 @@ class UpdateCommand(SubCommand):
 
         # Create a Docker buildfile
         df = StringIO()
-        df.write("FROM %s\n" % args.tag)
-        df.write("ADD . /\n")
-        df.seek(0)
+        df.write(u"FROM %s\n" % args.tag)
+        df.write(u"ADD . /\n")
+
+        df_bytes = BytesIO(bytes(df.getvalue(), "UTF-8"))
 
         df_tar = TarInfo(name="Dockerfile")
-        df_tar.size = len(df.buf)
-        tmp_tar.addfile(df_tar, fileobj=df)
+        df_tar.size = df_bytes.getbuffer().nbytes
+        tmp_tar.addfile(df_tar, fileobj=df_bytes)
 
         tmp_tar.close()
 
-- 
2.20.1


