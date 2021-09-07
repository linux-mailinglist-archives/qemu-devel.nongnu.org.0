Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 776CB4028F0
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 14:36:59 +0200 (CEST)
Received: from localhost ([::1]:34484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNaLR-0002w6-GB
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 08:36:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa6q-0000YB-Iv
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:21:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa6o-00071C-Vs
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:21:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631017310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cL5/XPLTGHu6CtOojeAQ9FFcxzQ35bhD7tEB+PHjy6A=;
 b=Hd1yfDxCgR3Tr66ovpKvXmduGcGK9nMgxinnRRTaTyZw6Er2yWnM9CZNGobNNtPjO/HF5H
 1zTqAc1N0o0hUcKxsQGJe+Z5sV3YJ1u2bsaf8ooDIWlIXXZ9zwkEqrSX2E2nNFMFltv3rB
 ejpf3vyCwZnU2C/HqR++nE7GTNv2Y3A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-vt7h9C9oN5OXKSRezREk8Q-1; Tue, 07 Sep 2021 08:21:49 -0400
X-MC-Unique: vt7h9C9oN5OXKSRezREk8Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65CEB104FB69
 for <qemu-devel@nongnu.org>; Tue,  7 Sep 2021 12:21:48 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7E01660C05;
 Tue,  7 Sep 2021 12:21:39 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [RFC v3 09/32] build-sys: add i686 cpu target
Date: Tue,  7 Sep 2021 16:19:20 +0400
Message-Id: <20210907121943.3498701-10-marcandre.lureau@redhat.com>
In-Reply-To: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Rust does not have i386 targets, so distinguish when target cpu is i686.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 configure | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index 8adf2127c3..48ff2837d9 100755
--- a/configure
+++ b/configure
@@ -617,6 +617,8 @@ esac
 if test ! -z "$cpu" ; then
   # command line argument
   :
+elif check_define __i686__ ; then
+  cpu="i686"
 elif check_define __i386__ ; then
   cpu="i386"
 elif check_define __x86_64__ ; then
@@ -672,9 +674,12 @@ case "$cpu" in
   ppc64le)
     ARCH="ppc64"
   ;;
-  i386|i486|i586|i686|i86pc|BePC)
+  i386|i486|i586|i86pc|BePC)
     cpu="i386"
   ;;
+  i686)
+    ARCH="i386"
+  ;;
   x86_64|amd64)
     cpu="x86_64"
   ;;
@@ -1673,7 +1678,7 @@ case "$cpu" in
            CPU_CFLAGS="-m64"
            QEMU_LDFLAGS="-m64 $QEMU_LDFLAGS"
            ;;
-    i386)
+    i386|i686)
            CPU_CFLAGS="-m32"
            QEMU_LDFLAGS="-m32 $QEMU_LDFLAGS"
            ;;
@@ -4396,7 +4401,7 @@ QEMU_GA_MSI_MINGW_DLL_PATH="$($pkg_config --variable=prefix glib-2.0)/bin"
 
 # Mac OS X ships with a broken assembler
 roms=
-if { test "$cpu" = "i386" || test "$cpu" = "x86_64"; } && \
+if { test "$cpu" = "i386" || test "$cpu" = "i686" || test "$cpu" = "x86_64"; } && \
         test "$targetos" != "Darwin" && test "$targetos" != "SunOS" && \
         test "$targetos" != "Haiku" && test "$softmmu" = yes ; then
     # Different host OS linkers have different ideas about the name of the ELF
@@ -4962,7 +4967,7 @@ fi
 if test "$linux" = "yes" ; then
   mkdir -p linux-headers
   case "$cpu" in
-  i386|x86_64|x32)
+  i386|i686|x86_64|x32)
     linux_arch=x86
     ;;
   ppc|ppc64|ppc64le)
-- 
2.33.0.113.g6c40894d24


