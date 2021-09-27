Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8464194F9
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 15:22:00 +0200 (CEST)
Received: from localhost ([::1]:48372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUqZz-0007XG-2v
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 09:21:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mUqLh-0003g9-QQ
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:07:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mUqLe-0003tZ-8L
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:07:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632748029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=crdpMqgq/xumj2wSo6tDv4gzNZ7NmdAh+0MIrIKtpPg=;
 b=EACd1ZqNzCq5uW00jr8Ygd90/k2Fk0DWi4Ou/b+BFPT2Wv5ZzjjpEccQ8bsZcphUd0WdsE
 TJOyUNW3TmIAJKmuUmMgNGeI/LbaotHlQOlim73MG1JCwH1R54Q7+utlKzl8+ERVmeuzNS
 NvHrjGOfKLyARlDgd7qRKdT4iGybt8M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-iiOBdg43POa_DdzWM1TIKw-1; Mon, 27 Sep 2021 09:06:54 -0400
X-MC-Unique: iiOBdg43POa_DdzWM1TIKw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E80AE1084684;
 Mon, 27 Sep 2021 13:06:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DC5918EF7;
 Mon, 27 Sep 2021 13:06:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C53DE1136421; Mon, 27 Sep 2021 15:06:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 22/25] tests/qapi-schema: Rename flat-union-* test cases to
 union-*
