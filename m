Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C1E42EE8F
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 12:14:22 +0200 (CEST)
Received: from localhost ([::1]:49286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbKEH-0004B9-6a
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 06:14:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mbK7a-000229-HK; Fri, 15 Oct 2021 06:07:26 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:44815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mbK7Y-0000e5-F6; Fri, 15 Oct 2021 06:07:26 -0400
Received: by mail-ed1-x52e.google.com with SMTP id w14so35784405edv.11;
 Fri, 15 Oct 2021 03:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XwgchHTuKzJC2Zifzj1I6nSUWe5tZlNeK4yTiRpQOlY=;
 b=U7eP8+PEkEqNp1VqgQLY0HiFtxr0dzowk1q8gqSSKMe9+pSX9NhIDrEEx1JNaI5YBi
 9KX/n545IhFVv2nDEPnuFWtN3dsDb+32wAHWj8PHszEAxS8DlGSYLlITPIj7G9JgoVAc
 4G/6Fh08tHMJ5Jk6h7ddpTItTo9zNrBsyNmGrgVKDsnFRfZ9vJpd8Rmu6BsCR/v/nZNv
 Z7oSWdQ3IZQXvf/PZmqbGlX5mUtLnYCqYC8jW/2KiXlEB9iirfFiBHOgqQt7XmdR7zC9
 4C6xcTTwcLRAKP5Dv1e/3vdMuNEDc7oOkSnivM7bf9ctbzCBoax5I/z/kgKX1KqMc/iv
 /M7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XwgchHTuKzJC2Zifzj1I6nSUWe5tZlNeK4yTiRpQOlY=;
 b=bdH1osb8qgW9JWX5YDYswJP1MkpTI8nQz/4k5Ao9g1sDwEWwSW2V1eAurQQHDIE7I3
 7VIzojyjKTaunUlSHZPqlTYWFssRPliUWwjQip18kyC/KULqkfrVCT4By+kbw1diUaxK
 TmWOZfjQUscQq4+70eHFIOdETIxOEl/dMEqdjW2r9UHhU1vZK+m6sg1ja6QxclxTakHL
 HOMX717/JbPQjQYeapel0M/AbkEZ9KwfwohgmoAS608tX0AcqKMfoZjCUDmIHx6YLd+5
 2fk+gs3DJaeRnQ9DeOH7eziMkQk4uQPnWJg12l9Zsco/7LcXzWObJk6l615gajG760HA
 X9Ow==
X-Gm-Message-State: AOAM533/6X/4nw2GiAf+gdZgSwn35HrAsWzI4oNLXjvRgEGKLyNfb0mW
 1cWq80nmf7BfO+DuKP0eUFKG4M1CLK0=
X-Google-Smtp-Source: ABdhPJyabyjUe/a2LfkV3P3lwOD7J40Y/cjTKd2czWskUF/csei4+0IT/F0ffjG7Ucnc5d24TaFqyw==
X-Received: by 2002:a17:906:1510:: with SMTP id
 b16mr5896034ejd.332.1634292442756; 
 Fri, 15 Oct 2021 03:07:22 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 r3sm4090564edo.59.2021.10.15.03.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 03:07:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] configure: remove dead EXESUF variable
Date: Fri, 15 Oct 2021 12:07:18 +0200
Message-Id: <20211015100718.17828-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211015100718.17828-1-pbonzini@redhat.com>
References: <20211015100718.17828-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: kwolf@redhat.com, thuth@redhat.com, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, hreitz@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .gitlab-ci.d/crossbuild-template.yml | 2 +-
 configure                            | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
index 10d22dcf6c..87cb8b7518 100644
--- a/.gitlab-ci.d/crossbuild-template.yml
+++ b/.gitlab-ci.d/crossbuild-template.yml
@@ -12,7 +12,7 @@
           mips64-softmmu ppc-softmmu riscv32-softmmu sh4-softmmu
           sparc-softmmu xtensa-softmmu $CROSS_SKIP_TARGETS"
     - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
-    - if grep -q "EXESUF=.exe" config-host.mak;
+    - if test -f qemu-io.exe;
       then make installer;
       version="$(git describe --match v[0-9]*)";
       mv -v qemu-setup*.exe qemu-setup-${version}.exe;
diff --git a/configure b/configure
index 039467c04b..a4489bc23f 100755
--- a/configure
+++ b/configure
@@ -308,7 +308,6 @@ fortify_source="$default_feature"
 strip_opt="yes"
 mingw32="no"
 gcov="no"
-EXESUF=""
 modules="no"
 module_upgrades="no"
 prefix="/usr/local"
@@ -713,7 +712,6 @@ else
 fi
 
 if test "$mingw32" = "yes" ; then
-  EXESUF=".exe"
   # MinGW needs -mthreads for TLS and macro _MT.
   CONFIGURE_CFLAGS="-mthreads $CONFIGURE_CFLAGS"
   write_c_skeleton;
@@ -3814,7 +3812,6 @@ echo "GLIB_CFLAGS=$glib_cflags" >> $config_host_mak
 echo "GLIB_LIBS=$glib_libs" >> $config_host_mak
 echo "QEMU_LDFLAGS=$QEMU_LDFLAGS" >> $config_host_mak
 echo "LD_I386_EMULATION=$ld_i386_emulation" >> $config_host_mak
-echo "EXESUF=$EXESUF" >> $config_host_mak
 echo "LIBS_QGA=$libs_qga" >> $config_host_mak
 
 if test "$rng_none" = "yes"; then
-- 
2.31.1


