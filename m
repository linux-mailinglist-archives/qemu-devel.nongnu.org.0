Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C98331087
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 15:13:38 +0100 (CET)
Received: from localhost ([::1]:48476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJGdd-0000xU-J7
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 09:13:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJGI5-0006Xk-E3
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:51:22 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:42676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJGI1-0001E8-Qt
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:51:21 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 b2-20020a7bc2420000b029010be1081172so3847642wmj.1
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 05:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uTg3Tv32l8Xlt8XwDOEGmwz25MtkKlDZ8otFZdvh7to=;
 b=lCcvNqxQ1rLU7JVSPiokQwkYmfefY2HnkJLqQVH/NI+rYliIOISsTaMIX+KCA/Xxm9
 PSpGRkNvtTce/gdfFp+bCd0LfUhm8zjY7IKtrTxdRPQKkAngxRTy2O+PYWtaAuuHVg5w
 AVjWH4QUfZ+6ait/jUfYzW8xGevVve0UQNOrzry6b+iHu2a8G3xkjxR70UZwNd3xHX+q
 ny0Jyh5clLL3S41/nCM9iN6D6ITR4msG82bwua6qccLJCyfXyhqb27xAQHQGq+8A7Ygz
 CU+GnlQPH4BLajon9rasJB7nEX+qHH52pFLFSaNYNSk3SxNwOJSGT/dWd7/D4YeN5B+q
 KeGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uTg3Tv32l8Xlt8XwDOEGmwz25MtkKlDZ8otFZdvh7to=;
 b=Vq1Rr3x++z6Gcd++Fq9XOqa2lz1R9EJ7hOcyJxoD7T/hEpgDv5GQHOKDXzcFF3B65l
 J9Q8KWCAVJnNunlRH3hsgIHByXMRjn6IXQkkt/BaXHHCdUEpcVJhkbIWbOrTfOqtqO82
 RrbNks/VrduCIDWnnlyEQb+qMWyxZJpzZJg/n/Fsa0gZR36xtec+8svoySWZJJq2QX4p
 zxFyOrxaT4IRO59wl8dOG25Zgtrvxx5G6a3e3lu6e4yxAuFhyb4UlU8Kvzmgc04Nejky
 81/ePKZhIfirdpSX2WLsB7fc/T3GdLPEaQeKhmhy0WSp2dD/1XFuVyyJGBj1UDNKMN6N
 j6Og==
X-Gm-Message-State: AOAM531jdHyUrlU+GPRPdhCOmzVANsxL6SjTu9IEaOLQNWiEnEy9VdAf
 t27uaVTUXc3LoCmKkNv5s6atyA==
X-Google-Smtp-Source: ABdhPJygSgg1IXCh/OSLbjXKquPs27AP9EVkFqXOhR3ihblroU25MeV8IDCjhE5f/CS6CzZZuMObXw==
X-Received: by 2002:a1c:3b02:: with SMTP id i2mr22233019wma.18.1615211476518; 
 Mon, 08 Mar 2021 05:51:16 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a17sm19496485wmj.9.2021.03.08.05.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 05:51:08 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5BB811FF92;
 Mon,  8 Mar 2021 13:51:05 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 06/18] gitlab-ci.yml: Allow custom # of parallel linkers
Date: Mon,  8 Mar 2021 13:50:52 +0000
Message-Id: <20210308135104.24903-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308135104.24903-1-alex.bennee@linaro.org>
References: <20210308135104.24903-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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


