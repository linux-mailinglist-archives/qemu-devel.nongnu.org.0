Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D5D3874DD
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:13:49 +0200 (CEST)
Received: from localhost ([::1]:45550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1livnP-0008SA-T0
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livhU-0008Ao-6z
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:07:40 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:42683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livhP-0005WX-HG
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:07:39 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 f75-20020a1c1f4e0000b0290171001e7329so1041396wmf.1
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PiPNYXgOmLbPMws4gHtVxogCzpWnu6jZf/k608Pm9yg=;
 b=DOGTgzm7Y4hsbIU1hD0KVBngRhaWqzYDFWORwZsjYwFYaY8LbArbWWqzdCbtrBCS9V
 0CdgzhoKTdzzvFkwy4daYWS8YdXsNjEXcvDZSUQgqU7CYgpTk0stW35DR8z76yquns02
 1qpskA1qU1yLSCvy2s1R+RBc7P7cTZwScmvl//CES+rzjZ+OXwITWNJnASqLqrMsL5T0
 ZkreJt4Ph6mjZ+JIpqIOPDeiyiV+hpGWfuyIEhFz+QKgrSTvE4lxVQs11k43naVolBGH
 FxBfCY5LrY7Qs4W+2+IbbOk1i2b8+2brFEUoOAZbYEVuNhC04vPSf+sQ71PlRodzBQvT
 2VJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PiPNYXgOmLbPMws4gHtVxogCzpWnu6jZf/k608Pm9yg=;
 b=dmZUQT68By2kh6fO9YUfXbv5/GJVFpCu1Shi/tM0T0mB3Hsx3DUOb66a5Uh/Z6FJJf
 SPw8q/eERZPsA43iDT7s5+p/8NUn++ilTGP0oO1+RWN5FfKKXuFcM6puArJem90fl2Bl
 gohkuNHDauCk8B9xqgT1w9/gKoQb67XKju3XVC7UMIk1FM71j6FUzcB+zhVGMBCPzlL8
 Ulq0sXebUJ7Mmp5as0PWPtFUUi1HzgYYrwQR5MdIWkzGqlxMapoqEcsmO+KbGinCag/Z
 FEI5d1TSJtyLaQbU9zz0hO9oG7bt9+8lbfWC19N4j8zH0+qvNgs2Eaa3Z1vDGQwijj41
 diAg==
X-Gm-Message-State: AOAM530HC81P+6+ta8rGN3DUl6wyq+Lp4VcxbgBHS5on97nHFfXXOITc
 o5miNjNqAOcBRrTzm/dwWVKJKg==
X-Google-Smtp-Source: ABdhPJxYM1BnPzTEqom2Q3BCQ/sMozGzwqNHSvXQzE0ZuZpRHcpBQO+p+JlgaSd35lKMnqyRoyBsJQ==
X-Received: by 2002:a7b:cc8e:: with SMTP id p14mr3797361wma.74.1621328853965; 
 Tue, 18 May 2021 02:07:33 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x10sm18521315wrt.65.2021.05.18.02.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 02:07:28 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C0B6B1FF98;
 Tue, 18 May 2021 10:07:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 09/29] tests/docker: Added libbpf library to the docker
 files.
Date: Tue, 18 May 2021 10:07:00 +0100
Message-Id: <20210518090720.21915-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210518090720.21915-1-alex.bennee@linaro.org>
References: <20210518090720.21915-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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


