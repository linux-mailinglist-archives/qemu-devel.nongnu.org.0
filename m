Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAFF354EB7
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 10:33:19 +0200 (CEST)
Received: from localhost ([::1]:46214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTh9C-0005Yt-Bc
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 04:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lTh7M-0004gw-8i
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 04:31:24 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:40776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lTh7G-0005N5-8K
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 04:31:24 -0400
Received: by mail-lf1-x132.google.com with SMTP id d13so21408316lfg.7
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 01:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9ueQKvoLuNhoEksxpmj2aVeAjTizW1VfZGuKUcKL2W4=;
 b=QxEJwFguhS1e3Q1dLsTQqBRW4zqZZnnUedebvyDLu3bR/NDBwK5qVrc0QWK6ZoK4Ch
 YF23zyHS2o64Ebnn3XvDlYNCks1qdERGbtgLvmUNacSxtgopYLJk5yKSUwwDFrh411xD
 tcLIxMRRl8W7RjQ2hPW7NSu0bwJSZSytpVBeDNmiYAjIbWAib3Yl2DiQ56MbX0Ma730p
 Dd6/4yxmWeX9btrHJqg6HdNPNbeMlRPW3uk8Pyi6/6BNfldrt7tkBkfgwnalv4yAlEes
 kTI6hSw7ZbyYaTl4PLHfBAGvKLYg8CFo725tIniqsuyCNbjaIt6TA9yijxf+HpsnGSsF
 zbWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9ueQKvoLuNhoEksxpmj2aVeAjTizW1VfZGuKUcKL2W4=;
 b=f3sZKxm9iWO1MGKhB4dIgeinzA6Sk7JhrtK3F76wiabi1uFW9WVElmcNWViHFSVRFP
 w5OtAgezENhZE7Y5rrsisr4neVnk0AuQ0Qlv3nd4+P388iLRZzj5kkyLmViFBbt9IsI9
 sh1omU5vjOlNurE4H4WWDjkymyqePPyAbuIPOyxXPDK39an/179vuOm0MRbBK3lYDVQZ
 76UnPtYPROQgO/8Omu69bGEij5pPiLtijoGq09yg9dIf9Fdv6mp1FTB9C8dpI2aMLgUb
 ZtHK3HzcqHOYnPZLV7egrtNeka40tPu8JpVp9TOWVoBIGViadBWS/Nd6739YPHWUYFmw
 HGPw==
X-Gm-Message-State: AOAM531VHV1jK6nisTo/WD7315LmK2OCrwPwrqrfvsePBidz7T18pFKQ
 ZOu/M4pd4GIzVxFavcUcCAmh/Q==
X-Google-Smtp-Source: ABdhPJx0PolJIV0kYB7WaO10oMqpDNXh6NjPpdeHExzyv4YNvlwhFnSJFUtJVnZafPUiMsNDQfxqJg==
X-Received: by 2002:a05:6512:3091:: with SMTP id
 z17mr20401486lfd.84.1617697875298; 
 Tue, 06 Apr 2021 01:31:15 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id d22sm2124533lfg.160.2021.04.06.01.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 01:31:14 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: alex.bennee@linaro.org, f4bug@amsat.org, thuth@redhat.com,
 wainersm@redhat.com, willianr@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH 1/1] tests/docker: Added libbpf library to the docker files.
Date: Tue,  6 Apr 2021 11:29:47 +0300
Message-Id: <20210406082947.672708-2-andrew@daynix.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210406082947.672708-1-andrew@daynix.com>
References: <20210406082947.672708-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::132;
 envelope-from=andrew@daynix.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The series of patches for eBPF RSS adds libbpf dependency for qemu.
https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg08887.html

With this patch, libbpf added:
  Alpine - added libbpf-dev
  Centos 8 - added libbpf-devel
  Fedora - added libbpf-devel

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 tests/docker/dockerfiles/alpine.docker  | 1 +
 tests/docker/dockerfiles/centos8.docker | 1 +
 tests/docker/dockerfiles/fedora.docker  | 1 +
 3 files changed, 3 insertions(+)

diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index d63a269aef..998a7584ed 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -19,6 +19,7 @@ ENV PACKAGES \
 	gnutls-dev \
 	gtk+3.0-dev \
 	libaio-dev \
+	libbpf-dev \
 	libcap-ng-dev \
 	libjpeg-turbo-dev \
 	libnfs-dev \
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index a763d55730..8c77ce87d3 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -14,6 +14,7 @@ ENV PACKAGES \
     git \
     glib2-devel \
     libaio-devel \
+    libbpf-devel \
     libepoxy-devel \
     libfdt-devel \
     libgcrypt-devel \
diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 915fdc1845..483f2d9f83 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -32,6 +32,7 @@ ENV PACKAGES \
     libcurl-devel \
     libepoxy-devel \
     libfdt-devel \
+    libbpf-devel \
     libiscsi-devel \
     libjpeg-devel \
     libpmem-devel \
-- 
2.31.0