Date: Mon, 27 Sep 2021 15:06:44 +0200
Message-Id: <20210927130647.1271533-23-armbru@redhat.com>
In-Reply-To: <20210927130647.1271533-1-armbru@redhat.com>
References: <20210927130647.1271533-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210917143134.412106-23-armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com
---
 tests/qapi-schema/flat-union-array-branch.err |  2 --
 tests/qapi-schema/flat-union-bad-base.err     |  2 --
 .../flat-union-bad-discriminator.err          |  2 --
 tests/qapi-schema/flat-union-base-any.err     |  2 --
 tests/qapi-schema/flat-union-base-union.err   |  2 --
 tests/qapi-schema/flat-union-clash-member.err |  2 --
 .../flat-union-discriminator-bad-name.err     |  2 --
 tests/qapi-schema/flat-union-empty.err        |  2 --
 .../flat-union-inline-invalid-dict.err        |  2 --
 tests/qapi-schema/flat-union-int-branch.err   |  2 --
 .../flat-union-invalid-branch-key.err         |  2 --
 .../flat-union-invalid-discriminator.err      |  2 --
 .../flat-union-invalid-if-discriminator.err   |  2 --
 tests/qapi-schema/flat-union-no-base.err      |  2 --
 .../flat-union-optional-discriminator.err     |  2 --
 .../flat-union-string-discriminator.err       |  2 --
 tests/qapi-schema/meson.build                 | 32 +++++++++----------
 tests/qapi-schema/union-array-branch.err      |  2 ++
 ...ay-branch.json => union-array-branch.json} |  0
 ...rray-branch.out => union-array-branch.out} |  0
 tests/qapi-schema/union-bad-base.err          |  2 ++
 ...nion-bad-base.json => union-bad-base.json} |  0
 ...-union-bad-base.out => union-bad-base.out} |  0
 tests/qapi-schema/union-bad-discriminator.err |  2 ++
 ...ator.json => union-bad-discriminator.json} |  0
 ...inator.out => union-bad-discriminator.out} |  0
 tests/qapi-schema/union-base-any.err          |  2 ++
 ...nion-base-any.json => union-base-any.json} |  0
 ...-union-base-any.out => union-base-any.out} |  0
 tests/qapi-schema/union-base-union.err        |  2 ++
 ...-base-union.json => union-base-union.json} |  0
 ...on-base-union.out => union-base-union.out} |  0
 tests/qapi-schema/union-clash-member.err      |  2 ++
 ...sh-member.json => union-clash-member.json} |  0
 ...lash-member.out => union-clash-member.out} |  0
 .../union-discriminator-bad-name.err          |  2 ++
 ...json => union-discriminator-bad-name.json} |  0
 ...e.out => union-discriminator-bad-name.out} |  0
 tests/qapi-schema/union-empty.err             |  2 ++
 ...flat-union-empty.json => union-empty.json} |  0
 .../{flat-union-empty.out => union-empty.out} |  0
 .../qapi-schema/union-inline-invalid-dict.err |  2 ++
 ...ct.json => union-inline-invalid-dict.json} |  0
 ...dict.out => union-inline-invalid-dict.out} |  0
 tests/qapi-schema/union-int-branch.err        |  2 ++
 ...-int-branch.json => union-int-branch.json} |  0
 ...on-int-branch.out => union-int-branch.out} |  0
 .../qapi-schema/union-invalid-branch-key.err  |  2 ++
 ...key.json => union-invalid-branch-key.json} |  0
 ...h-key.out => union-invalid-branch-key.out} |  0
 .../union-invalid-discriminator.err           |  2 ++
 ....json => union-invalid-discriminator.json} |  0
 ...or.out => union-invalid-discriminator.out} |  0
 .../union-invalid-if-discriminator.err        |  2 ++
 ...on => union-invalid-if-discriminator.json} |  0
 ...out => union-invalid-if-discriminator.out} |  0
 tests/qapi-schema/union-no-base.err           |  2 ++
 ...-union-no-base.json => union-no-base.json} |  0
 ...at-union-no-base.out => union-no-base.out} |  0
 .../union-optional-discriminator.err          |  2 ++
 ...json => union-optional-discriminator.json} |  0
 ...r.out => union-optional-discriminator.out} |  0
 .../union-string-discriminator.err            |  2 ++
 ...r.json => union-string-discriminator.json} |  0
 ...tor.out => union-string-discriminator.out} |  0
 65 files changed, 48 insertions(+), 48 deletions(-)
 delete mode 100644 tests/qapi-schema/flat-union-array-branch.err
 delete mode 100644 tests/qapi-schema/flat-union-bad-base.err
 delete mode 100644 tests/qapi-schema/flat-union-bad-discriminator.err
 delete mode 100644 tests/qapi-schema/flat-union-base-any.err
 delete mode 100644 tests/qapi-schema/flat-union-base-union.err
 delete mode 100644 tests/qapi-schema/flat-union-clash-member.err
 delete mode 100644 tests/qapi-schema/flat-union-discriminator-bad-name.err
 delete mode 100644 tests/qapi-schema/flat-union-empty.err
 delete mode 100644 tests/qapi-schema/flat-union-inline-invalid-dict.err
 delete mode 100644 tests/qapi-schema/flat-union-int-branch.err
 delete mode 100644 tests/qapi-schema/flat-union-invalid-branch-key.err
 delete mode 100644 tests/qapi-schema/flat-union-invalid-discriminator.err
 delete mode 100644 tests/qapi-schema/flat-union-invalid-if-discriminator.err
 delete mode 100644 tests/qapi-schema/flat-union-no-base.err
 delete mode 100644 tests/qapi-schema/flat-union-optional-discriminator.err
 delete mode 100644 tests/qapi-schema/flat-union-string-discriminator.err
 create mode 100644 tests/qapi-schema/union-array-branch.err
 rename tests/qapi-schema/{flat-union-array-branch.json => union-array-branch.json} (100%)
 rename tests/qapi-schema/{flat-union-array-branch.out => union-array-branch.out} (100%)
 create mode 100644 tests/qapi-schema/union-bad-base.err
 rename tests/qapi-schema/{flat-union-bad-base.json => union-bad-base.json} (100%)
 rename tests/qapi-schema/{flat-union-bad-base.out => union-bad-base.out} (100%)
 create mode 100644 tests/qapi-schema/union-bad-discriminator.err
 rename tests/qapi-schema/{flat-union-bad-discriminator.json => union-bad-discriminator.json} (100%)
 rename tests/qapi-schema/{flat-union-bad-discriminator.out => union-bad-discriminator.out} (100%)
 create mode 100644 tests/qapi-schema/union-base-any.err
 rename tests/qapi-schema/{flat-union-base-any.json => union-base-any.json} (100%)
 rename tests/qapi-schema/{flat-union-base-any.out => union-base-any.out} (100%)
 create mode 100644 tests/qapi-schema/union-base-union.err
 rename tests/qapi-schema/{flat-union-base-union.json => union-base-union.json} (100%)
 rename tests/qapi-schema/{flat-union-base-union.out => union-base-union.out} (100%)
 create mode 100644 tests/qapi-schema/union-clash-member.err
 rename tests/qapi-schema/{flat-union-clash-member.json => union-clash-member.json} (100%)
 rename tests/qapi-schema/{flat-union-clash-member.out => union-clash-member.out} (100%)
 create mode 100644 tests/qapi-schema/union-discriminator-bad-name.err
 rename tests/qapi-schema/{flat-union-discriminator-bad-name.json => union-discriminator-bad-name.json} (100%)
 rename tests/qapi-schema/{flat-union-discriminator-bad-name.out => union-discriminator-bad-name.out} (100%)
 create mode 100644 tests/qapi-schema/union-empty.err
 rename tests/qapi-schema/{flat-union-empty.json => union-empty.json} (100%)
 rename tests/qapi-schema/{flat-union-empty.out => union-empty.out} (100%)
 create mode 100644 tests/qapi-schema/union-inline-invalid-dict.err
 rename tests/qapi-schema/{flat-union-inline-invalid-dict.json => union-inline-invalid-dict.json} (100%)
 rename tests/qapi-schema/{flat-union-inline-invalid-dict.out => union-inline-invalid-dict.out} (100%)
 create mode 100644 tests/qapi-schema/union-int-branch.err
 rename tests/qapi-schema/{flat-union-int-branch.json => union-int-branch.json} (100%)
 rename tests/qapi-schema/{flat-union-int-branch.out => union-int-branch.out} (100%)
 create mode 100644 tests/qapi-schema/union-invalid-branch-key.err
 rename tests/qapi-schema/{flat-union-invalid-branch-key.json => union-invalid-branch-key.json} (100%)
 rename tests/qapi-schema/{flat-union-invalid-branch-key.out => union-invalid-branch-key.out} (100%)
 create mode 100644 tests/qapi-schema/union-invalid-discriminator.err
 rename tests/qapi-schema/{flat-union-invalid-discriminator.json => union-invalid-discriminator.json} (100%)
 rename tests/qapi-schema/{flat-union-invalid-discriminator.out => union-invalid-discriminator.out} (100%)
 create mode 100644 tests/qapi-schema/union-invalid-if-discriminator.err
 rename tests/qapi-schema/{flat-union-invalid-if-discriminator.json => union-invalid-if-discriminator.json} (100%)
 rename tests/qapi-schema/{flat-union-invalid-if-discriminator.out => union-invalid-if-discriminator.out} (100%)
 create mode 100644 tests/qapi-schema/union-no-base.err
 rename tests/qapi-schema/{flat-union-no-base.json => union-no-base.json} (100%)
 rename tests/qapi-schema/{flat-union-no-base.out => union-no-base.out} (100%)
 create mode 100644 tests/qapi-schema/union-optional-discriminator.err
 rename tests/qapi-schema/{flat-union-optional-discriminator.json => union-optional-discriminator.json} (100%)
 rename tests/qapi-schema/{flat-union-optional-discriminator.out => union-optional-discriminator.out} (100%)
 create mode 100644 tests/qapi-schema/union-string-discriminator.err
 rename tests/qapi-schema/{flat-union-string-discriminator.json => union-string-discriminator.json} (100%)
 rename tests/qapi-schema/{flat-union-string-discriminator.out => union-string-discriminator.out} (100%)

