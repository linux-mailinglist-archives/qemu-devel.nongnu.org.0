Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD93F2D3F5D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 11:00:49 +0100 (CET)
Received: from localhost ([::1]:56772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmwHA-0000rJ-N9
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 05:00:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kmw6C-0005Oe-5g
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:49:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kmw67-0007Qb-0P
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 04:49:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607507360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2lozm2TPJMF/YF3/HO6u6/cGWniLFxLwGKhXgcJoS4s=;
 b=RNx7JhGS0FkUi/RGBfBn9es0XTFOUFqeOv1cibYSl4meI+K4ZmXjqJhyX6uso/rju2Amgw
 k+Irs3j48ysPveLdHmUfbGpjdTUi02Jnqqt0uG6Rr1FL0tT/QbQ2mm3s1QVECzreo97qlY
 QRYnnW9NgDODaYDpsHocgclVrGhlh8M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-4AZ_rD9DMwmm2YBr6Zvi8w-1; Wed, 09 Dec 2020 04:49:16 -0500
X-MC-Unique: 4AZ_rD9DMwmm2YBr6Zvi8w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D926107ACE3;
 Wed,  9 Dec 2020 09:49:15 +0000 (UTC)
Received: from thuth.com (ovpn-112-183.ams2.redhat.com [10.36.112.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24A615C234;
 Wed,  9 Dec 2020 09:49:13 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 09/13] gitlab-ci: Split CONFIGURE_ARGS one argument per line
 for build-disabled
Date: Wed,  9 Dec 2020 10:48:52 +0100
Message-Id: <20201209094856.17788-10-thuth@redhat.com>
In-Reply-To: <20201209094856.17788-1-thuth@redhat.com>
References: <20201209094856.17788-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

We will keep adding/removing options to our 'configure' script,
so for easier maintainability it makes sense to have CONFIGURE_ARGS
declared as one option per line. This way we can review diff easily
(or rebase/cherry-pick).

No logical change.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201108204535.2319870-6-philmd@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.yml | 80 +++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 63 insertions(+), 17 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ee31b1020f..d2cd5d9386 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -199,23 +199,69 @@ build-disabled:
   <<: *native_build_job_definition
   variables:
     IMAGE: fedora
-    CONFIGURE_ARGS: --disable-attr --disable-avx2 --disable-bochs
-      --disable-brlapi --disable-bzip2 --disable-cap-ng --disable-capstone
-      --disable-cloop --disable-coroutine-pool --disable-curl --disable-curses
-      --disable-dmg --disable-docs --disable-glusterfs --disable-gnutls
-      --disable-gtk --disable-guest-agent --disable-iconv --disable-kvm
-      --disable-libiscsi --disable-libpmem --disable-libssh --disable-libusb
-      --disable-libxml2 --disable-linux-aio --disable-live-block-migration
-      --disable-lzo --disable-malloc-trim --disable-mpath --disable-nettle
-      --disable-numa --disable-parallels --disable-pie --disable-qcow1
-      --disable-qed --disable-qom-cast-debug --disable-rbd --disable-rdma
-      --disable-replication --disable-sdl --disable-seccomp --disable-sheepdog
-      --disable-slirp --disable-smartcard --disable-snappy --disable-spice
-      --disable-strip --disable-tpm --disable-usb-redir --disable-vdi
-      --disable-vhost-crypto --disable-vhost-net --disable-vhost-scsi
-      --disable-vhost-user --disable-vhost-vdpa --disable-vhost-vsock
-      --disable-virglrenderer --disable-vnc --disable-vte --disable-vvfat
-      --disable-xen --disable-zstd
+    CONFIGURE_ARGS:
+      --disable-attr
+      --disable-avx2
+      --disable-bochs
+      --disable-brlapi
+      --disable-bzip2
+      --disable-cap-ng
+      --disable-capstone
+      --disable-cloop
+      --disable-coroutine-pool
+      --disable-curl
+      --disable-curses
+      --disable-dmg
+      --disable-docs
+      --disable-glusterfs
+      --disable-gnutls
+      --disable-gtk
+      --disable-guest-agent
+      --disable-iconv
+      --disable-kvm
+      --disable-libiscsi
+      --disable-libpmem
+      --disable-libssh
+      --disable-libusb
+      --disable-libxml2
+      --disable-linux-aio
+      --disable-live-block-migration
+      --disable-lzo
+      --disable-malloc-trim
+      --disable-mpath
+      --disable-nettle
+      --disable-numa
+      --disable-parallels
+      --disable-pie
+      --disable-qcow1
+      --disable-qed
+      --disable-qom-cast-debug
+      --disable-rbd
+      --disable-rdma
+      --disable-replication
+      --disable-sdl
+      --disable-seccomp
+      --disable-sheepdog
+      --disable-slirp
+      --disable-smartcard
+      --disable-snappy
+      --disable-spice
+      --disable-strip
+      --disable-tpm
+      --disable-usb-redir
+      --disable-vdi
+      --disable-vhost-crypto
+      --disable-vhost-net
+      --disable-vhost-scsi
+      --disable-vhost-user
+      --disable-vhost-vdpa
+      --disable-vhost-vsock
+      --disable-virglrenderer
+      --disable-vnc
+      --disable-vte
+      --disable-vvfat
+      --disable-xen
+      --disable-zstd
     TARGETS: arm-softmmu i386-softmmu ppc64-softmmu mips64-softmmu
       s390x-softmmu i386-linux-user
     MAKE_CHECK_ARGS: check-qtest SPEED=slow
-- 
2.18.4


