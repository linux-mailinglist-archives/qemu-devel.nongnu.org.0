Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F6B31F076
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 20:54:15 +0100 (CET)
Received: from localhost ([::1]:54096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCpNO-0001MY-V1
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 14:54:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lCoym-0003RF-AG
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 14:28:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lCoyj-0003pN-NX
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 14:28:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613676525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8nrmbBXj6FDogwE0Ur8lSKvcU461oLv26GXq1Yit3y8=;
 b=PIJOZ7m90AOjSzzlFLBzyFnFba0D0WkqhCkrxGodZYICncIVUvDDWeKyKgsLnk1pkziVqd
 wNxj1G+jk4Yb/RuLc2/w82TQzF7GYyW+cIBlC7q/xzh7oHF2pC3VlLSBkFy9DYy3+jM5fl
 KflGBL762nZC8VwX3gHnkkdIhZexz9E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-I8wgQ0r8Pq2GLcnl9fnvvg-1; Thu, 18 Feb 2021 14:28:43 -0500
X-MC-Unique: I8wgQ0r8Pq2GLcnl9fnvvg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0561318A2AE2;
 Thu, 18 Feb 2021 19:28:42 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7AE160BE5;
 Thu, 18 Feb 2021 19:28:40 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 25/25] python: add 'make develop' target
Date: Thu, 18 Feb 2021 14:27:33 -0500
Message-Id: <20210218192733.370968-26-jsnow@redhat.com>
In-Reply-To: <20210218192733.370968-1-jsnow@redhat.com>
References: <20210218192733.370968-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a shortcut that canonizes the runes needed to get both the
linting pre-requisites (the "[devel]" part), and the editable
live-install (the "-e" part) of these python libraries.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/Makefile | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/python/Makefile b/python/Makefile
index 47940846400..2699b77b072 100644
--- a/python/Makefile
+++ b/python/Makefile
@@ -1,4 +1,4 @@
-.PHONY: help venv venv-check check clean distclean
+.PHONY: help venv venv-check check clean distclean develop
 
 help:
 	@echo "python packaging help:"
@@ -11,8 +11,10 @@ help:
 	@echo "make venv-check: run linters using pipenv's virtual environment."
 	@echo "    Hint: If you don't know which test to run, run this one!"
 	@echo ""
+	@echo "make develop:    Install deps for 'make check', and"
+	@echo "                 the qemu libs in editable/development mode."
+	@echo ""
 	@echo "make check:      run linters using the current environment."
-	@echo "    Hint: Install deps with: 'pip install \".[devel]\"'"
 	@echo ""
 	@echo "make clean:      remove build output."
 	@echo ""
@@ -27,6 +29,9 @@ venv: .venv
 venv-check: venv
 	@pipenv run make check
 
+develop:
+	pip3 install -e .[devel]
+
 check:
 	@pytest
 
-- 
2.29.2


