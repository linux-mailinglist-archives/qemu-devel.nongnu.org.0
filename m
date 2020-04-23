Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6EE1B6055
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Apr 2020 18:07:16 +0200 (CEST)
Received: from localhost ([::1]:57972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jReNf-00063Q-9q
	for lists+qemu-devel@lfdr.de; Thu, 23 Apr 2020 12:07:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59882)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jReHk-00063G-OX
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 12:01:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jReHQ-00022u-Jw
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 12:01:08 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:30683
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jReHQ-0001wp-2T
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 12:00:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587657641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AorLotF1j7RvB12PFYX5lxGkv3DttGRrYNfU+YHZZZg=;
 b=JCIAFKbTbq9t3sVN+hSP/l6IYtpFCRPBZp34sTjSln3Tt9nKxZdvZtFUoI1G2DMg93chUX
 R2nAuKFo5zND1POeRwYV4fXtJfj5V4z7TxwYURPGcqkFE3f1HcSM4u9RqFx+/SZvngBwzE
 w/12bCDYomu2GUwQd9cxiWe/xNjAuwU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-XuheM1CpN7KzkaZ0w8P_pQ-1; Thu, 23 Apr 2020 12:00:39 -0400
X-MC-Unique: XuheM1CpN7KzkaZ0w8P_pQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 242BD180F105;
 Thu, 23 Apr 2020 16:00:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-6.ams2.redhat.com [10.36.113.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E218810016EB;
 Thu, 23 Apr 2020 16:00:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 574A211358BD; Thu, 23 Apr 2020 18:00:36 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/13] qapi: Belatedly update visitor.h's big comment for QAPI
 modules
Date: Thu, 23 Apr 2020 18:00:24 +0200
Message-Id: <20200423160036.7048-2-armbru@redhat.com>
In-Reply-To: <20200423160036.7048-1-armbru@redhat.com>
References: <20200423160036.7048-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/23 02:14:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/qapi/visitor.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/qapi/visitor.h b/include/qapi/visitor.h
index c5b23851a1..f8a0fc1ea9 100644
--- a/include/qapi/visitor.h
+++ b/include/qapi/visitor.h
@@ -58,7 +58,7 @@
  *
  * where T is FOO for scalar types, and FOO * otherwise.  The scalar
  * visitors are declared here; the remaining visitors are generated in
- * qapi-visit.h.
+ * qapi-visit-MODULE.h.
  *
  * The @name parameter of visit_type_FOO() describes the relation
  * between this QAPI value and its parent container.  When visiting
@@ -86,16 +86,16 @@
  * by manual construction.
  *
  * For the QAPI object types (structs, unions, and alternates), there
- * is an additional generated function in qapi-visit.h compatible
- * with:
+ * is an additional generated function in qapi-visit-MODULE.h
+ * compatible with:
  *
  * void visit_type_FOO_members(Visitor *v, FOO *obj, Error **errp);
  *
  * for visiting the members of a type without also allocating the QAPI
  * struct.
  *
- * Additionally, in qapi-types.h, all QAPI pointer types (structs,
- * unions, alternates, and lists) have a generated function compatible
+ * Additionally, QAPI pointer types (structs, unions, alternates, and
+ * lists) have a generated function in qapi-types-MODULE.h compatible
  * with:
  *
  * void qapi_free_FOO(FOO *obj);
--=20
2.21.1


