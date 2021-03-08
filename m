Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D471E331408
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:04:06 +0100 (CET)
Received: from localhost ([::1]:40514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJJIb-0002Fm-Rg
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:04:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJJA6-000315-GV
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:55:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lJJA3-0007rv-2U
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 11:55:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615222514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m9ZHXKFQ/xoHucHAn50KmDdpnS24lgxf7JR0zgVAWvM=;
 b=Jh10J7OvyuxxHc1MZOn8nNfxJxpYLTMvc2GN+2HvLpXAcbq8QsT3MwRpWiGlq2ik2dQ7QG
 it67Tt7eZM6wE4O2y31X7dxUyFF+Uwxxr9HaBJPN1HWHah31U1aV92IVqmrcdJgneaOzlN
 /BsjoksU/sqYZnHwiluOse8YW6cm/xg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-Qof4ucU6P52pO0LtezvRkg-1; Mon, 08 Mar 2021 11:55:12 -0500
X-MC-Unique: Qof4ucU6P52pO0LtezvRkg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5AB68749BC;
 Mon,  8 Mar 2021 16:55:11 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-100.ams2.redhat.com [10.36.112.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 655255D9E3;
 Mon,  8 Mar 2021 16:55:08 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/30] qapi/qom: Drop deprecated 'props' from object-add
Date: Mon,  8 Mar 2021 17:54:11 +0100
Message-Id: <20210308165440.386489-2-kwolf@redhat.com>
In-Reply-To: <20210308165440.386489-1-kwolf@redhat.com>
References: <20210308165440.386489-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Acked-by: Peter Krempa <pkrempa@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
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
index 561c916da2..893f3e8579 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -206,11 +206,6 @@ Use ``migrate-set-parameters`` and ``query-migrate-parameters`` instead.
 
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


