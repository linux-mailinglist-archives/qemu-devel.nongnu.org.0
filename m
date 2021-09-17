Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 563EE40FA7C
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 16:41:12 +0200 (CEST)
Received: from localhost ([::1]:48934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRF39-0004DO-CX
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 10:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mREu3-000444-6M
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:31:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mREty-0000EG-7v
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 10:31:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631889101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=17wRclF11hvTLVvRuKUmdUf2ohqnlPWctpNPTn491xs=;
 b=di5kPCGisop7q6k/vFqMY3mPnV9PSC0TBqbXFi9Cr5YsRuJ65FexoYwooWPJML7iJCfl/t
 jR9Ej18nYCxsSThaOrkmlAEa5ROWLGCux1o5FNoVvNuMTqrVWDY/Bytv4COR/mu8BEFqsw
 Fzu0bnliN6TtSVY1TJD24/6cB6Cc/qg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-DWn2_YXANDq6aupVQMFrqA-1; Fri, 17 Sep 2021 10:31:40 -0400
X-MC-Unique: DWn2_YXANDq6aupVQMFrqA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B683802934;
 Fri, 17 Sep 2021 14:31:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B05A60583;
 Fri, 17 Sep 2021 14:31:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8D6DC11380B7; Fri, 17 Sep 2021 16:31:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/23] tests/qapi-schema: Simple union UserDefListUnion is
 now unused, drop
Date: Fri, 17 Sep 2021 16:31:27 +0200
Message-Id: <20210917143134.412106-17-armbru@redhat.com>
In-Reply-To: <20210917143134.412106-1-armbru@redhat.com>
References: <20210917143134.412106-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: jsnow@redhat.com, michael.roth@amd.com, eblake@redhat.com,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
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


