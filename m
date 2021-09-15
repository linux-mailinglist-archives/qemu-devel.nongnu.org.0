Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D00C940BF59
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 07:32:54 +0200 (CEST)
Received: from localhost ([::1]:38712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQNXR-0005Al-Vn
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 01:32:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQNUz-0002wB-P9
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 01:30:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQNUw-0007wf-UL
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 01:30:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631683818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sk07toWMC3BU2UbUR6Kz9cS0v8W1KnxVGUCAgDHbNLo=;
 b=YpXY0iacO6jigyXEW3K0PGTEHDvrc4/BPFhrqEVaR8H68G6yWZke4PTm9QW2n7P0VeCaBv
 duSHKPJIlfu4arFguQ/tRbm4AgkJhbA9ltunLN9wUuaxOAx8DI8uza0H9lE1/vkdvjgqIA
 Wq+eyXlf7tCFlKi7p4KrrYPko4/P0aw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-sTPge-WSPRu3fAX9Vo5MDw-1; Wed, 15 Sep 2021 01:30:15 -0400
X-MC-Unique: sTPge-WSPRu3fAX9Vo5MDw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 56EB810144E8;
 Wed, 15 Sep 2021 05:30:14 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D602196E2;
 Wed, 15 Sep 2021 05:30:13 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/1] python: Update for pylint 2.10
Date: Wed, 15 Sep 2021 01:30:11 -0400
Message-Id: <20210915053011.293335-2-jsnow@redhat.com>
In-Reply-To: <20210915053011.293335-1-jsnow@redhat.com>
References: <20210915053011.293335-1-jsnow@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
Cc: Eric Blake <eblake@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 G S Niteesh Babu <niteesh.gs@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A few new annoyances. Of note is the new warning for an unspecified
encoding when opening a text file, which actually does indicate a
potentially real problem; see
https://www.python.org/dev/peps/pep-0597/#motivation

It's not clear to me what the "right" encoding is; it depends on
whatever encoding QEMU is using when it prints to terminal. I'm going to
assume UTF-8 works.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/machine.py | 3 ++-
 python/setup.cfg               | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index a7081b1845..a27a80497d 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -291,7 +291,8 @@ def get_pid(self) -> Optional[int]:
 
     def _load_io_log(self) -> None:
         if self._qemu_log_path is not None:
-            with open(self._qemu_log_path, "r") as iolog:
+            with open(self._qemu_log_path, "r",
+                      encoding='utf-8') as iolog:
                 self._iolog = iolog.read()
 
     @property
diff --git a/python/setup.cfg b/python/setup.cfg
index 83909c1c97..0f0cab098f 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -104,6 +104,7 @@ good-names=i,
 [pylint.similarities]
 # Ignore imports when computing similarities.
 ignore-imports=yes
+ignore-signatures=yes
 
 # Minimum lines number of a similarity.
 # TODO: Remove after we opt in to Pylint 2.8.3. See commit msg.
-- 
2.31.1


