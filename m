Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED07E3646A6
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 17:03:20 +0200 (CEST)
Received: from localhost ([::1]:41928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYVQl-0003Qb-Od
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 11:03:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVIb-0003Ra-Sn
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:54:53 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:37557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYVIZ-0006zW-Ul
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 10:54:53 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 t14-20020a05600c198eb029012eeb3edfaeso8412290wmq.2
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 07:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xhD95M88KH2ZeEX/qKVoo6UaDmfYvhnT/tyZbT8agKM=;
 b=zTpkU3y22tMs+VRG/IJIOkstb1jp3pocZQa0q5NgQduYmMv5rGluuxWAUDWGZ39wMd
 eA56SBB4OdyQdBALW8G8oxxusbzlKGC2UKueLDFY1mDwXdtxR8EJ4jh3v1LDy/6KzI8N
 0Ky/GQCUWRqxPWh4I30N4cbFm6+twCl3R5pafrzlqFCqOq6ag4qAskgUwkd12Nc1hpA1
 RSyagI/HlxLLrtSbkoE0jMy9AZO87dAM6/7eoNkhkcofLmoTNFXAFO8w6o8/JxwYWzvo
 5T+q+KB5z5xLZYCJ5Cz8QVk8JBRJzJdBFspcTDqVp+FL3sS0c3Ec1MI/zWi9up8iDxXL
 m4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xhD95M88KH2ZeEX/qKVoo6UaDmfYvhnT/tyZbT8agKM=;
 b=iJgv0GcK34ViFraCVWIjGFsJHP2XjkoahnSKVs8iaFU2Ud7plOjKTxeIxXQNVYRlSI
 Sx0PpwoJE4LokIuZBuLRjs7v/ZVFep56EP6gZecrrnA9oc545LBK2iux+EqkHyPAAHQ5
 BQhuYBCiwfrFyDg9cGJAra2ZYhJAW1+tfo4zr6jwxETfkbdKV4SKIv3P8uuK8fqE1lld
 jd8O+hwwiuWyqA0WdDlZHvmgT5a9hhL5CXVu3MhGUkPCx8TrUs0HEIMVAHcVhA4nryZw
 FcH7FA2REOga1iEw3q4OcXCrxILNwyrYqiv9VcK2bagir2CJjrJyiVR50fHkGuxc7y29
 FLHw==
X-Gm-Message-State: AOAM530tACdKGF4HPOnl9v0lHBhjIdcBxjcpjFcWDJbQq76DclJzXxTN
 R67kIsB83vsVW3jhioeT5TrqMb8NdSnihA==
X-Google-Smtp-Source: ABdhPJzUpmbN0BROpNKYJG1hV5UgvrzkCxNf0FHKQt0UZVmtRP44WLLIJnirhAOOtZK2dxovGh04Dw==
X-Received: by 2002:a05:600c:b47:: with SMTP id
 k7mr21715856wmr.109.1618844090584; 
 Mon, 19 Apr 2021 07:54:50 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i15sm21817006wrr.73.2021.04.19.07.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 07:54:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8DC221FF99;
 Mon, 19 Apr 2021 15:54:36 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 10/25] tests/docker: Added libbpf library to the docker
 files.
Date: Mon, 19 Apr 2021 15:54:20 +0100
Message-Id: <20210419145435.14083-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210419145435.14083-1-alex.bennee@linaro.org>
References: <20210419145435.14083-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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


