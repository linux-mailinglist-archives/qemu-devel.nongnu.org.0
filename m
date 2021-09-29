Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6112141CCF0
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 21:53:48 +0200 (CEST)
Received: from localhost ([::1]:37030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVfeF-0004Hw-8z
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 15:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mVfWE-0007eL-9l
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 15:45:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mVfWB-0006TF-Cl
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 15:45:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632944726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0KCb6iNGYUzpcG61oVv8RDctCBUpQc4Md8uKwiAchp0=;
 b=KfJ2CCpmISRUP72I9orBEmEqri4JZq2NTiktNXS1KLzYvBtcf2tM1ND+fsjsTIdV1L/Ubz
 acz7ogUSJU/73TwXXH5nVx+Cnnlmdj/wUQB/plyLiMIxxx60BmO9Q/tN0FvyMSbQQ4kURY
 szJigzxhK8OOM93T5wmbNSv65JKoBrI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-knD0WzDpMxGRnaWI8IH7WQ-1; Wed, 29 Sep 2021 15:45:24 -0400
X-MC-Unique: knD0WzDpMxGRnaWI8IH7WQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 962CF8B0695;
 Wed, 29 Sep 2021 19:45:08 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7A9227067;
 Wed, 29 Sep 2021 19:45:06 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/13] qapi: Add spaces after symbol declaration for
 consistency
Date: Wed, 29 Sep 2021 15:44:19 -0400
Message-Id: <20210929194428.1038496-5-jsnow@redhat.com>
In-Reply-To: <20210929194428.1038496-1-jsnow@redhat.com>
References: <20210929194428.1038496-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Several QGA definitions omit a blank line after the symbol
declaration. This works OK currently, but it's the only place where we
do this. Adjust it for consistency.

Future commits may wind up enforcing this formatting.

Signed-off-by: John Snow <jsnow@redhat.com>

---

This isn't strictly necessary and I don't actually get around to
enforcing it in this series, but I figured I'd share it with the list
anyway. We can just drop this patch but I wanted to see your thoughts.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 qapi/block-core.json            | 1 +
 qga/qapi-schema.json            | 3 +++
 tests/qapi-schema/doc-good.json | 8 ++++++++
 3 files changed, 12 insertions(+)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 4114f8b6fc3..52a6dae9522 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -3132,6 +3132,7 @@
 
 ##
 # @BlockdevQcow2EncryptionFormat:
+#
 # @aes: AES-CBC with plain64 initialization vectors
 #
 # Since: 2.10
diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index c60f5e669d7..94e4aacdcc6 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -1140,6 +1140,7 @@
 
 ##
 # @GuestExec:
+#
 # @pid: pid of child process in guest OS
 #
 # Since: 2.5
@@ -1171,6 +1172,7 @@
 
 ##
 # @GuestHostName:
+#
 # @host-name: Fully qualified domain name of the guest OS
 #
 # Since: 2.10
@@ -1197,6 +1199,7 @@
 
 ##
 # @GuestUser:
+#
 # @user: Username
 # @domain: Logon domain (windows only)
 # @login-time: Time of login of this user on the computer. If multiple
diff --git a/tests/qapi-schema/doc-good.json b/tests/qapi-schema/doc-good.json
index a20acffd8b9..86dc25d2bd8 100644
--- a/tests/qapi-schema/doc-good.json
+++ b/tests/qapi-schema/doc-good.json
@@ -53,6 +53,7 @@
 
 ##
 # @Enum:
+#
 # @one: The _one_ {and only}
 #
 # Features:
@@ -67,6 +68,7 @@
 
 ##
 # @Base:
+#
 # @base1:
 # the first member
 ##
@@ -75,6 +77,7 @@
 
 ##
 # @Variant1:
+#
 # A paragraph
 #
 # Another paragraph (but no @var: line)
@@ -91,11 +94,13 @@
 
 ##
 # @Variant2:
+#
 ##
 { 'struct': 'Variant2', 'data': {} }
 
 ##
 # @Object:
+#
 # Features:
 # @union-feat1: a feature
 ##
@@ -109,6 +114,7 @@
 
 ##
 # @Alternate:
+#
 # @i: an integer
 #     @b is undocumented
 #
@@ -126,6 +132,7 @@
 
 ##
 # @cmd:
+#
 # @arg1: the first argument
 #
 # @arg2: the second
@@ -175,6 +182,7 @@
 
 ##
 # @EVT_BOXED:
+#
 # Features:
 # @feat3: a feature
 ##
-- 
2.31.1


