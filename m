Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C759937BA9D
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 12:32:29 +0200 (CEST)
Received: from localhost ([::1]:58880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgmAG-0000b0-Q9
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 06:32:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lglzK-0003gT-TV
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:21:10 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:35623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lglzI-0003gP-DV
 for qemu-devel@nongnu.org; Wed, 12 May 2021 06:21:10 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 j3-20020a05600c4843b02901484662c4ebso2746265wmo.0
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 03:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+bRC0Et+Ybmra+FhUpwC3CZYHeRVawT5fsMVpUvmvv0=;
 b=y+1LzMuX+RZzVGT2x91CAnDV8Tb3U3VO8ZiWSRHEmniAr5STTWw9uqYZgOQ8Q6hvSK
 aDcGtxDT2qJCISu+me5gkpWy88HWJXamruT/DPHh24JPe+QWTZonhu4ZetGpdOtNZ/d1
 7caZIWlvgT/VVjdi2+K698QSJ86Wqzb4jC0fl6Yvgc4bxKe0w55pe2GY0Pn2pJKjK0z8
 ebunSLaxRFhPE+/xn8EFNtpPfwxrKACwBo6Xai+veKncbKVTxzpLhbiNZaAMqLmlFs7A
 b0RzqrmImE9vvnScNQwQc7ZZ5WV3PZ63d45qEUJyvVtAOzgi6DznUlAxFzIGFhDscUGs
 6/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+bRC0Et+Ybmra+FhUpwC3CZYHeRVawT5fsMVpUvmvv0=;
 b=BVEqEHwW6ezJ6uhr7ofpjzLctb2pBHfIANZCFziBViXXGjWxlklvXMr0eW+sr/87A9
 dTEM9dv0517sJzEAUnLFEsJLQsFk+jeSZEpbBHGNWiSSzE7CMVbGbqXEftCFEPB8m1PO
 jUEKhjJwdB9oiMlygy+e9Tz+2iAY4DdQT3R0UeOB1D+kDF67gsnxTLERNLy6orHFANRA
 XaztGS0x6YocO0z1O7sJZkvEmEkX4pzZwsmE1Jz15c/uTqS7n++tP370EzOSwBXA1BGV
 oMLqoUAOy/EDCnpdzTOIP2CNDpLnet/hTuY8akv3p8Vfm7YehH+fppF2zXl0MbzTdPwO
 3VeA==
X-Gm-Message-State: AOAM531mC34joZfIdqtMG5j+LbfM8yQDs0oLehVbuj/3/VHshIBWL0bh
 ByFOP1aL8LJ9aSjco7O3alRiHg==
X-Google-Smtp-Source: ABdhPJyAcx7RgZOL1pgrhRVp/IhYAQLMlOypGJPA7Mq+bIC/4oyVayZ4De2WSmq4fRAJ5T+Px6UD+w==
X-Received: by 2002:a1c:7ec2:: with SMTP id z185mr8126981wmc.138.1620814867061; 
 Wed, 12 May 2021 03:21:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n2sm30873730wmb.32.2021.05.12.03.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 03:20:59 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1FEA91FF99;
 Wed, 12 May 2021 11:20:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/31] tests/docker: Added libbpf library to the docker
 files.
Date: Wed, 12 May 2021 11:20:30 +0100
Message-Id: <20210512102051.12134-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210512102051.12134-1-alex.bennee@linaro.org>
References: <20210512102051.12134-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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


