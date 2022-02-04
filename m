Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E834AA18D
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 22:05:53 +0100 (CET)
Received: from localhost ([::1]:38632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG5mC-0004qx-Gh
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 16:05:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5R3-0006qN-Bo
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:44:01 -0500
Received: from [2a00:1450:4864:20::436] (port=39535
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nG5R1-0007Oe-B3
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 15:44:01 -0500
Received: by mail-wr1-x436.google.com with SMTP id r17so4364256wrr.6
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 12:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PFUAsUoSTLSeQuqg2QwwUHrYnKbfkML1QApeyrZ65Rw=;
 b=RKvh4ljnjZ7g5fAZsfYOhXqyl2TwCFsUr8YX3mahDLRLnYTBu7dvxH3DGtsLIXAD9e
 3RcKPPOGc8/HTx5rBYR+7YwSnuDdMDOcOx0viVgGfCgyjSMbUDG6dRBjfOlt+BcUHFEe
 fZb2E/6+hL/c19SyFnA6hPYd7PVaHbWDmkZYnU7kDMpHYYhQ4RL1HvFxiUYSdoCzlcw0
 Tq22WPq1CA0XM/Lyt8KybfJuRI7STFCotaTfVfOnQdTE191OMSR4jjDDGQEO4vuqL6z8
 c+Bas8RVIysroFLAnFe1qux82TAZJ6SZFKpTRVI/8ZuxD5/RRqBr1LfSBYfDIxoHSpSC
 kJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PFUAsUoSTLSeQuqg2QwwUHrYnKbfkML1QApeyrZ65Rw=;
 b=VGusM5mX5QYp74MtSE8ts/JDXU3+eJ0sKfcL9IIoIwqD1Vj4TNwNw84NK8ySsLYQ/9
 /28Er0g4fcAKAuS0iE4GVm+W+K5VxOEF//qmNIoHTWdtmshu2Irk140QznSqYT4c1pN6
 V32xDYc56k+w+a/m44rXU79iB3caDQodFE83zevd+m9uyIL9uHRG16A/0S5NfxcAdLxU
 a1kz+VizR4FDCkmDmDsl/FjuDoZNDr5uTlE4NWpmvY3QIiPgcki4cDK01PoLKS3r3sgx
 5YeoXWk8iyRH+igN72yk1yCkT+Yrg/8W59LkRdrnn6JdkoMUWI5HcYEwHhUwlTXQrKFy
 cgwA==
X-Gm-Message-State: AOAM533vzOoZB5E3ZcRyH8z9sFuZ/zbPXsU+YOwXbRt4fK7CKBN2e+Ph
 X/zvFgQRAFL5bPye1WH3BwhDxg==
X-Google-Smtp-Source: ABdhPJxqYhWMAtN3+HC16XeaiSs7QdEl084oI4fFvRHtXIyeD2VSKz2NXUemngfFfUTydSqp8Uqhlw==
X-Received: by 2002:a05:6000:1848:: with SMTP id
 c8mr494163wri.241.1644007437993; 
 Fri, 04 Feb 2022 12:43:57 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m14sm3892392wrp.4.2022.02.04.12.43.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 12:43:53 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6965B1FFC5;
 Fri,  4 Feb 2022 20:43:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 13/26] gitlab: fall back to commit hash in qemu-setup
 filename
Date: Fri,  4 Feb 2022 20:43:22 +0000
Message-Id: <20220204204335.1689602-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220204204335.1689602-1-alex.bennee@linaro.org>
References: <20220204204335.1689602-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: fam@euphon.net, stefanha@redhat.com, mahmoudabdalghany@outlook.com,
 Gerd Hoffmann <kraxel@redhat.com>, minyihh@uci.edu,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 aaron@os.amperecomputing.com, cota@braap.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>,
 Luke.Craig@ll.mit.edu, crosa@redhat.com, kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, f4bug@amsat.org, robhenry@microsoft.com,
 pbonzini@redhat.com, ma.mandourr@gmail.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

Personal repos may not have release tags (v6.0.0, v6.1.0, etc) and this
causes cross_system_build_job to fail when pretty-printing a unique
qemu-setup-*.exe name:

  version="$(git describe --match v[0-9]*)";
             ^^^^^^^^^^ fails ^^^^^^^^^^^
  mv -v qemu-setup*.exe qemu-setup-${version}.exe;

Fall back to the short commit hash if necessary. This fixes CI failures
that Greg Kurz and I experienced in our personal repos.

Cc: Greg Kurz <groug@kaod.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220125173454.10381-1-stefanha@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/crossbuild-template.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
index 10d22dcf6c..29c3c2b826 100644
--- a/.gitlab-ci.d/crossbuild-template.yml
+++ b/.gitlab-ci.d/crossbuild-template.yml
@@ -14,7 +14,7 @@
     - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
     - if grep -q "EXESUF=.exe" config-host.mak;
       then make installer;
-      version="$(git describe --match v[0-9]*)";
+      version="$(git describe --match v[0-9]* 2>/dev/null || git rev-parse --short HEAD)";
       mv -v qemu-setup*.exe qemu-setup-${version}.exe;
       fi
 
-- 
2.30.2


