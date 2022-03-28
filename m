Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B694E98FF
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 16:09:41 +0200 (CEST)
Received: from localhost ([::1]:41694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYq3w-00021T-GV
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 10:09:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nYpxJ-0001i5-LF
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:02:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nYpxF-0004jh-Rn
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 10:02:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648476165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wOv5m/i45Z5p/dutn3wBGO372HVHJNIJUn4OO1Le8/s=;
 b=Fskdu8auNAUDRZZLEdAHrwU/8cW+tOy1LFUPw2H1qeBRAe4QwR0CZ9RIjLjhz2JryM81kK
 0TrcTSbfwl2xxdPbfJAe8pnrh+Q9S3PaXaekCCMTUwO2nZY8k9MOZ4Vv3EURUFDkDk/C2U
 ReReZDqTvi2hgpdEW+Fo8w9hzsoT70k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-azLagKusMEaPrGqbkX14yA-1; Mon, 28 Mar 2022 10:02:41 -0400
X-MC-Unique: azLagKusMEaPrGqbkX14yA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D453280550F;
 Mon, 28 Mar 2022 14:02:41 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7423C1121318;
 Mon, 28 Mar 2022 14:02:41 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/15] tests/docker: remove unnecessary filtering of
 $(DOCKER_IMAGES)
Date: Mon, 28 Mar 2022 10:02:31 -0400
Message-Id: <20220328140240.40798-7-pbonzini@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Now that DOCKER_IMAGES is only defined after DOCKER_VIRTUAL_IMAGES is
complete, there is no need to re-filter DOCKER_IMAGES against it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/docker/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index f4bbba47a5..5cadd1b53e 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -201,7 +201,7 @@ __TESTS := $(notdir $(shell find $(SRC_PATH)/tests/docker/ -name 'test-*' -type
 DOCKER_TESTS := $(if $(TESTS), $(filter $(TESTS), $(__TESTS)), $(__TESTS))
 
 # Expand all the pre-requistes for each docker image and test combination
-$(foreach i,$(filter-out $(DOCKER_PARTIAL_IMAGES) $(DOCKER_VIRTUAL_IMAGES),$(DOCKER_IMAGES)), \
+$(foreach i,$(filter-out $(DOCKER_PARTIAL_IMAGES),$(DOCKER_IMAGES)), \
 	$(foreach t,$(DOCKER_TESTS), \
 		$(eval .PHONY: docker-$t@$i) \
 		$(eval docker-$t@$i: docker-image-$i docker-run-$t@$i) \
-- 
2.31.1



