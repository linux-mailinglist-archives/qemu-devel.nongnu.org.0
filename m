Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E465A9F17
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 20:36:19 +0200 (CEST)
Received: from localhost ([::1]:37706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTp34-0002fE-4T
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 14:36:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTos4-0007gN-Cq
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:24:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45177)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTorz-0008J3-Jl
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:24:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662056691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9WxzA3FSpz7yo/zE4NwYMARgwmypDOquc/arDiqZwQg=;
 b=MOf48q9xRjJ2bO4mCY5F4QKjZKLUqtTT1ux0b5K3zOB3eLzZ+8HPramwl7jaWHcdST4j8B
 LyiBgQGDlpiFN8dvupalBrRymgpCyddpwNFfg2FfwjBES5Ij8+U9SkOyr+HWOrsvvopEr4
 CavvYNHH09xh6wPYHVXzYHSarOwo/2U=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-224-bGhGyQDoPw2mczjHhTlrrg-1; Thu, 01 Sep 2022 14:24:50 -0400
X-MC-Unique: bGhGyQDoPw2mczjHhTlrrg-1
Received: by mail-ej1-f72.google.com with SMTP id
 qb39-20020a1709077ea700b0073ddc845586so7231058ejc.2
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 11:24:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=9WxzA3FSpz7yo/zE4NwYMARgwmypDOquc/arDiqZwQg=;
 b=AAF1F2ET7BGNzvp/8ZH8LVrDERgA1mujJck9329jc1KJ5ZMb5SpIqHbGn4h5bIE4bV
 BvwMYTRovkKsG3JxqQHwbvQd+D0fCM2PJjCbPS+dlr7aMimm18yFA7t+xzVhkivT3Wgp
 mb4Si4e/DMNaVu1QBGmUdN7xw68W1HsG+QAELMk9d7vLC5LmkKtxE2GPE9feNJ9p8qLG
 TvVHAB54uKOghpNDzamQFKZZx7DKVVY4EbKzZU4r6dgb3qKbKxeGocdwvWKlZkcKRgU5
 3xIJOXMOSKrvrYsG8RLMMHf0ndE4lDqtPRsDj7/3oC24xqKuqkWYjVFAfeO2hVNZTXB2
 RstQ==
X-Gm-Message-State: ACgBeo3niu7NDGsq0hXXNiMkoiony8pcn6ZpSYOSDA/oCBUbo1gMOsgH
 8Io4sKYCzrDToyKEOu8lirerRd222vAsRNRwwcpsI6odxQwcmaV9lKFwgyyZi6B1cZk0VRYx/sA
 6qaTORMnjO9X8OrHlKBn11tadkGf+5eU2q4V9DdS3V2GRDugKekSAAVFThtZxx3wfKIc=
X-Received: by 2002:a17:907:2e19:b0:73e:f770:eddd with SMTP id
 ig25-20020a1709072e1900b0073ef770edddmr20777012ejc.249.1662056688537; 
 Thu, 01 Sep 2022 11:24:48 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5dx7+P7phI5FwQMsE8NV0pYYWstfd3glapHnwGEa8tZeIcPh64s9DtQoqAm+agsfRqNQ+dTw==
X-Received: by 2002:a17:907:2e19:b0:73e:f770:eddd with SMTP id
 ig25-20020a1709072e1900b0073ef770edddmr20776997ejc.249.1662056688253; 
 Thu, 01 Sep 2022 11:24:48 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 m24-20020aa7c498000000b0044bfdbd8a33sm67814edq.88.2022.09.01.11.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 11:24:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 08/39] meson: remove dead code
Date: Thu,  1 Sep 2022 20:23:58 +0200
Message-Id: <20220901182429.93533-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220901182429.93533-1-pbonzini@redhat.com>
References: <20220901182429.93533-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.08, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Found with "muon analyze".

Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build                 |  2 --
 pc-bios/keymaps/meson.build |  1 -
 qapi/meson.build            | 15 ---------------
 target/riscv/meson.build    |  2 --
 4 files changed, 20 deletions(-)

diff --git a/meson.build b/meson.build
index 20fddbd707..ca1ba46928 100644
--- a/meson.build
+++ b/meson.build
@@ -3405,7 +3405,6 @@ foreach target : target_dirs
     target_inc += include_directories('linux-headers', is_system: true)
   endif
   if target.endswith('-softmmu')
-    qemu_target_name = 'qemu-system-' + target_name
     target_type='system'
     t = target_softmmu_arch[target_base_arch].apply(config_target, strict: false)
     arch_srcs += t.sources()
@@ -3422,7 +3421,6 @@ foreach target : target_dirs
     abi = config_target['TARGET_ABI_DIR']
     target_type='user'
     target_inc += common_user_inc
-    qemu_target_name = 'qemu-' + target_name
     if target_base_arch in target_user_arch
       t = target_user_arch[target_base_arch].apply(config_target, strict: false)
       arch_srcs += t.sources()
diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
index 2837eb34f4..06c75e646b 100644
--- a/pc-bios/keymaps/meson.build
+++ b/pc-bios/keymaps/meson.build
@@ -38,7 +38,6 @@ if meson.is_cross_build() or 'CONFIG_XKBCOMMON' not in config_host
 else
   native_qemu_keymap = qemu_keymap
 endif
-cp = find_program('cp')
 
 if native_qemu_keymap.found()
   t = []
diff --git a/qapi/meson.build b/qapi/meson.build
index fd5c93d643..840f1b0e19 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -68,21 +68,6 @@ if have_system or have_tools
   ]
 endif
 
-qapi_storage_daemon_modules = [
-  'block-core',
-  'block-export',
-  'char',
-  'common',
-  'control',
-  'crypto',
-  'introspect',
-  'job',
-  'qom',
-  'sockets',
-  'pragma',
-  'transaction',
-]
-
 qapi_nonmodule_outputs = [
   'qapi-introspect.c', 'qapi-introspect.h',
   'qapi-types.c', 'qapi-types.h',
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 2c1975e72c..6b9435d69a 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -1,6 +1,4 @@
 # FIXME extra_args should accept files()
-dir = meson.current_source_dir()
-
 gen = [
   decodetree.process('insn16.decode', extra_args: ['--static-decode=decode_insn16', '--insnwidth=16']),
   decodetree.process('insn32.decode', extra_args: '--static-decode=decode_insn32'),
-- 
2.37.2



