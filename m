Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC40C14D9F4
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jan 2020 12:40:38 +0100 (CET)
Received: from localhost ([::1]:59180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ix8BY-00030m-Jz
	for lists+qemu-devel@lfdr.de; Thu, 30 Jan 2020 06:40:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36056)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1ix89p-0001IX-Mt
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 06:38:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1ix89n-0008Si-Uv
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 06:38:49 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44589)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1ix89n-0008Rd-Oz
 for qemu-devel@nongnu.org; Thu, 30 Jan 2020 06:38:47 -0500
Received: by mail-wr1-x42f.google.com with SMTP id m16so3578936wrx.11
 for <qemu-devel@nongnu.org>; Thu, 30 Jan 2020 03:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CT3wh8Y3xSMP1+ExU06YY5pwEwL732fslH3YW3xC8eU=;
 b=fbRJEINgt4OZX0r8VhiVSBQvB53IBCWgmD7Ov8JQo9la3KChrByn0Z2yonIMCe5bdD
 FTOk/NO7y7XRar7+i3gCZE+E+aB31VxUhtDF1l3PRsg1PrBctjjKeQrqbICVvG6fcNAN
 YkJrQYsTyCdOHH1JyWeTVpPggkYBEiibkAM0WiPdm6LHThPQGOLsWLMc7oh7OZchYu5C
 vDj902phRacNLGHB9hw8miG3/rPtxc+WniwLQxAuPUQqEHmg16jYo9LSAao4ANY+IvgY
 b7qa4Os60o/YnF7CN7rcC08GMYAws/k9X01EMvwdurelZM7KC/oS92Qh86wDZ3Xvzg5N
 /YIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CT3wh8Y3xSMP1+ExU06YY5pwEwL732fslH3YW3xC8eU=;
 b=qIzIF6aXjQp+ogMg3dEkcm/SbrBpfQrkXR6AcVwjO+ZnjSDOUG8PPEX+NMr7JLW999
 J4nfPGBXZyrY+dNx5WYcqnm8chewct7x+zdauZEue3xflKjN1QMKVH6lUM7aRZsN8Xve
 XfhzAkkGzA6tw0a8EB0vHhkZSQ523woDW0o9ReYiT3u5BsVLLyV20sbN5HNv3aDN8tQb
 POOqZVdJ+EcK5ZZZoszLdtXgl5aFKWAcV/bIWydV/khoGTSncDMghCyVTGH+wxANiPPC
 42mpfwIKuF/pRa2d3wQ5k3wP3ViJkFp0gi0yMPCDRAydnuprmlcT2nwmRiQZFG1z+BPU
 Ks/A==
X-Gm-Message-State: APjAAAX7JC1tlJXmXuYlXc4XpmjBW0jAQ3agOVGC+5azr5PjCfgWuOyY
 ih4HnPmaX41ftoj2wWomCqTkaw==
X-Google-Smtp-Source: APXvYqwVVcwlRiOZLDVjAv46s1mtHJTIaEeKzDeNxVGoIUhG/2LKpMUXkgrleRxrnoOQU7DEHbj7Yg==
X-Received: by 2002:adf:eb8e:: with SMTP id t14mr4990412wrn.384.1580384326739; 
 Thu, 30 Jan 2020 03:38:46 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f127sm6075202wma.4.2020.01.30.03.38.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2020 03:38:43 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9EF711FF92;
 Thu, 30 Jan 2020 11:32:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 05/12] .shippable: --disable-docs for cross-compile tests
Date: Thu, 30 Jan 2020 11:32:16 +0000
Message-Id: <20200130113223.31046-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200130113223.31046-1-alex.bennee@linaro.org>
References: <20200130113223.31046-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42f
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, cota@braap.org,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The sphinx support is fairly new and we don't seem to have all the
bugs worked out for cross development environments right now.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .shippable.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.shippable.yml b/.shippable.yml
index 83aae08bb4..2cce7b5689 100644
--- a/.shippable.yml
+++ b/.shippable.yml
@@ -37,5 +37,5 @@ build:
     - unset CC
     - mkdir build
     - cd build
-    - ../configure ${QEMU_CONFIGURE_OPTS} --target-list=${TARGET_LIST}
+    - ../configure --disable-docs ${QEMU_CONFIGURE_OPTS} --target-list=${TARGET_LIST}
     - make -j$(($(getconf _NPROCESSORS_ONLN) + 1))
-- 
2.20.1


