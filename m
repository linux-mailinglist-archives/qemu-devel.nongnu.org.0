Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7740B346BA1
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 23:04:59 +0100 (CET)
Received: from localhost ([::1]:40682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOp90-0002Mk-H0
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 18:04:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOp1Q-0006vE-Lf
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:57:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lOp1M-0002kH-8P
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:57:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616536623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D50BF+Cvx9tK7B8FrfeoxYklXG0hX43HOVthn614L6Y=;
 b=Gz/GyR3loTg5C7BRNu0tsOl8lKIKkRyZKzhK1p86+klwtVN7ISHLYPvn9z2Jz0dGczQ72Q
 gNh8S1NoYQcB2Mm8LzVlO0shViRq0634953GtabXu/8JG/MaoVVGITC08RAPvUTl2VYyZ2
 IhM9qkoZ22pDgoCPOifVNqcUXFHmxGM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-rTwKiPGuPOOxmYAVf4Ow0g-1; Tue, 23 Mar 2021 17:57:00 -0400
X-MC-Unique: rTwKiPGuPOOxmYAVf4Ow0g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 249ADA0CA3;
 Tue, 23 Mar 2021 21:57:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E965B610A8;
 Tue, 23 Mar 2021 21:56:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 827541132709; Tue, 23 Mar 2021 22:56:58 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/29] tests/qapi-schema: Drop redundant flat-union-inline test
Date: Tue, 23 Mar 2021 22:56:31 +0100
Message-Id: <20210323215658.3840228-3-armbru@redhat.com>
In-Reply-To: <20210323215658.3840228-1-armbru@redhat.com>
References: <20210323215658.3840228-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

flat-union-inline.json covers longhand branch definition with an
invalid type value.  It's redundant: longhand branch definition is
covered by flat-union-inline-invalid-dict.json, and invalid type value
is covered by nested-struct-data.json.  Drop the test.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210323094025.3569441-3-armbru@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
---
 tests/qapi-schema/flat-union-inline.err  |  2 --
 tests/qapi-schema/flat-union-inline.json | 11 -----------
 tests/qapi-schema/flat-union-inline.out  |  0
 tests/qapi-schema/meson.build            |  1 -
 4 files changed, 14 deletions(-)
 delete mode 100644 tests/qapi-schema/flat-union-inline.err
 delete mode 100644 tests/qapi-schema/flat-union-inline.json
 delete mode 100644 tests/qapi-schema/flat-union-inline.out

diff --git a/tests/qapi-schema/flat-union-inline.err b/tests/qapi-schema/flat-union-inline.err
deleted file mode 100644
index 538283f5db..0000000000
--- a/tests/qapi-schema/flat-union-inline.err
+++ /dev/null
@@ -1,2 +0,0 @@
-flat-union-inline.json: In union 'TestUnion':
-flat-union-inline.json:7: 'data' member 'value1' should be a type name
diff --git a/tests/qapi-schema/flat-union-inline.json b/tests/qapi-schema/flat-union-inline.json
deleted file mode 100644
index a9b3ce3f0d..0000000000
--- a/tests/qapi-schema/flat-union-inline.json
+++ /dev/null
@@ -1,11 +0,0 @@
-# we require branches to be a struct name
-# TODO: should we allow anonymous inline branch types?
-{ 'enum': 'TestEnum',
-  'data': [ 'value1', 'value2' ] }
-{ 'struct': 'Base',
-  'data': { 'enum1': 'TestEnum', 'kind': 'str' } }
-{ 'union': 'TestUnion',
-  'base': 'Base',
-  'discriminator': 'enum1',
-  'data': { 'value1': { 'type': {} },
-            'value2': { 'integer': 'int' } } }
diff --git a/tests/qapi-schema/flat-union-inline.out b/tests/qapi-schema/flat-union-inline.out
deleted file mode 100644
index e69de29bb2..0000000000
diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index 304ef939bd..d5fa035507 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -111,7 +111,6 @@ schemas = [
   'flat-union-clash-member.json',
   'flat-union-discriminator-bad-name.json',
   'flat-union-empty.json',
-  'flat-union-inline.json',
   'flat-union-inline-invalid-dict.json',
   'flat-union-int-branch.json',
   'flat-union-invalid-branch-key.json',
-- 
2.26.3


