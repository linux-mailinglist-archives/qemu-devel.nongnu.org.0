Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C64D508AD8
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 16:33:50 +0200 (CEST)
Received: from localhost ([::1]:43242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBOv-0006KA-Fd
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 10:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhANF-0007F5-G2
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:28:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhAND-0004c6-R3
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 09:28:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650461279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SYzgQmX2BxCiPdpPKjcH+jms5gTCwegDzdRNxhPd1tE=;
 b=CHXed4eM+rYkvit4yaf8T4E+6zY+YNmCNNwjL1cuRT6Km3iKY5xZGM0Qw8VstW+lp5AmAq
 YqHUHTLNvSI0iTn3NdY8kumgS2BE0RQEIQM7v2MLsixZhL6JEdui2IU5j7dXZzADaScjfx
 sKPhX87iKgV3Us22vb/SWYwb0NHJAHA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-yw5dXrWYO5KAALRboE8bdA-1; Wed, 20 Apr 2022 09:27:58 -0400
X-MC-Unique: yw5dXrWYO5KAALRboE8bdA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E331E29AA3BB
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 13:27:57 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C536E7AE2;
 Wed, 20 Apr 2022 13:27:41 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 16/41] doc/style: CLang -> Clang
Date: Wed, 20 Apr 2022 17:25:59 +0400
Message-Id: <20220420132624.2439741-17-marcandre.lureau@redhat.com>
In-Reply-To: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

It's not the way it is usually written (see https://clang.llvm.org/).

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 docs/devel/style.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index 9e66d133e15b..7ddd42b6c2c8 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -522,7 +522,7 @@ documented in the GNU Compiler Collection manual starting at version 4.0.
 Automatic memory deallocation
 =============================
 
-QEMU has a mandatory dependency either the GCC or CLang compiler. As
+QEMU has a mandatory dependency on either the GCC or the Clang compiler. As
 such it has the freedom to make use of a C language extension for
 automatically running a cleanup function when a stack variable goes
 out of scope. This can be used to simplify function cleanup paths,
-- 
2.35.1.693.g805e0a68082a


