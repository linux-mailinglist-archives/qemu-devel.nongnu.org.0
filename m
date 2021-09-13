Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC774091A5
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 16:02:24 +0200 (CEST)
Received: from localhost ([::1]:35252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPmXP-0000kL-FK
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 10:02:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mPlj4-00030Y-Ot
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:10:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mPlj0-0004eQ-WB
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:10:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631538599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DvNiwLyBMHRllFguS5QhJdthhSB36AOeH90ov2gU3KE=;
 b=XNkjPM+DzivMpMQlspRQR2nNoVDKLXRWtugCHbeSUH6XHCSyTQAHGm08FCQteRKbvAMLON
 uoqqCQmaTIgsSNnAq3DzmfVoslmYwsWqXitcabduulV1f2vDfmyJbLegUOfv7qj3wamoEf
 Y/oIrFTrirVY5esrYLtL+JI3kFw/7lI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-aND4H2VdP5i9qKGMF87Tww-1; Mon, 13 Sep 2021 09:09:58 -0400
X-MC-Unique: aND4H2VdP5i9qKGMF87Tww-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 184E99126B;
 Mon, 13 Sep 2021 13:09:57 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5DAC05D9D3;
 Mon, 13 Sep 2021 13:09:53 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2] docs: add supported host CPU architectures section
Date: Mon, 13 Sep 2021 17:09:50 +0400
Message-Id: <20210913130950.214756-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
---
 docs/about/build-platforms.rst | 28 ++++++++++++++++++++++++++++
 meson.build                    |  2 +-
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
index 692323609e..518a19aff7 100644
--- a/docs/about/build-platforms.rst
+++ b/docs/about/build-platforms.rst
@@ -29,6 +29,34 @@ The `Repology`_ site is a useful resource to identify
 currently shipped versions of software in various operating systems,
 though it does not cover all distros listed below.
 
+Supported host architectures
+----------------------------
+
+Those hosts have a native TCG backend and are regularly tested:
+
+  .. list-table::
+   :header-rows: 1
+
+   * - CPU Architecture
+     - Accelerators
+   * - Arm
+     - kvm (64 bit only), xen
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
+Other architectures are not actively maintained. They may be removed in future
+releases.
+
 Linux OS, macOS, FreeBSD, NetBSD, OpenBSD
 -----------------------------------------
 
diff --git a/meson.build b/meson.build
index 9a64d16943..27593c9b90 100644
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


