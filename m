Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF01476473
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 22:19:33 +0100 (CET)
Received: from localhost ([::1]:56146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxbgS-0004mq-Qa
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 16:19:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxbXI-0004u7-SK
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:10:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxbXH-0006ix-8F
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:10:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639602602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vfIfUfLvs3S9h7ecQs5roPlFRdW+bHgCpGmYyRdjUyA=;
 b=Z6prGYywk1xsNTWagpOj54rXIvywOy5v6gFp6FWv6pbFIsWEazjqnAXtP6KecM33/LaVcV
 9u4jPIeWFjIFikS2rdHeMcEg751XtGUjgXeOLNFKLaDVyD4mnBpRzOMuorF+HWBGT31Lpb
 u728kpVtq7FETP6LmEqrRjx3qCP4UpU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-96dMcjXJMrCSL6XADDpb_Q-1; Wed, 15 Dec 2021 16:09:59 -0500
X-MC-Unique: 96dMcjXJMrCSL6XADDpb_Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4189E92532;
 Wed, 15 Dec 2021 21:09:58 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5AA6E5BE35;
 Wed, 15 Dec 2021 21:09:57 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC qemu.qmp PATCH 17/24] Makefile: add build and publish targets
Date: Wed, 15 Dec 2021 16:06:27 -0500
Message-Id: <20211215210634.3779791-18-jsnow@redhat.com>
In-Reply-To: <20211215210634.3779791-1-jsnow@redhat.com>
References: <20211215210634.3779791-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>
---
 Makefile | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Makefile b/Makefile
index 97d737a..81bfca8 100644
--- a/Makefile
+++ b/Makefile
@@ -110,3 +110,35 @@ distclean: clean
 	rm -f .coverage .coverage.*
 	rm -rf htmlcov/
 	rm -rf test-results/
+
+.PHONY: pristine
+pristine:
+	@git diff-files --quiet --ignore-submodules -- || \
+		(echo "You have unstaged changes."; exit 1)
+	@git diff-index --cached --quiet HEAD --ignore-submodules -- || \
+		(echo "Your index contains uncommitted changes."; exit 1)
+	@[ -z "$(shell git ls-files -o)" ] || \
+		(echo "You have untracked files: $(shell git ls-files -o)"; exit 1)
+
+dist: setup.cfg setup.py Makefile README.rst
+	python3 -m build
+	@touch dist
+
+.PHONY: pre-publish
+pre-publish: pristine dist
+	@git describe --exact-match 2>/dev/null || \
+		(echo -e "\033[0;31mThere is no annotated tag for this commit.\033[0m"; exit 1)
+	python3 -m twine check --strict dist/*
+	git push -v --atomic --follow-tags --dry-run
+
+.PHONY: publish
+publish: pre-publish
+	# Set the username via TWINE_USERNAME.
+	# Set the password via TWINE_PASSWORD.
+	# Set the pkg repository via TWINE_REPOSITORY.
+	python3 -m twine upload --verbose dist/*
+	git push -v --atomic --follow-tags
+
+.PHONY: publish-test
+publish-test: pre-publish
+	python3 -m twine upload --verbose -r testpypi dist/*
-- 
2.31.1


