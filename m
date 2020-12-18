Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 692522DE1F9
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 12:29:11 +0100 (CET)
Received: from localhost ([::1]:39106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDwc-00009G-CF
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 06:29:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kqDul-0006o6-Pd
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:27:15 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:55077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kqDuk-00034Z-5X
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 06:27:15 -0500
Received: by mail-wm1-x331.google.com with SMTP id c133so1990775wme.4
 for <qemu-devel@nongnu.org>; Fri, 18 Dec 2020 03:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4YR3FKqEiht5wvA3fKDaBjYa36uQEgaaAETgD0fHI+Y=;
 b=koRo8mbcgvhlCJr6ZO450WcwQgXX+O+lITlkOO6QxrFvXaE8lGLOOs6m/9yerD5Kt+
 KE7fgig2VogAKcbGwZeaYHMaJIoxp4pXGk2lmEP0fiqrsy+PbzPAY1CB7QgAbZBsgrXq
 R3zIMCi7KJEThZkAZrszEQ95cWdaI/6imy0/MhZ7FQ7DG31kgDTLEhnLuwxHJ6ZutLjW
 JAUw6/IKo4eyEl9Jtu6fnf7E3ZOa9JcthxTTRNlGF2h3DxI7CRC9E5FVghx8EiZFnnfg
 aN3sr1PkgEdbq+sw16w1WRGRpcZmaKVrio43QPnCUkWI0CdvfFD2mnec1/2fRwOiIYyF
 Y/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4YR3FKqEiht5wvA3fKDaBjYa36uQEgaaAETgD0fHI+Y=;
 b=d52Fz98yBRalbLzFXgOzdhhwzAqaxvkxnhqGTTsH5aWvkUHVsqbHx0XYlaLomOZysd
 6FmEzkrsLeDHSF0dMYEzUG+rQlbLb++Lw0OHJMBzuXaJJx5L9rbKgXfjfs4FWfYkL+cX
 hwMkstjesgOH8peXeJOuhFh/gpeL1rTWjqjEZQstbhietezdIk3oOAHwf1a7yOan0TvZ
 968L+MCBxI2PEowbhBhjEnP2rfq27dHeJ3Psq3MZccdBoZxaNVaDCTL3/wqbfodtw8pX
 m2Wky+hZxccBw4GYgvmqx731oncteAzeK894LNFQuhfsxmjyBVqJD4jE/eHNOKOaibWD
 n8FQ==
X-Gm-Message-State: AOAM532+WuRdPqfSSaxojTUNlt1F1JUeZuPcAoTD9P7Qsio+PIfUs0gq
 ihJArfB/oc3jqpeWR/J/HtjmKA==
X-Google-Smtp-Source: ABdhPJxHL4FjwfhNe95v33eW7LrQNxuWFljKE1M8LrYspVweNuv4WcxwyXSRIxdvhlH/GpLuZi+Gpw==
X-Received: by 2002:a7b:c385:: with SMTP id s5mr3761945wmj.170.1608290832518; 
 Fri, 18 Dec 2020 03:27:12 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s63sm12580480wms.18.2020.12.18.03.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 03:27:08 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CDC081FF8C;
 Fri, 18 Dec 2020 11:27:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 2/9] configure: gate our use of GDB to 8.3.1 or above
Date: Fri, 18 Dec 2020 11:27:00 +0000
Message-Id: <20201218112707.28348-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201218112707.28348-1-alex.bennee@linaro.org>
References: <20201218112707.28348-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The support of socket based debugging which we need for linux-user
testing is only really stable as of 8.3.1 so lets gate our use of GDB
on having a relatively modern version.

For direct testing you can just point to a locally compiled version of
gdb via configure, e.g.:

  ../../configure --gdb=$HOME/src/binutils-gdb.git/builds/all/install/bin/gdb

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20201214153012.12723-3-alex.bennee@linaro.org>

---
v2
  - reword intention
---
 configure | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 0e542b4c46..07df350e06 100755
--- a/configure
+++ b/configure
@@ -6676,8 +6676,11 @@ if test "$plugins" = "yes" ; then
     fi
 fi
 
-if test -n "$gdb_bin" ; then
-    echo "HAVE_GDB_BIN=$gdb_bin" >> $config_host_mak
+if test -n "$gdb_bin"; then
+    gdb_version=$($gdb_bin --version | head -n 1)
+    if version_ge ${gdb_version##* } 8.3.1; then
+        echo "HAVE_GDB_BIN=$gdb_bin" >> $config_host_mak
+    fi
 fi
 
 if test "$secret_keyring" = "yes" ; then
-- 
2.20.1


