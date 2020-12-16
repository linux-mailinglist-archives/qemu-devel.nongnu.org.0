Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 928942DC2B4
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 16:06:54 +0100 (CET)
Received: from localhost ([::1]:47590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpYOD-0001hP-M2
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 10:06:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpYJm-0004TJ-KU
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:02:18 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:43121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpYJh-0007TA-4l
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:02:18 -0500
Received: by mail-ed1-x535.google.com with SMTP id q16so25117769edv.10
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 07:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8/RVYQc5F8sqm0EKxAYHKWrSyoP3ucjT0ePZdg6QJ0c=;
 b=tviQD6hJRpiRzBmoJjS/VWbBgkoi7XMXt1UcHaEYDrQWyJEs31ijzMPlgeAZa/wjMt
 ZfvOr9f/8GesBA/6bi3CwCuvRfiPPGQe3XCXhMPyv26Q4gDBrsN0tfZSzLSSl/2W1JJ+
 KfDs7GqiLVTIUiayu4TcuaPD4GVXj65mcL5c9d4x0W/IVXmZVCwemPoZGD4mgcc9Rz9Z
 4GYSe/uRhVNlVzearrOjoepxZFfjgAbPnnmMdYic8x4s4XLNtObRyT+idAZiKMDCX7Yr
 WyTb62hrsBHfzNp66pJh6A0pjrot4U8fH66R//LoM5oxXD/Po+5bkHxm6Ws2ecQjEEjw
 VjWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8/RVYQc5F8sqm0EKxAYHKWrSyoP3ucjT0ePZdg6QJ0c=;
 b=mTtotCD8O1I9RDWxx4zhMcA2OsLomtUrjPOT0VGqZBZG3J+eSg30TAAPOdeMu9rA0q
 ezPmiocu6RGZlWtPXs5pDKDJ6MNORhyHaejTcCCcwxqTOaWsucQdcS3e4ZFxNG5i164d
 Tfup3Rd4hfPmMoXEyAvKhylLCOP2AcI7rZDVVQ5xt3rfrW9cSFpT0HfTDvwI9q+EW+II
 9RQby80ac+8MnJPYCaUaZnAUDv/Bq/h7YL2C+EQ4HQsQsN6eqDeR2GGFZGBz/LAEReXf
 J9hogjzeA+gyJIif63NMwFHOAxO7FEYeaz+M81bZoR9WW7nbRN2mZVBodDjpclmqDe7g
 PF6Q==
X-Gm-Message-State: AOAM533SBElrUspEgZXsV4ZJr9WGJ/gKSfOT2R2xAUQFqwgRV9uds2B1
 Vvmqs70WGbIckWZc1wOTbJPK9LjknI0=
X-Google-Smtp-Source: ABdhPJxuqCXfM+A9r8vsxGQ2qSZECayu88xKrr6hYLYSaINJIRUUysDGjh7L58mhM/9Bfz97jCeTsg==
X-Received: by 2002:aa7:d297:: with SMTP id w23mr20541681edq.374.1608130931164; 
 Wed, 16 Dec 2020 07:02:11 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v24sm21397059edw.23.2020.12.16.07.02.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 07:02:10 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/7] meson: update submodule to 0.56.0
Date: Wed, 16 Dec 2020 16:02:02 +0100
Message-Id: <20201216150207.431437-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201216150207.431437-1-pbonzini@redhat.com>
References: <20201216150207.431437-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
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



