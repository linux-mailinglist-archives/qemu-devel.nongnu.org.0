Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D78F8414891
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 14:14:49 +0200 (CEST)
Received: from localhost ([::1]:35040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT19E-0000Hp-Fn
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 08:14:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mT15q-00061Z-FZ
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 08:11:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mT15j-0007lR-8r
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 08:11:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632312669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7pUbr3o8xQLvjnDfh5wobTnZ+A+DhW12hQ8aKOSyucM=;
 b=d4AcfcgvqS90uPbtxtGzMsAKD0fiAjl+ywXOlwGF0zt4DUvBO45W6bw8lzknI1k6NUFNWD
 TJDzBg7NZMBNHq3+kU5CHTR2VweqyhhGT2fKm2g7mFUDj5cBIDpb++9/FBLN3Zs3QBnq2e
 Ck2IHMM9GLkyyCHgZ4UYN9jF5b6GLHc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-k1pO2nRrObKvmolrJ_HZQA-1; Wed, 22 Sep 2021 08:11:05 -0400
X-MC-Unique: k1pO2nRrObKvmolrJ_HZQA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1C51100C667;
 Wed, 22 Sep 2021 12:11:03 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.205])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C23F17AE2;
 Wed, 22 Sep 2021 12:11:01 +0000 (UTC)
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] docs: rSTify the "SpellCheck" wiki
Date: Wed, 22 Sep 2021 14:10:52 +0200
Message-Id: <20210922121054.1458051-2-kchamart@redhat.com>
In-Reply-To: <20210922121054.1458051-1-kchamart@redhat.com>
References: <20210922121054.1458051-1-kchamart@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, John Snow <jsnow@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The original wiki is here[1].  I converted by copying the wiki source[2]
into a .wiki file and convert to rST using `pandoc`:

    $ pandoc -f Mediawiki -t rst spell-check.wiki -o spell-check.rst

[1] https://wiki.qemu.org/Contribute/SpellCheck
[2] https://web.archive.org/web/20170721031029/http://wiki.qemu.org/index.php?title=Contribute/SubmitAPatch&action=edit

Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
---
 docs/devel/spell-check.rst | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 docs/devel/spell-check.rst

diff --git a/docs/devel/spell-check.rst b/docs/devel/spell-check.rst
new file mode 100644
index 0000000000..998cd7ef51
--- /dev/null
+++ b/docs/devel/spell-check.rst
@@ -0,0 +1,29 @@
+===========
+Spell Check
+===========
+
+QEMU uses British or American English in code and documentation. There
+are some typical spelling bugs which can be easily avoided by using
+tools like codespell.
+
+codespell is a python script which detects (and optionally fixes) the
+most common spelling bugs.
+
+If you installed codespell in your HOME directory, it can be called from
+the QEMU source directory like this::
+
+    ~/bin/codespell.py -d -r -s -x scripts/codespell.exclude -q 2 ~/share/codespell/dictionary.txt
+
+``-x scripts/codespell.exclude`` excludes some known lines from the check
+and needs a file which is not yet committed.
+
+.. _external_links:
+
+External Links
+--------------
+
+-  http://packages.profusion.mobi/codespell/ (download)
+-  http://git.profusion.mobi/cgit.cgi/lucas/codespell/ (git repository)
+-  https://github.com/lucasdemarchi/codespell (alternate git repository)
+-  http://en.wikipedia.org/wiki/Wikipedia:Lists_of_common_misspellings/For_machines
+-  http://grammar.yourdictionary.com/spelling-and-word-lists/misspelled.html
-- 
2.31.1


