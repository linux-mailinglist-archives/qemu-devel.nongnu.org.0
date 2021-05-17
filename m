Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1953839A8
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:24:22 +0200 (CEST)
Received: from localhost ([::1]:38056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lig2X-0006R2-NU
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifpU-0007Ub-9l
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:10:55 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifpH-00062X-0x
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:10:50 -0400
Received: by mail-wr1-x433.google.com with SMTP id q5so7020393wrs.4
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 09:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PiPNYXgOmLbPMws4gHtVxogCzpWnu6jZf/k608Pm9yg=;
 b=rH8l4uM3jPu+mjPwHekJj52AaRJKOljROrAOSa6hSQm2iwYU8EFlw1EEkPlGm6gqv6
 H7sSaGLpZ4bxbE744R0ftCyoT9snvcL818SzLk8yGalMdZCikSakh/4vpvp6sh0XYNTk
 3+B3CgH+4HkXkSevBGRRq/Ff2H5cD3M+0egNXj9rN+LjY37WJbf5ozCFSLVGwm/mKSg5
 iUj3H1182vBRlVnFCuN6LmU2XGNHSSo8Rr9UEiV4RgYlGt6MX2XtFH0eBCJXJ0lei3yG
 nE25m8vmMg+1vikb7JtybvFf13HFuZUpBBeDy83vRQOsS1s/8QnO7iL28aaPh7OuS1pQ
 x8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PiPNYXgOmLbPMws4gHtVxogCzpWnu6jZf/k608Pm9yg=;
 b=BoBfKwHxMkbaKM1aPhPknkmVcxDF/vFPg37sGX3cwA6EuWeLVerWFHTCYrnD26r0+d
 fwczwCVCdyvgkhxIxNIu/dXg2rZNju8lF9RYxm41I1uT9QdG9cpIsiet4mWB0sAOO6Sk
 2UzVHBLemUxBIiEAyNs4BmYajU48astU9q5pMqEykg/dMNmfQoNVts7CAiDpXNp3dYc1
 pDUrJG0YwcJYXJyX8HXkIO7PdyDvDYhEC2dX7uRsu4UZ/CoSgmwfiV2+/yVRqiUwt6iy
 adc8M5T6WjIbwWGQxxz0exOIU0R6a3bafxJWkyW93xlwFoxZoIrsCmzHa8gLLMI8AKw+
 bpsw==
X-Gm-Message-State: AOAM5325oIEthJSHsso7zL7FXycVsVdOPFhuug9B1tWrtqIfQ7i3l7BP
 X4EWD+DiwbONGLabcqu5S2jIvQ==
X-Google-Smtp-Source: ABdhPJzM7jDkSuwNUaKMukXTEB34An6L8s+Emf2GDeJiysJjIlLbhnmsm9QegCmlq8c5zS5Lv5Bvog==
X-Received: by 2002:a5d:4b08:: with SMTP id v8mr540380wrq.122.1621267834737;
 Mon, 17 May 2021 09:10:34 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p2sm12663099wrj.10.2021.05.17.09.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 09:10:27 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B71B41FF93;
 Mon, 17 May 2021 17:10:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 07/29] tests/docker: Added libbpf library to the docker files.
Date: Mon, 17 May 2021 17:10:00 +0100
Message-Id: <20210517161022.13984-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210517161022.13984-1-alex.bennee@linaro.org>
References: <20210517161022.13984-1-alex.bennee@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Andrew Melnychenko <andrew@daynix.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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
Message-Id: <20210512102051.12134-11-alex.bennee@linaro.org>

diff --git a/tests/docker/dockerfiles/alpine.docker b/tests/docker/dockerfiles/alpine.docker
index 0ac46ddd91..7eeecacc46 100644
--- a/tests/docker/dockerfiles/alpine.docker
+++ b/tests/docker/dockerfiles/alpine.docker
@@ -20,6 +20,7 @@ ENV PACKAGES \
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
index d8fa16372d..0979c0e1f4 100644
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


