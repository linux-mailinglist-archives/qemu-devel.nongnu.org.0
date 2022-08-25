Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5355A1C7B
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:35:59 +0200 (CEST)
Received: from localhost ([::1]:35286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLSA-000524-DG
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKT-00027c-Rw
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:28:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKR-0004Xf-GC
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:28:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661466478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pZKtHNRLnlZ9cATm+8Ho8woN7n60nqdjBzsPn4N8Ozw=;
 b=cn3Whd+hs0kD5wL2gpO61C1tWxYNRdacZtPYA/O8KFPndGAFv51e3r2R5NmxzArqdiGtiZ
 El6zj8AUxDzeuUPj8E08vfS4FpMOjHpu736IPY6WROkJ6MNd0yf9Qq1JNougXztIdtIp3Q
 /2tyldut9zZAytMUWjJp1JRPBpXMZnA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-472--3rjW7IAMwmkSX0MnTvMJw-1; Thu, 25 Aug 2022 18:27:57 -0400
X-MC-Unique: -3rjW7IAMwmkSX0MnTvMJw-1
Received: by mail-wm1-f71.google.com with SMTP id
 n7-20020a1c2707000000b003a638356355so9306737wmn.2
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 15:27:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=pZKtHNRLnlZ9cATm+8Ho8woN7n60nqdjBzsPn4N8Ozw=;
 b=npFTa/JP4ofqe8f7p8VduMLOPkAFxLpPLwCba0X6PvTmNKhLnILdTskPQq4F51ie5k
 hlGTahb+fO6LTFRwYz7HLNIsXvG51rDyZLTH11C9/KCOGmB9Terg8Y1i2+cC0iZ5m0vt
 Wawvd8hUaQLbaPoxPjLKww+ZQaEOZWIaKAEueIdAjNil6PVH5s12Ig/Qp38HcAg2A290
 hxvzTtocdNEReu1qTsmp8nX8UjWvAw/AmDLfDMTGam59rvNQKifJj/ADUm3z3PaILM5Q
 lakroG/dtHg3p/a2Q1xFHe5BlU2STst0jlNJEvbWpedHR27LCduzCmPtX3kSx1uNBza/
 e02w==
X-Gm-Message-State: ACgBeo03Q1WZkfpaSU1Gz71V/+dtkeWbOrcOmDqPWSn1/9cV2OxeSLER
 6jSLGgVcrWFSOE3ZU/J5S3cnuz7k/vpRuoHwgtNa+bi8xdkWmsBU8ObZdFsfj+gaFQebi/OYnY9
 MKs1uvxiQcKiZvQGrNCPuuhBWIof4BSrdlX0w//9CUa3lBJz8n4xt0+8omYC4sl+iMlE=
X-Received: by 2002:a05:6000:98a:b0:225:8a17:15a6 with SMTP id
 by10-20020a056000098a00b002258a1715a6mr236048wrb.146.1661466475755; 
 Thu, 25 Aug 2022 15:27:55 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5+eZiwKYWk4ogBvfll0SFtkCPg38xRr4LYNEbvVU8xpR/A5R5vpU6z8smNcU6JFOgI1zVQLw==
X-Received: by 2002:a05:6000:98a:b0:225:8a17:15a6 with SMTP id
 by10-20020a056000098a00b002258a1715a6mr236041wrb.146.1661466475542; 
 Thu, 25 Aug 2022 15:27:55 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 q62-20020a1c4341000000b003a3442f1229sm6529431wma.29.2022.08.25.15.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 15:27:54 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH 06/20] configure: return status code from probe_target_compiler
Date: Fri, 26 Aug 2022 00:27:31 +0200
Message-Id: <20220825222745.38779-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220825222745.38779-1-pbonzini@redhat.com>
References: <20220825222745.38779-1-pbonzini@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

For now, return 1 for container-based compilers.  This will change as
soon as ROMs will be buildable with them.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/configure b/configure
index c533eaada0..6f15f3c687 100755
--- a/configure
+++ b/configure
@@ -2181,6 +2181,7 @@ probe_target_compiler() {
     target_ranlib=
     target_strip=
   fi
+  test -n "$target_cc"
 }
 
 write_target_makefile() {
@@ -2328,10 +2329,9 @@ done
 
 # Mac OS X ships with a broken assembler
 roms=
-probe_target_compiler i386-softmmu
-if test -n "$target_cc" &&
-        test "$targetos" != "darwin" && test "$targetos" != "sunos" && \
-        test "$targetos" != "haiku" && test "$softmmu" = yes ; then
+if test "$targetos" != "darwin" && test "$targetos" != "sunos" && \
+        test "$targetos" != "haiku" && test "$softmmu" = yes && \
+        probe_target_compiler i386-softmmu; then
     roms="pc-bios/optionrom"
     config_mak=pc-bios/optionrom/config.mak
     echo "# Automatically generated by configure - do not modify" > $config_mak
@@ -2339,8 +2339,7 @@ if test -n "$target_cc" &&
     write_target_makefile >> $config_mak
 fi
 
-probe_target_compiler ppc-softmmu
-if test -n "$target_cc" && test "$softmmu" = yes; then
+if test "$softmmu" = yes && probe_target_compiler ppc-softmmu; then
     roms="$roms pc-bios/vof"
     config_mak=pc-bios/vof/config.mak
     echo "# Automatically generated by configure - do not modify" > $config_mak
@@ -2350,8 +2349,7 @@ fi
 
 # Only build s390-ccw bios if the compiler has -march=z900 or -march=z10
 # (which is the lowest architecture level that Clang supports)
-probe_target_compiler s390x-softmmu
-if test -n "$target_cc" && test "$softmmu" = yes; then
+if test "$softmmu" = yes && probe_target_compiler s390x-softmmu; then
   write_c_skeleton
   do_compiler "$target_cc" $target_cc_cflags -march=z900 -o $TMPO -c $TMPC
   has_z900=$?
-- 
2.37.1



