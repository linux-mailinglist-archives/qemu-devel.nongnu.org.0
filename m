Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C77B51EC89
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 11:37:51 +0200 (CEST)
Received: from localhost ([::1]:40316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nndMM-00012R-2v
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 05:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nndGT-0001qF-Tj
 for qemu-devel@nongnu.org; Sun, 08 May 2022 05:31:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nndGS-0008QI-9C
 for qemu-devel@nongnu.org; Sun, 08 May 2022 05:31:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652002303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KJFHzBbFoIUCDuff+JNfKtPCj2Q+glCsV9uQ09Zjsyg=;
 b=LeucBs4ChCKqWq+flAdDnO7ziwHAhVjANLn/+LOzEYSfCHwhPqECxrkN5lz+hDU+c/tZIG
 gEe9jS802ebL+9GxyJ7VdRclBDCC93JmfREJ2TqfFjImNGJnLUqrIBysh/YSOzhZBmZMvn
 Cmp1TvpMhCKLXO8JaQH4x7R5siKe2jg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-oFBw9kWDNBOnqTcqNCAqhw-1; Sun, 08 May 2022 05:31:42 -0400
X-MC-Unique: oFBw9kWDNBOnqTcqNCAqhw-1
Received: by mail-ed1-f69.google.com with SMTP id
 ec44-20020a0564020d6c00b00425b136662eso6579177edb.12
 for <qemu-devel@nongnu.org>; Sun, 08 May 2022 02:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KJFHzBbFoIUCDuff+JNfKtPCj2Q+glCsV9uQ09Zjsyg=;
 b=saBBtrJ3QYeLyt8NBolXb2SW42ug+xSukSorg8QjT3n4m4teu7Eo7IOUwRUYPmboUP
 YRBDxX2FHQMO1EydYB6y/FFDmjVwSs5zGQPX+db0LQIAvSdacSnTEN9zh5h5cCzelR9K
 GNgmIXYuwksSGUpqf3vlWuK8kvLfpF+PBAF10RO5378fXQHm7MfOyQgZSrORKQv+WlkW
 XVAULz56qbPhYMndX7dSWq2qSl9NyCqWlwVJw1rMumhar9AdDvSEJUgk0NbsxWtZrQhz
 WzS46Zwf26rIDhpwXaJIIXLBXg3AU1Y3Y7uE/8V/VM0ycTX//LTdvwxEpjd3X5HkpAzf
 IslA==
X-Gm-Message-State: AOAM533aWhh1m1ltkoyndLB971uCkDh6Ta+OHCy1CiCwLS/1CIxjtZ3m
 4tTpCvPYbJeNB+DxwojYc0znAP2RbT1x1I0djSzzKmeOh4MrbV0D+kh5zy6Gbx8H+F2iieUe2bw
 gXZ8r+Cnrrq6cIm8sgxObrnSuKMVOmGcVvaZtQukH++TYpF/NNOSG70aDqWzUvk2HY2I=
X-Received: by 2002:a17:906:c114:b0:6f5:db6f:71a1 with SMTP id
 do20-20020a170906c11400b006f5db6f71a1mr7551011ejc.338.1652002300670; 
 Sun, 08 May 2022 02:31:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqpLyZ2sip2xYKA2bL5C7T4I4PHHbXjbKaUIC6P4lMJh9kQwVGmkYbNWqdyOjBkpTQ/Nld+g==
X-Received: by 2002:a17:906:c114:b0:6f5:db6f:71a1 with SMTP id
 do20-20020a170906c11400b006f5db6f71a1mr7550989ejc.338.1652002300361; 
 Sun, 08 May 2022 02:31:40 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 p21-20020a17090653d500b006f3ef214e3csm3752866ejo.162.2022.05.08.02.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 02:31:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, malureau@redhat.com,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v2 5/5] net: slirp: allow CFI with libslirp >= 4.7
Date: Sun,  8 May 2022 11:31:20 +0200
Message-Id: <20220508093120.173131-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220508093120.173131-1-pbonzini@redhat.com>
References: <20220508093120.173131-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

slirp 4.7 introduces a new CFI-friendly timer callback that does
not pass function pointers within libslirp as callbacks for timers.
Check the version number and, if it is new enough, allow using CFI
even with a system libslirp.

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
Reviewed-by: Marc-André Lureau <malureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/meson.build b/meson.build
index 264a5fb5ed..59ca709078 100644
--- a/meson.build
+++ b/meson.build
@@ -2637,10 +2637,25 @@ if have_system
   slirp_opt = get_option('slirp')
   if slirp_opt in ['enabled', 'auto', 'system']
     have_internal = fs.exists(meson.current_source_dir() / 'slirp/meson.build')
+    slirp_dep_required = (slirp_opt == 'system' or
+                          slirp_opt == 'enabled' and not have_internal)
     slirp = dependency('slirp', kwargs: static_kwargs,
                        method: 'pkg-config', version: '>=4.1.0',
-                       required: slirp_opt == 'system' or
-                                 slirp_opt == 'enabled' and not have_internal)
+                       required: slirp_dep_required)
+    # slirp <4.7 is incompatible with CFI support in QEMU.  This is because
+    # it passes function pointers within libslirp as callbacks for timers.
+    # When using a system-wide shared libslirp, the type information for the
+    # callback is missing and the timer call produces a false positive with CFI.
+    # Do not use the "version" keyword argument to produce a better error.
+    # with control-flow integrity.
+    if get_option('cfi') and slirp.found() and slirp.version().version_compare('<4.7')
+      if slirp_dep_required
+        error('Control-Flow Integrity requires libslirp 4.7.')
+      else
+        warning('Control-Flow Integrity requires libslirp 4.7, not using system-wide libslirp.')
+        slirp = not_found
+      endif
+    endif
     if slirp.found()
       slirp_opt = 'system'
     elif have_internal
@@ -2713,18 +2728,6 @@ if have_system
   endif
 endif
 
-# For CFI, we need to compile slirp as a static library together with qemu.
-# This is because we register slirp functions as callbacks for QEMU Timers.
-# When using a system-wide shared libslirp, the type information for the
-# callback is missing and the timer call produces a false positive with CFI.
-#
-# Now that slirp_opt has been defined, check if the selected slirp is compatible
-# with control-flow integrity.
-if get_option('cfi') and slirp_opt == 'system'
-  error('Control-Flow Integrity is not compatible with system-wide slirp.' \
-         + ' Please configure with --enable-slirp=git')
-endif
-
 fdt = not_found
 if have_system
   fdt_opt = get_option('fdt')
-- 
2.35.1


