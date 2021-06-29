Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A66B83B76B4
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 18:52:26 +0200 (CEST)
Received: from localhost ([::1]:39172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyGyH-0001DI-MQ
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 12:52:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyGpg-00047T-QP
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 12:43:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyGpe-0006Kq-Mh
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 12:43:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624985010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=92qzPqyeZxwtA40V6eCHlM+udM+TZ2EGgvF59F9Jk2c=;
 b=gXBpv8Rk1VRuc07gPQLcJO70TbZ7NixNvitC845e3qiBpg8tHd4yNq81FWQVRZixmGwvaH
 UFnkyEi3tAwcJO+cSz9PJR89+mmd8mxKB6yWxbNHcYHvlvWX30iwQOrb29GjzWeU2zT15O
 6JgqS1Rp+MENt1Vtfc0tXRCjz7+BlNE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-FshcrvASMlKxW5xq4sJI2A-1; Tue, 29 Jun 2021 12:43:28 -0400
X-MC-Unique: FshcrvASMlKxW5xq4sJI2A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B80301018721;
 Tue, 29 Jun 2021 16:43:27 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE0F4E710;
 Tue, 29 Jun 2021 16:43:26 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/12] python: Update help text on 'make clean',
 'make distclean'
Date: Tue, 29 Jun 2021 12:42:52 -0400
Message-Id: <20210629164253.1272763-12-jsnow@redhat.com>
In-Reply-To: <20210629164253.1272763-1-jsnow@redhat.com>
References: <20210629164253.1272763-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update for visual parity with all the remaining targets.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 python/Makefile | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/python/Makefile b/python/Makefile
index a14705d12e..0432ee0022 100644
--- a/python/Makefile
+++ b/python/Makefile
@@ -36,11 +36,14 @@ help:
 	@echo "make dev-venv"
 	@echo "    Creates a simple venv for check-dev. ($(QEMU_VENV_DIR))"
 	@echo ""
-	@echo "make clean:      remove package build output."
+	@echo "make clean:"
+	@echo "    Remove package build output."
 	@echo ""
-	@echo "make distclean:  remove venv files, qemu package forwarder,"
-	@echo "                 built distribution files, and everything"
-	@echo "                 from 'make clean'."
+	@echo "make distclean:"
+	@echo "    remove pipenv/venv files, qemu package forwarder,"
+	@echo "    built distribution files, and everything from 'make clean'."
+	@echo ""
+	@echo -e "Have a nice day ^_^\n"
 
 .PHONY: pipenv
 pipenv: .venv
-- 
2.31.1


