Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F795132A12
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 16:32:11 +0100 (CET)
Received: from localhost ([::1]:51494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioqq1-0000Em-Gm
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 10:32:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58834)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@redhat.com>) id 1ioqWl-0003pw-Hb
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:12:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@redhat.com>) id 1ioqWk-0007nT-EW
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:12:15 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:45754
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
 id 1ioqWk-0007nC-Ak
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 10:12:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578409934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HKxGboEQw8rX4Bu1SJN9bW2dTLrjcTuRtkmxQkjWds4=;
 b=XnYXh3O8bPOCYdFubceynjCbe14rKQjjQu5VotEMlftGJfG4BqHHcfL2WuukBm7vpwUU0W
 JAF/0kDZ+rVIz4JdGgz5g/q8/TtZDdoEjqru6RkEh2dDQZBG5WOj9nnd7LzH2lUBTEUZUv
 bwgHIqjQmS6nu2Ab9G676kEBRfmxMn4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-kG85XcLxPjeWfyEquOIYqA-1; Tue, 07 Jan 2020 10:12:12 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E635593A0;
 Tue,  7 Jan 2020 15:12:11 +0000 (UTC)
Received: from localhost (ovpn-112-42.ams2.redhat.com [10.36.112.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7542C5D9CA;
 Tue,  7 Jan 2020 15:12:02 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 37/37] qdev/qom: remove some TODO limitations now that PROP_PTR
 is gone
Date: Tue,  7 Jan 2020 19:04:42 +0400
Message-Id: <20200107150442.1727958-38-marcandre.lureau@redhat.com>
In-Reply-To: <20200107150442.1727958-1-marcandre.lureau@redhat.com>
References: <20200107150442.1727958-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: kG85XcLxPjeWfyEquOIYqA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 hw/core/qdev.c     |  8 --------
 qom/qom-qmp-cmds.c | 10 ----------
 2 files changed, 18 deletions(-)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index aa3ccbf2ec..9f1753f5cf 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -736,14 +736,6 @@ void qdev_property_add_static(DeviceState *dev, Proper=
ty *prop,
     if (prop->info->create) {
         prop->info->create(obj, prop, &local_err);
     } else {
-        /*
-         * TODO qdev_prop_ptr does not have getters or setters.  It must
-         * go now that it can be replaced with links.  The test should be
-         * removed along with it: all static properties are read/write.
-         */
-        if (!prop->info->get && !prop->info->set) {
-            return;
-        }
         object_property_add(obj, prop->name, prop->info->name,
                             prop->info->get, prop->info->set,
                             prop->info->release,
diff --git a/qom/qom-qmp-cmds.c b/qom/qom-qmp-cmds.c
index 236e8e41dd..f4494f98ac 100644
--- a/qom/qom-qmp-cmds.c
+++ b/qom/qom-qmp-cmds.c
@@ -142,16 +142,6 @@ static ObjectPropertyInfo *make_device_property_info(O=
bjectClass *klass,
                 continue;
             }
=20
-            /*
-             * TODO Properties without a parser are just for dirty hacks.
-             * qdev_prop_ptr is the only such PropertyInfo.  It's marked
-             * for removal.  This conditional should be removed along with
-             * it.
-             */
-            if (!prop->info->set && !prop->info->create) {
-                return NULL;           /* no way to set it, don't show */
-            }
-
             info =3D g_malloc0(sizeof(*info));
             info->name =3D g_strdup(prop->name);
             info->type =3D default_type ? g_strdup(default_type)
--=20
2.25.0.rc1.20.g2443f3f80d


