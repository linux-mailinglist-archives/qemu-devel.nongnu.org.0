Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFE1346BCC
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 23:11:27 +0100 (CET)
Received: from localhost ([::1]:35954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOpFG-0007D8-HX
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 18:11:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOp1X-00073r-59
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:57:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOp1P-0002md-Em
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:57:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616536626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=owElM5L4n18qKa0mu/5QrYM624ElKwa6DpjKZ3UKHx8=;
 b=cwk2XDG1XrKwecFXCB6lcJnnY0UDscRl22DHCftmFFbQIuMr3TtBtGvyEUo6y+TAGVgU3V
 uk/ByQHZk5uM6bRWUkZuLxf8/FuYJybFdDRzdHFItfy6aNACUwwDy6g+rzFcBSLaJdi+tq
 r88OKkHX4VXeYv9+ePgM07DmQj3lss8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-3eQ-AZVtOnO1EranUwOMWQ-1; Tue, 23 Mar 2021 17:57:04 -0400
X-MC-Unique: 3eQ-AZVtOnO1EranUwOMWQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67CB41B2C984;
 Tue, 23 Mar 2021 21:57:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 316141F07C;
 Tue, 23 Mar 2021 21:57:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B3B1811326A2; Tue, 23 Mar 2021 22:56:58 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/29] tests/qapi-schema: Rename redefined-builtin to
 redefined-predefined
Date: Tue, 23 Mar 2021 22:56:44 +0100
Message-Id: <20210323215658.3840228-16-armbru@redhat.com>
In-Reply-To: <20210323215658.3840228-1-armbru@redhat.com>
References: <20210323215658.3840228-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The previous commit changed this test to clash with a predefined enum
type, not a built-in type.  Adjust its name.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210323094025.3569441-16-armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/qapi-schema/meson.build                                   | 2 +-
 tests/qapi-schema/redefined-builtin.err                         | 2 --
 tests/qapi-schema/redefined-predefined.err                      | 2 ++
 .../{redefined-builtin.json => redefined-predefined.json}       | 0
 .../{redefined-builtin.out => redefined-predefined.out}         | 0
 5 files changed, 3 insertions(+), 3 deletions(-)
 delete mode 100644 tests/qapi-schema/redefined-builtin.err
 create mode 100644 tests/qapi-schema/redefined-predefined.err
 rename tests/qapi-schema/{redefined-builtin.json => redefined-predefined.json} (100%)
 rename tests/qapi-schema/{redefined-builtin.out => redefined-predefined.out} (100%)

diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index ba11cb76ac..664f9ee22d 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -152,9 +152,9 @@ schemas = [
   'pragma-returns-whitelist-crap.json',
   'qapi-schema-test.json',
   'quoted-structural-chars.json',
-  'redefined-builtin.json',
   'redefined-command.json',
   'redefined-event.json',
+  'redefined-predefined.json',
   'redefined-type.json',
   'reserved-command-q.json',
   'reserved-enum-q.json',
diff --git a/tests/qapi-schema/redefined-builtin.err b/tests/qapi-schema/redefined-builtin.err
deleted file mode 100644
index 92bc62dc76..0000000000
--- a/tests/qapi-schema/redefined-builtin.err
+++ /dev/null
@@ -1,2 +0,0 @@
-redefined-builtin.json: In struct 'QType':
-redefined-builtin.json:2: enum type 'QType' is already defined
diff --git a/tests/qapi-schema/redefined-predefined.err b/tests/qapi-schema/redefined-predefined.err
new file mode 100644
index 0000000000..2924dde60b
--- /dev/null
+++ b/tests/qapi-schema/redefined-predefined.err
@@ -0,0 +1,2 @@
+redefined-predefined.json: In struct 'QType':
+redefined-predefined.json:2: enum type 'QType' is already defined
diff --git a/tests/qapi-schema/redefined-builtin.json b/tests/qapi-schema/redefined-predefined.json
similarity index 100%
rename from tests/qapi-schema/redefined-builtin.json
rename to tests/qapi-schema/redefined-predefined.json
diff --git a/tests/qapi-schema/redefined-builtin.out b/tests/qapi-schema/redefined-predefined.out
similarity index 100%
rename from tests/qapi-schema/redefined-builtin.out
rename to tests/qapi-schema/redefined-predefined.out
-- 
2.26.3


