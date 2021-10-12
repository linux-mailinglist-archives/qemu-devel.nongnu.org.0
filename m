Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5106042AF4F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 23:51:43 +0200 (CEST)
Received: from localhost ([::1]:40810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maPgU-0001KV-Cp
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 17:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1maPYW-0005ag-7e
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 17:43:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1maPYU-0000Lz-Ht
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 17:43:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634075005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+wQcW8FZflS0cOptxPHY9cg3ipTQJcc3YaplF3JJRHI=;
 b=HhgZ+e3igdUUA5pY1NImiE9OMatEaXeJLKFYfcsGyAlsNv71eCFMk3jumTcLohL1m7MPmI
 Q3yXfs3CcJghfB2Ze0aVUKTSwMFnN766Tpu1qt0f982vqsoateNfqtaE7UylhybcIHE1gF
 IjtLcwxdjHSpu21WQmGmBDkhtn/+n0Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-WaRZHM-wN-q_CmNl0OfXyQ-1; Tue, 12 Oct 2021 17:43:22 -0400
X-MC-Unique: WaRZHM-wN-q_CmNl0OfXyQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0398310A8E00;
 Tue, 12 Oct 2021 21:43:21 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA6C55D6A8;
 Tue, 12 Oct 2021 21:43:13 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/10] python/aqmp: Disable logging messages by default
Date: Tue, 12 Oct 2021 17:41:49 -0400
Message-Id: <20211012214152.802483-8-jsnow@redhat.com>
In-Reply-To: <20211012214152.802483-1-jsnow@redhat.com>
References: <20211012214152.802483-1-jsnow@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

AQMP is a library, and ideally it should not print error diagnostics
unless a user opts into seeing them. By default, Python will print all
WARNING, ERROR or CRITICAL messages to screen if no logging
configuration has been created by a client application.

In AQMP's case, ERROR logging statements are used to report additional
detail about runtime failures that will also eventually be reported to the
client library via an Exception, so these messages should not be
rendered by default.

(Why bother to have them at all, then? In async contexts, there may be
multiple Exceptions and we are only able to report one of them back to
the client application. It is not reasonably easy to predict ahead of
time if one or more of these Exceptions will be squelched. Therefore,
it's useful to log intermediate failures to help make sense of the
ultimate, resulting failure.)

Add a NullHandler that will suppress these messages until a client
application opts into logging via logging.basicConfig or similar. Note
that upon calling basicConfig(), this handler will *not* suppress these
messages from being displayed by the client's configuration.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-id: 20210923004938.3999963-8-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/__init__.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/python/qemu/aqmp/__init__.py b/python/qemu/aqmp/__init__.py
index ab1782999cf..d1b0e4dc3d3 100644
--- a/python/qemu/aqmp/__init__.py
+++ b/python/qemu/aqmp/__init__.py
@@ -21,6 +21,7 @@
 # This work is licensed under the terms of the GNU GPL, version 2.  See
 # the COPYING file in the top-level directory.
 
+import logging
 import warnings
 
 from .error import AQMPError
@@ -41,6 +42,9 @@
 
 warnings.warn(_WMSG, FutureWarning)
 
+# Suppress logging unless an application engages it.
+logging.getLogger('qemu.aqmp').addHandler(logging.NullHandler())
+
 
 # The order of these fields impact the Sphinx documentation order.
 __all__ = (
-- 
2.31.1


