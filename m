Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2E92820AC
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Oct 2020 04:56:49 +0200 (CEST)
Received: from localhost ([::1]:54944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOXj6-00021I-CQ
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 22:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kOXgu-0000FG-3a
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 22:54:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kOXgs-0006j0-D4
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 22:54:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601693669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d1UGozPiLsg8iTHrcO64i29mynbrHiKjnQfaaPRMXhs=;
 b=Zoz051v2ilXs5YU2v9bIIg6H4frzaf786SWjOhgrUylhbvupO2RzLkah1uYuyWSIxfoY5I
 85bfxQ0YRLYitXQg2lABIZrC5M4inP1sTDDflsyA9gevL2fGbX3nSrQxkNH0Q/vAJXVdF/
 1/Akd/LbxYoH0c2zW/JaXEdkK7HSsaI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-DTeeERW6M_-JiJ5mNOuSpQ-1; Fri, 02 Oct 2020 22:54:28 -0400
X-MC-Unique: DTeeERW6M_-JiJ5mNOuSpQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 126551074648
 for <qemu-devel@nongnu.org>; Sat,  3 Oct 2020 02:54:27 +0000 (UTC)
Received: from localhost (ovpn-119-102.rdu2.redhat.com [10.10.119.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D39E75D9D3;
 Sat,  3 Oct 2020 02:54:26 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/6] qom: Fix DECLARE_*CHECKER documentation
Date: Fri,  2 Oct 2020 22:54:19 -0400
Message-Id: <20201003025424.199291-2-ehabkost@redhat.com>
In-Reply-To: <20201003025424.199291-1-ehabkost@redhat.com>
References: <20201003025424.199291-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/02 21:59:12
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
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Correct copy/paste mistake in the DECLARE_INSTANCE_CHECKER and
DECLARE_CLASS_CHECKERS documentation.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/qom/object.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index 27aaa67e63f..e738dfc6744 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -170,7 +170,7 @@ struct Object
  * Direct usage of this macro should be avoided, and the complete
  * OBJECT_DECLARE_TYPE macro is recommended instead.
  *
- * This macro will provide the three standard type cast functions for a
+ * This macro will provide the the instance type cast functions for a
  * QOM type.
  */
 #define DECLARE_INSTANCE_CHECKER(InstanceType, OBJ_NAME, TYPENAME) \
@@ -187,7 +187,7 @@ struct Object
  * Direct usage of this macro should be avoided, and the complete
  * OBJECT_DECLARE_TYPE macro is recommended instead.
  *
- * This macro will provide the three standard type cast functions for a
+ * This macro will provide the class type cast functions for a
  * QOM type.
  */
 #define DECLARE_CLASS_CHECKERS(ClassType, OBJ_NAME, TYPENAME) \
-- 
2.26.2


