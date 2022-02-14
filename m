Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F4F4B5AB1
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 20:51:03 +0100 (CET)
Received: from localhost ([::1]:54620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJhNG-0006MN-Fp
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 14:51:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJgYd-0004XK-OD; Mon, 14 Feb 2022 13:58:43 -0500
Received: from [2607:f8b0:4864:20::102e] (port=40934
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJgYc-0006XM-BQ; Mon, 14 Feb 2022 13:58:43 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 n19-20020a17090ade9300b001b9892a7bf9so32315pjv.5; 
 Mon, 14 Feb 2022 10:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J3na8susHmby8TR4jzyryoU+uoSEfyt40zPtMqoq/L4=;
 b=RtbNa16o2veebiOIwgmajkFMfaEI35QQYxwPnzju2/sbZ4WDAP26iNYfL1e8dohAur
 K78iYGsdgB8HxQyMPHqWvW9r7i3vq15jyGF0EsGbfrX0/pnYUTGJoLGMmwfOaY029lVr
 MT402dFHxW/KU1/rZAVtmntcz0qABPzujnCNcC1rZvGbObc11/lpN7NFp/hp4JDgLnBb
 cFJ3QuoFcreBoB/osZ94cp9mrXJDQW5Q0WdVKqB9PLK2GVXX9edVkBj4l6IZ+IDQXnEk
 ap2zLhwCOOv147umw2brojV9SwYrsvVQpEK2kaj0y1bR9wt2Ek55yI3voMuAbCnw4eEE
 x58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=J3na8susHmby8TR4jzyryoU+uoSEfyt40zPtMqoq/L4=;
 b=0RxgwKevOQAaic2ZyThij0AsUFWCHLCGoWlmCHdcn2s+psq+q6MWcrM0H4jtL6H7iE
 rBfsxTbZvFsVrp+LQ7wmtrdCKpZQ5WswApzf7Vuii97t6uwVQgU5zmHhN1nSjDDKMPq8
 8foiwi0C6n5iDLdfLvIkuJAeeRvbvwj4uMxIiW9XnhwW8fXXoTH7IYAcWiIjppTPR9YS
 cgwXdPBpHixBItPKqzfYRj03uamAD7L7TCTgpoKmwTeA4yEQhBZpyo4sAqdyefctZ5BX
 xe6cAxZoPyrvqF2+gO3Nv9nK4y3fOr5wVWt1KFjLG11vAcFwSqFjq7SmcPGP6fC3tA2d
 h6mw==
X-Gm-Message-State: AOAM531R0xrnRjTheMxHBb7fTTjCAs5X5CEQ4iZRM0Rkw/PkUIlVXTVg
 OL6lm67+mHpqMwxNH4OP5XyRGtbhug8=
X-Google-Smtp-Source: ABdhPJzWL8od6OCivR4jNXKCnPwafgSyaOOZv0mvBWfkp3scHGQtA3nqqEnTdBaKlRbScJai1ACT2w==
X-Received: by 2002:a17:903:289:: with SMTP id j9mr259923plr.150.1644865120734; 
 Mon, 14 Feb 2022 10:58:40 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id o2sm288665pga.57.2022.02.14.10.58.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 14 Feb 2022 10:58:40 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Will Cohen <wwcohen@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhang <lizhang@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 15/16] lcitool: refresh
Date: Mon, 14 Feb 2022 19:56:04 +0100
Message-Id: <20220214185605.28087-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214185605.28087-1-f4bug@amsat.org>
References: <20220214185605.28087-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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


