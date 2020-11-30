Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 821742C8451
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 13:49:37 +0100 (CET)
Received: from localhost ([::1]:52326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjica-0002pe-F9
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 07:49:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjiIJ-0003Ex-PA
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:28:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kjiIF-00034y-GQ
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 07:28:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606739314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AbKP+CG/rBlp3SyuVEM2fY1PjIJ86EP1EQwvMGjWHd4=;
 b=FwSdwx8+CVbV7LEuLDoN17JO7Gn3/rxCOThl/vMIQQcDAAXx6Vuz51Y6xS+E65DjF9lfJq
 yVvQRUgYSlCUpfXSqxkNAFlBt6CWPBcH0f6x7KqTzIUC2W2cIRM1c3lDyvH0rvtaz2BJW9
 iQQ7DOtUvpMEdRLK9VpmKimBuaKwrKs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-xmuXQymlMvi7ahj3E2VtoQ-1; Mon, 30 Nov 2020 07:28:32 -0500
X-MC-Unique: xmuXQymlMvi7ahj3E2VtoQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDAE99CC03;
 Mon, 30 Nov 2020 12:28:31 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-117.ams2.redhat.com [10.36.114.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EBB17277C5;
 Mon, 30 Nov 2020 12:28:28 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/18] qapi/qom: Drop deprecated 'props' from object-add
Date: Mon, 30 Nov 2020 13:25:37 +0100
Message-Id: <20201130122538.27674-18-kwolf@redhat.com>
In-Reply-To: <20201130122538.27674-1-kwolf@redhat.com>
References: <20201130122538.27674-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The option has been deprecated in QEMU 5.0, remove it.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 qapi/qom.json              |  6 +-----
 docs/system/deprecated.rst | 10 +++++-----
 qom/qom-qmp-cmds.c         | 21 ---------------------
 3 files changed, 6 insertions(+), 31 deletions(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index 29b229394e..7e0d26a728 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -813,10 +813,6 @@
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
@@ -834,7 +830,7 @@
 #
 ##
 { 'command': 'object-add',
-  'data': {'qom-type': 'str', 'id': 'str', '*props': 'any'},
+  'data': {'qom-type': 'str', 'id': 'str'},
   'gen': false } # so we can get the additional arguments
 
 ##
diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 04e41254f9..e6043799a4 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -224,11 +224,6 @@ Use ``migrate-set-parameters`` and ``query-migrate-parameters`` instead.
 
 Use arguments ``base-node`` and ``top-node`` instead.
 
-``object-add`` option ``props`` (since 5.0)
-'''''''''''''''''''''''''''''''''''''''''''
-
-Specify the properties for the object as top-level arguments instead.
-
 ``query-named-block-nodes`` and ``query-block`` result dirty-bitmaps[i].status (since 4.0)
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
@@ -558,6 +553,11 @@ are automatically loaded from qcow2 images.
 Use ``device_add`` for hotplugging vCPUs instead of ``cpu-add``.  See
 documentation of ``query-hotpluggable-cpus`` for additional details.
 
+``object-add`` option ``props`` (removed in 6.0)
+''''''''''''''''''''''''''''''''''''''''''''''''
+
+Specify the properties for the object as top-level arguments instead.
+
 Human Monitor Protocol (HMP) commands
 -------------------------------------
 
diff --git a/qom/qom-qmp-cmds.c b/qom/qom-qmp-cmds.c
index 310ab2d048..0e7d7247fc 100644
--- a/qom/qom-qmp-cmds.c
+++ b/qom/qom-qmp-cmds.c
@@ -243,27 +243,6 @@ ObjectPropertyInfoList *qmp_qom_list_properties(const char *typename,
 
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
2.28.0


