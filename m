Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3736277D1C
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Sep 2020 02:43:27 +0200 (CEST)
Received: from localhost ([::1]:37316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLbpf-0004tK-03
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 20:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kLbbx-0000nk-Dd
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 20:29:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kLbbu-000097-IX
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 20:29:17 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600993752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tX78Gui1r8r8XVVk/jpqqfWFRjIABe5ZP6Kta4p10bE=;
 b=MfYexGgrLg2waOlyTw+oTnWN7K6JPcz225I70nY/WQ40WlYG5sTzWPBeyZOJ7zhji7DrpV
 xhCuTb0chKO9w44DQiQnYS9q1yKHLWDxIeAswc/olcdJIrO2oguLz+pFpEkCyJD+RCGapY
 0epcM8RAg+7MnlI49VZHWdgJECTwzPw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-6elhsRd4OBKOAceaYP-y1A-1; Thu, 24 Sep 2020 20:29:10 -0400
X-MC-Unique: 6elhsRd4OBKOAceaYP-y1A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C1D41091062
 for <qemu-devel@nongnu.org>; Fri, 25 Sep 2020 00:29:09 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DADD5D9DD;
 Fri, 25 Sep 2020 00:29:08 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/47] [DO-NOT-MERGE] docs: add scripts/qapi/main to python
 manual
Date: Thu, 24 Sep 2020 20:28:22 -0400
Message-Id: <20200925002900.465855-10-jsnow@redhat.com>
In-Reply-To: <20200925002900.465855-1-jsnow@redhat.com>
References: <20200925002900.465855-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 23:02:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>
---
 docs/devel/python/qapi.main.rst | 7 +++++++
 docs/devel/python/qapi.rst      | 1 +
 2 files changed, 8 insertions(+)
 create mode 100644 docs/devel/python/qapi.main.rst

diff --git a/docs/devel/python/qapi.main.rst b/docs/devel/python/qapi.main.rst
new file mode 100644
index 0000000000..1255fcda63
--- /dev/null
+++ b/docs/devel/python/qapi.main.rst
@@ -0,0 +1,7 @@
+qapi.main module
+================
+
+.. automodule:: qapi.main
+   :members:
+   :undoc-members:
+   :show-inheritance:
diff --git a/docs/devel/python/qapi.rst b/docs/devel/python/qapi.rst
index 24fbf34981..1d73509e98 100644
--- a/docs/devel/python/qapi.rst
+++ b/docs/devel/python/qapi.rst
@@ -19,6 +19,7 @@ Submodules
    qapi.expr
    qapi.gen
    qapi.introspect
+   qapi.main
    qapi.parser
    qapi.schema
    qapi.source
-- 
2.26.2


