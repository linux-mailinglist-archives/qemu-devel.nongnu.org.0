Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A22772600E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 11:03:23 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38803 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTN9e-0006az-TY
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 05:03:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38235)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hTN6q-0004mw-4K
	for qemu-devel@nongnu.org; Wed, 22 May 2019 05:00:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hTN6k-0003l1-1T
	for qemu-devel@nongnu.org; Wed, 22 May 2019 05:00:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:12923)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hTN6i-0003ff-31
	for qemu-devel@nongnu.org; Wed, 22 May 2019 05:00:21 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DF118C09AD18
	for <qemu-devel@nongnu.org>; Wed, 22 May 2019 09:00:17 +0000 (UTC)
Received: from donizetti.mxp.redhat.com (unknown [10.32.181.147])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 648621753C
	for <qemu-devel@nongnu.org>; Wed, 22 May 2019 09:00:17 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 22 May 2019 11:00:17 +0200
Message-Id: <20190522090017.27007-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 22 May 2019 09:00:17 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] tests/vm: default to using a snapshot
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will allow running the tests in Patchew, which has two runners
that might choose concurrently the same VM build for two different
series.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/vm/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/vm/Makefile.include b/tests/vm/Makefile.include
index 992d823f6b..ae5dbdad6c 100644
--- a/tests/vm/Makefile.include
+++ b/tests/vm/Makefile.include
@@ -51,7 +51,7 @@ vm-build-%: $(IMAGES_DIR)/%.img
 		$(if $(DEBUG), --interactive) \
 		$(if $(J),--jobs $(J)) \
 		$(if $(V),--verbose) \
-		--image "$<" \
+		--image "$<" --snapshot \
 		$(if $(BUILD_TARGET),--build-target $(BUILD_TARGET)) \
 		--build-qemu $(SRC_PATH) -- \
 		$(if $(TARGET_LIST),--target-list=3D$(TARGET_LIST)) \
--=20
2.21.0


