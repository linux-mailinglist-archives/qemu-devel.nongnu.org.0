Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D4E2A2B3F
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Nov 2020 14:11:25 +0100 (CET)
Received: from localhost ([::1]:59922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZZcK-0005dc-Uu
	for lists+qemu-devel@lfdr.de; Mon, 02 Nov 2020 08:11:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kZZah-0004M8-SB
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 08:09:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kZZag-0003Ls-7Q
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 08:09:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604322581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B/LM4wfIa4cVIdLEi2TuLjN3k4rymWp18Mv8P2Vo+Ao=;
 b=b/nbZo5VsWBLEqcGOaTgwV58uAZJXicXsEcqBG/J7XQ/+c/7P3cmoEWgcETT7ttpCESgre
 HsLCnkB0AOR8USn+hrPeOIz8uHmuorPl8V++rSnTEJwhCI9lKyYHpyOhh22nNSBoXk/RSS
 qE66OBhiptz4avBI12mznAlJm/tDQoI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-9abRmovSO0mfh-oGsS17pw-1; Mon, 02 Nov 2020 08:09:39 -0500
X-MC-Unique: 9abRmovSO0mfh-oGsS17pw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2BBE809DD3;
 Mon,  2 Nov 2020 13:09:38 +0000 (UTC)
Received: from fedora.redhat.com (ovpn-114-136.ams2.redhat.com [10.36.114.136])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9075D1002C21;
 Mon,  2 Nov 2020 13:09:36 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] gitlab: force enable docs build in Fedora, Ubuntu, Debian
Date: Mon,  2 Nov 2020 13:09:24 +0000
Message-Id: <20201102130926.161183-3-berrange@redhat.com>
In-Reply-To: <20201102130926.161183-1-berrange@redhat.com>
References: <20201102130926.161183-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 01:33:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Meson runs a test to see if Sphinx works, and automatically disables it
on error. This can lead to the CI jobs skipping docs build without
maintainers noticing the problem. Use --enable-docs to force a fatal
error if Sphinx doesn't work on the jobs where we expect it to be OK.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.yml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a41725d6f7..f17bff652d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -80,6 +80,7 @@ build-system-ubuntu:
     TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
       moxie-softmmu microblazeel-softmmu mips64el-softmmu
     MAKE_CHECK_ARGS: check-build
+    CONFIGURE_ARGS: --enable-docs
   artifacts:
     expire_in: 2 days
     paths:
@@ -111,6 +112,7 @@ build-system-debian:
     TARGETS: arm-softmmu avr-softmmu i386-softmmu mipsel-softmmu
       riscv64-softmmu sh4eb-softmmu sparc-softmmu xtensaeb-softmmu
     MAKE_CHECK_ARGS: check-build
+    CONFIGURE_ARGS: --enable-docs
   artifacts:
     expire_in: 2 days
     paths:
@@ -139,7 +141,7 @@ build-system-fedora:
   <<: *native_build_job_definition
   variables:
     IMAGE: fedora
-    CONFIGURE_ARGS: --disable-gcrypt --enable-nettle
+    CONFIGURE_ARGS: --disable-gcrypt --enable-nettle --enable-docs
     TARGETS: tricore-softmmu microblaze-softmmu mips-softmmu
       xtensa-softmmu m68k-softmmu riscv32-softmmu ppc-softmmu sparc64-softmmu
     MAKE_CHECK_ARGS: check-build
-- 
2.28.0


