Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F39D2E34BD
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Dec 2020 08:30:09 +0100 (CET)
Received: from localhost ([::1]:46546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ktmym-0001zu-HY
	for lists+qemu-devel@lfdr.de; Mon, 28 Dec 2020 02:30:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1ktmvZ-0000FC-7y; Mon, 28 Dec 2020 02:26:49 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1ktmvI-0007jr-C5; Mon, 28 Dec 2020 02:26:48 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4D48GF6Bwtz15kqJ;
 Mon, 28 Dec 2020 15:25:25 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.498.0; Mon, 28 Dec 2020
 15:26:07 +0800
From: Zhang Han <zhanghan64@huawei.com>
To: <armbru@redhat.com>
Subject: [PATCH 1/4] qobject: open brace '{' following struct go on the same
 line
Date: Mon, 28 Dec 2020 15:11:26 +0800
Message-ID: <20201228071129.24563-2-zhanghan64@huawei.com>
X-Mailer: git-send-email 2.29.1.59.gf9b6481aed
In-Reply-To: <20201228071129.24563-1-zhanghan64@huawei.com>
References: <20201228071129.24563-1-zhanghan64@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhanghan64@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: alex.chen@huawei.com, hunongda@huawei.com, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Put open brace '{' on the same line of struct.

Signed-off-by: Zhang Han <zhanghan64@huawei.com>
---
 qobject/json-parser.c | 3 +--
 qobject/qjson.c       | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/qobject/json-parser.c b/qobject/json-parser.c
index c0f521b56b..18b87a42f3 100644
--- a/qobject/json-parser.c
+++ b/qobject/json-parser.c
@@ -31,8 +31,7 @@ struct JSONToken {
     char str[];
 };
 
-typedef struct JSONParserContext
-{
+typedef struct JSONParserContext {
     Error *err;
     JSONToken *current;
     GQueue *buf;
diff --git a/qobject/qjson.c b/qobject/qjson.c
index f1f2c69704..f5623081e3 100644
--- a/qobject/qjson.c
+++ b/qobject/qjson.c
@@ -22,8 +22,7 @@
 #include "qapi/qmp/qstring.h"
 #include "qemu/unicode.h"
 
-typedef struct JSONParsingState
-{
+typedef struct JSONParsingState {
     JSONMessageParser parser;
     QObject *result;
     Error *err;
-- 
2.29.1.59.gf9b6481aed


