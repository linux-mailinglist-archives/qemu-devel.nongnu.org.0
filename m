Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B8A508CAF
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 18:00:16 +0200 (CEST)
Received: from localhost ([::1]:60812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhCkZ-0000tF-DN
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 12:00:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLl-0001Us-KM
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:37 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nhCLj-0000y2-Rp
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:34:37 -0400
Received: by mail-wr1-x434.google.com with SMTP id u3so2803455wrg.3
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gY77bwNkMdDmjfm+JoMSrch14sfN3pM52znQg3cyUIw=;
 b=EjzD0IklTT9RKqjv9KW7zNLpYATpxq2Ij0RG1tfAsSG04BTXJYo2xsZ4t/EES4gpvu
 0qC/y/U2rmHAtT4rq2HJY1RL741huYZmrmBj0WjsZIQtR0kL2h/gBQW0ef5oNNrTiejg
 d3Pa8KpEnms+/XxoFOLEV9CqRW+1WLpM4bGvIMpYbvVb6CyLgLzR7PWDNtxPaPy6F96o
 xuJB1uUDvjmoxsqks13ed/HVxyqQTDAnH23eZpLM/M5lqr2tiRkEle5Bw233Hfh4QU28
 OBQjlC8KcxJv38A/3WTpufq61Ot8SWV4OmxB69cCAPxZCifSyP5WZgpzFd9EdIjCPkl9
 GXsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gY77bwNkMdDmjfm+JoMSrch14sfN3pM52znQg3cyUIw=;
 b=VnSIBeLtjqqwiIdASoo7XO9C+/kekPia+x/tHdeCDlA8ywkeQ/2XdHe+UKDlqpOUEV
 CgLWnDMBGUmvFM5OZaoQjE6sChX+7+f78rkzIhgsiPwIeNmLT6mVufOW9/i66y+OWVGU
 u0aIweFW5foB9mzHkIRgeqT4juyqy8KfKLsgtUeEoqWXf6dgyMdyPsiPpgtMySTLbuLx
 t+AX5h6HWn8ybaC8IsPLF7yLNk5wS7nGv3bSqj1k/4Raw/KtwOFoMrawV8bvJ4tC9PoS
 KxaoL38fQD+WG3qAOgyyHjywWclRbEu4SWFuA7dbX9RDztRGd4bIjivYMEC9QQ7Omm2L
 S/nQ==
X-Gm-Message-State: AOAM533igkxkY8cqm45aQLZDpigG3K4QxUTba8Mr2yyjEOmm48i2SWGP
 fqNz3QNuO+TaSwpUFlQYulpGrXMempZnJQ==
X-Google-Smtp-Source: ABdhPJxkZRP7TjdyM+RoZyxstKOXDOd//Is9o2oVYuQVV2ehSeITx3kSXqgaSszjEqKi3FGTdAJdaA==
X-Received: by 2002:adf:f046:0:b0:207:a457:5e52 with SMTP id
 t6-20020adff046000000b00207a4575e52mr15931792wro.708.1650468874578; 
 Wed, 20 Apr 2022 08:34:34 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 n68-20020a1c2747000000b0038e6b4d5395sm130401wmn.16.2022.04.20.08.34.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 08:34:33 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/34] configure: move Windows flags detection to meson
Date: Wed, 20 Apr 2022 17:33:50 +0200
Message-Id: <20220420153407.73926-18-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420153407.73926-1-pbonzini@redhat.com>
References: <20220420153407.73926-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 20 --------------------
 meson.build |  8 ++++++++
 2 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/configure b/configure
index 772714d386..87ceb33917 100755
--- a/configure
+++ b/configure
@@ -224,10 +224,6 @@ glob() {
     eval test -z '"${1#'"$2"'}"'
 }
 
-ld_has() {
-    $ld --help 2>/dev/null | grep ".$1" >/dev/null 2>&1
-}
-
 if printf %s\\n "$source_path" "$PWD" | grep -q "[[:space:]:]";
 then
   error_exit "main directory cannot contain spaces nor colons"
@@ -2088,22 +2084,6 @@ if test "$solaris" = "no" && test "$tsan" = "no"; then
     fi
 fi
 
-# Use ASLR, no-SEH and DEP if available
-if test "$mingw32" = "yes" ; then
-    flags="--no-seh --nxcompat"
-
-    # Disable ASLR for debug builds to allow debugging with gdb
-    if test "$debug" = "no" ; then
-        flags="--dynamicbase $flags"
-    fi
-
-    for flag in $flags; do
-        if ld_has $flag ; then
-            QEMU_LDFLAGS="-Wl,$flag $QEMU_LDFLAGS"
-        fi
-    done
-fi
-
 # Guest agent Windows MSI package
 
 if test "$QEMU_GA_MANUFACTURER" = ""; then
diff --git a/meson.build b/meson.build
index d255facbfd..ffca473fbc 100644
--- a/meson.build
+++ b/meson.build
@@ -182,6 +182,14 @@ qemu_cxxflags = config_host['QEMU_CXXFLAGS'].split()
 qemu_objcflags = config_host['QEMU_OBJCFLAGS'].split()
 qemu_ldflags = config_host['QEMU_LDFLAGS'].split()
 
+if targetos == 'windows'
+  qemu_ldflags += cc.get_supported_link_arguments('-Wl,--no-seh', '-Wl,--nxcompat')
+  # Disable ASLR for debug builds to allow debugging with gdb
+  if get_option('optimization') == 0
+    qemu_ldflags += cc.get_supported_link_arguments('-Wl,--dynamicbase')
+  endif
+endif
+
 if get_option('gprof')
   qemu_cflags += ['-p']
   qemu_cxxflags += ['-p']
-- 
2.35.1



