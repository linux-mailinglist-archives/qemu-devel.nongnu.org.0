Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0452E4B15B7
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 20:02:52 +0100 (CET)
Received: from localhost ([::1]:55302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIEiQ-0008SD-Li
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 14:02:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nIDY0-00040m-Jh
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 12:48:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nIDXw-0001LX-I6
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 12:47:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644515275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YQ0k6351Fgo3iYJWKidiXmle7ER4CRQl4f8m/g0dpZk=;
 b=GJ3L2u4KEkj90MwdgQLjR3aM7vwfKpwpQc5rTVo1oW2e/c/PwhnEcOr/v4jGGFZ/cFL2j+
 llXvKXUxpRa7TNtgxjTwhEl8rJUR/DPNU0LvVxNeyoMTSF8qXT/aaOAEmEEK5ClQ8g6bQc
 O59oVhEiadBFrpf2mMjGu3It8fqxbXw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-T9NB1kGBM5-kjYSOKyha1w-1; Thu, 10 Feb 2022 12:47:54 -0500
X-MC-Unique: T9NB1kGBM5-kjYSOKyha1w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C92D1923E22
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 17:47:53 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.39.195.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 14538167AC;
 Thu, 10 Feb 2022 17:47:19 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH v2] Deprecate C virtiofsd
Date: Thu, 10 Feb 2022 17:47:14 +0000
Message-Id: <20220210174714.19843-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, stefanha@redhat.com, slp@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

There's a nice new Rust implementation out there; recommend people
do new work on that.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 docs/about/deprecated.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 47a594a3b6..3c73d22729 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -454,3 +454,20 @@ nanoMIPS ISA
 
 The ``nanoMIPS`` ISA has never been upstreamed to any compiler toolchain.
 As it is hard to generate binaries for it, declare it deprecated.
+
+Tools
+-----
+
+virtiofsd
+'''''''''
+
+There is a new Rust implementation of ``virtiofsd`` at
+``https://gitlab.com/virtio-fs/virtiofsd``;
+since this is now marked stable, new development should be done on that
+rather than the existing C version in the QEMU tree.
+The C version will still accept fixes and patches that
+are already in development for the moment, but will eventually
+be deleted from this tree.
+New deployments should use the Rust version, and existing systems
+should consider moving to it.  The command line and feature set
+is very close and moving should be simple.
-- 
2.34.1


