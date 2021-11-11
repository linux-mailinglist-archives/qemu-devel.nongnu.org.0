Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB28D44D885
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 15:45:29 +0100 (CET)
Received: from localhost ([::1]:33766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlBKT-0002qQ-0I
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 09:45:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mlBCm-0008TG-Sj
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:37:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mlBCk-0001hR-4Q
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:37:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636641449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CpshgBslURLlcFwEyi6D86QTZgXE8MlFVthUIbA+DlE=;
 b=DTxbafjXRK0TKxFDGEdMflnH5F0Vnz+DT0iKoYF8t2EPHpSlq69bc0VwH0wrS2pegzHJr6
 S6Bj1CRHVkFTjy3/aZXr1ipHwa7YfVohUsu4crd8LfutebPKa4NplkL1bohaHx23WRJNih
 mtgIiZDsXKosUQMIRjRP0lAzfuZT6Ak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-eRP9tGUlNE-0EPfXgMzofA-1; Thu, 11 Nov 2021 09:37:28 -0500
X-MC-Unique: eRP9tGUlNE-0EPfXgMzofA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0051D1006AA5
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 14:37:27 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.33.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C1D660C17;
 Thu, 11 Nov 2021 14:37:26 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/5] scripts/device-crash-test: don't emit AQMP connection
 errors to stdout
Date: Thu, 11 Nov 2021 09:37:18 -0500
Message-Id: <20211111143719.2162525-5-jsnow@redhat.com>
In-Reply-To: <20211111143719.2162525-1-jsnow@redhat.com>
References: <20211111143719.2162525-1-jsnow@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These errors are expected, so they shouldn't clog up terminal output. In
the event that they're *not* expected, we'll be seeing an awful lot more
output concerning the nature of the failure.

Reported-by: Thomas Huth <thuth@redhat.com>
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


