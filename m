Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5909150A1CE
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 16:12:35 +0200 (CEST)
Received: from localhost ([::1]:44780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhXXu-0004K5-DH
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 10:12:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXCq-0003OU-IV
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:50:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhXCm-00067x-Ea
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 09:50:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650549043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t0zoJv+PiWjE/Irw2HqIN9ZMQJrGOq4C5YqVc9ZLJT4=;
 b=ChZLjjSY5HFzyLX0ifKdtiAjCzVm0uypgxDFEzElCJaHVDxrCwxBmGWzNvnk2ndGdV9f+R
 ZgQeSc17QdKYR/WuIvXOHbe69mA3oEGAgWLdA8hveRr+jg3m5kUA4F2D4BiCWJQLgEgV3O
 fj+M54ToSsgdUZGzxml1NDurx3PC8ZY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-383-PoWSiODlM-GNL7LBun30-w-1; Thu, 21 Apr 2022 09:50:42 -0400
X-MC-Unique: PoWSiODlM-GNL7LBun30-w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40A01800B28;
 Thu, 21 Apr 2022 13:50:42 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C99040C1438;
 Thu, 21 Apr 2022 13:50:41 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 11/30] doc/style: CLang -> Clang
Date: Thu, 21 Apr 2022 17:49:21 +0400
Message-Id: <20220421134940.2887768-12-marcandre.lureau@redhat.com>
In-Reply-To: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
References: <20220421134940.2887768-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

It's not the way it is usually written (see https://clang.llvm.org/).

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220420132624.2439741-17-marcandre.lureau@redhat.com>
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
2.36.0


