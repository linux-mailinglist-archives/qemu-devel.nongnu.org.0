Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C11E62DC412
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:26:18 +0100 (CET)
Received: from localhost ([::1]:56538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpZd3-000082-Q0
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:26:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpZXB-0002AO-8p
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:20:14 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:33170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpZX9-0006Ug-DO
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:20:12 -0500
Received: by mail-ej1-x629.google.com with SMTP id b9so8638707ejy.0
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8/RVYQc5F8sqm0EKxAYHKWrSyoP3ucjT0ePZdg6QJ0c=;
 b=LVFr2/ppRQyHFjCEitmGQg9fG8h7/VOV2zMTbzVwN7Ywf8O+kJflaR8hlmDl61InSZ
 5CYdOn0C40cMoKTYKUrdLJeBj+ZzZBPN7rWzyf4bQ8smOPjqQi+O6q8gARGWSf2DKlYQ
 UZDYEv7ekM6YWceEehOpmiFivRzKQnetum9wRz0embQ4w7pJM8+t6h1bJT+oDhsnxRCp
 v9jOiqF+CNtFME45mUz4RgheOUSUt/PgWMK6/mMwlITZBp4GLv5ZCtJnjmNtBe2iozYe
 aecKqdvW8ngOZAj/zWptnNyhHgyjOF1k9DqnJ01S3Yz/o2qX6qF/RN74h13ub3hbJ3N6
 cYjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8/RVYQc5F8sqm0EKxAYHKWrSyoP3ucjT0ePZdg6QJ0c=;
 b=nMIV6T6C2r7wQp6why0zVD8lcoECGncbgy2iJZk2tzzORDdBobksWerkuxHH2fv21m
 KqRKlR4a+gzHBS5cTXbdXAaUijVKITel+bgrC9uGmY0UifsOeTKPJ0ZEfQ0PJfqTSEJv
 GAqG4TKt4ZuONw6svmL3iXwiKCmbN9R4KUElYiMH2/xi8zGnH8NWHquFDjNvpWsek1pV
 4zfw8pJ8jzfnN9PAopzE2eiNp6x95NFPWMEKrdDHTTirHLWslcqx0L49BLYfGST88EBo
 gE1qn1/xmDHEqTYjOJ0ph0YmDBg/TgwT5vf31bVaUxLteFIty+z3CSoUlD+z52apjbqT
 L8RQ==
X-Gm-Message-State: AOAM532ovsaQ1oPWAsoHWlf4iBauCwYO9HqbCjwaqAPqMJP3EOE1GOTN
 ZktMl8iPT8x2UJvK8KN6/mdxx7KPnNo=
X-Google-Smtp-Source: ABdhPJwpN+zBJu+dCI/KCBYj4+FykcRt1fqqMxaxI43iFEw5zshGuUDqst+oqpXYxIqYdZc/xZdwzA==
X-Received: by 2002:a17:906:34ca:: with SMTP id
 h10mr32064585ejb.417.1608135610152; 
 Wed, 16 Dec 2020 08:20:10 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a13sm21264501edb.76.2020.12.16.08.20.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 08:20:09 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/7] meson: update submodule to 0.56.0
Date: Wed, 16 Dec 2020 17:20:01 +0100
Message-Id: <20201216162006.433850-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201216162006.433850-1-pbonzini@redhat.com>
References: <20201216162006.433850-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 2 +-
 meson     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 6317964997..8d12b715e3 100755
--- a/configure
+++ b/configure
@@ -1938,7 +1938,7 @@ python_version=$($python -c 'import sys; print("%d.%d.%d" % (sys.version_info[0]
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



