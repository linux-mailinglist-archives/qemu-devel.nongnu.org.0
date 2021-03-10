Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D0233482C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 20:41:17 +0100 (CET)
Received: from localhost ([::1]:47330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK4ho-0003yG-E3
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 14:41:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK4R0-00066F-IL
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 14:23:57 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:39970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lK4Qo-0002kg-10
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 14:23:52 -0500
Received: by mail-ej1-x635.google.com with SMTP id ci14so40910674ejc.7
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 11:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pcd1m2NC4VwbRyf9cPBN7WkrmDonr/2ABTYfeew9jPY=;
 b=y3OX232Qhqag4TiYg+JUVib2MpoDsaPmoZXtQ7QokQUh+ro4bb9EllszZm9n8wO/h7
 YUpmZZPJMYGoRUMOmh+h8xG4PdYeAGgf/GL5CLRZ627K7mSLkCvrbLYa3+9wTefvEb6k
 ZBlQvfV2Tqr8Y9CKC1rmX2SWOKmGiZe9AaWjBSSZNlq56nvzkIdWYfydEuADTDVJb2xo
 nX4C6lTd3zCfbFoocUHUxXo8HgIp/tgYXH0LOxvS47QyrKqtIH4DYx9a8+LcZUBk9sfU
 N2zU8ec9H4KiYOEHSPXQeh2qmkuR6CSdUQsuoo5v/jiUi75Bxxv+IIaSG83x5554Ags2
 TgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pcd1m2NC4VwbRyf9cPBN7WkrmDonr/2ABTYfeew9jPY=;
 b=PqxU5e1QctXtRGj9lkFLhwK0PQYTWr2Y0yQdl9Ivp+SJHCt28J7N3+/vCTIx/BO52l
 JfkZ38n7P+d5oGgcPafTuyicRHYDTKxllNNvrufSsNdivbXXD7lsmtUTF9vggNpH3Dk1
 g3ere61tSouJefOZIODSzwFzCjCYHB0tMS6qEw2tZyAAm1ue85B8twqZdNawYlOCdDZL
 KEH6Zj8cH2sGCf+3alNoyc4iZvgFhdWVyoFgPBXguBkKsLxwmYPDoq1cQawSSdDrAtHI
 xHDvvBXLSkFbtVeUlAHFFG1lle2Djd8bHIPRkJDeSELGfy4DDc8A12o/Ubezjnb8aO/t
 QgVA==
X-Gm-Message-State: AOAM532no2OXb3r2y7ICDK2fz9pIMKZf4I/hFgokL011BD8zW3xrZJcm
 Al+xBluIi7hMtjEVdfAtY/6ubQ==
X-Google-Smtp-Source: ABdhPJynHBfUpYQuzfXBY3e8a/lq8gZyU3GwdQn1/XmZ7LYejoHVvysiMBG0a4wWOsfgms3ZiwiQ7g==
X-Received: by 2002:a17:906:1a4b:: with SMTP id j11mr5944ejf.55.1615404220021; 
 Wed, 10 Mar 2021 11:23:40 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id hd37sm165994ejc.114.2021.03.10.11.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 11:23:38 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8CA2C1FF93;
 Wed, 10 Mar 2021 19:23:32 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 7/7] gitlab: add build-user-hexagon test
Date: Wed, 10 Mar 2021 19:23:31 +0000
Message-Id: <20210310192331.29284-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210310192331.29284-1-alex.bennee@linaro.org>
References: <20210310192331.29284-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We special case this as the container with the cross compiler for the
tests takes so long to build it is manually uploaded into the
registry.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20210305092328.31792-7-alex.bennee@linaro.org>
---
 .gitlab-ci.yml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index b23364bf3a..5625265ef8 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -421,6 +421,17 @@ build-user-static:
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


