Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB65D443622
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 19:54:56 +0100 (CET)
Received: from localhost ([::1]:44252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhyvv-0000CJ-QY
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 14:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mhynW-0004Na-Fd
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:46:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mhynU-0004Gw-9W
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:46:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635878771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i2KW2wCuNVxgmC1cz78ZXb1YV27huKZjMrxsF06sZME=;
 b=KQ5YbZte31JuzCXWLVQM7vMcsoBWJREoF3iW+8e650+meCBlhkp2+OaS2Ty2wcBXjQABbr
 raPGawXoFdT9KzmcOh8T+KFur8r8Ubwb++pQ6wtdQJYNaj41RBDAE0Ifzk8Ym+oERW1K1/
 waWZRpb3DPSZUAnPemoEvOxO47ncD4k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-LlDw0qBWPHmxS8pi1BI-Hw-1; Tue, 02 Nov 2021 14:46:08 -0400
X-MC-Unique: LlDw0qBWPHmxS8pi1BI-Hw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24D5D872FF7;
 Tue,  2 Nov 2021 18:46:07 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76A1F19C79;
 Tue,  2 Nov 2021 18:45:42 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 3/4] docs: (further further) remove non-reference uses of
 single backticks
Date: Tue,  2 Nov 2021 14:43:59 -0400
Message-Id: <20211102184400.1168508-4-jsnow@redhat.com>
In-Reply-To: <20211102184400.1168508-1-jsnow@redhat.com>
References: <20211102184400.1168508-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Alexander Bulekov <alxndr@bu.edu>, Eric Blake <eblake@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>
---
 docs/devel/build-system.rst | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
index 7f106d2f1c..48e56d7ea9 100644
--- a/docs/devel/build-system.rst
+++ b/docs/devel/build-system.rst
@@ -47,16 +47,17 @@ command line options for which a same-named Meson option exists;
 dashes in the command line are replaced with underscores.
 
 Many checks on the compilation environment are still found in configure
-rather than `meson.build`, but new checks should be added directly to
-`meson.build`.
+rather than ``meson.build``, but new checks should be added directly to
+``meson.build``.
 
 Patches are also welcome to move existing checks from the configure
-phase to `meson.build`.  When doing so, ensure that `meson.build` does
-not use anymore the keys that you have removed from `config-host.mak`.
-Typically these will be replaced in `meson.build` by boolean variables,
-``get_option('optname')`` invocations, or `dep.found()` expressions.
-In general, the remaining checks have little or no interdependencies,
-so they can be moved one by one.
+phase to ``meson.build``.  When doing so, ensure that ``meson.build``
+does not use anymore the keys that you have removed from
+``config-host.mak``.  Typically these will be replaced in
+``meson.build`` by boolean variables, ``get_option('optname')``
+invocations, or ``dep.found()`` expressions.  In general, the remaining
+checks have little or no interdependencies, so they can be moved one by
+one.
 
 Helper functions
 ----------------
@@ -298,7 +299,7 @@ comprises the following tasks:
 
  - Add code to perform the actual feature check.
 
- - Add code to include the feature status in `config-host.h`
+ - Add code to include the feature status in ``config-host.h``
 
  - Add code to print out the feature status in the configure summary
    upon completion.
@@ -334,7 +335,7 @@ The other supporting code is generally simple::
 
 For the configure script to parse the new option, the
 ``scripts/meson-buildoptions.sh`` file must be up-to-date; ``make
-update-buildoptions`` (or just `make`) will take care of updating it.
+update-buildoptions`` (or just ``make``) will take care of updating it.
 
 
 Support scripts
-- 
2.31.1


