Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F91459080
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 15:46:30 +0100 (CET)
Received: from localhost ([::1]:59492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpAaT-0002Qf-T6
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 09:46:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mpAXy-00081T-42
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 09:43:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mpAXw-0004KO-5h
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 09:43:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637592227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oZVB/+Y9/2QxjNIl+X1VYgFbeci9ymh4BHacyneS4kc=;
 b=L4Pgr6G9QTG8dZ3gk6GYA501DQ5zvnQ/lfyphS50LSQbjHt04Ke1FlyojPM/iXA8HqGFwY
 l0WY2untk5sIdcUG1ixBMHxwuwBSo8gZ4RqQgYulKspgn0lF3zADtjqpYoK/mIKeNU3ws1
 7eiDnH+rOo5ewhJRQ6m3FjfACxrAfX0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-4XW6qVarO1Glmr_d1inodw-1; Mon, 22 Nov 2021 09:43:45 -0500
X-MC-Unique: 4XW6qVarO1Glmr_d1inodw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98B95100CCC1;
 Mon, 22 Nov 2021 14:43:44 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2779E5E274;
 Mon, 22 Nov 2021 14:43:42 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 4/6] docs: Drop deprecated 'props' from object-add
Date: Mon, 22 Nov 2021 15:43:18 +0100
Message-Id: <20211122144320.29178-5-thuth@redhat.com>
In-Reply-To: <20211122144320.29178-1-thuth@redhat.com>
References: <20211122144320.29178-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Rao, Lei" <lei.rao@intel.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

In commit 5024340745 "qapi/qom: Drop deprecated 'props' from
object-add" (v6.0.0), we also should update documents.

Signed-off-by: Lei Rao <lei.rao@intel.com>
Message-Id: <1637567387-28250-1-git-send-email-lei.rao@intel.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/COLO-FT.txt        | 16 ++++++++--------
 docs/system/authz.rst   | 26 ++++++++++----------------
 docs/throttle.txt       |  8 +++-----
 docs/tools/qemu-nbd.rst |  2 +-
 4 files changed, 22 insertions(+), 30 deletions(-)

diff --git a/docs/COLO-FT.txt b/docs/COLO-FT.txt
index 8d6d53a5a2..fd5ffcc6e5 100644
--- a/docs/COLO-FT.txt
+++ b/docs/COLO-FT.txt
@@ -289,11 +289,11 @@ Wait until disk is synced, then:
 {'execute': 'human-monitor-command', 'arguments':{ 'command-line': 'drive_add -n buddy driver=replication,mode=primary,file.driver=nbd,file.host=127.0.0.2,file.port=9999,file.export=parent0,node-name=replication0'}}
 {'execute': 'x-blockdev-change', 'arguments':{ 'parent': 'colo-disk0', 'node': 'replication0' } }
 
