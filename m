Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D550602D83
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 15:57:02 +0200 (CEST)
Received: from localhost ([::1]:57512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okn5V-00017n-7V
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 09:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmgU-000228-8S
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:31:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1okmgP-0004yI-Q5
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:31:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666099859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=taTFdLgbLBGKV8hKxTDS8uOnxr3eSe8+8nzESpA2qR0=;
 b=XVx3EhhuFk8TVD/izh/yMaAXUi67PAwETrsUFrSgKva7HoxWVQIsgfv7PtzgyckXs5ROBa
 a44G2xPr6hOqDcwowIZBZBIxoP16uLaFnZldbQcNrDtXqV+MdYUKZp1dfVl7E6cKWSEDvG
 ehIpv0JccJ52B2Z0zrKo9k3n9H/3PGw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-284-oraMy8Q3MCu1S91fIxhpgg-1; Tue, 18 Oct 2022 09:30:57 -0400
X-MC-Unique: oraMy8Q3MCu1S91fIxhpgg-1
Received: by mail-ej1-f72.google.com with SMTP id
 qk31-20020a1709077f9f00b00791a3e02c80so267729ejc.21
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 06:30:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=taTFdLgbLBGKV8hKxTDS8uOnxr3eSe8+8nzESpA2qR0=;
 b=HN6PtbcYq/ZP80bPnUszcvz4esk4DFu1acajjYSIGd/7jNJwib17CXhMYUFJujM7/h
 CBdW4w5/IdTGixjyAWQiec5Tj45cCZVzsbgTvb9wQ3ULtQmri9kP5AGq/CGtOo2w7nRA
 DTSaboEjMfkFab6Zcs4lzCF1NqZveAA6qnUGrOabkFeEWiGnrvNWNNjOrpMwK//N4pda
 BFtlxohxgv1CH6zWJ7xzAwtfvOBpdq4zDmHc0RaGucqETZva0KkQW12VFK/oFC8T7+pI
 dY5XciowC/wGRIRHW9AjLynRgL/wBZ+Xjiv/W4xXUnssDsenhRuv7CiN5DwG1bTnqLiZ
 U3Eg==
X-Gm-Message-State: ACrzQf1QFC7Vasq5z5dwBEuv7g3hDKpNCHBQLqF7mrlbwB2IxNk++W4r
 BlAkMkDX9M7jgm8+1vh5hRs6rYLDz4t62htoR1ofEp4maLxTkLN1H18UlTbHWzAA0Cg7IwGiDpU
 cyWRlMNo9F8UzgERPVRLsxRKZBxPi5thxvCvcljiIlsmlBvI3CkoSiwB0MhcDa6bMFsY=
X-Received: by 2002:a17:906:9bf1:b0:78d:f2d7:efbe with SMTP id
 de49-20020a1709069bf100b0078df2d7efbemr2479859ejc.273.1666099853315; 
 Tue, 18 Oct 2022 06:30:53 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM66wMnDN1TrRrU35S7HwTULUYs0jyJI4KL34cNOOobXtHY5oh5XBtxylW6/8nm5oySyN4YLGA==
X-Received: by 2002:a17:906:9bf1:b0:78d:f2d7:efbe with SMTP id
 de49-20020a1709069bf100b0078df2d7efbemr2479841ejc.273.1666099852970; 
 Tue, 18 Oct 2022 06:30:52 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:2f4b:62da:3159:e077])
 by smtp.gmail.com with ESMTPSA id
 kl24-20020a170907995800b00787f91a6b16sm7468762ejc.26.2022.10.18.06.30.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 06:30:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/53] configure: don't enable firmware for targets that are
 not built
Date: Tue, 18 Oct 2022 15:29:51 +0200
Message-Id: <20221018133042.856368-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221018133042.856368-1-pbonzini@redhat.com>
References: <20221018133042.856368-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
index 45ee6f4eb3..f9ec050bf8 100755
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
     write_target_makefile >> $config_mak
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
   write_c_skeleton
   do_compiler "$target_cc" $target_cc_cflags -march=z900 -o $TMPO -c $TMPC
   has_z900=$?
-- 
2.37.3


