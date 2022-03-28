Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4B74E98F7
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 16:06:26 +0200 (CEST)
Received: from localhost ([::1]:33610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYq0n-0004f6-H3
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 10:06:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nYpxM-0001mf-22
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:02:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nYpxH-0004kN-UQ
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:02:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648476167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rp4kHG3BA43WbEs98k0XNYRTWeJuW+qwiBg4wQTbDBQ=;
 b=YPErTIzNpKV3Q/26zglXBvEDU7wNC7MI+ymLVf6wRXdA0CRb09yznxzci2JNTodBvjQ0nn
 5hx8Y14kcJEDJGimzM3RPXt+X56hbeWd1fJ3kDi1EQfyIPajmTPKq1F3e2Clbzlbmm8F/p
 ejv41IfxGkU8ge1rvcXQUzgczq4zNqI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-307-OMt_brzMMA-ERYT1E5KoUQ-1; Mon, 28 Mar 2022 10:02:44 -0400
X-MC-Unique: OMt_brzMMA-ERYT1E5KoUQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B19BF801E67;
 Mon, 28 Mar 2022 14:02:42 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 995BA1121318;
 Mon, 28 Mar 2022 14:02:42 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/15] tests/docker: remove SKIP_DOCKER_BUILD
Date: Mon, 28 Mar 2022 10:02:39 -0400
Message-Id: <20220328140240.40798-15-pbonzini@redhat.com>
In-Reply-To: <20220328140240.40798-1-pbonzini@redhat.com>
References: <20220328140240.40798-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is now unused.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/docker/Makefile.include | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index e1bea20451..1b10585f28 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -33,15 +33,7 @@ $(DOCKER_SRC_COPY):
 
 docker-qemu-src: $(DOCKER_SRC_COPY)
 
-# General rule for building docker images. If we are a sub-make
-# invoked with SKIP_DOCKER_BUILD we still check the image is up to date
-# though
-ifdef SKIP_DOCKER_BUILD
-docker-image-%: $(DOCKER_FILES_DIR)/%.docker
-	$(call quiet-command, \
-		$(DOCKER_SCRIPT) check --quiet qemu/$* $<, \
-		"CHECK", "$*")
-else
+# General rule for building docker images.
 docker-image-%: $(DOCKER_FILES_DIR)/%.docker
 	$(call quiet-command,\
 		$(DOCKER_SCRIPT) build -t qemu/$* -f $< \
@@ -77,8 +69,6 @@ docker-binfmt-image-debian-%: $(DOCKER_FILES_DIR)/debian-bootstrap.docker
 			{ echo "You will need to build $(EXECUTABLE)"; exit 1;},\
 			"CHECK", "debian-$* exists"))
 
-endif
-
 # Enforce dependencies for composite images
 # we don't run tests on intermediate images (used as base by another image)
 DOCKER_PARTIAL_IMAGES := debian10 debian11
-- 
2.31.1



