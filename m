Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B220457710
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 20:34:47 +0100 (CET)
Received: from localhost ([::1]:54154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo9eo-00048o-Ll
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 14:34:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mo9bw-00021Q-EU
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 14:31:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mo9bu-0008Ba-Hg
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 14:31:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637350305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IEiT6SdjiFuFmSAGklRlF6TDROoJGZeXRm+JAzW17fo=;
 b=GOVpvDBzmNWwPnau/ZgJrIWKrwms3wRUIy2ulEUogpHhIF+clrjGgfurGSUK8Yf2fGlb7t
 8KI63wDCctwsps89EsOIG44YF/J7HkILtzU3r7b/fLuKMBbtBhKLlyT/+FKRije+GTd+4X
 MHE0WNT14C+RdLKqhURTfrFnjuVyY7Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-27LRbu34P0mVqlnXzchPJg-1; Fri, 19 Nov 2021 14:31:32 -0500
X-MC-Unique: 27LRbu34P0mVqlnXzchPJg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C70C184215A;
 Fri, 19 Nov 2021 19:31:31 +0000 (UTC)
Received: from paraplu.home (unknown [10.39.192.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C5F90196E2;
 Fri, 19 Nov 2021 19:31:28 +0000 (UTC)
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] docs: List more commit-message tags "in
 submitting-a-patch"
Date: Fri, 19 Nov 2021 20:31:18 +0100
Message-Id: <20211119193118.949698-3-kchamart@redhat.com>
In-Reply-To: <20211119193118.949698-1-kchamart@redhat.com>
References: <20211119193118.949698-1-kchamart@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9=20?= <berrange@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, Eric Blake <eblake@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add some more examples of commonly used commit-message tags.

(Thanks: Alex Bennée)

Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
---
 docs/devel/submitting-a-patch.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
index ae6a9d45ab..9e89a66ad0 100644
--- a/docs/devel/submitting-a-patch.rst
+++ b/docs/devel/submitting-a-patch.rst
@@ -192,6 +192,10 @@ Example::
  Resolves: https://gitlab.com/qemu-project/qemu/-/issues/42
  Buglink: https://bugs.launchpad.net/qemu/+bug/1804323``
 
+Some other tags that are used in commit messages include "Message-Id:"
+"Tested-by:", "Acked-by:", "Reported-by:", "Suggested-by".  See ``git
+log`` for these keywords for example usage.
+
 .. _test_your_patches:
 
 Test your patches
-- 
2.31.1


