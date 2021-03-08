Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9ED33105F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 15:06:53 +0100 (CET)
Received: from localhost ([::1]:55936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJGX6-0000lM-6X
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 09:06:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJGHz-0006Qw-TV
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:51:15 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:40923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJGHy-0001BD-9C
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:51:15 -0500
Received: by mail-wr1-x42e.google.com with SMTP id l11so8135424wrp.7
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 05:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JbCeKn+rxsjkV4xO+94bdK/cUlFuN3vETpd4EBOMSgc=;
 b=IWzg6KH6RemAd2zL1BQd5UQHbz/aEp+oZKVCSuoDDkVeKYk7BFjYNkDldHfZkOdT40
 miKQTzlh5Pkk2vRAXSKEzY6EPDdhOEavBTr4W2hsS2USF/Hw1njZNnXpznw/mJtjpzxt
 br4ubcltwb7DTxuEuDlnLspnEkeGElNb3VzLSHY/APxaiU34/FxjuGRXlPSIBM8rJQ1j
 mAoWv0PW7SPNFKAsbRslNzT31SNC004HI/nKmhnU45PUaBzfY2RdoGnWmu0r1gXKFTsf
 eTeXxFFh0IQO/qpE67EMn/sF1ZssoR8HrUqjRddheUZgMezdcEU2j7MtimbVGD7YTr9n
 3n0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JbCeKn+rxsjkV4xO+94bdK/cUlFuN3vETpd4EBOMSgc=;
 b=e7ttBGyJw+ymw8BBU+3HrgC1POPsTXOky9kq91PU3Yu2EwKS7bL8cFj9rq3dRJMn09
 onDLG51i/i3ixXkq0LEd+sXcdtU03qI7bni6OpogPJD/2s6sK4tH/9/Gi16xj8q3KaKJ
 4seKN2Ae7/seTI+OolXpYz0IJ/T7lXu4E7gNOFq5LDVwGzDqC9RthX2eeWYl3dVwSjh5
 NsFUOWFLVeqcrOwsETnkcGmmFH6VoKbGb80Ghb8UI6WvSD//wTRVswtjo8wi1unvtsLH
 zvqzSN55vjgKQWq8Q//n+Ud6i8ou6oDgPAnGlQdBjefA8RuKQKSg/K5HJL9yVoYCtqwB
 AgUw==
X-Gm-Message-State: AOAM531Lo83RgWpEf2XiHNzqXtqKUx+YJYTmhw7FATgIPfQMkXJEvBnf
 CTwHu9oRwZzGeu4H3OprTmWl1w==
X-Google-Smtp-Source: ABdhPJwlcImElXcGuWi3vgri9Bk5wT4Y5lW1bEnZdh4zptR2PBnVduUr/eqebdVzw3K8fog4o/3/Eg==
X-Received: by 2002:adf:a4d0:: with SMTP id h16mr22670436wrb.52.1615211472905; 
 Mon, 08 Mar 2021 05:51:12 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z25sm18351321wmi.23.2021.03.08.05.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 05:51:08 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 438511FF91;
 Mon,  8 Mar 2021 13:51:05 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 05/18] gitlab: add build-user-hexagon test
Date: Mon,  8 Mar 2021 13:50:51 +0000
Message-Id: <20210308135104.24903-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308135104.24903-1-alex.bennee@linaro.org>
References: <20210308135104.24903-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We special case this as the container with the cross compiler for the
tests takes so long to build it is manually uploaded into the
registry.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210305092328.31792-7-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 8b6d495288..c2c5196b8b 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -417,6 +417,17 @@ build-user-static:
     CONFIGURE_ARGS: --disable-tools --disable-system --static
     MAKE_CHECK_ARGS: check-tcg
 
+# Because the hexagon cross-compiler takes so long to build we don't rely
+# on the CI system to build it and hence this job has no dependency
+# declared. The image is manually uploaded.
+build-user-hexagon:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: debian-hexagon-cross
+    TARGETS: hexagon-linux-user
+    CONFIGURE_ARGS: --disable-tools --disable-docs --enable-debug-tcg
+    MAKE_CHECK_ARGS: check-tcg
+
 # Only build the softmmu targets we have check-tcg tests for
 build-some-softmmu:
   <<: *native_build_job_definition
-- 
2.20.1


