Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE68A26550D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Sep 2020 00:26:32 +0200 (CEST)
Received: from localhost ([::1]:35940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGV1T-0003wj-Pi
	for lists+qemu-devel@lfdr.de; Thu, 10 Sep 2020 18:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kGUqw-0001Tz-AT
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 18:15:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kGUqu-0002YR-QI
 for qemu-devel@nongnu.org; Thu, 10 Sep 2020 18:15:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599776136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tq9FPTvOzwqmtyJO3lm5hMX0keRuf9hRnQp8ycw0bEQ=;
 b=jC1dpwf4fy06z+Ji7lMiMf95DS+OYlIaWSRyMR95W39buEX0eBFQBLT8KTBOq/Dx5yrIGj
 ywk5el10rHgUr5QsMXzxRnoiIFwuGx4cc6FZ6VBBJEOt3hlL5BNmY63Kpiu/zhcaZa0RpX
 7Inc9Hs7NzMl93qlckM3HkSlxZMxVKg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-pqmtxGl-OySjvI7IeIFOtw-1; Thu, 10 Sep 2020 18:15:32 -0400
X-MC-Unique: pqmtxGl-OySjvI7IeIFOtw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40E79802B78;
 Thu, 10 Sep 2020 22:15:31 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 05BE660BF1;
 Thu, 10 Sep 2020 22:15:30 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/9] qom: Use ``code`` Sphinx syntax where appropriate
Date: Thu, 10 Sep 2020 18:15:20 -0400
Message-Id: <20200910221526.10041-4-ehabkost@redhat.com>
In-Reply-To: <20200910221526.10041-1-ehabkost@redhat.com>
References: <20200910221526.10041-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 18:15:36
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace gtkdoc markup with Sphinx ``code`` syntax.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/qom/object.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index f85718380d..4fb528d841 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -203,8 +203,8 @@ typedef struct InterfaceInfo InterfaceInfo;
  * an interface instance should always be of incomplete type in order to be
  * sure it cannot be dereferenced.  That is, you should define the
  * 'typedef struct SomethingIf SomethingIf' so that you can pass around
- * 'SomethingIf *si' arguments, but not define a 'struct SomethingIf { ... }'.
- * The only things you can validly do with a 'SomethingIf *' are to pass it as
+ * ``SomethingIf *si`` arguments, but not define a ``struct SomethingIf { ... }``.
+ * The only things you can validly do with a ``SomethingIf *`` are to pass it as
  * an argument to a method on its corresponding SomethingIfClass, or to
  * dynamically cast it to an object that implements the interface.
  *
@@ -301,7 +301,7 @@ typedef struct InterfaceInfo InterfaceInfo;
  *
  * Alternatively, object_class_by_name() can be used to obtain the class and
  * its non-overridden methods for a specific type. This would correspond to
- * |[ MyClass::method(...) ]| in C++.
+ * ``MyClass::method(...)`` in C++.
  *
  * The first example of such a QOM method was #CPUClass.reset,
  * another example is #DeviceClass.realize.
-- 
2.26.2