-{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-mirror', 'id': 'm0', 'props': { 'netdev': 'hn0', 'queue': 'tx', 'outdev': 'mirror0' } } }
-{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-redirector', 'id': 'redire0', 'props': { 'netdev': 'hn0', 'queue': 'rx', 'indev': 'compare_out' } } }
-{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-redirector', 'id': 'redire1', 'props': { 'netdev': 'hn0', 'queue': 'rx', 'outdev': 'compare0' } } }
+{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-mirror', 'id': 'm0', 'netdev': 'hn0', 'queue': 'tx', 'outdev': 'mirror0' } }
+{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-redirector', 'id': 'redire0', 'netdev': 'hn0', 'queue': 'rx', 'indev': 'compare_out' } }
+{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-redirector', 'id': 'redire1', 'netdev': 'hn0', 'queue': 'rx', 'outdev': 'compare0' } }
 {'execute': 'object-add', 'arguments':{ 'qom-type': 'iothread', 'id': 'iothread1' } }
-{'execute': 'object-add', 'arguments':{ 'qom-type': 'colo-compare', 'id': 'comp0', 'props': { 'primary_in': 'compare0-0', 'secondary_in': 'compare1', 'outdev': 'compare_out0', 'iothread': 'iothread1' } } }
+{'execute': 'object-add', 'arguments':{ 'qom-type': 'colo-compare', 'id': 'comp0', 'primary_in': 'compare0-0', 'secondary_in': 'compare1', 'outdev': 'compare_out0', 'iothread': 'iothread1' } }
 
 {'execute': 'migrate-set-capabilities', 'arguments':{ 'capabilities': [ {'capability': 'x-colo', 'state': true } ] } }
 {'execute': 'migrate', 'arguments':{ 'uri': 'tcp:127.0.0.2:9998' } }
@@ -318,11 +318,11 @@ Wait until disk is synced, then:
 {'execute': 'human-monitor-command', 'arguments':{ 'command-line': 'drive_add -n buddy driver=replication,mode=primary,file.driver=nbd,file.host=127.0.0.1,file.port=9999,file.export=parent0,node-name=replication0'}}
 {'execute': 'x-blockdev-change', 'arguments':{ 'parent': 'colo-disk0', 'node': 'replication0' } }
 
-{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-mirror', 'id': 'm0', 'props': { 'insert': 'before', 'position': 'id=rew0', 'netdev': 'hn0', 'queue': 'tx', 'outdev': 'mirror0' } } }
-{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-redirector', 'id': 'redire0', 'props': { 'insert': 'before', 'position': 'id=rew0', 'netdev': 'hn0', 'queue': 'rx', 'indev': 'compare_out' } } }
-{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-redirector', 'id': 'redire1', 'props': { 'insert': 'before', 'position': 'id=rew0', 'netdev': 'hn0', 'queue': 'rx', 'outdev': 'compare0' } } }
+{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-mirror', 'id': 'm0', 'insert': 'before', 'position': 'id=rew0', 'netdev': 'hn0', 'queue': 'tx', 'outdev': 'mirror0' } }
+{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-redirector', 'id': 'redire0', 'insert': 'before', 'position': 'id=rew0', 'netdev': 'hn0', 'queue': 'rx', 'indev': 'compare_out' } }
+{'execute': 'object-add', 'arguments':{ 'qom-type': 'filter-redirector', 'id': 'redire1', 'insert': 'before', 'position': 'id=rew0', 'netdev': 'hn0', 'queue': 'rx', 'outdev': 'compare0' } }
 {'execute': 'object-add', 'arguments':{ 'qom-type': 'iothread', 'id': 'iothread1' } }
-{'execute': 'object-add', 'arguments':{ 'qom-type': 'colo-compare', 'id': 'comp0', 'props': { 'primary_in': 'compare0-0', 'secondary_in': 'compare1', 'outdev': 'compare_out0', 'iothread': 'iothread1' } } }
+{'execute': 'object-add', 'arguments':{ 'qom-type': 'colo-compare', 'id': 'comp0', 'primary_in': 'compare0-0', 'secondary_in': 'compare1', 'outdev': 'compare_out0', 'iothread': 'iothread1' } }
 
 {'execute': 'migrate-set-capabilities', 'arguments':{ 'capabilities': [ {'capability': 'x-colo', 'state': true } ] } }
 {'execute': 'migrate', 'arguments':{ 'uri': 'tcp:127.0.0.1:9998' } }
diff --git a/docs/system/authz.rst b/docs/system/authz.rst
index 942af39602..55b7315e49 100644
--- a/docs/system/authz.rst
+++ b/docs/system/authz.rst
@@ -77,9 +77,7 @@ To create an instance of this driver via QMP:
      "arguments": {
        "qom-type": "authz-simple",
        "id": "authz0",
-       "props": {
-         "identity": "fred"
-       }
+       "identity": "fred"
      }
    }
 
@@ -110,15 +108,13 @@ To create an instance of this class via QMP:
      "arguments": {
        "qom-type": "authz-list",
        "id": "authz0",
-       "props": {
-         "rules": [
-            { "match": "fred", "policy": "allow", "format": "exact" },
-            { "match": "bob", "policy": "allow", "format": "exact" },
-            { "match": "danb", "policy": "deny", "format": "exact" },
-            { "match": "dan*", "policy": "allow", "format": "glob" }
-         ],
-         "policy": "deny"
-       }
+       "rules": [
+          { "match": "fred", "policy": "allow", "format": "exact" },
+          { "match": "bob", "policy": "allow", "format": "exact" },
+          { "match": "danb", "policy": "deny", "format": "exact" },
+          { "match": "dan*", "policy": "allow", "format": "glob" }
+       ],
+       "policy": "deny"
      }
    }
 
@@ -143,10 +139,8 @@ To create an instance of this class via QMP:
      "arguments": {
        "qom-type": "authz-list-file",
        "id": "authz0",
-       "props": {
-         "filename": "/etc/qemu/myvm-vnc.acl",
-         "refresh": true
-       }
+       "filename": "/etc/qemu/myvm-vnc.acl",
+       "refresh": true
      }
    }
 
diff --git a/docs/throttle.txt b/docs/throttle.txt
index b5b78b7326..0a0453a5ee 100644
--- a/docs/throttle.txt
+++ b/docs/throttle.txt
@@ -273,11 +273,9 @@ A group can be created using the object-add QMP function:
      "arguments": {
        "qom-type": "throttle-group",
        "id": "group0",
-       "props": {
-         "limits" : {
-           "iops-total": 1000
-           "bps-write": 2097152
-         }
+       "limits" : {
+         "iops-total": 1000,
+         "bps-write": 2097152
        }
      }
    }
diff --git a/docs/tools/qemu-nbd.rst b/docs/tools/qemu-nbd.rst
index 56e54cd441..726cd18960 100644
--- a/docs/tools/qemu-nbd.rst
+++ b/docs/tools/qemu-nbd.rst
@@ -31,7 +31,7 @@ driver options if ``--image-opts`` is specified.
 
 *dev* is an NBD device.
 
-.. option:: --object type,id=ID,...props...
+.. option:: --object type,id=ID,...
 
   Define a new instance of the *type* object class identified by *ID*.
   See the :manpage:`qemu(1)` manual page for full details of the properties
-- 
2.27.0


