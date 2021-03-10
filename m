Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 893D03342FD
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 17:25:31 +0100 (CET)
Received: from localhost ([::1]:49052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK1eM-00032x-E9
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 11:25:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK1Fu-0004Q4-RA
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:00:14 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:34574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK1Fs-0002a0-NP
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:00:14 -0500
Received: by mail-ej1-x634.google.com with SMTP id hs11so39729793ejc.1
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 08:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HHpsRwO6vST0yf6ATL7Kbq1Uv+qWDZ8yZxsOzY/cYlI=;
 b=OUtskioKpUT6gq7xHfrVqR3gBkb0hxh5udrgw9qDFPBUC+bH+zBwh345q0sWuOlANn
 pDEavZo5qw6Aw4Gw4f7nwlkdSpxR76m2PetagbbB/MDb6hn22cxC+kIS6M4UIyRuGPxP
 pUYvq/WxZd5DI1vdGsgimn+s6PhjIm7H1qA8wELtsLen2E1IIHtvlAzsJFe49kcdokjx
 xsyQnNHcglVVGrzc/hBAF/FdULMk1TWUCNMFMy2sIp0fVVud8V+Y+cRS1FnhNuvUOuoT
 yIkD3IJCX/yOvPCExX3Pqy5H46iF7bFZVGD0Y8IuzU4l3RFboBTUhGnHJ7bIXldxLMSX
 e1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HHpsRwO6vST0yf6ATL7Kbq1Uv+qWDZ8yZxsOzY/cYlI=;
 b=S1GL9nMq9QUz43gPe8PCz3lbpsIuSTlDrLGc4amB3BG/zBQYb+YlTKtayezvHyQlLD
 YA5HLDDij2LvPqYePTveHFhP2myNo+g/74Jg50/FIWtiHWo9Jwzq3ged4tYpBBi4cMRK
 5E+Fqf22zakT+gG2pvQkaQELFfF+nrBjvEdTQxc2CmGCvSRDMc0jB4Oij8wewQ7ei7d2
 DEni+ElV5naZ3pK0yitMLyfbvs4v+rmrLXfrdTdQIyAnk2RkBvOKs90uXsfP4oGLMGsn
 3fmpyiKtPBGyfKkltG7BpTHPePMSSR/laR3l6TgzK1Omx30lSM462TqjGVn6gIBf/PcZ
 ynvQ==
X-Gm-Message-State: AOAM5336occPx4dzQFKSi21TojpteKFncyVVNPIiCwpjObucWTc3kBhT
 ZsCQhahUVpN+OquG/AhJDHdI8Q==
X-Google-Smtp-Source: ABdhPJxT1aIv3bUSqoM1d0Ge4jXMg+7ALZJskdhVASI1b88MusFxlD8v6Y2FFwP1SCCLq4YRGul7mA==
X-Received: by 2002:a17:906:3388:: with SMTP id
 v8mr4487060eja.278.1615392008187; 
 Wed, 10 Mar 2021 08:00:08 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k26sm10149391ejk.29.2021.03.10.08.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 08:00:03 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D4E9C1FF8F;
 Wed, 10 Mar 2021 16:00:02 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 03/15] gitlab-ci.yml: Allow custom # of parallel linkers
Date: Wed, 10 Mar 2021 15:59:50 +0000
Message-Id: <20210310160002.11659-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210310160002.11659-1-alex.bennee@linaro.org>
References: <20210310160002.11659-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Daniele Buono <dbuono@linux.vnet.ibm.com>
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
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210304030948.9367-2-dbuono@linux.vnet.ibm.com>
Message-Id: <20210305092328.31792-8-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 8b6d495288..814f51873f 100644
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


