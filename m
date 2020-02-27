Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C41817117E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 08:32:51 +0100 (CET)
Received: from localhost ([::1]:54792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7Df8-00027k-IF
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 02:32:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42235)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1j7DcY-0000Fx-2g
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 02:30:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dplotnikov@virtuozzo.com>) id 1j7DcU-000090-W3
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 02:30:08 -0500
Received: from relay.sw.ru ([185.231.240.75]:33952)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dplotnikov@virtuozzo.com>)
 id 1j7DcU-00005Y-1T; Thu, 27 Feb 2020 02:30:06 -0500
Received: from dptest2.qa.sw.ru ([10.94.4.71])
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <dplotnikov@virtuozzo.com>)
 id 1j7DcP-0003Tx-4j; Thu, 27 Feb 2020 10:30:01 +0300
From: Denis Plotnikov <dplotnikov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 7/8] iotests: 080: update header size value because of
 adding compression type
Date: Thu, 27 Feb 2020 10:29:52 +0300
Message-Id: <20200227072953.25445-8-dplotnikov@virtuozzo.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20200227072953.25445-1-dplotnikov@virtuozzo.com>
References: <20200227072953.25445-1-dplotnikov@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 den@vrtuozzo.com, armbru@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
---
 tests/qemu-iotests/080 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/080 b/tests/qemu-iotests/080
index a3d13c414e..7588c63b6c 100755
--- a/tests/qemu-iotests/080
+++ b/tests/qemu-iotests/080
@@ -45,7 +45,7 @@ _supported_os Linux
 # - This is generally a test for compat=1.1 images
 _unsupported_imgopts 'refcount_bits=1[^0-9]' data_file 'compat=0.10'
 
-header_size=104
+header_size=112
 
 offset_backing_file_offset=8
 offset_backing_file_size=16
-- 
2.17.0


