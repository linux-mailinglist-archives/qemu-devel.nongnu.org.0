Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09883529E79
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 11:49:58 +0200 (CEST)
Received: from localhost ([::1]:51304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqtq1-0003xR-1c
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 05:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqtTa-0008UN-8M
 for qemu-devel@nongnu.org; Tue, 17 May 2022 05:26:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqtTY-0003bI-Kl
 for qemu-devel@nongnu.org; Tue, 17 May 2022 05:26:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652779604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xrNzp6VGsRlwSzSjxZKBmcUnUnmc5346uqDi9fT1Kgw=;
 b=NDSqm0T7o+Ag+DVoIB2M3ElqaQZE/PvSuyygR3AaCdoiloXRCn9OiaG7XlUiUhSDgrAhBo
 UYplcJJHSDWSKblul0wc6PueixgPkmGiy7moiyMBUekrIDEjO7W3yD7QIrMP9QNrscvxby
 jBCzglLeJrPh10R3eg6gBWm682eKyKQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-vFcAyu-iM_GJD0uWQMcx5A-1; Tue, 17 May 2022 05:26:42 -0400
X-MC-Unique: vFcAyu-iM_GJD0uWQMcx5A-1
Received: by mail-ej1-f69.google.com with SMTP id
 go17-20020a1709070d9100b006f46e53a2a9so7054830ejc.10
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 02:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xrNzp6VGsRlwSzSjxZKBmcUnUnmc5346uqDi9fT1Kgw=;
 b=OvwiRC2YSG5MvqyLK7VRqZUB1FEqTpJ5jFUOIKQMqjKYfT1cRdfC7gYA6RhK63Ytt8
 iLVIJgG0PMFI902+w+Q3DkDTlr4UooFbYZw6mEyy4ce5PQxfs4gklc8SDn4YMvBjo7tT
 s3HBq6LDMCW6JPQyWiX+DLx8YDSX3xpnmKVOZEDqFJ7g6njngsoiVxpuwxg1p0jX36TL
 hT2XUyqFJDTEjfIrRndXaa4f06WNEU1DCap3vwsjtIpqUKODhASMkp6lPKn8feoluoqe
 rjfOO43ZC+sOofo8SoBdnv75UKUmOJ8VRJHV3zFGqimBU6NizU91bgfh+ae99LEKsalI
 JRcA==
X-Gm-Message-State: AOAM533x04bHquPxoA3qDZVElayuzlCUUPobYjXj8/5Xzh1fRLzfVPN0
 RnFLgdKsvqogOFE8zyeFihE6RtYVQl8QyHBmldZy1QtY33uAk3kqt/DZTW8A6SgqtWjRhSMYuZm
 HqOtor5TU70wuK2xYgHGJkb203Guc4Tk5i/rWFYhDLHXpQfscdt/TMn97PI7lCM/axS8=
X-Received: by 2002:a50:cd08:0:b0:426:1d9b:4b13 with SMTP id
 z8-20020a50cd08000000b004261d9b4b13mr17691633edi.360.1652779601490; 
 Tue, 17 May 2022 02:26:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7t62+IckN42XQlZhIO7xu3h97z8cpA7gPQm0/hLGWXVqWZe3L5rS+DYe4oCaVDSBza5poug==
X-Received: by 2002:a50:cd08:0:b0:426:1d9b:4b13 with SMTP id
 z8-20020a50cd08000000b004261d9b4b13mr17691617edi.360.1652779601291; 
 Tue, 17 May 2022 02:26:41 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 9-20020a170906020900b006f3ef214e62sm809895ejd.200.2022.05.17.02.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 02:26:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	richard.henderson@linaro.org
Subject: [PATCH 09/16] configure: handle host compiler in probe_target_compiler
Date: Tue, 17 May 2022 11:26:09 +0200
Message-Id: <20220517092616.1272238-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220517092616.1272238-1-pbonzini@redhat.com>
References: <20220517092616.1272238-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

In preparation for handling more binaries than just cc, handle
the case of "probe_target_compiler $cpu" directly in the function,
setting the target_* variables based on the ones that are used to
build QEMU.  The clang check also needs to be moved after this
fallback.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/configure b/configure
index 1d9d60185c..016df3fa6e 100755
--- a/configure
+++ b/configure
@@ -964,10 +964,6 @@ case $git_submodules_action in
     ;;
 esac
 
-if eval test -z "\${cross_cc_$cpu}"; then
-    eval "cross_cc_${cpu}=\$cc"
-fi
-
 default_target_list=""
 mak_wilds=""
 
@@ -2021,13 +2017,6 @@ probe_target_compiler() {
   if eval test -n "\"\${cross_cc_$1}\""; then
     if eval has "\"\${cross_cc_$1}\""; then
       eval "target_cc=\"\${cross_cc_$1}\""
-      case $1 in
-        i386|x86_64)
-          if $target_cc --version | grep -qi "clang"; then
-            unset target_cc
-          fi
-          ;;
-      esac
     fi
   fi
   if eval test -n "\"\${cross_as_$1}\""; then
@@ -2040,6 +2029,20 @@ probe_target_compiler() {
       eval "target_ld=\"\${cross_ld_$1}\""
     fi
   fi
+  if test "$1" = $cpu; then
+    : ${target_cc:=$cc}
+    : ${target_as:=$as}
+    : ${target_ld:=$ld}
+  fi
+  if test -n "$target_cc"; then
+    case $1 in
+      i386|x86_64)
+        if $target_cc --version | grep -qi "clang"; then
+          unset target_cc
+        fi
+        ;;
+    esac
+  fi
 }
 
 write_target_makefile() {
-- 
2.36.0


