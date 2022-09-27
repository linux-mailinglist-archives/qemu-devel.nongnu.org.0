Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0FC5EBFA7
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 12:23:57 +0200 (CEST)
Received: from localhost ([::1]:35436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od7kq-000875-HY
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 06:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1od7NI-0007kK-Od
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:59:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1od7NF-0008Ts-Sz
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:59:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664272773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GmEzTXeWttwM0cmsdfT/yyFOvuJ57Q0lrjG3lwibT6k=;
 b=NdrDIJ/H/PwFoJcUmAFUymJrJaV0GV8WJU4bUxOQLCKq+Smipxmi2Oz+eQ7YQe4kWQCozP
 AKZa2cU3qj6PKtxDy1Neck18h9LzvdPOAaB8ot+SspkZsqpG4IytwNCijECzr44yCEcI/z
 gQ3UPGXoBxCCH2OZeoy0C92FaCfTQA8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-196-6AZSVkW6P7yvTM0SeiUQXw-1; Tue, 27 Sep 2022 05:59:31 -0400
X-MC-Unique: 6AZSVkW6P7yvTM0SeiUQXw-1
Received: by mail-ed1-f71.google.com with SMTP id
 i17-20020a05640242d100b0044f18a5379aso7510471edc.21
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 02:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=GmEzTXeWttwM0cmsdfT/yyFOvuJ57Q0lrjG3lwibT6k=;
 b=uHV8Z22TZI8mrdi/675iQ0KhApTvOlv6XJrJG4qeAPeTwdMYy06WmGojgb/PLOz2dw
 TPFquJCWvTTSe3IfbBT6LJOtHQF6+okYvACkOR/I+KuI7Ve1Mizy4JWcDRtbgKM+rlPS
 zPWyOxJRRh6E5Wafi4kY/TtbIgUwkIXkamW+IBNShq07XKKxBBnTzLnmdqLNQnrDzew+
 rJVSsNkPBXLJ7X7Kvsa8xA4iYNBQgW9ymYexmSjTxdvY0mHwOexPDm7QP3q0sw5COTvo
 PqwhYktWFAiAazHq3nlm3+MqdABDBmx6Aw0S+ezBBeS0BUaNU9Ku9r0TycOncg0hyfez
 tutg==
X-Gm-Message-State: ACrzQf0L5czGiajYXtkzpfYIH6q/cuCP1K0nO5nzUDXmIy//7yjxsC4K
 +EvrmIIoHSdjbRQFxGUvVM2sXfVZCR8KZSrl062rkWwY900gCKEgXA0/5vbqtuK6AUrJ4Wg6rNT
 BGz+3ASaDSiXfIdHns5DuKc2ZNULJ5yz+XXbf2K2T256CGVMNCDfV+Rt6/n2UsutTo1g=
X-Received: by 2002:a17:907:160d:b0:782:9631:c198 with SMTP id
 hb13-20020a170907160d00b007829631c198mr17623378ejc.520.1664272770272; 
 Tue, 27 Sep 2022 02:59:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6KVjo2kVzncrQFVPTWEX9tqc5R23kQoyPH0sFRdcbEItCOOPJ3iY8YWFSRvy+KSFFZybnAkQ==
X-Received: by 2002:a17:907:160d:b0:782:9631:c198 with SMTP id
 hb13-20020a170907160d00b007829631c198mr17623365ejc.520.1664272769961; 
 Tue, 27 Sep 2022 02:59:29 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a056402348700b0044e7862ab3fsm1005672edc.7.2022.09.27.02.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 02:59:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com
Subject: [PATCH 2/5] meson: require 0.61.3
Date: Tue, 27 Sep 2022 11:59:18 +0200
Message-Id: <20220927095921.261760-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927095921.261760-1-pbonzini@redhat.com>
References: <20220927095921.261760-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This removes the dependency of dbus-display on --enable-modules.  It also allows
cleanups in modinfo collection and allows moving C++ compiler detection to
meson.build.

Because it is now deprecated to use install_subdir to create an empty directory,
replace it with install_emptydir.

Updating the Meson submodule to 0.61.5 also removes the message

    WARNING: Broken python installation detected. Python files installed
    by Meson might not be found by python interpreter.

unless using system meson is forced with --meson.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/873
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/848
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure       | 2 +-
 meson           | 2 +-
 meson.build     | 5 +----
 qga/meson.build | 2 +-
 4 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/configure b/configure
index a963e6afb3..680d96d09f 100755
--- a/configure
+++ b/configure
@@ -1114,7 +1114,7 @@ fi
 python="$python -B"
 
 if test -z "$meson"; then
-    if test "$explicit_python" = no && has meson && version_ge "$(meson --version)" 0.59.3; then
+    if test "$explicit_python" = no && has meson && version_ge "$(meson --version)" 0.61.5; then
         meson=meson
     elif test "$git_submodules_action" != 'ignore' ; then
         meson=git
diff --git a/meson b/meson
index 12f9f04ba0..3a9b285a55 160000
--- a/meson
+++ b/meson
@@ -1 +1 @@
-Subproject commit 12f9f04ba0decfda425dbbf9a501084c153a2d18
+Subproject commit 3a9b285a55b91b53b2acda987192274352ecb5be
diff --git a/meson.build b/meson.build
index 1f6634d4cd..8be01ba1c3 100644
--- a/meson.build
+++ b/meson.build
@@ -1,4 +1,4 @@
-project('qemu', ['c'], meson_version: '>=0.59.3',
+project('qemu', ['c'], meson_version: '>=0.61.3',
         default_options: ['warning_level=1', 'c_std=gnu11', 'cpp_std=gnu++11', 'b_colorout=auto',
                           'b_staticpic=false', 'stdsplit=false', 'optimization=2', 'b_pie=true'],
         version: files('VERSION'))
@@ -1669,12 +1669,9 @@ endif
 have_host_block_device = (targetos != 'darwin' or
     cc.has_header('IOKit/storage/IOMedia.h'))
 
-# FIXME enable_modules shouldn't be necessary, but: https://github.com/mesonbuild/meson/issues/8333
 dbus_display = get_option('dbus_display') \
   .require(gio.version().version_compare('>=2.64'),
            error_message: '-display dbus requires glib>=2.64') \
-  .require(enable_modules,
-           error_message: '-display dbus requires --enable-modules') \
   .require(gdbus_codegen.found(),
            error_message: '-display dbus requires gdbus-codegen') \
   .require(opengl.found() and gbm.found(),
diff --git a/qga/meson.build b/qga/meson.build
index 65c1e93846..a0ffd6d268 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -138,7 +138,7 @@ else
   if get_option('guest_agent_msi').enabled()
     error('MSI guest agent package is available only for MinGW Windows cross-compilation')
   endif
-  install_subdir('run', install_dir: get_option('localstatedir'))
+  install_emptydir(get_option('localstatedir') / 'run')
 endif
 
 alias_target('qemu-ga', all_qga)
-- 
2.37.3


