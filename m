Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E8A4154ED
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 03:00:24 +0200 (CEST)
Received: from localhost ([::1]:36522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTD66-0000cu-4I
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 21:00:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTCw2-0001Fy-Ba
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 20:49:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTCw0-0006Nt-Ql
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 20:49:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632358196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZzrpXIV/vBg/Hoe3SYIRq75+CKHdXZogTcm12vW4+mQ=;
 b=dNb9LpK+smsZqdH1ospldsHT+IKoaSiHHqaw+fjmHu4sO9Yz4KvPlDs/QSAmINbV9JioIP
 /xrn+Ste00QEyf5OT+e5EBlnDfkAeC2q5CmyTRfHf4lZ7puJniExiZt4S7SVGADmuJIdIL
 U0y0585gb1tbehASNUACrWzLltF3tAM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-lUz5daLJO_Om9J5Qr2kNdA-1; Wed, 22 Sep 2021 20:49:55 -0400
X-MC-Unique: lUz5daLJO_Om9J5Qr2kNdA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1806318D6A25;
 Thu, 23 Sep 2021 00:49:54 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BAE9460BF1;
 Thu, 23 Sep 2021 00:49:52 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/17] python/aqmp: Disable logging messages by default
Date: Wed, 22 Sep 2021 20:49:28 -0400
Message-Id: <20210923004938.3999963-8-jsnow@redhat.com>
In-Reply-To: <20210923004938.3999963-1-jsnow@redhat.com>
References: <20210923004938.3999963-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
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


