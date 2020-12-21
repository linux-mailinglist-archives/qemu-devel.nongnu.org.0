Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4602DFD00
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 15:48:04 +0100 (CET)
Received: from localhost ([::1]:43814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMTj-0006eS-Hk
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 09:48:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMQe-0004gs-Rp
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:44:52 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:37021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMQd-0007bw-Dq
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:44:52 -0500
Received: by mail-wm1-x331.google.com with SMTP id q75so11187841wme.2
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dlm6bXWaBbuv+Ol2HceMiiYjxW7VEJXnt7yRt9Kk1sI=;
 b=tMAz42rp1BCf4WjgaIbz7YsZZaMH5qwc079e17akhilZJTCppDd+VyQu5UUQCZ1YWL
 aydvfo4yZhXUf/Yn/w9VqGTlbq+9sjpIBkSuxf4oSV4p1SIztr9imVqu002LGVvGA39s
 i4voSkMPkp5m5NDqly5t2XyGhfbdKWp9Nb8V3Ed3yHEZYqd4xM+Up2/0qPvVkp2B1CNj
 IcTTtCeZzNbj9XPgvg/KzMxPtipQuZSwH30XEHyV7HZXSf3xAVra99yRp0Lb/UvNN9tx
 hY5eowrkEo7FW4KCe8GOHRWoclfsW2onfO6REieHzafZ55xmlMpOkjVlA0YhO0A3iiTU
 IftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Dlm6bXWaBbuv+Ol2HceMiiYjxW7VEJXnt7yRt9Kk1sI=;
 b=ZhAjBNSAHQIH3ewY2hP0RFCzAyJz3g/rXt0lcteDKDC67OnhuvZ+rO97dx0PQ8iFnN
 GKKZOV1PgTScWYEuU3YLLEzEPPqei976oKV9aAQ80PuIAo2DzR+W9YbPXNkMbAos6aNZ
 q0DDPE9ifLUmvN1OcrkJjiwJGQTTOgqG+yofsUF6wj64K6Zc+b4yafoXvImh3HgQI6TQ
 MB7FZOga4mkYVOfNDpkhhX3tZEi14FR496nXHbxYN2NIV5cuzcu/3Zm50JM7WO5h0HhL
 1gs/HN0M9WFC/nyCfMlp2G/AJZGLxhad0tpSlWUg/aLbIa48exjn0PIjllWaCq43hjGt
 K6fQ==
X-Gm-Message-State: AOAM5309g0utS3DTT30MKFwHGwdG9pHP1jTonjM4Zr0eNC9gtgE8OWFI
 5FWENCimMJ0bN6Fk9bgMaOOyYubJU0U=
X-Google-Smtp-Source: ABdhPJzfqXmOsZq1ENON6Z9i/m6Yt06fE6Ys4R+Ckmk20GcO/R2oFvV9sVP1OCXDVF1bgMIYWPabXg==
X-Received: by 2002:a1c:4d12:: with SMTP id o18mr17270621wmh.114.1608561890148; 
 Mon, 21 Dec 2020 06:44:50 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:44:49 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/55] gitlab: include aarch64-softmmu and ppc64-softmmu
 cross-system-build
Date: Mon, 21 Dec 2020 15:43:53 +0100
Message-Id: <20201221144447.26161-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x331.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

Otherwise we miss coverage of KVM support in the cross build. To
balance it out add arm-softmmu (no kvm, subset of aarch64),
cris-softmmu and ppc-softmmu to the exclude list which do get coverage
elsewhere.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20201210190417.31673-3-alex.bennee@linaro.org>
---
 .gitlab-ci.d/crossbuilds.yml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index bd6473a75a..fcc1b95290 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -7,9 +7,9 @@
     - cd build
     - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
       ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-user
-        --target-list-exclude="aarch64-softmmu i386-softmmu microblaze-softmmu
-          mips-softmmu mipsel-softmmu mips64-softmmu ppc64-softmmu sh4-softmmu
-          xtensa-softmmu"
+        --target-list-exclude="arm-softmmu cris-softmmu i386-softmmu
+          microblaze-softmmu mips-softmmu mipsel-softmmu mips64-softmmu
+          ppc-softmmu sh4-softmmu xtensa-softmmu"
     - make -j$(expr $(nproc) + 1) all check-build
 
 # Job to cross-build specific accelerators.
-- 
2.29.2



