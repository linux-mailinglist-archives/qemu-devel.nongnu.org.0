Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DB45A9F5D
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 20:47:23 +0200 (CEST)
Received: from localhost ([::1]:50824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTpDg-0005om-NI
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 14:47:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTosE-0007kD-9x
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oTos3-0008JH-Ac
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 14:25:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662056692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cb+HzWBt+5qA+WSaoWzfg6LwCOHqGRupasAuR/wbsiU=;
 b=PTkZIaCGbV5Ui6YIvbQa7/hROlp/Yzl444bpG+hVeVNExJBCRcVREx31e3UzX8rAJ0YTlW
 qJ+4D5v5L+vZR1Dn7pugT1cVuFPA59quOfXSqs0EmVzWGg7js+mqL8uib+p6sLfLN72ut3
 fUFF6+j9y3st88HDGZnaUyqcM+DNxYk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-37-CmjGxYTaMtadVE1sBWB_tQ-1; Thu, 01 Sep 2022 14:24:51 -0400
X-MC-Unique: CmjGxYTaMtadVE1sBWB_tQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 gn30-20020a1709070d1e00b0074144af99d1so6502899ejc.17
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 11:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Cb+HzWBt+5qA+WSaoWzfg6LwCOHqGRupasAuR/wbsiU=;
 b=bO9GDhzTzlSZa9mVtCEzdUQ/5cZH3d3U6pkMTX0UDQgrao4Zixj6LoktCzEeQXcwFD
 B9oMlwJr2aurK2Lo5Ibqenf5ZCF4CCMC1j6k4VOoTO9GV82lZKTP33QATpl01O8fgkG1
 I8lakKpgnczJncwDLOkiqtG9tdT1916EM4trA6wCQH/MbH8vUFMHLBNg0B4XunduToSD
 Z1dQMVCTY2Nri5AwdyymX2lrLxKSzZkjUDrrk/yUjZEwLvb4cfWFYS9yjClw1Nb++Wla
 KogucrDz06R/HGwqPCwSp+wbnDlIEIuGXXdEkVSecFT7trHaJrM9T39z31G1uTT2OV8H
 9Uvw==
X-Gm-Message-State: ACgBeo2wql4bHl0YoYO6rqbrTu5aZ08VjP4zzx5ouG0Kx2IKToo5UD5p
 maNuUz5UbnKAV2wBDWQ9FZt93o/PDbQFCdIcc46VnZtRtrv/XvlcSfpA03lHwZznJqoRezMV78Q
 J0mjJGLioL28AZeVPj860/JVpjmp/XKVzMb5sujJujm/wbqBjXBwq976Ujdik5mN/QD8=
X-Received: by 2002:a05:6402:1cc4:b0:440:5af8:41c9 with SMTP id
 ds4-20020a0564021cc400b004405af841c9mr29555593edb.339.1662056690165; 
 Thu, 01 Sep 2022 11:24:50 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5+8YbW+T2JAo1h8CB5K70WTuRIZkQiDFdMhWwE8NGtYNuXP4Ne8WN3y4wIsrXALulcCDE1WQ==
X-Received: by 2002:a05:6402:1cc4:b0:440:5af8:41c9 with SMTP id
 ds4-20020a0564021cc400b004405af841c9mr29555573edb.339.1662056689856; 
 Thu, 01 Sep 2022 11:24:49 -0700 (PDT)
Received: from goa-sendmail ([93.56.160.208]) by smtp.gmail.com with ESMTPSA id
 ku20-20020a170907789400b007306a4ecc9dsm4573ejc.18.2022.09.01.11.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 11:24:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 09/39] meson: remove dead assignments
Date: Thu,  1 Sep 2022 20:23:59 +0200
Message-Id: <20220901182429.93533-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220901182429.93533-1-pbonzini@redhat.com>
References: <20220901182429.93533-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.08, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
 plugins/meson.build           |  2 +-
 tests/fp/meson.build          |  2 +-
 tests/qapi-schema/meson.build | 24 ++++++++++++------------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/plugins/meson.build b/plugins/meson.build
index fa12047327..752377c66d 100644
--- a/plugins/meson.build
+++ b/plugins/meson.build
@@ -2,7 +2,7 @@ plugin_ldflags = []
 # Modules need more symbols than just those in plugins/qemu-plugins.symbols
 if not enable_modules
   if targetos == 'darwin'
-    qemu_plugins_symbols_list = configure_file(
+    configure_file(
       input: files('qemu-plugins.symbols'),
       output: 'qemu-plugins-ld64.symbols',
       capture: true,
diff --git a/tests/fp/meson.build b/tests/fp/meson.build
index 2b4f00b916..6258e2bd7d 100644
--- a/tests/fp/meson.build
+++ b/tests/fp/meson.build
@@ -632,7 +632,7 @@ test('fp-test-mulAdd', fptest,
            ['f16_mulAdd', 'f32_mulAdd', 'f64_mulAdd', 'f128_mulAdd'],
      suite: ['softfloat-slow', 'softfloat-ops-slow', 'slow'], timeout: 90)
 
-fpbench = executable(
+executable(
   'fp-bench',
   ['fp-bench.c', '../../fpu/softfloat.c'],
   link_with: [libtestfloat, libsoftfloat],
diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index c18dd7d02f..406bc7255d 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -215,18 +215,18 @@ test('QAPI schema regression tests', python,
 
 diff = find_program('diff')
 
-qapi_doc = custom_target('QAPI doc',
-                         output: ['doc-good-qapi-commands.c', 'doc-good-qapi-commands.h',
-                                  'doc-good-qapi-emit-events.c', 'doc-good-qapi-emit-events.h',
-                                  'doc-good-qapi-events.c', 'doc-good-qapi-events.h',
-                                  'doc-good-qapi-init-commands.c', 'doc-good-qapi-init-commands.h',
-                                  'doc-good-qapi-introspect.c', 'doc-good-qapi-introspect.h',
-                                  'doc-good-qapi-types.c', 'doc-good-qapi-types.h',
-                                  'doc-good-qapi-visit.c', 'doc-good-qapi-visit.h' ],
-                         input: files('doc-good.json'),
-                         command: [ qapi_gen, '-o', meson.current_build_dir(),
-                                    '-p', 'doc-good-', '@INPUT0@' ],
-                         depend_files: qapi_gen_depends)
+custom_target('QAPI doc',
+              output: ['doc-good-qapi-commands.c', 'doc-good-qapi-commands.h',
+                       'doc-good-qapi-emit-events.c', 'doc-good-qapi-emit-events.h',
+                       'doc-good-qapi-events.c', 'doc-good-qapi-events.h',
+                       'doc-good-qapi-init-commands.c', 'doc-good-qapi-init-commands.h',
+                       'doc-good-qapi-introspect.c', 'doc-good-qapi-introspect.h',
+                       'doc-good-qapi-types.c', 'doc-good-qapi-types.h',
+                       'doc-good-qapi-visit.c', 'doc-good-qapi-visit.h' ],
+              input: files('doc-good.json'),
+              command: [ qapi_gen, '-o', meson.current_build_dir(),
+                         '-p', 'doc-good-', '@INPUT0@' ],
+              depend_files: qapi_gen_depends)
 
 if build_docs
   # Test the document-comment document generation code by running a test schema
-- 
2.37.2



