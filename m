Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C914E12419D
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 09:27:33 +0100 (CET)
Received: from localhost ([::1]:51020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihUg8-0001yP-MO
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 03:27:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35847)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1ihUWX-000620-4Y
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 03:17:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1ihUWU-0002XO-Sr
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 03:17:36 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:53783
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1ihUWT-0002Sk-B6
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 03:17:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576657051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x2KuPE/iqqGrRtvWjQbnj5EQTcmHrnHOfWbiTaAQ67g=;
 b=f+CC6zU5IlRbuP7EJ4x/CInR3KO4O2UPDXkEeL0pN4bOUzJf//sRpHy+oPHlmgtFfXzRY8
 Bge+7kevdLeHuUSX9oDgRZ8ZR0v8UW8lmUwFHopa65EUrz77XnZ6jSlinSaZbnzamJFb8Z
 l611SBpjlhcRPvfIWoiLIRdqN95+uag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-HO0CAyffOVWbp_-ryNdaOw-1; Wed, 18 Dec 2019 03:17:29 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E317107ACC4;
 Wed, 18 Dec 2019 08:17:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-42.ams2.redhat.com
 [10.36.116.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 396FF620D8;
 Wed, 18 Dec 2019 08:17:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D3D461136430; Wed, 18 Dec 2019 09:17:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 32/35] include/qom/object.h: rename Error ** parameter to
 more common errp
Date: Wed, 18 Dec 2019 09:17:18 +0100
Message-Id: <20191218081721.23520-33-armbru@redhat.com>
In-Reply-To: <20191218081721.23520-1-armbru@redhat.com>
References: <20191218081721.23520-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: HO0CAyffOVWbp_-ryNdaOw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20191205174635.18758-19-vsementsov@virtuozzo.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/qom/object.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index 128d00c77f..716f6f655d 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -1635,9 +1635,9 @@ void object_class_property_add_uint32_ptr(ObjectClass=
 *klass, const char *name,
  * property of type 'uint64'.
  */
 void object_property_add_uint64_ptr(Object *obj, const char *name,
-                                    const uint64_t *v, Error **Errp);
+                                    const uint64_t *v, Error **errp);
 void object_class_property_add_uint64_ptr(ObjectClass *klass, const char *=
name,
-                                          const uint64_t *v, Error **Errp)=
;
+                                          const uint64_t *v, Error **errp)=
;
=20
 /**
  * object_property_add_alias:
--=20
2.21.0


