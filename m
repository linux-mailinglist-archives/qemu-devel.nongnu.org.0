Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4DA421983
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 23:57:06 +0200 (CEST)
Received: from localhost ([::1]:49264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXVxI-0005ia-Mz
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 17:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mXVtU-0001wN-RT
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:53:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mXVtT-0002iV-Dw
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:53:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633384386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oHXSUIxtfz/N0mOXr+UcOqcE37P10kVy94LmMow+R6M=;
 b=hXXpbUz4FFnPfRirCLfirZS0OXyKaKYXs8tS+jQkU3jSCkZ9i1+7bB4ogXoS5Usy4vG6xB
 0HiX6MNL8qiuBEpEFritsc0/IAI/I62ywErTvpUyLcFeeIyhRjLTsnB4M2q2yXHYMqr6WK
 CtrIBIhk6h+7L9PCYAR+1wPa9t/gsdo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-xxrXFs0LOU6FULG6xxe8sg-1; Mon, 04 Oct 2021 17:52:49 -0400
X-MC-Unique: xxrXFs0LOU6FULG6xxe8sg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9419F18D6A25;
 Mon,  4 Oct 2021 21:52:48 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82BE119C59;
 Mon,  4 Oct 2021 21:52:46 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/3] docs/sphinx: change default role to "any"
Date: Mon,  4 Oct 2021 17:52:38 -0400
Message-Id: <20211004215238.1523082-4-jsnow@redhat.com>
In-Reply-To: <20211004215238.1523082-1-jsnow@redhat.com>
References: <20211004215238.1523082-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 John Snow <jsnow@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This interprets single-backtick syntax in all of our Sphinx docs as a
cross-reference to *something*, including Python symbols.

From here on out, new uses of `backticks` will cause a build failure if
the target cannot be referenced.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/conf.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/conf.py b/docs/conf.py
index ff6e92c6e2e..4d9f56601fc 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -85,6 +85,11 @@
 # The master toctree document.
 master_doc = 'index'
 
+# Interpret `single-backticks` to be a cross-reference to any kind of
+# referenceable object. Unresolvable or ambiguous references will emit a
+# warning at build time.
+default_role = 'any'
+
 # General information about the project.
 project = u'QEMU'
 copyright = u'2021, The QEMU Project Developers'
-- 
2.31.1


