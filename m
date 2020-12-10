Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B8B2D5C52
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 14:51:54 +0100 (CET)
Received: from localhost ([::1]:40388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knMML-00051r-LJ
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 08:51:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1knMK8-0003D3-TP
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 08:49:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1knMK5-0002uL-V8
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 08:49:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607608173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UPLHk9PCXdFlionEQtiO0kTXHb3i/E1vdNJvbkD9DzE=;
 b=NlJWsN9ZQl1y5xFXt1IMrt+nS8p59zoCaIRnx6+hdsg5kUGkBf4wjC3vLZAdsodqS83wbl
 SlcNiaL/LGpOZC7gbMsfRsj6uh3u18ZNK5WrIF9CzeEd9tLuDypnM3Co7yj/ufSDM0YxF+
 7H5WJmRhYfieh2AfEPkEj1mOPaQEpxc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-nqVUJhY8NMCkTQFWY4kjLQ-1; Thu, 10 Dec 2020 08:49:25 -0500
X-MC-Unique: nqVUJhY8NMCkTQFWY4kjLQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC6A6800D53;
 Thu, 10 Dec 2020 13:49:23 +0000 (UTC)
Received: from localhost (unknown [10.36.110.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5511D19713;
 Thu, 10 Dec 2020 13:49:10 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/13] tests: remove GCC < 4 fallbacks
Date: Thu, 10 Dec 2020 17:47:44 +0400
Message-Id: <20201210134752.780923-6-marcandre.lureau@redhat.com>
In-Reply-To: <20201210134752.780923-1-marcandre.lureau@redhat.com>
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Since commit efc6c07 ("configure: Add a test for the minimum compiler
version"), QEMU explicitely depends on GCC >= 4.8.

(clang >= 3.4 advertizes itself as GCC >= 4.2 compatible)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/arm/fcvt.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/tests/tcg/arm/fcvt.c b/tests/tcg/arm/fcvt.c
index 617626bc63..7ac47b564e 100644
--- a/tests/tcg/arm/fcvt.c
+++ b/tests/tcg/arm/fcvt.c
@@ -73,11 +73,9 @@ static void print_int64(int i, int64_t num)
 
 #ifndef SNANF
 /* Signaling NaN macros, if supported.  */
-# if __GNUC_PREREQ(3, 3)
-#  define SNANF (__builtin_nansf (""))
-#  define SNAN (__builtin_nans (""))
-#  define SNANL (__builtin_nansl (""))
-# endif
+# define SNANF (__builtin_nansf (""))
+# define SNAN (__builtin_nans (""))
+# define SNANL (__builtin_nansl (""))
 #endif
 
 float single_numbers[] = { -SNANF,
-- 
2.29.0


