Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 439D7345B1E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 10:42:11 +0100 (CET)
Received: from localhost ([::1]:51896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOdYA-0002zL-8r
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 05:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOdWg-0001Ij-Td
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 05:40:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOdWc-0001xY-Du
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 05:40:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616492433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qqmPxw3ew/u08uHBvkR7G/2Srchm1m3YkAlcR/HkwaQ=;
 b=BmxUB7Y7J+NZdDrxArRzxtGLDuqtY2MquwFonI0d9/iFzX9ejbqhvrxvanSpicUiZYe0Kv
 Q+EKRPTFN7hUXnQ3nsDXavlozx7JHHm2YhodaD090Ipt3i71aSVm3uT3eb03zvXXAueYko
 o4v0N93bhOuMRA3aKA2SBf+HSgvt9ts=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-sQMVSOM9O3iLzWtZexNXzQ-1; Tue, 23 Mar 2021 05:40:31 -0400
X-MC-Unique: sQMVSOM9O3iLzWtZexNXzQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAF5387A83B;
 Tue, 23 Mar 2021 09:40:30 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 302FC1992D;
 Tue, 23 Mar 2021 09:40:27 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B0EA01132710; Tue, 23 Mar 2021 10:40:25 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/28] tests/qapi-schema: Rework comments on longhand member
 definitions
Date: Tue, 23 Mar 2021 10:40:00 +0100
Message-Id: <20210323094025.3569441-4-armbru@redhat.com>
In-Reply-To: <20210323094025.3569441-1-armbru@redhat.com>
References: <20210323094025.3569441-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

A few old comments talk about "desired future use of defaults" and
"anonymous inline branch types".  Kind of misleading since commit
87adbbffd4 "qapi: add a dictionary form for TYPE" added longhand
member definitions.  Talk about that instead.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/qapi-schema/event-member-invalid-dict.err        | 2 +-
 tests/qapi-schema/event-member-invalid-dict.json       | 2 ++
 tests/qapi-schema/flat-union-inline-invalid-dict.json  | 4 ++--
 tests/qapi-schema/nested-struct-data-invalid-dict.err  | 2 +-
 tests/qapi-schema/nested-struct-data-invalid-dict.json | 3 ++-
 tests/qapi-schema/nested-struct-data.json              | 2 +-
 tests/qapi-schema/struct-member-invalid-dict.err       | 2 +-
 tests/qapi-schema/struct-member-invalid-dict.json      | 3 ++-
 8 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/tests/qapi-schema/event-member-invalid-dict.err b/tests/qapi-schema/event-member-invalid-dict.err
index c7a6a24305..82f8989344 100644
--- a/tests/qapi-schema/event-member-invalid-dict.err
+++ b/tests/qapi-schema/event-member-invalid-dict.err
@@ -1,2 +1,2 @@
 event-member-invalid-dict.json: In event 'EVENT_A':
-event-member-invalid-dict.json:1: 'data' member 'a' misses key 'type'
+event-member-invalid-dict.json:3: 'data' member 'a' misses key 'type'
diff --git a/tests/qapi-schema/event-member-invalid-dict.json b/tests/qapi-schema/event-member-invalid-dict.json
index ee6f3ecb6f..e58560abca 100644
--- a/tests/qapi-schema/event-member-invalid-dict.json
+++ b/tests/qapi-schema/event-member-invalid-dict.json
@@ -1,2 +1,4 @@
+# event 'data' member with dict value is (longhand) argument
+# definition, not inline complex type
 { 'event': 'EVENT_A',
   'data': { 'a' : { 'string' : 'str', 'integer': 'int' }, 'b' : 'str' } }
diff --git a/tests/qapi-schema/flat-union-inline-invalid-dict.json b/tests/qapi-schema/flat-union-inline-invalid-dict.json
index 62c7cda617..1779712795 100644
--- a/tests/qapi-schema/flat-union-inline-invalid-dict.json
+++ b/tests/qapi-schema/flat-union-inline-invalid-dict.json
@@ -1,5 +1,5 @@
-# we require branches to be a struct name
-# TODO: should we allow anonymous inline branch types?
+# union 'data' member with dict value is (longhand) branch
+# definition, not inline complex type
 { 'enum': 'TestEnum',
   'data': [ 'value1', 'value2' ] }
 { 'struct': 'Base',
diff --git a/tests/qapi-schema/nested-struct-data-invalid-dict.err b/tests/qapi-schema/nested-struct-data-invalid-dict.err
index c044b2b17a..375e155fe6 100644
--- a/tests/qapi-schema/nested-struct-data-invalid-dict.err
+++ b/tests/qapi-schema/nested-struct-data-invalid-dict.err
@@ -1,2 +1,2 @@
 nested-struct-data-invalid-dict.json: In command 'foo':
-nested-struct-data-invalid-dict.json:2: 'data' member 'a' misses key 'type'
+nested-struct-data-invalid-dict.json:3: 'data' member 'a' misses key 'type'
diff --git a/tests/qapi-schema/nested-struct-data-invalid-dict.json b/tests/qapi-schema/nested-struct-data-invalid-dict.json
index efbe773ded..aa37b85e19 100644
--- a/tests/qapi-schema/nested-struct-data-invalid-dict.json
+++ b/tests/qapi-schema/nested-struct-data-invalid-dict.json
@@ -1,3 +1,4 @@
-# inline subtypes collide with our desired future use of defaults
+# command 'data' member with dict value is (longhand) argument
+# definition, not inline complex type
 { 'command': 'foo',
   'data': { 'a' : { 'string' : 'str', 'integer': 'int' }, 'b' : 'str' } }
diff --git a/tests/qapi-schema/nested-struct-data.json b/tests/qapi-schema/nested-struct-data.json
index 5b8a40cca3..2980d45d05 100644
--- a/tests/qapi-schema/nested-struct-data.json
+++ b/tests/qapi-schema/nested-struct-data.json
@@ -1,3 +1,3 @@
-# inline subtypes collide with our desired future use of defaults
+# {} is not a valid type reference
 { 'command': 'foo',
   'data': { 'a' : { 'type': {} }, 'b' : 'str' } }
diff --git a/tests/qapi-schema/struct-member-invalid-dict.err b/tests/qapi-schema/struct-member-invalid-dict.err
index 0621aecfbd..f9b3f33551 100644
--- a/tests/qapi-schema/struct-member-invalid-dict.err
+++ b/tests/qapi-schema/struct-member-invalid-dict.err
@@ -1,2 +1,2 @@
 struct-member-invalid-dict.json: In struct 'foo':
-struct-member-invalid-dict.json:2: 'data' member '*a' misses key 'type'
+struct-member-invalid-dict.json:3: 'data' member '*a' misses key 'type'
diff --git a/tests/qapi-schema/struct-member-invalid-dict.json b/tests/qapi-schema/struct-member-invalid-dict.json
index 9fe0d455a9..bc3d62ae63 100644
--- a/tests/qapi-schema/struct-member-invalid-dict.json
+++ b/tests/qapi-schema/struct-member-invalid-dict.json
@@ -1,3 +1,4 @@
-# Long form of member must have a value member 'type'
+# struct 'data' member with dict value is (longhand) member
+# definition, not inline complex type
 { 'struct': 'foo',
   'data': { '*a': { 'case': 'foo' } } }
-- 
2.26.3


