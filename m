Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A606BD94
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jul 2019 15:46:40 +0200 (CEST)
Received: from localhost ([::1]:57360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnkGV-0000F9-R8
	for lists+qemu-devel@lfdr.de; Wed, 17 Jul 2019 09:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55448)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hnkDk-0005Tt-QQ
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 09:43:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hnkDj-0004aP-Pw
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 09:43:48 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40055)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hnkDj-0004Zi-J4
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 09:43:47 -0400
Received: by mail-wr1-x435.google.com with SMTP id r1so24881109wrl.7
 for <qemu-devel@nongnu.org>; Wed, 17 Jul 2019 06:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0S+4gBrjFxD4IDsxwuRAQetESfbW572jH6fFh6WvUkk=;
 b=W8P5MihMKVg7EwSAUqoqo4yRco5P21vQwOT29xToAQv/4unnbgTj3BSliTb6v6fQ27
 9JsgQVwafEL62RJ+mpK9S3XKLC80Ifc81z6Erm7IPx2OBP9s/L+f607V8KjZVtlq9qAU
 CJws0goqduW0XYBh3dOgU7XfOfaUEWatrkjg4NPbLTk5dPFWV6d1NuyZ2y9MtdAeHCLn
 f7bSHphPEULZ10agW9eTNLt1eWhuWCp5Ck6OvCSInFhr+45hGAIYnCteVBvfO0XqI2oR
 GP6OEBVEqnLG0JPRKjYNeOiy/sqTkWPhCmB3BbamAu/nIUKUevJNFPzPG7tmaVTzPuLj
 rVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0S+4gBrjFxD4IDsxwuRAQetESfbW572jH6fFh6WvUkk=;
 b=RN6i348ceTVLJ0f/XDtV8hPBNYqTzyvwEoORx5qysw+bQ6WMwk46u/yt11FkR42Yf+
 a8CJIPP8lXykWkC2Ms0su5mscN97qIdWaO4//XXe7ayQhh55sC32jZVDMzTskH0aAmGt
 sCrQxS08jw9oAjAq4cSySiMO7n40HLNmrdcl/YlWhbuUPqOvEaBxVcqoofGWNgeZRnFZ
 PYsrTHKLh+HFZMrxJCWmTr1wfiUi3nRi7ji4du5fZHJUVz/ejqOaFkt/7RXSJMUB7xVG
 LVOjGrtERPlYHgQM80E5jbMQGUg0MgzSbyD2jpGHfmNpDPTkgbJh1w4u7cVOJnM4/3Vm
 g9Ew==
X-Gm-Message-State: APjAAAV6BttGFCfy6zeZNuBthgDBErkcYw20KoKrrR4ZeHX7BU1Sxjx5
 ZmRGwIWaYVP6B2wne/6i9veE2w==
X-Google-Smtp-Source: APXvYqzY2OneKDWIsgPvVryRFgNybBYSnTf9pHUWJNpN8TaGuuamm9rh0RLOmrm7/w65Jp1mQ6PuXg==
X-Received: by 2002:adf:f601:: with SMTP id t1mr43430852wrp.337.1563371026340; 
 Wed, 17 Jul 2019 06:43:46 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id w23sm25040444wmi.45.2019.07.17.06.43.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 17 Jul 2019 06:43:42 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EA8DD1FF8C;
 Wed, 17 Jul 2019 14:43:36 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 17 Jul 2019 14:43:24 +0100
Message-Id: <20190717134335.15351-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190717134335.15351-1-alex.bennee@linaro.org>
References: <20190717134335.15351-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::435
Subject: [Qemu-devel] [PATCH v2 12/23] tests/docker: Install texinfo in the
 Fedora image
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

The 'makeinfo' is required to generate the documentation from
the 'html' Makefile rule (called by 'install-doc').
The NSIS installer uses these files.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20190715174817.18981-6-philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/fedora.docker | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 226ac1026fa..4ddc7dd112a 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -87,6 +87,7 @@ ENV PACKAGES \
     systemd-devel \
     systemtap-sdt-devel \
     tar \
+    texinfo \
     usbredir-devel \
     virglrenderer-devel \
     vte291-devel \
-- 
2.20.1


