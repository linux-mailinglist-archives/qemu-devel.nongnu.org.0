Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3A22C5324
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 12:38:09 +0100 (CET)
Received: from localhost ([::1]:46810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiFbE-0003M3-IJ
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 06:38:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kiFUG-0004Si-Sc
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:30:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kiFUF-0006fF-1S
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:30:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606390254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HUbagllB6aSqe2toADC1Gstjc1ag32tbrFS/wjOOmXo=;
 b=MucZnb9tu1YPP9zAhfrf5IEGavMntDHKdG5Kx5+A0IRuPXp21lOq6neZGFaBukDH/m9wjl
 N3fDydanH35eH9xON+ouQFpvWleCgcpfWlY/gElYNrxPfDPnlBrUWqhCfSJcWK4fFpoCjy
 bAbr7TbHVVSQVYG53gYOAIkoLU2IEx8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-HjYbacLzP9ar5Cf4OD7p6g-1; Thu, 26 Nov 2020 06:30:52 -0500
X-MC-Unique: HjYbacLzP9ar5Cf4OD7p6g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD76A100F772;
 Thu, 26 Nov 2020 11:30:50 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 681565C1BD;
 Thu, 26 Nov 2020 11:30:45 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/13] compiler: remove GNUC check
Date: Thu, 26 Nov 2020 15:29:14 +0400
Message-Id: <20201126112915.525285-13-marcandre.lureau@redhat.com>
In-Reply-To: <20201126112915.525285-1-marcandre.lureau@redhat.com>
References: <20201126112915.525285-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, philmd@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

QEMU requires Clang or GCC, that define and support __GNUC__ extensions.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu/compiler.h | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
index 108bfdb391..f492baf341 100644
--- a/include/qemu/compiler.h
+++ b/include/qemu/compiler.h
@@ -55,14 +55,10 @@
     (offsetof(container, field) + sizeof_field(container, field))
 
 /* Convert from a base type to a parent type, with compile time checking.  */
-#ifdef __GNUC__
 #define DO_UPCAST(type, field, dev) ( __extension__ ( { \
     char __attribute__((unused)) offset_must_be_zero[ \
         -offsetof(type, field)]; \
     container_of(dev, type, field);}))
-#else
-#define DO_UPCAST(type, field, dev) container_of(dev, type, field)
-#endif
 
 #define typeof_field(type, field) typeof(((type *)0)->field)
 #define type_check(t1,t2) ((t1*)0 - (t2*)0)
@@ -93,7 +89,7 @@
 #if defined(__clang__)
   /* clang doesn't support gnu_printf, so use printf. */
 # define GCC_FMT_ATTR(n, m) __attribute__((format(printf, n, m)))
-#elif defined(__GNUC__)
+#else
    /* Use gnu_printf (qemu uses standard format strings). */
 # define GCC_FMT_ATTR(n, m) __attribute__((format(gnu_printf, n, m)))
 # if defined(_WIN32)
@@ -101,8 +97,6 @@
     * even when MinGW or GLib include files use __printf__. */
 #  define __printf__ __gnu_printf__
 # endif
-#else
-#define GCC_FMT_ATTR(n, m)
 #endif
 
 #ifndef __has_warning
-- 
2.29.0


