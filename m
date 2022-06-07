Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EB153FD6E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 13:24:27 +0200 (CEST)
Received: from localhost ([::1]:34602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyXJy-0004Ez-B4
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 07:24:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyWm1-0004fL-4b
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 06:49:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyWlx-0002Au-W3
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 06:49:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654598957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=l/W+CEIYQ8URkTPoAhBblBhQXXZ+E/ys6d4F/qrbVxk=;
 b=K+msG3w6qqH9UY+lwy0x7jWJ1srYQG+z8CwqNuRb9Qk/ypbt9AGLQFTGk9Nw46+eRt+d5S
 8lbhtss0ezCIqU+GSZ9YOtDee76aLwQwqmTyNZbUzg2Xs5ny72Mo+4CA3gyHaWlJwtvgxA
 6+2L1PWSJtG1n6luy1yVQAeJ21NQ7LA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-211-h8Qa_usDOri2yZVmeTvwaw-1; Tue, 07 Jun 2022 06:49:15 -0400
X-MC-Unique: h8Qa_usDOri2yZVmeTvwaw-1
Received: by mail-wm1-f69.google.com with SMTP id
 z13-20020a7bc7cd000000b0039c4a238eadso1311761wmk.9
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 03:49:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l/W+CEIYQ8URkTPoAhBblBhQXXZ+E/ys6d4F/qrbVxk=;
 b=Qoqp7PJ8FGuxjXjYLaHWJHbwWofWI2iBnNIcu9mIt6OoBfkoWyDiLHlkvZG18jKk/d
 clgNLlhsm82Lv6T4cDcXx7NVnvqz56cco9e4k4MPjTvAOGbn2TNrIRTA9ozRxjAA3j+l
 7r7gFpmNP/EG2KwJl6xGtz9qfcfz3nVw9A0fYjmHIDfD/wp7oOONRUrfG3bINmJeNaSs
 FymsTjDhsLaZeawkRjkT+TY6z7+0PGHpDuY+Kzb46131wQR4ZPz85EAr0WhS1okjmAs6
 kka1zpH8n9JkT9WKJ1RgOo1EQ0J52J80KRN8CkWTqMI+uJBv7XBOXHagqj4yuSDMMbCk
 jKBg==
X-Gm-Message-State: AOAM533+QNTqJe3YRBCCRnluSReQhHpcuToUZ7WcCMwAvBNt8dX8j2+l
 LlEzl6z3j4LHUgPFlGry3d7KPdn4j5FrkPjWNeKvLaRe5EaGFpO3oQQf22fQvpqGKtDe4vSktbQ
 wG5zUdzKuF5iG7oNPswe7Ss0qE8HYbA6U+z4fg0gMCvqk1JqKl2StR7mcGrFsRUyZj/E=
X-Received: by 2002:a7b:c5d0:0:b0:355:482a:6f44 with SMTP id
 n16-20020a7bc5d0000000b00355482a6f44mr28117897wmk.58.1654598954185; 
 Tue, 07 Jun 2022 03:49:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWeQkvt61nnmWSxGWozRLFvVhkHYqc7FaA+o3EoFaYx+Lk/2b19TTChm4alAB6dBuB6RtvhA==
X-Received: by 2002:a7b:c5d0:0:b0:355:482a:6f44 with SMTP id
 n16-20020a7bc5d0000000b00355482a6f44mr28117847wmk.58.1654598953616; 
 Tue, 07 Jun 2022 03:49:13 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 o22-20020a1c7516000000b003942a244ed1sm19381808wmc.22.2022.06.07.03.49.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 03:49:12 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: ignore --make
Date: Tue,  7 Jun 2022 12:49:08 +0200
Message-Id: <20220607104908.1263321-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

Setting the MAKE variable to a GNU Make executable does not really have
any effect: if a non-GNU Make is used, the QEMU Makefile will fail to
parse.  Just remove everything related to --make and $make as dead code.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/configure b/configure
index ce81419629..154e041b8e 100755
--- a/configure
+++ b/configure
@@ -493,20 +493,16 @@ gnu/kfreebsd)
 ;;
 freebsd)
   bsd="yes"
-  make="${MAKE-gmake}"
   # needed for kinfo_getvmmap(3) in libutil.h
 ;;
 dragonfly)
   bsd="yes"
-  make="${MAKE-gmake}"
 ;;
 netbsd)
   bsd="yes"
-  make="${MAKE-gmake}"
 ;;
 openbsd)
   bsd="yes"
-  make="${MAKE-gmake}"
 ;;
 darwin)
   bsd="yes"
@@ -517,7 +513,6 @@ darwin)
 ;;
 sunos)
   solaris="yes"
-  make="${MAKE-gmake}"
 # needed for CMSG_ macros in sys/socket.h
   QEMU_CFLAGS="-D_XOPEN_SOURCE=600 $QEMU_CFLAGS"
 # needed for TIOCWIN* defines in termios.h
@@ -628,8 +623,6 @@ case "$cpu" in
     CPU_CFLAGS="-m64 -mcpu=ultrasparc" ;;
 esac
 
-: ${make=${MAKE-make}}
-
 # We prefer python 3.x. A bare 'python' is traditionally
 # python 2.x, but some distros have it as python 3.x, so
 # we check that too
@@ -709,7 +702,7 @@ for opt do
   ;;
   --objcc=*) objcc="$optarg"
   ;;
-  --make=*) make="$optarg"
+  --make=*)
   ;;
   --install=*)
   ;;
@@ -1024,7 +1017,6 @@ Advanced options (experts only):
   --cross-cc-ARCH=CC       use compiler when building ARCH guest test cases
   --cross-cc-cflags-ARCH=  use compiler flags when building ARCH guest tests
   --cross-prefix-ARCH=PREFIX cross compiler prefix when building ARCH guest test cases
-  --make=MAKE              use specified make [$make]
   --python=PYTHON          use specified python [$python]
   --meson=MESON            use specified meson [$meson]
   --ninja=NINJA            use specified ninja [$ninja]
@@ -1079,10 +1071,6 @@ if test -z "$python"
 then
     error_exit "Python not found. Use --python=/path/to/python"
 fi
-if ! has "$make"
-then
-    error_exit "GNU make ($make) not found"
-fi
 
 # Note that if the Python conditional here evaluates True we will exit
 # with status 1 which is a shell 'false' value.
@@ -2409,7 +2397,6 @@ if test "$container" != no; then
     echo "ENGINE=$container" >> $config_host_mak
 fi
 echo "ROMS=$roms" >> $config_host_mak
-echo "MAKE=$make" >> $config_host_mak
 echo "PYTHON=$python" >> $config_host_mak
 echo "GENISOIMAGE=$genisoimage" >> $config_host_mak
 echo "MESON=$meson" >> $config_host_mak
@@ -2740,7 +2727,6 @@ preserve_env CXXFLAGS
 preserve_env LD
 preserve_env LDFLAGS
 preserve_env LD_LIBRARY_PATH
-preserve_env MAKE
 preserve_env NM
 preserve_env OBJCFLAGS
 preserve_env OBJCOPY
-- 
2.36.1


