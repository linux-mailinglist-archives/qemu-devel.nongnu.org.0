Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D38E232E4CE
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 10:29:57 +0100 (CET)
Received: from localhost ([::1]:43336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI6mS-0006qW-TF
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 04:29:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lI6gR-00019O-WE
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:23:44 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lI6gO-0004LK-V3
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 04:23:43 -0500
Received: by mail-wr1-x433.google.com with SMTP id e10so1247555wro.12
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 01:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FibiVfMaIQ72ptryoYOeLZu6cNQdcbDp88Mmd4bbS28=;
 b=eXSnm/XywBcs0uSOP2HyC4frWTLLuzMHTIgcevYlB3k/UPsXAm7w8a5aLrVevs7L7t
 b/84r33VcpAqrnMmPh8ZY7fA3/hyd9t5OAbEgTUIcMgUuLXZ5BL8paXSozfSVBvP3HOE
 bqki1tNOlsvSzGk7TTj7SZPULtlZm9JeTWU00YRHSvUSLJQqOjvHD5CqgTzmEcn6AQFF
 183BFdVwYezloL31DfIXqHRo4ygxhT3V9u0/0BVpvF5wLbWIIarWC1I5fh4uENRgwx1I
 ruOsfd3gs+ZABsIjsAqVSKcAoezlGYF3pu2R9KBBIBG6XrJBuR879RDjyfHs8B7On3Yc
 Fznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FibiVfMaIQ72ptryoYOeLZu6cNQdcbDp88Mmd4bbS28=;
 b=RA9vmy+sk2+4Zfw6hRfTd8hpbLCBd1PnWNbUtUkjOsVWdEKFtfSJmvCHPwD1OUkAMV
 FCZUrKGCql/F3Ov66jrJo3AShMyk43uH239tpLj51igbzeRZ9a384cloZzpJ3iePX89H
 7fc2EMbvjGrOHHRGjp6Pr/QmIqLq1YAe8OgkdhDJfBSHuMvH5QJ0LeY95SJSwja9QVqP
 HzinHrH8m0XtaxSJ92kjmRYf8wTE8048dEPblShUCU35AJD2pUTa22Ig2+skyu53ZUp5
 WmlTPBdnC7M+veX7E/PeMA54SrI3in4p1rDePXYaIt4oPe27bsEzH7qOy/cffxqqIF81
 upwg==
X-Gm-Message-State: AOAM533NpvVFzhLuaiQ+aAHqYjP5VIrycUdafrOYrYkD0PyAX2DYbgSS
 3P6f3DI+gj5Ldvg/siW2YzaHZw==
X-Google-Smtp-Source: ABdhPJy7n/GaJKBaw3+a1w+bQa4OZaukwVZXL8zzGYq39hchKLW7imS+C4lkZDoGngvupDg9cEhJsA==
X-Received: by 2002:a5d:6290:: with SMTP id k16mr8391451wru.264.1614936218728; 
 Fri, 05 Mar 2021 01:23:38 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 36sm3761926wrh.94.2021.03.05.01.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 01:23:35 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 976EC1FF93;
 Fri,  5 Mar 2021 09:23:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 7/9] gitlab-ci.yml: Allow custom # of parallel linkers
Date: Fri,  5 Mar 2021 09:23:26 +0000
Message-Id: <20210305092328.31792-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210305092328.31792-1-alex.bennee@linaro.org>
References: <20210305092328.31792-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniele Buono <dbuono@linux.vnet.ibm.com>

Define a new variable LD_JOBS, that can be used to select
the maximum number of linking jobs to be executed in parallel.
If the variable is not defined, maintain the default given by
make -j

Currently, make parallelism at build time is based on the number
of cpus available.

This doesn't work well with LTO at linking, because with LTO the
linker has to load in memory all the intermediate object files
for optimization.
The end result is that, if the gitlab runner happens to run two
linking processes at the same time, the job will fail with an
out-of-memory error,

This patch leverages the ability to maintain high parallelism at
compile time, but limit the number of linkers executed in parallel.

Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210304030948.9367-2-dbuono@linux.vnet.ibm.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.yml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index c2c5196b8b..1ea944eb91 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -27,6 +27,10 @@ include:
       else
         ../configure --enable-werror $CONFIGURE_ARGS ;
       fi || { cat config.log meson-logs/meson-log.txt && exit 1; }
+    - if test -n "$LD_JOBS";
+      then
+        meson configure . -Dbackend_max_links="$LD_JOBS" ;
+      fi || exit 1;
     - make -j"$JOBS"
     - if test -n "$MAKE_CHECK_ARGS";
       then
-- 
2.20.1


