Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 652C4834E3
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Aug 2019 17:16:07 +0200 (CEST)
Received: from localhost ([::1]:34106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hv1C2-0005wK-EX
	for lists+qemu-devel@lfdr.de; Tue, 06 Aug 2019 11:16:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50965)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hv1Am-000422-6r
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 11:14:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hv1Al-0004j5-6B
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 11:14:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60016)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hv1Al-0004ie-06
 for qemu-devel@nongnu.org; Tue, 06 Aug 2019 11:14:47 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 59233300BEAC
 for <qemu-devel@nongnu.org>; Tue,  6 Aug 2019 15:14:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-251.ams2.redhat.com
 [10.36.117.251])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26C2860A35
 for <qemu-devel@nongnu.org>; Tue,  6 Aug 2019 15:14:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7457B1136423; Tue,  6 Aug 2019 17:14:35 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  6 Aug 2019 17:14:17 +0200
Message-Id: <20190806151435.10740-12-armbru@redhat.com>
In-Reply-To: <20190806151435.10740-1-armbru@redhat.com>
References: <20190806151435.10740-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Tue, 06 Aug 2019 15:14:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 11/29] typedefs: Separate incomplete types
 and function types
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While there, drop the obsolete file comment.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/qemu/typedefs.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index fcdaae58c4..29346648d4 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -1,10 +1,10 @@
 #ifndef QEMU_TYPEDEFS_H
 #define QEMU_TYPEDEFS_H
=20
-/* A load of opaque types so that device init declarations don't have to
-   pull in all the real definitions.  */
-
-/* Please keep this list in case-insensitive alphabetical order */
+/*
+ * Incomplete struct types
+ * Please keep this list in case-insensitive alphabetical order.
+ */
 typedef struct AdapterInfo AdapterInfo;
 typedef struct AddressSpace AddressSpace;
 typedef struct AioContext AioContext;
@@ -101,6 +101,10 @@ typedef struct SHPCDevice SHPCDevice;
 typedef struct SSIBus SSIBus;
 typedef struct VirtIODevice VirtIODevice;
 typedef struct Visitor Visitor;
+
+/*
+ * Function types
+ */
 typedef void SaveStateHandler(QEMUFile *f, void *opaque);
 typedef int LoadStateHandler(QEMUFile *f, void *opaque, int version_id);
=20
--=20
2.21.0


