Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C13C33E423B
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 11:13:38 +0200 (CEST)
Received: from localhost ([::1]:35116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD1Ll-00074z-PC
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 05:13:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mD1Ah-0003Mz-T6
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:02:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mD1Ae-0001yx-Jz
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:02:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628499728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=00QO0kOl2OeThC5eDjlqyaKQ0YpY/7mH5f8J3piZs/E=;
 b=HuCHZ5fP5VyTQs5XWiyKGPuyV8LWrmfWmryTy3OokktrWclsehtaXPABpJkrLYmhhOAZ0e
 xnVcWhR/b3pMnjCmct18ogEIRUhB9I8AyX+Uz1uqVRCGAqsu8D1mQsJDSLEgynXMX11ubQ
 tP6Hif75LI8BgaQsLAbqEBMx45n+9KQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-FBH7Zc0yPua7Z6f0UpH1Yw-1; Mon, 09 Aug 2021 05:02:07 -0400
X-MC-Unique: FBH7Zc0yPua7Z6f0UpH1Yw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D93F587D54D;
 Mon,  9 Aug 2021 09:02:05 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64F3B1B49E;
 Mon,  9 Aug 2021 09:02:03 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v9 16/16] docs/devel/testing: add -p option to the debug
 section of QEMU iotests
Date: Mon,  9 Aug 2021 11:01:14 +0200
Message-Id: <20210809090114.64834-17-eesposit@redhat.com>
In-Reply-To: <20210809090114.64834-1-eesposit@redhat.com>
References: <20210809090114.64834-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.707,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 docs/devel/testing.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 8ebcf85a31..4a0abbf23d 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -249,6 +249,10 @@ a failing test:
 * ``-d`` (debug) just increases the logging verbosity, showing
   for example the QMP commands and answers.
 
+* ``-p`` (print) redirects QEMU’s stdout and stderr to the test output,
+  instead of saving it into a log file in
+  ``$TEST_DIR/qemu-machine-<random_string>``.
+
 Test case groups
 ----------------
 
-- 
2.31.1


