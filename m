Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9533EA866
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 18:17:30 +0200 (CEST)
Received: from localhost ([::1]:53268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEDOb-0005M7-K8
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 12:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mEDJE-0005Qm-QL
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 12:11:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mEDJB-0001RI-4E
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 12:11:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628784712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9WKM20IX1xMFA/pfUweQC5saQedSBmHf8PhfJLbpdYk=;
 b=Z0E3FkVng1UiOrEoReVD5HGZGgy0jre+giu0Pbw1UnLArTR2Amx8uJlu/HW/nvcO5PdQdT
 7koRlCkvwZQhyW37M3eJSShnsfv7QYHJ3Yiv01e7YCk5M0DaX4a+y2rDDL0+wDxPMEZ+Wq
 Vh0rxCzEpHEYY0Ajp3ujoc4KAmVtetM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-C5mr1ltzPgayVHHajVA9hg-1; Thu, 12 Aug 2021 12:11:47 -0400
X-MC-Unique: C5mr1ltzPgayVHHajVA9hg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9466A1012D97
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 16:11:46 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78568171FF;
 Thu, 12 Aug 2021 16:11:45 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/6] tests/qapi-schema: Test cases for aliases
Date: Thu, 12 Aug 2021 18:11:31 +0200
Message-Id: <20210812161131.92017-7-kwolf@redhat.com>
In-Reply-To: <20210812161131.92017-1-kwolf@redhat.com>
References: <20210812161131.92017-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Cc: kwolf@redhat.com, jsnow@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/unit/test-qobject-input-visitor.c       | 218 ++++++++++++++++++
 tests/qapi-schema/alias-bad-type.err          |   2 +
 tests/qapi-schema/alias-bad-type.json         |   3 +
 tests/qapi-schema/alias-bad-type.out          |   0
 tests/qapi-schema/alias-missing-source.err    |   2 +
 tests/qapi-schema/alias-missing-source.json   |   3 +
 tests/qapi-schema/alias-missing-source.out    |   0
 tests/qapi-schema/alias-name-bad-type.err     |   2 +
 tests/qapi-schema/alias-name-bad-type.json    |   3 +
 tests/qapi-schema/alias-name-bad-type.out     |   0
 tests/qapi-schema/alias-name-conflict.err     |   2 +
 tests/qapi-schema/alias-name-conflict.json    |   4 +
 tests/qapi-schema/alias-name-conflict.out     |   0
 tests/qapi-schema/alias-recursive.err         |   2 +
 tests/qapi-schema/alias-recursive.json        |   4 +
 tests/qapi-schema/alias-recursive.out         |   0
 tests/qapi-schema/alias-source-bad-type.err   |   2 +
 tests/qapi-schema/alias-source-bad-type.json  |   3 +
 tests/qapi-schema/alias-source-bad-type.out   |   0
 .../alias-source-elem-bad-type.err            |   2 +
 .../alias-source-elem-bad-type.json           |   3 +
 .../alias-source-elem-bad-type.out            |   0
 tests/qapi-schema/alias-source-empty.err      |   2 +
 tests/qapi-schema/alias-source-empty.json     |   3 +
 tests/qapi-schema/alias-source-empty.out      |   0
 .../alias-source-inexistent-variants.err      |   2 +
 .../alias-source-inexistent-variants.json     |  12 +
 .../alias-source-inexistent-variants.out      |   0
 tests/qapi-schema/alias-source-inexistent.err |   2 +
 .../qapi-schema/alias-source-inexistent.json  |   3 +
 tests/qapi-schema/alias-source-inexistent.out |   0
 .../alias-source-non-object-path.err          |   2 +
 .../alias-source-non-object-path.json         |   3 +
 .../alias-source-non-object-path.out          |   0
 .../alias-source-non-object-wildcard.err      |   2 +
 .../alias-source-non-object-wildcard.json     |   3 +
 .../alias-source-non-object-wildcard.out      |   0
 ...lias-source-optional-wildcard-indirect.err |   2 +
 ...ias-source-optional-wildcard-indirect.json |   6 +
 ...lias-source-optional-wildcard-indirect.out |   0
 .../alias-source-optional-wildcard.err        |   2 +
 .../alias-source-optional-wildcard.json       |   5 +
 .../alias-source-optional-wildcard.out        |   0
 tests/qapi-schema/alias-unknown-key.err       |   3 +
 tests/qapi-schema/alias-unknown-key.json      |   3 +
 tests/qapi-schema/alias-unknown-key.out       |   0
 tests/qapi-schema/aliases-bad-type.err        |   2 +
 tests/qapi-schema/aliases-bad-type.json       |   3 +
 tests/qapi-schema/aliases-bad-type.out        |   0
 tests/qapi-schema/meson.build                 |  16 ++
 tests/qapi-schema/qapi-schema-test.json       |  26 +++
 tests/qapi-schema/qapi-schema-test.out        |  31 +++
 52 files changed, 388 insertions(+)
 create mode 100644 tests/qapi-schema/alias-bad-type.err
 create mode 100644 tests/qapi-schema/alias-bad-type.json
 create mode 100644 tests/qapi-schema/alias-bad-type.out
 create mode 100644 tests/qapi-schema/alias-missing-source.err
 create mode 100644 tests/qapi-schema/alias-missing-source.json
 create mode 100644 tests/qapi-schema/alias-missing-source.out
 create mode 100644 tests/qapi-schema/alias-name-bad-type.err
 create mode 100644 tests/qapi-schema/alias-name-bad-type.json
 create mode 100644 tests/qapi-schema/alias-name-bad-type.out
 create mode 100644 tests/qapi-schema/alias-name-conflict.err
 create mode 100644 tests/qapi-schema/alias-name-conflict.json
 create mode 100644 tests/qapi-schema/alias-name-conflict.out
 create mode 100644 tests/qapi-schema/alias-recursive.err
 create mode 100644 tests/qapi-schema/alias-recursive.json
 create mode 100644 tests/qapi-schema/alias-recursive.out
 create mode 100644 tests/qapi-schema/alias-source-bad-type.err
 create mode 100644 tests/qapi-schema/alias-source-bad-type.json
 create mode 100644 tests/qapi-schema/alias-source-bad-type.out
 create mode 100644 tests/qapi-schema/alias-source-elem-bad-type.err
 create mode 100644 tests/qapi-schema/alias-source-elem-bad-type.json
 create mode 100644 tests/qapi-schema/alias-source-elem-bad-type.out
 create mode 100644 tests/qapi-schema/alias-source-empty.err
 create mode 100644 tests/qapi-schema/alias-source-empty.json
 create mode 100644 tests/qapi-schema/alias-source-empty.out
 create mode 100644 tests/qapi-schema/alias-source-inexistent-variants.err
 create mode 100644 tests/qapi-schema/alias-source-inexistent-variants.json
 create mode 100644 tests/qapi-schema/alias-source-inexistent-variants.out
 create mode 100644 tests/qapi-schema/alias-source-inexistent.err
 create mode 100644 tests/qapi-schema/alias-source-inexistent.json
 create mode 100644 tests/qapi-schema/alias-source-inexistent.out
 create mode 100644 tests/qapi-schema/alias-source-non-object-path.err
 create mode 100644 tests/qapi-schema/alias-source-non-object-path.json
 create mode 100644 tests/qapi-schema/alias-source-non-object-path.out
 create mode 100644 tests/qapi-schema/alias-source-non-object-wildcard.err
 create mode 100644 tests/qapi-schema/alias-source-non-object-wildcard.json
 create mode 100644 tests/qapi-schema/alias-source-non-object-wildcard.out
 create mode 100644 tests/qapi-schema/alias-source-optional-wildcard-indirect.err
 create mode 100644 tests/qapi-schema/alias-source-optional-wildcard-indirect.json
 create mode 100644 tests/qapi-schema/alias-source-optional-wildcard-indirect.out
 create mode 100644 tests/qapi-schema/alias-source-optional-wildcard.err
 create mode 100644 tests/qapi-schema/alias-source-optional-wildcard.json
 create mode 100644 tests/qapi-schema/alias-source-optional-wildcard.out
 create mode 100644 tests/qapi-schema/alias-unknown-key.err
 create mode 100644 tests/qapi-schema/alias-unknown-key.json
 create mode 100644 tests/qapi-schema/alias-unknown-key.out
 create mode 100644 tests/qapi-schema/aliases-bad-type.err
 create mode 100644 tests/qapi-schema/aliases-bad-type.json
 create mode 100644 tests/qapi-schema/aliases-bad-type.out

