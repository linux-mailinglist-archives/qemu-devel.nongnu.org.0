Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA9D288ED7
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 18:27:34 +0200 (CEST)
Received: from localhost ([::1]:33370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQvF0-0000Zx-0y
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 12:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kQv41-0003mP-DF
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 12:16:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kQv3w-0003Dp-7P
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 12:16:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602260164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uK8aJWmONLmLz8GThMNVOIyusxyJ7b5QrlusdD7Nbd4=;
 b=b46dGkRpgWIVi9LXAY+a3uSyaTqk1Gdpq7YDth0VPQkOqd2sBKho3opVtDYkUNCLCx/n/u
 Esp3CJubMAiTnIVi1tL6s3SCY3/qhZzhjf2OBmmKAmg9D2kecjZTrSmVJ6LwJ3CwG1pW7n
 Ih5pfnom7gLkQA7BjRrIHyG5Neurwuo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-2b62jCfWPkeU6n3NXc6Oyg-1; Fri, 09 Oct 2020 12:16:01 -0400
X-MC-Unique: 2b62jCfWPkeU6n3NXc6Oyg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 861131084D69;
 Fri,  9 Oct 2020 16:16:00 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-203.rdu2.redhat.com [10.10.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C648338A;
 Fri,  9 Oct 2020 16:15:59 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 01/36] docs: repair broken references
Date: Fri,  9 Oct 2020 12:15:23 -0400
Message-Id: <20201009161558.107041-2-jsnow@redhat.com>
In-Reply-To: <20201009161558.107041-1-jsnow@redhat.com>
References: <20201009161558.107041-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/09 02:34:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In two different places, we are not making a cross-reference to some
resource correctly.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 docs/devel/multi-thread-tcg.rst | 2 +-
 docs/devel/testing.rst          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/devel/multi-thread-tcg.rst b/docs/devel/multi-thread-tcg.rst
index 21483870dbc..92a9eba13c9 100644
--- a/docs/devel/multi-thread-tcg.rst
+++ b/docs/devel/multi-thread-tcg.rst
@@ -267,7 +267,7 @@ of view of external observers (e.g. another processor core). They can
 apply to any memory operations as well as just loads or stores.
 
 The Linux kernel has an excellent `write-up
-<https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/plain/Documentation/memory-barriers.txt>`
+<https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/plain/Documentation/memory-barriers.txt>`_
 on the various forms of memory barrier and the guarantees they can
 provide.
 
diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index bd64c1bdcdd..8875a40a2b6 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -953,7 +953,7 @@ compiler flags are needed to build for a given target.
 If you have the ability to run containers as the user you can also
 take advantage of the build systems "Docker" support. It will then use
 containers to build any test case for an enabled guest where there is
-no system compiler available. See :ref: `_docker-ref` for details.
+no system compiler available. See :ref:`docker-ref` for details.
 
 Running subset of tests
 -----------------------
-- 
2.26.2


