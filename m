Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D363FEE45
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 15:03:42 +0200 (CEST)
Received: from localhost ([::1]:59060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLmNZ-0007Al-7X
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 09:03:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mLm9q-00056l-PP
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:49:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mLm9o-00072g-55
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 08:49:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630586967;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kvSGLmDQoJCOY+GW0INvLdpixURESMkqGYcc41wCcOM=;
 b=fhj4uHXPVHfUezIe578kERUzvGMiA9M9eC+hPk//iEwbkVUn4EU7SXJCys4TUqth30PrGV
 DsIbphdChL4czj30gmXQsNfAhSQd5WvxctqtHAW+v0GjcnaQgtCxAav8fHwboRUO+4lbNJ
 ihQifYI5dJfZkQr7wTlXcZ844uILKAE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-Wf1k3AamN-GcJV5q6M1Ydw-1; Thu, 02 Sep 2021 08:49:24 -0400
X-MC-Unique: Wf1k3AamN-GcJV5q6M1Ydw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B6EF107ACCD;
 Thu,  2 Sep 2021 12:49:23 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6836510016F2;
 Thu,  2 Sep 2021 12:49:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 03/13] gitlab-ci: Merge "build-disabled" with
 "build-without-default-features"
Date: Thu,  2 Sep 2021 14:49:01 +0200
Message-Id: <20210902124911.822423-4-thuth@redhat.com>
In-Reply-To: <20210902124911.822423-1-thuth@redhat.com>
References: <20210902124911.822423-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both jobs are testing more or less the same thing (building QEMU with
features disabled), so we are wasting precious CI cycles here by doing
this twice. Merge the jobs by using --without-default-features by default
and just adding some additional --disable-... switches which are not
covered by the generic switch (yet). And while we're at it, also test
compilation with "--disable-fdt" (which forces us to change the list
of targets in this job, though, since some targets do not work without
fdt).

Message-Id: <20210730143809.717079-2-thuth@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/buildtest.yml | 97 +++++---------------------------------
 1 file changed, 13 insertions(+), 84 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 903ee65f32..f390f98044 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -202,85 +202,6 @@ acceptance-system-opensuse:
     MAKE_CHECK_ARGS: check-acceptance
 
 
-build-disabled:
-  extends: .native_build_job_template
-  needs:
-    job: amd64-fedora-container
-  variables:
-    IMAGE: fedora
-    CONFIGURE_ARGS:
-      --disable-attr
-      --disable-auth-pam
-      --disable-avx2
-      --disable-bochs
-      --disable-brlapi
-      --disable-bzip2
-      --disable-cap-ng
-      --disable-capstone
-      --disable-cloop
-      --disable-coroutine-pool
-      --disable-curl
-      --disable-curses
-      --disable-dmg
-      --disable-docs
-      --disable-gcrypt
-      --disable-glusterfs
-      --disable-gnutls
-      --disable-gtk
-      --disable-guest-agent
-      --disable-iconv
-      --disable-keyring
-      --disable-kvm
-      --disable-libiscsi
-      --disable-libpmem
-      --disable-libssh
-      --disable-libudev
-      --disable-libusb
-      --disable-libxml2
-      --disable-linux-aio
-      --disable-live-block-migration
-      --disable-lzo
-      --disable-malloc-trim
-      --disable-mpath
-      --disable-nettle
-      --disable-numa
-      --disable-opengl
-      --disable-parallels
-      --disable-pie
-      --disable-qcow1
-      --disable-qed
-      --disable-qom-cast-debug
-      --disable-rbd
-      --disable-rdma
-      --disable-replication
-      --disable-sdl
-      --disable-seccomp
-      --disable-slirp
-      --disable-smartcard
-      --disable-snappy
-      --disable-sparse
-      --disable-spice
-      --disable-strip
-      --disable-tpm
-      --disable-usb-redir
-      --disable-vdi
-      --disable-vhost-crypto
-      --disable-vhost-net
-      --disable-vhost-scsi
-      --disable-vhost-kernel
-      --disable-vhost-user
-      --disable-vhost-vdpa
-      --disable-vhost-vsock
-      --disable-virglrenderer
-      --disable-vnc
-      --disable-vte
-      --disable-vvfat
-      --disable-xen
-      --disable-zstd
-    TARGETS: arm-softmmu i386-softmmu ppc64-softmmu mips64-softmmu
-      s390x-softmmu i386-linux-user
-    MAKE_CHECK_ARGS: check-qtest SPEED=slow
-
 # This jobs explicitly disable TCG (--disable-tcg), KVM is detected by
 # the configure script. The container doesn't contain Xen headers so
 # Xen accelerator is not detected / selected. As result it build the
@@ -649,12 +570,20 @@ build-without-default-devices:
 build-without-default-features:
   extends: .native_build_job_template
   needs:
-    job: amd64-debian-container
+    job: amd64-fedora-container
   variables:
-    IMAGE: debian-amd64
-    CONFIGURE_ARGS: --without-default-features --disable-user
-        --target-list-exclude=arm-softmmu,i386-softmmu,mipsel-softmmu,mips64-softmmu,ppc-softmmu
-    MAKE_CHECK_ARGS: check-unit
+    IMAGE: fedora
+    CONFIGURE_ARGS:
+      --without-default-features
+      --disable-capstone
+      --disable-fdt
+      --disable-pie
+      --disable-qom-cast-debug
+      --disable-slirp
+      --disable-strip
+    TARGETS: avr-softmmu i386-softmmu mips64-softmmu s390x-softmmu sh4-softmmu
+      sparc64-softmmu hexagon-linux-user i386-linux-user s390x-linux-user
+    MAKE_CHECK_ARGS: check-unit check-qtest SPEED=slow
 
 build-libvhost-user:
   stage: build
-- 
2.27.0


