Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1669182752
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Aug 2019 00:09:55 +0200 (CEST)
Received: from localhost ([::1]:57252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hulAv-0004jG-R5
	for lists+qemu-devel@lfdr.de; Mon, 05 Aug 2019 18:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46542)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hulA9-0004KU-Uf
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 18:09:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hulA9-0006ax-3A
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 18:09:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55490)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hulA8-0006YQ-Tr
 for qemu-devel@nongnu.org; Mon, 05 Aug 2019 18:09:05 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EABE4315C03B
 for <qemu-devel@nongnu.org>; Mon,  5 Aug 2019 22:09:03 +0000 (UTC)
Received: from 640k.localdomain.com (ovpn-112-61.ams2.redhat.com
 [10.36.112.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A8E65D6D0
 for <qemu-devel@nongnu.org>; Mon,  5 Aug 2019 22:09:02 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  6 Aug 2019 00:09:00 +0200
Message-Id: <1565042940-8837-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Mon, 05 Aug 2019 22:09:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] Makefile: remove unused variables
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Makefile b/Makefile
index 73fbba0..7b0e2f4 100644
--- a/Makefile
+++ b/Makefile
@@ -429,10 +429,6 @@ dummy := $(call unnest-vars,, \
                 io-obj-y \
                 common-obj-y \
                 common-obj-m \
-                ui-obj-y \
-                ui-obj-m \
-                audio-obj-y \
-                audio-obj-m \
                 trace-obj-y)
 
 include $(SRC_PATH)/tests/Makefile.include
-- 
1.8.3.1


