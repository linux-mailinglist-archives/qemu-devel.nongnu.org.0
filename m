Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AAA5FE367
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 22:38:59 +0200 (CEST)
Received: from localhost ([::1]:51466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oj4yo-0001e5-4y
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 16:38:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj4vi-0004Yr-Bp
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 16:35:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oj4vf-0002U7-RN
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 16:35:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665693343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=l5DbuLu8CwonKsXmNZftoeN5nqpMQ1nN57o9wJiF3vE=;
 b=WLSzBbYdSjVlX9mbm31Sf3kGqf5QwoBTF264RO0XYfvUDqZozvNCCFCerMMB6UPGRYes1d
 o2WBg9OE+TFyFBhDZINJWQMBM1p8TxXoVkpB9XA84bGFEmFC6I0gWC+LSN8eo56GVrXJPW
 s8N5vGVAeftBnhvV0YjhI+rpmeJImo8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-258-YzTupqD6Ozi8Cm1e0PUWwA-1; Thu, 13 Oct 2022 16:35:41 -0400
X-MC-Unique: YzTupqD6Ozi8Cm1e0PUWwA-1
Received: by mail-ej1-f71.google.com with SMTP id
 ga20-20020a1709070c1400b0078db506c555so1394468ejc.6
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 13:35:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l5DbuLu8CwonKsXmNZftoeN5nqpMQ1nN57o9wJiF3vE=;
 b=y8gACGuZUGpYuPjf/EcokHOCjo+ma6PHdx6R6y8Q3g5kdo6dkrI3L1A+hB50YZL9GU
 R+6/2ddoTqCqEe4fOlUu2/uuUv6PV90rQ0N6JBzKxWY9cHIZGIyx5Da34GiW/rjOnqQ4
 71HqEmatbIf4xF4l21Wn9G4dsslzBW6yPOJ7XXV+W6nsLkL18Yb+Wp67qHLW6aEG/q5s
 ewSIGcpvL5YcKXaNq43wlwn8xvXic6McQs2Y854m8QSBi7bGrQIlQ/0Sd/yrKEnanW7M
 MbwMNvpDQyx6bqYhWIX8FFJPcoOmwEIM9S1Jg5cPOt7mPrqgiVPFxDtU2O2ki1bzoNVs
 g6+Q==
X-Gm-Message-State: ACrzQf2Mey6oWYMM/GfzDb0105AP99pBIPKq7pw5+z59zXbwIF5PPD5C
 T7sI61ZSSSe+D/S2/1hRSK3sj8+cwyal4WADcbpGH8sf8tzoRhQMGc4B/nep1C4XsJdct+NrvLw
 5bUyL45MuNQgbwKwWswqCRjUIsQez4QFsXAc5JoNEBGE4Zs4B6oIIZUfG/5IfSRgBEhI=
X-Received: by 2002:a17:907:1c8e:b0:78d:fd24:a596 with SMTP id
 nb14-20020a1709071c8e00b0078dfd24a596mr1132373ejc.534.1665693340192; 
 Thu, 13 Oct 2022 13:35:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5hSQWYbLnTTlkXtU8kenFrWI+iQE+u43KVBQLbi9WNWeZsZzLs14tcBypspfUfgr6tZeWOgA==
X-Received: by 2002:a17:907:1c8e:b0:78d:fd24:a596 with SMTP id
 nb14-20020a1709071c8e00b0078dfd24a596mr1132353ejc.534.1665693339843; 
 Thu, 13 Oct 2022 13:35:39 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 12-20020a170906300c00b0077a1dd3e7b7sm378253ejz.102.2022.10.13.13.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 13:35:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH] configure: don't enable firmware for targets that are not
 built
Date: Thu, 13 Oct 2022 22:35:36 +0200
Message-Id: <20221013203536.652512-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

This avoids the unfortunate effect of building pc-bios blobs
even for targets the user isn't interested in.

Due to the bi-arch nature of x86 and PPC firmware, check for the
desired target by hand, and don't just look for the compilation target
in $target_list.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index baa69189f0..044eff431f 100755
--- a/configure
+++ b/configure
@@ -1841,6 +1841,16 @@ compute_target_variable() {
   fi
 }
 
+have_target() {
+  for i; do
+    case " $target_list " in
+      *" $i "*) return 0;;
+      *) ;;
+    esac
+  done
+  return 1
+}
+
 # probe_target_compiler TARGET
 #
 # Look for a compiler for the given target, either native or cross.
@@ -2261,8 +2271,9 @@ echo "# Automatically generated by configure - do not modify" > Makefile.prereqs
 
 # Mac OS X ships with a broken assembler
 roms=
-if test "$targetos" != "darwin" && test "$targetos" != "sunos" && \
-        test "$targetos" != "haiku" && test "$softmmu" = yes && \
+if have_target i386-softmmu x86_64-softmmu && \
+        test "$targetos" != "darwin" && test "$targetos" != "sunos" && \
+        test "$targetos" != "haiku" && \
         probe_target_compiler i386-softmmu; then
     roms="pc-bios/optionrom"
     config_mak=pc-bios/optionrom/config.mak
@@ -2271,7 +2282,8 @@ if test "$targetos" != "darwin" && test "$targetos" != "sunos" && \
     write_target_makefile pc-bios/optionrom/all >> $config_mak
 fi
 
-if test "$softmmu" = yes && probe_target_compiler ppc-softmmu; then
+if have_target ppc-softmmu ppc64-softmmu && \
+        probe_target_compiler ppc-softmmu; then
     roms="$roms pc-bios/vof"
     config_mak=pc-bios/vof/config.mak
     echo "# Automatically generated by configure - do not modify" > $config_mak
@@ -2281,7 +2293,7 @@ fi
 
 # Only build s390-ccw bios if the compiler has -march=z900 or -march=z10
 # (which is the lowest architecture level that Clang supports)
-if test "$softmmu" = yes && probe_target_compiler s390x-softmmu; then
+if have_target s390x-softmmu && probe_target_compiler s390x-softmmu; then
   got_cross_cc=no
   if test -n "$target_cc"; then
     write_c_skeleton
-- 
2.37.3


