Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D715B2DB38E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 19:21:23 +0100 (CET)
Received: from localhost ([::1]:41170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpEws-0004NO-Sw
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 13:21:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXo-0003N4-KC
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:55:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXc-0001Za-9Q
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:55:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608054915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tC6aqtaMjORaex033HsYGVCZQpd9VDsmJ1af6cwpiv8=;
 b=YX9UEH4boCXdFPJ+awG4zCz3lfCZEJxGrN06dtcw99cwBAj0L+StDeKYG+VM9XCVK/cLqT
 ib3rNncsp8XXO8bis/iMFAgIZBFete/FB60FIbKWW2e7Zf8d4mN2E7FCo/mtTQHoflNkta
 qhGAoemL6z1NwocNyG6JL5QPMEerxW8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-Tux_y5sNO92RxZDT6T8gvw-1; Tue, 15 Dec 2020 12:55:13 -0500
X-MC-Unique: Tux_y5sNO92RxZDT6T8gvw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57F01801817
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 17:55:12 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E474660854;
 Tue, 15 Dec 2020 17:55:11 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 43/45] compiler.h: remove QEMU_GNUC_PREREQ
Date: Tue, 15 Dec 2020 12:54:43 -0500
Message-Id: <20201215175445.1272776-44-pbonzini@redhat.com>
In-Reply-To: <20201215175445.1272776-1-pbonzini@redhat.com>
References: <20201215175445.1272776-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

When needed, the G_GNUC_CHECK_VERSION() glib macro can be used instead.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20201210134752.780923-14-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/compiler.h    | 11 -----------
 scripts/cocci-macro-file.h |  1 -
 2 files changed, 12 deletions(-)

diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index 5e6cf2c8e8..1b9e58e82b 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -11,17 +11,6 @@
 #define QEMU_STATIC_ANALYSIS 1
 #endif
 
-/*----------------------------------------------------------------------------
-| The macro QEMU_GNUC_PREREQ tests for minimum version of the GNU C compiler.
-| The code is a copy of SOFTFLOAT_GNUC_PREREQ, see softfloat-macros.h.
-*----------------------------------------------------------------------------*/
-#if defined(__GNUC__) && defined(__GNUC_MINOR__)
-# define QEMU_GNUC_PREREQ(maj, min) \
-         ((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))
-#else
-# define QEMU_GNUC_PREREQ(maj, min) 0
-#endif
-
 #define QEMU_NORETURN __attribute__ ((__noreturn__))
 
 #define QEMU_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
diff --git a/scripts/cocci-macro-file.h b/scripts/cocci-macro-file.h
index c6bbc05ba3..20eea6b708 100644
--- a/scripts/cocci-macro-file.h
+++ b/scripts/cocci-macro-file.h
@@ -19,7 +19,6 @@
  */
 
 /* From qemu/compiler.h */
-#define QEMU_GNUC_PREREQ(maj, min) 1
 #define QEMU_NORETURN __attribute__ ((__noreturn__))
 #define QEMU_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
 #define QEMU_SENTINEL __attribute__((sentinel))
-- 
2.26.2



