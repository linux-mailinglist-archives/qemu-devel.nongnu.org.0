Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B83345B20
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 10:42:15 +0100 (CET)
Received: from localhost ([::1]:52254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOdYE-00038m-TZ
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 05:42:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOdWj-0001Nl-H7
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 05:40:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOdWc-0001xN-Dq
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 05:40:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616492432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LFib9nyUubVAfH7Qplb0Vbbyu4e5jLQmNG4KU0TMN2M=;
 b=SzEeDcKkZ5iYM1SANFqAYwYWrSEqqVi6ixGUjHL1AXyb+D8xRsJ/9viMf1p8Yr2qw0BGW+
 nlTzB2Om4ae32dse5Zt0soG6QYVPijP8h2sep4Fwo1KaPRR7OFzlMu6MBA7grFPx8pHFz8
 HXA8OmWfvTJinB7kfhF1exySzaTLIPo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-HzmtHXplOrGe6yg1A3NaDA-1; Tue, 23 Mar 2021 05:40:30 -0400
X-MC-Unique: HzmtHXplOrGe6yg1A3NaDA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDE481084C95;
 Tue, 23 Mar 2021 09:40:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FAA163622;
 Tue, 23 Mar 2021 09:40:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B42551132712; Tue, 23 Mar 2021 10:40:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/28] tests/qapi-schema: Belatedly update comment on
 alternate clash
Date: Tue, 23 Mar 2021 10:40:01 +0100
Message-Id: <20210323094025.3569441-5-armbru@redhat.com>
In-Reply-To: <20210323094025.3569441-1-armbru@redhat.com>
References: <20210323094025.3569441-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

Commit 0426d53c65 "qapi: Simplify visiting of alternate types"
eliminated the implicit alternate enum, but neglected to update a
comment about it in a test.  Do that now.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/qapi-schema/alternate-clash.err  | 2 +-
 tests/qapi-schema/alternate-clash.json | 5 +----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/tests/qapi-schema/alternate-clash.err b/tests/qapi-schema/alternate-clash.err
index f58b977f7b..0fe02f2c99 100644
--- a/tests/qapi-schema/alternate-clash.err
+++ b/tests/qapi-schema/alternate-clash.err
@@ -1,2 +1,2 @@
 alternate-clash.json: In alternate 'Alt1':
-alternate-clash.json:7: branch 'a_b' collides with branch 'a-b'
+alternate-clash.json:4: branch 'a_b' collides with branch 'a-b'
diff --git a/tests/qapi-schema/alternate-clash.json b/tests/qapi-schema/alternate-clash.json
index 9a59b88ced..039c4be658 100644
--- a/tests/qapi-schema/alternate-clash.json
+++ b/tests/qapi-schema/alternate-clash.json
@@ -1,8 +1,5 @@
 # Alternate branch name collision
 # Reject an alternate that would result in a collision in generated C
-# names (this would try to generate two enum values 'ALT1_KIND_A_B').
-# TODO: In the future, if alternates are simplified to not generate
-# the implicit Alt1Kind enum, we would still have a collision with the
-# resulting C union trying to have two members named 'a_b'.
+# names (this would try to generate two union members named 'a_b').
 { 'alternate': 'Alt1',
   'data': { 'a-b': 'bool', 'a_b': 'int' } }
-- 
2.26.3


