Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A7E699C4B
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 19:27:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSiy6-00087M-9I; Thu, 16 Feb 2023 13:26:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pSixv-00083x-K0
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 13:26:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pSixt-0006tv-Up
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 13:26:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676572001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T2poAIjnby+RU+YreRKloUbC9g6kqdEwYm9WLqp9uAQ=;
 b=gOS4Zl/ipE9o0OOhFkRz2cMGbroYX8lEFtcZ43wPKzCj++mrxG5PhqRIzpBiBNqfSLlhVh
 FBoq1dKsSdv9fhAotgy4/dwWKs62lLfP6MIplOx3K7Q4tXrmRetRaBsyyb/YsIM0dTLZeb
 Fx41PX2MBsenPWpkm4EkpGAhBZgiQ8w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-68-_MbFzzOINeej1Dg2eh2oFQ-1; Thu, 16 Feb 2023 13:26:39 -0500
X-MC-Unique: _MbFzzOINeej1Dg2eh2oFQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A34FA18A6467
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 18:26:38 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D3B4B4035700;
 Thu, 16 Feb 2023 18:26:37 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: virtio-fs@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 vgoyal@redhat.com, gmaglione@redhat.com
Subject: [PULL 4/4] virtiofsd: Swing deprecated message to removed-features
Date: Thu, 16 Feb 2023 18:26:28 +0000
Message-Id: <20230216182628.126139-5-dgilbert@redhat.com>
In-Reply-To: <20230216182628.126139-1-dgilbert@redhat.com>
References: <20230216182628.126139-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 docs/about/deprecated.rst       | 18 ------------------
 docs/about/removed-features.rst | 13 +++++++++++++
 2 files changed, 13 insertions(+), 18 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 2827b0c0be..ee95bcb1a6 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -330,24 +330,6 @@ versions, aliases will point to newer CPU model versions
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
index e901637ce5..5b258b446b 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -889,3 +889,16 @@ The VXHS code did not compile since v2.12.0. It was removed in 5.1.
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
2.39.2


