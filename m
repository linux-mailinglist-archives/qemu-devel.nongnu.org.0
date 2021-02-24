Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C631F323F48
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 15:55:21 +0100 (CET)
Received: from localhost ([::1]:55696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEvZQ-0005G4-Na
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 09:55:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEvPr-0001V5-1r
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:45:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lEvPl-00039Y-7g
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 09:45:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614177920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w4dLXj0hcDhnHvdT/b4y/pp5BwKfLXszzXdhOiXAvm0=;
 b=YPEzzJ6XzR1Au1WcT7Dt8zXFyVFy7BzGkUg42YA8F3SiQEZH9b6DCMpL6r2bROKE09Fr1r
 61ytoMQ7i1225hHhL7TzGaxNSloYX6vLuDpxdbYNDvCdrRSMGX4+RAmp8qDnvUVb6jpohV
 Ran5wLVVSvM2Ac1eUSlEPzWlJjaKwgk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-zUZdjFFVM2Kqo9l5TEuv0w-1; Wed, 24 Feb 2021 09:45:18 -0500
X-MC-Unique: zUZdjFFVM2Kqo9l5TEuv0w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AE6F18E74BA;
 Wed, 24 Feb 2021 13:53:18 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-142.ams2.redhat.com [10.36.114.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4AEBF5D6D3;
 Wed, 24 Feb 2021 13:53:15 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/31] qapi/qom: Drop deprecated 'props' from object-add
Date: Wed, 24 Feb 2021 14:52:26 +0100
Message-Id: <20210224135255.253837-3-kwolf@redhat.com>
In-Reply-To: <20210224135255.253837-1-kwolf@redhat.com>
References: <20210224135255.253837-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The option has been deprecated in QEMU 5.0, remove it.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/qom.json                    |  6 +-----
 docs/system/deprecated.rst       |  5 -----
 docs/system/removed-features.rst |  5 +++++
 qom/qom-qmp-cmds.c               | 21 ---------------------
 4 files changed, 6 insertions(+), 31 deletions(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index 0b0b92944b..96c91c1faf 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -211,10 +211,6 @@
 #
 # @id: the name of the new object
 #
-# @props: a dictionary of properties to be passed to the backend. Deprecated
-#         since 5.0, specify the properties on the top level instead. It is an
-#         error to specify the same option both on the top level and in @props.
-#
 # Additional arguments depend on qom-type and are passed to the backend
 # unchanged.
 #
@@ -232,7 +228,7 @@
 #
 ##
 { 'command': 'object-add',
-  'data': {'qom-type': 'str', 'id': 'str', '*props': 'any'},
+  'data': {'qom-type': 'str', 'id': 'str'},
   'gen': false } # so we can get the additional arguments
 
 ##
diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 2fcac7861e..00b694e053 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -199,11 +199,6 @@ Use ``migrate-set-parameters`` and ``query-migrate-parameters`` instead.
 
 Use arguments ``base-node`` and ``top-node`` instead.
 
-``object-add`` option ``props`` (since 5.0)
-'''''''''''''''''''''''''''''''''''''''''''
-
-Specify the properties for the object as top-level arguments instead.
-
 ``query-named-block-nodes`` and ``query-block`` result dirty-bitmaps[i].status (since 4.0)
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index c8481cafbd..95f3fb2912 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -58,6 +58,11 @@ documentation of ``query-hotpluggable-cpus`` for additional details.
 
 Use ``blockdev-change-medium`` or ``change-vnc-password`` instead.
 
+``object-add`` option ``props`` (removed in 6.0)
+''''''''''''''''''''''''''''''''''''''''''''''''
+
+Specify the properties for the object as top-level arguments instead.
+
 Human Monitor Protocol (HMP) commands
 -------------------------------------
 
diff --git a/qom/qom-qmp-cmds.c b/qom/qom-qmp-cmds.c
index b40ac39f30..19fd5e117f 100644
--- a/qom/qom-qmp-cmds.c
+++ b/qom/qom-qmp-cmds.c
@@ -225,27 +225,6 @@ ObjectPropertyInfoList *qmp_qom_list_properties(const char *typename,
 
 void qmp_object_add(QDict *qdict, QObject **ret_data, Error **errp)
 {
-    QObject *props;
-    QDict *pdict;
-
-    props = qdict_get(qdict, "props");
-    if (props) {
-        pdict = qobject_to(QDict, props);
-        if (!pdict) {
-            error_setg(errp, QERR_INVALID_PARAMETER_TYPE, "props", "dict");
-            return;
-        }
-        qobject_ref(pdict);
-        qdict_del(qdict, "props");
-        qdict_join(qdict, pdict, false);
-        if (qdict_size(pdict) != 0) {
-            error_setg(errp, "Option in 'props' conflicts with top level");
-            qobject_unref(pdict);
-            return;
-        }
-        qobject_unref(pdict);
-    }
-
     user_creatable_add_dict(qdict, false, errp);
 }
 
-- 
2.29.2


