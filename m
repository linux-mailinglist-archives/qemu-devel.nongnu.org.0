Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6677355772
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 17:12:28 +0200 (CEST)
Received: from localhost ([::1]:53946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTnNT-0001MN-Rw
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 11:12:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTnCW-0006bl-DT
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:01:08 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:45778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTnCT-0005Ei-T0
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 11:01:08 -0400
Received: by mail-wr1-x42c.google.com with SMTP id f6so8494513wrv.12
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 08:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jnnC1v+YTFoDpFZg5HWtfvD0JLh97HNGIKTj56XCIFM=;
 b=dvhFkV8CvZP/GI6rea5ysh3E8PMOS5POxmyU5OFV2IGxG/FGjdmjBAqWlhoEStquuC
 jfTfQBiRPRncQspgn0MV7VzmEDP2AbmasKiO9r9rqpczl4b3OzAkwOsAdRdtkAszO7NJ
 LZVSDIVH4NZRKY6Y/VxTlDF2+FlYqD+tL2JJW5ESjT8uoi3iiKumg6psc0Pw2JKsPNnz
 GZCNadKMW3skpwx31HN8BvWu6+Vf5YBesGRfhxGv5/kIS4eJAETJ/2PqufJnB7FUb+nd
 sc/jkV0cy1HkKwgm72YQc4kTJov1UnzNx6KeRqTDo0I/Ws7WP9LADHMXuW3K5IBBKkjA
 kxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jnnC1v+YTFoDpFZg5HWtfvD0JLh97HNGIKTj56XCIFM=;
 b=uHH5oXP699iEUms7griJcY8pAbiD809TlalcIBY2fDwtW8aT15dsexGW8icPjSrOWT
 e53mG/G3PnYcXcMcTpMii41UnYso0Bn2GLg2EVkFn8d9P+Ou0Re7+aUs8DZjO5WksYMX
 WUhdA6QGNP99dxhQ/Kf4S23wyeckRoACZXRtDvaxbdQfVpjtZ9tzAdeaIX+ANUjti1hE
 5V6GZLKTL8y2KZUPNVAweO2IZywz+tTz/cHCDCpYGx8cj23/aBoTZRQIj2cejG8lf3bF
 YpNOXgXrduI0rp66A/ciWSfqbVw4Hu/SE+Ud44HN2s+kWHkWw6l37uxOWcu/cHJ07kBe
 4mDw==
X-Gm-Message-State: AOAM530eaybMLm80WsSBBw6h45+4UsmNdyRtBOrgcmEly65fW9/RZZy7
 i+aEBJJoK9lMY6u+wMROb+Iwgw==
X-Google-Smtp-Source: ABdhPJxmap4LLfP89NWHbZEz1WM8GULDOJnZJHvWPkXiuMlZrZrzW8K82Rccy8NY5HYvgecQLCBFvQ==
X-Received: by 2002:a05:6000:1789:: with SMTP id
 e9mr35979591wrg.237.1617721264488; 
 Tue, 06 Apr 2021 08:01:04 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u63sm3238131wmg.24.2021.04.06.08.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 08:00:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0CAEE1FF9A;
 Tue,  6 Apr 2021 16:00:43 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 11/11] gitlab-ci.yml: Test the dtrace backend in one of the jobs
Date: Tue,  6 Apr 2021 16:00:41 +0100
Message-Id: <20210406150041.28753-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210406150041.28753-1-alex.bennee@linaro.org>
References: <20210406150041.28753-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

From: Thomas Huth <thuth@redhat.com>

We are using the dtrace backend in downstream RHEL, so testing this
in the CentOS 8 task seems to be a good fit.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210331160351.3071279-1-thuth@redhat.com>
Message-Id: <20210401102530.12030-12-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 85b8e10b84..52d65d6c04 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -223,7 +223,7 @@ build-system-centos:
   variables:
     IMAGE: centos8
     CONFIGURE_ARGS: --disable-nettle --enable-gcrypt --enable-fdt=system
-                    --enable-modules
+                    --enable-modules --enable-trace-backends=dtrace
     TARGETS: ppc64-softmmu or1k-softmmu s390x-softmmu
       x86_64-softmmu rx-softmmu sh4-softmmu nios2-softmmu
     MAKE_CHECK_ARGS: check-build
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index a763d55730..a8c6c528b0 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -29,6 +29,7 @@ ENV PACKAGES \
     rdma-core-devel \
     spice-glib-devel \
     spice-server \
+    systemtap-sdt-devel \
     tar \
     zlib-devel
 
-- 
2.20.1


