Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B67214028AD
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 14:22:47 +0200 (CEST)
Received: from localhost ([::1]:35336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNa7i-0000R4-P2
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 08:22:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa5G-00065K-LX
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:20:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa5E-0005uk-0x
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:20:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631017211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8T4JlY79PWL+djlbbRqYAkR3sG+cVNaNdae+g2BDu60=;
 b=I8eAq+C2IawMftG6V2hXZAWF/bQOLy9yKffXqB1SiYyhDfM1R+GTJJ2Oh4NgDf4sgpLOHC
 1u1HFtxrjMRTiZhTWhN8wXB03woZSdnJZkxw+LSy82ouGUVAPh7Tp/i5GPMtJmqVQtHUhZ
 5OA9zqMa7MSRse06eRKpzqAS2cl9MWc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-YLGUIhf_O0aZ4sSey56muw-1; Tue, 07 Sep 2021 08:20:10 -0400
X-MC-Unique: YLGUIhf_O0aZ4sSey56muw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FEE9100E403
 for <qemu-devel@nongnu.org>; Tue,  7 Sep 2021 12:20:09 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89F7E1B46B;
 Tue,  7 Sep 2021 12:20:00 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [RFC v3 01/32] RFC: docs: add supported host CPUs section
Date: Tue,  7 Sep 2021 16:19:12 +0400
Message-Id: <20210907121943.3498701-2-marcandre.lureau@redhat.com>
In-Reply-To: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

I was looking for such documentation, but couldn't find it.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 docs/about/build-platforms.rst | 28 ++++++++++++++++++++++++++++
 meson.build                    |  2 +-
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
index 692323609e..bfe90e574e 100644
--- a/docs/about/build-platforms.rst
+++ b/docs/about/build-platforms.rst
@@ -29,6 +29,34 @@ The `Repology`_ site is a useful resource to identify
 currently shipped versions of software in various operating systems,
 though it does not cover all distros listed below.
 
+Supported host CPUs
+-------------------
+
+Those host CPUs have a native TCG backend and are regularly tested:
+
+  .. list-table::
+   :header-rows: 1
+
+   * - CPU Family
+     - Accelerators
+   * - ARM
+     - kvm, xen
+   * - MIPS
+     - kvm
+   * - PPC
+     - kvm
+   * - RISC-V
+     -
+   * - s390x
+     - kvm
+   * - SPARC
+     -
+   * - x86
+     - kvm, xen, hax, hvf (64 bit only), nvmm, whpx (64 bit only)
+
+Other architectures are not actively maintained. They use the slow and
+experimental TCG interpreter. They may be removed in future releases.
+
 Linux OS, macOS, FreeBSD, NetBSD, OpenBSD
 -----------------------------------------
 
diff --git a/meson.build b/meson.build
index 7e58e6279b..9e43c9b311 100644
--- a/meson.build
+++ b/meson.build
@@ -78,7 +78,7 @@ endif
 
 accelerator_targets = { 'CONFIG_KVM': kvm_targets }
 if cpu in ['x86', 'x86_64', 'arm', 'aarch64']
-  # i368 emulator provides xenpv machine type for multiple architectures
+  # i386 emulator provides xenpv machine type for multiple architectures
   accelerator_targets += {
     'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu'],
   }
-- 
2.33.0.113.g6c40894d24


