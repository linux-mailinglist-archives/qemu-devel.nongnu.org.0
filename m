Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 478704853EA
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 14:58:31 +0100 (CET)
Received: from localhost ([::1]:53904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n56oA-00080A-BG
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 08:58:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56gP-0008Az-0d
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 08:50:29 -0500
Received: from [2a00:1450:4864:20::52d] (port=37523
 helo=mail-ed1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56gM-0004DC-EG
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 08:50:28 -0500
Received: by mail-ed1-x52d.google.com with SMTP id o6so162352017edc.4
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 05:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=smuEymZ/1pQsvS7+c4ba19U8FG2Lw5F+0Iqeb8JznnA=;
 b=icIYJRCloOI3JkHNjXN0QaYdbxn4VNKpbyruyK63xKy/vp+qDRSwbUi4a87e1e8jte
 kApgBZoDO/9Z/LZL1nqKJZT6PFbsaOcrEHbAE1una2BPRUyo9aOKJCyC2touJuDkvB7q
 yueaIzV5LGP0H3U4AE3XEIVQ280j5/voXN2pIaiEi/ErXz+FkGXjIPXflyUAzXMjfd7o
 Yqqku/8W0u2TMaU2/+2OFoHSfFTatPqlI9zwEHjWv02NbB/qwRMokPeXgx3OuNX3Qpu9
 Vi8pZlK/S2HRVP3dQdgNsT+7WPPjjU1q0W7vaVbHwk0eVNUS0ggYQ/iGS5v6YshSnqjN
 IwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=smuEymZ/1pQsvS7+c4ba19U8FG2Lw5F+0Iqeb8JznnA=;
 b=BSxi3fl2kOm8mwOxe8h8JgetkZGZB1yy1y1VEFIl0m687XQBii6YFI+ODhlhLzfLJa
 CZ9ejL0k7J9Atr4z5bInEoARziQDlMhLYSYQW7nYA5nIoPBTaSnzzOu8LYkGDMuVsOU4
 Gg+PuHZhIsUnxGl7Yj8+EjFcxbdhRNTnDJDg6G1q8dWvNctC3wvEHWgyRvFmNuz5j4qf
 fiQRLNEFQcRf8IRpqLPO83plZqqvtikw8hAab1nEZvk9fQtR+mMusFJ5YbhPyY2eeVfm
 hraHuH9XRSzhZiXBUb9I5fv7xGSuNlWlGOU7HQiJw54JGo9ODq+XcNxVVSmejiVaiflT
 qcRQ==
X-Gm-Message-State: AOAM5306ipXaQqf3Vh8lTB1cu0dZxUkE/iQvDrHuF1/W75ELycWs2Vff
 qOzIbJLFUKBWPYVeo4ZR+W32o3PzAJkPBw==
X-Google-Smtp-Source: ABdhPJyeFi7foqaaocnCYhUmJA9nx6ID4WYY7gsDkVnzS2KH3JP7gyLjuotfg3NWOw8XX2I99oselg==
X-Received: by 2002:a17:906:c788:: with SMTP id
 cw8mr43541991ejb.528.1641390624349; 
 Wed, 05 Jan 2022 05:50:24 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a3sm12421790ejd.16.2022.01.05.05.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 05:50:17 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 979EB1FFBE;
 Wed,  5 Jan 2022 13:50:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 06/34] tests/docker: switch fedora image to release 35
Date: Wed,  5 Jan 2022 13:49:41 +0000
Message-Id: <20220105135009.1584676-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220105135009.1584676-1-alex.bennee@linaro.org>
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

The Fedora 33 release is shortly end of life. Switch to the newest
Fedora 35 to maximise lifespan until we need to update again.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211215141949.3512719-7-berrange@redhat.com>
---
 tests/docker/dockerfiles/fedora.docker | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index c6fd7e1113..855aefaac5 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -1,4 +1,4 @@
-FROM registry.fedoraproject.org/fedora:33
+FROM registry.fedoraproject.org/fedora:35
 
 # Please keep this list sorted alphabetically
 ENV PACKAGES \
-- 
2.30.2


