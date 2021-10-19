Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 403A54331CD
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 11:07:01 +0200 (CEST)
Received: from localhost ([::1]:55420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcl5I-0003Hk-D8
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 05:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mcl2Z-0000v7-Rw
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:04:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mcl2X-0006Ve-AG
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:04:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634634247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4nv7AXTh09QGlEnyMGAR5DJ9aoGOvs7/rWd9h2sq6p4=;
 b=anNItmUR50+n360WJttSlRXzC/jD4xxRjoDsHpe2hp5Zfz9HrDK43fo4dMmmusghRNca90
 Pd2MFX/ljJlhgf633kodKbqvF5p27tt+k7kwJqkYH85zgSYyWfRcus+Gc5RVvRYFtpTWDc
 o3mt/gpLZrFCMegaf2LBYjtFaXK37Dw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-54r5FwCjN7OUXfT7cEEstQ-1; Tue, 19 Oct 2021 05:04:04 -0400
X-MC-Unique: 54r5FwCjN7OUXfT7cEEstQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DD211006AAA;
 Tue, 19 Oct 2021 09:04:03 +0000 (UTC)
Received: from paraplu.home (unknown [10.39.194.235])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56E6970951;
 Tue, 19 Oct 2021 09:04:00 +0000 (UTC)
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/6] docs: rSTify the "SpellCheck" wiki
Date: Tue, 19 Oct 2021 11:03:40 +0200
Message-Id: <20211019090344.3054300-3-kchamart@redhat.com>
In-Reply-To: <20211019090344.3054300-1-kchamart@redhat.com>
References: <20211019090344.3054300-1-kchamart@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
 Kashyap Chamarthy <kchamart@redhat.com>, qemu-trivial@nongnu.org,
 Eric Blake <eblake@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The original wiki is here[1].  I converted by copying the wiki source
into a .wiki file and convert to rST using `pandoc`:

    $ pandoc -f Mediawiki -t rst spell-check.wiki -o spell-check.rst

As part of this rST converstion, I've removed the dated and `codespell`
invocations, and linked to the GitHub repo.  And cleaned up a couple of
external URLs.

[1] https://wiki.qemu.org/Contribute/SpellCheck

Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
---
 docs/devel/spell-check.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 docs/devel/spell-check.rst

diff --git a/docs/devel/spell-check.rst b/docs/devel/spell-check.rst
new file mode 100644
index 0000000000..61275b73c2
--- /dev/null
+++ b/docs/devel/spell-check.rst
@@ -0,0 +1,20 @@
+Spell Check
+===========
+
+QEMU uses British or American English in code and documentation. There
+are some typical spelling bugs which can be easily avoided by using
+tools like ``codespell``.
+
+`codespell <https://github.com/codespell-project/codespell>`__ is a
+Python script which detects (and optionally fixes) the most common
+spelling bugs.  It is packaged for most common Linux distributions.
+
+.. _external_links:
+
+External Links
+--------------
+
+- A spell-check tool for Emacs users:
+  https://github.com/stsquad/my-emacs-stuff/blob/master/my-spell.el
+- http://en.wikipedia.org/wiki/Wikipedia:Lists_of_common_misspellings/For_machines
+- http://grammar.yourdictionary.com/spelling-and-word-lists/misspelled.html
-- 
2.31.1


