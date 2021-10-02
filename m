Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1132441FAC0
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 12:02:27 +0200 (CEST)
Received: from localhost ([::1]:42628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWbqc-00019Y-4C
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 06:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mWblR-00016F-5z
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 05:57:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mWblN-0004K5-20
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 05:57:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633168619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aF6oJ+cMuBEvm2wLYFiGdSjkyr9ogvEyg+a4WCN7LGg=;
 b=E7c5ncZA3yoTNFkgccDKY+fszMDwJWIzMdev1BcKQ+J0+85tZ6PE5AqV8gA8Lq4qXiKmxU
 RugHOcX+RsmGQkYbym2SCm6jKvylLI5izBtkBiMursuWXNCZJVSsOtZ4ufe19cWiJAuzMD
 dCK+2ao7fIWOiIhyqhZBxtiJ5sv00L4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-NjZZQVi7OjecNiEnpOdA1Q-1; Sat, 02 Oct 2021 05:56:58 -0400
X-MC-Unique: NjZZQVi7OjecNiEnpOdA1Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05BB61808312;
 Sat,  2 Oct 2021 09:56:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CCCA110016F4;
 Sat,  2 Oct 2021 09:56:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 796B31138526; Sat,  2 Oct 2021 11:56:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/13] qapi: Add spaces after symbol declaration for consistency
Date: Sat,  2 Oct 2021 11:56:46 +0200
Message-Id: <20211002095655.1944970-5-armbru@redhat.com>
In-Reply-To: <20211002095655.1944970-1-armbru@redhat.com>
References: <20211002095655.1944970-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Several QGA definitions omit a blank line after the symbol
declaration. This works OK currently, but it's the only place where we
do this. Adjust it for consistency.

Future commits may wind up enforcing this formatting.

Signed-off-by: John Snow <jsnow@redhat.com>

Message-Id: <20210930205716.1148693-5-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/block-core.json            | 1 +
 qga/qapi-schema.json            | 3 +++
 tests/qapi-schema/doc-good.json | 8 ++++++++
 3 files changed, 12 insertions(+)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 623a4f4a3f..6d3217abb6 100644
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
index c60f5e669d..94e4aacdcc 100644
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
index a20acffd8b..86dc25d2bd 100644
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


