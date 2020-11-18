Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE3C2B8003
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 16:03:06 +0100 (CET)
Received: from localhost ([::1]:41996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfOzC-0006eT-0E
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 10:03:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aiyutao@huawei.com>)
 id 1kfHPk-0000A3-5J
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 01:58:00 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aiyutao@huawei.com>)
 id 1kfHPh-0000Ob-II
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 01:57:59 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CbYXS5MsRz15N7P;
 Wed, 18 Nov 2020 14:57:28 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Wed, 18 Nov 2020
 14:57:36 +0800
From: Yutao Ai <aiyutao@huawei.com>
To: <pbonzini@redhat.com>, <berrange@redhat.com>, <ehabkost@redhat.com>
Subject: [PATCH 1/2] qom:open brace '{' following struct go on the same line
Date: Wed, 18 Nov 2020 06:45:57 +0000
Message-ID: <20201118064558.92658-2-aiyutao@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20201118064558.92658-1-aiyutao@huawei.com>
References: <20201118064558.92658-1-aiyutao@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=aiyutao@huawei.com;
 helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 01:57:44
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 18 Nov 2020 10:01:08 -0500
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
Cc: alex.chen@huawei.com, aiyutao@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the open brace '{' following struct go on the same line

Signed-off-by: Yutao Ai <aiyutao@huawei.com>
---
 qom/object.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/qom/object.c b/qom/object.c
index 1065355233..0cd2161012 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -38,13 +38,11 @@
 typedef struct InterfaceImpl InterfaceImpl;
 typedef struct TypeImpl TypeImpl;
 
-struct InterfaceImpl
-{
+struct InterfaceImpl {
     const char *typename;
 };
 
-struct TypeImpl
-{
+struct TypeImpl {
     const char *name;
 
     size_t class_size;
@@ -1048,8 +1046,7 @@ ObjectClass *object_class_get_parent(ObjectClass *class)
     return type->class;
 }
 
-typedef struct OCFData
-{
+typedef struct OCFData {
     void (*fn)(ObjectClass *klass, void *opaque);
     const char *implements_type;
     bool include_abstract;
@@ -2137,8 +2134,7 @@ Object *object_resolve_path(const char *path, bool *ambiguous)
     return object_resolve_path_type(path, TYPE_OBJECT, ambiguous);
 }
 
-typedef struct StringProperty
-{
+typedef struct StringProperty {
     char *(*get)(Object *, Error **);
     void (*set)(Object *, const char *, Error **);
 } StringProperty;
@@ -2216,8 +2212,7 @@ object_class_property_add_str(ObjectClass *klass, const char *name,
                                      prop);
 }
 
-typedef struct BoolProperty
-{
+typedef struct BoolProperty {
     bool (*get)(Object *, Error **);
     void (*set)(Object *, bool, Error **);
 } BoolProperty;
-- 
2.19.1


