Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 404682DFD9C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:34:27 +0100 (CET)
Received: from localhost ([::1]:49930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krNCc-0007tF-3Y
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:34:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRJ-0004wo-Mi
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:33 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMRC-0007kx-KU
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:33 -0500
Received: by mail-wr1-x434.google.com with SMTP id t30so11339744wrb.0
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ShYU9aOzFgjl095Tg4E1zebighsrFbmAImMfMf68LL4=;
 b=EgsjkKON+xfiE8+K8jYLSt0dq86gmG5G9/yGzdlquso/zUQwoUIrLONqMFsg+qre0A
 3cDuAXf1gHacgTPZQlyQAPLmD42vmBCo2JSTYKFrf9nJY2eb8WZ5h7RzoliVnkKRjTwa
 JHf1DeyHbWWk9vIliUvyj0s1FbcmK3oCHV0F6iM+aCfLqUj90pYV8M7NAwEZ1eYG8RBE
 9aTm2+Ci7mEUzluYBWwwxBCPRMcX0V9d/8khAduluAKAZNcX2zJFHU7mqodvZT+kv3uD
 xOG0zeqt4kf63qoBSA40o4+EJ2WYj0jnZBJ1oP7O34aqe7UoRbMPYZN40733LPXOoUaZ
 qsWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ShYU9aOzFgjl095Tg4E1zebighsrFbmAImMfMf68LL4=;
 b=O62mfshZAJ6AV1tsJwKW/Bi4uNd95g82VoT9hitgMU839k2a1mRHV40nxjNRyroC0B
 uKeMyOFCE6YU4+b8IVSHrJc0ZPkog/JnUCLH51rScbh7PjnAiEO/uXmXwCh2hAWLzzML
 GyRqC4ZpMC1Wt1/fO41Z0+A14VzkPZVJSoXO1H/eTwU5892xD7rcvUUI9ILgI7m6ZBFo
 YtOnVJjcMrpNmoD7C+eB5SWeBM3hU/kA+bfUi67I5z2n6QZMOx2VADFfYwGelJZuFL01
 49TsovELvRYZYpLvAD+E3Skkpk22/wspHAAmMYTUETNbzqtqJvPb6MI8XeAKLXrmV+vv
 YjjQ==
X-Gm-Message-State: AOAM533UgQMdPfhJx877gu7gHiVtVniwXrj2X1D0UiTqt39LDSNbXmOb
 AmFtlQkv2lr1ib4hnmNx0e0/BC72eVo=
X-Google-Smtp-Source: ABdhPJxpfC/OeezRAbUa2C/H+j8R4j55ZpWuDTh+ytAWENNlxGZh4aEXQGz6tg+2qdZlBlFjLKgm8g==
X-Received: by 2002:a5d:51c4:: with SMTP id n4mr18711429wrv.67.1608561912082; 
 Mon, 21 Dec 2020 06:45:12 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:11 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/55] meson: update submodule to 0.56.0
Date: Mon, 21 Dec 2020 15:44:18 +0100
Message-Id: <20201221144447.26161-27-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 2 +-
 meson     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index f470cdbe50..0a6de3b8ef 100755
--- a/configure
+++ b/configure
@@ -1936,7 +1936,7 @@ python_version=$($python -c 'import sys; print("%d.%d.%d" % (sys.version_info[0]
 python="$python -B"
 
 if test -z "$meson"; then
-    if test "$explicit_python" = no && has meson && version_ge "$(meson --version)" 0.55.3; then
+    if test "$explicit_python" = no && has meson && version_ge "$(meson --version)" 0.56.0; then
         meson=meson
     elif test -e "${source_path}/.git" && test $git_update = 'yes' ; then
         meson=git
diff --git a/meson b/meson
index 776acd2a80..f16d31607e 160000
--- a/meson
+++ b/meson
@@ -1 +1 @@
-Subproject commit 776acd2a805c9b42b4f0375150977df42130317f
+Subproject commit f16d31607eb3cd0f281758bd0944e206ef6be387
-- 
2.29.2



