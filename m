Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E210C255930
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Aug 2020 13:13:46 +0200 (CEST)
Received: from localhost ([::1]:57828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBcKH-0004ic-Ve
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 07:13:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kBcFe-0003sN-B9
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 07:08:58 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:48095
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kBcFc-0000Tl-HM
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 07:08:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598612935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D67rxr493mJ/+CrDQejHYaadXcG/Kd/ccjywrf2LIbs=;
 b=ZEXbZhTCfg0npfg82KO8oCdYkt8CcNssBhLhCQZWt7xoIcVzMfn2jhq5/jY2t9lnQ82Z8a
 j3xXJL3zCp1tr3ydoTaE8bdnIlR0krrkZtpBTjJ+XZIjgztOkBXIqEdIxRiTs2D2oYKm0p
 dUtMkd8xxtKj4+wJVsKQ71gWyptmLxI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-f_xT4PWgONipY9p6DLRxPQ-1; Fri, 28 Aug 2020 07:08:53 -0400
X-MC-Unique: f_xT4PWgONipY9p6DLRxPQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDAEC100746C
 for <qemu-devel@nongnu.org>; Fri, 28 Aug 2020 11:08:52 +0000 (UTC)
Received: from localhost (unknown [10.36.110.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B34119C59;
 Fri, 28 Aug 2020 11:08:48 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 08/16] meson: remove old socket_scm_helper rule
Date: Fri, 28 Aug 2020 15:07:26 +0400
Message-Id: <20200828110734.1638685-9-marcandre.lureau@redhat.com>
In-Reply-To: <20200828110734.1638685-1-marcandre.lureau@redhat.com>
References: <20200828110734.1638685-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=marcandre.lureau@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/28 00:28:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

It was covered already in commit d3ca592b3c10 ("meson: convert check-block")

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/Makefile.include | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index eea91772fa..2a6f29d1b5 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -66,7 +66,6 @@ tests/migration/initrd-stress.img: tests/migration/stress$(EXESUF)
 	rmdir $(INITRD_WORK_DIR)
 
 tests/vhost-user-bridge$(EXESUF): tests/vhost-user-bridge.o $(test-util-obj-y) libvhost-user.a
-tests/qemu-iotests/socket_scm_helper$(EXESUF): tests/qemu-iotests/socket_scm_helper.o
 
 SPEED = quick
 
-- 
2.26.2


