Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 379B42C5347
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 12:52:12 +0100 (CET)
Received: from localhost ([::1]:44864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiFop-0006It-90
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 06:52:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kiFUR-0004ae-6T
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:31:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kiFUN-0006lz-Ng
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 06:31:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606390262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UTevGdfibyme3XURRVx8yzU7J+hfx+OKI5/cvGjuQhY=;
 b=ivZRUrkudf3ROHHvPrjupkqJi+mGdTEkrqXvSYeLrxjcJJKvE+Clea+YAEddntsocodJ+g
 jWrsqZmfeVWUGuIrE8X6HThcXypHaf3DRrdMVT/zp4jBGI2Wjn54sWwneyqZaKUSQslYEl
 dn2hEgkJbn0Fa1ArEkfAg4gl6oggLOU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-NWNXdqDwOpO4ey4uRz-1wQ-1; Thu, 26 Nov 2020 06:31:00 -0500
X-MC-Unique: NWNXdqDwOpO4ey4uRz-1wQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 771AF100F340;
 Thu, 26 Nov 2020 11:30:59 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3451E60BFA;
 Thu, 26 Nov 2020 11:30:54 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/13] linux-user: remove GNUC check
Date: Thu, 26 Nov 2020 15:29:15 +0400
Message-Id: <20201126112915.525285-14-marcandre.lureau@redhat.com>
In-Reply-To: <20201126112915.525285-1-marcandre.lureau@redhat.com>
References: <20201126112915.525285-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 linux-user/strace.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 11fea14fba..e00275fcb5 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -24,7 +24,6 @@ struct syscallname {
                    abi_long, abi_long, abi_long);
 };
 
-#ifdef __GNUC__
 /*
  * It is possible that target doesn't have syscall that uses
  * following flags but we don't want the compiler to warn
@@ -32,9 +31,6 @@ struct syscallname {
  * functions.  It is ok to keep them while not used.
  */
 #define UNUSED __attribute__ ((unused))
-#else
-#define UNUSED
-#endif
 
 /*
  * Structure used to translate flag values into strings.  This is
-- 
2.29.0


