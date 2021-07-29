Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D926D3DAA92
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 19:59:50 +0200 (CEST)
Received: from localhost ([::1]:55676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9AJx-0006HY-UM
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 13:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m9AGI-0006Lf-6L
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 13:56:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m9AGG-0007sJ-7I
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 13:56:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627581359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=edC1pJilsnl1UQRSlIlaG7i1yibsPNWYr3Vhj3h9MxA=;
 b=WkpK/gPBeFLvNN/3/xHavQR9d2nTVkA0goV2I9xsOjDua7lCrH9z3609DbPH365Up52eRl
 PM8NuXrgfZ7IzvySM6uCTDH5DwquxC3yNc+L2gzq9Q1/Nreic6iY2skiMn0IQOMjxrLN3M
 /W896ldPtG7EaJ/Ft8aWHSwHJ8li3/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-qq8O0wxUMkerD6_MFrOWdA-1; Thu, 29 Jul 2021 13:55:58 -0400
X-MC-Unique: qq8O0wxUMkerD6_MFrOWdA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CA558799EB
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 17:55:57 +0000 (UTC)
Received: from localhost (unknown [10.22.18.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CEA25D6B1;
 Thu, 29 Jul 2021 17:55:57 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 03/10] docs: qom: Fix autoptr expansion example
Date: Thu, 29 Jul 2021 13:55:47 -0400
Message-Id: <20210729175554.686474-4-ehabkost@redhat.com>
In-Reply-To: <20210729175554.686474-1-ehabkost@redhat.com>
References: <20210729175554.686474-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The wrong type name was being used.  The autoptr cleanup function
will be declared for the instance type, not the class type.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 docs/devel/qom.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
index 3499a8ca3b6..7ef16d92ca6 100644
--- a/docs/devel/qom.rst
+++ b/docs/devel/qom.rst
@@ -304,7 +304,7 @@ This is equivalent to the following:
    typedef struct MyDevice MyDevice;
    typedef struct MyDeviceClass MyDeviceClass;
 
-   G_DEFINE_AUTOPTR_CLEANUP_FUNC(MyDeviceClass, object_unref)
+   G_DEFINE_AUTOPTR_CLEANUP_FUNC(MyDevice, object_unref)
 
    #define MY_DEVICE_GET_CLASS(void *obj) \
            OBJECT_GET_CLASS(MyDeviceClass, obj, TYPE_MY_DEVICE)
-- 
2.31.1


