Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34ED32DB379
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 19:18:30 +0100 (CET)
Received: from localhost ([::1]:33360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpEu5-000198-6N
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 13:18:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXl-0003Lk-S9
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:55:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXc-0001ZY-9T
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:55:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608054915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VL3IBstom+eNTHfdlg1uXEXo3iY9Yv8ze5q4BAKNhGs=;
 b=eigDUbHkXIBKikBMyOcORDtcyucZ9bfq7aJWiZL5FNqznzSdKexAVCBCfMoUjjhTBDC8RM
 Ix4dXTZSPVukSIX9a1vpjw7YKFUNjNbTJR/5ZdyOEJ2O3BUjO/lbFBDFlYvqa7BEyGMaBc
 ShoChwCXbrAXxjqgT349V7giqPGrZI8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-Heqc6NjFOWiPWctQo5S-hA-1; Tue, 15 Dec 2020 12:55:13 -0500
X-MC-Unique: Heqc6NjFOWiPWctQo5S-hA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C452C1005504;
 Tue, 15 Dec 2020 17:55:11 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F0A660854;
 Tue, 15 Dec 2020 17:55:11 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 42/45] linux-user: remove GNUC check
Date: Tue, 15 Dec 2020 12:54:42 -0500
Message-Id: <20201215175445.1272776-43-pbonzini@redhat.com>
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

QEMU requires Clang or GCC, that define and support __GNUC__ extensions.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201210134752.780923-13-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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
2.26.2



