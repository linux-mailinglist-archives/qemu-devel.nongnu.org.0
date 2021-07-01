Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFA53B8C0C
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 04:18:20 +0200 (CEST)
Received: from localhost ([::1]:58050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lymHU-0001uW-1H
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 22:18:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lym9R-0008VN-MV
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 22:10:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lym9N-0006Bt-D4
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 22:10:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625105396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Smo8ALxPouKm2i+JZ+4P2mN13++gc5UXsKWjDIv7YmU=;
 b=IEDhj76fev4Qc2kyBvhpr/DEYOHR2cQ48ahm2wSe1ntSePzPyjuWLGh2hLb8tt6njk9D44
 +0Od+DKwhR2elq/Xo6zgCk9s4gPCgZX0Zu3q7CTxkjY3OOG0C3yT62S6buk6ymNv7cs6SJ
 REMFkrpydXislUq5+Cb/UOBvr/lyJjE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-6AFp5bIRPMmP6-07PbS3AA-1; Wed, 30 Jun 2021 22:09:55 -0400
X-MC-Unique: 6AFp5bIRPMmP6-07PbS3AA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 018A1362FC;
 Thu,  1 Jul 2021 02:09:54 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB9005FC03;
 Thu,  1 Jul 2021 02:09:52 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/15] python: Update help text on 'make check', 'make develop'
Date: Wed, 30 Jun 2021 22:09:18 -0400
Message-Id: <20210701020921.1679468-13-jsnow@redhat.com>
In-Reply-To: <20210701020921.1679468-1-jsnow@redhat.com>
References: <20210701020921.1679468-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update for visual parity with the other targets.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-id: 20210629214323.1329806-13-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/Makefile | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/python/Makefile b/python/Makefile
index 8f8e1999c0..a14705d12e 100644
--- a/python/Makefile
+++ b/python/Makefile
@@ -21,10 +21,14 @@ help:
 	@echo "    These tests use the newest dependencies."
 	@echo "    Requires: Python 3.x"
 	@echo ""
-	@echo "make develop:    Install deps for 'make check', and"
-	@echo "                 the qemu libs in editable/development mode."
+	@echo "make check:"
+	@echo "    Run tests in your *current environment*."
+	@echo "    Performs no environment setup of any kind."
 	@echo ""
-	@echo "make check:      run linters using the current environment."
+	@echo "make develop:"
+	@echo "    Install deps needed for for 'make check',"
+	@echo "    and install the qemu package in editable mode."
+	@echo "    (Can be used in or outside of a venv.)"
 	@echo ""
 	@echo "make pipenv"
 	@echo "    Creates pipenv's virtual environment (.venv)"
-- 
2.31.1


