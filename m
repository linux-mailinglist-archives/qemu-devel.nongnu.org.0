Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 442113E4AED
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 19:34:20 +0200 (CEST)
Received: from localhost ([::1]:38682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD9AI-0005S8-SL
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 13:34:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>) id 1mD98j-0004FK-5R
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 13:32:41 -0400
Received: from zamok.crans.org ([185.230.79.1]:33494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>) id 1mD98f-0001Pp-1H
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 13:32:40 -0400
Received: by zamok.crans.org (Postfix, from userid 11692)
 id DF377E00F1; Mon,  9 Aug 2021 19:32:25 +0200 (CEST)
From: Alexandre Iooss <erdnaxe@crans.org>
To: qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH] docs/devel: fix missing antislash
Date: Mon,  9 Aug 2021 19:31:41 +0200
Message-Id: <20210809173141.1714998-1-erdnaxe@crans.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=185.230.79.1; envelope-from=erdnaxe@crans.org;
 helo=zamok.crans.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Alexandre Iooss <erdnaxe@crans.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>
---
 docs/devel/qom.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
index e5fe3597cd..b9568c0fb8 100644
--- a/docs/devel/qom.rst
+++ b/docs/devel/qom.rst
@@ -309,7 +309,7 @@ This is equivalent to the following:
            OBJECT_GET_CLASS(MyDeviceClass, obj, TYPE_MY_DEVICE)
    #define MY_DEVICE_CLASS(void *klass) \
            OBJECT_CLASS_CHECK(MyDeviceClass, klass, TYPE_MY_DEVICE)
-   #define MY_DEVICE(void *obj)
+   #define MY_DEVICE(void *obj) \
            OBJECT_CHECK(MyDevice, obj, TYPE_MY_DEVICE)
 
    struct MyDeviceClass {
-- 
2.31.1


