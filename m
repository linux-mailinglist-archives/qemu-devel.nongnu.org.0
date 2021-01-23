Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A9F3015F6
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 15:38:07 +0100 (CET)
Received: from localhost ([::1]:44520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3K3C-0003yA-1L
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 09:38:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3JxB-0003US-8m
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:31:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3Jx1-0005p3-C8
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:31:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611412300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rKnC0CyB9hd24vC4vQFo9gaIFsJCQ+VbQFS3rpox+CA=;
 b=KeGWaYNkxKBhN5wJDG8kqWNW+16G5y7Fh3WxKNdPRAsx177gYormjODcAP5OKqgjHu+cPe
 caHTZ/ENK0V8KJxz8AmkFtDl36mGn7QBJ6eKCPhVRCiAiBALcDR5cQFtFwmWqNEGLGNHXn
 hbLdRpif64hbmZakASHgtIHgpCqG0Ro=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-Ymo9ZHc8OcWSaBmvx4eS8w-1; Sat, 23 Jan 2021 09:31:38 -0500
X-MC-Unique: Ymo9ZHc8OcWSaBmvx4eS8w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFC068018A1
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 14:31:37 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E79175D9CC;
 Sat, 23 Jan 2021 14:31:32 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/31] build-sys: remove unused LIBS
Date: Sat, 23 Jan 2021 09:31:05 -0500
Message-Id: <20210123143128.1167797-9-pbonzini@redhat.com>
In-Reply-To: <20210123143128.1167797-1-pbonzini@redhat.com>
References: <20210123143128.1167797-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.165,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Since meson switch and commit feabc71dfa58 ("configure: do not include
dependency flags in QEMU_CFLAGS and LIBS"), LIBS is unused.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210114125605.1227742-2-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 32 --------------------------------
 1 file changed, 32 deletions(-)

diff --git a/configure b/configure
index a84df7c4ad..ff099cb8ca 100755
--- a/configure
+++ b/configure
@@ -3385,16 +3385,6 @@ else
   for pthread_lib in $PTHREADLIBS_LIST; do
     if compile_prog "" "$pthread_lib" ; then
       pthread=yes
-      found=no
-      for lib_entry in $LIBS; do
-        if test "$lib_entry" = "$pthread_lib"; then
-          found=yes
-          break
-        fi
-      done
-      if test "$found" = "no"; then
-        LIBS="$pthread_lib $LIBS"
-      fi
       break
     fi
   done
@@ -4083,28 +4073,6 @@ if compile_prog "" "" ; then
   bswap_h=yes
 fi
 
-##########################################
-# Do we need librt
-# uClibc provides 2 versions of clock_gettime(), one with realtime
-# support and one without. This means that the clock_gettime() don't
-# need -lrt. We still need it for timer_create() so we check for this
-# function in addition.
-cat > $TMPC <<EOF
-#include <signal.h>
-#include <time.h>
-int main(void) {
-  timer_create(CLOCK_REALTIME, NULL, NULL);
-  return clock_gettime(CLOCK_REALTIME, NULL);
-}
-EOF
-
-if compile_prog "" "" ; then
-  :
-# we need pthread for static linking. use previous pthread test result
-elif compile_prog "" "$pthread_lib -lrt" ; then
-  LIBS="$LIBS -lrt"
-fi
-
 # Check whether we have openpty() in either libc or libutil
 cat > $TMPC << EOF
 extern int openpty(int *am, int *as, char *name, void *termp, void *winp);
-- 
2.26.2



