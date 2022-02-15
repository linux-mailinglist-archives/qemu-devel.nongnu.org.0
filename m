Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D12EA4B65BE
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 09:18:07 +0100 (CET)
Received: from localhost ([::1]:44046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJt2E-0006zk-Vb
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 03:18:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJspo-0003DC-SG
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:05:17 -0500
Received: from [2607:f8b0:4864:20::1031] (port=45620
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJspm-0002Hl-Bk
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:05:15 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 q11-20020a17090a304b00b001b94d25eaecso1453279pjl.4
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 00:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5Hph4sk4oyPtFjQNA2cfWHdIT/B6rQkBhH5AEZC1b9k=;
 b=m5L7a1SAcvuM5JSCbqvB3nB+WSVL8EQXN9Vj+0B+vxYUetHSqjIzvnEQ8o7Qcw+e/3
 OIVZlS5y9tNJwScijO+phhRWZ46IHCCQVobY2r5woE+ej3oJnyT+gJk2Uu5MASCXG/3b
 Hp1x651bA0JBvZ+tpFZGF6z9LRc0CYZLNTVSbWBQnIaslGiK4hFipoSYWHrKNTNsapsk
 234qmTOsXnHELuLss5DnChX4fi9b4yavIYsqLEJnRnWPPTfL/n8W7moGUD6YvzZDxqvU
 H/a1AHy10XUyXz3y0gCeZVA1UW4jf4509Wq4NPlFqwQcCF2zMgFoRmRvwqWMZraO1Wpj
 KOyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5Hph4sk4oyPtFjQNA2cfWHdIT/B6rQkBhH5AEZC1b9k=;
 b=UR2M5LfNb92fun1esOj4nid26/8TvV+xWNJp4Ci36nYT082vUnJBMc592CsHPGOhs6
 5PRaXuKo1SbGhvwZxpSyctJpDeAJrAedOvt/VqKUYZ/1eTh2AouiJ7/6kiCKkqLVuedT
 d+QEChSbfCbtXL/v3t5uTBtr2fr5XJbjHOdxFD7PObKwXML1oBCHcaHY4j7RpdYvm1bV
 ZRuVgE/HTsicvRFdMURG2/PZqxlTXu3PH20FkPPgLy9mXoA5wJwFBmD3magDiRO5elqd
 SlnN+nPA9WR6P5v2EhznvKG1lSPm1RORBDMq1pepJzqgZv5NBwDZKd0Dl5GZWD/jGw9m
 +dWw==
X-Gm-Message-State: AOAM532ZObR/4H/SK8dyLrrsI3x6Q1jQUQyH+flJtjviKc9N8OFSaSpW
 FpzNYjcEVTbLUsIo7VZumQ12/7PvEXk=
X-Google-Smtp-Source: ABdhPJzAq1yCFLrcrojEuIzTkBXAcEBJm6EawDrgzpRzIJU0THDYSnl+xr2Oc72lZC4VltgU2PSxCg==
X-Received: by 2002:a17:903:2406:: with SMTP id
 e6mr2922566plo.21.1644912313104; 
 Tue, 15 Feb 2022 00:05:13 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id j2sm38841461pfc.209.2022.02.15.00.05.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 00:05:12 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, Will Cohen <wwcohen@gmail.com>,
 Cameron Esfahani <dirty@apple.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v6 14/15] lcitool: Refresh
Date: Tue, 15 Feb 2022 09:03:06 +0100
Message-Id: <20220215080307.69550-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215080307.69550-1-f4bug@amsat.org>
References: <20220215080307.69550-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Run 'make lcitool-refresh' again.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/docker/dockerfiles/ubuntu1804.docker | 2 --
 tests/docker/dockerfiles/ubuntu2004.docker | 2 --
 2 files changed, 4 deletions(-)

diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
index 699f2dfc6a..040938277a 100644
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ b/tests/docker/dockerfiles/ubuntu1804.docker
@@ -65,7 +65,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libpam0g-dev \
             libpcre2-dev \
             libpixman-1-dev \
-            libpmem-dev \
             libpng-dev \
             libpulse-dev \
             librbd-dev \
@@ -89,7 +88,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libvdeplug-dev \
             libvirglrenderer-dev \
             libvte-2.91-dev \
-            libxen-dev \
             libzstd-dev \
             llvm \
             locales \
diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
index 87513125b8..159e7f60c9 100644
--- a/tests/docker/dockerfiles/ubuntu2004.docker
+++ b/tests/docker/dockerfiles/ubuntu2004.docker
@@ -66,7 +66,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libpam0g-dev \
             libpcre2-dev \
             libpixman-1-dev \
-            libpmem-dev \
             libpng-dev \
             libpulse-dev \
             librbd-dev \
@@ -91,7 +90,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
             libvdeplug-dev \
             libvirglrenderer-dev \
             libvte-2.91-dev \
-            libxen-dev \
             libzstd-dev \
             llvm \
             locales \
-- 
2.34.1


