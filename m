Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48930673968
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 14:05:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIUal-0003dq-Sv; Thu, 19 Jan 2023 08:04:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIUa1-0003M7-Lf
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:03:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pIUZs-0003pO-Qk
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 08:03:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674133414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pcnXCrIEO4ykvZN4gaikHQ1CzwNuHPIrvoRcgyRtgdA=;
 b=HLwuby56U2wZp79pOtQSTN3umgiMlOycc/ravn4NJ4hJzdnxbOP2ALmwI8qNr78V8VRckz
 qHEXsBzUZ0B8hLkH+pnU8VvX8wErTeCuwa+BcCMw9ozGlfZnGAdRNWFjQ6doOpjEU4k+Cw
 x0X22Lw3fY5+scO/Nq4B/zBMcgD83To=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-bpSGbKQGO-SK52bnZml8cg-1; Thu, 19 Jan 2023 08:03:29 -0500
X-MC-Unique: bpSGbKQGO-SK52bnZml8cg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DFFC8100F903;
 Thu, 19 Jan 2023 13:03:28 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BFF67492B02;
 Thu, 19 Jan 2023 13:03:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] MAINTAINERS: Fix the entry for tests/tcg/nios2
Date: Thu, 19 Jan 2023 14:03:26 +0100
Message-Id: <20230119130326.2030297-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

tests/tcg/nios2/Makefile.target has accidentally been added
to the Microblaze section. Move it into the correct nios2
section instead - and while we're at it, it should also cover
the whole folder, and not only the Makefile.

Fixes: 67f80eb4d0 ("tests/tcg: enable debian-nios2-cross for test building")
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 08ad1e5341..e73b04194a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -240,7 +240,6 @@ F: target/microblaze/
 F: hw/microblaze/
 F: disas/microblaze.c
 F: tests/docker/dockerfiles/debian-microblaze-cross.d/build-toolchain.sh
-F: tests/tcg/nios2/Makefile.target
 
 MIPS TCG CPUs
 M: Philippe Mathieu-Daudé <philmd@linaro.org>
@@ -262,6 +261,7 @@ F: hw/nios2/
 F: disas/nios2.c
 F: configs/devices/nios2-softmmu/default.mak
 F: tests/docker/dockerfiles/debian-nios2-cross.d/build-toolchain.sh
+F: tests/tcg/nios2/
 
 OpenRISC TCG CPUs
 M: Stafford Horne <shorne@gmail.com>
-- 
2.31.1