diff --git a/tests/unit/test-qobject-input-visitor.c b/tests/unit/test-qobject-input-visitor.c
index e41b91a2a6..f2891b6f5d 100644
--- a/tests/unit/test-qobject-input-visitor.c
+++ b/tests/unit/test-qobject-input-visitor.c
@@ -952,6 +952,214 @@ static void test_visitor_in_list_union_number(TestInputVisitorData *data,
     g_string_free(gstr_list, true);
 }
 
+static void test_visitor_in_alias_struct_local(TestInputVisitorData *data,
+                                               const void *unused)
+{
+    AliasStruct1 *tmp = NULL;
+    Error *err = NULL;
+    Visitor *v;
+
+    /* Can still specify the real member name with alias support */
+    v = visitor_input_test_init(data, "{ 'foo': 42 }");
+    visit_type_AliasStruct1(v, NULL, &tmp, &error_abort);
+    g_assert_cmpint(tmp->foo, ==, 42);
+    qapi_free_AliasStruct1(tmp);
+
+    /* The alias is a working alternative */
+    v = visitor_input_test_init(data, "{ 'bar': 42 }");
+    visit_type_AliasStruct1(v, NULL, &tmp, &error_abort);
+    g_assert_cmpint(tmp->foo, ==, 42);
+    qapi_free_AliasStruct1(tmp);
+
+    /* But you can't use both at the same time */
+    v = visitor_input_test_init(data, "{ 'foo': 5, 'bar': 42 }");
+    visit_type_AliasStruct1(v, NULL, &tmp, &err);
+    error_free_or_abort(&err);
+}
+
+static void test_visitor_in_alias_struct_nested(TestInputVisitorData *data,
+                                                const void *unused)
+{
+    AliasStruct2 *tmp = NULL;
+    Error *err = NULL;
+    Visitor *v;
+
+    /* Can still specify the real member names with alias support */
+    v = visitor_input_test_init(data, "{ 'nested': { 'foo': 42 } }");
+    visit_type_AliasStruct2(v, NULL, &tmp, &error_abort);
+    g_assert_cmpint(tmp->nested->foo, ==, 42);
+    qapi_free_AliasStruct2(tmp);
+
+    /* The inner alias is a working alternative */
+    v = visitor_input_test_init(data, "{ 'nested': { 'bar': 42 } }");
+    visit_type_AliasStruct2(v, NULL, &tmp, &error_abort);
+    g_assert_cmpint(tmp->nested->foo, ==, 42);
+    qapi_free_AliasStruct2(tmp);
+
+    /* So is the outer alias */
+    v = visitor_input_test_init(data, "{ 'bar': 42 }");
+    visit_type_AliasStruct2(v, NULL, &tmp, &error_abort);
+    g_assert_cmpint(tmp->nested->foo, ==, 42);
+    qapi_free_AliasStruct2(tmp);
+
+    /* You can't use more than one option at the same time */
+    v = visitor_input_test_init(data, "{ 'bar': 5, 'nested': { 'foo': 42 } }");
+    visit_type_AliasStruct2(v, NULL, &tmp, &err);
+    error_free_or_abort(&err);
+
+    v = visitor_input_test_init(data, "{ 'bar': 5, 'nested': { 'bar': 42 } }");
+    visit_type_AliasStruct2(v, NULL, &tmp, &err);
+    error_free_or_abort(&err);
+
+    v = visitor_input_test_init(data, "{ 'nested': { 'foo': 42, 'bar': 42 } }");
+    visit_type_AliasStruct2(v, NULL, &tmp, &err);
+    error_free_or_abort(&err);
+
+    v = visitor_input_test_init(data, "{ 'bar': 5, "
+                                      "  'nested': { 'foo': 42, 'bar': 42 } }");
+    visit_type_AliasStruct2(v, NULL, &tmp, &err);
+    error_free_or_abort(&err);
+}
+
+static void test_visitor_in_alias_wildcard(TestInputVisitorData *data,
+                                           const void *unused)
+{
+    AliasStruct3 *tmp = NULL;
+    Error *err = NULL;
+    Visitor *v;
+
+    /* Can still specify the real member names with alias support */
+    v = visitor_input_test_init(data, "{ 'nested': { 'foo': 42 } }");
+    visit_type_AliasStruct3(v, NULL, &tmp, &error_abort);
+    g_assert_cmpint(tmp->nested->foo, ==, 42);
+    qapi_free_AliasStruct3(tmp);
+
+    /* The wildcard alias makes it work on the top level */
+    v = visitor_input_test_init(data, "{ 'foo': 42 }");
+    visit_type_AliasStruct3(v, NULL, &tmp, &error_abort);
+    g_assert_cmpint(tmp->nested->foo, ==, 42);
+    qapi_free_AliasStruct3(tmp);
+
+    /* It makes the inner alias available, too */
+    v = visitor_input_test_init(data, "{ 'bar': 42 }");
+    visit_type_AliasStruct3(v, NULL, &tmp, &error_abort);
+    g_assert_cmpint(tmp->nested->foo, ==, 42);
+    qapi_free_AliasStruct3(tmp);
+
+    /* You can't use more than one option at the same time */
+    v = visitor_input_test_init(data, "{ 'foo': 42, 'nested': { 'foo': 42 } }");
+    visit_type_AliasStruct3(v, NULL, &tmp, &err);
+    error_free_or_abort(&err);
+
+    v = visitor_input_test_init(data, "{ 'bar': 42, 'nested': { 'foo': 42 } }");
+    visit_type_AliasStruct3(v, NULL, &tmp, &err);
+    error_free_or_abort(&err);
+
+    v = visitor_input_test_init(data, "{ 'foo': 42, 'nested': { 'bar': 42 } }");
+    visit_type_AliasStruct3(v, NULL, &tmp, &err);
+    error_free_or_abort(&err);
+
+    v = visitor_input_test_init(data, "{ 'bar': 42, 'nested': { 'bar': 42 } }");
+    visit_type_AliasStruct3(v, NULL, &tmp, &err);
+    error_free_or_abort(&err);
+
+    v = visitor_input_test_init(data, "{ 'foo': 42, 'bar': 42 }");
+    visit_type_AliasStruct3(v, NULL, &tmp, &err);
+    error_free_or_abort(&err);
+}
+
+static void test_visitor_in_alias_flat_union(TestInputVisitorData *data,
+                                             const void *unused)
+{
+    AliasFlatUnion *tmp = NULL;
+    Error *err = NULL;
+    Visitor *v;
+
+    /* Can still specify the real member name with alias support */
+    v = visitor_input_test_init(data, "{ 'tag': 'drei' }");
+    visit_type_AliasFlatUnion(v, NULL, &tmp, &error_abort);
+    g_assert_cmpint(tmp->tag, ==, FEATURE_ENUM1_DREI);
+    qapi_free_AliasFlatUnion(tmp);
+
+    /* Use alias for a base member (the discriminator even) */
+    v = visitor_input_test_init(data, "{ 'variant': 'zwei' }");
+    visit_type_AliasFlatUnion(v, NULL, &tmp, &error_abort);
+    g_assert_cmpint(tmp->tag, ==, FEATURE_ENUM1_ZWEI);
+    qapi_free_AliasFlatUnion(tmp);
+
+    /* Use alias for a variant member */
+    v = visitor_input_test_init(data, "{ 'tag': 'eins', 'bar': 42 }");
+    visit_type_AliasFlatUnion(v, NULL, &tmp, &error_abort);
+    g_assert_cmpint(tmp->tag, ==, FEATURE_ENUM1_EINS);
+    g_assert_cmpint(tmp->u.eins.foo, ==, 42);
+    qapi_free_AliasFlatUnion(tmp);
+
+    /* Both together */
+    v = visitor_input_test_init(data, "{ 'variant': 'eins', 'bar': 42 }");
+    visit_type_AliasFlatUnion(v, NULL, &tmp, &error_abort);
+    g_assert_cmpint(tmp->tag, ==, FEATURE_ENUM1_EINS);
+    g_assert_cmpint(tmp->u.eins.foo, ==, 42);
+    qapi_free_AliasFlatUnion(tmp);
+
+    /* You can't use more than one option at the same time for each alias */
+    v = visitor_input_test_init(data, "{ 'variant': 'zwei', 'tag': 'drei' }");
+    visit_type_AliasFlatUnion(v, NULL, &tmp, &err);
+    error_free_or_abort(&err);
+
+    v = visitor_input_test_init(data, "{ 'tag': 'eins', 'foo': 6, 'bar': 9 }");
+    visit_type_AliasFlatUnion(v, NULL, &tmp, &err);
+    error_free_or_abort(&err);
+}
+
+static void test_visitor_in_alias_simple_union(TestInputVisitorData *data,
+                                               const void *unused)
+{
+    AliasSimpleUnion *tmp = NULL;
+    Error *err = NULL;
+    Visitor *v;
+
+    /* Can still specify the real member name with alias support */
+    v = visitor_input_test_init(data, "{ 'type': 'eins', "
+                                      "  'data': { 'foo': 42 } }");
+    visit_type_AliasSimpleUnion(v, NULL, &tmp, &error_abort);
+    g_assert_cmpint(tmp->type, ==, ALIAS_SIMPLE_UNION_KIND_EINS);
+    g_assert_cmpint(tmp->u.eins.data->foo, ==, 42);
+    qapi_free_AliasSimpleUnion(tmp);
+
+    /* 'type' can be aliased */
+    v = visitor_input_test_init(data, "{ 'tag': 'eins', "
+                                      "  'data': { 'foo': 42 } }");
+    visit_type_AliasSimpleUnion(v, NULL, &tmp, &error_abort);
+    g_assert_cmpint(tmp->type, ==, ALIAS_SIMPLE_UNION_KIND_EINS);
+    g_assert_cmpint(tmp->u.eins.data->foo, ==, 42);
+    qapi_free_AliasSimpleUnion(tmp);
+
+    /* The wildcard alias makes it work on the top level */
+    v = visitor_input_test_init(data, "{ 'type': 'eins', 'foo': 42 }");
+    visit_type_AliasSimpleUnion(v, NULL, &tmp, &error_abort);
+    g_assert_cmpint(tmp->type, ==, ALIAS_SIMPLE_UNION_KIND_EINS);
+    g_assert_cmpint(tmp->u.eins.data->foo, ==, 42);
+    qapi_free_AliasSimpleUnion(tmp);
+
+    /* It makes the inner alias available, too */
+    v = visitor_input_test_init(data, "{ 'type': 'eins', 'bar': 42 }");
+    visit_type_AliasSimpleUnion(v, NULL, &tmp, &error_abort);
+    g_assert_cmpint(tmp->type, ==, ALIAS_SIMPLE_UNION_KIND_EINS);
+    g_assert_cmpint(tmp->u.eins.data->foo, ==, 42);
+    qapi_free_AliasSimpleUnion(tmp);
+
+    /* You can't use more than one option at the same time for each alias */
+    v = visitor_input_test_init(data, "{ 'type': 'eins', 'tag': 'eins' }");
+    visit_type_AliasSimpleUnion(v, NULL, &tmp, &err);
+    error_free_or_abort(&err);
+
+    v = visitor_input_test_init(data, "{ 'type': 'eins', "
+                                      "  'bar': 123, "
+                                      "  'data': { 'foo': 312 } }");
+    visit_type_AliasSimpleUnion(v, NULL, &tmp, &err);
+    error_free_or_abort(&err);
+}
+
 static void input_visitor_test_add(const char *testpath,
                                    const void *user_data,
                                    void (*test_func)(TestInputVisitorData *data,
@@ -1350,6 +1558,16 @@ int main(int argc, char **argv)
                            NULL, test_visitor_in_list_union_string);
     input_visitor_test_add("/visitor/input/list_union/number",
                            NULL, test_visitor_in_list_union_number);
+    input_visitor_test_add("/visitor/input/alias/struct-local",
+                           NULL, test_visitor_in_alias_struct_local);
+    input_visitor_test_add("/visitor/input/alias/struct-nested",
+                           NULL, test_visitor_in_alias_struct_nested);
+    input_visitor_test_add("/visitor/input/alias/wildcard",
+                           NULL, test_visitor_in_alias_wildcard);
+    input_visitor_test_add("/visitor/input/alias/flat-union",
+                           NULL, test_visitor_in_alias_flat_union);
+    input_visitor_test_add("/visitor/input/alias/simple-union",
+                           NULL, test_visitor_in_alias_simple_union);
     input_visitor_test_add("/visitor/input/fail/struct",
                            NULL, test_visitor_in_fail_struct);
     input_visitor_test_add("/visitor/input/fail/struct-nested",
diff --git a/tests/qapi-schema/alias-bad-type.err b/tests/qapi-schema/alias-bad-type.err
new file mode 100644
index 0000000000..820e18ed9c
--- /dev/null
+++ b/tests/qapi-schema/alias-bad-type.err
@@ -0,0 +1,2 @@
+alias-bad-type.json: In struct 'AliasStruct0':
+alias-bad-type.json:1: 'aliases' members must be objects
diff --git a/tests/qapi-schema/alias-bad-type.json b/tests/qapi-schema/alias-bad-type.json
new file mode 100644
index 0000000000..0aa5d206fe
--- /dev/null
+++ b/tests/qapi-schema/alias-bad-type.json
@@ -0,0 +1,3 @@
+{ 'struct': 'AliasStruct0',
+  'data': { 'foo': 'int' },
+  'aliases': [ 'must be an object' ] }
diff --git a/tests/qapi-schema/alias-bad-type.out b/tests/qapi-schema/alias-bad-type.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/alias-missing-source.err b/tests/qapi-schema/alias-missing-source.err
new file mode 100644
index 0000000000..8b7d601fbf
--- /dev/null
+++ b/tests/qapi-schema/alias-missing-source.err
@@ -0,0 +1,2 @@
+alias-missing-source.json: In struct 'AliasStruct0':
+alias-missing-source.json:1: 'aliases' member misses key 'source'
diff --git a/tests/qapi-schema/alias-missing-source.json b/tests/qapi-schema/alias-missing-source.json
new file mode 100644
index 0000000000..b6c91a9488
--- /dev/null
+++ b/tests/qapi-schema/alias-missing-source.json
@@ -0,0 +1,3 @@
+{ 'struct': 'AliasStruct0',
+  'data': { 'foo': 'int' },
+  'aliases': [ { 'name': 'bar' } ] }
diff --git a/tests/qapi-schema/alias-missing-source.out b/tests/qapi-schema/alias-missing-source.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/alias-name-bad-type.err b/tests/qapi-schema/alias-name-bad-type.err
new file mode 100644
index 0000000000..489f45ff9b
--- /dev/null
+++ b/tests/qapi-schema/alias-name-bad-type.err
@@ -0,0 +1,2 @@
+alias-name-bad-type.json: In struct 'AliasStruct0':
+alias-name-bad-type.json:1: alias member 'name' requires a string name
diff --git a/tests/qapi-schema/alias-name-bad-type.json b/tests/qapi-schema/alias-name-bad-type.json
new file mode 100644
index 0000000000..17442d5939
--- /dev/null
+++ b/tests/qapi-schema/alias-name-bad-type.json
@@ -0,0 +1,3 @@
+{ 'struct': 'AliasStruct0',
+  'data': { 'foo': 'int' },
+  'aliases': [ { 'name': ['bar'], 'source': ['foo'] } ] }
diff --git a/tests/qapi-schema/alias-name-bad-type.out b/tests/qapi-schema/alias-name-bad-type.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/alias-name-conflict.err b/tests/qapi-schema/alias-name-conflict.err
new file mode 100644
index 0000000000..d5825a0285
--- /dev/null
+++ b/tests/qapi-schema/alias-name-conflict.err
@@ -0,0 +1,2 @@
+alias-name-conflict.json: In struct 'AliasStruct0':
+alias-name-conflict.json:1: alias 'bar' collides with member 'bar'
diff --git a/tests/qapi-schema/alias-name-conflict.json b/tests/qapi-schema/alias-name-conflict.json
new file mode 100644
index 0000000000..bdb5bd4eab
--- /dev/null
+++ b/tests/qapi-schema/alias-name-conflict.json
@@ -0,0 +1,4 @@
+{ 'struct': 'AliasStruct0',
+  'data': { 'foo': 'int',
+            'bar': 'int' },
+  'aliases': [ { 'name': 'bar', 'source': ['foo'] } ] }
diff --git a/tests/qapi-schema/alias-name-conflict.out b/tests/qapi-schema/alias-name-conflict.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/alias-recursive.err b/tests/qapi-schema/alias-recursive.err
new file mode 100644
index 0000000000..127ce019a8
--- /dev/null
+++ b/tests/qapi-schema/alias-recursive.err
@@ -0,0 +1,2 @@
+alias-recursive.json: In struct 'AliasStruct0':
+alias-recursive.json:1: alias 'baz' resolving to 'bar' makes 'bar' an alias for itself
diff --git a/tests/qapi-schema/alias-recursive.json b/tests/qapi-schema/alias-recursive.json
new file mode 100644
index 0000000000..e25b935324
--- /dev/null
+++ b/tests/qapi-schema/alias-recursive.json
@@ -0,0 +1,4 @@
+{ 'struct': 'AliasStruct0',
+  'data': { 'foo': 'int' },
+  'aliases': [ { 'name': 'bar', 'source': ['baz'] },
+               { 'name': 'baz', 'source': ['bar'] } ] }
diff --git a/tests/qapi-schema/alias-recursive.out b/tests/qapi-schema/alias-recursive.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/alias-source-bad-type.err b/tests/qapi-schema/alias-source-bad-type.err
new file mode 100644
index 0000000000..b1779cbb8e
--- /dev/null
+++ b/tests/qapi-schema/alias-source-bad-type.err
@@ -0,0 +1,2 @@
+alias-source-bad-type.json: In struct 'AliasStruct0':
+alias-source-bad-type.json:1: alias member 'source' must be an array
diff --git a/tests/qapi-schema/alias-source-bad-type.json b/tests/qapi-schema/alias-source-bad-type.json
new file mode 100644
index 0000000000..d6a7430ee3
--- /dev/null
+++ b/tests/qapi-schema/alias-source-bad-type.json
@@ -0,0 +1,3 @@
+{ 'struct': 'AliasStruct0',
+  'data': { 'foo': 'int' },
+  'aliases': [ { 'name': 'bar', 'source': 'foo' } ] }
diff --git a/tests/qapi-schema/alias-source-bad-type.out b/tests/qapi-schema/alias-source-bad-type.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/alias-source-elem-bad-type.err b/tests/qapi-schema/alias-source-elem-bad-type.err
new file mode 100644
index 0000000000..f73fbece77
--- /dev/null
+++ b/tests/qapi-schema/alias-source-elem-bad-type.err
@@ -0,0 +1,2 @@
+alias-source-elem-bad-type.json: In struct 'AliasStruct0':
+alias-source-elem-bad-type.json:1: member of alias member 'source' requires a string name
diff --git a/tests/qapi-schema/alias-source-elem-bad-type.json b/tests/qapi-schema/alias-source-elem-bad-type.json
new file mode 100644
index 0000000000..1d08f56492
--- /dev/null
+++ b/tests/qapi-schema/alias-source-elem-bad-type.json
@@ -0,0 +1,3 @@
+{ 'struct': 'AliasStruct0',
+  'data': { 'foo': 'int' },
+  'aliases': [ { 'name': 'bar', 'source': ['foo', true] } ] }
diff --git a/tests/qapi-schema/alias-source-elem-bad-type.out b/tests/qapi-schema/alias-source-elem-bad-type.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/alias-source-empty.err b/tests/qapi-schema/alias-source-empty.err
new file mode 100644
index 0000000000..2848e762cb
--- /dev/null
+++ b/tests/qapi-schema/alias-source-empty.err
@@ -0,0 +1,2 @@
+alias-source-empty.json: In struct 'AliasStruct0':
+alias-source-empty.json:1: alias member 'source' must not be empty
diff --git a/tests/qapi-schema/alias-source-empty.json b/tests/qapi-schema/alias-source-empty.json
new file mode 100644
index 0000000000..74b529de4a
--- /dev/null
+++ b/tests/qapi-schema/alias-source-empty.json
@@ -0,0 +1,3 @@
+{ 'struct': 'AliasStruct0',
+  'data': { 'foo': 'int' },
+  'aliases': [ { 'name': 'bar', 'source': [] } ] }
diff --git a/tests/qapi-schema/alias-source-empty.out b/tests/qapi-schema/alias-source-empty.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/alias-source-inexistent-variants.err b/tests/qapi-schema/alias-source-inexistent-variants.err
new file mode 100644
index 0000000000..a5d4a4c334
--- /dev/null
+++ b/tests/qapi-schema/alias-source-inexistent-variants.err
@@ -0,0 +1,2 @@
+alias-source-inexistent-variants.json: In union 'AliasStruct0':
+alias-source-inexistent-variants.json:7: alias 'test' has a source path that does not exist in any variant of union type 'AliasStruct0'
diff --git a/tests/qapi-schema/alias-source-inexistent-variants.json b/tests/qapi-schema/alias-source-inexistent-variants.json
new file mode 100644
index 0000000000..6328095b86
--- /dev/null
+++ b/tests/qapi-schema/alias-source-inexistent-variants.json
@@ -0,0 +1,12 @@
+{ 'enum': 'Variants',
+  'data': [ 'a', 'b' ] }
+{ 'struct': 'Variant0',
+  'data': { 'foo': 'int' } }
+{ 'struct': 'Variant1',
+  'data': { 'bar': 'int' } }
+{ 'union': 'AliasStruct0',
+  'base': { 'type': 'Variants' },
+  'discriminator': 'type',
+  'data': { 'a': 'Variant0',
+            'b': 'Variant1' },
+  'aliases': [ { 'name': 'test', 'source': ['baz'] } ] }
diff --git a/tests/qapi-schema/alias-source-inexistent-variants.out b/tests/qapi-schema/alias-source-inexistent-variants.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/alias-source-inexistent.err b/tests/qapi-schema/alias-source-inexistent.err
new file mode 100644
index 0000000000..2d65d3f588
--- /dev/null
+++ b/tests/qapi-schema/alias-source-inexistent.err
@@ -0,0 +1,2 @@
+alias-source-inexistent.json: In struct 'AliasStruct0':
+alias-source-inexistent.json:1: alias 'bar' has inexistent source
diff --git a/tests/qapi-schema/alias-source-inexistent.json b/tests/qapi-schema/alias-source-inexistent.json
new file mode 100644
index 0000000000..5106d3609f
--- /dev/null
+++ b/tests/qapi-schema/alias-source-inexistent.json
@@ -0,0 +1,3 @@
+{ 'struct': 'AliasStruct0',
+  'data': { 'foo': 'int' },
+  'aliases': [ { 'name': 'bar', 'source': ['baz'] } ] }
diff --git a/tests/qapi-schema/alias-source-inexistent.out b/tests/qapi-schema/alias-source-inexistent.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/alias-source-non-object-path.err b/tests/qapi-schema/alias-source-non-object-path.err
new file mode 100644
index 0000000000..b3c748350f
--- /dev/null
+++ b/tests/qapi-schema/alias-source-non-object-path.err
@@ -0,0 +1,2 @@
+alias-source-non-object-path.json: In struct 'AliasStruct0':
+alias-source-non-object-path.json:1: alias 'bar' has non-object 'foo' in its source path
diff --git a/tests/qapi-schema/alias-source-non-object-path.json b/tests/qapi-schema/alias-source-non-object-path.json
new file mode 100644
index 0000000000..808a3e6281
--- /dev/null
+++ b/tests/qapi-schema/alias-source-non-object-path.json
@@ -0,0 +1,3 @@
+{ 'struct': 'AliasStruct0',
+  'data': { 'foo': 'int' },
+  'aliases': [ { 'name': 'bar', 'source': ['foo', 'baz'] } ] }
diff --git a/tests/qapi-schema/alias-source-non-object-path.out b/tests/qapi-schema/alias-source-non-object-path.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/alias-source-non-object-wildcard.err b/tests/qapi-schema/alias-source-non-object-wildcard.err
new file mode 100644
index 0000000000..4adc0d2281
--- /dev/null
+++ b/tests/qapi-schema/alias-source-non-object-wildcard.err
@@ -0,0 +1,2 @@
+alias-source-non-object-wildcard.json: In struct 'AliasStruct0':
+alias-source-non-object-wildcard.json:1: wildcard alias has non-object 'foo' in its source path
diff --git a/tests/qapi-schema/alias-source-non-object-wildcard.json b/tests/qapi-schema/alias-source-non-object-wildcard.json
new file mode 100644
index 0000000000..59ce1081ef
--- /dev/null
+++ b/tests/qapi-schema/alias-source-non-object-wildcard.json
@@ -0,0 +1,3 @@
+{ 'struct': 'AliasStruct0',
+  'data': { 'foo': 'int' },
+  'aliases': [ { 'source': ['foo'] } ] }
diff --git a/tests/qapi-schema/alias-source-non-object-wildcard.out b/tests/qapi-schema/alias-source-non-object-wildcard.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/alias-source-optional-wildcard-indirect.err b/tests/qapi-schema/alias-source-optional-wildcard-indirect.err
new file mode 100644
index 0000000000..b58b8ff00f
--- /dev/null
+++ b/tests/qapi-schema/alias-source-optional-wildcard-indirect.err
@@ -0,0 +1,2 @@
+alias-source-optional-wildcard-indirect.json: In struct 'AliasStruct0':
+alias-source-optional-wildcard-indirect.json:3: wildcard alias has optional object member 'nested' in its source path
diff --git a/tests/qapi-schema/alias-source-optional-wildcard-indirect.json b/tests/qapi-schema/alias-source-optional-wildcard-indirect.json
new file mode 100644
index 0000000000..fcf04969dc
--- /dev/null
+++ b/tests/qapi-schema/alias-source-optional-wildcard-indirect.json
@@ -0,0 +1,6 @@
+{ 'struct': 'Nested',
+  'data': { 'foo': 'int' } }
+{ 'struct': 'AliasStruct0',
+  'data': { '*nested': 'Nested' },
+  'aliases': [ { 'name': 'nested-alias', 'source': ['nested'] },
+               { 'source': ['nested-alias'] } ] }
diff --git a/tests/qapi-schema/alias-source-optional-wildcard-indirect.out b/tests/qapi-schema/alias-source-optional-wildcard-indirect.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/alias-source-optional-wildcard.err b/tests/qapi-schema/alias-source-optional-wildcard.err
new file mode 100644
index 0000000000..e39200bd3d
--- /dev/null
+++ b/tests/qapi-schema/alias-source-optional-wildcard.err
@@ -0,0 +1,2 @@
+alias-source-optional-wildcard.json: In struct 'AliasStruct0':
+alias-source-optional-wildcard.json:3: wildcard alias has optional object member 'nested' in its source path
diff --git a/tests/qapi-schema/alias-source-optional-wildcard.json b/tests/qapi-schema/alias-source-optional-wildcard.json
new file mode 100644
index 0000000000..1a315f2ae0
--- /dev/null
+++ b/tests/qapi-schema/alias-source-optional-wildcard.json
@@ -0,0 +1,5 @@
+{ 'struct': 'Nested',
+  'data': { 'foo': 'int' } }
+{ 'struct': 'AliasStruct0',
+  'data': { '*nested': 'Nested' },
+  'aliases': [ { 'source': ['nested'] } ] }
diff --git a/tests/qapi-schema/alias-source-optional-wildcard.out b/tests/qapi-schema/alias-source-optional-wildcard.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/alias-unknown-key.err b/tests/qapi-schema/alias-unknown-key.err
new file mode 100644
index 0000000000..c7b8cb9498
--- /dev/null
+++ b/tests/qapi-schema/alias-unknown-key.err
@@ -0,0 +1,3 @@
+alias-unknown-key.json: In struct 'AliasStruct0':
+alias-unknown-key.json:1: 'aliases' member has unknown key 'known'
+Valid keys are 'name', 'source'.
diff --git a/tests/qapi-schema/alias-unknown-key.json b/tests/qapi-schema/alias-unknown-key.json
new file mode 100644
index 0000000000..cdb8fc3d07
--- /dev/null
+++ b/tests/qapi-schema/alias-unknown-key.json
@@ -0,0 +1,3 @@
+{ 'struct': 'AliasStruct0',
+  'data': { 'foo': 'int' },
+  'aliases': [ { 'name': 'bar', 'source': ['foo'], 'known': false } ] }
diff --git a/tests/qapi-schema/alias-unknown-key.out b/tests/qapi-schema/alias-unknown-key.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/aliases-bad-type.err b/tests/qapi-schema/aliases-bad-type.err
new file mode 100644
index 0000000000..7ffe789ec0
--- /dev/null
+++ b/tests/qapi-schema/aliases-bad-type.err
@@ -0,0 +1,2 @@
+aliases-bad-type.json: In struct 'AliasStruct0':
+aliases-bad-type.json:1: 'aliases' must be an array
diff --git a/tests/qapi-schema/aliases-bad-type.json b/tests/qapi-schema/aliases-bad-type.json
new file mode 100644
index 0000000000..4bbf6d6b20
--- /dev/null
+++ b/tests/qapi-schema/aliases-bad-type.json
@@ -0,0 +1,3 @@
+{ 'struct': 'AliasStruct0',
+  'data': { 'foo': 'int' },
+  'aliases': 'this must be an array' }
diff --git a/tests/qapi-schema/aliases-bad-type.out b/tests/qapi-schema/aliases-bad-type.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index b8de58116a..f937de1c35 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -3,6 +3,22 @@ test_env.set('PYTHONPATH', meson.source_root() / 'scripts')
 test_env.set('PYTHONIOENCODING', 'utf-8')
 
 schemas = [
+  'alias-bad-type.json',
+  'aliases-bad-type.json',
+  'alias-missing-source.json',
+  'alias-name-bad-type.json',
+  'alias-name-conflict.json',
+  'alias-recursive.json',
+  'alias-source-bad-type.json',
+  'alias-source-elem-bad-type.json',
+  'alias-source-empty.json',
+  'alias-source-inexistent.json',
+  'alias-source-inexistent-variants.json',
+  'alias-source-non-object-path.json',
+  'alias-source-non-object-wildcard.json',
+  'alias-source-optional-wildcard.json',
+  'alias-source-optional-wildcard-indirect.json',
+  'alias-unknown-key.json',
   'alternate-any.json',
   'alternate-array.json',
   'alternate-base.json',
diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index 84b9d41f15..c5e81a883c 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -336,3 +336,29 @@
 
 { 'event': 'TEST_EVENT_FEATURES1',
   'features': [ 'deprecated' ] }
+
+# test  'aliases'
+
+{ 'struct': 'AliasStruct0',
+  'data': { 'foo': 'int' },
+  'aliases': [] }
+{ 'struct': 'AliasStruct1',
+  'data': { 'foo': 'int' },
+  'aliases': [ { 'name': 'bar', 'source': ['foo'] } ] }
+{ 'struct': 'AliasStruct2',
+  'data': { 'nested': 'AliasStruct1' },
+  'aliases': [ { 'name': 'bar', 'source': ['nested', 'foo'] } ] }
+{ 'struct': 'AliasStruct3',
+  'data': { 'nested': 'AliasStruct1' },
+  'aliases': [ { 'source': ['nested'] } ] }
+
+{ 'union': 'AliasFlatUnion',
+  'base': { 'tag': 'FeatureEnum1' },
+  'discriminator': 'tag',
+  'data': { 'eins': 'FeatureStruct1' },
+  'aliases': [ { 'name': 'variant', 'source': ['tag'] },
+               { 'name': 'bar', 'source': ['foo'] } ] }
+{ 'union': 'AliasSimpleUnion',
+  'data': { 'eins': 'AliasStruct1' },
+  'aliases': [ { 'source': ['data'] },
+               { 'name': 'tag', 'source': ['type'] } ] }
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index e0b8a5f0b6..f6b8a98b7c 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -445,6 +445,37 @@ event TEST_EVENT_FEATURES0 FeatureStruct1
 event TEST_EVENT_FEATURES1 None
     boxed=False
     feature deprecated
+object AliasStruct0
+    member foo: int optional=False
+object AliasStruct1
+    member foo: int optional=False
+    alias bar -> foo
+object AliasStruct2
+    member nested: AliasStruct1 optional=False
+    alias bar -> nested.foo
+object AliasStruct3
+    member nested: AliasStruct1 optional=False
+    alias * -> nested.*
+object q_obj_AliasFlatUnion-base
+    member tag: FeatureEnum1 optional=False
+object AliasFlatUnion
+    base q_obj_AliasFlatUnion-base
+    alias variant -> tag
+    alias bar -> foo
+    tag tag
+    case eins: FeatureStruct1
+    case zwei: q_empty
+    case drei: q_empty
+object q_obj_AliasStruct1-wrapper
+    member data: AliasStruct1 optional=False
+enum AliasSimpleUnionKind
+    member eins
+object AliasSimpleUnion
+    member type: AliasSimpleUnionKind optional=False
+    alias * -> data.*
+    alias tag -> type
+    tag type
+    case eins: q_obj_AliasStruct1-wrapper
 module include/sub-module.json
 include sub-sub-module.json
 object SecondArrayRef
-- 
2.31.1


