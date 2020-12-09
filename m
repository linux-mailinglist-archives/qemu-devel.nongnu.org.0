Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 711442D4782
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 18:11:01 +0100 (CET)
Received: from localhost ([::1]:36104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn2zU-00065X-FO
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 12:11:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kn2q8-0006f7-6b
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:01:20 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kn2q1-0000tR-Ei
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 12:01:19 -0500
Received: by mail-wr1-x42e.google.com with SMTP id r7so2527973wrc.5
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 09:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m50IXaft3h5hV0kUEnfIprupzxwIXXRz5u/O3meIHL4=;
 b=mW3oyInHVFYS9F8gs1uxkdEvkSjEsWh9y+nPnbdn1V6ByRqFSIp2xg25algnDtk4z/
 XAoAvNJ0HNIGI1k82jAyQLn6Ub9Zx1gpF9DVN0g9H3gEZUJ4XD8OcwWyO3OSfJYcDvjE
 /jpBU0U7UDeQkuf2XB81n/ZmESTh+vfAM8Z7w4OncmSn9a2nZIpkOnHPBWArGaPcoe2/
 r8yFI7FqX3p/JPW8kfBcGzt8t34ucndMTUvKs5WhgtLbDtHOSsaS7DTB8hFYyI2Iwe5x
 fSzIp5D35W3of2EJZ2sY9wE5fO2khAQmxnZVWV4dmkPXuV/1fO8j+5R1kMN+zdnpJ9Vr
 VZjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m50IXaft3h5hV0kUEnfIprupzxwIXXRz5u/O3meIHL4=;
 b=dwoqt+V0YlhEdOszzA7tfAaQeccQ0Pv1QF+MQDAJpZ5zmdm6IDjUmK2WV3AUhYJ1ZR
 tevZLV+g1W5r7hcqvVHt4ztqwosdtGcjJ9o86qFSArSUk3uoWGJnEowzPCWCw/RTNU9W
 A8EzGaCmGa6E9Cncxjx2DsU0j4An3RaRc3jCgE26iQbDwTfHSE0iDzFdpZcDlnEt2ukw
 euFfl9RAuxoc6+tls8woZw4XmIecaeoM8vxMHmgBI0xufaGLO4nZms0Yf/F1vDxIVxpW
 2QA4LLxt9/qqaFHJzjrurnR0prS84C0cDjGtbck5A8dD60u4Q5N/eo+bvrGDqJadMj5o
 556Q==
X-Gm-Message-State: AOAM532t5lAYKLoJlelx3yRkVLgWA5OxeSJkrelfUSxYtzqHVmm1YBvn
 bNy4QWgHJILYJNpgqE1pMpj7MA==
X-Google-Smtp-Source: ABdhPJw8P3I5Zi9DujPQQYw09PGoaUTRNz/NTYbHmPU1G8NT5F+Q6Y675BEl0c8MRIs/8XBXuSSzcg==
X-Received: by 2002:adf:eb88:: with SMTP id t8mr3819025wrn.105.1607533271596; 
 Wed, 09 Dec 2020 09:01:11 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a144sm4285004wmd.47.2020.12.09.09.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 09:01:05 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BF2341FF92;
 Wed,  9 Dec 2020 17:00:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 6/6] gitlab: add --without-default-features build
Date: Wed,  9 Dec 2020 17:00:59 +0000
Message-Id: <20201209170059.20742-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201209170059.20742-1-alex.bennee@linaro.org>
References: <20201209170059.20742-1-alex.bennee@linaro.org>
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 stefanb@linux.vnet.ibm.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, cota@braap.org,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.yml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 878d114d40..f87584ca8f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -441,6 +441,13 @@ build-without-default-devices:
     IMAGE: debian-amd64
     CONFIGURE_ARGS: --without-default-devices --disable-user
 
+build-without-default-features:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: centos8
+    CONFIGURE_ARGS: --without-default-devices --without-default-features --disable-user
+    MAKE_CHECK_ARGS: check-unit
+
 check-patch:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
-- 
2.20.1


