Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A171276E00
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 11:55:51 +0200 (CEST)
Received: from localhost ([::1]:53686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLNyf-0003sX-S5
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 05:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kLNUK-0002Sy-P8
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 05:24:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kLNUJ-0006BE-3S
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 05:24:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600939466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QmgYRQHFIFcdTWAIpyTXgnNQEvKpJ/ZLizrIx12YOv0=;
 b=eGBjwEa15Ao2v1ejylKPPa2EFBWOvldwWRPNdg/vX7kG8sE4+4FOihwFhyJO6bCVRqGkY2
 7scRXjH9QnXAoKSCKjlwJGoP2xNjOn2G6AfQZ9qphvfeZlaewWt5YKZRGxKAtg+ODDoQeD
 mLZASdPAy9z5uxOXu96MRF6bHf0H9Dc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-WIlf1CIQMLuMC7qAktCbOQ-1; Thu, 24 Sep 2020 05:24:24 -0400
X-MC-Unique: WIlf1CIQMLuMC7qAktCbOQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1C7D1007469
 for <qemu-devel@nongnu.org>; Thu, 24 Sep 2020 09:24:23 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2C5CF65F5E;
 Thu, 24 Sep 2020 09:24:18 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 68/92] qom: Use ``code`` Sphinx syntax where appropriate
Date: Thu, 24 Sep 2020 05:22:50 -0400
Message-Id: <20200924092314.1722645-69-pbonzini@redhat.com>
In-Reply-To: <20200924092314.1722645-1-pbonzini@redhat.com>
References: <20200924092314.1722645-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/24 01:10:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eduardo Habkost <ehabkost@redhat.com>

Replace gtkdoc markup with Sphinx ``code`` syntax.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20200910221526.10041-4-ehabkost@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qom/object.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index 473dc21bf4..f1e8cb5398 100644
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



