Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A47B027D5B0
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Sep 2020 20:21:26 +0200 (CEST)
Received: from localhost ([::1]:50726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNKFh-00084u-Oe
	for lists+qemu-devel@lfdr.de; Tue, 29 Sep 2020 14:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kNKAS-0004IN-Qf
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 14:16:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kNKAO-0003Fn-Ve
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 14:16:00 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601403355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6JO9oQUNShiFIYsnPzaTD1P9Oqqoab6OoTZl/2NL3A4=;
 b=H45KJJL49kfhy0Y4d+JyA+MMJJOxl/0miFmeTx730WNfhHfpniaZRNnjQEXrWl0Y2OwOH8
 K42nY2eibWC99GZNf4SkeiK9oUzK/gysNM85uJc+URQDHuwYEkciRm3WoVrYF3rAxROUTA
 d5PKG8zCClCbHnHgmXzzVAaDzHjN4YU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-ZbEBt_3iNgGJCU21zwC3Ug-1; Tue, 29 Sep 2020 14:15:53 -0400
X-MC-Unique: ZbEBt_3iNgGJCU21zwC3Ug-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF5AC801AFF;
 Tue, 29 Sep 2020 18:15:52 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B4377C83D;
 Tue, 29 Sep 2020 18:15:47 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-trivial@nongnu.org
Subject: [PATCH 1/1] docs: repair broken references
Date: Tue, 29 Sep 2020 14:15:45 -0400
Message-Id: <20200929181545.1030256-2-jsnow@redhat.com>
In-Reply-To: <20200929181545.1030256-1-jsnow@redhat.com>
References: <20200929181545.1030256-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 22:47:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In two different places, we are making a cross-reference to some
resource incorrectly. These were being interpreted as "content" instead
of a link and a reference, accordingly.

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


