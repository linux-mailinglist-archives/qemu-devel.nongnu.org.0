Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49278393BA6
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 04:50:20 +0200 (CEST)
Received: from localhost ([::1]:55808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmSZn-0004Zf-A5
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 22:50:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmSKp-000563-Ti
 for qemu-devel@nongnu.org; Thu, 27 May 2021 22:34:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmSKl-0000gP-RQ
 for qemu-devel@nongnu.org; Thu, 27 May 2021 22:34:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622169287;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FFCvQEzgFrSSzrwf7qdRUWFUiIcrUP7YhGPZSFKkSWQ=;
 b=VrsB8MYhp7EGf/MgOter/CkFXZRdfPb482aHikcXIJ4oPnjEDSh6DaJy8r/wFG5gz/QFs/
 Vo5Ay8GJlFfF+zi48dQnR8TF3+aApiG+OTrqcKJQJkD785pYzXKTNrhFwwSXp7ZOflG7Az
 pJg6HIOMeg/yB1OPTXjtRfPn8EKXchE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-1srE7JgVMM-OaRVagodkeg-1; Thu, 27 May 2021 22:34:45 -0400
X-MC-Unique: 1srE7JgVMM-OaRVagodkeg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0DF7801AED;
 Fri, 28 May 2021 02:34:43 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5AE09E17F;
 Fri, 28 May 2021 02:34:41 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 29/44] python: move pylintrc into setup.cfg
Date: Thu, 27 May 2021 22:32:05 -0400
Message-Id: <20210528023220.417057-30-jsnow@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Delete the empty settings now that it's sharing a home with settings for
other tools.

pylint can now be run from this folder as "pylint qemu".

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
Message-id: 20210527211715.394144-17-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/pylintrc | 58 ------------------------------------
 python/setup.cfg             | 29 ++++++++++++++++++
 2 files changed, 29 insertions(+), 58 deletions(-)
 delete mode 100644 python/qemu/machine/pylintrc

diff --git a/python/qemu/machine/pylintrc b/python/qemu/machine/pylintrc
deleted file mode 100644
index 3f69205000d..00000000000
--- a/python/qemu/machine/pylintrc
+++ /dev/null
@@ -1,58 +0,0 @@
-[MASTER]
-
-[MESSAGES CONTROL]
-
-# Disable the message, report, category or checker with the given id(s). You
-# can either give multiple identifiers separated by comma (,) or put this
-# option multiple times (only on the command line, not in the configuration
-# file where it should appear only once). You can also use "--disable=all" to
-# disable everything first and then reenable specific checks. For example, if
-# you want to run only the similarities checker, you can use "--disable=all
-# --enable=similarities". If you want to run only the classes checker, but have
-# no Warning level messages displayed, use "--disable=all --enable=classes
-# --disable=W".
-disable=too-many-arguments,
-        too-many-instance-attributes,
-        too-many-public-methods,
-
-[REPORTS]
-
-[REFACTORING]
-
-[MISCELLANEOUS]
-
-[LOGGING]
-
-[BASIC]
-
-# Good variable names which should always be accepted, separated by a comma.
-good-names=i,
-           j,
-           k,
-           ex,
-           Run,
-           _,
-           fd,
-           c,
-[VARIABLES]
-
-[STRING]
-
-[SPELLING]
-
-[FORMAT]
-
-[SIMILARITIES]
-
-# Ignore imports when computing similarities.
-ignore-imports=yes
-
-[TYPECHECK]
-
-[CLASSES]
-
-[IMPORTS]
-
-[DESIGN]
-
-[EXCEPTIONS]
diff --git a/python/setup.cfg b/python/setup.cfg
index b0010e0188f..36b4253e939 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -21,3 +21,32 @@ packages =
     qemu.qmp
     qemu.machine
     qemu.utils
+
+[pylint.messages control]
+# Disable the message, report, category or checker with the given id(s). You
+# can either give multiple identifiers separated by comma (,) or put this
+# option multiple times (only on the command line, not in the configuration
+# file where it should appear only once). You can also use "--disable=all" to
+# disable everything first and then reenable specific checks. For example, if
+# you want to run only the similarities checker, you can use "--disable=all
+# --enable=similarities". If you want to run only the classes checker, but have
+# no Warning level messages displayed, use "--disable=all --enable=classes
+# --disable=W".
+disable=too-many-arguments,
+        too-many-instance-attributes,
+        too-many-public-methods,
+
+[pylint.basic]
+# Good variable names which should always be accepted, separated by a comma.
+good-names=i,
+           j,
+           k,
+           ex,
+           Run,
+           _,
+           fd,
+           c,
+
+[pylint.similarities]
+# Ignore imports when computing similarities.
+ignore-imports=yes
-- 
2.31.1


