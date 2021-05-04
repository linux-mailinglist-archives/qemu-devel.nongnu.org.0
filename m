Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3ED637286B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 12:05:17 +0200 (CEST)
Received: from localhost ([::1]:39154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldrvY-0004Sp-J7
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 06:05:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrtA-0002lC-Lk
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:02:48 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:42701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ldrt8-0003FH-ON
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:02:48 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 4-20020a05600c26c4b0290146e1feccd8so959378wmv.1
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 03:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+bRC0Et+Ybmra+FhUpwC3CZYHeRVawT5fsMVpUvmvv0=;
 b=gXIogrS/ID+pFg7xlMlE7IaW7MgTXwwvZoWaR1tzosHa+O0+3SRKWVUas2eNYhrWB5
 M+3UctNrSmbHYCfQJeKcGW9TPbcF42P21bQ+q+/avpbIb9TgtbpewXwhXRgW/hL5mzD7
 bGk+OmJx9NjStVrW0fBOrP5fmR5YFo/dwETZaVkGTWiihvuv+Uo7VKzuxsenz1f5c/S2
 tZowncQwm0iGE/0HiQ6xUurV3HKSDEaxlrpNbldS0HtnF/Cu2MuMkv+i5x5zclmaizAx
 tYHVKGQUhf9iA4xn3FZWx31YseFV1NL4BhuoFBxBiyyGbb/ygR2f0OhVW4NOl1RT1nmx
 deUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+bRC0Et+Ybmra+FhUpwC3CZYHeRVawT5fsMVpUvmvv0=;
 b=eUmjpAuPzX4HP7mOrDh8w5Y3vp8RRN6Xqk2HBX6J4uSlsQKsesMT5+eq93g5z50xv3
 awDQn3f2CN+LM58gdQSI16WMP0YukVAH/B8TpiPjbCaJeYjzL3zYNax+6V3SjXJC88zA
 KzNXoW/kg7RscNdZkCBllL5sUWXajQEDhJtMjY2ByGsf8XCpp1cXWMGTOPWu58r1R4DL
 sTkFy0hsRoO7fXSFNHhrf7FLH89npC/RtY0YK7g1ZDUXX6q7Wedcu6PHsMARbgg8Hgr9
 EVnxvtB9sBD5NpIJAqpVpLoiOdTZ7DUoWQoiq+lCGvi5fBimlRam2ygPidO4maTkmNcq
 465w==
X-Gm-Message-State: AOAM533wmzSlLCkUPmlxAbSYAfXl+hfJEAHWb3eSqDQKWS/hz9NRkpKK
 i4twI2zx4scu3Pzb9eJmV6MX+g==
X-Google-Smtp-Source: ABdhPJzwWX9jGmalW/r/GfvCj+iz+fNb8x1Slqm5XSRu3bV+BxuVHgMN16wCXI380noto9dZ8mCF4w==
X-Received: by 2002:a7b:c7d0:: with SMTP id z16mr12797982wmk.22.1620122565390; 
 Tue, 04 May 2021 03:02:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h14sm19376284wrq.45.2021.05.04.03.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 03:02:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 93B841FF99;
 Tue,  4 May 2021 11:02:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/30] tests/docker: Added libbpf library to the docker
 files.
Date: Tue,  4 May 2021 11:02:03 +0100
Message-Id: <20210504100223.25427-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210504100223.25427-1-alex.bennee@linaro.org>
References: <20210504100223.25427-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: fam@euphon.net, Andrew Melnychenko <andrew@daynix.com>, berrange@redhat.com,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com, crosa@redhat.com,
 Thomas Huth <thuth@redhat.com>, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Melnychenko <andrew@daynix.com>

The series of patches for eBPF RSS adds libbpf dependency for qemu.
https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg08887.html

With this patch, libbpf added:
  Alpine - added libbpf-dev
  Centos 8 - added libbpf-devel
  Fedora - added libbpf-devel

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210406082947.672708-2-andrew@daynix.com>
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
index a8c6c528b0..efc1349cc8 100644
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
2.20.1


