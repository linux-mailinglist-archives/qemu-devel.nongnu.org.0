Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BED476469
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 22:16:09 +0100 (CET)
Received: from localhost ([::1]:47812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxbdA-0007Yk-Ah
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 16:16:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxbVy-0003Ik-Ff
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:08:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxbVw-0006ZL-2h
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:08:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639602519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3dDSw4lxbB+lht0RVbcXDHGS9+x/3dzzGjeh7zHWav0=;
 b=Fnl+U0Amqyr4/1J75hwFVa5BRnU8IAThJVH7YMjgejVaChICjA1qS6tUjh/GiDGvsvApBf
 fA4NS8uVhCXRpanBrTZHTfxFnMo65SBEpQkhuwFGThHxArRYO7LDZNAW4AZxhGdOmm7Py1
 NCNixwg5HJ9w0jxPBtIkTVLfoylXQiA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29-Qcpf16I6PdqxZOec5RVUFw-1; Wed, 15 Dec 2021 16:08:36 -0500
X-MC-Unique: Qcpf16I6PdqxZOec5RVUFw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E4C310151E2;
 Wed, 15 Dec 2021 21:08:35 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BFAB5F4E1;
 Wed, 15 Dec 2021 21:08:25 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC qemu.qmp PATCH 04/24] Update project description
Date: Wed, 15 Dec 2021 16:06:14 -0500
Message-Id: <20211215210634.3779791-5-jsnow@redhat.com>
In-Reply-To: <20211215210634.3779791-1-jsnow@redhat.com>
References: <20211215210634.3779791-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>
---
 setup.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/setup.cfg b/setup.cfg
index 7cd8470..9946875 100644
--- a/setup.cfg
+++ b/setup.cfg
@@ -7,7 +7,7 @@ maintainer = QEMU Project
 maintainer_email = qemu-devel@nongnu.org
 url = https://www.qemu.org/
 download_url = https://www.qemu.org/download/
-description = QEMU Python Build, Debug and SDK tooling.
+description = QEMU Monitor Protocol library.
 long_description = file:PACKAGE.rst
 long_description_content_type = text/x-rst
 classifiers =
-- 
2.31.1


