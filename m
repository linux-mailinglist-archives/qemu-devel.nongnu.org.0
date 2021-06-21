Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D87E23AE7B6
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 12:56:17 +0200 (CEST)
Received: from localhost ([::1]:47432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvHbE-0005px-RR
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 06:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lvHGE-0000r3-6j
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 06:34:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lvHGB-0002cp-Qn
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 06:34:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624271671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gPiC5z6m4jnmh2itE5RumYmcgy0d0h1nvWpIYmP58Mk=;
 b=NAadSVIk563YPQGeLbj42kYMVltHO7hvIRdrHyGemGKcqiE0f9FOHzFyZ3E/E6P3rSDEUd
 Et/66UQQ/JvbwHvU/XvTn7rywfOGyuhDrQmunKq1Ab6tw3Jp14evwxcC0/LAtPt/1DgTf7
 Gm/LqYWmsH2ClK09FAumWCW+PT5U4Vo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-J6LRS-jaN3aQw24LjL7KEQ-1; Mon, 21 Jun 2021 06:34:29 -0400
X-MC-Unique: J6LRS-jaN3aQw24LjL7KEQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7517802E3B;
 Mon, 21 Jun 2021 10:34:28 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-100.ams2.redhat.com
 [10.36.113.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F8015D703;
 Mon, 21 Jun 2021 10:34:26 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 16/16] docs/devel/testing: add -p option to the debug
 section of QEMU iotests
Date: Mon, 21 Jun 2021 12:33:37 +0200
Message-Id: <20210621103337.36637-17-eesposit@redhat.com>
In-Reply-To: <20210621103337.36637-1-eesposit@redhat.com>
References: <20210621103337.36637-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
---
 docs/devel/testing.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index fa85592a38..28a0b37b84 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -250,6 +250,10 @@ a failing test:
 * ``-d`` (debug) just increases the logging verbosity, showing
   for example the QMP commands and answers.
 
+* ``-p`` (print) redirect QEMU’s stdout and stderr to the test output,
+  instead of saving it into a log file in
+  ``$TEST_DIR/qemu-machine-<random_string>``.
+
 Test case groups
 ----------------
 
-- 
2.31.1


