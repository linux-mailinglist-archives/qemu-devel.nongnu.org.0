Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB7B345B6F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 10:55:41 +0100 (CET)
Received: from localhost ([::1]:39130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOdlE-0005sw-Dj
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 05:55:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOdWo-0001aH-L9
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 05:40:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOdWh-00021g-Aj
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 05:40:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616492438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VpH3CSe5hTdvbh/Z00eXxPVOzWan+Hz7qT2NqUxSZ8I=;
 b=di71hlrGd1N2N0lZTL33OZjuTWFf/UocH4zInU5nMleN6Zj1zU4rrSMz56DYnlnoANuuNP
 WsRPw+iNzrU+fX3Or+3AgMAwJ9CgVeGtnPN39jyn7JNp243Sdn6VaXBiLjt0+JcKQ5Hfb8
 gcmH+MVwx/mYCOhr0Q5aUIRBTADPbL4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-OEU6vs5DO5SywwEJUaecJQ-1; Tue, 23 Mar 2021 05:40:36 -0400
X-MC-Unique: OEU6vs5DO5SywwEJUaecJQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 950851084C83;
 Tue, 23 Mar 2021 09:40:35 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 468B17092D;
 Tue, 23 Mar 2021 09:40:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EEF8A11326A6; Tue, 23 Mar 2021 10:40:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 18/28] tests/qapi-schema: Rename returns-whitelist to
 returns-bad-type
Date: Tue, 23 Mar 2021 10:40:15 +0100
Message-Id: <20210323094025.3569441-19-armbru@redhat.com>
In-Reply-To: <20210323094025.3569441-1-armbru@redhat.com>
References: <20210323094025.3569441-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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
Cc: jsnow@redhat.com, michael.roth@amd.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This test covers returning "bad" types.  Pragma returns-whitelist is
just one aspect.  Naming it returns-whitelist is suboptimal.  Rename
to returns-bad-type.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/qapi-schema/meson.build                                   | 2 +-
 tests/qapi-schema/returns-bad-type.err                          | 2 ++
 .../{returns-whitelist.json => returns-bad-type.json}           | 0
 .../qapi-schema/{returns-whitelist.out => returns-bad-type.out} | 0
 tests/qapi-schema/returns-whitelist.err                         | 2 --
 5 files changed, 3 insertions(+), 3 deletions(-)
 create mode 100644 tests/qapi-schema/returns-bad-type.err
 rename tests/qapi-schema/{returns-whitelist.json => returns-bad-type.json} (100%)
 rename tests/qapi-schema/{returns-whitelist.out => returns-bad-type.out} (100%)
 delete mode 100644 tests/qapi-schema/returns-whitelist.err

diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index ffc276b765..4e7635f0a8 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -166,9 +166,9 @@ schemas = [
   'reserved-type-list.json',
   'returns-alternate.json',
   'returns-array-bad.json',
+  'returns-bad-type.json',
   'returns-dict.json',
   'returns-unknown.json',
-  'returns-whitelist.json',
   'string-code-point-31.json',
   'string-code-point-127.json',
   'struct-base-clash-deep.json',
diff --git a/tests/qapi-schema/returns-bad-type.err b/tests/qapi-schema/returns-bad-type.err
new file mode 100644
index 0000000000..2c270de9ad
--- /dev/null
+++ b/tests/qapi-schema/returns-bad-type.err
@@ -0,0 +1,2 @@
+returns-bad-type.json: In command 'no-way-this-will-get-whitelisted':
+returns-bad-type.json:14: command's 'returns' cannot take array type ['int']
diff --git a/tests/qapi-schema/returns-whitelist.json b/tests/qapi-schema/returns-bad-type.json
similarity index 100%
rename from tests/qapi-schema/returns-whitelist.json
rename to tests/qapi-schema/returns-bad-type.json
diff --git a/tests/qapi-schema/returns-whitelist.out b/tests/qapi-schema/returns-bad-type.out
similarity index 100%
rename from tests/qapi-schema/returns-whitelist.out
rename to tests/qapi-schema/returns-bad-type.out
diff --git a/tests/qapi-schema/returns-whitelist.err b/tests/qapi-schema/returns-whitelist.err
deleted file mode 100644
index c6e46b9b86..0000000000
--- a/tests/qapi-schema/returns-whitelist.err
+++ /dev/null
@@ -1,2 +0,0 @@
-returns-whitelist.json: In command 'no-way-this-will-get-whitelisted':
-returns-whitelist.json:14: command's 'returns' cannot take array type ['int']
-- 
2.26.3


