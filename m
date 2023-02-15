Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 105DF6983A2
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 19:43:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSMkc-0006CM-Rv; Wed, 15 Feb 2023 13:43:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pSMkb-0006CD-28
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:43:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pSMkZ-0000kd-AL
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 13:43:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676486606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qoGp1PrlSqrypSZBxnRF8IDHuNDHVUBYBrFctX2pZxw=;
 b=Fh7C3z5JTWeg7KXs/pbYowzR9DHiyAh8NnKk1utkfPEjaM61thMD60VkFDX2jn4/iIgZ1w
 ugDl78OiMnQxZM5xXPg/521KuLzugjqGOMRig6XpRLbNSaj+A3ltFmrUEjcU4282RBEHsq
 nhosvqnIkJqzdmK5eP7wxnSv5PmTVvU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-5aHe-rGkP7amb9rGLB2mTg-1; Wed, 15 Feb 2023 13:43:25 -0500
X-MC-Unique: 5aHe-rGkP7amb9rGLB2mTg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0232800050;
 Wed, 15 Feb 2023 18:43:24 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9802492B15;
 Wed, 15 Feb 2023 18:43:23 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 hczenczek@redhat.com, gmaglione@redhat.com, virtio-fs@redhat.com
Cc: pbonzini@redhat.com,
	alex.bennee@linaro.org
Subject: [PATCH v2 4/4] virtiofsd: Swing deprecated message to removed-features
Date: Wed, 15 Feb 2023 18:43:10 +0000
Message-Id: <20230215184310.161283-5-dgilbert@redhat.com>
In-Reply-To: <20230215184310.161283-1-dgilbert@redhat.com>
References: <20230215184310.161283-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Move the deprecation message, since it's now gone.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 docs/about/deprecated.rst       | 18 ------------------
 docs/about/removed-features.rst | 13 +++++++++++++
 2 files changed, 13 insertions(+), 18 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index da2e6fe63d..9a749b342c 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -325,24 +325,6 @@ versions, aliases will point to newer CPU model versions
 depending on the machine type, so management software must
 resolve CPU model aliases before starting a virtual machine.
 
-Tools
------
-
-virtiofsd
-'''''''''
-
-There is a new Rust implementation of ``virtiofsd`` at
-``https://gitlab.com/virtio-fs/virtiofsd``;
-since this is now marked stable, new development should be done on that
-rather than the existing C version in the QEMU tree.
-The C version will still accept fixes and patches that
-are already in development for the moment, but will eventually
-be deleted from this tree.
-New deployments should use the Rust version, and existing systems
-should consider moving to it.  The command line and feature set
-is very close and moving should be simple.
-
-
 QEMU guest agent
 ----------------
 
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index a17d0554d6..8b69ab1674 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -872,3 +872,16 @@ The VXHS code did not compile since v2.12.0. It was removed in 5.1.
 The corresponding upstream server project is no longer maintained.
 Users are recommended to switch to an alternative distributed block
 device driver such as RBD.
+
+Tools
+-----
+
+virtiofsd (removed in 8.0)
+''''''''''''''''''''''''''
+
+There is a newer Rust implementation of ``virtiofsd`` at
+``https://gitlab.com/virtio-fs/virtiofsd``; this has been
+stable for some time and is now widely used.
+The command line and feature set is very close to the removed
+C implementation.
+
-- 
2.39.1


