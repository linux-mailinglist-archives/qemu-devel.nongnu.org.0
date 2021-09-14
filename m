Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D258540AED7
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 15:23:36 +0200 (CEST)
Received: from localhost ([::1]:52416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ8PP-0005PL-S7
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 09:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mQ84Q-0006M4-Qm
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:01:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mQ84L-0008NE-5D
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:01:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631624505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K1qk8u5NQ6kttP48zH2LMhrRKstULXIxJnGZIO2W7oQ=;
 b=A/WgUYg5iJwsw3+TjDoaXA7APlKMCZtEtZid6J1ejSDDVeeX6sxCOq100MYu35xhaT9tTv
 t+cBVfWe7q/fj0d4lwp9MyxVo+7SE3PbEFbKeDLbYHLHWePepD3gFsUcVQx/qzCnvSXt3R
 heZ1qBaWX9n2ET3OhkZelzsvJVSJYhg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-brOMD1NGPo6EygjuQCtGKg-1; Tue, 14 Sep 2021 09:01:42 -0400
X-MC-Unique: brOMD1NGPo6EygjuQCtGKg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B2CB5075B;
 Tue, 14 Sep 2021 13:01:41 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B276E7A5CE;
 Tue, 14 Sep 2021 13:01:39 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] docs: add supported host CPU architectures section
Date: Tue, 14 Sep 2021 17:01:24 +0400
Message-Id: <20210914130128.298226-2-marcandre.lureau@redhat.com>
In-Reply-To: <20210914130128.298226-1-marcandre.lureau@redhat.com>
References: <20210914130128.298226-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

I was looking for such documentation, but couldn't find it. Add it to
the build-platform.rst document.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/about/build-platforms.rst | 33 +++++++++++++++++++++++++++++++++
 docs/about/deprecated.rst      |  2 ++
 2 files changed, 35 insertions(+)

diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
index 692323609e..bcb1549721 100644
--- a/docs/about/build-platforms.rst
+++ b/docs/about/build-platforms.rst
@@ -29,6 +29,39 @@ The `Repology`_ site is a useful resource to identify
 currently shipped versions of software in various operating systems,
 though it does not cover all distros listed below.
 
+Supported host architectures
+----------------------------
+
+Those hosts are officially supported, with various accelerators:
+
+  .. list-table::
+   :header-rows: 1
+
+   * - CPU Architecture
+     - Accelerators
+   * - Arm
+     - kvm (64 bit only), tcg, xen
+   * - MIPS
+     - kvm, tcg
+   * - PPC
+     - kvm, tcg
+   * - RISC-V
+     - tcg
+   * - s390x
+     - kvm, tcg
+   * - SPARC
+     - tcg
+   * - x86
+     - hax, hvf (64 bit only), kvm, nvmm, tcg, whpx (64 bit only), xen
+
+Other host architectures are not supported. It is possible to build QEMU on an
+unsupported host architecture using the configure ``--enable-tcg-interpreter``
+option to enable the experimental TCI support, but note that this is very slow
+and is not recommended.
+
+Non-supported architectures may be removed in the future following the
+:ref:`deprecation process<Deprecated features>`.
+
 Linux OS, macOS, FreeBSD, NetBSD, OpenBSD
 -----------------------------------------
 
diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 9ee355ec0b..3c2be84d80 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -1,3 +1,5 @@
+.. _Deprecated features:
+
 Deprecated features
 ===================
 
-- 
2.33.0.113.g6c40894d24


