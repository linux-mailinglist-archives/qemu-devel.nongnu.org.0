Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 666CD453D36
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 01:41:32 +0100 (CET)
Received: from localhost ([::1]:53952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn911-0004ju-3M
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 19:41:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mn8uL-00078h-Qh
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 19:34:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mn8uJ-00070f-Lw
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 19:34:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637109275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eXSVgjFKJRRwA5Vn8ppKHCzgYugtfrVhUWKNkdfPF5M=;
 b=UXYx37DuMPZm62Ijl2plm0kzkyInjA31yXid8PFskdnaseF7H+b3jQSGN3YkGV/e9Zix30
 vV7RbrChsHXQhG8mywJ9wRmfnHYQGXvUu7yoqi8KXXRnDZWMzvNneImI88VSEWxx3e1btn
 xLhziDiOKbT0oUbk2JwchQxZ5w6sUv4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-128-VPmryWQ4OcWjqKhK4cBbTQ-1; Tue, 16 Nov 2021 19:34:31 -0500
X-MC-Unique: VPmryWQ4OcWjqKhK4cBbTQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6990B8799E0;
 Wed, 17 Nov 2021 00:34:30 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.32.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1EE261980E;
 Wed, 17 Nov 2021 00:34:24 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/5] scripts/device-crash-test: don't emit AQMP connection
 errors to stdout
Date: Tue, 16 Nov 2021 19:33:16 -0500
Message-Id: <20211117003317.2844087-5-jsnow@redhat.com>
In-Reply-To: <20211117003317.2844087-1-jsnow@redhat.com>
References: <20211117003317.2844087-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These errors are expected, so they shouldn't clog up terminal output. In
the event that they're *not* expected, we'll be seeing an awful lot more
output concerning the nature of the failure.

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Message-id: 20211111143719.2162525-5-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/device-crash-test | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/device-crash-test b/scripts/device-crash-test
index d91e8616ef..49bcd61b4f 100755
--- a/scripts/device-crash-test
+++ b/scripts/device-crash-test
@@ -499,6 +499,12 @@ def main():
         lvl = logging.WARN
     logging.basicConfig(stream=sys.stdout, level=lvl, format='%(levelname)s: %(message)s')
 
+    if not args.debug:
+        # Async QMP, when in use, is chatty about connection failures.
+        # This script knowingly generates a ton of connection errors.
+        # Silence this logger.
+        logging.getLogger('qemu.aqmp.qmp_client').setLevel(logging.CRITICAL)
+
     fatal_failures = []
     wl_stats = {}
     skipped = 0
-- 
2.31.1


