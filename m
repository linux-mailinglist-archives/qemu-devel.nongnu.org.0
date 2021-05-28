Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AD2393B95
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 04:49:35 +0200 (CEST)
Received: from localhost ([::1]:53230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmSZ4-0002oa-Ug
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 22:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmSKh-0004Vc-Gh
 for qemu-devel@nongnu.org; Thu, 27 May 2021 22:34:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48999)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmSKf-0000Xg-Ma
 for qemu-devel@nongnu.org; Thu, 27 May 2021 22:34:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622169281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2TU7Woqy+0bur/o+LTXtnSroNw4EdyBXhElDcwxCha4=;
 b=MFOQHQ9Dyqtyi3mnYVZ8j3vCknLOX8FggGYwaZlpVet5tM+NJWwVAhz50bf3nw8L1/E70Q
 /BlzTQbuRwOXmAyrSbfRJ53PxzWyNlOFb6VuKWkvo+0Br6LSPQumayteaRZn1sBoWXfPzX
 meBJ+oK19vdfSEEA8mYz3xq8hoF6tnQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-92RXx2Z3O1K9g184Sn34NQ-1; Thu, 27 May 2021 22:34:38 -0400
X-MC-Unique: 92RXx2Z3O1K9g184Sn34NQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E71F180FD62;
 Fri, 28 May 2021 02:34:37 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE5CB1F0C0;
 Fri, 28 May 2021 02:34:35 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/44] python: add MANIFEST.in
Date: Thu, 27 May 2021 22:32:02 -0400
Message-Id: <20210528023220.417057-27-jsnow@redhat.com>
In-Reply-To: <20210528023220.417057-1-jsnow@redhat.com>
References: <20210528023220.417057-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When creating a source or binary distribution via 'python3 setup.py
<sdist|bdist>', the VERSION and PACKAGE.rst files aren't bundled by
default. Create a MANIFEST.in file that instructs the build tools to
include these so that installation from these files won't fail.

This is required by 'tox', as well as by the tooling needed to upload
packages to PyPI.

Exclude the 'README.rst' file -- that's intended as a guidebook to our
source tree, not a file that needs to be distributed.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Message-id: 20210527211715.394144-14-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/README.rst  | 2 ++
 python/MANIFEST.in | 3 +++
 2 files changed, 5 insertions(+)
 create mode 100644 python/MANIFEST.in

diff --git a/python/README.rst b/python/README.rst
index 38b0c83f321..0099646ae2f 100644
--- a/python/README.rst
+++ b/python/README.rst
@@ -33,6 +33,8 @@ Files in this directory
 -----------------------
 
 - ``qemu/`` Python package source directory.
+- ``MANIFEST.in`` is read by python setuptools, it specifies additional files
+  that should be included by a source distribution.
 - ``PACKAGE.rst`` is used as the README file that is visible on PyPI.org.
 - ``README.rst`` you are here!
 - ``VERSION`` contains the PEP-440 compliant version used to describe
diff --git a/python/MANIFEST.in b/python/MANIFEST.in
new file mode 100644
index 00000000000..7059ad28221
--- /dev/null
+++ b/python/MANIFEST.in
@@ -0,0 +1,3 @@
+include VERSION
+include PACKAGE.rst
+exclude README.rst
-- 
2.31.1