diff --git a/tests/qapi-schema/flat-union-array-branch.err b/tests/qapi-schema/flat-union-array-branch.err
deleted file mode 100644
index 20a8ef1406..0000000000
--- a/tests/qapi-schema/flat-union-array-branch.err
+++ /dev/null
@@ -1,2 +0,0 @@
-flat-union-array-branch.json: In union 'TestUnion':
-flat-union-array-branch.json:8: 'data' member 'value1' cannot be an array
diff --git a/tests/qapi-schema/flat-union-bad-base.err b/tests/qapi-schema/flat-union-bad-base.err
deleted file mode 100644
index e0a205a58c..0000000000
--- a/tests/qapi-schema/flat-union-bad-base.err
+++ /dev/null
@@ -1,2 +0,0 @@
-flat-union-bad-base.json: In union 'TestUnion':
-flat-union-bad-base.json:8: member 'string' of type 'TestTypeA' collides with base member 'string'
diff --git a/tests/qapi-schema/flat-union-bad-discriminator.err b/tests/qapi-schema/flat-union-bad-discriminator.err
deleted file mode 100644
index b705439bd9..0000000000
--- a/tests/qapi-schema/flat-union-bad-discriminator.err
+++ /dev/null
@@ -1,2 +0,0 @@
-flat-union-bad-discriminator.json: In union 'TestUnion':
-flat-union-bad-discriminator.json:11: 'discriminator' requires a string name
diff --git a/tests/qapi-schema/flat-union-base-any.err b/tests/qapi-schema/flat-union-base-any.err
deleted file mode 100644
index c2d4de6a5d..0000000000
--- a/tests/qapi-schema/flat-union-base-any.err
+++ /dev/null
@@ -1,2 +0,0 @@
-flat-union-base-any.json: In union 'TestUnion':
-flat-union-base-any.json:8: 'base' requires a struct type, built-in type 'any' isn't
diff --git a/tests/qapi-schema/flat-union-base-union.err b/tests/qapi-schema/flat-union-base-union.err
deleted file mode 100644
index 3563e8777e..0000000000
--- a/tests/qapi-schema/flat-union-base-union.err
+++ /dev/null
@@ -1,2 +0,0 @@
-flat-union-base-union.json: In union 'TestUnion':
-flat-union-base-union.json:17: 'base' requires a struct type, union type 'UnionBase' isn't
diff --git a/tests/qapi-schema/flat-union-clash-member.err b/tests/qapi-schema/flat-union-clash-member.err
deleted file mode 100644
index 07551e6ef5..0000000000
--- a/tests/qapi-schema/flat-union-clash-member.err
+++ /dev/null
@@ -1,2 +0,0 @@
-flat-union-clash-member.json: In union 'TestUnion':
-flat-union-clash-member.json:11: member 'name' of type 'Branch1' collides with member 'name' of type 'Base'
diff --git a/tests/qapi-schema/flat-union-discriminator-bad-name.err b/tests/qapi-schema/flat-union-discriminator-bad-name.err
deleted file mode 100644
index 28be49c31a..0000000000
--- a/tests/qapi-schema/flat-union-discriminator-bad-name.err
+++ /dev/null
@@ -1,2 +0,0 @@
-flat-union-discriminator-bad-name.json: In union 'MyUnion':
-flat-union-discriminator-bad-name.json:6: discriminator '*switch' is not a member of 'base'
diff --git a/tests/qapi-schema/flat-union-empty.err b/tests/qapi-schema/flat-union-empty.err
deleted file mode 100644
index 89b0f25cb0..0000000000
--- a/tests/qapi-schema/flat-union-empty.err
+++ /dev/null
@@ -1,2 +0,0 @@
-flat-union-empty.json: In union 'Union':
-flat-union-empty.json:4: union has no branches
diff --git a/tests/qapi-schema/flat-union-inline-invalid-dict.err b/tests/qapi-schema/flat-union-inline-invalid-dict.err
deleted file mode 100644
index 53e5416707..0000000000
--- a/tests/qapi-schema/flat-union-inline-invalid-dict.err
+++ /dev/null
@@ -1,2 +0,0 @@
-flat-union-inline-invalid-dict.json: In union 'TestUnion':
-flat-union-inline-invalid-dict.json:7: 'data' member 'value1' misses key 'type'
diff --git a/tests/qapi-schema/flat-union-int-branch.err b/tests/qapi-schema/flat-union-int-branch.err
deleted file mode 100644
index ae7f800603..0000000000
--- a/tests/qapi-schema/flat-union-int-branch.err
+++ /dev/null
@@ -1,2 +0,0 @@
-flat-union-int-branch.json: In union 'TestUnion':
-flat-union-int-branch.json:8: branch 'value1' cannot use built-in type 'int'
diff --git a/tests/qapi-schema/flat-union-invalid-branch-key.err b/tests/qapi-schema/flat-union-invalid-branch-key.err
deleted file mode 100644
index 5576a25f9b..0000000000
--- a/tests/qapi-schema/flat-union-invalid-branch-key.err
+++ /dev/null
@@ -1,2 +0,0 @@
-flat-union-invalid-branch-key.json: In union 'TestUnion':
-flat-union-invalid-branch-key.json:13: branch 'value_wrong' is not a value of enum type 'TestEnum'
diff --git a/tests/qapi-schema/flat-union-invalid-discriminator.err b/tests/qapi-schema/flat-union-invalid-discriminator.err
deleted file mode 100644
index 99bca2ddab..0000000000
--- a/tests/qapi-schema/flat-union-invalid-discriminator.err
+++ /dev/null
@@ -1,2 +0,0 @@
-flat-union-invalid-discriminator.json: In union 'TestUnion':
-flat-union-invalid-discriminator.json:10: discriminator 'enum_wrong' is not a member of 'base'
diff --git a/tests/qapi-schema/flat-union-invalid-if-discriminator.err b/tests/qapi-schema/flat-union-invalid-if-discriminator.err
deleted file mode 100644
index 350f28da9d..0000000000
--- a/tests/qapi-schema/flat-union-invalid-if-discriminator.err
+++ /dev/null
@@ -1,2 +0,0 @@
-flat-union-invalid-if-discriminator.json: In union 'TestUnion':
-flat-union-invalid-if-discriminator.json:10: discriminator member 'enum1' of 'base' must not be conditional
diff --git a/tests/qapi-schema/flat-union-no-base.err b/tests/qapi-schema/flat-union-no-base.err
deleted file mode 100644
index c60482f96b..0000000000
--- a/tests/qapi-schema/flat-union-no-base.err
+++ /dev/null
@@ -1,2 +0,0 @@
-flat-union-no-base.json: In union 'TestUnion':
-flat-union-no-base.json:8: union misses key 'base'
diff --git a/tests/qapi-schema/flat-union-optional-discriminator.err b/tests/qapi-schema/flat-union-optional-discriminator.err
deleted file mode 100644
index 3d60a1b496..0000000000
--- a/tests/qapi-schema/flat-union-optional-discriminator.err
+++ /dev/null
@@ -1,2 +0,0 @@
-flat-union-optional-discriminator.json: In union 'MyUnion':
-flat-union-optional-discriminator.json:6: discriminator member 'switch' of base type 'Base' must not be optional
diff --git a/tests/qapi-schema/flat-union-string-discriminator.err b/tests/qapi-schema/flat-union-string-discriminator.err
deleted file mode 100644
index ff42c9728b..0000000000
--- a/tests/qapi-schema/flat-union-string-discriminator.err
+++ /dev/null
@@ -1,2 +0,0 @@
-flat-union-string-discriminator.json: In union 'TestUnion':
-flat-union-string-discriminator.json:13: discriminator member 'kind' of base type 'TestBase' must be of enum type
diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index 85d3de1481..6187efbd58 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -107,22 +107,6 @@ schemas = [
   'features-name-bad-type.json',
   'features-no-list.json',
   'features-unknown-key.json',
-  'flat-union-array-branch.json',
-  'flat-union-bad-base.json',
-  'flat-union-bad-discriminator.json',
-  'flat-union-base-any.json',
-  'flat-union-base-union.json',
-  'flat-union-clash-member.json',
-  'flat-union-discriminator-bad-name.json',
-  'flat-union-empty.json',
-  'flat-union-inline-invalid-dict.json',
-  'flat-union-int-branch.json',
-  'flat-union-invalid-branch-key.json',
-  'flat-union-invalid-discriminator.json',
-  'flat-union-invalid-if-discriminator.json',
-  'flat-union-no-base.json',
-  'flat-union-optional-discriminator.json',
-  'flat-union-string-discriminator.json',
   'funny-char.json',
   'funny-word.json',
   'ident-with-escape.json',
@@ -190,12 +174,28 @@ schemas = [
   'unclosed-list.json',
   'unclosed-object.json',
   'unclosed-string.json',
+  'union-array-branch.json',
+  'union-bad-base.json',
+  'union-bad-discriminator.json',
+  'union-base-any.json',
   'union-base-empty.json',
   'union-base-no-discriminator.json',
+  'union-base-union.json',
   'union-branch-if-invalid.json',
   'union-branch-invalid-dict.json',
+  'union-clash-member.json',
+  'union-discriminator-bad-name.json',
+  'union-empty.json',
+  'union-inline-invalid-dict.json',
+  'union-int-branch.json',
   'union-invalid-base.json',
+  'union-invalid-branch-key.json',
   'union-invalid-data.json',
+  'union-invalid-discriminator.json',
+  'union-invalid-if-discriminator.json',
+  'union-no-base.json',
+  'union-optional-discriminator.json',
+  'union-string-discriminator.json',
   'union-unknown.json',
   'unknown-escape.json',
   'unknown-expr-key.json',
diff --git a/tests/qapi-schema/union-array-branch.err b/tests/qapi-schema/union-array-branch.err
new file mode 100644
index 0000000000..5db9c17481
--- /dev/null
+++ b/tests/qapi-schema/union-array-branch.err
@@ -0,0 +1,2 @@
+union-array-branch.json: In union 'TestUnion':
+union-array-branch.json:8: 'data' member 'value1' cannot be an array
diff --git a/tests/qapi-schema/flat-union-array-branch.json b/tests/qapi-schema/union-array-branch.json
similarity index 100%
rename from tests/qapi-schema/flat-union-array-branch.json
rename to tests/qapi-schema/union-array-branch.json
diff --git a/tests/qapi-schema/flat-union-array-branch.out b/tests/qapi-schema/union-array-branch.out
similarity index 100%
rename from tests/qapi-schema/flat-union-array-branch.out
rename to tests/qapi-schema/union-array-branch.out
diff --git a/tests/qapi-schema/union-bad-base.err b/tests/qapi-schema/union-bad-base.err
new file mode 100644
index 0000000000..42b2ed1dda
--- /dev/null
+++ b/tests/qapi-schema/union-bad-base.err
@@ -0,0 +1,2 @@
+union-bad-base.json: In union 'TestUnion':
+union-bad-base.json:8: member 'string' of type 'TestTypeA' collides with base member 'string'
diff --git a/tests/qapi-schema/flat-union-bad-base.json b/tests/qapi-schema/union-bad-base.json
similarity index 100%
rename from tests/qapi-schema/flat-union-bad-base.json
rename to tests/qapi-schema/union-bad-base.json
diff --git a/tests/qapi-schema/flat-union-bad-base.out b/tests/qapi-schema/union-bad-base.out
similarity index 100%
rename from tests/qapi-schema/flat-union-bad-base.out
rename to tests/qapi-schema/union-bad-base.out
diff --git a/tests/qapi-schema/union-bad-discriminator.err b/tests/qapi-schema/union-bad-discriminator.err
new file mode 100644
index 0000000000..7cfd470f58
--- /dev/null
+++ b/tests/qapi-schema/union-bad-discriminator.err
@@ -0,0 +1,2 @@
+union-bad-discriminator.json: In union 'TestUnion':
+union-bad-discriminator.json:11: 'discriminator' requires a string name
diff --git a/tests/qapi-schema/flat-union-bad-discriminator.json b/tests/qapi-schema/union-bad-discriminator.json
similarity index 100%
rename from tests/qapi-schema/flat-union-bad-discriminator.json
rename to tests/qapi-schema/union-bad-discriminator.json
diff --git a/tests/qapi-schema/flat-union-bad-discriminator.out b/tests/qapi-schema/union-bad-discriminator.out
similarity index 100%
rename from tests/qapi-schema/flat-union-bad-discriminator.out
rename to tests/qapi-schema/union-bad-discriminator.out
diff --git a/tests/qapi-schema/union-base-any.err b/tests/qapi-schema/union-base-any.err
new file mode 100644
index 0000000000..82b48bc1c8
--- /dev/null
+++ b/tests/qapi-schema/union-base-any.err
@@ -0,0 +1,2 @@
+union-base-any.json: In union 'TestUnion':
+union-base-any.json:8: 'base' requires a struct type, built-in type 'any' isn't
diff --git a/tests/qapi-schema/flat-union-base-any.json b/tests/qapi-schema/union-base-any.json
similarity index 100%
rename from tests/qapi-schema/flat-union-base-any.json
rename to tests/qapi-schema/union-base-any.json
diff --git a/tests/qapi-schema/flat-union-base-any.out b/tests/qapi-schema/union-base-any.out
similarity index 100%
rename from tests/qapi-schema/flat-union-base-any.out
rename to tests/qapi-schema/union-base-any.out
diff --git a/tests/qapi-schema/union-base-union.err b/tests/qapi-schema/union-base-union.err
new file mode 100644
index 0000000000..2bddaf6a84
--- /dev/null
+++ b/tests/qapi-schema/union-base-union.err
@@ -0,0 +1,2 @@
+union-base-union.json: In union 'TestUnion':
+union-base-union.json:17: 'base' requires a struct type, union type 'UnionBase' isn't
diff --git a/tests/qapi-schema/flat-union-base-union.json b/tests/qapi-schema/union-base-union.json
similarity index 100%
rename from tests/qapi-schema/flat-union-base-union.json
rename to tests/qapi-schema/union-base-union.json
diff --git a/tests/qapi-schema/flat-union-base-union.out b/tests/qapi-schema/union-base-union.out
similarity index 100%
rename from tests/qapi-schema/flat-union-base-union.out
rename to tests/qapi-schema/union-base-union.out
diff --git a/tests/qapi-schema/union-clash-member.err b/tests/qapi-schema/union-clash-member.err
new file mode 100644
index 0000000000..c1f3a02552
--- /dev/null
+++ b/tests/qapi-schema/union-clash-member.err
@@ -0,0 +1,2 @@
+union-clash-member.json: In union 'TestUnion':
+union-clash-member.json:11: member 'name' of type 'Branch1' collides with member 'name' of type 'Base'
diff --git a/tests/qapi-schema/flat-union-clash-member.json b/tests/qapi-schema/union-clash-member.json
similarity index 100%
rename from tests/qapi-schema/flat-union-clash-member.json
rename to tests/qapi-schema/union-clash-member.json
diff --git a/tests/qapi-schema/flat-union-clash-member.out b/tests/qapi-schema/union-clash-member.out
similarity index 100%
rename from tests/qapi-schema/flat-union-clash-member.out
rename to tests/qapi-schema/union-clash-member.out
diff --git a/tests/qapi-schema/union-discriminator-bad-name.err b/tests/qapi-schema/union-discriminator-bad-name.err
new file mode 100644
index 0000000000..5793e9af66
--- /dev/null
+++ b/tests/qapi-schema/union-discriminator-bad-name.err
@@ -0,0 +1,2 @@
+union-discriminator-bad-name.json: In union 'MyUnion':
+union-discriminator-bad-name.json:6: discriminator '*switch' is not a member of 'base'
diff --git a/tests/qapi-schema/flat-union-discriminator-bad-name.json b/tests/qapi-schema/union-discriminator-bad-name.json
similarity index 100%
rename from tests/qapi-schema/flat-union-discriminator-bad-name.json
rename to tests/qapi-schema/union-discriminator-bad-name.json
diff --git a/tests/qapi-schema/flat-union-discriminator-bad-name.out b/tests/qapi-schema/union-discriminator-bad-name.out
similarity index 100%
rename from tests/qapi-schema/flat-union-discriminator-bad-name.out
rename to tests/qapi-schema/union-discriminator-bad-name.out
diff --git a/tests/qapi-schema/union-empty.err b/tests/qapi-schema/union-empty.err
new file mode 100644
index 0000000000..d428439962
--- /dev/null
+++ b/tests/qapi-schema/union-empty.err
@@ -0,0 +1,2 @@
+union-empty.json: In union 'Union':
+union-empty.json:4: union has no branches
diff --git a/tests/qapi-schema/flat-union-empty.json b/tests/qapi-schema/union-empty.json
similarity index 100%
rename from tests/qapi-schema/flat-union-empty.json
rename to tests/qapi-schema/union-empty.json
diff --git a/tests/qapi-schema/flat-union-empty.out b/tests/qapi-schema/union-empty.out
similarity index 100%
rename from tests/qapi-schema/flat-union-empty.out
rename to tests/qapi-schema/union-empty.out
diff --git a/tests/qapi-schema/union-inline-invalid-dict.err b/tests/qapi-schema/union-inline-invalid-dict.err
new file mode 100644
index 0000000000..25ddf7c765
--- /dev/null
+++ b/tests/qapi-schema/union-inline-invalid-dict.err
@@ -0,0 +1,2 @@
+union-inline-invalid-dict.json: In union 'TestUnion':
+union-inline-invalid-dict.json:7: 'data' member 'value1' misses key 'type'
diff --git a/tests/qapi-schema/flat-union-inline-invalid-dict.json b/tests/qapi-schema/union-inline-invalid-dict.json
similarity index 100%
rename from tests/qapi-schema/flat-union-inline-invalid-dict.json
rename to tests/qapi-schema/union-inline-invalid-dict.json
diff --git a/tests/qapi-schema/flat-union-inline-invalid-dict.out b/tests/qapi-schema/union-inline-invalid-dict.out
similarity index 100%
rename from tests/qapi-schema/flat-union-inline-invalid-dict.out
rename to tests/qapi-schema/union-inline-invalid-dict.out
diff --git a/tests/qapi-schema/union-int-branch.err b/tests/qapi-schema/union-int-branch.err
new file mode 100644
index 0000000000..8fdc81edd1
--- /dev/null
+++ b/tests/qapi-schema/union-int-branch.err
@@ -0,0 +1,2 @@
+union-int-branch.json: In union 'TestUnion':
+union-int-branch.json:8: branch 'value1' cannot use built-in type 'int'
diff --git a/tests/qapi-schema/flat-union-int-branch.json b/tests/qapi-schema/union-int-branch.json
similarity index 100%
rename from tests/qapi-schema/flat-union-int-branch.json
rename to tests/qapi-schema/union-int-branch.json
diff --git a/tests/qapi-schema/flat-union-int-branch.out b/tests/qapi-schema/union-int-branch.out
similarity index 100%
rename from tests/qapi-schema/flat-union-int-branch.out
rename to tests/qapi-schema/union-int-branch.out
diff --git a/tests/qapi-schema/union-invalid-branch-key.err b/tests/qapi-schema/union-invalid-branch-key.err
new file mode 100644
index 0000000000..bf58800507
--- /dev/null
+++ b/tests/qapi-schema/union-invalid-branch-key.err
@@ -0,0 +1,2 @@
+union-invalid-branch-key.json: In union 'TestUnion':
+union-invalid-branch-key.json:13: branch 'value_wrong' is not a value of enum type 'TestEnum'
diff --git a/tests/qapi-schema/flat-union-invalid-branch-key.json b/tests/qapi-schema/union-invalid-branch-key.json
similarity index 100%
rename from tests/qapi-schema/flat-union-invalid-branch-key.json
rename to tests/qapi-schema/union-invalid-branch-key.json
diff --git a/tests/qapi-schema/flat-union-invalid-branch-key.out b/tests/qapi-schema/union-invalid-branch-key.out
similarity index 100%
rename from tests/qapi-schema/flat-union-invalid-branch-key.out
rename to tests/qapi-schema/union-invalid-branch-key.out
diff --git a/tests/qapi-schema/union-invalid-discriminator.err b/tests/qapi-schema/union-invalid-discriminator.err
new file mode 100644
index 0000000000..38efb24b98
--- /dev/null
+++ b/tests/qapi-schema/union-invalid-discriminator.err
@@ -0,0 +1,2 @@
+union-invalid-discriminator.json: In union 'TestUnion':
+union-invalid-discriminator.json:10: discriminator 'enum_wrong' is not a member of 'base'
diff --git a/tests/qapi-schema/flat-union-invalid-discriminator.json b/tests/qapi-schema/union-invalid-discriminator.json
similarity index 100%
rename from tests/qapi-schema/flat-union-invalid-discriminator.json
rename to tests/qapi-schema/union-invalid-discriminator.json
diff --git a/tests/qapi-schema/flat-union-invalid-discriminator.out b/tests/qapi-schema/union-invalid-discriminator.out
similarity index 100%
rename from tests/qapi-schema/flat-union-invalid-discriminator.out
rename to tests/qapi-schema/union-invalid-discriminator.out
diff --git a/tests/qapi-schema/union-invalid-if-discriminator.err b/tests/qapi-schema/union-invalid-if-discriminator.err
new file mode 100644
index 0000000000..3f41d03f8e
--- /dev/null
+++ b/tests/qapi-schema/union-invalid-if-discriminator.err
@@ -0,0 +1,2 @@
+union-invalid-if-discriminator.json: In union 'TestUnion':
+union-invalid-if-discriminator.json:10: discriminator member 'enum1' of 'base' must not be conditional
diff --git a/tests/qapi-schema/flat-union-invalid-if-discriminator.json b/tests/qapi-schema/union-invalid-if-discriminator.json
similarity index 100%
rename from tests/qapi-schema/flat-union-invalid-if-discriminator.json
rename to tests/qapi-schema/union-invalid-if-discriminator.json
diff --git a/tests/qapi-schema/flat-union-invalid-if-discriminator.out b/tests/qapi-schema/union-invalid-if-discriminator.out
similarity index 100%
rename from tests/qapi-schema/flat-union-invalid-if-discriminator.out
rename to tests/qapi-schema/union-invalid-if-discriminator.out
diff --git a/tests/qapi-schema/union-no-base.err b/tests/qapi-schema/union-no-base.err
new file mode 100644
index 0000000000..cbf12ac526
--- /dev/null
+++ b/tests/qapi-schema/union-no-base.err
@@ -0,0 +1,2 @@
+union-no-base.json: In union 'TestUnion':
+union-no-base.json:8: union misses key 'base'
diff --git a/tests/qapi-schema/flat-union-no-base.json b/tests/qapi-schema/union-no-base.json
similarity index 100%
rename from tests/qapi-schema/flat-union-no-base.json
rename to tests/qapi-schema/union-no-base.json
diff --git a/tests/qapi-schema/flat-union-no-base.out b/tests/qapi-schema/union-no-base.out
similarity index 100%
rename from tests/qapi-schema/flat-union-no-base.out
rename to tests/qapi-schema/union-no-base.out
diff --git a/tests/qapi-schema/union-optional-discriminator.err b/tests/qapi-schema/union-optional-discriminator.err
new file mode 100644
index 0000000000..8d980bd2ac
--- /dev/null
+++ b/tests/qapi-schema/union-optional-discriminator.err
@@ -0,0 +1,2 @@
+union-optional-discriminator.json: In union 'MyUnion':
+union-optional-discriminator.json:6: discriminator member 'switch' of base type 'Base' must not be optional
diff --git a/tests/qapi-schema/flat-union-optional-discriminator.json b/tests/qapi-schema/union-optional-discriminator.json
similarity index 100%
rename from tests/qapi-schema/flat-union-optional-discriminator.json
rename to tests/qapi-schema/union-optional-discriminator.json
diff --git a/tests/qapi-schema/flat-union-optional-discriminator.out b/tests/qapi-schema/union-optional-discriminator.out
similarity index 100%
rename from tests/qapi-schema/flat-union-optional-discriminator.out
rename to tests/qapi-schema/union-optional-discriminator.out
diff --git a/tests/qapi-schema/union-string-discriminator.err b/tests/qapi-schema/union-string-discriminator.err
new file mode 100644
index 0000000000..eccbe681bd
--- /dev/null
+++ b/tests/qapi-schema/union-string-discriminator.err
@@ -0,0 +1,2 @@
+union-string-discriminator.json: In union 'TestUnion':
+union-string-discriminator.json:13: discriminator member 'kind' of base type 'TestBase' must be of enum type
diff --git a/tests/qapi-schema/flat-union-string-discriminator.json b/tests/qapi-schema/union-string-discriminator.json
similarity index 100%
rename from tests/qapi-schema/flat-union-string-discriminator.json
rename to tests/qapi-schema/union-string-discriminator.json
diff --git a/tests/qapi-schema/flat-union-string-discriminator.out b/tests/qapi-schema/union-string-discriminator.out
similarity index 100%
rename from tests/qapi-schema/flat-union-string-discriminator.out
rename to tests/qapi-schema/union-string-discriminator.out
-- 
2.31.1


