Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 286F4419501
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 15:23:17 +0200 (CEST)
Received: from localhost ([::1]:52388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUqbE-0001xV-5E
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 09:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mUqLR-0003EY-UV
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:06:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mUqLP-0003iu-NB
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:06:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632748014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lp4u7r2A7P3yT/jiFyYPL7YraajVC9ADbzPQ7do3JKE=;
 b=Uf4bt/+rLhRGS04XtDVfrkw1X0QHthRwDINqTNPStogtVO5Ajnhpn7hpG16qUrw/it7E0N
 XrYjM8fo+SX9Pj0yBwPJKujM+0aK4jX7V72XAODJNAdsqC2AErKdSm4+KWVfoBjoTA7p/n
 Q702vzUmk9+eOBz5bjtzAf2fgP2Xlp0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-4p_hzfdWPBKRM5uh6Cs84g-1; Mon, 27 Sep 2021 09:06:53 -0400
X-MC-Unique: 4p_hzfdWPBKRM5uh6Cs84g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38FC283DBD1;
 Mon, 27 Sep 2021 13:06:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1A3F19729;
 Mon, 27 Sep 2021 13:06:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id AD55311380B7; Mon, 27 Sep 2021 15:06:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 16/25] tests/qapi-schema: Simple union UserDefListUnion is
 now unused, drop
Date: Mon, 27 Sep 2021 15:06:38 +0200
Message-Id: <20210927130647.1271533-17-armbru@redhat.com>
In-Reply-To: <20210927130647.1271533-1-armbru@redhat.com>
References: <20210927130647.1271533-1-armbru@redhat.com>
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
Cc: peter.maydell@linaro.org, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20210917143134.412106-17-armbru@redhat.com>
---
 tests/qapi-schema/qapi-schema-test.json | 17 -------
 tests/qapi-schema/qapi-schema-test.out  | 64 -------------------------
 2 files changed, 81 deletions(-)

diff --git a/tests/qapi-schema/qapi-schema-test.json b/tests/qapi-schema/qapi-schema-test.json
index a4b4405f94..eae43f41c4 100644
--- a/tests/qapi-schema/qapi-schema-test.json
+++ b/tests/qapi-schema/qapi-schema-test.json
@@ -123,23 +123,6 @@
 # for testing use of 'str' within alternates
 { 'alternate': 'AltStrObj', 'data': { 's': 'str', 'o': 'TestStruct' } }
 
-# for testing lists
-{ 'union': 'UserDefListUnion',
-  'data': { 'integer': ['int'],
-            's8': ['int8'],
-            's16': ['int16'],
-            's32': ['int32'],
-            's64': ['int64'],
-            'u8': ['uint8'],
-            'u16': ['uint16'],
-            'u32': ['uint32'],
-            'u64': ['uint64'],
-            'number': ['number'],
-            'boolean': ['bool'],
-            'string': ['str'],
-            'sizes': ['size'],
-            'any': ['any'],
-            'user': ['Status'] } } # intentional forward ref. to sub-module
 { 'struct': 'ArrayStruct',
   'data': { 'integer': ['int'],
             's8': ['int8'],
diff --git a/tests/qapi-schema/qapi-schema-test.out b/tests/qapi-schema/qapi-schema-test.out
index f120f10616..e43073d795 100644
--- a/tests/qapi-schema/qapi-schema-test.out
+++ b/tests/qapi-schema/qapi-schema-test.out
@@ -125,70 +125,6 @@ alternate AltStrObj
     tag type
     case s: str
     case o: TestStruct
-object q_obj_intList-wrapper
-    member data: intList optional=False
-object q_obj_int8List-wrapper
-    member data: int8List optional=False
-object q_obj_int16List-wrapper
-    member data: int16List optional=False
-object q_obj_int32List-wrapper
-    member data: int32List optional=False
-object q_obj_int64List-wrapper
-    member data: int64List optional=False
-object q_obj_uint8List-wrapper
-    member data: uint8List optional=False
-object q_obj_uint16List-wrapper
-    member data: uint16List optional=False
-object q_obj_uint32List-wrapper
-    member data: uint32List optional=False
-object q_obj_uint64List-wrapper
-    member data: uint64List optional=False
-object q_obj_numberList-wrapper
-    member data: numberList optional=False
-object q_obj_boolList-wrapper
-    member data: boolList optional=False
-object q_obj_strList-wrapper
-    member data: strList optional=False
-object q_obj_sizeList-wrapper
-    member data: sizeList optional=False
-object q_obj_anyList-wrapper
-    member data: anyList optional=False
-object q_obj_StatusList-wrapper
-    member data: StatusList optional=False
-enum UserDefListUnionKind
-    member integer
-    member s8
-    member s16
-    member s32
-    member s64
-    member u8
-    member u16
-    member u32
-    member u64
-    member number
-    member boolean
-    member string
-    member sizes
-    member any
-    member user
-object UserDefListUnion
-    member type: UserDefListUnionKind optional=False
-    tag type
-    case integer: q_obj_intList-wrapper
-    case s8: q_obj_int8List-wrapper
-    case s16: q_obj_int16List-wrapper
-    case s32: q_obj_int32List-wrapper
-    case s64: q_obj_int64List-wrapper
-    case u8: q_obj_uint8List-wrapper
-    case u16: q_obj_uint16List-wrapper
-    case u32: q_obj_uint32List-wrapper
-    case u64: q_obj_uint64List-wrapper
-    case number: q_obj_numberList-wrapper
-    case boolean: q_obj_boolList-wrapper
-    case string: q_obj_strList-wrapper
-    case sizes: q_obj_sizeList-wrapper
-    case any: q_obj_anyList-wrapper
-    case user: q_obj_StatusList-wrapper
 object ArrayStruct
     member integer: intList optional=False
     member s8: int8List optional=False
-- 
2.31.1


